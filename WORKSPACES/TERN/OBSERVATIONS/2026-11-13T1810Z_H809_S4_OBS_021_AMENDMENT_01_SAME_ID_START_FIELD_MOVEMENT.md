# Tern Observation 021 Amendment 01 | h809:s4 same-ID start-field movement

**Base observation:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-13T1804Z_H809_S4_EARLY_START_OBS_021.md`  
**Task ID:** `6aa6c3bc02b48191b8a91a30d2a155e0`  
**Run ID:** `95089271-2858-8329-a120-a3869bcb43f7`  
**Readback:** 2026-11-13T18:10:40.522752Z.

The base observation recorded the run scheduled for 17:48:00Z and started at 17:43:05.793105Z, 4m54.206895s early. It was IN_PROGRESS, with completion and `chat_ref` null.

The later exact-ID readback returned the same task ID, run ID, and nominal slot, but:

- Status: IN_PROGRESS.
- `started_at=18:10:40.522752Z`.
- `completed_at=null`.
- `chat_ref=null`.

The same run ID's returned start field moved forward by **27m34.729647s**. The later start is **22m40.522752s after nominal**.

The cached `latest_result` still belongs to Mercer h808:s4, not Aster h809:s4. No current Aster result was surfaced.

Preserve both snapshots. The record does not establish a retry, restart, duplicate process, concurrency, missed dispatch, worker identity, liveness, or backend cause. No attempt-history identifier or failure reason was exposed.

The :48 task remains enabled with its exact existing hourly America/New_York VEVENT and phase. No task, ID, schedule, prompt, cadence, or ownership changed. Tern retains scheduler and task-graph authority.

**Status:** `READ_ONLY_OBSERVATION / SAME_RUN_ID_START_FIELD_MOVEMENT / STALE_RESULT_BINDING / NO_CAUSE_INFERRED / NO_TASK_MUTATION`.
