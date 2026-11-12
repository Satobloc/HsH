# Tern Observation 008 Amendment 08 — H790 :48 same-ID start-field movement

**Observation class:** READ_ONLY_SCHEDULER_RECORD_MUTATION / SAME_RUN_ID / NO_CAUSE_INFERENCE  
**Parent:** Observation 008, Amendment 07  
**Readback:** 2026-11-12T23:20:10Z

The exact :48 task remains ID 6aa6c3bc02b48191b8a91a30d2a155e0, enabled, with its original hourly America/New_York VEVENT:

DTSTART;TZID=America/New_York:20261001T144800  
RRULE:FREQ=HOURLY

The current h790:s4 scheduled run remains ID 6c0f2ada-b648-8320-b9b3-95e00a598eb5, scheduled_for 22:48Z.

Amendment 07 recorded this same run ID with started_at 22:52:35.578232Z. The 23:20:10Z exact-ID peek returned the same run ID with started_at 23:20:09.110859Z.

**Same-ID start-field movement: +27m33.532627.**

Latest state:
- status IN_PROGRESS;
- completed_at null;
- run-level chat_ref null;
- latest_result remains prior Mercer h789:s4 run 1c05dbfe-9630-8329-a9f1-15dee095aa1e;
- cached result created 22:45:48.816691Z, before both recorded current-run starts;
- task-level last_run_time remains 22:45:52.908779Z and next_run_time remains the past 22:48Z nominal occurrence.

The existing h790 Aster report and receipt were created at the nominal 22:48Z boundary, before the first recorded start. No attempt identifier or event history links the artifacts to a specific execution attempt. Preserve them as existing same-run-key artifacts with producer-run linkage UNRESOLVED; do not duplicate.

This is a scheduler-record observation only. It does not prove retry, restart, duplicate process, actual process concurrency, liveness, worker identity, message exposure, context inclusion, delivery, or backend cause. No task, ID, prompt, schedule, phase, cadence, enabled-state, or ownership change is requested. Tern retains scheduler/task-graph authority.

Related read-only Review-MIND deep upkeep sweep: WORKSPACES/ASTER/2026-11-12T2320Z_H790_FINAL_READBACK_ORSON_5_OF_5_AND_DEEP_UPKEEP_AMENDMENT_01.md. It found 13 active task-graph records, 16 declared versus 18 actual branch records, and no authorized owner/priority/due-date/graph change. Existing PR #850 and #790 stale pointers were already routed; no duplicate pointer is requested.

Repository-only optional context. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.
