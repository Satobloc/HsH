#!/usr/bin/env python3
"""Fail-closed classification for the existing Mersearch bridge publisher.

A rebase is allowed only when Git explicitly reports a non-fast-forward/fetch-first
rejection AND origin/main demonstrably advanced as a descendant of the pre-push
base. Deterministic policy, size, permission, and unknown failures stop immediately.
This module is a workflow guard, not a lane-release or retry authorization.
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ANSI_ESCAPE = re.compile(r"\x1b\[[0-?]*[ -/]*[@-~]")

PERMANENT_REJECTIONS = (
    ("GH001_LARGE_FILE", re.compile(
        r"\bGH001\b|exceeds GitHub['’]s file size limit|exceeds the maximum file size",
        re.IGNORECASE,
    )),
    ("REPOSITORY_POLICY", re.compile(
        r"\bGH006\b|\bGH013\b|protected branch|repository rule violations|"
        r"pre-receive hook declined|push protection|secret scanning",
        re.IGNORECASE,
    )),
    ("PERMISSION", re.compile(
        r"permission denied|permission to .+ denied to|write access to repository not granted|"
        r"resource not accessible by integration|authentication failed|HTTP 403|403 Forbidden",
        re.IGNORECASE,
    )),
)

NON_FAST_FORWARD = (
    re.compile(r"\(non-fast-forward\)", re.IGNORECASE),
    re.compile(r"\(fetch first\)", re.IGNORECASE),
    re.compile(r"updates were rejected because the tip of your current branch is behind", re.IGNORECASE),
    re.compile(r"remote contains work that you do not have locally", re.IGNORECASE),
    re.compile(r"\bnon-fast-forward\b", re.IGNORECASE),
)


def classify_push_failure(
    output: str,
    base_before: str,
    base_after: str,
    remote_descendant: bool,
) -> str:
    """Return REBASE only for a confirmed non-fast-forward race.

    The caller must compute remote_descendant with git merge-base --is-ancestor
    base_before base_after after fetching origin/main.
    """
    clean = ANSI_ESCAPE.sub("", output or "").strip()
    if not clean:
        return "STOP_EMPTY_PUSH_LOG"

    for label, pattern in PERMANENT_REJECTIONS:
        if pattern.search(clean):
            return f"STOP_{label}"

    if not any(pattern.search(clean) for pattern in NON_FAST_FORWARD):
        return "STOP_UNCLASSIFIED_REJECTION"

    if not base_before or not base_after:
        return "STOP_MISSING_REMOTE_BASE"
    if base_before == base_after:
        return "STOP_NO_REMOTE_ADVANCE"
    if not remote_descendant:
        return "STOP_REMOTE_NOT_DESCENDANT"

    return "REBASE"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--log", required=True, type=Path)
    parser.add_argument("--base-before", required=True)
    parser.add_argument("--base-after", required=True)
    parser.add_argument("--remote-descendant", required=True, choices=("true", "false"))
    args = parser.parse_args()

    try:
        output = args.log.read_text(encoding="utf-8", errors="replace")
    except OSError:
        print("STOP_MISSING_PUSH_LOG")
        return 2

    decision = classify_push_failure(
        output,
        args.base_before,
        args.base_after,
        args.remote_descendant == "true",
    )
    print(decision)
    return 0 if decision == "REBASE" else 2


if __name__ == "__main__":
    sys.exit(main())
