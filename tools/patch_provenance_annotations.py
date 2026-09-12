#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
VIEWER = ROOT / "CONVERSATION_VIEWER" / "viewer.js"
INDEX = ROOT / "CONVERSATION_VIEWER" / "index.html"
README = ROOT / "CONVERSATION_VIEWER" / "README.md"
LAUNCHER = ROOT / "tools" / "launch_conversation_viewer.py"


def replace_once(text: str, old: str, new: str, label: str) -> str:
    if old not in text:
        if new in text:
            return text
        raise RuntimeError(f"Could not find patch target: {label}")
    return text.replace(old, new, 1)


text = VIEWER.read_text(encoding="utf-8")

text = replace_once(
    text,
    """    const scored = state.catalog.map(c => ({ c, match: catalogMatch(c, needle) })).filter(({ c, match }) => {\n      if (c.corpus === \"development\" && !showDev) return false;""",
    """    const scored = state.catalog.map(c => ({ c, match: catalogMatch(c, needle) })).filter(({ c, match }) => {\n      if (window.HSHAnnotations && !window.HSHAnnotations.isConversationVisible(c.id)) return false;\n      if (c.corpus === \"development\" && !showDev) return false;""",
    "catalog visibility",
)

text = replace_once(
    text,
    """    scored.sort((a, b) => (b.match.score - a.match.score) || String(b.c.start_local || \"\").localeCompare(String(a.c.start_local || \"\")) || a.c.path.localeCompare(b.c.path));""",
    """    scored.sort((a, b) => {\n      const provenance = needle && window.HSHAnnotations\n        ? window.HSHAnnotations.conversationSearchPriority(b.c.id) - window.HSHAnnotations.conversationSearchPriority(a.c.id)\n        : 0;\n      return provenance || (b.match.score - a.match.score) || String(b.c.start_local || \"\").localeCompare(String(a.c.start_local || \"\")) || a.c.path.localeCompare(b.c.path);\n    });""",
    "catalog provenance sort",
)

text = replace_once(
    text,
    """      const as = Math.max(...a.members.map(x => catalogMatch(x, needle).score));\n      const bs = Math.max(...b.members.map(x => catalogMatch(x, needle).score));\n      return (bs - as) || String(b.primary.start_local || \"\").localeCompare(String(a.primary.start_local || \"\"));""",
    """      const as = Math.max(...a.members.map(x => catalogMatch(x, needle).score));\n      const bs = Math.max(...b.members.map(x => catalogMatch(x, needle).score));\n      const ap = needle && window.HSHAnnotations ? Math.max(...a.members.map(x => window.HSHAnnotations.conversationSearchPriority(x.id))) : 0;\n      const bp = needle && window.HSHAnnotations ? Math.max(...b.members.map(x => window.HSHAnnotations.conversationSearchPriority(x.id))) : 0;\n      return (bp - ap) || (bs - as) || String(b.primary.start_local || \"\").localeCompare(String(a.primary.start_local || \"\"));""",
    "family provenance sort",
)

text = text.replace("loadConversation(card.dataset.id, 0, true);", "loadConversation(card.dataset.id, null, true);")
text = text.replace("loadConversation(button.dataset.versionId, 0, true);", "loadConversation(button.dataset.versionId, null, true);")
text = replace_once(text, "async function loadConversation(id, requestedIndex = 0, push = false)", "async function loadConversation(id, requestedIndex = null, push = false)", "load signature")

text = replace_once(
    text,
    """      state.raw = raw; state.messages = messages; state.rendered = 0;\n      state.activeIndex = Math.max(0, Math.min(Number(requestedIndex) || 0, messages.length - 1));""",
    """      state.raw = raw; state.messages = messages; state.rendered = 0;\n      const requested = requestedIndex == null && window.HSHAnnotations\n        ? window.HSHAnnotations.defaultAnchor(convo.id)\n        : (Number(requestedIndex) || 0);\n      state.activeIndex = Math.max(0, Math.min(requested, messages.length - 1));""",
    "default provenance anchor",
)

