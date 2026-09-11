#!/usr/bin/env python3
"""One-click local launcher for the HsH Conversation Viewer.

Serves the repository root on an automatically selected loopback port and opens
CONVERSATION_VIEWER/ in the default browser. The HTTP server exists only to give
the static viewer a normal origin; source files are not modified.
"""
from __future__ import annotations

import contextlib
import http.server
import os
import socketserver
import sys
import threading
import time
import webbrowser
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
VIEWER_PATH = "/CONVERSATION_VIEWER/"
HOST = "127.0.0.1"


class QuietHandler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, fmt: str, *args: object) -> None:
        # Keep the one-click launcher quiet except for startup/errors.
        return


def main() -> int:
    if not (REPO_ROOT / "CONVERSATION_VIEWER" / "index.html").is_file():
        print("Could not locate CONVERSATION_VIEWER/index.html relative to this launcher.", file=sys.stderr)
        return 2

    os.chdir(REPO_ROOT)

    with socketserver.ThreadingTCPServer((HOST, 0), QuietHandler) as server:
        server.daemon_threads = True
        port = server.server_address[1]
        url = f"http://{HOST}:{port}{VIEWER_PATH}"
        print(f"HsH Conversation Viewer: {url}")
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
