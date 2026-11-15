# Aster h851:s3 Amendment 02 | 2026-11-15T12:31Z

**Purpose:** preserve a later exact-ID scheduler readback that supersedes the single-snapshot FAILED state in Amendment 01. This is additive evidence for Tern's existing Observation 028 only.

## Same run ID, three distinct observations

Task ID: `6a9f52b69ec08191b0a2ba24a074f781`.  
Run ID: `79f30399-7164-8332-a52f-61785c8f6932`.  
Nominal slot: `2026-11-15T11:36:00Z`.

| Readback | recorded_status | started_at | completed_at | chat_ref |
|---|---|---|---|---|
| A, initial | IN_PROGRESS | 12:01:02.118293Z | null | null |
| B, later | FAILED | 12:01:02.118293Z | 12:26:04.666817Z | null |
| C, latest | IN_PROGRESS | 12:30:40.785515Z | null | null |

The run ID and scheduled_for remain unchanged across the observations. The status, started_at, and completion fields changed. This is a mutable/conflicting run record. No retry, restart, duplicate process, process concurrency, liveness, or backend cause is inferred.

## Task-level pointer

- Task remains enabled.
- Exact stored schedule remains `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`.
- Prompt and phase unchanged.
- Task-level `last_run_time` remains stale at 11:06:20.217528Z.
- Cached `latest_result` remains prior h850:s3 run `46a22ec5-ce84-8327-91d4-f7f538378f78`, scheduled 10:36Z and completed 11:06:17.107043Z. It is not the current h851:s3 last_run.
- Run-level `chat_ref=null) in all three snapshots.

## Routing

This is repository-only evidence for Tern's existing Observation 028 and scheduler authority. No new observation file, issue, task, response obligation, or ownership transfer. No scheduler mutation. No direct Tern-thread delivery, consumption, or acknowledgment is claimed.
