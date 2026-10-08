#!/usr/bin/env python3
"""Local Mersearch UI + read-only search API.

Run: python tools/serve_mersearch_ui.py
     python tools/serve_mersearch_ui.py --profile public

Security:
- Always binds to loopback, never an internet-facing server.
- Research profile searches the available three local repo checkouts.
- Public profile explicitly allowlists original public SAT and selected public HsH
  documents. HSH_RESOURCES and unapproved HsH paths cannot be requested.
- Incoming queries never select filesystem roots or override exclusions.
- No CORS, cookies, user accounts, arbitrary subprocess shell, or file writes
  to the repositories. Each Mersearch scan runs under a finite time budget.
For an actual public deployment, use a hardened API/index service with the same
public allowlist rather than exposing this development server directly.
"""
from __future__ import annotations

import argparse
import copy
import http.server
import json
import os
import subprocess
import sys
import tempfile
import threading
import time
import webbrowser
from collections import OrderedDict
from pathlib import Path
from urllib.parse import urlsplit

HERE = Path(__file__).resolve().parent
REPO = HERE.parent
UI = REPO / "CONVERSATION_VIEWER" / "mersearch"
ENGINE = HERE / "search_archive_content.py"
ARCHIVES = (
    "Satobloc/SAT_THEORY_ARCHIVE_2023-25",
    "Satobloc/HsH",
    "Satobloc/HSH_RESOURCES",
)
MAX_REQUEST = 6144
MAX_QUERY = 500
MAX_OFFSET = 30000
MAX_PAGE = 60
SCAN_TIMEOUT = 100
CACHE_ENTRIES = 4
CACHE_SECONDS = 600
MAX_MANIFEST_BYTES = 45 * 1024 * 1024
ALLOWED_SORT = {"date", "origin", "title", "path", "author"}
ALLOWED_MODE = {"records", "files"}


def repo_root(home: Path, name: str) -> Path | None:
    if name == "HsH" and REPO.is_dir():
        return REPO
    for root in (home / name, home.parent / name):
        if root.is_dir() and not root.is_symlink():
            return root.resolve()
    return None


def allowed_sources(profile: str, home: Path) -> tuple[list[Path], list[str]]:
    """Never let HTTP request parameters override this server-side policy."""
    sat = repo_root(home, "SAT_THEORY_ARCHIVE_2023-25")
    hsh = repo_root(home, "HsH")
    resources = repo_root(home, "HSH_RESOURCES")
    sources: list[Path] = []
    names: list[str] = []
    if sat:
        sources.append(sat)
        names.append(ARCHIVES[0])
    if profile == "research":
        for location, name in ((hsh, ARCHIVES[1]), (resources, ARCHIVES[2])):
            if location:
                sources.append(location)
                names.append(name)
    elif hsh:
        # Explicit allowlist. Never index arbitrary HsH working files in public
        # mode just because a researcher happens to have that checkout locally.
        for relative in (
            "README.md", "BEDROCK.md", "PUBLIC_SITE", "NEW_PAPERS",
            "CONVERSATION_VIEWER/README.md",
        ):
            file = hsh / relative
            if file.exists() and not file.is_symlink():
                # The caller never supplies relative paths; all entries above
                # are constants under the known HsH repository checkout.
                sources.append(file)
        if any(p == hsh or hsh in p.parents for p in sources):
            names.append(ARCHIVES[1])
    return sources, names


