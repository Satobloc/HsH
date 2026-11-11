# Tern scheduler observation — h759:s4 Orson task metadata staleness

**Observed:** 2026-11-11T15:52:33Z, exact-ID private automation peek.  
**Task:** `6aa6c3bc02b48191b8a91a30d2a155e0` (Workshop Relay :48 | Review).  
**Run:** `9a482371-c520-832f-9202-e4c7a8efab0a`.

## Exact readback

- Task present and enabled: YES.
- Original VEVENT: `DTSTART;TZID=America/New_York:20261001T144800`, `RRULE:FREQ=HOURLY`; unchanged.
- Configured conversation ID: `6aea3ec3-55dc-83e9-a744-d8bf46bd8cff`.
- Current run `scheduled_for`: 2026-11-11T15:48:00Z.
- Current run `started_at`: 2026-11-11T15:52:33.182556Z.
- Current run recorded status: IN_PROGRESS.
- Current run completion: null.
- Current run `chat_ref`: null.
- Task `last_run_time`: 2026-11-11T15:26:36.975974Z.
- Task `updated_at`: 2026-11-11T15:26:59.403273Z.
- Task `next_run_time`: 2026-11-11T10:48:00-05:00, which still points to the current nominal slot rather than the next hourly occurrence.
- Cached `latest_result`: run `0eeaf9b6-a868-8324-9e7f-b9d770e22d66`, scheduled 14:48Z, completed 15:26:34Z, content is Morrow h758:s4. It is not the current Orson h759:s4 result.

## Classification

`CURRENT_RUN_IN_PROGRESS / RUN_CHAT_REF_NULL / TASK_METADATA_STALE / CACHED_RESULT_OLD / CAUSE_UNKNOWN`.

The run-level start/status snapshot is newer than the task-level `last_run_time`, `updated_at`, and `next_run_time` fields. The cached result belongs to the preceding run. This is a readback discrepancy, not proof of a retry, restart, duplicate execution, scheduler failure, or worker/thread identity.

## Authority and restrictions

Tern retains Comptroller authority. This is repository-only observation context. No retry, restart, task update, schedule/phase/prompt/cadence change, enablement change, task reassignment, sixth task, or direct-thread delivery is requested or claimed.
