#!/usr/bin/env python3
"""Build non-destructive Stage-2 work queues from durable Nathan Direct shards.

This script does not curate, delete, downgrade, or promote anything. It creates
work queues from already-attached discourse/provenance metadata while retaining
exact Nathan text and context pointers. Literal earliest-use inference is
intentionally excluded because the high-recall v1 topic layer is not selective
enough for historical minima without a precision pass and raw-context review.
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

QUEUE_TAGS = {
    "correction-refinement": {"CORRECTIVE", "CLARIFICATION", "SELF-CORRECTION", "REVISION", "COUNTERMANDING"},
    "definition": {"DEFINITION"},
    "methodology": {"METHODOLOGY"},
    "decision": {"DECISION"},
}


def read_rows(indir: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    for path in sorted(indir.glob("nathan-direct-*.jsonl")):
        with path.open(encoding="utf-8") as handle:
            rows.extend(json.loads(line) for line in handle if line.strip())
    rows.sort(key=lambda r: (
        (r.get("create_time") is None),
        r.get("create_time") or 0,
        str(r.get("conversation_id") or ""),
        str(r.get("message_id") or ""),
    ))
    return rows


def compact(r: dict[str, Any], queue: str, reasons: list[str]) -> dict[str, Any]:
    return {
        "queue": queue,
        "queue_reasons": reasons,
        "conversation_id": r.get("conversation_id"),
        "conversation_title": r.get("conversation_title"),
        "message_id": r.get("message_id"),
        "create_time": r.get("create_time"),
        "recipient": r.get("recipient"),
        "canonical_source_path": r.get("canonical_source_path"),
        "all_source_paths": r.get("all_source_paths"),
        "archive_copy_count": r.get("archive_copy_count"),
        "message_tags": r.get("message_tags"),
        "discourse_tags": r.get("discourse_tags"),
        "context_dependent_inherited_tag": r.get("context_dependent_inherited_tag"),
        "inherited_topic_tags": r.get("inherited_topic_tags"),
        "previous_raw_message_pointers": r.get("previous_raw_message_pointers"),
        "next_raw_message_pointers": r.get("next_raw_message_pointers"),
        "parent_raw_message_pointers": r.get("parent_raw_message_pointers"),
        "child_raw_message_pointers": r.get("child_raw_message_pointers"),
        "full_conversation_pointers": r.get("full_conversation_pointers"),
        "text": r.get("text", ""),
        "NO_THEORY_AUTHORITY": True,
        "QUEUE_ONLY_NOT_CURATED": True,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("indir", type=Path)
    parser.add_argument("--outdir", type=Path, required=True)
    args = parser.parse_args()
    args.outdir.mkdir(parents=True, exist_ok=True)

    rows = read_rows(args.indir)
    counts: dict[str, int] = {}

    for name, tags in QUEUE_TAGS.items():
        out = []
        for row in rows:
            hit = sorted(set(row.get("discourse_tags") or []) & tags)
            if hit:
                out.append(compact(row, name, [f"discourse:{tag}" for tag in hit]))
        counts[name] = len(out)
        with (args.outdir / f"{name}.jsonl").open("w", encoding="utf-8") as handle:
            for item in out:
                handle.write(json.dumps(item, ensure_ascii=False) + "\n")

    duplicates = []
    branches = []
    for row in rows:
        copies = row.get("archive_copy_count") or 1
        if copies > 1:
            duplicates.append(compact(row, "duplicate-provenance", [f"archive_copy_count:{copies}"]))
        children = row.get("child_raw_message_pointers") or []
        if len(children) > 1:
            branches.append(compact(row, "branch-context", [f"child_pointer_count:{len(children)}"]))

    counts["duplicate-provenance"] = len(duplicates)
    counts["branch-context"] = len(branches)
    for name, out in (("duplicate-provenance", duplicates), ("branch-context", branches)):
        with (args.outdir / f"{name}.jsonl").open("w", encoding="utf-8") as handle:
            for item in out:
                handle.write(json.dumps(item, ensure_ascii=False) + "\n")

    manifest = {
        "generated_by": "WORKSPACES/COMMON/scripts/build_nathan_direct_stage2_queues.py",
        "source": "indexes/nathan-direct/nathan-direct-*.jsonl",
        "source_records": len(rows),
        "purpose": "Non-destructive Stage-2 work queues only; no curation or theory authority.",
        "earliest_use_excluded": True,
        "earliest_use_exclusion_reason": "v1 topic minima are high-recall and known to generate false early candidates; precision layer plus raw-context verification required.",
        "queues": counts,
    }
    (args.outdir / "MANIFEST.json").write_text(json.dumps(manifest, indent=2, ensure_ascii=False), encoding="utf-8")
    print(json.dumps(manifest, indent=2))


if __name__ == "__main__":
    main()