class SearchService:
    def __init__(self, profile: str, home: Path) -> None:
        self.profile = profile
        self.home = home
        self.roots, self.repositories = allowed_sources(profile, home)
        self.cache: OrderedDict[tuple[str, str, str], tuple[float, dict]] = OrderedDict()
        self.lock = threading.RLock()
        self.scan_lock = threading.Lock()

    def coverage(self) -> dict:
        available = list(self.repositories)
        missing = [name for name in ARCHIVES if name not in available]
        return {
            "profile": self.profile,
            "archives_requested": list(ARCHIVES),
            "archives_searched": available,
            "missing_archives": missing,
            "coverage_status": "complete" if not missing else "partial",
            "scope_note": (
                "Public allowlist: public SAT archive and selected HsH pages. "
                "HSH_RESOURCES and non-allowlisted HsH content are excluded."
                if self.profile == "public" else
                "Research default: all three local repositories when present; "
                "quarantine, unsupported files and oversized files remain excluded."
            ),
        }

    def capabilities(self) -> dict:
        return {
            "ok": True,
            "profile": self.profile,
            "capabilities": {
                "name": "Mersearch",
                "mode": "local-read-only-api",
                "query_operators": ["AND", "OR", "NOT", "NEAR/n", "phrases", "parentheses"],
                "fields": [
                    "body", "name", "path", "math", "role", "date", "status",
                    "version", "era", "origin", "archive_date", "date_mentioned",
                    "date_confidence", "retrospective", "repo",
                ],
                "sorts": sorted(ALLOWED_SORT),
                "result_modes": sorted(ALLOWED_MODE),
                "limits": {"max_query_characters": MAX_QUERY, "page_size": MAX_PAGE},
                "archival_policy": self.coverage(),
            },
        }

    @staticmethod
    def validate(payload: object) -> tuple[str, str, str, int, int]:
        if not isinstance(payload, dict):
            raise ValueError("Expected a JSON search request.")
        expr = payload.get("expr")
        if not isinstance(expr, str) or not expr.strip() or len(expr) > MAX_QUERY:
            raise ValueError("Search query must contain 1 to 500 characters.")
        # Limit particularly expensive proximity expressions.
        import re
        for match in re.finditer(r"\bNEAR/(\d+)", expr, re.I):
            if int(match.group(1)) > 250:
                raise ValueError("NEAR distance cannot exceed 250 tokens.")
        sort = payload.get("sort", "date")
        mode = payload.get("result_mode", "records")
        if sort not in ALLOWED_SORT or mode not in ALLOWED_MODE:
            raise ValueError("Unsupported search sort or result mode.")
        offset = payload.get("offset", 0)
        limit = payload.get("limit", 20)
        if (type(offset) is not int or type(limit) is not int or offset < 0
                or offset > MAX_OFFSET or not 1 <= limit <= MAX_PAGE):
            raise ValueError("Invalid pagination parameters.")
        return expr.strip(), sort, mode, offset, limit

    def _scan(self, expr: str, sort: str, mode: str) -> dict:
        if not self.roots:
            raise RuntimeError("No searchable repositories are checked out on this computer.")
        with tempfile.TemporaryDirectory(prefix="mersearch-ui-") as folder:
            command = [
                sys.executable, str(ENGINE), *map(str, self.roots),
                "--expr", expr, "--sort", sort,
                "--result-mode", mode, "--out", folder,
                "--max-bytes", "25000000" if self.profile == "research" else "9000000",
                "--viewer-root", str(REPO),
            ]
            outcome = subprocess.run(
                command, cwd=REPO, capture_output=True, text=True,
                timeout=SCAN_TIMEOUT, check=False,
            )
            if outcome.returncode:
                print("Mersearch CLI error:", outcome.stderr[-3000:], file=sys.stderr)
                raise RuntimeError(
                    "Mersearch could not evaluate the query. Check its Boolean syntax "
                    "or try a shorter search."
                )
            filename = Path(folder) / "SEARCH_RESULTS.json"
            if not filename.is_file():
                raise RuntimeError("Search produced no machine-readable results.")
            if filename.stat().st_size > MAX_MANIFEST_BYTES:
                raise RuntimeError(
                    "This search produced more results than the preview API can hold. "
                    "Add terms, filters, or use the full Mersearch CLI."
                )
            with filename.open(encoding="utf-8") as handle:
                data = json.load(handle)
            if not isinstance(data, dict) or not isinstance(data.get("hits"), list):
                raise RuntimeError("Unexpected engine result format.")
            # Engine metadata reflects the actual input roots. The *policy*
            # adds a separately visible public allowlist declaration.
            return data

    def search(self, request: object) -> dict:
        expr, sort, mode, offset, limit = self.validate(request)
        key = (expr, sort, mode)
        now = time.monotonic()
        with self.lock:
            old = self.cache.get(key)
            if old and now - old[0] <= CACHE_SECONDS:
                self.cache.move_to_end(key)
                data = old[1]
            else:
                data = None
        if data is None:
            if not self.scan_lock.acquire(blocking=False):
                raise RuntimeError("A search is already running. Try again after it finishes.")
            try:
                data = self._scan(expr, sort, mode)
                with self.lock:
                    self.cache[key] = (time.monotonic(), data)
                    self.cache.move_to_end(key)
                    while len(self.cache) > CACHE_ENTRIES:
                        self.cache.popitem(last=False)
            finally:
                self.scan_lock.release()
        hits = data["hits"]
        total = len(hits)
        # Only the current page is copied. Never rewrite original source files.
        output = {key: value for key, value in data.items() if key not in {"hits", "facets"}}
        output.update({
            "hits": hits[offset:offset+limit],
            "pagination": {
                "total_hits": total,
                "offset": offset,
                "limit": limit,
                "returned_hits": len(hits[offset:offset+limit]),
            },
            "profile": self.profile,
            "archives_requested": list(ARCHIVES),
            "archives_searched": self.repositories,
            "missing_archives": [name for name in ARCHIVES if name not in self.repositories],
            "coverage_status": "complete" if len(self.repositories) == len(ARCHIVES) else "partial",
            "scope_note": self.coverage()["scope_note"],
            "facets_scope": "full scanned result set, not just this page",
        })
        return output


