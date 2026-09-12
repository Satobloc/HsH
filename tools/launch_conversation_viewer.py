#!/usr/bin/env python3
"""One-click local launcher for the HsH Conversation Viewer.

The launcher serves the repository on loopback and enables an authenticated local-only
annotation API. Editable private annotations live outside the repository. Publishing
writes a stripped public projection into CONVERSATION_VIEWER/data/annotations.json.
"""
from __future__ import annotations

import contextlib
import hashlib
import hmac
import http.server
import json
import os
import secrets
import socketserver
import sys
import threading
import time
import webbrowser
from pathlib import Path
from typing import Any

REPO_ROOT = Path(__file__).resolve().parent.parent
VIEWER_PATH = "/CONVERSATION_VIEWER/"
HOST = "127.0.0.1"
PRIVATE_DIR = Path.home() / ".hsh_conversation_viewer"
PRIVATE_ANNOTATIONS = PRIVATE_DIR / "annotations.json"
PUBLIC_ANNOTATIONS = REPO_ROOT / "CONVERSATION_VIEWER" / "data" / "annotations.json"
MAX_BODY = 5 * 1024 * 1024


def empty_annotations() -> dict[str, Any]:
    return {"schema_version": 1, "conversations": {}}


def validate_annotations(payload: Any) -> dict[str, Any]:
    if not isinstance(payload, dict) or payload.get("schema_version") != 1 or not isinstance(payload.get("conversations"), dict):
        raise ValueError("expected annotation schema_version 1 with a conversations object")
    return payload


def read_json(path: Path) -> dict[str, Any]:
    if not path.exists():
        return empty_annotations()
    with path.open("r", encoding="utf-8") as handle:
        return validate_annotations(json.load(handle))


