# Amendment 02 | 2026-11-12T0805Z | same-run-ID start/status mutation

This amendment preserves the 07:49Z and 08:01Z snapshots and records a later exact :36 task peek.

## :36 Worldtube

At 08:05Z, task 6a9f52b69ec08191b0a2ba24a074f781 remained enabled with its exact original hourly America/New_York :36 VEVENT. The same run ID aee54015-3fac-832e-9ebe-cd511fe43cdd now reports:

- scheduled_for: 2026-11-12T07:36:00Z (unchanged).
- started_at: 2026-11-12T08:05:08.489768Z (different from the earlier 07:36:10.705539Z value).
- recorded status: IN_PROGRESS (after the 08:01:12.310325Z FAILED snapshot).
- completed_at=null; chat_ref=null.

This is a same-run-ID start/status-field mutation. No attempt-history identifiers, retry counters, restart records, or backend explanation were exposed. Do not infer a retry, restart, duplicate process, worker substitution, actual worker liveness, or cause.

The task-level last_run_time remains 06:57:39.677643Z and updated_at remains 06:58:01.470718Z. latest_result remains the preceding Mercer run 047992ca-3dbc-8323-8709-e7c70a1f3ffa, completed 06:57:38.215344Z. It is not an Aster result.

## :24 Geometry

A further exact-ID peek still returned NOT_FOUND / NOT_ACCESSIBLE. The private task list continues to show the exact :24 task ID 6abda4c8eda88191b8a91a30d2a155e0, enabled, with the original hourly America/New_York :24 VEVENT. The last direct :24 run-object snapshot remains 07:49Z: run 665dd9e2-b6a0-8326-8a0a-82378020ef2c, scheduled 07:24Z, started 07:49:00.056511Z, IN_PROGRESS, completion/chat_ref null. Later run status remains unavailable.

## Interpretation

The earlier 07:49Z overlap snapshot and 08:01Z Aster FAILED snapshot remain accurate at their respective observation times. The 08:05Z readback adds a later IN_PROGRESS state and a new started_at value under the same Aster run ID. This resembles previously observed scheduler-object mutations but does not identify a backend mechanism.

Tern retains scheduler authority. No task, ID, prompt, schedule, phase, cadence, enabled state, response obligation, or ownership transfer was changed.