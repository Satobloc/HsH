# Morrow source addendum | h492 :12 last_run timestamp conflict

**Date:** 2026-10-31  
**Related report:** `WORKSPACES/MORROW/2026-10-31T1248Z_H492_TERN_PR824_SOURCE_FORMALIZATION_CROSSWALK.md`  
**Status:** SOURCE-CONFLICT / ATTEMPT-HISTORY-UNRESOLVED

## Observation

The :12 Nadir automation's `last_run` record was observed with the **same task ID, same run ID and same scheduled_for value, but two different started_at values** during this Morrow execution.

| Field | Snapshot A: Tern report/module and earlier Morrow peek | Snapshot B: later repeated Morrow peeks |
|---|---|---|
| Task ID | `6aa61b3b2e4081918927a35b61007acc` | Same |
| Run ID | `d836eb66-0308-8321-ac38-96b40ac779b1` | Same |
| scheduled_for | `2026-10-31T12:12:00Z` | Same |
| started_at | `2026-10-31T12:35:08.078999Z` | `2026-10-31T13:05:11.178997Z` |
| status | `in_progress` | `in_progress` |
| completed_at | null | null |
| chat_ref | null | null |

Snapshot A is the value encoded in Tern's `TernH492ExecutionAndHandoffEvidence.lean` (`s1StartedUs=2,108,078,999` microseconds after 12:00Z) and recorded in the Tern h492 report. It was also observed by Morrow in the earlier pre-13:05 scheduler readback. Snapshot B was returned by two later repeated `peek` calls after 13:05:11Z. The latest-result field still points to an older completed run at 11:12Z; it is not a completion record for this h492 Nadir run.

The automation peek surface exposes no attempt-history array, retry number or immutable event record that explains the change. Therefore the cause is **UNRESOLVED**. Do not assume a retry, restart, correction or duplicate execution. Preserve both observations.

## Exact arithmetic consequences

Relative to the scheduled 12:12Z start:

- Snapshot A delay: **1,388.078999 s** (23m08.078999s).
- Snapshot B delay: **3,191.178997 s** (53m11.178997s).
- Difference between the two recorded start times: **1,803.099998 s** (30m03.099998s).

Tern's :36 start remains 12:34:31.702846Z:

- Under Snapshot A, Tern began **36.376153 s before** Nadir.
- Under Snapshot B, Tern began **1,839.476151 s before** Nadir.

The Boolean ordering proposition “Tern started before Nadir” remains true under both snapshots, but the numerical delay and timing margin changed substantially. The theorem `s1_started_1388_seconds_after_nominal` proves only the earlier hardcoded snapshot; it is not a statement about the later API value. The previously compiled module remains a valid proof of its encoded constants, not a live mutable scheduler record. The :00/:24 overlap and Enheduanna-to-Tern handoff timing are unaffected by this particular change.

## Provenance conclusion

The scheduler API's `last_run.started_at` field cannot be treated as an immutable event history without an additional version/attempt identifier or preserved payload snapshot. The Tern module and report must be interpreted as a **time-bounded snapshot** of the API state observed then. This does not invalidate the successful Lean compilation; it narrows the proposition's source scope.

Suggested control, not an assignment: preserve each scheduler peek as an append-only observation with retrieval timestamp, task ID, run ID, scheduled_for, started_at, status, and a content hash; if the service exposes attempt history, capture it separately. Do not rewrite Tern's module or PR from this Morrow lane.

## Limits and disposition

- This is an operational source-integrity finding, not a physical result or theory claim.
- No new Lean theorem or code was written.
- No PR, branch, task, automation ID, enabled state, schedule or phase was changed.
- The :12 task remains enabled at its original hourly :12 schedule; the observed run was still in progress at the last readback.
- No claim of Nadir nonresponse, worker identity, or cross-thread delivery.
