#!/usr/bin/env python3
"""Read-only Big Push inactivity check.

This helper reports whether the interactive heartbeat has crossed the
configured inactivity threshold. It does not edit files, claim work, or
trigger an automation. The scheduled :00 task must be separately configured.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path


def parse_iso(value: str) -> datetime:
    value = value.strip()
    if value.endswith("Z"):
        value = value[:-1] + "+00:00"
    parsed = datetime.fromisoformat(value)
    if parsed.tzinfo is None:
        raise ValueError("timestamp must include a timezone offset")
    return parsed.astimezone(timezone.utc)


def read_heartbeat(path: Path) -> datetime:
    text = path.read_text(encoding="utf-8")
    match = re.search(
        r"^\*\*Last interactive Big Push touch:\*\*\s*(\S+)",
        text,
        flags=re.MULTILINE,
    )
    if not match:
        raise ValueError(f"heartbeat timestamp not found in {path}")
    return parse_iso(match.group(1))


def read_threshold_hours(state_path: Path) -> float:
    text = state_path.read_text(encoding="utf-8")
    match = re.search(
        r"^\*\*Staleness threshold after installation:\*\*\s*(\d+(?:\.\d+)?)\s+hours",
        text,
        flags=re.MULTILINE,
    )
    if not match:
        # During the uninstalled pilot, the same threshold is stated in prose.
        match = re.search(r"staleness threshold[^\n]*?(\d+(?:\.\d+)?)\s*hours",
                          text, flags=re.IGNORECASE)
    if not match:
        raise ValueError(f"staleness threshold not found in {state_path}")
    return float(match.group(1))


def integration_status(state_path: Path) -> str:
    text = state_path.read_text(encoding="utf-8").lower()
    if "not installed" in text or "not_armed" in text:
        return "NOT_INSTALLED"
    if "installed" in text:
        return "INSTALLED"
    return "UNKNOWN"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--heartbeat", type=Path, default=Path("INTERACTIVE_HEARTBEAT.md"))
    parser.add_argument("--state", type=Path, default=Path("AUTOMATION_STATE.md"))
    parser.add_argument("--now", help="Optional ISO-8601 timestamp for deterministic testing")
    args = parser.parse_args()

    try:
        heartbeat = read_heartbeat(args.heartbeat)
        now = parse_iso(args.now) if args.now else datetime.now(timezone.utc)
        threshold = read_threshold_hours(args.state)
        age_seconds = (now - heartbeat).total_seconds()
        if age_seconds < 0:
            recommendation = "BLOCKED_CLOCK_OR_HEARTBEAT_IN_FUTURE"
            stale = False
        else:
            stale = age_seconds >= threshold * 3600
            integration = integration_status(args.state)
            if not stale:
                recommendation = "WAIT_FOR_INTERACTIVE_HEARTBEAT_TO_AGE"
            elif integration != "INSTALLED":
                recommendation = "TRIGGER_ELIGIBLE_BUT_AUTOMATION_NOT_INSTALLED"
            else:
                recommendation = "ELIGIBLE_FOR_STEWARD_RECONCILIATION"

        result = {
            "now_utc": now.isoformat(),
            "heartbeat_utc": heartbeat.isoformat(),
            "age_hours": round(age_seconds / 3600, 3),
            "threshold_hours": threshold,
            "heartbeat_stale": stale,
            "integration_status": integration_status(args.state),
            "recommendation": recommendation,
            "mutated_files": False,
            "triggered_automation": False,
        }
        print(json.dumps(result, indent=2))
        return 0
    except (OSError, ValueError) as exc:
        print(json.dumps({"error": str(exc), "recommendation": "BLOCKED"}), file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
