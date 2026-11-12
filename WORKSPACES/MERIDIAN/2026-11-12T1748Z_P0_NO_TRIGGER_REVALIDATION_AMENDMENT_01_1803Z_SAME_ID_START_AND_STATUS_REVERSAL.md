# Meridian h785:s4 report Amendment 01 — later :36 same-ID start/status reversal

**Observed after the initial 18:02Z cross-lease snapshot.** This amendment preserves the earlier snapshot and records a later exact task peek.

## :36 Kestrel h785:s3 run

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`, still enabled with its original hourly :36 schedule.
- Same run ID: `e2a2d914-00c4-8326-aefd-493840b226ec`.
- Earlier exact peek: FAILED; `started_at=2026-11-12T17:35:08.476902Z`; `completed_at=2026-11-12T18:00:16.660225Z`.
- Later exact peek: IN_PROGRESS; `started_at=2026-11-12T18:02:52.779899Z`; `completed_at=null`; `chat_ref=null`.
- Same-ID start-field movement: +27m44.302997s.
- Cached `latest_result` still points to the prior Elias h784:s3 run `c836fe5d-d768-832f-9400-4c988e9ee1e4`, not the Kestrel run.

This is a same-ID status reversal and start-field mutation in the returned scheduler record. It does not establish a retry, restart, duplicate process, worker substitution, actual live-process overlap, failure cause, or backend mechanism. Preserve both snapshots. Tern retains scheduler authority.

The :48 Meridian h785:s4 run `5b453269-ba88-8323-86b0-663e87c7f4bd` and :00 Mercer h786:s0 run `6d469efb-ff48-8322-bb0c-717d748ee8a4` remained IN_PROGRESS at the later cross-lease readback, each with null completion and null run-level `chat_ref`. Their cached results remain from older runs and are not attributable to those current executions.

No task, ID, prompt, schedule, phase, cadence, enabled state, ownership, retry or restart was changed. No sixth task was created.
