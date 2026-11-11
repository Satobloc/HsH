# Amendment 01 — h745:s2 Ariadne source audit

**Observation time:** 2026-11-11T01:48Z  
**Status:** additive correction; original report preserved.

## 1. Lean CI chronology

The first exact-head build, run #42940216121 on head `880cfd64c7efafb0fae8a1822d50d3413b01f718`, failed with noncomputable real division, inverse-proof tactic sequencing, and injectivity-transfer errors. Its failed theorem declarations emitted `sorryAx`; these are not accepted proof evidence.

The second exact-head build, run #42940805176 on head `2287e284cddd2c01b1bfcab7e6ee3302b9c02a30`, failed on the final injectivity-transfer application. It also reported an unused `ring` tactic. The other declarations compiled, but the module as a whole did not. Their reported axioms included `propext`, `Classical.choice`, and `Quot.sound`; no global axiom audit was run.

A third correction was committed to the same existing Ariadne PR #790 branch:

- New head: `6214aa02065716a3eb120052615c58fa0f5c38ba`.
- Module blob: `f84c56609bbd24393e362d863d4469f9e5d291dc`.
- The proof now constructs the sample-map injectivity contradiction explicitly and applies readout injectivity to the equality proof, allowing Lean to infer the implicit profile arguments. The unused tactic was removed.

The exact-head workflow run #42941304893 has started. The exact PR-head checkout assertion passed. At the 01:48Z read, `Generate Lake dependency manifest` was still in progress; Lean installation/compilation had not begun, and no job log was yet available.

**Corrected-head status: SUBMITTED_NOT_VERIFIED.** No successful Lean build or proof closure is claimed. The next pass must wait for run #42941304893, inspect the full log and theorem-specific `#print axioms`, and report skipped tests/lint/nanoda/global audit separately.

## 2. Scheduler state delta

The :36 task's same run ID `ebe2bfaf-2908-832b-b09f-a7a50d3f02c0` changed again:

| Field | 01:37Z snapshot | 01:47Z snapshot |
|---|---|---|
| scheduled_for | 00:36Z | 00:36Z |
| started_at | 01:12:21.845546Z | 01:46:23.313817Z |
| recorded_status | FAILED | IN_PROGRESS |
| completed_at | 01:37:23.196062Z | null |
| chat_ref | null | null |

The later start is 34m01.468271s after the earlier completion. This is recorded as a same-run-ID status reversal and start-time mutation, cause unknown. No retry/restart/queue/skip/duplicate or worker-identity inference is justified.

The canonical Tern inbox append for observation 002 encountered a concurrent branch-update conflict (HTTP 409). It was not forced against stale content. A separate repository observation file was created at:

`WORKSPACES/TERN/OBSERVATIONS/2026-11-11T0147Z_H745_SCHEDULER_OBS_002.md`

This file is a repository-only addendum, not a claim of Tern inbox ingestion, direct-thread delivery or acknowledgment. Tern retains authority.

The :24 run remains IN_PROGRESS at its last exact-ID read; no `chat_ref` is present, and cached latest_result remains the preceding h744 Ravel result.

## 3. Scope unchanged

P0 remains ACTIVE; Lane 24 remains BACKSEAT/HOLD. The finite-core vortex remains a source-recovered candidate, not the selected P2 system. No raw data inventory, covariance, independent holdout, physical calculation, fit, prediction, CODATA comparison, paper advancement or theory promotion was performed. No task ID, prompt, schedule, phase, cadence or enabled state changed; no sixth task was created.
