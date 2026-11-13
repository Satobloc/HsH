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
BLOCKER_SUMMARY_LIMIT = 240


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


def _blocker_items(value: Any) -> list[Any]:
    if isinstance(value, list):
        return value
    return [value] if value else []


def _blocker_summary(value: Any) -> str:
    parts = [str(item).strip() for item in _blocker_items(value) if str(item).strip()]
    summary = "; ".join(parts)
    if len(summary) <= BLOCKER_SUMMARY_LIMIT:
        return summary
    return summary[: BLOCKER_SUMMARY_LIMIT - 3].rstrip() + "..."


def _triage_details(task: dict[str, Any], as_of: date) -> dict[str, Any]:
    raw_priority = str(task.get("priority", "UNCLASSIFIED")).upper()
    p_rank = PRIORITY_RANK.get(raw_priority, PRIORITY_RANK["UNCLASSIFIED"])

    due = parse_date(task.get("due_date"))
    due_bucket = 0 if due and due < as_of else 1 if due == as_of else 2 if due else 3
    days_to_due = (due - as_of).days if due else 10**6

    blockers = task.get("blockers") or []
    blocker_items = [item for item in _blocker_items(blockers) if str(item).strip()]
    blocked = bool(blockers) or str(task.get("status", "")).lower() == "blocked"
    unblocks = task.get("unblocks") or []
    unlock_count = len(unblocks) if isinstance(unblocks, list) else 0

    effort = number(task.get("effort_hours"))
    value = number(task.get("value_score"))
    low_hanging = effort is not None and 0 < effort <= 4 and value is not None and value >= 4
    value_effort = value / effort if low_hanging else 0.0

    reviewed = parse_date(task.get("last_reviewed"))
    interval = number(task.get("review_interval_days"))
    review_state = "UNKNOWN"
    if reviewed is not None and interval is not None and interval >= 0:
        review_state = "OVERDUE" if (as_of - reviewed).days > interval else "CURRENT"
    stale = review_state == "OVERDUE"
    stale_days = (as_of - reviewed).days if reviewed else -1

    title_sort = str(task.get("title", task.get("id", ""))).casefold()
    sort_key = (
        p_rank, due_bucket, days_to_due, 0 if blocked else 1,
        -unlock_count, 0 if low_hanging else 1, -value_effort,
        0 if stale else 1, -stale_days, title_sort,
    )
    sort_factors = {
        "priority_rank": p_rank,
        "due_bucket": due_bucket,
        "days_to_due": days_to_due if due else None,
        "days_to_due_sort_value": days_to_due,
        "effective_blocked": blocked,
        "blocked_rank": 0 if blocked else 1,
        "unblock_count": unlock_count,
        "unblock_rank": -unlock_count,
        "low_hanging": low_hanging,
        "low_hanging_rank": 0 if low_hanging else 1,
        "value_effort_ratio": value_effort,
        "value_effort_rank": -value_effort,
        "review_state": review_state,
        "review_stale_rank": 0 if stale else 1,
        "stale_days": stale_days if reviewed else None,
        "stale_days_rank": -stale_days,
        "title_sort": title_sort,
    }
    return {
        "priority": raw_priority if raw_priority in PRIORITY_RANK else "UNCLASSIFIED",
        "due": due,
        "reviewed": reviewed,
        "review_state": review_state,
        "effective_blocked": blocked,
        "blocker_count": len(blocker_items),
        "blocker_summary": _blocker_summary(blockers),
        "sort_key": sort_key,
        "sort_factors": sort_factors,
        "low_hanging": low_hanging,
        "stale": stale,
        "unlock_count": unlock_count,
        "due_bucket": due_bucket,
        "days_to_due": days_to_due,
        "stale_days": stale_days,
    }


def triage_key(task: dict[str, Any], as_of: date) -> tuple[Any, ...]:
    # Keep this as the single source of truth for ranking; report enrichment
    # must not alter the existing ordering.
    return _triage_details(task, as_of)["sort_key"]


def graph_summary(graph: dict[str, Any], active_candidate_count: int) -> dict[str, Any]:
    branches = graph.get("branches", [])
    return {
        "declared_branch_count": graph.get("branch_count"),
        "actual_record_count": len(branches) if isinstance(branches, list) else 0,
        "active_candidate_count": active_candidate_count,
    }


