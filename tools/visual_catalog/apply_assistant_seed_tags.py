#!/usr/bin/env python3
"""Merge assistant-reviewed context tags into generated visual-catalog suggestions.

These tags are *not* Nathan-confirmed and are not represented as pixel inspection.
They are based on filenames, paths, existing source metadata, and project context.
"""
from __future__ import annotations

import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
DERIVED = HERE / "derived"
SEEDS = HERE / "assistant_seed_tags.jsonl"
AXES = ("what", "topic", "role", "style")


def load_seeds() -> dict[tuple[str, str], dict]:
    out = {}
    if not SEEDS.exists():
        return out
    for line in SEEDS.read_text(encoding="utf-8").splitlines():
        if not line.strip():
            continue
        rec = json.loads(line)
        out[(rec["repo"], rec["path"])] = rec
    return out


def apply(item: dict, seed: dict) -> None:
    suggestions = item.setdefault("suggestions", {})
    # A context-reviewed seed is more specific than the deliberately crude
    # path parser. Replace only axes for which the seed actually supplies tags.
    for axis in AXES:
        vals = seed.get(axis) or []
        if vals:
            suggestions[axis] = list(dict.fromkeys(vals))
    suggestions["provenance"] = "assistant_context_review"
    suggestions["suggested_display"] = seed.get("display", "unreviewed")
    suggestions["basis"] = seed.get("basis", "")


def main() -> None:
    seeds = load_seeds()
    matched = 0

    review_path = DERIVED / "review_data.json"
    review_data = json.loads(review_path.read_text(encoding="utf-8"))
    for item in review_data.get("items", []):
        seed = seeds.get((item.get("repo"), item.get("path")))
        if seed:
            apply(item, seed)
            matched += 1
    review_data["assistant_seed_matches"] = matched
    review_path.write_text(json.dumps(review_data, ensure_ascii=False), encoding="utf-8")

    catalog_path = DERIVED / "visual_catalog.jsonl"
    lines = []
    for line in catalog_path.read_text(encoding="utf-8").splitlines():
        if not line.strip():
            continue
        item = json.loads(line)
        seed = seeds.get((item.get("repo"), item.get("path")))
        if seed:
            apply(item, seed)
        lines.append(json.dumps(item, ensure_ascii=False, sort_keys=True))
    catalog_path.write_text("\n".join(lines) + "\n", encoding="utf-8")

    report = {
        "seed_records": len(seeds),
        "matched_catalog_records": matched,
        "provenance": "assistant_context_review",
        "pixel_confirmed": False,
    }
    (DERIVED / "assistant_seed_report.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report))


if __name__ == "__main__":
    main()
