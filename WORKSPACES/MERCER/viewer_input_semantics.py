#!/usr/bin/env python3
"""Shared read-only reconstruction of production Conversation Viewer input semantics.

This module is infrastructure QA only. It reads Viewer-declared metadata inputs and
checks source-file existence for manifest path resolution; it never parses raw
conversation bodies, changes source files, or infers theory/source authority.
"""
from __future__ import annotations

from collections import defaultdict
from pathlib import Path
from typing import Any, Callable

SUPPORTED_SUFFIXES = {".json", ".txt"}
BLOCKED_VIEWER_STATUSES = {"skipped"}


def existing_canonical_path(root: Path, rec: dict[str, Any]) -> tuple[str | None, str | None]:
    """Replay build_conversation_viewer_resolved existing-source precedence."""
    for key in ("new_path", "old_path"):
        candidate = rec.get(key)
        if not isinstance(candidate, str):
            continue
        normalized = candidate.replace("\\", "/")
        if Path(normalized).suffix.lower() not in SUPPORTED_SUFFIXES:
            continue
        if (root / normalized).is_file():
            return normalized, key
    return None, None


def manifest_items(root: Path, payload: dict[str, Any], corpus: str, source: str) -> list[dict[str, Any]]:
    out: list[dict[str, Any]] = []
    for index, rec in enumerate(payload.get("records", [])):
        if not isinstance(rec, dict):
            continue
        path, resolved_from = existing_canonical_path(root, rec)
        count = rec.get("message_count")
        status = str(rec.get("status") or "")
        if path is None or not isinstance(count, int) or count <= 0 or status in BLOCKED_VIEWER_STATUSES:
            continue
        out.append({
            "path": path,
            "corpus": corpus,
            "source": source,
            "source_kind": "manifest",
            "source_index": index,
            "status": rec.get("status"),
            "message_count": count,
            "resolved_from": resolved_from,
            "old_path": rec.get("old_path"),
            "new_path": rec.get("new_path"),
            "manifest_record": rec,
        })
    return out


def external_items(payload: dict[str, Any], source: str) -> list[dict[str, Any]]:
    out: list[dict[str, Any]] = []
    for index, rec in enumerate(payload.get("conversations", [])):
        if not isinstance(rec, dict):
            continue
        path, count = rec.get("path"), rec.get("message_count")
        if not isinstance(path, str) or not isinstance(count, int) or count <= 0:
            continue
        out.append({
            "path": path.replace("\\", "/"),
            "corpus": rec.get("corpus"),
            "source": source,
            "source_kind": "registered-external",
            "source_index": index,
            "message_count": count,
            "external_record": rec,
        })
    return out


def reconstruct(
    root: Path,
    viewer: dict[str, Any],
    load_payload: Callable[[str], dict[str, Any]],
) -> dict[str, Any]:
    """Reconstruct accepted inputs, exact-path dedup, and winner provenance.

    Input order is Viewer-declared order. Exact-path precedence matches the builder:
    first record wins unless a later record has corpus ``live``.
    """
    inputs = viewer.get("inputs", [])
    if not isinstance(inputs, list):
        raise ValueError("Viewer inputs is not a list")

    accepted: list[dict[str, Any]] = []
    declared_parts: list[dict[str, Any]] = []
    missing_declared_acceptance: list[str | None] = []
    for inp in inputs:
        if not isinstance(inp, dict) or inp.get("status") not in {None, "loaded"}:
            continue
        rel, corpus = inp.get("path"), inp.get("corpus")
        if not isinstance(rel, str):
            continue
        declared = inp.get("accepted_json_conversations", inp.get("accepted_conversations"))
        if isinstance(declared, int):
            declared_parts.append({"path": rel, "corpus": corpus, "accepted": declared})
        else:
            missing_declared_acceptance.append(rel)
        payload = load_payload(rel)
        if corpus == "registered-external":
            accepted.extend(external_items(payload, rel))
        else:
            accepted.extend(manifest_items(root, payload, str(corpus), rel))

    by_path: dict[str, list[dict[str, Any]]] = defaultdict(list)
    winners: dict[str, dict[str, Any]] = {}
    for item in accepted:
        path = item["path"]
        by_path[path].append(item)
        old = winners.get(path)
        if old is None or item.get("corpus") == "live":
            winners[path] = item

    duplicates = [
        {"path": path, "inputs": items, "winner": winners[path]}
        for path, items in sorted(by_path.items()) if len(items) > 1
    ]
    return {
        "semantics": "production-resolved-existing-source-v1",
        "declared_parts": declared_parts,
        "missing_declared_acceptance": missing_declared_acceptance,
        "declared_accepted_total": sum(x["accepted"] for x in declared_parts),
        "reconstructed_accepted_total": len(accepted),
        "post_dedup_total": len(winners),
        "accepted_items": accepted,
        "winners": winners,
        "duplicate_paths": duplicates,
    }
