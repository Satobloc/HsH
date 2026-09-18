#!/usr/bin/env python3
"""Read-only classifier for extract_raw_window.py context semantics.

Reads retained extraction JSON payloads and their declared raw source conversations.
Writes only to stdout. It reconstructs each target user's chronological context window
from the raw source, then compares chronological adjacency with the conversation graph.

Categories for each adjacent pair in a reconstructed window:
  immediate_graph_local   later row records earlier row as parent
  timestamp_order_inversion earlier row records later row as parent
  same_branch_non_immediate one row is a non-immediate ancestor of the other
  cross_branch_splice     both rows resolve in mapping but neither is ancestor of the other
  unresolved              graph identity/ancestry cannot be resolved

This is provenance/semantics QA only. It does not assess message correctness or theory.
"""
from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path
from typing import Any


def text_of(msg: dict[str, Any] | None) -> str:
    c = (msg or {}).get("content") or {}
    out: list[str] = []
    for p in c.get("parts") or []:
        if isinstance(p, str):
            out.append(p)
        elif isinstance(p, dict) and isinstance(p.get("text"), str):
            out.append(p["text"])
    return "\n".join(out).strip()


def rows_from_mapping(mapping: dict[str, Any]) -> list[dict[str, Any]]:
    rows = []
    for nid, node in mapping.items():
        msg = (node or {}).get("message")
        if not isinstance(msg, dict) or not text_of(msg):
            continue
        au = msg.get("author") or {}
        rows.append({
            "node_id": nid,
            "message_id": msg.get("id") or nid,
            "parent": (node or {}).get("parent"),
            "role": au.get("role"),
            "create_time": msg.get("create_time"),
        })
    rows.sort(key=lambda r: (
        r["create_time"] is None,
        r["create_time"] or 0,
        r["node_id"],
    ))
    return rows


def is_ancestor(ancestor: str, descendant: str, mapping: dict[str, Any]) -> bool | None:
    """True/False when resolvable; None if ancestry walks outside mapping or cycles."""
    if ancestor not in mapping or descendant not in mapping:
        return None
    seen: set[str] = set()
    cur = descendant
    while cur is not None:
        if cur == ancestor:
            return True
        if cur in seen or cur not in mapping:
            return None
        seen.add(cur)
        cur = (mapping.get(cur) or {}).get("parent")
    return False


def classify_pair(a: dict[str, Any], b: dict[str, Any], mapping: dict[str, Any]) -> str:
    aid, bid = a["node_id"], b["node_id"]
    if b.get("parent") == aid:
        return "immediate_graph_local"
    if a.get("parent") == bid:
        return "timestamp_order_inversion"
    a_anc_b = is_ancestor(aid, bid, mapping)
    b_anc_a = is_ancestor(bid, aid, mapping)
    if a_anc_b is None or b_anc_a is None:
        return "unresolved"
    if a_anc_b or b_anc_a:
        return "same_branch_non_immediate"
    return "cross_branch_splice"


def classify_payload(payload_path: Path, repo_root: Path) -> dict[str, Any]:
    payload = json.loads(payload_path.read_text(encoding="utf-8"))
    req = payload.get("request") or {}
    # Match extract_raw_window.py exactly: omitted context_each_side means radius 1.
    # A classifier default of 0 would silently skip historical/defaulted extractions.
    ctx = int(req.get("context_each_side", 1))
    source_rel = req.get("source_path")
    result: dict[str, Any] = {
        "payload": payload_path.as_posix(),
        "source_path": source_rel,
        "context_each_side": ctx,
        "status": "ok",
        "target_windows": 0,
        "edge_counts": {},
        "windows_with_divergence": 0,
    }
    if ctx <= 0:
        result["status"] = "skipped_no_positive_context"
        return result
    if not isinstance(source_rel, str):
        result["status"] = "unresolved_missing_source_path"
        return result
    source_path = repo_root / source_rel
    if not source_path.exists():
        result["status"] = "unresolved_source_not_found"
        return result

    source = json.loads(source_path.read_text(encoding="utf-8"))
    mapping = source.get("mapping") or {}
    rows = rows_from_mapping(mapping)
    after = float(req.get("after_create_time", 0))
    limit = int(req.get("user_limit", 20))
    user_idxs = [
        i for i, r in enumerate(rows)
        if r["role"] == "user"
        and isinstance(r["create_time"], (int, float))
        and r["create_time"] > after
    ][:limit]

    total = Counter()
    windows = []
    divergent_windows = 0
    for i in user_idxs:
        lo, hi = max(0, i - ctx), min(len(rows), i + ctx + 1)
        window = rows[lo:hi]
        edge_counts = Counter()
        edges = []
        for a, b in zip(window, window[1:]):
            category = classify_pair(a, b, mapping)
            edge_counts[category] += 1
            total[category] += 1
            edges.append({
                "from": a["node_id"],
                "to": b["node_id"],
                "category": category,
            })
        divergent = any(k != "immediate_graph_local" for k in edge_counts)
        divergent_windows += int(divergent)
        windows.append({
            "target_user": rows[i]["node_id"],
            "edge_counts": dict(edge_counts),
            "divergent": divergent,
            "edges": edges,
        })

    result["target_windows"] = len(user_idxs)
    result["edge_counts"] = dict(total)
    result["windows_with_divergence"] = divergent_windows
    result["windows"] = windows
    return result


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument(
        "--repo-root", type=Path, default=Path("."),
        help="HsH checkout root (default: current directory)",
    )
    ap.add_argument(
        "--outputs", type=Path,
        default=Path("WORKSPACES/COMMON/extraction_outputs"),
        help="retained extraction-output directory relative to repo root",
    )
    ap.add_argument("payloads", nargs="*", help="optional explicit JSON payload paths")
    args = ap.parse_args()

    repo_root = args.repo_root.resolve()
    if args.payloads:
        payloads = [repo_root / p for p in args.payloads]
    else:
        payloads = sorted((repo_root / args.outputs).glob("*.json"))

    results = [classify_payload(p, repo_root) for p in payloads]
    aggregate = Counter()
    positive_files = 0
    resolved_positive_files = 0
    divergent_files = 0
    total_windows = 0
    divergent_windows = 0
    for r in results:
        if r["context_each_side"] > 0:
            positive_files += 1
        if r["status"] == "ok":
            resolved_positive_files += 1
            total_windows += r["target_windows"]
            divergent_windows += r["windows_with_divergence"]
            aggregate.update(r["edge_counts"])
            if r["windows_with_divergence"]:
                divergent_files += 1

    report = {
        "classifier": "Mercer extraction-context graph classifier v1",
        "mode": "read_only",
        "repo_root": repo_root.as_posix(),
        "payload_count": len(results),
        "positive_context_files": positive_files,
        "resolved_positive_context_files": resolved_positive_files,
        "files_with_divergent_windows": divergent_files,
        "target_windows": total_windows,
        "windows_with_divergence": divergent_windows,
        "edge_counts": dict(aggregate),
        "files": results,
    }
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
