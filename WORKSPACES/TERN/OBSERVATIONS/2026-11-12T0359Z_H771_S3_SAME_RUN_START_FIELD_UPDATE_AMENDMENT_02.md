# Amendment 02 — later same-run readback

**Parent observation:** [H771 scheduler status mutation and cross-lease observation 003](2026-11-12T0324Z_H771_SCHEDULER_STATUS_MUTATION_AND_CROSS_LEASE_OBS_003.md)  
**Prior amendment:** Amendment 01, initial cross-lease and start-time readback  
**Snapshot:** 2026-11-12T03:59:55Z

## New observation

The :36 task still reports the same run ID, but a later exact-ID automation peek returned a different started_at value.

| Field | Earlier observation | Later observation |
|---|---|---|
| Task ID | 6a9f52b69ec08191b0a2ba24a074f781 | Same |
| Run ID | 1fd53dcf-0c68-832a-8e93-7cf9c1c28412 | Same |
| scheduled_for | 2026-11-12T03:36:00Z | Same |
| started_at | 2026-11-12T03:32:23.424577Z | 2026-11-12T03:59:52.674135Z |
| recorded status | IN_PROGRESS | IN_PROGRESS |
| completed_at | null | null |
| run-level chat_ref | null | null |

The started_at field changed by **00:27:29.249558** while the run ID remained constant.

## Summary-field comparison

At the later snapshot, task-level summary fields still reflected the prior completed result rather than the current run:

- last_run_time remained 2026-11-12T03:17:21.133776Z.
- updated_at remained 2026-11-12T03:17:43.111Z.
- next_run_time remained the past local slot 2026-11-11T22:36:00-05:00.
- latest_result remained the preceding completed h770 result.

The detailed last_run object is therefore the relevant snapshot for this observation; summary fields and cached output are stale relative to it.

## Classification and limits

Classification: SAME_RUN_ID_START_TIMESTAMP_UPDATE / RETRY_OR_FIELD_SEMANTICS_UNRESOLVED.

The automation tool guidance allows retries to reuse a run ID and retain earlier output. This observation does not establish whether a retry occurred, whether the timestamp field has another meaning, or whether a backend defect exists.

No cause, process liveness, worker identity, conversation delivery, or cross-thread execution is inferred. No task, ID, prompt, schedule, phase, enabled state, or cadence was changed. This is a scheduler-control observation only, not a new task or response obligation.