def build_report(graph: dict[str, Any], as_of: date) -> list[dict[str, Any]]:
    rows = []
    branches = graph.get("branches", [])
    for task in branches:
        status = str(task.get("status", "")).lower()
        if status not in ACTIVE_STATES:
            continue

        details = _triage_details(task, as_of)
        due = details["due"]
        reviewed = details["reviewed"]
        reasons = []
        if due and due < as_of:
            reasons.append(f"overdue by {(as_of - due).days} day(s)")
        elif due == as_of:
            reasons.append("due today")
        if details["effective_blocked"]:
            if details["blocker_count"]:
                reasons.append(f"effectively blocked by {details['blocker_count']} blocker(s)")
            elif status == "blocked":
                reasons.append("status is blocked; blocker details absent")
            else:
                reasons.append("effective blocked state has empty or malformed blocker details")
        if task.get("unblocks"):
            reasons.append(f"unblocks {len(task['unblocks'])} item(s)")
        if details["low_hanging"]:
            reasons.append("explicit low-hanging candidate")
        if details["review_state"] == "OVERDUE":
            reasons.append("review overdue")
        elif details["review_state"] == "UNKNOWN":
            reasons.append("review state unknown")

        rows.append({
            "id": task.get("id"),
            "title": task.get("title"),
            "kind": task.get("kind"),
            "parent": task.get("parent"),
            "children": task.get("children"),
            "status": status,
            "priority": details["priority"],
            "owner_instance": task.get("owner_instance"),
            "due_date": due.isoformat() if due else None,
            "last_reviewed": reviewed.isoformat() if reviewed else None,
            "review_state": details["review_state"],
            "effective_blocked": details["effective_blocked"],
            "blocker_count": details["blocker_count"],
            "blocker_summary": details["blocker_summary"],
            "sort_factors": details["sort_factors"],
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
        {"id": "blocked", "title": "Blocked active", "status": "active", "priority": "P0",
         "blockers": ["reader route unavailable"], "kind": "control_plane"},
    ]}
    rows = build_report(sample, date(2026, 11, 5))
    assert [row["id"] for row in rows] == ["blocked", "urgent", "low", "unknown"]
    assert "overdue by 1 day(s)" in rows[1]["review_reasons"]
    assert "explicit low-hanging candidate" in rows[2]["review_reasons"]
    assert rows[0]["effective_blocked"] is True
    assert rows[0]["blocker_count"] == 1
    assert rows[0]["kind"] == "control_plane"
    assert rows[0]["sort_factors"]["blocked_rank"] == 0
    assert rows[-1]["review_state"] == "UNKNOWN"
    assert graph_summary({"branch_count": 16, "branches": sample["branches"]}, 4) == {
        "declared_branch_count": 16, "actual_record_count": 4, "active_candidate_count": 4
    }
    print("SELF-TEST PASS: priority order preserved; blocker, context, review-state and graph-count fields surfaced.")


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
    all_rows = build_report(graph, args.as_of)
    rows = all_rows[:max(0, args.limit)]
    summary = graph_summary(graph, len(all_rows))
    if args.json:
        print(json.dumps({"as_of": args.as_of.isoformat(), "graph_counts": summary, "items": rows}, indent=2))
    else:
        print(f"Task upkeep candidates as of {args.as_of.isoformat()}")
        print(
            "Graph counts: "
            f"declared={summary['declared_branch_count']} "
            f"actual={summary['actual_record_count']} "
            f"active/candidate={summary['active_candidate_count']}"
        )
        for index, row in enumerate(rows, start=1):
            owner = row["owner_instance"] or "OWNER UNSET"
            reason = "; ".join(row["review_reasons"]) or "no explicit trigger metadata"
            gaps = f"; metadata gaps: {', '.join(row['metadata_gaps'])}" if row["metadata_gaps"] else ""
            print(f"{index:>2}. [{row['priority']}] {row['status']:<14} {row['title']} ({owner})")
            print(f"    {reason}{gaps}")
            print(
                f"    blocked={row['effective_blocked']} "
                f"blockers={row['blocker_count']} "
                f"review={row['review_state']} "
                f"kind={row['kind'] or 'UNSET'}"
            )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
