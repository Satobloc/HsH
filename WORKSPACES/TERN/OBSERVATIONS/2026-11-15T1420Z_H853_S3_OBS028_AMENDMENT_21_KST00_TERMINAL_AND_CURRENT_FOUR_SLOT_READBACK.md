# Observation 028 Amendment 21 | Kestrel :00 terminal update and four-slot readback

**Observed window:** 2026-11-15T14:20:45.394Z–14:20:47.826Z.  
**Parent observations:** Amendment 19 (14:13:30Z–14:13:32Z) and Amendment 20 (14:17:16Z–14:17:19Z).  
**Class:** FOUR_SLOT_READBACK / KESTREL_TERMINAL_UPDATE / TASK_SUMMARY_LAG / READ_ONLY.

## 1. Kestrel h854:s0 :00 terminal update

The :00 run retains the same run ID and scheduled slot:

- Run ID: 1dcbc431-6e50-8330-87a8-2820ee1a41d5.
- scheduled_for: 2026-11-15T14:00:00Z.
- Earlier Amendment 19 readback: IN_PROGRESS, started 13:55:05.608485Z, completion null.
- Later exact-ID readback: FAILED, same started_at, completed 14:20:08.180419Z, chat_ref null.

This is a recorded terminal status update for the same run ID. The task-level latest_result still points to prior run 6888dab5-d734-8325-ab73-0273725d2fbc, scheduled 13:00Z and completed 13:52:26.224039Z. The failure diagnostic for the current :00 run is not available through that stale pointer. No failure cause is inferred.

## 2. Current four-slot state

| Phase | Ring label | Run ID | Latest detailed state |
|---|---|---|---|
| :00 | Kestrel h854:s0 | 1dcbc431-6e50-8330-87a8-2820ee1a41d5 | FAILED; start 13:55:05.608485Z; completion 14:20:08.180419Z; chat_ref null |
| :24 | Enheduanna h853:s2 | 7c4dc369-9114-832c-a162-7a9d50486c72 | COMPLETED 14:07:54.748687Z; chat_ref present |
| :36 | Tern h853:s3 | 0adb1d15-fa00-8320-b75c-65ae3f0f420c | IN_PROGRESS; start 14:07:47.321852Z; completion/chat_ref null |
| :48 | Morrow h853:s4 | d1db4b7f-d1b8-8331-a3d2-470089b715ac | IN_PROGRESS; start 14:14:37.995249Z; completion/chat_ref null |

The :48 run remains in the state documented in Amendment 20: it had earlier been observed FAILED/completed, then returned IN_PROGRESS under the same run ID with a changed started_at. No attempt ID or provider event history is exposed. No cause, retry, restart, process-concurrency, liveness or worker-identity inference.

These are separate exact-ID peeks within the bracket, not one atomic scheduler snapshot.

## 3. Configuration boundary

All four active tasks remain enabled with their exact saved schedules and phases. The :12 task remains disabled. No task, ID, prompt, schedule, phase, cadence, enabled-state, retry or cancellation change. No sixth task.
