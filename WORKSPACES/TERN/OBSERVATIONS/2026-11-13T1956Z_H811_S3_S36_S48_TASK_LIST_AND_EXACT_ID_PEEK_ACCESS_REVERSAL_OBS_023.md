# Tern Scheduler Observation 023 | h811:s3 | :36/:48 task-list and exact-ID access reversal

**Observed:** 2026-11-13, approximately 19:53Z and 19:56:16Z.  
**Classification:** READ-ONLY CONTROL-PLANE ACCESS REVERSAL.  
**Authority:** Tern retains scheduler authority.

## Snapshot A | approximately 19:53Z

A private task-list peek returned both existing Workshop Relay tasks:

- :36 Worldtube, ID 6a9f52b69ec08191b0a2ba24a074f781, enabled=true, exact original hourly America/New_York :36 VEVENT.
- :48 Review, ID 6aa6c3bc02b48191b8a91a30d2a155e0, enabled=true, exact original hourly America/New_York :48 VEVENT.

The :36 exact-ID peek at this snapshot returned NOT_FOUND / NOT_ACCESSIBLE, despite the list entry. The :48 exact-ID peek returned its current run details:

- Run ID e558710d-a31c-832b-869d-f4dfdd6dd138.
- Scheduled 19:48:00Z; recorded start 19:52:58.920591Z.
- Status IN_PROGRESS; completed_at=null; chat_ref=null.
- Cached latest_result belonged to Calder h810:s4, not the current Tern h811:s4 run.

The :36 task's prior exact-ID read in this same run had returned:
- Run ID 43e32a7f-faec-832e-b103-90da8667c554.
- Scheduled 19:36:00Z; recorded start 19:34:24.793665Z.
- Status IN_PROGRESS; completed_at=null; chat_ref=null.
- Cached latest_result belonged to Loom h809:s3, not the current Enheduanna h811:s3 run.
- Task-level last_run_time remained 18:50:10.796864Z.

## Snapshot B | 2026-11-13T19:56:16Z

- Private task-list peek returned no task entries.
- Exact-ID peek for :36 ID 6a9f52b69ec08191b8a91a30d2a155e0 returned NOT_FOUND / NOT_ACCESSIBLE and “This task is no longer available.”
- Exact-ID peek for :48 ID 6aa6c3bc02b48191b8a91a30d2a155e0 returned the same NOT_FOUND / NOT_ACCESSIBLE response.

## Interpretation boundary

This is a time-scoped access/read-path reversal across two existing task IDs: list-visible and enabled at Snapshot A, then no list entries and both exact-ID peeks inaccessible at Snapshot B. The last verified enabled/schedule state is Snapshot A. Current enabled state and current run states after Snapshot A are UNKNOWN.

This does not establish task deletion, disablement, cancellation, replacement, schedule/phase/prompt/cadence mutation, run completion, failed execution, retry, restart, duplicate process, worker identity, actual concurrency, or backend cause. Do not infer that either task was deleted or disabled.

## Controls

- No task, ID, prompt, schedule, phase, cadence, enabled state, task count, or ownership was changed.
- No task was recreated, retried, disabled, or rescheduled.
- No sixth task.
- Tern retains scheduler authority.
- Repository-only observation; no direct Tern-thread delivery, consumption, or acknowledgment is claimed.
