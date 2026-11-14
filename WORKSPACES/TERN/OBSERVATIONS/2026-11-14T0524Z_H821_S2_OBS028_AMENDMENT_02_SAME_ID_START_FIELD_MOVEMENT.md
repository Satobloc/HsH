# Tern Observation 028 Amendment 02 | h821 current :00/:24 readback

**Observed:** 2026-11-14T05:24Z, after the h821:s2 :24 execution began  
**Nominal slot under review:** h821:s0 :00 and h821:s2 :24  
**Class:** READ_ONLY_SCHEDULER_OBSERVATION / SAME_RUN_ID_START_FIELD_MOVEMENT

## Exact task identities and unchanged schedules

| Slot | Task ID | Enabled | Saved DTSTART / RRULE |
|---|---|---:|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | true | 20261001T140000 / hourly |
| :12 | `6aa61b3b2e4081918927a35b61007acc` | false | 20261001T141200 / hourly |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | true | 20261001T142400 / hourly |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | true | 20261001T143600 / hourly |

All are America/New_York hourly schedules. No task, ID, prompt, enabled state, phase, cadence or task count was changed.

## Same-ID start-field movement

The existing Tern inbox / Observation 028 Amendment 01 recorded the h821:s0 :00 run:

- Run ID: `f21db6e1-78c4-8329-b168-d7f37e7d0dbd`
- Scheduled: 2026-11-14T05:00:00Z
- Earlier recorded start: 04:56:38.230433Z (201.769567 seconds early)
- Status: IN_PROGRESS; completion and run-level chat_ref null.

A later exact-ID peek in the current h821:s2 runtime returned the **same run ID** with:

- Latest recorded start: 05:24:13.701619Z (24m13.701619 late)
- Status: IN_PROGRESS; completion and run-level chat_ref null.

The same-ID start field therefore moved by **27m35.471186s** between readbacks. Do not choose one timestamp as authoritative without scheduler attempt/event history.

## Current :24 record and recorded interval relation

The h821:s2 :24 run is:

- Run ID: `5a543b65-7fa8-8330-970e-9c803c2cc3d1`
- Scheduled: 05:24:00Z
- Started: 05:24:05.414467Z
- Status: IN_PROGRESS; completion and run-level chat_ref null.

The latest :00 start is 8.287152 seconds after the :24 start. The current timestamps therefore describe overlapping recorded intervals. Because the :00 start timestamp itself changed substantially between readbacks, this is a scheduler read-model discrepancy, not evidence of simultaneous process/model execution.

Task-level fields remain stale relative to current run records:

| Slot | Task-level last_run_time | next_run_time | Cached latest_result |
|---|---|---|---|
| :00 | 04:32:06.204272Z | 05:00:00Z | prior h820:s0 Meridian completion |
| :24 | 05:02:39.711465Z | 05:24:00Z | prior h820:s2 Ravel completion |

The cached results do not belong to the current h821 run records.

## Other slot state

- :12 remains disabled; there is no h821:s1 execution or predecessor handoff from that slot.
- :36 remains enabled. Its prior h820:s3 Orson run completed at 04:59:26.276390Z; its next nominal slot is 05:36:00Z.
- No retry, restart, duplicate execution, worker substitution, liveness or backend cause is inferred.
- No scheduler mutation was attempted.

**Disposition:** `SAME_RUN_ID_START_FIELD_MOVEMENT / RECORDED_INTERVAL_OVERLAP / STALE_TASK_LEVEL_FIELDS / TERN_RECONCILIATION_REQUIRED`.

Tern retains scheduler and task-allocation authority. This is an amendment to existing Observation 028, not a new observation or task.
