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
            # Preserve raw graph relationships; this report does not interpret their semantics.
            "parent": task.get("parent"),
            "children": task.get("children") or [],
            "blockers": task.get("blockers") or [],
            "unblocks": task.get("unblocks") or [],
            "dependencies": task.get("dependencies") or [],
        })

    by_id = {task.get("id"): task for task in branches}
    rows.sort(key=lambda row: triage_key(by_id.get(row["id"], {}), as_of))
    return rows



def child_edge_cycle_witnesses(by_id: dict[str, dict[str, Any]]) -> list[list[str]]:
    """Return deterministic directed cycle witnesses in the child-edge relation."""
    state: dict[str, int] = {}
    witnesses: dict[tuple[str, ...], list[str]] = {}

    def children_for(task_id: str) -> list[Any]:
        children = by_id[task_id].get("children") or []
        return children if isinstance(children, list) else []

    for root in sorted(by_id):
        if state.get(root, 0) != 0:
            continue

        path = [root]
        path_index = {root: 0}
        state[root] = 1
        stack = [(root, iter(children_for(root)))]

        while stack:
            task_id, children = stack[-1]
            try:
                child = next(children)
            except StopIteration:
                stack.pop()
                state[task_id] = 2
                path_index.pop(task_id, None)
                path.pop()
                continue

            if child not in by_id:
                continue

            child_state = state.get(child, 0)
            if child_state == 0:
                state[child] = 1
                path_index[child] = len(path)
                path.append(child)
                stack.append((child, iter(children_for(child))))
            elif child_state == 1:
                cycle_core = path[path_index[child]:]
                rotations = [
                    tuple(cycle_core[index:] + cycle_core[:index])
                    for index in range(len(cycle_core))
                ]
                canonical = min(rotations)
                witness = list(canonical) + [canonical[0]]
                witnesses[tuple(witness)] = witness

    return [witnesses[key] for key in sorted(witnesses)]



