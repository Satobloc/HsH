#!/usr/bin/env python3
"""Build the Conversation Viewer catalog from the current archive checkout.

Before building, refresh development/live date records recursively from the actual
conversation roots. Viewer freshness must not overwrite the canonical date-tag audit
manifests: those files are owned by the maintenance/date-tagging path and may record
whether renames were actually applied. The Viewer therefore builds from private
short-lived dry-run manifests, then labels those inputs with the canonical manifest
paths in its published catalog metadata.

The wrapper also resolves dry-run rename records against paths that actually exist.
Filename-renaming ``collision``/``blocked`` statuses do not hide a valid existing
conversation source from the Viewer; those statuses concern rename operations, not
Viewer eligibility.

When the public cross-repo discovery step has produced
``CONVERSATION_VIEWER/data/discovered_external_conversations.json``, use that merged
external catalog instead of the hand-maintained external file. The generated file
contains the manual registrations plus structurally discovered public conversations.
"""
from __future__ import annotations

import json
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Any
from zoneinfo import ZoneInfo

try:
    from . import build_conversation_viewer as base
    from . import date_conversation_exports as dater
except ImportError:  # direct script execution: python tools/build_conversation_viewer_resolved.py
    import build_conversation_viewer as base
    import date_conversation_exports as dater


_original_normalize_record = base.normalize_record
DISCOVERED_EXTERNAL = Path("CONVERSATION_VIEWER/data/discovered_external_conversations.json")
CANONICAL_DEV = Path("indexes/manifests/development-conversation-dates.json")
CANONICAL_LIVE = Path("indexes/manifests/live-conversation-dates.json")


def refresh_manifest(root: Path, manifest: Path) -> None:
    """Write one recursive dry-run manifest to the caller-selected path."""
    if not root.is_dir():
        return
    timezone_name = dater.DEFAULT_TIMEZONE
    records = dater.build_records(root, ZoneInfo(timezone_name))
    dater.write_manifest(manifest, root, timezone_name, False, records)


def refresh_source_manifests(dev_manifest: Path, live_manifest: Path) -> None:
    """Build Viewer-private source manifests without touching canonical audit files."""
    refresh_manifest(Path("DEVELOPMENT_FULL_CONVOS"), dev_manifest)
    refresh_manifest(Path("LIVE CONVOS"), live_manifest)


def relabel_private_inputs(output: Path, private_dev: Path, private_live: Path) -> None:
    """Publish stable canonical input labels instead of ephemeral temp paths."""
    if not output.is_file():
        return
    payload = json.loads(output.read_text(encoding="utf-8"))
    replacements = {
        private_dev.as_posix(): CANONICAL_DEV.as_posix(),
        private_live.as_posix(): CANONICAL_LIVE.as_posix(),
    }
    changed = False
    for item in payload.get("inputs", []):
        if not isinstance(item, dict):
            continue
        path = item.get("path")
        if path in replacements:
            item["path"] = replacements[path]
            changed = True
    if changed:
        output.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def existing_canonical_path(record: dict[str, Any]) -> str | None:
    """Return the first supported manifest path that exists in the checkout.

    Prefer ``new_path`` when it has actually materialized, otherwise fall back to
    ``old_path``. If neither supported path exists, return ``None`` so the Viewer does
    not publish a dead repository/raw URL.
    """
    candidates = (record.get("new_path"), record.get("old_path"))
    for candidate in candidates:
        if not isinstance(candidate, str):
            continue
        normalized = candidate.replace("\\", "/")
        if Path(normalized).suffix.lower() not in base.SUPPORTED_CONVERSATION_SUFFIXES:
            continue
        if Path(normalized).is_file():
            return normalized
    return None


def existing_source_normalize_record(
    record: dict[str, Any], corpus: str, owner: str, repo: str, branch: str
) -> dict[str, Any] | None:
    """Normalize any existing source record, ignoring rename-only blockers."""
    adjusted = dict(record)
    if str(adjusted.get("status") or "") in {"collision", "blocked"}:
        adjusted["status"] = "unchanged"
    return _original_normalize_record(adjusted, corpus, owner, repo, branch)


def main() -> int:
    original_dev = base.DEFAULT_DEV
    original_live = base.DEFAULT_LIVE
    base.canonical_path = existing_canonical_path
    base.normalize_record = existing_source_normalize_record
    if DISCOVERED_EXTERNAL.is_file():
        base.DEFAULT_EXTERNAL = DISCOVERED_EXTERNAL

    with TemporaryDirectory(prefix="hsh-viewer-manifests-") as temp_dir:
        private_dev = Path(temp_dir) / "development-conversation-dates.json"
        private_live = Path(temp_dir) / "live-conversation-dates.json"
        refresh_source_manifests(private_dev, private_live)
        base.DEFAULT_DEV = private_dev
        base.DEFAULT_LIVE = private_live
        try:
            result = base.main()
            relabel_private_inputs(base.DEFAULT_OUTPUT, private_dev, private_live)
            return result
        finally:
            base.DEFAULT_DEV = original_dev
            base.DEFAULT_LIVE = original_live


if __name__ == "__main__":
    raise SystemExit(main())
