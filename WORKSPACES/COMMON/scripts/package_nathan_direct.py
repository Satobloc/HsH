#!/usr/bin/env python3
"""Package the layered autotag stream into durable Nathan Direct shards.

Input is the full `archive_layered_autotags.jsonl` emitted by
`layered_autotag_nathan.py`. That stream contains both speakers so adjacency
pointers can be retained while only raw `role=user` messages are packaged as
Nathan-authored records.

This is a provenance/package layer, not a theory or curation layer.
"""

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path
from typing import Any


def read_jsonl(path: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    with path.open("r", encoding="utf-8") as f:
        for n, line in enumerate(f, 1):
            line = line.strip()
            if not line:
                continue
            try:
                rows.append(json.loads(line))
            except Exception as exc:
                raise RuntimeError(f"{path}:{n}: {exc}") from exc
    return rows


def year_for(ts: Any) -> str:
    if not isinstance(ts, (int, float)):
        return "unknown-date"
    try:
        return str(datetime.fromtimestamp(ts, tz=timezone.utc).year)
    except Exception:
        return "unknown-date"


def stable_key(r: dict[str, Any]) -> tuple[str, str]:
    conv = str(r.get("conversation_id") or "NO-CONVERSATION-ID")
    msg = str(r.get("message_id") or "NO-MESSAGE-ID")
    return conv, msg


def merge_lists(records: list[dict[str, Any]], key: str) -> list[Any]:
    out: list[Any] = []
    seen: set[str] = set()
    for r in records:
        vals = r.get(key) or []
        if not isinstance(vals, list):
            vals = [vals]
        for v in vals:
            marker = json.dumps(v, sort_keys=True, ensure_ascii=False)
            if marker not in seen:
                seen.add(marker)
                out.append(v)
    return out


def add_neighbor_pointers(rows: list[dict[str, Any]]) -> None:
    groups: dict[tuple[str, str], list[dict[str, Any]]] = defaultdict(list)
    for r in rows:
        groups[(str(r.get("source_path") or ""), str(r.get("conversation_id") or ""))].append(r)
    for group in groups.values():
        group.sort(key=lambda r: ((r.get("create_time") is None), r.get("create_time") or 0, str(r.get("message_id") or "")))
        for i, r in enumerate(group):
            prev = group[i - 1] if i else None
            nxt = group[i + 1] if i + 1 < len(group) else None
            r["_previous_raw_message"] = None if prev is None else {
                "message_id": prev.get("message_id"),
                "role": prev.get("role"),
                "create_time": prev.get("create_time"),
                "source_path": prev.get("source_path"),
            }
            r["_next_raw_message"] = None if nxt is None else {
                "message_id": nxt.get("message_id"),
                "role": nxt.get("role"),
                "create_time": nxt.get("create_time"),
                "source_path": nxt.get("source_path"),
            }


def package(rows: list[dict[str, Any]]) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    add_neighbor_pointers(rows)
    users = [r for r in rows if r.get("role") == "user"]
    grouped: dict[tuple[str, str], list[dict[str, Any]]] = defaultdict(list)
    for r in users:
        grouped[stable_key(r)].append(r)

    packaged: list[dict[str, Any]] = []
    duplicate_records = 0
    inherited_cases = 0
    missing_ids = 0

    for key, copies in grouped.items():
        copies.sort(key=lambda r: (str(r.get("source_path") or ""), r.get("create_time") or 0))
        canonical = copies[0]
        if len(copies) > 1:
            duplicate_records += len(copies) - 1

        source_paths: list[str] = []
        for r in copies:
            p = r.get("source_path")
            if p and p not in source_paths:
                source_paths.append(p)
            for p2 in r.get("exact_duplicate_paths") or []:
                if p2 and p2 not in source_paths:
                    source_paths.append(p2)

        msg_tags = merge_lists(copies, "message_tags")
        adj_tags = merge_lists(copies, "adjacency_tags")
        conv_tags = merge_lists(copies, "conversation_tags")
        discourse_tags = merge_lists(copies, "discourse_tags")
        layers = merge_lists(copies, "relevance_layers")
        msg_topics = {str(t).removeprefix("MSG:") for t in msg_tags}
        inherited_tags = sorted({str(t).removeprefix("ADJ:") for t in adj_tags} - msg_topics)
        context_dependent = bool(inherited_tags)
        if context_dependent:
            inherited_cases += 1

        if key[0] == "NO-CONVERSATION-ID" or key[1] == "NO-MESSAGE-ID":
            missing_ids += 1

        prev_ptrs = []
        next_ptrs = []
        for r in copies:
            if r.get("_previous_raw_message") and r["_previous_raw_message"] not in prev_ptrs:
                prev_ptrs.append(r["_previous_raw_message"])
            if r.get("_next_raw_message") and r["_next_raw_message"] not in next_ptrs:
                next_ptrs.append(r["_next_raw_message"])

        packaged.append({
            "record_type": "NATHAN_DIRECT_RAW_USER_MESSAGE",
            "authorship": "RAW USER MESSAGE",
            "author_role": "user",
            "conversation_id": canonical.get("conversation_id"),
            "conversation_title": canonical.get("title"),
            "message_id": canonical.get("message_id"),
            "create_time": canonical.get("create_time"),
            "recipient": canonical.get("recipient"),
            "text": canonical.get("text", ""),
            "canonical_source_path": canonical.get("source_path"),
            "all_source_paths": source_paths,
            "source_sha256_values": sorted({str(r.get("source_sha256")) for r in copies if r.get("source_sha256")}),
            "archive_copy_count": len(copies),
            "conversation_tags": conv_tags,
            "adjacency_tags": adj_tags,
            "message_tags": msg_tags,
            "discourse_tags": discourse_tags,
            "relevance_layers": layers,
            "retrieval_score_max": max(float(r.get("retrieval_score") or 0) for r in copies),
            "winnow_buckets": sorted({str(r.get("winnow_bucket")) for r in copies if r.get("winnow_bucket")}),
            "structural_index_present_values": sorted({str(r.get("structural_index_present")) for r in copies}),
            "context_dependent_inherited_tag": context_dependent,
            "inherited_topic_tags": inherited_tags,
            "previous_raw_message_pointers": prev_ptrs,
            "next_raw_message_pointers": next_ptrs,
            "full_conversation_pointers": source_paths,
            "AUTO_TAG_ONLY": True,
            "NOT_VERIFIED_COMPENDIUM_ENTRY": True,
            "NO_THEORY_AUTHORITY": True,
        })

    packaged.sort(key=lambda r: ((r.get("create_time") is None), r.get("create_time") or 0, str(r.get("conversation_id") or ""), str(r.get("message_id") or "")))
    stats = {
        "input_records": len(rows),
        "input_user_records": len(users),
        "packaged_unique_user_messages": len(packaged),
        "archive_duplicate_user_records_collapsed": duplicate_records,
        "context_dependent_inherited_tag_records": inherited_cases,
        "records_missing_conversation_or_message_id": missing_ids,
    }
    return packaged, stats


def write_outputs(packaged: list[dict[str, Any]], stats: dict[str, Any], outdir: Path) -> None:
    outdir.mkdir(parents=True, exist_ok=True)
    shards: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for r in packaged:
        shards[year_for(r.get("create_time"))].append(r)

    manifest_shards = []
    for year in sorted(shards):
        path = outdir / f"nathan-direct-{year}.jsonl"
        with path.open("w", encoding="utf-8") as f:
            for r in shards[year]:
                f.write(json.dumps(r, ensure_ascii=False) + "\n")
        manifest_shards.append({"year": year, "path": path.as_posix(), "records": len(shards[year])})

    manifest = {
        "generated_by": "WORKSPACES/COMMON/scripts/package_nathan_direct.py",
        "status": "UNSORTED-BUT-TAGGED NATHAN DIRECT SUBSTRATE",
        "authority_note": "Raw user authorship is verified by source role metadata; machine tags are retrieval aids and do not confer theory authority.",
        **stats,
        "shards": manifest_shards,
    }
    (outdir / "MANIFEST.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8")

    with (outdir / "README.md").open("w", encoding="utf-8") as f:
        f.write("# Nathan Direct — unsorted tagged substrate\n\n")
        f.write("Generated from raw ChatGPT conversation metadata plus the archive-wide layered autotag stream. ")
        f.write("This surface preserves exact `role=user` text, provenance, accumulated machine tags, duplicate-path relationships, ")
        f.write("and neighboring-message pointers. It is not a curated quote collection and carries no automatic theory authority.\n\n")
        for k, v in stats.items():
            f.write(f"- {k.replace('_', ' ')}: {v}\n")
        f.write("\n## Shards\n\n")
        for item in manifest_shards:
            f.write(f"- `{Path(item['path']).name}` — {item['records']} records\n")
        f.write("\n`context_dependent_inherited_tag=true` means at least one adjacency topic tag is not directly present among the message-level topic tags. ")
        f.write("Use the raw neighboring/full-conversation pointers for contextual recovery; do not merge assistant text into Nathan wording.\n")


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("input", type=Path)
    ap.add_argument("--outdir", type=Path, required=True)
    args = ap.parse_args()
    rows = read_jsonl(args.input)
    packaged, stats = package(rows)
    write_outputs(packaged, stats, args.outdir)
    print(json.dumps(stats, indent=2))


if __name__ == "__main__":
    main()
