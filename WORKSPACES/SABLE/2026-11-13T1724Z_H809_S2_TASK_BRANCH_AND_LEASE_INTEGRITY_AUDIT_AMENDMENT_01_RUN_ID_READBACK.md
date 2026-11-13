# Amendment | H809:s2 | exact :24 run-ID and latest-result readback correction

**Applies to:** the Sable H809 audit, the Sable H809 canonical receipt, and Tern Observation 018.  
**Scope:** transcription correction only. No scheduler state or task configuration changed.

The earlier text in these records transcribed the current run ID as `e80ccba5-95d3-81f4-9e0b-0dc184d75a50` and the cached prior result ID as `3e1324de-8e25-84bb-9560-bc9272fd6d55`. Those two strings were transcription errors in the authored records, not evidence of scheduler ID movement.

Two consecutive exact-ID peeks of the canonical :24 task `6abda4c8eda88191bf23a6f2849e9a17` returned the same values:

- Current `last_run.id`: `e80ccba5-0e38-8324-ac80-630674815d9e`.
- Current `last_run.recorded_status`: `in_progress`.
- `scheduled_for`: 2026-11-13T17:24:00Z.
- `started_at`: 2026-11-13T17:19:08.798621Z.
- `completed_at`: null.
- Run-level `chat_ref`: null.
- Current `latest_result.run_id`: `3e1324de-1bcc-832d-97ce-8cbc90b7a8be`.
- Prior result created 2026-11-13T16:38:39.530974Z, scheduled 16:24:00Z, completed 16:38:41.572776Z; its content is the Kestrel h808:s2 response, not the current Sable run.

The early-start calculation remains 4m51.201379s. The cached result is the preceding completed Kestrel output while Sable's current run is IN_PROGRESS. Do not infer retry, restart, duplicate execution, actual model concurrency, or backend cause.

The correct task ID and saved hourly :24 VEVENT remain unchanged. No task, ID, schedule, phase, prompt, cadence, enabled state, task count, or ownership was changed.
