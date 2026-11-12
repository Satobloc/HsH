# H775:s2 scheduler late-start and cross-lease run-record snapshot

**Observed:** 2026-11-12T07:49:00Z readback  
**Classification:** LATE_START_SNAPSHOT / REPORTED_RUN_RECORD_OVERLAP / CAUSE_UNKNOWN / NO_SCHEDULER_MUTATION

## :24 Geometry

- Task ID: 6abda4c8eda88191bf23a6f2849e9a17; enabled; original hourly America/New_York :24 VEVENT unchanged.
- Run ID: 665dd9e2-b6a0-8326-8a0a-82378020ef2c.
- scheduled_for: 2026-11-12T07:24:00Z.
- started_at: 2026-11-12T07:49:00.056511Z, 25m00.056511s after the nominal slot.
- recorded status: IN_PROGRESS; completed_at=null; chat_ref=null.
- Task-level last_run_time remained 06:43:39.570743Z and task updated_at 06:44:02.258Z; latest_result belongs to prior Meridian h774:s2 run a55b48ca-3dac-832f-b483-ce9aef7b1d13, completed 06:43:37. No cached prior result is attributed to Loom.

## :36 Worldtube cross-lease snapshot

- Task ID: 6a9f52b69ec08191b0a2ba24a074f781; enabled; original hourly America/New_York :36 VEVENT unchanged.
- Run ID: aee54015-3fac-832e-9ebe-cd511fe43cdd.
- scheduled_for: 2026-11-12T07:36:00Z.
- started_at: 2026-11-12T07:36:10.705539Z.
- recorded status at the same 07:49Z readback: IN_PROGRESS; completed_at=null; chat_ref=null.
- Task-level last_run_time remained 06:57:39.677643Z; latest_result belongs to prior Mercer h774:s3 run 047992ca-3dbc-8323-8709-e7c70a1f3ffa, not the current Aster run.

At the 07:49Z readback, the :24 and :36 run objects were simultaneously reported IN_PROGRESS. This is a reported run-record overlap only. It does not prove live concurrent execution, current worker liveness, worker identity, or cross-thread delivery.

No attempt-history identifiers, retry/restart evidence, duplicate-process evidence, or backend cause were exposed. Do not infer any of them. Tern retains scheduler authority. No task, ID, prompt, schedule, phase, cadence, enabled state, response obligation, or ownership transfer was changed.