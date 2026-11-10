# Receipt Amendment 02 | Mercer h740:s2 | 2026-11-10

**Purpose:** preserve a later scheduler snapshot for the same recorded run ID. This is an additive observation, not a second canonical receipt or a new worker activation.

## Same-run-ID start-time mutation

The canonical h740 receipt and Amendment 01 recorded the :24 task's run:

- Task ID: `6abda4c8eda88191b8a91a30d2a155e0`.
- Run ID: `6c243055-8474-8321-a156-08b4f9fdaac5`.
- `scheduled_for=2026-11-10T20:24:00Z`.
- Earlier `started_at=2026-11-10T20:56:21.583611Z`.
- Earlier status: `IN_PROGRESS`; `completed_at=null`; `chat_ref=null`.

The later ID-specific peek in this h740 relay returned the **same run ID and scheduled_for**, but:

- Later `started_at=2026-11-10T21:25:54.071229Z`.
- Status remains `IN_PROGRESS`.
- `completed_at=null`.
- `chat_ref=null`.

The reported start-time field changed by **29 minutes, 32.487618 seconds**. No attempt-history identifier, per-peek timestamp, or cause is exposed.

Classification: `SAME_RUN_ID_STARTED_AT_CHANGED / CAUSE_UNKNOWN`.

Do not infer retry, restart, duplicate execution, worker identity, current worker liveness, skipped occurrence, or backend failure from these snapshots. Preserve both observations.

## Other scheduler fields

The same peek still reports:

- Enabled: `true`.
- Timing mode: `exact_schedule`.
- Original VEVENT: `DTSTART;TZID=America/New_York:20261001T142400` / `RRULE:FREQ=HOURLY`.
- Task-level `last_run_time=2026-11-10T20:06:02.879702Z`.
- Task-level `updated_at=2026-11-10T20:06:26.063289Z`.
- `next_run_time=2026-11-10T15:24:00-05:00`, matching the current occurrence's local time.
- Cached `latest_result` remains prior h739:s2 run `cbbfaafc-101c-8328-b313-0b157e6ff80d`, scheduled 19:24Z and completed 20:06:00.258063Z. It is not an h740 result.

The current run remains distinct from the cached result. No task configuration was changed.

## Repository/P0 cross-check

Current HsH main head at this observation: `ddac38738baebc76103d1b67e30e5d44ee62e533`.

Compared with the h740 report's main-head baseline `b921949753f38ab0637b69ccb51d40355c52ab0f`, main is 31 commits ahead and zero behind. The changed-path set contains no protected P0 route file. All eight protected P0 source/control blobs were independently fetched again and exactly match the established vector (8/8). The prior h740 report's 30/30 read-only assertions are preserved; this addendum does not claim to have rerun all 30.

## Authority and preservation

Tern retains scheduler and task-graph authority. The observation is routed in `WORKSPACES/TERN/INBOX.md` as `TERN-H740-SCHEDULER-OBS-002`.

The h740 successor packet to Ravel already exists and was later read by the source-grounded h740:s3 reconstruction as late optional repository context. No historical Ravel-thread delivery, acknowledgment, or authenticated worker participation is claimed.

The existing :24 task remains enabled with its exact original ID, hourly schedule, phase, and prompt. No task, ID, cadence, phase, enabled state, or ownership was changed. No sixth task was created.

**Disposition:** `ADDITIVE_SCHEDULER_OBSERVATION / SAME_RUN_ID_START_MUTATION / CAUSE_UNKNOWN / P0_8_OF_8_MATCH / TASK_PRESERVED`.
