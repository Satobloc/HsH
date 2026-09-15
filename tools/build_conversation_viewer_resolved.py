#!/usr/bin/env python3
"""Build the Conversation Viewer catalog from the current archive checkout.

Before building, refresh the development/live date manifests recursively from the
actual conversation roots. This prevents newly uploaded conversations from being
missed merely because a previously generated manifest is stale.

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

from pathlib import Path
from typing import Any
from zoneinfo import ZoneInfo

import build_conversation_viewer as base
import date_conversation_exports as dater


_original_normalize_record = base.normalize_record
DISCOVERED_EXTERNAL = Path("CONVERSATION_VIEWER/data/discovered_external_conversations.json")


def refresh_manifest(root: Path, manifest: Path) -> None:
    """Regenerate one recursive dry-run conversation manifest from current sources."""
    if not root.is_dir():
        return
    timezone_name = dater.DEFAULT_TIMEZONE
    records = dater.build_records(root, ZoneInfo(timezone_name))
    dater.write_manifest(manifest, root, timezone_name, False, records)


def refresh_source_manifests() -> None:
    refresh_manifest(Path("DEVELOPMENT_FULL_CONVOS"), base.DEFAULT_DEV)
    refresh_manifest(Path("LIVE CONVOS"), base.DEFAULT_LIVE)


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
    refresh_source_manifests()
    base.canonical_path = existing_canonical_path
    base.normalize_record = existing_source_normalize_record
    if DISCOVERED_EXTERNAL.is_file():
        base.DEFAULT_EXTERNAL = DISCOVERED_EXTERNAL
    return base.main()


if __name__ == "__main__":
    raise SystemExit(main())
