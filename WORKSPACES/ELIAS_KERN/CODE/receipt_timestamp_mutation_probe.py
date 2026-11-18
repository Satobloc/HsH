#!/usr/bin/env python3
"""Conditional receipt-event identity probe using the h902 source transcription.

Not an upstream-module run or production test. It changes only the timestamp
field of a previously admitted receipt and observes the row-count gate.
"""
from dataclasses import replace
import json
from threading_receipt_idempotency_replay import OutputReceipt, ThreadState, receipt_identity

state = ThreadState(seed_version="seed-v1")
first = OutputReceipt("Worker-A", "case-A.json", "seed-v1", "success", "2026-11-17T00:10:00Z")
second = OutputReceipt("Worker-B", "case-B.json", "seed-v1", "failure", "2026-11-17T00:20:00Z")
third = OutputReceipt("Worker-C", "case-C.json", "seed-v1", "success", "2026-11-17T00:30:00Z")
for row in (first, second, third):
    state.add_receipt(row)
before = state.state_threshold_met()
mutated = replace(first, timestamp="2026-11-17T00:10:01Z")
state.add_receipt(mutated)
after = state.state_threshold_met()
checks = {
    "before_three_rows_gate_is_false": before is False,
    "mutated_row_changes_only_timestamp": (mutated.worker, mutated.artifact, mutated.seed_version, mutated.outcome, mutated.metadata) == (first.worker, first.artifact, first.seed_version, first.outcome, first.metadata),
    "timestamp_differs_by_one_second": mutated.timestamp != first.timestamp,
    "row_count_becomes_four": len(state.receipts) == 4,
    "exact_row_identity_counts_four": len({receipt_identity(r) for r in state.receipts}) == 4,
    "distinct_worker_labels_remain_three": len(state.distinct_workers) == 3,
    "success_and_failure_remain_present": {r.outcome for r in state.receipts} == {"success", "failure"},
    "gate_flips_to_true": before is False and after is True,
}
result = {
    "classification": "CONDITIONAL_SOURCE_TRANSCRIBED_IDENTITY_AMBIGUITY_PROBE_NOT_UPSTREAM_OR_PRODUCTION_TEST",
    "status": "PASS" if all(checks.values()) else "FAIL",
    "tests_passed": sum(checks.values()),
    "tests_total": len(checks),
    "before": {"rows": 3, "threshold_met": before},
    "after": {"rows": len(state.receipts), "exact_unique_rows": len({receipt_identity(r) for r in state.receipts}), "distinct_worker_labels": len(state.distinct_workers), "threshold_met": after},
    "checks": checks,
    "interpretation": "A timestamp-mutated replay is indistinguishable from a new receipt event under the current row-count gate. Whether this is a defect depends on the intended event-identity contract; no event-ID/authenticated-provenance claim is tested.",
}
print(json.dumps(result, indent=2, sort_keys=True))
assert all(checks.values())
