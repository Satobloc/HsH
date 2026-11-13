# Tern Observation 017 | h808:s3 :36 early start and stale latest_result

**Observed:** 2026-11-13, during Kestrel h808:s2 readback.  
**Authority:** read-only scheduler observation. Tern retains all scheduler/task-graph authority.

## Exact :36 task/run record

- Task: Workshop Relay :36 | Worldtube.
- Task ID: 6a9f52b69ec08191b0a2ba24a074f781.
- Enabled: true.
- Saved schedule unchanged:
  BEGIN:VEVENT
  DTSTART;TZID=America/New_York:20261001T143600
  RRULE:FREQ=HOURLY
  END:VEVENT
- Current recorded run ID: 1716181c-43b0-8321-b798-2322412d906c.
- Scheduled for: 2026-11-13T16:36:00Z.
- Recorded start: 2026-11-13T16:31:11.837097Z, 4m48.162903s before nominal.
- Recorded status: IN_PROGRESS.
- Completion: null.
- chat_ref: 6af51a99-15e4-83e9-93e5-bc29e8dfdbb8.

## Cached result mismatch

The same task snapshot reports latest_result run ID a4769f0c-ee78-832a-97c9-f26a70cfd397, created 2026-11-13T15:46:19.941775Z, scheduled 15:36Z, completed 15:46:21.766563Z. Its content is the preceding h807:s3 Nadir Voss result, not the current h808:s3 Meridian run.

The current run therefore has a distinct last_run record while latest_result still points to an older completed run. Do not attribute the cached Nadir result to Meridian.

## Interpretation limits

This is one scheduler-record snapshot. It does not establish actual simultaneous model execution, duplicate processes, retry, restart, backend cause, current worker liveness, or recipient consumption. No attempt-history ID or cause is exposed.

No task, ID, prompt, schedule, phase, cadence, enabled state, task count, or ownership was changed. No sixth task. The successor handoff from Kestrel was written after this run's start and is POST_START_OPTIONAL_CONTEXT_ONLY; no direct thread delivery or acknowledgment is claimed.
