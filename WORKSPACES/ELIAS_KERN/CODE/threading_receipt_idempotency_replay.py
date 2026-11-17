#!/usr/bin/env python3
"""Source-transcribed method-level replay of Threading receipt admission.

This is a software-state counterexample, not a physical calculation, observed
worker event, full upstream-module execution, or production test. The methods
below transcribe the inspected prototype's seed-version-only add_receipt and
row-count/distinct-worker/outcome state_threshold_met behavior.
"""
from __future__ import annotations

import json
from dataclasses import dataclass, field
from typing import Dict, List, Set, Tuple


@dataclass(frozen=True)
class OutputReceipt:
    worker: str
    artifact: str
    seed_version: str
    outcome: str
    timestamp: str
    metadata: Dict[str, str] = field(default_factory=dict)


@dataclass
class ThreadState:
    seed_version: str
    min_outputs: int = 4
    min_workers: int = 3
    require_success_and_failure: bool = True
    receipts: List[OutputReceipt] = field(default_factory=list)

    def add_receipt(self, receipt: OutputReceipt) -> None:
        if receipt.seed_version != self.seed_version:
            raise ValueError("receipt seed version mismatch")
        self.receipts.append(receipt)

    @property
    def distinct_workers(self) -> Set[str]:
        return {receipt.worker for receipt in self.receipts}

    def state_threshold_met(self) -> bool:
        if len(self.receipts) < self.min_outputs:
            return False
        if len(self.distinct_workers) < self.min_workers:
            return False
        if self.require_success_and_failure:
            outcomes = {receipt.outcome for receipt in self.receipts}
            if "success" not in outcomes or "failure" not in outcomes:
                return False
        return True


def receipt_identity(receipt: OutputReceipt) -> Tuple[object, ...]:
    """Audit-only exact-row identity; the prototype has no such field/key."""
    return (
        receipt.worker,
        receipt.artifact,
        receipt.seed_version,
        receipt.outcome,
        receipt.timestamp,
        tuple(sorted(receipt.metadata.items())),
    )


def main() -> None:
    state = ThreadState(seed_version="seed-v1")
    first = OutputReceipt("Worker-A", "case-A.json", "seed-v1", "success", "2026-11-17T00:10:00Z")
    second = OutputReceipt("Worker-B", "case-B.json", "seed-v1", "failure", "2026-11-17T00:20:00Z")
    third = OutputReceipt("Worker-C", "case-C.json", "seed-v1", "success", "2026-11-17T00:30:00Z")

    for receipt in (first, second, third):
        state.add_receipt(receipt)
    before = state.state_threshold_met()
    before_rows = len(state.receipts)
    before_workers = len(state.distinct_workers)

    state.add_receipt(first)  # exact replay of the same receipt row
    after = state.state_threshold_met()
    unique_rows = len({receipt_identity(r) for r in state.receipts})

    checks = {
        "three_rows_do_not_meet_four_output_threshold": before is False and before_rows == 3,
        "exact_duplicate_is_accepted": state.receipts[-1] == state.receipts[0],
        "row_count_increases_to_four": len(state.receipts) == 4,
        "distinct_worker_count_remains_three": before_workers == 3 and len(state.distinct_workers) == 3,
        "both_outcome_labels_remain_present": {r.outcome for r in state.receipts} == {"success", "failure"},
        "exact_unique_receipt_rows_remain_three": unique_rows == 3,
        "duplicate_flips_return_gate": before is False and after is True,
        "sample_threshold_parameters_match_source": (state.min_outputs, state.min_workers, state.require_success_and_failure) == (4, 3, True),
    }
    result = {
        "classification": "SOURCE_TRANSCRIBED_METHOD_LEVEL_REPLAY_NOT_FULL_MODULE_EXECUTION",
        "status": "PASS" if all(checks.values()) else "FAIL",
        "tests_passed": sum(checks.values()),
        "tests_total": len(checks),
        "before": {"rows": before_rows, "distinct_workers": before_workers, "threshold_met": before},
        "after": {"rows": len(state.receipts), "distinct_workers": len(state.distinct_workers), "exact_unique_rows": unique_rows, "threshold_met": after},
        "checks": checks,
    }
    print(json.dumps(result, indent=2, sort_keys=True))
    assert all(checks.values())


if __name__ == "__main__":
    main()
