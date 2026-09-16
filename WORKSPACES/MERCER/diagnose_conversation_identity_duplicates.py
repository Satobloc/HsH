#!/usr/bin/env python3
"""Report repeated raw ChatGPT conversation IDs among Viewer-resolved JSON inputs.

Read-only QA utility. Source files are never modified. The diagnostic separates
artifact/path identity from raw conversation identity and classifies repeated-ID
families conservatively. It is reporting infrastructure only; it does not suppress,
rename, delete, or disposition archive sources.
"""
from __future__ import annotations

import hashlib
import json
from collections import defaultdict
from pathlib import Path
from typing import Any

from viewer_input_semantics import reconstruct_viewer_inputs

UNORDERED_TOP_LEVEL_LISTS = {"safe_urls", "blocked_urls", "disabled_tool_ids", "context_scopes"}


def canonical_hash(obj: Any) -> str:
    raw = json.dumps(obj, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")
    return hashlib.sha256(raw).hexdigest()


def normalized_top_level(payload: dict[str, Any]) -> dict[str, Any]:
    out = dict(payload)
    for key in UNORDERED_TOP_LEVEL_LISTS:
        value = out.get(key)
        if isinstance(value, list):
            try:
                out[key] = sorted(value, key=lambda x: json.dumps(x, ensure_ascii=False, sort_keys=True))
            except TypeError:
                pass
    return out


def message_ids(payload: dict[str, Any]) -> set[str]:
    mapping = payload.get("mapping")
    if not isinstance(mapping, dict):
        return set()
    return {str(k) for k, v in mapping.items() if isinstance(v, dict) and isinstance(v.get("message"), dict)}


def compare_pair(a: dict[str, Any], b: dict[str, Any]) -> dict[str, Any]:
    pa, pb = a["payload"], b["payload"]
    mapping_a, mapping_b = pa.get("mapping"), pb.get("mapping")
    top_a = {k: v for k, v in pa.items() if k != "mapping"}
    top_b = {k: v for k, v in pb.items() if k != "mapping"}
    ids_a, ids_b = message_ids(pa), message_ids(pb)

    if a["byte_sha256"] == b["byte_sha256"]:
        classification = "exact-bytes"
    elif canonical_hash(pa) == canonical_hash(pb):
        classification = "json-semantic-exact"
    elif canonical_hash(normalized_top_level(pa)) == canonical_hash(normalized_top_level(pb)):
        classification = "top-level-order-only"
    elif canonical_hash(mapping_a) == canonical_hash(mapping_b):
        classification = "same-message-graph-top-level-metadata-diff"
    elif ids_a and ids_a < ids_b:
        classification = "message-id-prefix-or-subset-candidate"
    elif ids_b and ids_b < ids_a:
        classification = "message-id-superset-candidate"
    elif ids_a == ids_b and ids_a:
        classification = "same-message-id-set-divergent-payload"
    else:
        classification = "divergent-branch-or-unclassified"

    differing_top_level_keys = sorted(k for k in set(top_a) | set(top_b) if top_a.get(k) != top_b.get(k))
    return {
        "a": a["path"],
        "b": b["path"],
        "classification": classification,
        "byte_sha256_a": a["byte_sha256"],
        "byte_sha256_b": b["byte_sha256"],
        "canonical_json_sha256_a": canonical_hash(pa),
        "canonical_json_sha256_b": canonical_hash(pb),
        "mapping_sha256_a": canonical_hash(mapping_a),
        "mapping_sha256_b": canonical_hash(mapping_b),
        "message_ids_a": len(ids_a),
        "message_ids_b": len(ids_b),
        "shared_message_ids": len(ids_a & ids_b),
        "differing_top_level_keys": differing_top_level_keys,
    }


def main() -> int:
    root = Path(__file__).resolve().parents[2]
    reconstructed = reconstruct_viewer_inputs(root)
    records = reconstructed.get("accepted", [])
    grouped: dict[str, list[dict[str, Any]]] = defaultdict(list)
    scanned = 0
    unreadable: list[dict[str, str]] = []

    for rec in records:
        rel = rec.get("path")
        if not isinstance(rel, str) or not rel.lower().endswith(".json"):
            continue
        path = root / rel
        if not path.is_file():
            continue
        try:
            raw = path.read_bytes()
            payload = json.loads(raw.decode("utf-8-sig"))
        except Exception as exc:
            unreadable.append({"path": rel, "error": f"{type(exc).__name__}: {exc}"})
            continue
        if not isinstance(payload, dict):
            continue
        cid = payload.get("conversation_id")
        if not isinstance(cid, str) or not cid:
            continue
        scanned += 1
        grouped[cid].append({
            "path": rel,
            "byte_sha256": hashlib.sha256(raw).hexdigest(),
            "payload": payload,
            "title": payload.get("title"),
            "create_time": payload.get("create_time"),
            "update_time": payload.get("update_time"),
            "mapping_nodes": len(payload.get("mapping", {})) if isinstance(payload.get("mapping"), dict) else None,
            "message_nodes": len(message_ids(payload)),
        })

    families = []
    for cid, items in sorted(grouped.items()):
        if len(items) < 2:
            continue
        public_items = [{k: v for k, v in x.items() if k != "payload"} for x in items]
        comparisons = []
        for i in range(len(items)):
            for j in range(i + 1, len(items)):
                comparisons.append(compare_pair(items[i], items[j]))
        families.append({"conversation_id": cid, "artifacts": public_items, "pairwise": comparisons})

    report = {
        "diagnostic": "raw-conversation-identity-duplicates-v1",
        "scope": "Viewer-resolved accepted JSON inputs; read-only",
        "scanned_json_conversations_with_id": scanned,
        "repeated_conversation_id_families": len(families),
        "families": families,
        "unreadable": unreadable,
        "disposition": "none; report only",
    }
    print(json.dumps(report, indent=2, ensure_ascii=False, sort_keys=True))
    return 0 if not unreadable else 1


if __name__ == "__main__":
    raise SystemExit(main())
