# Revival Rotation | Duplicate Run-Key Idempotency Guard

**Date:** 2026-11-07  
**Status:** Assistant-authored operational clarification, tested in the current relay. **Not Nathan Direct and not theory authority.**  
**Scope:** receipt integrity and duplicate-invocation handling only.

This guard does not change any of the five existing automation IDs, enabled states, hourly schedules, phases, ring members, selection formula, worker remits, task ownership, branch ownership, or cross-thread delivery capabilities. It creates no scheduler task and grants no new access.

## Core rule

A deterministic run key identifies one nominal slot event, not every runtime invocation of that slot.

Example:

`REVROT3-19-20261011:671:s3`

A manual invocation, scheduled invocation, retry, or overlapping execution that computes the same key is the **same relay event** for receipt and publication purposes. Wall-clock invocation time does not create a new run key.

## Required preflight

Before substantive work or any write:

1. Compute the exact nominal UTC hour, slot phase, worker, successor, and run key from the active fixed ring and existing task phase.
2. Search the current main branch for the canonical receipt matching that exact run key. Inspect its numbered amendments, referenced artifact blobs, handoff, relevant branch/PR and CI state, and publisher state. If the main-branch result is incomplete or stale, inspect the relevant active branch before inferring absence.
3. Verify whether the canonical receipt's required work is complete. A file's existence alone is not completion evidence; read the artifact and verify the specific runtime/publication state claimed.
4. Reuse an existing valid successor handoff. Do not create another packet merely because the same run key was invoked again.

## Decision states

| State | Condition | Permitted action |
|---|---|---|
| `DUPLICATE_RUN_KEY_RECONCILIATION` | One canonical receipt exists and its required work is complete. | Read/verify current state; do not repeat the substantive work. |
| `DUPLICATE_NO_NEW_DELTA` | Reconciliation finds no new material state. | Stop without a second canonical receipt, duplicate handoff, PR, issue, Mersearch request, build, calculation, or publication. |
| `INCOMPLETE_EXISTING_RUN_KEY` | One canonical receipt exists but a required step is genuinely incomplete. | Perform only the missing step; append a numbered amendment to the same receipt. Never rewrite history or imply the earlier run performed the later step. |
| `RUN_KEY_CONFLICT` | Multiple canonical receipts, inconsistent run-key metadata, or incompatible artifact/receipt claims exist. | Freeze writes and route the conflict to Comptroller Tern; do not choose a preferred receipt or merge histories silently. |
| `NEW_RUN_KEY` | No matching canonical receipt exists on main or the verified active branch. | Proceed once under the normal receipt/handoff protocol. |

## Timestamp and provenance discipline

Every receipt must keep these distinct:

- **Nominal slot time:** the UTC hour and phase encoded by the deterministic run key.
- **Actual invocation time:** when this particular runtime began and when each later amendment was made.
- **Work provenance:** what this invocation actually read, executed, changed, verified, or did not do.

A late or early duplicate invocation does not alter the original nominal timestamp. A later amendment records its own actual time and preserves the original receipt unchanged.

## Duplicate prevention

For an already-completed run key, do not create:

- a second canonical receipt;
- a second successor handoff;
- a duplicate publisher issue or submission;
- a duplicate Mersearch request or overwrite of an occupied lane;
- a new branch or PR merely to give the replay fresh work;
- repeated calculations, experiments, builds, or source searches whose evidence is already current.

A genuinely changed external state may justify a narrowly scoped amendment, but only after re-reading the exact current source and recording the new evidence. If nothing changed, no write is better than ceremonial file churn.

## Concrete exercise: h671:s3

The current main branch already contains:

- canonical Kestrel receipt: `2026-11-07T2336Z_s3_kestrel.md`, blob `a2874087683f767f01cb2fbcd7cba3096ac61d1b`;
- source-crosswalk artifact: `WORKSPACES/KESTREL/2026-11-07T2336Z_THETA4_REFERENCE_CROSSWALK_AND_TWO_KNOB_TEST_MATRIX.md`, blob `32eb11744e71a2166c8c847a19f61f1d06b5fa0e`;
- successor handoff: `2026-11-07T2336Z_from_s3_to_s4_meridian.md`, blob `cb0e06721befe20646a9fcabdd2a4194c5e2b820`;
- five linked receipt amendments.

A subsequent invocation of the same `REVROT3-19-20261011:671:s3` key found the completed receipt and read back its artifact and handoff. It therefore reconciled the existing event rather than repeating the Kestrel research or creating a duplicate handoff. This is the concrete case that motivated the guard.

## Authority boundary

This is a workflow-integrity clarification under the existing steering remit. It does not authenticate a historical worker, prove delivery to another ChatGPT thread, promote a theory claim, change paper gates, or alter scheduler authority. Existing-thread-first remains controlling; a repository handoff remains repository-only unless an actual authenticated delivery action and destination receipt are available.


## Scheduler snapshot binding: stale results and rebased starts

The scheduler's `last_run` and `latest_result` are separate records and must be reconciled before attributing output:

1. Compare `last_run.id` with `latest_result.run_id`, and compare their `scheduled_for` values. Never attribute `latest_result.content_text` to the current `last_run` unless the identifiers and nominal slot match.
2. Compare `latest_result.created_at` with `last_run.started_at`. A cached result created before the current attempt is prior output, even if it is the only visible result.
3. A retry/re-entry can expose the same run ID with a changed `started_at` snapshot. Record each observed snapshot with its observation time; do not infer a new slot event, a new worker identity, or a second run key.
4. Durable repository work and a successful CI run can coexist with `last_run.recorded_status=failed`. Report repository/CI state and scheduler-wrapper state separately. Do not erase verified artifacts or relabel the wrapper as successful.
5. `chat_ref=null` or `delivery_status=unknown` does not establish cross-thread delivery or acknowledgment.

### Concrete exercise: h675:s3

For `REVROT3-19-20261011:675:s3`, run ID `fdbcaff8-87ec-8325-9a68-06e1196f63a6` was observed with start-time snapshots 03:35:04.898663Z, 04:02:15Z, and 04:31:41.535355Z for the same nominal 03:36Z slot. The final peek recorded the run as FAILED at 04:43:45.469388Z with `chat_ref=null`. Its `latest_result` still referenced the prior h674:s3 Nadir run ID `d5e3c0f6-8c84-832e-b944-78c6c0b4b9ca`, created at 03:01:07Z. Meanwhile, the existing PR #1471 had a successful Lean merge-reference build and its repository artifacts were read back. These are distinct facts, not contradictory evidence.

The cause of the scheduler start-time changes and final FAILED status is not exposed. Preserve the task's enabled state and exact schedule; do not disable, reschedule, create a replacement task, or duplicate the h675:s3 work.
