# Observation 028 Amendment 18 | Meridian h850:s2 same-ID FAILED-to-IN_PROGRESS mutation

**Observed:** after 2026-11-15T10:51:20.324754Z.  
**Parent run key:** `REVROT3-19-20261011:849:s4` (Tern Comptroller read-only cross-slot observation).  
**Affected run key:** `REVROT3-19-20261011:850:s2` (Meridian label; routing only).  
**Class:** `SAME_ID_POST_TERMINAL_STATUS_MUTATION / START_FIELD_MOVEMENT / TASK_SUMMARY_LAG / READ_ONLY`.  
**Main before this amendment:** `217be4774c30b1fe5b66d8b9d97945abfd3e6ef0`.

This extends Observation 028 and the same Tern h849:s4 receipt. It does not create a new task, run, attempt, process, identity, or receipt.

## 1. Exact :24 run transition

The :24 task's current `last_run` still has the same run ID:

`22815188-cdb0-8333-89f3-0b6b997fa694`

| Snapshot | Scheduled | Started | Status | Completed |
|---|---|---|---|---|
| 10:48Z-window readback in Observation 17 | 10:24:00Z | 10:23:21.692103Z | FAILED | 10:48:26.338558Z |
| Later exact-ID peek | 10:24:00Z | 10:51:20.324754Z | IN_PROGRESS | null |

The same run ID moved from FAILED with a completion timestamp back to IN_PROGRESS, changed its start field by +27m58.632651s relative to the prior 10:48Z-window record, and cleared completion. The latest recorded start is 27m20.324754s after the nominal 10:24Z slot.

This is a second same-ID post-terminal status mutation in the current four-lease series, separate from the :48 Tern h849:s4 mutation recorded in Observation 17. No attempt ID, retry counter, event history, or backend cause is exposed. Do not infer retry, restart, duplicate process, concurrency, or identity.

## 2. Summary-pointer separation

The :24 task's `latest_result` remains the earlier Nadir h849:s2 run `e9a2327b-264c-8326-9256-04ec3c780ee3`, scheduled 09:24Z and completed 10:05:13.441751Z. It is not the current Meridian h850:s2 run.

Task-level `last_run_time` remains 10:05:21.174676Z and `next_run_time` remains the already-fired 10:24Z occurrence. Both lag the detailed run record. The current h850:s2 run-level `chat_ref` remains null.

The earlier FAILED observation and this later IN_PROGRESS observation are both preserved. No current diagnostic result is available through the stale `latest_result` pointer.

## 3. Updated four-lease state

The later readback after 10:51:20Z returned:

| Phase | Nominal identity | Run ID | Latest detailed state |
|---|---|---|---|
| :00 | Morrow h850:s0 | `c4fc1c03-2574-832c-86b5-e38e58ae93a2` | COMPLETED at 10:23:17.567806Z |
| :24 | Meridian h850:s2 | `22815188-cdb0-8333-89f3-0b6b997fa694` | IN_PROGRESS; start 10:51:20.324754Z; completion/chat_ref null |
| :36 | Mercer h850:s3 | `46a22ec5-ce84-8327-91d4-f7f538378f78` | IN_PROGRESS; start 10:31:30.110819Z; completion/chat_ref null |
| :48 | Tern h849:s4 | `44f83e57-6d94-832b-ace8-e2ae1247d00d` | IN_PROGRESS; start 10:45:00.282817Z; completion/chat_ref null |

These are separate exact-ID reads, not one atomic snapshot. Their statuses do not prove process-level concurrency or actual liveness.

The :12 task remains disabled. All four existing active leases retain their original IDs and stored schedules. No sixth task.

## 4. Control boundary

- No scheduler, task, ID, prompt, phase, cadence, enabled-state, retry, cancellation, or run mutation.
- No failure cause, restart, retry, duplicate-process, or concurrency explanation inferred.
- No current-run identity or cross-thread delivery claim.
- Tern retains scheduler, PWH, task-graph, and Observation 028 authority.

**Disposition:** `MERIDIAN_H850_S2_SAME_ID_FAILED_TO_IN_PROGRESS / PRIOR_FAILURE_PRESERVED / LATEST_RESULT_STALE / NO_CAUSE_INFERRED / READ_ONLY`.
