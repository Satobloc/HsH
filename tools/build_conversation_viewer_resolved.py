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
"""
from __future__ import annotations

from pathlib import Path
from typing import Any

import build_conversation_viewer as base


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


def main() -> int:
    base.canonical_path = existing_canonical_path
    return base.main()


if __name__ == "__main__":
    raise SystemExit(main())
