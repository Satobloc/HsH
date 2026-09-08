#!/usr/bin/env python3
"""Build one chronological catalog across DEVELOPMENT_FULL_CONVOS subfolders."""

from __future__ import annotations

import argparse
import hashlib
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import quote
from zoneinfo import ZoneInfo

from date_conversation_exports import DEFAULT_ROOT, DEFAULT_TIMEZONE, build_records


DEFAULT_OUTPUT = Path("indexes/CONVERSATION_CHRONOLOGY.md")


def digest(path: Path) -> str:
    hasher = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            hasher.update(chunk)
    return hasher.hexdigest()


def title_from_path(path: Path) -> str:
    name = path.name
    parts = name.split("•", 2)
    if len(parts) == 3:
        name = parts[2]
    for suffix in (" — raw - .TXT", " — raw - .txt", " — raw.json", " — raw.txt"):
        if name.endswith(suffix):
            name = name[: -len(suffix)]
            break
    return name


def markdown_link(output: Path, source: Path, label: str) -> str:
    relative = Path("..") / source
    target = quote(relative.as_posix(), safe="/.-_")
    safe_label = label.replace("|", "\\|")
    return f"[{safe_label}]({target})"


def build_index(root: Path, output: Path, timezone_name: str) -> str:
    records = build_records(root, ZoneInfo(timezone_name))
    dated = [record for record in records if record.start_local and record.end_local]
    skipped = [record for record in records if not record.start_local]
    dated.sort(key=lambda record: (record.start_local, record.end_local, record.old_path))

    hashes: dict[str, list[str]] = defaultdict(list)
    for record in dated:
        hashes[digest(Path(record.old_path))].append(record.old_path)
    duplicate_hashes = sorted(key for key, paths in hashes.items() if len(paths) > 1)
    duplicate_labels = {key: f"D{index:02d}" for index, key in enumerate(duplicate_hashes, 1)}
    path_to_duplicate = {
        path: duplicate_labels[key]
        for key, paths in hashes.items()
        if key in duplicate_labels
        for path in paths
    }

    lines = [
        "# Development Conversation Chronology",
        "",
        "> Generated navigation across all subfolders; original files and provenance folders are preserved.",
        "",
        f"- Generated: `{datetime.now(timezone.utc).isoformat()}`",
        f"- Display timezone: `{timezone_name}`",
        f"- Dated conversation exports: **{len(dated)}**",
        f"- Skipped non-conversation or unparseable files: **{len(skipped)}**",
        f"- Exact duplicate-content groups: **{len(duplicate_hashes)}**",
        "- Sort key: first active-branch user/assistant message, then final message, then source path.",
        "",
    ]

    current_year = None
    for record in dated:
        start = datetime.fromisoformat(record.start_local)
        end = datetime.fromisoformat(record.end_local)
        if start.year != current_year:
            current_year = start.year
            lines.extend(
                [
                    f"## {current_year}",
                    "",
                    "| Start | End | Conversation | Source folder | Messages | Exact duplicate | Notes |",
                    "|---|---|---|---|---:|---|---|",
                ]
            )
        source = Path(record.old_path)
        folder = source.parent.relative_to(root).as_posix() or "."
        notes = "; ".join(record.warnings).replace("|", "\\|")
        duplicate = path_to_duplicate.get(record.old_path, "")
        lines.append(
            f"| {start:%Y-%m-%d} | {end:%Y-%m-%d} | "
            f"{markdown_link(output, source, title_from_path(source))} | "
            f"`{folder}` | {record.message_count} | {duplicate} | {notes} |"
        )
    lines.append("")

    if duplicate_hashes:
        lines.extend(["## Exact duplicate-content groups", ""])
        for key in duplicate_hashes:
            lines.append(f"### {duplicate_labels[key]}")
            lines.append("")
            for path in sorted(hashes[key]):
                source = Path(path)
                lines.append(f"- {markdown_link(output, source, source.as_posix())}")
            lines.append("")

    lines.extend(["## Skipped files", "", "These remain in place and are not assigned conversation dates.", ""])
    for record in sorted(skipped, key=lambda item: item.old_path):
        reason = "; ".join(record.warnings).replace("|", "\\|")
        source = Path(record.old_path)
        lines.append(f"- {markdown_link(output, source, source.as_posix())} — {reason}")
    lines.append("")
    return "\n".join(lines)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", nargs="?", type=Path, default=DEFAULT_ROOT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--timezone", default=DEFAULT_TIMEZONE)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    if not args.root.is_dir():
        raise SystemExit(f"directory not found: {args.root}")
    content = build_index(args.root, args.output, args.timezone)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(content, encoding="utf-8")
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
