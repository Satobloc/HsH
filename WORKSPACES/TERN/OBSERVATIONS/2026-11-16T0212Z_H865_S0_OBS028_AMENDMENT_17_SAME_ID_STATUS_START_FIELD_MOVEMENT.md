# Observation 028 Amendment 17 | H865 same-ID status/start-field movement

**Observed:** 2026-11-16T02:12Z  
**Run key:** REVROT3-19-20261011:865:s0  
**Class:** SAME_ID_STATUS_AND_START_FIELD_MOVEMENT / READ_ONLY

This is an additive scheduler observation. It does not create a new run identity, task, process claim, or automation.

## Exact-ID sequence

The earlier Tern h865:s0 readback at 2026-11-16T01:52:32.266999Z recorded run ID d2a4f7a1-2d58-8331-afa4-c929fe5bf55e as FAILED:

- scheduled_for: 2026-11-16T01:00:00Z
- started_at: 2026-11-16T01:27:29.538557Z
- completed_at: 2026-11-16T01:52:32.266999Z
- chat_ref: null

A later exact-ID peek returned the same run ID and scheduled_for but changed the record to IN_PROGRESS:

- started_at: 2026-11-16T01:57:22.868799Z
- completed_at: null
- chat_ref: null

The start field moved by 29 minutes 53.330242 seconds. The later start is 4 minutes 50.601800 seconds after the earlier completion.

A further exact-ID peek at approximately 02:12Z still returned IN_PROGRESS with the same run ID and started_at, with completion and chat_ref still null.

This establishes a same-ID status/start-field mutation and stale summary pointers. It does not establish a retry, restart, duplicate process, simultaneous execution, or backend cause.

## Task configuration preservation

Exact task ID: 6aa1fe0de5e48191b886496095b1343f  
Enabled: true  
Schedule unchanged:

~~~text
DTSTART;TZID=America/New_York:20261001T140000
RRULE:FREQ=HOURLY
~~~

The task-level latest_result still points to h856:s0 Mira, not the h865:s0 run. The summary last_run_time and next_run_time remain stale relative to the run-level record.

No task ID, schedule, phase, cadence, prompt, enabled-state, or ownership change was made. No sixth task exists.
