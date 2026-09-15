#!/usr/bin/env python3
"""Bounded competence/regression harness for Mercer's metadata integrity lane.

Creates synthetic repository states only. Each specimen changes one metadata
condition and asserts that the validator classifies it without reading raw
conversation bodies or inferring content authority.
"""
import copy
import json
import tempfile
from pathlib import Path

from validate_cross_source_integrity_v2 import validate


def put(root, rel, obj):
    path = root / rel
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj), encoding="utf-8")


def baseline():
    dev = "indexes/manifests/development-conversation-dates.json"
    live = "indexes/manifests/live-conversation-dates.json"
    files = {
        dev: {"generated_at_utc":"D","summary":{"unchanged":1},"records":[
            {"old_path":"dev/a.json","new_path":"dev/a.json","status":"unchanged","message_count":2,"start_local":"A","end_local":"B","timestamp_source":"message.create_time","warnings":[]}]},
        live: {"generated_at_utc":"L","summary":{"unchanged":1},"records":[
            {"old_path":"LIVE CONVOS/live.json","new_path":"LIVE CONVOS/live.json","status":"unchanged","message_count":5,"start_local":"A","end_local":"B","timestamp_source":"message.create_time","warnings":[]}]},
        # Synthetic materialized sources are required because production resolved
        # Viewer semantics are existence-aware. Their bodies are never parsed.
        "dev/a.json": {"synthetic": True},
        "LIVE CONVOS/live.json": {"synthetic": True},
        "CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json": {"conversations":[
            {"path":"external.txt","corpus":"development","message_count":8}]},
        "CONVERSATION_VIEWER/data/conversations.json": {
            "counts":{"conversations":3,"development":2,"live":1,"source_conversations_before_curation":3},
            "inputs":[
                {"path":dev,"corpus":"development","accepted_json_conversations":1,"source_generated_at_utc":"D"},
                {"path":live,"corpus":"live","accepted_json_conversations":1,"source_generated_at_utc":"L"},
                {"path":"CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json","corpus":"registered-external","accepted_conversations":1}],
            "conversations":[
                {"path":"dev/a.json","corpus":"development","message_count":2,"start_local":"A","end_local":"B","timestamp_source":"message.create_time"},
                {"path":"LIVE CONVOS/live.json","corpus":"live","message_count":5,"start_local":"A","end_local":"B","timestamp_source":"message.create_time"},
                {"path":"external.txt","corpus":"development","message_count":8,"start_local":None,"end_local":None,"timestamp_source":"external"}]},
        "indexes/nathan-direct/MANIFEST.json": {"input_user_records":10,"packaged_unique_user_messages":7,"archive_duplicate_user_records_collapsed":3,"shards":[{"records":2},{"records":5}]},
        "indexes/nathan-direct/stage2/MANIFEST.json": {"source_records":7},
    }
    return files


def run(files):
    with tempfile.TemporaryDirectory() as tmp:
        root = Path(tmp)
        for rel, obj in files.items():
            put(root, rel, obj)
        return validate(root)


def check(report, check_id):
    return next(c for c in report["checks"] if c["check_id"] == check_id)


def main():
    base = baseline()

    r = run(base)
    assert r["overall"] == "PASS", r

    stale = copy.deepcopy(base)
    stale["CONVERSATION_VIEWER/data/conversations.json"]["inputs"][0]["source_generated_at_utc"] = "OLD"
    r = run(stale)
    assert check(r, "viewer.input_freshness.development")["severity"] == "WARN", r

    count_drift = copy.deepcopy(base)
    count_drift["CONVERSATION_VIEWER/data/conversations.json"]["counts"]["conversations"] = 4
    r = run(count_drift)
    assert check(r, "viewer.catalog_count_arithmetic")["severity"] == "FAIL", r

    package_drift = copy.deepcopy(base)
    package_drift["indexes/nathan-direct/MANIFEST.json"]["packaged_unique_user_messages"] = 6
    r = run(package_drift)
    assert check(r, "nathan_direct.user_record_arithmetic")["severity"] == "FAIL", r

    stage2_drift = copy.deepcopy(base)
    stage2_drift["indexes/nathan-direct/stage2/MANIFEST.json"]["source_records"] = 6
    r = run(stage2_drift)
    assert check(r, "nathan_direct.stage2_source_continuity")["severity"] == "FAIL", r

    collision = copy.deepcopy(base)
    collision_dev = collision["indexes/manifests/development-conversation-dates.json"]
    collision_dev["summary"] = {"unchanged":1,"collision":1}
    collision_dev["records"].append({"old_path":"dev/c.json","new_path":"dev/a.json","status":"collision","message_count":2,"start_local":"A","end_local":"B","timestamp_source":"message.create_time","warnings":["target exists"]})
    # The collision record resolves to the existing new_path and is therefore
    # accepted pre-dedup under production semantics, while remaining an
    # operational normalization blocker.
    collision["CONVERSATION_VIEWER/data/conversations.json"]["inputs"][0]["accepted_json_conversations"] = 2
    r = run(collision)
    assert check(r, "manifest.operational_blockers.indexes/manifests/development-conversation-dates.json")["severity"] == "BLOCKED", r
    assert not [c for c in r["checks"] if c["severity"] == "FAIL"], r

    # Specimen 7 freezes the production condition after source-code and retained
    # artifact reconstruction of build_conversation_viewer_resolved.py. Two
    # accepted manifest records may resolve to one exact path; the earlier
    # non-live record survives, so pre-dedup acceptance can exceed final source
    # cardinality without catalog corruption.
    resolved_collision_dedup = copy.deepcopy(base)
    dev = resolved_collision_dedup["indexes/manifests/development-conversation-dates.json"]
    dev["summary"] = {"unchanged":1,"collision":1}
    dev["records"].append({"old_path":"dev/c.json","new_path":"dev/a.json","status":"collision","message_count":2,"start_local":"A","end_local":"B","timestamp_source":"message.create_time","warnings":["target exists"]})
    resolved_collision_dedup["CONVERSATION_VIEWER/data/conversations.json"]["inputs"][0]["accepted_json_conversations"] = 2
    r = run(resolved_collision_dedup)
    assert check(r, "viewer.accepted_input_reconstruction")["severity"] == "PASS", r
    assert check(r, "viewer.post_dedup_cardinality")["severity"] == "PASS", r
    assert check(r, "viewer.resolved_winner_reconciliation")["severity"] == "PASS", r
    assert check(r, "viewer.external_input_lineage")["severity"] == "PASS", r
    assert check(r, "manifest.operational_blockers.indexes/manifests/development-conversation-dates.json")["severity"] == "BLOCKED", r
    assert check(r, "viewer.catalog_count_arithmetic")["severity"] == "PASS", r
    assert not [c for c in r["checks"] if c["severity"] == "FAIL"], r

    print("PASS: 7 integrity specimens: clean, stale-viewer, catalog-count, package-count, stage2-count, collision-blocked, resolved-collision-dedup")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