def audit_graph(graph: dict[str, Any]) -> dict[str, Any]:
    """Return a read-only structural audit; do not infer dependency or edge semantics."""
    branches = graph.get("branches", [])
    if not isinstance(branches, list):
        branches = []

    ids = [task.get("id") for task in branches if isinstance(task, dict) and task.get("id")]
    known = set(ids)
    by_id = {task.get("id"): task for task in branches if isinstance(task, dict) and task.get("id")}
    duplicate_ids = sorted({item for item in ids if ids.count(item) > 1})

    status_counts: dict[str, int] = {}
    roots: list[str] = []
    dangling_parents: list[dict[str, Any]] = []
    dangling_children: list[dict[str, Any]] = []
    asymmetries: list[dict[str, Any]] = []
    malformed_children: list[str] = []
    malformed_dependencies: list[str] = []
    parent_pointer_count = 0
    child_edge_count = 0
    dependency_entry_count = 0
    dependency_id_matches = 0
    dependency_free_text_or_external = 0

    for task in branches:
        if not isinstance(task, dict):
            continue
        task_id = task.get("id")
        status = str(task.get("status", "UNCLASSIFIED")).lower()
        status_counts[status] = status_counts.get(status, 0) + 1

        parent = task.get("parent")
        if parent:
            parent_pointer_count += 1
            if parent not in known:
                dangling_parents.append({"id": task_id, "parent": parent})
            elif task_id not in (by_id[parent].get("children") or []):
                asymmetries.append({
                    "kind": "parent_pointer_without_child_edge",
                    "id": task_id,
                    "parent": parent,
                })
        else:
            roots.append(task_id)

        children = task.get("children") or []
        if not isinstance(children, list):
            malformed_children.append(str(task_id))
            children = []
        for child in children:
            child_edge_count += 1
            if child not in known:
                dangling_children.append({"parent_id": task_id, "child_id": child})
            elif by_id[child].get("parent") != task_id:
                asymmetries.append({
                    "kind": "child_edge_without_matching_parent_pointer",
                    "id": child,
                    "parent": task_id,
                    "child_parent": by_id[child].get("parent"),
                })

        dependencies = task.get("dependencies") or []
        if not isinstance(dependencies, list):
            malformed_dependencies.append(str(task_id))
            continue
        for dependency in dependencies:
            dependency_entry_count += 1
            if isinstance(dependency, str) and dependency in known:
                dependency_id_matches += 1
            else:
                dependency_free_text_or_external += 1

    reachable = set(roots)
    stack = [item for item in roots if item in by_id]
    while stack:
        current = stack.pop()
        for child in by_id[current].get("children") or []:
            if child in by_id and child not in reachable:
                reachable.add(child)
                stack.append(child)

    unreachable = [item for item in ids if item not in reachable]
    cycle_witnesses = child_edge_cycle_witnesses(by_id)
    cycle_audit_complete = not duplicate_ids and not malformed_children
    declared = graph.get("branch_count")
    findings = []
    if declared != len(branches):
        findings.append({"code": "DECLARED_COUNT_MISMATCH", "declared": declared, "actual": len(branches)})
    if duplicate_ids:
        findings.append({"code": "DUPLICATE_IDS", "ids": duplicate_ids})
    if dangling_parents:
        findings.append({"code": "DANGLING_PARENT_REFERENCES", "items": dangling_parents})
    if dangling_children:
        findings.append({"code": "DANGLING_CHILD_REFERENCES", "items": dangling_children})
    if asymmetries:
        findings.append({"code": "PARENT_CHILD_ASYMMETRIES", "items": asymmetries})
    if unreachable:
        findings.append({"code": "UNREACHABLE_FROM_ROOTS_VIA_CHILD_EDGES", "ids": unreachable})
    if cycle_witnesses:
        findings.append({"code": "CHILD_EDGE_CYCLE_WITNESSES", "cycles": cycle_witnesses})
    if not cycle_audit_complete:
        findings.append({"code": "CHILD_EDGE_CYCLE_AUDIT_INCOMPLETE",
                         "duplicate_ids": duplicate_ids,
                         "malformed_children_fields": malformed_children})
    if dependency_free_text_or_external:
        findings.append({
            "code": "DEPENDENCIES_INCLUDE_FREE_TEXT_OR_EXTERNAL_REFERENCES",
            "count": dependency_free_text_or_external,
        })
    if malformed_children or malformed_dependencies:
        findings.append({
            "code": "MALFORMED_RELATIONSHIP_FIELDS",
            "children": malformed_children,
            "dependencies": malformed_dependencies,
        })

    return {
        "declared_branch_count": declared,
        "record_count": len(branches),
        "declared_count_matches": declared == len(branches),
        "status_counts": status_counts,
        "root_ids": roots,
        "parent_pointer_count": parent_pointer_count,
        "child_edge_count": child_edge_count,
        "reachable_via_child_edges": sorted(reachable),
        "unreachable_ids": unreachable,
        "child_edge_cycle_witnesses": cycle_witnesses,
        "child_edge_cycle_audit_complete": cycle_audit_complete,
        "dangling_parent_references": dangling_parents,
        "dangling_child_references": dangling_children,
        "parent_child_asymmetries": asymmetries,
        "duplicate_ids": duplicate_ids,
        "dependency_entry_count": dependency_entry_count,
        "dependency_entries_matching_graph_ids": dependency_id_matches,
        "dependency_entries_free_text_or_external": dependency_free_text_or_external,
        "malformed_children_fields": malformed_children,
        "malformed_dependency_fields": malformed_dependencies,
        "findings": findings,
    }


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

    fixture = {"branch_count": 5, "branches": [
        {"id": "root", "title": "Root", "status": "active",
         "children": ["child", "missing"], "blockers": ["awaiting source"],
         "unblocks": ["child"], "dependencies": ["child", "external note"]},
        {"id": "child", "title": "Child", "status": "blocked", "parent": "root", "children": ["root"]},
        {"id": "parent-only", "title": "Parent-only relation", "status": "active",
         "parent": "root", "children": []},
        {"id": "orphan", "title": "Orphan", "status": "active", "children": ["orphan"]},
    ]}
    audit = audit_graph(fixture)
    assert audit["record_count"] == 4 and not audit["declared_count_matches"]
    assert audit["root_ids"] == ["root", "orphan"]
    assert audit["reachable_via_child_edges"] == ["child", "orphan", "root"]
    assert audit["unreachable_ids"] == ["parent-only"]
    assert audit["dangling_child_references"] == [{"parent_id": "root", "child_id": "missing"}]
    assert any(item["kind"] == "parent_pointer_without_child_edge"
               for item in audit["parent_child_asymmetries"])
    assert audit["dependency_entry_count"] == 2
    assert audit["child_edge_cycle_audit_complete"]
    cycle_witnesses = {tuple(cycle) for cycle in audit["child_edge_cycle_witnesses"]}
    assert ("root", "child", "root") in cycle_witnesses
    assert ("orphan", "orphan") in cycle_witnesses
    assert audit["dependency_entries_matching_graph_ids"] == 1
    assert audit["dependency_entries_free_text_or_external"] == 1
    root_row = next(row for row in build_report(fixture, date(2026, 11, 5)) if row["id"] == "root")
    assert root_row["blockers"] == ["awaiting source"]
    assert root_row["dependencies"] == ["child", "external note"]

    print("SELF-TEST PASS: priority order, raw relationship preservation, count mismatch, dangling edge, asymmetry, reachability, cycle witnesses and free-text dependency classification.")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("graph", nargs="?", type=Path, help="Path to TASK_BRANCH_GRAPH.json")
    parser.add_argument("--as-of", type=date.fromisoformat, default=date.today())
    parser.add_argument("--limit", type=int, default=25)
    parser.add_argument("--json", action="store_true", help="Emit JSON instead of a text report")
    parser.add_argument("--graph-audit", action="store_true",
                        help="Include a read-only graph-integrity and relationship summary")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()

    if args.self_test:
        self_test()
        return 0
    if args.graph is None:
        parser.error("provide the task graph path, or use --self-test")

    graph = json.loads(args.graph.read_text(encoding="utf-8"))
    rows = build_report(graph, args.as_of)[:max(0, args.limit)]
    audit = audit_graph(graph) if args.graph_audit else None
    if args.json:
        payload = {"as_of": args.as_of.isoformat(), "items": rows}
        if audit is not None:
            payload["graph_audit"] = audit
        print(json.dumps(payload, indent=2))
    else:
        print(f"Task upkeep candidates as of {args.as_of.isoformat()}")
        if audit is not None:
            print(
                "Graph audit: "
                f"{audit['record_count']} records / declared {audit['declared_branch_count']}; "
                f"{len(audit['root_ids'])} roots; "
                f"{len(audit['reachable_via_child_edges'])}/{audit['record_count']} reachable; "
                f"{audit['dependency_entries_matching_graph_ids']} dependency IDs / "
                f"{audit['dependency_entries_free_text_or_external']} free-text or external; "
                f"{len(audit['child_edge_cycle_witnesses'])} child-edge cycle witness(es)."
            )
            for finding in audit["findings"]:
                print(f"    REVIEW: {finding['code']}")
            for cycle in audit["child_edge_cycle_witnesses"]:
                print("    CYCLE: " + " -> ".join(cycle))
        for index, row in enumerate(rows, start=1):
            owner = row["owner_instance"] or "OWNER UNSET"
            reason = "; ".join(row["review_reasons"]) or "no explicit trigger metadata"
            gaps = f"; metadata gaps: {', '.join(row['metadata_gaps'])}" if row["metadata_gaps"] else ""
            print(f"{index:>2}. [{row['priority']}] {row['status']:<14} {row['title']} ({owner})")
            print(f"    {reason}{gaps}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
