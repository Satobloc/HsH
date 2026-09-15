#!/usr/bin/env python3
"""Regression fixture for Mercer's read-only cross-source integrity validator."""
import json
import tempfile
from pathlib import Path

from validate_cross_source_integrity import validate


def put(root, rel, obj):
    path = root / rel
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj), encoding="utf-8")


def main():
    with tempfile.TemporaryDirectory() as tmp:
        root = Path(tmp)
        dev = "indexes/manifests/development-conversation-dates.json"
        live = "indexes/manifests/live-conversation-dates.json"
        put(root, dev, {"generated_at_utc":"D","summary":{"unchanged":1,"blocked":1,"collision":1},"records":[
            {"old_path":"dev/a.json","new_path":"dev/a.json","status":"unchanged","message_count":2,"start_local":"A","end_local":"B","timestamp_source":"message.create_time","warnings":[]},
            {"old_path":"dev/b.json","new_path":"dev/b2.json","status":"blocked","message_count":3,"start_local":"A","end_local":"B","timestamp_source":"message.create_time","warnings":["blocked by collision"]},
            {"old_path":"dev/c.json","new_path":"dev/c2.json","status":"collision","message_count":4,"start_local":"A","end_local":"B","timestamp_source":"message.create_time","warnings":["target exists"]}]})
        put(root, live, {"generated_at_utc":"L","summary":{"planned":1},"records":[
            {"old_path":"LIVE CONVOS/live.json","new_path":"LIVE CONVOS/dated-live.json","status":"planned","message_count":5,"start_local":"A","end_local":"B","timestamp_source":"message.create_time","warnings":[]}]})
        put(root, "CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json", {"conversations":[
            {"path":"external.txt","corpus":"development","message_count":8}]})
        put(root, "CONVERSATION_VIEWER/data/conversations.json", {
            "counts":{"conversations":3,"development":2,"live":1,"source_conversations_before_curation":3},
            "inputs":[
                {"path":dev,"corpus":"development","accepted_json_conversations":1,"source_generated_at_utc":"D"},
                {"path":live,"corpus":"live","accepted_json_conversations":1,"source_generated_at_utc":"L"},
                {"path":"CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json","corpus":"registered-external","accepted_conversations":1}],
            "conversations":[
                {"path":"dev/a.json","corpus":"development","message_count":2,"start_local":"A","end_local":"B","timestamp_source":"message.create_time"},
                {"path":"LIVE CONVOS/live.json","corpus":"live","message_count":5,"start_local":"A","end_local":"B","timestamp_source":"message.create_time"},
                {"path":"external.txt","corpus":"development","message_count":8,"start_local":None,"end_local":None,"timestamp_source":"external"}]})
        put(root, "indexes/nathan-direct/MANIFEST.json", {"input_user_records":10,"packaged_unique_user_messages":7,"archive_duplicate_user_records_collapsed":3,"shards":[{"records":2},{"records":5}]})
        put(root, "indexes/nathan-direct/stage2/MANIFEST.json", {"source_records":7})
        report = validate(root)
        assert not [c for c in report["checks"] if c["severity"] == "FAIL"], report
        assert report["overall"] == "BLOCKED", report
        assert next(c for c in report["checks"] if c["check_id"] == "viewer.external_registry_reconciliation")["severity"] == "PASS"
        assert next(c for c in report["checks"] if c["check_id"] == "viewer.manifest_record_reconciliation")["severity"] == "PASS"
        print("PASS: regression fixture; expected overall BLOCKED from declared manifest blockers")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