text = replace_once(
    text,
    """      el.threadSearch.value = \"\"; el.viewerNotice.hidden = true; el.timeline.max = String(messages.length - 1); el.timeline.value = String(state.activeIndex);\n      buildSpeakerFilters(); renderNext(Math.max(INITIAL_RENDER, state.activeIndex + 20)); applySpeakerFilters(); jumpToMessage(state.activeIndex, false);""",
    """      el.threadSearch.value = \"\"; el.viewerNotice.hidden = true; el.timeline.max = String(messages.length - 1); el.timeline.value = String(state.activeIndex);\n      document.dispatchEvent(new CustomEvent(\"viewer:conversation-loaded\", { detail: { conversation: convo, messageCount: messages.length } }));\n      buildSpeakerFilters(); renderNext(Math.max(INITIAL_RENDER, state.activeIndex + 20)); applySpeakerFilters(); jumpToMessage(state.activeIndex, false);""",
    "conversation loaded event",
)

text = replace_once(
    text,
    """    if (writeUrl) updateUrl(index, true);\n  }""",
    """    if (writeUrl) updateUrl(index, true);\n    document.dispatchEvent(new CustomEvent(\"viewer:active-message\", { detail: { index, conversationId: state.conversation?.id || null } }));\n  }""",
    "active message event",
)

text = replace_once(
    text,
    """      state.messages.forEach((m, i) => { if (m.text.toLocaleLowerCase().includes(needle)) state.searchHits.push(i); });\n      if (state.searchHits.length) { const pos = state.searchHits.findIndex(i => i >= state.activeIndex); state.searchCursor = pos >= 0 ? pos : 0; }""",
    """      state.messages.forEach((m, i) => {\n        if (m.text.toLocaleLowerCase().includes(needle) && (!window.HSHAnnotations || window.HSHAnnotations.isMessageVisible(state.conversation?.id, i))) state.searchHits.push(i);\n      });\n      if (state.searchHits.length) {\n        if (window.HSHAnnotations) state.searchHits.sort((a, b) => window.HSHAnnotations.compareMessageSearch(state.conversation?.id, a, b));\n        state.searchCursor = 0;\n      }""",
    "weighted thread search",
)

text = replace_once(
    text,
    """      const m = state.messages[index];\n      return `<div class=\"search-result ${pos === state.searchCursor ? \"current\" : \"\"}\" data-pos=\"${pos}\"><div class=\"result-meta\">#${index + 1} · ${esc(m.speaker)}</div><div class=\"snippet\">${esc(snippet(m.text, state.searchQuery))}</div></div>`;""",
    """      const m = state.messages[index];\n      const stamp = m.createTime ? new Date(m.createTime * 1000).toLocaleString([], { year:\"numeric\", month:\"short\", day:\"numeric\", hour:\"numeric\", minute:\"2-digit\", second:\"2-digit\" }) : \"timestamp unavailable\";\n      return `<div class=\"search-result ${pos === state.searchCursor ? \"current\" : \"\"}\" data-pos=\"${pos}\"><div class=\"result-meta\">#${index + 1} · ${esc(m.speaker)} · ${esc(stamp)}</div><div class=\"snippet\">${esc(snippet(m.text, state.searchQuery))}</div></div>`;""",
    "timestamped search results",
)

text = text.replace("if (next) loadConversation(next.id, 0, true);", "if (next) loadConversation(next.id, null, true);")

text = replace_once(
    text,
    """    window.addEventListener(\"popstate\", () => {\n      const p = parseParams(), id = p.get(\"c\"), m = Math.max(0, Number(p.get(\"m\") || 1) - 1);\n      if (id && id !== state.conversation?.id) loadConversation(id, m, false); else if (state.messages.length) jumpToMessage(m, false);\n    });""",
    """    window.addEventListener(\"popstate\", () => {\n      const p = parseParams(), id = p.get(\"c\"), hasM = p.has(\"m\"), m = Math.max(0, Number(p.get(\"m\") || 1) - 1);\n      if (id && id !== state.conversation?.id) loadConversation(id, hasM ? m : null, false); else if (state.messages.length && hasM) jumpToMessage(m, false);\n    });""",
    "popstate anchor behavior",
)

