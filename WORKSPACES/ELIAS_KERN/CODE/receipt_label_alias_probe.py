#!/usr/bin/env python3
"""Case-only worker-label mutation probe.

Imports the existing h902 source-transcribed method-level replay. This is a
conditional software-state test, not an upstream-module or production test.
"""
from dataclasses import replace
import json
from threading_receipt_idempotency_replay import OutputReceipt, ThreadState, receipt_identity

state = ThreadState(seed_version="seed-v1")
first = OutputReceipt("Worker-A", "case-A.json", "seed-v1", "success", "2026-11-18T20:00:00Z")
second = OutputReceipt("Worker-B", "case-B.json", "seed-v1", "failure", "2026-11-18T20:01:00Z")
third = OutputReceipt("Worker-A", "case-A2.json", "seed-v1", "success", "2026-11-18T20:02:00Z")
for row in (first, second, third):
    state.add_receipt(row)

before = state.state_threshold_met()
mutated = replace(first, worker="worker-a")  # only case of worker label changes
state.add_receipt(mutated)

raw_workers = state.distinct_workers
normalized_workers = {r.worker.strip().casefold() for r in state.receipts}
unique_rows = {receipt_identity(r) for r in state.receipts}
after = state.state_threshold_met()
normalized_gate = (
    len(state.receipts) >= state.min_outputs
    and len(normalized_workers) >= state.min_workers
    and {"success", "failure"}.issubset({r.outcome for r in state.receipts})
)

checks = {
    "three_row_baseline_gate_false": before is False and len((first, second, third)) == 3,
    "baseline_has_two_raw_worker_labels": len({r.worker for r in (first, second, third)}) == 2,
    "alias_changes_only_worker_label": (mutated.artifact, mutated.seed_version, mutated.outcome, mutated.timestamp, mutated.metadata) == (first.artifact, first.seed_version, first.outcome, first.timestamp, first.metadata),
    "casefold_alias_is_same_label": mutated.worker.casefold() == first.worker.casefold(),
    "row_count_four_after_alias": len(state.receipts) == 4,
    "raw_worker_label_count_three": len(raw_workers) == 3,
    "casefold_worker_count_two": len(normalized_workers) == 2,
    "unique_exact_rows_four": len(unique_rows) == 4,
    "both_outcomes_present": {"success", "failure"}.issubset({r.outcome for r in state.receipts}),
    "raw_string_gate_flips_true": after is True,
    "casefolded_gate_remains_false": normalized_gate is False,
}
result = {
    "classification": "SYNTHETIC_SOURCE_TRANSCRIBED_METHOD_LEVEL_ALIAS_MUTATION_NOT_UPSTREAM_OR_PRODUCTION_TEST",
    "status": "PASS" if all(checks.values()) else "FAIL",
    "tests_passed": sum(checks.values()),
    "tests_total": len(checks),
    "before": {"rows": 3, "raw_worker_labels": 2, "threshold_met": before},
    "after": {"rows": len(state.receipts), "exact_unique_rows": len(unique_rows), "raw_worker_labels": len(raw_workers), "casefold_worker_labels": len(normalized_workers), "threshold_met": after, "casefolded_gate": normalized_gate},
    "checks": checks,
    "interpretation": "If Worker-A and worker-a are aliases of one actor, changing only label case in a replayed row creates a third raw label and flips the gate. Casefold normalization blocks this particular alias, but cannot authenticate identity; a stable authenticated ActorKey is required for an independence claim."
}
print(json.dumps(result, indent=2, sort_keys=True))
assert all(checks.values())
