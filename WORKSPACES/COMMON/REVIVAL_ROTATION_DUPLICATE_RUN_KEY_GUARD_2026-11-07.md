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