text = replace_once(
    text,
    """  async function boot() {\n    bindEvents();\n    try {\n      const res = await fetch(MANIFEST_URL, { cache: \"no-cache\" });""",
    """  async function boot() {\n    bindEvents();\n    try {\n      if (window.HSHAnnotations?.ready) await window.HSHAnnotations.ready;\n      const res = await fetch(MANIFEST_URL, { cache: \"no-cache\" });""",
    "await annotations",
)

text = replace_once(
    text,
    """      const data = await res.json(); state.catalog = Array.isArray(data.conversations) ? data.conversations : []; renderCatalog();\n      const p = parseParams(), id = p.get(\"c\") || state.catalog[0]?.id, m = Math.max(0, Number(p.get(\"m\") || 1) - 1);\n      if (p.get(\"q\")) el.threadSearch.value = p.get(\"q\");\n      if (id) { await loadConversation(id, m, false); if (el.threadSearch.value) searchThread(); }""",
    """      const data = await res.json(); state.catalog = Array.isArray(data.conversations) ? data.conversations : []; renderCatalog();\n      const p = parseParams(), id = p.get(\"c\") || state.catalog.find(c => !window.HSHAnnotations || window.HSHAnnotations.isConversationVisible(c.id))?.id, hasM = p.has(\"m\"), m = Math.max(0, Number(p.get(\"m\") || 1) - 1);\n      if (p.get(\"q\")) el.threadSearch.value = p.get(\"q\");\n      if (id) { await loadConversation(id, hasM ? m : null, false); if (el.threadSearch.value) searchThread(); }""",
    "boot anchor behavior",
)

VIEWER.write_text(text, encoding="utf-8")

index = INDEX.read_text(encoding="utf-8")
index = index.replace("20260912-0045", "20260912-0332")
if "annotations.css" not in index:
    index = index.replace('  <link rel="stylesheet" href="runtime-fixes.css?v=20260912-0332">', '  <link rel="stylesheet" href="runtime-fixes.css?v=20260912-0332">\n  <link rel="stylesheet" href="annotations.css?v=20260912-0332">')
if "annotations.js" not in index:
    index = index.replace('  <script src="viewer.js?v=20260912-0332"></script>', '  <script src="annotations.js?v=20260912-0332"></script>\n  <script src="viewer.js?v=20260912-0332"></script>')
INDEX.write_text(index, encoding="utf-8")

launcher = r'''#!/usr/bin/env python3
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
'''
LAUNCHER.write_text(launcher, encoding="utf-8")

readme = README.read_text(encoding="utf-8")
section = '''

## Provenance annotation mode

The one-click local launcher now opens an **internal annotation mode**. It adds conversation- and message/range-level controls for core/supporting provenance, priority/search promotion, milestones, editorial status (`superseded`, `misleading`, `counterfactual`, `not-currently-held`, `re-adopted`, etc.), timeline links, and Viewer visibility.

Private working metadata is stored outside the repository at `~/.hsh_conversation_viewer/annotations.json`. The toolbar's **Publish public projection** action writes only the public-safe projection to `CONVERSATION_VIEWER/data/annotations.json`; internal notes never enter that file.

Core provenance conversations are promoted within genuine search matches. If promoted message/range annotations exist, the conversation opens in provenance-focus mode: promoted passages and one message of surrounding context are expanded while other messages are collapsed. An explicit default anchor overrides the automatic highest-weighted anchor.

Within-conversation search results include the original message date/time and respect public visibility plus provenance promotion.

See `CONVERSATION_VIEWER/ANNOTATIONS.md` for the schema and workflow. Viewer-level hiding is curation only: it does not make a raw source private if that source remains in a public repository.
'''
if "## Provenance annotation mode" not in readme:
    readme += section
README.write_text(readme, encoding="utf-8")

print("Provenance annotation integration patch applied.")
