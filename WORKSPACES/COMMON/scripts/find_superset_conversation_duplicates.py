#!/usr/bin/env python3
"""Find raw ChatGPT conversation exports that are strict historical subsets of newer copies.

A file is a SUPERFLUOUS-PREFIX-CANDIDATE only when:
- both exports identify the same conversation_id (or, when unavailable, same title + compatible IDs),
- every message ID in the smaller export exists in the larger export,
- the normalized authored/content payload for each shared message ID is identical,
- the larger export contains at least one additional message.

This script NEVER deletes or moves files. It emits a review plan. Point-of-use/index/tag checks
remain mandatory before quarantine, per Nathan's standing instruction.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import defaultdict
from pathlib import Path
from typing import Any


def discover(root: Path) -> list[Path]:
    return sorted(p for p in root.rglob("*.json") if p.is_file() and "raw" in p.name.lower())


def unwrap(obj: Any) -> dict[str, Any] | None:
    if isinstance(obj, dict) and isinstance(obj.get("mapping"), dict):
        return obj
    if isinstance(obj, list):
        convs = [x for x in obj if isinstance(x, dict) and isinstance(x.get("mapping"), dict)]
        if len(convs) == 1:
            return convs[0]
    return None


def canonical_message(msg: dict[str, Any]) -> str:
    author = msg.get("author") or {}
    content = msg.get("content") or {}
    obj = {
        "role": author.get("role"),
        "author_name": author.get("name"),
        "content_type": content.get("content_type"),
        "parts": content.get("parts"),
        "recipient": msg.get("recipient"),
        "create_time": msg.get("create_time"),
    }
    raw = json.dumps(obj, ensure_ascii=False, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(raw.encode("utf-8")).hexdigest()


def parse(path: Path) -> dict[str, Any] | None:
    try:
        obj = unwrap(json.loads(path.read_text(encoding="utf-8")))
    except Exception:
        return None
    if not obj:
        return None
    mapping = obj.get("mapping") or {}
    msgs: dict[str, str] = {}
    times = []
    for node_id, node in mapping.items():
        msg = (node or {}).get("message")
        if not isinstance(msg, dict):
            continue
        mid = msg.get("id") or node_id
        msgs[str(mid)] = canonical_message(msg)
        ct = msg.get("create_time")
        if isinstance(ct, (int, float)):
            times.append(float(ct))
    return {
        "path": str(path),
        "conversation_id": obj.get("conversation_id"),
        "title": obj.get("title") or path.stem,
        "create_time": obj.get("create_time"),
        "update_time": obj.get("update_time"),
        "message_count": len(msgs),
        "message_hashes": msgs,
        "last_message_time": max(times) if times else None,
        "size": path.stat().st_size,
    }


def same_family(a: dict[str, Any], b: dict[str, Any]) -> bool:
    ca, cb = a.get("conversation_id"), b.get("conversation_id")
    if ca and cb:
        return ca == cb
    if a.get("title") != b.get("title"):
        return False
    A, B = set(a["message_hashes"]), set(b["message_hashes"])
    smaller = min(len(A), len(B))
    return smaller > 0 and len(A & B) / smaller >= 0.95


def subset_relation(small: dict[str, Any], big: dict[str, Any]) -> tuple[bool, str]:
    S, B = small["message_hashes"], big["message_hashes"]
    if len(S) >= len(B):
        return False, "not-smaller"
    missing = set(S) - set(B)
    if missing:
        return False, f"missing-message-ids:{len(missing)}"
    changed = [mid for mid, h in S.items() if B.get(mid) != h]
    if changed:
        return False, f"shared-content-differs:{len(changed)}"
    return True, "strict-message-superset"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("roots", nargs="+", type=Path)
    ap.add_argument("--json", dest="json_out", type=Path, required=True)
    ap.add_argument("--report", type=Path, required=True)
    args = ap.parse_args()

    paths: list[Path] = []
    for root in args.roots:
        if root.exists():
            paths.extend(discover(root))
    paths = sorted(dict.fromkeys(paths))

    rows = []
    errors = []
    for p in paths:
        r = parse(p)
        if r:
            rows.append(r)
        else:
            errors.append(str(p))

    groups: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for r in rows:
        key = f"id:{r['conversation_id']}" if r.get("conversation_id") else f"title:{r['title']}"
        groups[key].append(r)

    candidates = []
    for key, group in groups.items():
        if len(group) < 2:
            continue
        for small in group:
            supersets = []
            for big in group:
                if small is big or not same_family(small, big):
                    continue
                ok, reason = subset_relation(small, big)
                if ok:
                    supersets.append(big)
            if not supersets:
                continue
            best = max(
                supersets,
                key=lambda x: (
                    x["message_count"],
                    x.get("last_message_time") or 0,
                    x.get("update_time") or 0,
                    x["size"],
                ),
            )
            candidates.append({
                "status": "SUPERFLUOUS-PREFIX-CANDIDATE",
                "smaller_path": small["path"],
                "preferred_superset_path": best["path"],
                "conversation_id": small.get("conversation_id"),
                "title": small["title"],
                "smaller_messages": small["message_count"],
                "superset_messages": best["message_count"],
                "smaller_last_message_time": small.get("last_message_time"),
                "superset_last_message_time": best.get("last_message_time"),
                "smaller_bytes": small["size"],
                "superset_bytes": best["size"],
                "content_test": "all smaller message IDs and canonical message payloads identical in preferred superset",
                "action": "REVIEW-INDEX-LINK-TAG-POINT-OF-USE-BEFORE-QUARANTINE",
            })

    dedup: dict[str, dict[str, Any]] = {}
    for c in candidates:
        p = c["smaller_path"]
        old = dedup.get(p)
        if old is None or c["superset_messages"] > old["superset_messages"]:
            dedup[p] = c
    candidates = sorted(dedup.values(), key=lambda x: (x["title"], x["smaller_messages"], x["smaller_path"]))

    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps({"candidates": candidates, "parse_errors": errors}, ensure_ascii=False, indent=2), encoding="utf-8")

    with args.report.open("w", encoding="utf-8") as f:
        f.write("# Superset Conversation Duplicate Report\n\n")
        f.write("No files were moved or deleted. Each candidate passed message-ID + content equality through the smaller export's cutoff. Navigation/index/tag checks are still required.\n\n")
        f.write(f"- raw files scanned: {len(paths)}\n")
        f.write(f"- parsed conversations: {len(rows)}\n")
        f.write(f"- superfluous-prefix candidates: {len(candidates)}\n")
        f.write(f"- parse errors: {len(errors)}\n\n")
        for c in candidates:
            f.write(f"## {c['title']}\n\n")
            f.write(f"- smaller: `{c['smaller_path']}` ({c['smaller_messages']} messages; {c['smaller_bytes']} bytes)\n")
            f.write(f"- preferred superset: `{c['preferred_superset_path']}` ({c['superset_messages']} messages; {c['superset_bytes']} bytes)\n")
            f.write(f"- conversation ID: `{c['conversation_id']}`\n")
            f.write("- status: `SUPERFLUOUS-PREFIX-CANDIDATE`\n")
            f.write("- next action: check indexes, links, tags, point-of-use, and provenance references before quarantine.\n\n")

    print(json.dumps({"files": len(paths), "parsed": len(rows), "candidates": len(candidates), "errors": len(errors)}, indent=2))


if __name__ == "__main__":
    main()
