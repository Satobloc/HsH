#!/usr/bin/env python3
"""Diagnose exact-path deduplication across the Viewer-declared metadata inputs.

Read-only metadata utility. It reads only the Viewer catalog, its declared date
manifests, and its declared registered-external registry. For manifest records it
replays the production resolved Viewer's existence-aware path rule: prefer a
materialized ``new_path``, otherwise a materialized ``old_path``; rename-only
``collision``/``blocked`` statuses remain Viewer-eligible when such a source exists.
It does not open raw conversation bodies or descend repository trees.
"""
from __future__ import annotations

import json
from collections import defaultdict
from pathlib import Path
from typing import Any

BLOCKED_STATUSES = {"skipped"}
SUPPORTED_SUFFIXES = {".json", ".txt"}


def load(root: Path, rel: str) -> dict[str, Any]:
    data = json.loads((root / rel).read_text(encoding="utf-8-sig"))
    if not isinstance(data, dict):
        raise ValueError(f"expected JSON object: {rel}")
    return data


def existing_canonical_path(root: Path, rec: dict[str, Any]) -> str | None:
    """Replay build_conversation_viewer_resolved.existing_canonical_path."""
    for candidate in (rec.get("new_path"), rec.get("old_path")):
        if not isinstance(candidate, str):
            continue
        normalized = candidate.replace("\\", "/")
        if Path(normalized).suffix.lower() not in SUPPORTED_SUFFIXES:
            continue
        if (root / normalized).is_file():
            return normalized
    return None


def manifest_items(root: Path, payload: dict[str, Any], corpus: str, source: str) -> list[dict[str, Any]]:
    out: list[dict[str, Any]] = []
    for index, rec in enumerate(payload.get("records", [])):
        if not isinstance(rec, dict):
            continue
        candidate = existing_canonical_path(root, rec)
        count = rec.get("message_count")
        status = str(rec.get("status") or "")
        if (candidate is None
                or not isinstance(count, int) or count <= 0
                or status in BLOCKED_STATUSES):
            continue
        out.append({
            "path": candidate,
            "corpus": corpus,
            "source": source,
            "source_kind": "manifest",
            "source_index": index,
            "status": rec.get("status"),
            "message_count": count,
            "resolved_from": (
                "new_path" if isinstance(rec.get("new_path"), str)
                and candidate == rec.get("new_path").replace("\\", "/")
                else "old_path"
            ),
            "old_path": rec.get("old_path"),
            "new_path": rec.get("new_path"),
        })
    return out


def external_items(payload: dict[str, Any], source: str) -> list[dict[str, Any]]:
    out: list[dict[str, Any]] = []
    for index, rec in enumerate(payload.get("conversations", [])):
        if not isinstance(rec, dict):
            continue
        path = rec.get("path")
        count = rec.get("message_count")
        if not isinstance(path, str) or not isinstance(count, int) or count <= 0:
            continue
        out.append({
            "path": path.replace("\\", "/"),
            "corpus": rec.get("corpus"),
            "source": source,
            "source_kind": "registered-external",
            "source_index": index,
            "message_count": count,
        })
    return out


def diagnose(root: Path) -> dict[str, Any]:
    viewer_rel = "CONVERSATION_VIEWER/data/conversations.json"
    viewer = load(root, viewer_rel)
    inputs = viewer.get("inputs", [])
    if not isinstance(inputs, list):
        raise ValueError("Viewer inputs is not a list")

    accepted: list[dict[str, Any]] = []
    declared_total = 0
    for inp in inputs:
        if not isinstance(inp, dict) or inp.get("status") != "loaded":
            continue
        rel, corpus = inp.get("path"), inp.get("corpus")
        if not isinstance(rel, str):
            continue
        declared = inp.get("accepted_json_conversations", inp.get("accepted_conversations"))
        if isinstance(declared, int):
            declared_total += declared
        payload = load(root, rel)
        if corpus == "registered-external":
            accepted.extend(external_items(payload, rel))
        else:
            accepted.extend(manifest_items(root, payload, str(corpus), rel))

    by_path: dict[str, list[dict[str, Any]]] = defaultdict(list)
    winners: dict[str, dict[str, Any]] = {}
    for item in accepted:
        by_path[item["path"]].append(item)
        old = winners.get(item["path"])
        if old is None or item.get("corpus") == "live":
            winners[item["path"]] = item

    duplicates = []
    for path, items in sorted(by_path.items()):
        if len(items) > 1:
            duplicates.append({"path": path, "inputs": items, "winner": winners[path]})

    source_before = (viewer.get("counts") or {}).get("source_conversations_before_curation")
    return {
        "viewer": viewer_rel,
        "semantics": "production-resolved-existing-source-v1",
        "viewer_declared_accepted_total": declared_total,
        "reconstructed_accepted_total": len(accepted),
        "reconstructed_post_dedup_total": len(winners),
        "viewer_source_conversations_before_curation": source_before,
        "duplicate_paths": duplicates,
    }


def main() -> int:
    root = Path(__file__).resolve().parents[2]
    report = diagnose(root)
    print(json.dumps(report, indent=2, ensure_ascii=False, sort_keys=True))
    ok = (report["viewer_declared_accepted_total"] == report["reconstructed_accepted_total"]
          and report["reconstructed_post_dedup_total"] == report["viewer_source_conversations_before_curation"])
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
