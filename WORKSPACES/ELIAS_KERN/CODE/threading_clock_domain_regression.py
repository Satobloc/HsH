#!/usr/bin/env python3
"""Bounded regression for the HSH_RESOURCES Threading demo's clock semantics.

Usage: python threading_clock_domain_regression.py --source /path/to/workflow_threading_demo.py
The source file is imported unchanged and must match the pinned Git blob SHA-1.
This tests prototype software state only; it does not execute a scheduler.
"""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path

EXPECTED_GIT_BLOB_SHA1 = "ce313e46b1b85ae35028b46a4196d2a945b535d8"
SOURCE_REPO_PATH = "Satobloc/HSH_RESOURCES/tools/workflow_threading_demo.py"


def load_source(path: Path):
    raw = path.read_bytes()
    git_blob = b"blob " + str(len(raw)).encode("ascii") + b"\0" + raw
    found = hashlib.sha1(git_blob).hexdigest()
    if found != EXPECTED_GIT_BLOB_SHA1:
        raise SystemExit(f"source blob mismatch: expected {EXPECTED_GIT_BLOB_SHA1}, got {found}")
    spec = importlib.util.spec_from_file_location("workflow_threading_demo", path)
    if spec is None or spec.loader is None:
        raise SystemExit("could not load source module")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module, len(raw), found


def run(module, source_bytes: int, source_sha1: str) -> dict:
    builtin = module.self_test()
    if builtin != {"tests": 6, "status": "PASS"}:
        raise AssertionError(f"unexpected built-in self-test result: {builtin!r}")

    results: dict[str, object] = {}
    checks: dict[str, bool] = {}
    t0 = datetime(2026, 11, 17, 0, 0, tzinfo=timezone.utc)

    thread = module.sample_thread(t0)
    same_instant = datetime(2026, 11, 17, 1, 0, tzinfo=timezone(timedelta(hours=1)))
    elapsed = thread.elapsed_hours(same_instant)
    checks["aware_offsets_compare_by_instant"] = elapsed == 0.0
    results["aware_offsets_compare_by_instant"] = {"elapsed_hours": elapsed, "expected": 0.0}

    thread = module.sample_thread(t0)
    try:
        thread.elapsed_hours(datetime(2026, 11, 17, 1, 0))
        checks["aware_start_naive_now_rejected"] = False
        results["aware_start_naive_now_rejected"] = {"exception": None}
    except TypeError as exc:
        checks["aware_start_naive_now_rejected"] = True
        results["aware_start_naive_now_rejected"] = {"exception": type(exc).__name__, "message": str(exc)}

    thread = module.sample_thread(datetime(2026, 11, 17, 0, 0))
    try:
        thread.elapsed_hours(datetime(2026, 11, 17, 1, 0, tzinfo=timezone.utc))
        checks["naive_start_aware_now_rejected"] = False
        results["naive_start_aware_now_rejected"] = {"exception": None}
    except TypeError as exc:
        checks["naive_start_aware_now_rejected"] = True
        results["naive_start_aware_now_rejected"] = {"exception": type(exc).__name__, "message": str(exc)}

    thread = module.sample_thread(datetime(2026, 11, 17, 0, 0))
    gate = thread.should_rejoin(datetime(2026, 11, 17, 3, 1))
    checks["naive_pair_can_trigger_time_cap"] = gate["ready"] and gate["reason"] == "time-cap"
    results["naive_pair_can_trigger_time_cap"] = gate

    thread = module.sample_thread(t0)
    gate = thread.should_rejoin(datetime(2026, 11, 16, 23, 0, tzinfo=timezone.utc))
    checks["backward_clock_delays_time_cap"] = gate["elapsed_hours"] == -1.0 and not gate["ready"]
    results["backward_clock_delays_time_cap"] = gate

    thread = module.sample_thread(t0)
    gate = thread.should_rejoin(datetime(2026, 11, 17, 6, 0, tzinfo=timezone.utc))
    checks["forward_clock_triggers_time_cap"] = gate["elapsed_hours"] == 6.0 and gate["ready"] and gate["reason"] == "time-cap"
    results["forward_clock_triggers_time_cap"] = gate

    if not all(checks.values()):
        raise AssertionError(f"targeted regression failure: {checks!r}")
    return {
        "source": SOURCE_REPO_PATH,
        "source_bytes": source_bytes,
        "source_git_blob_sha1": source_sha1,
        "scope": "exact-source import; built-in self-test plus targeted method-level temporal-input tests; no scheduler or production execution",
        "builtin_self_test": builtin,
        "checks": checks,
        "results": results,
        "passed": sum(checks.values()),
        "total": len(checks),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", required=True, type=Path, help="byte-identical upstream POC source file")
    args = parser.parse_args()
    module, source_bytes, source_sha1 = load_source(args.source)
    print(json.dumps(run(module, source_bytes, source_sha1), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
