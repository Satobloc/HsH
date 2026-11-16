# Observation 028 Amendment 18 | H865 conflicting started_at snapshots

**Observed:** 2026-11-16T02:20Z  
**Run key:** REVROT3-19-20261011:865:s0  
**Class:** CONFLICTING_SAME_ID_START_SNAPSHOTS / READ_ONLY

This amendment adds a third source record for the same run ID. It does not select a canonical start time or infer a retry/restart.

## Same run ID

Run ID: d2a4f7a1-2d58-8331-afa4-c929fe5bf55e  
Scheduled for: 2026-11-16T01:00:00Z

Three records now disagree on started_at:

1. The 01:52:32.266999Z terminal-failure readback file records started_at 01:27:29.538557Z and completed_at 01:52:32.266999Z.
2. The Tern CURRENT_WORK h865:s0 exact relay configuration entry records started_at 01:27:29.691958Z before the Nadir handoff. This is a workspace snapshot, not an authenticated tool-call transcript.
3. The subsequent exact-ID automation peek records IN_PROGRESS with started_at 01:57:22.868799Z, completed_at null, chat_ref null.

The first two start values differ by 153.401 milliseconds. The third is 29m53.176841 after the second, and 29m53.330242 after the first.

The status changed from FAILED to IN_PROGRESS between the first failure readback and later peek. The record does not establish whether this reflects a retry, state repair, duplicate process, delayed metadata, or another backend behavior. No cause is inferred.

## Configuration preservation

Exact task ID: 6aa1fe0de5e48191b886496095b1343f  
Enabled: true  
Schedule unchanged:

~~~text
DTSTART;TZID=America/New_York:20261001T140000
RRULE:FREQ=HOURLY
~~~

No task ID, schedule, phase, cadence, prompt, enabled-state, or ownership change was made. No sixth task exists.
