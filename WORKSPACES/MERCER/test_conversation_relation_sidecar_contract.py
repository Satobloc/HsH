#!/usr/bin/env python3
"""Synthetic contract harness for the proposed Viewer conversation-relation sidecar.

QA/design fixture only. It does not read raw conversation exports, Viewer production
state, quarantine-controlled material, or infer authority/currentness. The harness
checks the minimum additive contract specified in Mercer Run 71.
"""
from __future__ import annotations

import copy

RELATION_CLASSES = {
    "exact-byte",
    "message-id-subset",
    "message-id-superset",
    "same-graph-metadata-only",
    "same-graph-readable-text-divergent",
    "same-graph-nontext-unresolved",
    "branch-snapshot-divergent",
}
DIRECTIONAL = {"message-id-subset", "message-id-superset"}


def validate(sidecar: dict, catalog: dict[str, str], expected_source_commit: str) -> list[str]:
    """Return contract violations. catalog maps viewer_id -> exact source_path."""
    errors: list[str] = []
    if sidecar.get("schema_version") != 1:
        errors.append("schema_version must equal 1")

    diagnostic = sidecar.get("diagnostic")
    if not isinstance(diagnostic, dict):
        return errors + ["diagnostic must be an object"]
    for key in ("tool", "tool_commit", "source_repo_commit", "report_digest"):
        if not diagnostic.get(key):
            errors.append(f"diagnostic.{key} is required")
    if diagnostic.get("source_repo_commit") != expected_source_commit:
        errors.append("stale source_repo_commit")

    families = sidecar.get("families")
    if not isinstance(families, dict):
        return errors + ["families must be an object"]

    for cid, family in families.items():
        if not cid:
            errors.append("family key conversation_id must be nonempty")
            continue
        if not isinstance(family, dict):
            errors.append(f"family {cid} must be an object")
            continue

        members = family.get("members", [])
        member_ids: set[str] = set()
        for member in members:
            if not isinstance(member, dict):
                errors.append(f"family {cid}: member must be an object")
                continue
            vid, path = member.get("viewer_id"), member.get("source_path")
            if vid in member_ids:
                errors.append(f"family {cid}: duplicate viewer_id {vid}")
            member_ids.add(vid)
            if vid not in catalog:
                errors.append(f"family {cid}: unknown viewer_id {vid}")
            elif catalog[vid] != path:
                errors.append(f"family {cid}: source_path mismatch for {vid}")

        for relation in family.get("relations", []):
            if not isinstance(relation, dict):
                errors.append(f"family {cid}: relation must be an object")
                continue
            a, b, klass = (
                relation.get("a_viewer_id"),
                relation.get("b_viewer_id"),
                relation.get("class"),
            )
            if klass not in RELATION_CLASSES:
                errors.append(f"family {cid}: unsupported relation class {klass}")
            if a == b:
                errors.append(f"family {cid}: self relation is invalid")
            if a not in member_ids or b not in member_ids:
                errors.append(f"family {cid}: relation endpoint outside family")
            if "direction" in relation and klass not in DIRECTIONAL:
                errors.append(f"family {cid}: direction allowed only for subset/superset")

    return errors


def fixture() -> tuple[dict, dict[str, str], str]:
    commit = "a" * 40
    classes = sorted(RELATION_CLASSES)
    catalog: dict[str, str] = {}
    members = []
    relations = []
    for i, klass in enumerate(classes):
        a, b = f"v{i}a", f"v{i}b"
        pa, pb = f"archive/{a}.json", f"archive/{b}.json"
        catalog[a], catalog[b] = pa, pb
        members.extend(({"viewer_id": a, "source_path": pa}, {"viewer_id": b, "source_path": pb}))
        relation = {"a_viewer_id": a, "b_viewer_id": b, "class": klass}
        if klass in DIRECTIONAL:
            relation["direction"] = "a-to-b"
        relations.append(relation)
    sidecar = {
        "schema_version": 1,
        "generated_at": "2026-09-16T00:00:00Z",
        "diagnostic": {
            "tool": "WORKSPACES/MERCER/diagnose_conversation_identity_duplicates_v4.py",
            "tool_commit": "b" * 40,
            "source_repo_commit": commit,
            "report_digest": "sha256:" + "c" * 64,
        },
        "families": {"synthetic-cid": {"members": members, "relations": relations}},
    }
    return sidecar, catalog, commit


def main() -> int:
    base, catalog, commit = fixture()
    assert validate(base, catalog, commit) == [], "seven-class valid fixture rejected"

    stale = copy.deepcopy(base)
    stale["diagnostic"]["source_repo_commit"] = "d" * 40
    assert "stale source_repo_commit" in validate(stale, catalog, commit)

    bad_path = copy.deepcopy(base)
    bad_path["families"]["synthetic-cid"]["members"][0]["source_path"] = "wrong.json"
    assert any("source_path mismatch" in e for e in validate(bad_path, catalog, commit))

    bad_class = copy.deepcopy(base)
    bad_class["families"]["synthetic-cid"]["relations"][0]["class"] = "canonical"
    assert any("unsupported relation class" in e for e in validate(bad_class, catalog, commit))

    bad_endpoint = copy.deepcopy(base)
    bad_endpoint["families"]["synthetic-cid"]["relations"][0]["b_viewer_id"] = "not-a-member"
    assert any("relation endpoint outside family" in e for e in validate(bad_endpoint, catalog, commit))

    bad_direction = copy.deepcopy(base)
    nondirectional = next(r for r in bad_direction["families"]["synthetic-cid"]["relations"] if r["class"] not in DIRECTIONAL)
    nondirectional["direction"] = "a-to-b"
    assert any("direction allowed only" in e for e in validate(bad_direction, catalog, commit))

    print("PASS: sidecar contract synthetic fixtures")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