def atomic_write(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    with temporary.open("w", encoding="utf-8", newline="\n") as handle:
        json.dump(payload, handle, ensure_ascii=False, indent=2)
        handle.write("\n")
    temporary.replace(path)


def public_range(raw: dict[str, Any]) -> dict[str, Any] | None:
    start, end = raw.get("start"), raw.get("end")
    if not isinstance(start, int) or not isinstance(end, int) or start < 1 or end < start:
        return None
    visibility = raw.get("visibility") if raw.get("visibility") in {"public", "hidden"} else "public"
    audience = raw.get("audience") if raw.get("audience") in {"public", "internal"} else "public"
    if visibility == "public" and audience == "internal":
        return None
    out: dict[str, Any] = {"start": start, "end": end, "visibility": visibility}
    if audience == "public":
        for key in ("priority", "search_weight", "label", "tags", "timeline_links"):
            if raw.get(key) not in (None, "", [], 0):
                out[key] = raw[key]
    return out


def make_public_projection(payload: dict[str, Any]) -> dict[str, Any]:
    result: dict[str, Any] = {"schema_version": 1, "conversations": {}}
    for conversation_id, raw in payload.get("conversations", {}).items():
        if not isinstance(raw, dict):
            continue
        visibility = raw.get("visibility") if raw.get("visibility") in {"public", "hidden"} else "public"
        audience = raw.get("audience") if raw.get("audience") in {"public", "internal"} else "public"
        out: dict[str, Any] = {"visibility": visibility}
        if audience == "public" and visibility == "public":
            provenance = raw.get("provenance")
            if isinstance(provenance, dict):
                clean_provenance = {k: provenance[k] for k in ("class", "priority", "default_anchor") if provenance.get(k) not in (None, "", 0)}
                if clean_provenance:
                    out["provenance"] = clean_provenance
            for key in ("search_weight", "label", "tags", "timeline_links"):
                if raw.get(key) not in (None, "", [], 0):
                    out[key] = raw[key]
        public_ranges = []
        for candidate in raw.get("ranges", []) if isinstance(raw.get("ranges"), list) else []:
            if isinstance(candidate, dict):
                clean = public_range(candidate)
                if clean:
                    public_ranges.append(clean)
        if public_ranges:
            out["ranges"] = public_ranges
        if visibility == "hidden" or len(out) > 1:
            result["conversations"][str(conversation_id)] = out
    return result


class ViewerHandler(http.server.SimpleHTTPRequestHandler):
    admin_token = ""

    def log_message(self, fmt: str, *args: object) -> None:
        return

    def _authorized(self) -> bool:
        supplied = self.headers.get("X-Viewer-Admin-Token", "")
        return bool(supplied) and hmac.compare_digest(supplied, self.admin_token)

    def _send_json(self, payload: dict[str, Any], status: int = 200) -> None:
        encoded = json.dumps(payload, ensure_ascii=False).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Cache-Control", "no-store")
        self.send_header("Content-Length", str(len(encoded)))
        self.end_headers()
        self.wfile.write(encoded)

    def _reject(self, status: int, message: str) -> None:
        self._send_json({"ok": False, "error": message}, status)

    def do_GET(self) -> None:
        path = self.path.split("?", 1)[0]
        if path != "/__viewer_admin/annotations":
            return super().do_GET()
        if not self._authorized():
            return self._reject(403, "forbidden")
        source = PRIVATE_ANNOTATIONS if PRIVATE_ANNOTATIONS.exists() else PUBLIC_ANNOTATIONS
        try:
            self._send_json(read_json(source))
        except Exception as error:
            self._reject(500, str(error))

    def do_POST(self) -> None:
        path = self.path.split("?", 1)[0]
        if path not in {"/__viewer_admin/annotations", "/__viewer_admin/publish"}:
            return self._reject(404, "not found")
        if not self._authorized():
            return self._reject(403, "forbidden")
        try:
            if path == "/__viewer_admin/annotations":
                length = int(self.headers.get("Content-Length", "0") or 0)
                if length <= 0 or length > MAX_BODY:
                    return self._reject(413, "invalid annotation payload size")
                payload = validate_annotations(json.loads(self.rfile.read(length).decode("utf-8")))
                atomic_write(PRIVATE_ANNOTATIONS, payload)
                return self._send_json({"ok": True})
            source = read_json(PRIVATE_ANNOTATIONS if PRIVATE_ANNOTATIONS.exists() else PUBLIC_ANNOTATIONS)
            projection = make_public_projection(source)
            atomic_write(PUBLIC_ANNOTATIONS, projection)
            return self._send_json({"ok": True, "conversations": len(projection["conversations"]), "path": str(PUBLIC_ANNOTATIONS.relative_to(REPO_ROOT))})
        except Exception as error:
            self._reject(400, str(error))


class ViewerServer(socketserver.ThreadingTCPServer):
    allow_reuse_address = True


def main() -> int:
    if not (REPO_ROOT / "CONVERSATION_VIEWER" / "index.html").is_file():
        print("Could not locate CONVERSATION_VIEWER/index.html relative to this launcher.", file=sys.stderr)
        return 2

    os.chdir(REPO_ROOT)
    token = secrets.token_urlsafe(24)
    ViewerHandler.admin_token = token

    with ViewerServer((HOST, 0), ViewerHandler) as server:
        server.daemon_threads = True
        port = server.server_address[1]
        url = f"http://{HOST}:{port}{VIEWER_PATH}?admin=1&token={token}"
        print(f"HsH Conversation Viewer (internal annotation mode): http://{HOST}:{port}{VIEWER_PATH}")
        print(f"Private annotations: {PRIVATE_ANNOTATIONS}")
        print("Close this window to stop the local viewer server.")

        def open_browser() -> None:
            time.sleep(0.35)
            with contextlib.suppress(Exception):
                webbrowser.open(url, new=2)

        threading.Thread(target=open_browser, daemon=True).start()
        try:
            server.serve_forever(poll_interval=0.25)
        except KeyboardInterrupt:
            pass

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
