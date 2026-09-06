#!/usr/bin/env python3
"""Build deterministic structural indexes for the H(s)H repository.

The index describes repository structure only. It does not assign theory status
or infer meaning from filenames. It can index a local checkout or consume the
JSON returned by GitHub's recursive tree API on stdin/a file.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter, defaultdict
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable


DEFAULT_ROOT = Path(".")
DEFAULT_OUTPUT_DIR = Path("indexes")
IGNORED_PARTS = {".git", "__pycache__", ".pytest_cache"}
GENERATED_PATHS = {
    "indexes/STRUCTURAL_INDEX.md",
    "indexes/index-state.json",
}


@dataclass(frozen=True)
class Entry:
    path: str
    kind: str
    size: int | None
    content_id: str | None


def utc_now() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat()


def normalized(path: Path) -> str:
    return path.as_posix().removeprefix("./")


def should_skip(path: str) -> bool:
    parts = Path(path).parts
    return any(part in IGNORED_PARTS for part in parts) or path in GENERATED_PATHS


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def local_entries(root: Path) -> tuple[list[Entry], str, bool]:
    entries: list[Entry] = []
    for path in sorted(root.rglob("*")):
        rel = normalized(path.relative_to(root))
        if should_skip(rel):
            continue
        if path.is_dir():
            entries.append(Entry(rel, "tree", None, None))
        elif path.is_file():
            entries.append(Entry(rel, "blob", path.stat().st_size, sha256_file(path)))
    digest = hashlib.sha256()
    for entry in entries:
        digest.update(json.dumps(asdict(entry), sort_keys=True).encode("utf-8"))
        digest.update(b"\n")
    return entries, digest.hexdigest(), False


def load_tree_json(source: str) -> dict[str, Any]:
    if source == "-":
        payload = json.load(sys.stdin)
    else:
        with Path(source).open("r", encoding="utf-8") as handle:
            payload = json.load(handle)
    if not isinstance(payload, dict) or not isinstance(payload.get("tree"), list):
        raise ValueError("expected a GitHub recursive-tree JSON object")
    return payload


def github_entries(payload: dict[str, Any]) -> tuple[list[Entry], str, bool]:
    entries: list[Entry] = []
    for item in payload["tree"]:
        if not isinstance(item, dict) or not isinstance(item.get("path"), str):
            continue
        path = item["path"]
        if should_skip(path):
            continue
        kind = item.get("type", "unknown")
        entries.append(
            Entry(
                path=path,
                kind=kind,
                size=item.get("size") if isinstance(item.get("size"), int) else None,
                content_id=item.get("sha") if isinstance(item.get("sha"), str) else None,
            )
        )
    entries.sort(key=lambda entry: entry.path)
    return entries, str(payload.get("sha", "unknown")), bool(payload.get("truncated", False))


def extension(path: str) -> str:
    suffix = Path(path).suffix.lower()
    return suffix or "[none]"


def top_level(path: str) -> str:
    return path.split("/", 1)[0]


def classify(path: str) -> str:
    if path.startswith("DEVELOPMENT_FULL_CONVOS/"):
        return "source-conversation-corpus"
    if path.startswith("tools/"):
        return "archive-tooling"
    if path.startswith("indexes/"):
        return "generated-catalog"
    if path in {"README.md", "ARCHITECTURE.md"}:
        return "visitor-interface"
    if path == "LICENSE":
        return "license"
    return "unclassified"


def duplicate_groups(entries: Iterable[Entry]) -> list[dict[str, Any]]:
    groups: dict[str, list[str]] = defaultdict(list)
    for entry in entries:
        if entry.kind == "blob" and entry.content_id:
            groups[entry.content_id].append(entry.path)
    return [
        {"content_id": content_id, "paths": sorted(paths)}
        for content_id, paths in sorted(groups.items())
        if len(paths) > 1
    ]


def build_state(entries: list[Entry], tree_id: str, truncated: bool, scanned_at: str) -> dict[str, Any]:
    blobs = [entry for entry in entries if entry.kind == "blob"]
    trees = [entry for entry in entries if entry.kind == "tree"]
    return {
        "schema_version": 1,
        "scan_kind": "structural",
        "scan_scope": "repository tree excluding generated index outputs and cache metadata",
        "scanned_at_utc": scanned_at,
        "tree_id": tree_id,
        "tree_response_truncated": truncated,
        "counts": {
            "files": len(blobs),
            "directories": len(trees),
            "bytes_known": sum(entry.size or 0 for entry in blobs),
        },
        "counts_by_top_level": dict(sorted(Counter(top_level(e.path) for e in blobs).items())),
        "counts_by_extension": dict(sorted(Counter(extension(e.path) for e in blobs).items())),
        "counts_by_role": dict(sorted(Counter(classify(e.path) for e in blobs).items())),
        "duplicates": duplicate_groups(blobs),
        "entries": [asdict(entry) | {"role": classify(entry.path)} for entry in entries],
        "limitations": [
            "Structural index only; filenames and paths are not theory-status judgments.",
            "Git blob SHA and local SHA-256 are both stored as content_id values but are not interchangeable.",
            "Conversation contents were not read during this structural pass.",
        ],
    }


def render_markdown(state: dict[str, Any]) -> str:
    counts = state["counts"]
    lines = [
        "# H(s)H Structural Index",
        "",
        "> Generated catalog, not primary theory material.",
        "",
        f"- Scanned: `{state['scanned_at_utc']}`",
        f"- Tree/content state: `{state['tree_id']}`",
        f"- Coverage: {counts['files']} files, {counts['directories']} directories",
        f"- GitHub tree response truncated: `{str(state['tree_response_truncated']).lower()}`",
        "",
        "## Top-level coverage",
        "",
        "| Path | Files |",
        "|---|---:|",
    ]
    for name, count in state["counts_by_top_level"].items():
        lines.append(f"| `{name}` | {count} |")
    lines.extend(["", "## File types", "", "| Extension | Files |", "|---|---:|"])
    for name, count in state["counts_by_extension"].items():
        lines.append(f"| `{name}` | {count} |")
    lines.extend(["", "## Structural roles", "", "| Role | Files |", "|---|---:|"])
    for name, count in state["counts_by_role"].items():
        lines.append(f"| `{name}` | {count} |")
    lines.extend(["", "## Duplicate-content groups", ""])
    if state["duplicates"]:
        for group in state["duplicates"]:
            lines.append(f"- `{group['content_id']}`")
            lines.extend(f"  - `{path}`" for path in group["paths"])
    else:
        lines.append("No duplicate content IDs detected.")
    lines.extend(["", "## Complete path inventory", ""])
    for entry in state["entries"]:
        if entry["kind"] == "blob":
            size = entry["size"] if entry["size"] is not None else "unknown"
            lines.append(f"- `{entry['path']}` — {size} bytes — `{entry['role']}`")
    lines.extend(["", "## Limitations", ""])
    lines.extend(f"- {item}" for item in state["limitations"])
    lines.append("")
    return "\n".join(lines)


def write_if_changed(path: Path, text: str) -> bool:
    if path.exists() and path.read_text(encoding="utf-8") == text:
        return False
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")
    return True


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=DEFAULT_ROOT)
    parser.add_argument("--github-tree-json", metavar="PATH_OR_DASH")
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT_DIR)
    parser.add_argument("--scanned-at", default=None, help="UTC ISO timestamp; defaults to current time")
    parser.add_argument("--check", action="store_true", help="validate and report without writing")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    scanned_at = args.scanned_at or utc_now()
    try:
        if args.github_tree_json:
            entries, tree_id, truncated = github_entries(load_tree_json(args.github_tree_json))
        else:
            if not args.root.is_dir():
                raise ValueError(f"root directory not found: {args.root}")
            entries, tree_id, truncated = local_entries(args.root)
        state = build_state(entries, tree_id, truncated, scanned_at)
    except (OSError, UnicodeError, json.JSONDecodeError, ValueError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2

    print(
        f"files={state['counts']['files']}; directories={state['counts']['directories']}; "
        f"duplicates={len(state['duplicates'])}; tree={tree_id}"
    )
    if args.check:
        return 0

    state_text = json.dumps(state, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    index_text = render_markdown(state)
    changed = []
    if write_if_changed(args.output_dir / "index-state.json", state_text):
        changed.append("index-state.json")
    if write_if_changed(args.output_dir / "STRUCTURAL_INDEX.md", index_text):
        changed.append("STRUCTURAL_INDEX.md")
    print("updated=" + (",".join(changed) if changed else "none"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
