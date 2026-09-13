#!/usr/bin/env python3
"""Extract a bounded provenance window from one raw ChatGPT conversation export.

This is source archaeology tooling. It does not infer authorship from style and it does not
promote material to VERIFIED. It simply exposes raw message metadata plus nearby turns so a
human/agent can inspect a manageable slice of an oversized export.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


def text_of(msg: dict[str, Any]) -> str:
    content = msg.get("content") or {}
    parts = content.get("parts") or []
    out: list[str] = []
    for part in parts:
        if isinstance(part, str):
            out.append(part)
        elif isinstance(part, dict) and isinstance(part.get("text"), str):
            out.append(part["text"])
    return "\n".join(out).strip()


def conversations(obj: Any) -> list[dict[str, Any]]:
    if isinstance(obj, dict) and isinstance(obj.get("mapping"), dict):
        return [obj]
    if isinstance(obj, list):
        return [x for x in obj if isinstance(x, dict) and isinstance(x.get("mapping"), dict)]
    return []


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("path", type=Path)
    ap.add_argument("--after", type=float, required=True, help="strict create_time lower bound")
    ap.add_argument("--max-users", type=int, default=40)
    ap.add_argument("--context", type=int, default=1, help="chronological neighboring turns each side")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()

    raw = json.loads(args.path.read_text(encoding="utf-8"))
    convs = conversations(raw)
    if not convs:
        raise SystemExit("No ChatGPT conversation mapping found")

    result: dict[str, Any] = {
        "source_path": args.path.as_posix(),
        "after": args.after,
        "max_users": args.max_users,
        "conversations": [],
    }

    for conv in convs:
        rows: list[dict[str, Any]] = []
        for node_id, node in (conv.get("mapping") or {}).items():
            msg = (node or {}).get("message")
            if not isinstance(msg, dict):
                continue
            txt = text_of(msg)
            if not txt:
                continue
            author = msg.get("author") or {}
            rows.append({
                "node_id": node_id,
                "message_id": msg.get("id") or node_id,
                "parent": (node or {}).get("parent"),
                "children": (node or {}).get("children") or [],
                "role": author.get("role"),
                "author_name": author.get("name"),
                "recipient": msg.get("recipient"),
                "create_time": msg.get("create_time"),
                "content_type": (msg.get("content") or {}).get("content_type"),
                "text": txt,
            })
        rows.sort(key=lambda r: (r["create_time"] is None, r["create_time"] or 0, r["node_id"]))
        user_ix = [i for i, r in enumerate(rows) if r["role"] == "user" and isinstance(r["create_time"], (int, float)) and r["create_time"] > args.after]
        user_ix = user_ix[: args.max_users]
        selected: set[int] = set()
        for i in user_ix:
            for j in range(max(0, i - args.context), min(len(rows), i + args.context + 1)):
                selected.add(j)
        result["conversations"].append({
            "title": conv.get("title"),
            "conversation_id": conv.get("id") or conv.get("conversation_id"),
            "raw_user_count_after": sum(1 for r in rows if r["role"] == "user" and isinstance(r["create_time"], (int, float)) and r["create_time"] > args.after),
            "selected_user_count": len(user_ix),
            "messages": [rows[i] for i in sorted(selected)],
        })

    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")


if __name__ == "__main__":
    main()