class Handler(http.server.SimpleHTTPRequestHandler):
    service: SearchService

    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(UI), **kwargs)

    def end_headers(self):
        self.send_header("X-Content-Type-Options", "nosniff")
        self.send_header("Referrer-Policy", "strict-origin-when-cross-origin")
        self.send_header("X-Frame-Options", "DENY")
        super().end_headers()

    def json_response(self, data: object, status: int=200) -> None:
        encoded = json.dumps(data, ensure_ascii=False).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Cache-Control", "no-store")
        self.send_header("Content-Length", str(len(encoded)))
        self.end_headers()
        self.wfile.write(encoded)

    def do_GET(self):
        path = urlsplit(self.path).path
        if path == "/api/capabilities":
            return self.json_response(self.service.capabilities())
        if path == "/api/coverage":
            return self.json_response({"ok": True, "coverage": self.service.coverage()})
        if path == "/api/health":
            return self.json_response({"ok": True, "profile": self.service.profile})
        if path.startswith("/api/"):
            return self.json_response({"ok": False, "error": "Unknown endpoint."}, 404)
        return super().do_GET()

    def do_POST(self):
        if urlsplit(self.path).path != "/api/search":
            return self.json_response({"ok": False, "error": "Unknown endpoint."}, 404)
        # Same-origin, local-only. Do not accept cross-origin search requests.
        origin = self.headers.get("Origin")
        if origin:
            parsed = urlsplit(origin)
            valid_host = parsed.hostname in {"127.0.0.1", "localhost"}
            valid_port = parsed.port == self.server.server_port
            if not (valid_host and valid_port and parsed.scheme == "http"):
                return self.json_response({"ok": False, "error": "Forbidden origin."}, 403)
        if self.headers.get("Content-Type", "").split(";")[0].strip() != "application/json":
            return self.json_response({"ok": False, "error": "Expected JSON."}, 415)
        try:
            length = int(self.headers.get("Content-Length", "0"))
        except ValueError:
            return self.json_response({"ok": False, "error": "Invalid content length."}, 400)
        if not 1 <= length <= MAX_REQUEST:
            return self.json_response({"ok": False, "error": "Invalid request size."}, 413)
        try:
            request = json.loads(self.rfile.read(length))
            result = self.service.search(request)
            return self.json_response(result)
        except (ValueError, json.JSONDecodeError) as exc:
            return self.json_response({"ok": False, "error": str(exc)}, 400)
        except subprocess.TimeoutExpired:
            return self.json_response({
                "ok": False, "error": "Search timed out. Try a more specific query."
            }, 504)
        except RuntimeError as exc:
            return self.json_response({"ok": False, "error": str(exc)}, 503)

    def log_message(self, fmt, *args):
        print("[Mersearch]", fmt % args, file=sys.stderr)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--profile", choices=("research", "public"), default="research")
    ap.add_argument("--archives-home", type=Path, default=REPO.parent,
                    help="Directory containing all three local repository checkouts.")
    ap.add_argument("--port", type=int, default=0,
                    help="Optional loopback port; 0 chooses an available port.")
    ap.add_argument("--no-browser", action="store_true")
    args = ap.parse_args()
    if not (UI / "index.html").is_file() or not ENGINE.is_file():
        ap.error("Could not locate Mersearch frontend and engine in this checkout.")
    service = SearchService(args.profile, args.archives_home.resolve())
    Handler.service = service
    server = http.server.ThreadingHTTPServer(("127.0.0.1", args.port), Handler)
    server.daemon_threads = True
    url = "http://127.0.0.1:" + str(server.server_port) + "/"
    print("Mersearch research interface: " + url, flush=True)
    print("Profile: "+args.profile+" | Repositories: "+", ".join(service.repositories), flush=True)
    print("This development server only accepts connections from this computer.", flush=True)
    print("Press Ctrl+C to stop.", flush=True)
    if not args.no_browser:
        threading.Timer(0.3, lambda: webbrowser.open(url, new=2)).start()
    try:
        server.serve_forever(poll_interval=0.3)
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
