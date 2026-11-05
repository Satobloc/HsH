#!/usr/bin/env python3
"""Read-only priority triage for the HsH task branch graph.

Ranks candidates from explicit metadata. Never changes graph state, priority or ownership.
"""

from __future__ import annotations

import argparse
import json
from datetime import date
from pathlib import Path
from typing import Any

PRIORITY_RANK = {"P0": 0, "P1": 1, "P2": 2, "P3": 3, "P4": 4, "UNCLASSIFIED": 5}
ACTIVE_STATES = {"active", "blocked", "handoff_pending", "candidate"}


def parse_date(value: Any) -> date | None:
    if not isinstance(value, str) or not value.strip():
        return None
    try:
        return date.fromisoformat(value[:10])
    except ValueError:
        return None


def number(value: Any) -> float | None:
    if isinstance(value, bool) or not isinstance(value, (int, float)):
        return None
    return float(value)


def triage_key(task: dict[str, Any], as_of: date) -> tuple[Any, ...]:
    raw_priority = str(task.get("priority", "UNCLASSIFIED")).upper()
    p_rank = PRIORITY_RANK.get(raw_priority, PRIORITY_RANK["UNCLASSIFIED"])

    due = parse_date(task.get("due_date"))
    due_bucket = 0 if due and due < as_of else 1 if due == as_of else 2 if due else 3
    days_to_due = (due - as_of).days if due else 10**6

    blockers = task.get("blockers") or []
    blocked = bool(blockers) or str(task.get("status", "")).lower() == "blocked"
    unblocks = task.get("unblocks") or []
    unlock_count = len(unblocks) if isinstance(unblocks, list) else 0

    effort = number(task.get("effort_hours"))
    value = number(task.get("value_score"))
    low_hanging = effort is not None and 0 < effort <= 4 and value is not None and value >= 4
    value_effort = value / effort if low_hanging else 0.0

    reviewed = parse_date(task.get("last_reviewed"))
    interval = number(task.get("review_interval_days"))
    stale = bool(reviewed and interval is not None and interval >= 0 and (as_of - reviewed).days > interval)
    stale_days = (as_of - reviewed).days if reviewed else -1

    # Priority always outranks convenience. Other features order work only inside a class.
    return (
        p_rank, due_bucket, days_to_due, 0 if blocked else 1,
        -unlock_count, 0 if low_hanging else 1, -value_effort,
        0 if stale else 1, -stale_days,
        str(task.get("title", task.get("id", ""))).casefold(),
    )


def build_report(graph: dict[str, Any], as_of: date) -> list[dict[str, Any]]:
    rows = []
    branches = graph.get("branches", [])
    for task in branches:
        status = str(task.get("status", "")).lower()
        if status not in ACTIVE_STATES:
            continue

        raw_priority = str(task.get("priority", "UNCLASSIFIED")).upper()
        priority = raw_priority if raw_priority in PRIORITY_RANK else "UNCLASSIFIED"
        due = parse_date(task.get("due_date"))
        reviewed = parse_date(task.get("last_reviewed"))
        reasons = []
        if due and due < as_of:
            reasons.append(f"overdue by {(as_of - due).days} day(s)")
        elif due == as_of:
            reasons.append("due today")
        if task.get("unblocks"):
            reasons.append(f"unblocks {len(task['unblocks'])} item(s)")
        effort = number(task.get("effort_hours"))
        value = number(task.get("value_score"))
        if effort is not None and 0 < effort <= 4 and value is not None and value >= 4:
            reasons.append("explicit low-hanging candidate")
        interval = number(task.get("review_interval_days"))
        if reviewed and interval is not None and interval >= 0 and (as_of - reviewed).days > interval:
            reasons.append("review overdue")

        rows.append({
            "id": task.get("id"),
            "title": task.get("title"),
            "status": status,
            "priority": priority,
            "owner_instance": task.get("owner_instance"),
            "due_date": due.isoformat() if due else None,
            "last_reviewed": reviewed.isoformat() if reviewed else None,
            "review_reasons": reasons,
            "metadata_gaps": [
                field for field in ("priority", "owner_instance", "due_date", "last_reviewed")
                if not task.get(field)
            ],
        })

    by_id = {task.get("id"): task for task in branches}
    rows.sort(key=lambda row: triage_key(by_id.get(row["id"], {}), as_of))
    return rows


def self_test() -> None:
    sample = {"branches": [
        {"id": "low", "title": "Easy P3", "status": "active", "priority": "P3",
         "effort_hours": 1, "value_score": 5},
        {"id": "urgent", "title": "P1 overdue", "status": "active", "priority": "P1",
         "due_date": "2026-11-04"},
        {"id": "unknown", "title": "Unclassified", "status": "active"},
    ]}
    rows = build_report(sample, date(2026, 11, 5))
    assert [row["id"] for row in rows] == ["urgent", "low", "unknown"]
    assert "overdue by 1 day(s)" in rows[0]["review_reasons"]
    assert "explicit low-hanging candidate" in rows[1]["review_reasons"]
    print("SELF-TEST PASS: priority precedes convenience; due dates and low-hanging metadata are surfaced.")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("graph", nargs="?", type=Path, help="Path to TASK_BRANCH_GRAPH.json")
    parser.add_argument("--as-of", type=date.fromisoformat, default=date.today())
    parser.add_argument("--limit", type=int, default=25)
    parser.add_argument("--json", action="store_true", help="Emit JSON instead of a text report")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()

    if args.self_test:
        self_test()
        return 0
    if args.graph is None:
        parser.error("provide the task graph path, or use --self-test")

    graph = json.loads(args.graph.read_text(encoding="utf-8"))
    rows = build_report(graph, args.as_of)[:max(0, args.limit)]
    if args.json:
        print(json.dumps({"as_of": args.as_of.isoformat(), "items": rows}, indent=2))
    else:
        print(f"Task upkeep candidates as of {args.as_of.isoformat()}")
        for index, row in enumerate(rows, start=1):
            owner = row["owner_instance"] or "OWNER UNSET"
            reason = "; ".join(row["review_reasons"]) or "no explicit trigger metadata"
            gaps = f"; metadata gaps: {', '.join(row['metadata_gaps'])}" if row["metadata_gaps"] else ""
            print(f"{index:>2}. [{row['priority']}] {row['status']:<14} {row['title']} ({owner})")
            print(f"    {reason}{gaps}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
