#!/usr/bin/env python3
"""Build the Conversation Viewer catalog using paths that actually exist in the checkout.

The conversation-date manifests are often generated in dry-run mode. In that mode a
record may carry a proposed ``new_path`` while the file still exists only at
``old_path``. The base builder historically preferred ``new_path`` unconditionally,
which produced broken Viewer URLs for planned renames.

This wrapper keeps the manifest metadata unchanged, but replaces the base builder's
path resolver with an existence-aware resolver before running its normal entry point.
Records for which neither manifest path exists are omitted from the Viewer catalog;
they remain visible in the source manifest for separate provenance/index repair.

Viewer inclusion is based on an existing readable conversation source, not on whether
a filename-renaming dry run reported ``collision`` or ``blocked``. Those statuses are
rename-workflow concerns and should not hide an otherwise valid source from the Viewer.
"""
from __future__ import annotations

from pathlib import Path
from typing import Any

import build_conversation_viewer as base


_original_normalize_record = base.normalize_record


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
    """Normalize any existing source record, ignoring rename-only blockers.

    ``collision`` and ``blocked`` refer to proposed filename changes, not to source
    validity. Preserve all other record metadata while allowing the base normalizer to
    publish the source path that ``existing_canonical_path`` resolves.
    """
    adjusted = dict(record)
    if str(adjusted.get("status") or "") in {"collision", "blocked"}:
        adjusted["status"] = "unchanged"
    return _original_normalize_record(adjusted, corpus, owner, repo, branch)


def main() -> int:
    base.canonical_path = existing_canonical_path
    base.normalize_record = existing_source_normalize_record
    return base.main()


if __name__ == "__main__":
    raise SystemExit(main())
