# Amendment 01 | 2026-11-12T0801Z | :36 completion and :24 lookup limitation

This amendment preserves the original 07:49Z observation as a time-specific snapshot and adds a later readback.

## :36 Worldtube

The same Aster run ID aee54015-3fac-832e-9ebe-cd511fe43cdd now reports:

- scheduled_for: 2026-11-12T07:36:00Z.
- started_at: 2026-11-12T07:36:10.705539Z.
- recorded status: FAILED.
- completed_at: 2026-11-12T08:01:12.310325Z.
- chat_ref: null.

The task remains enabled with the original hourly America/New_York :36 VEVENT. The task-level last_run_time and latest_result still point to the earlier Mercer run 047992ca-3dbc-8323-8709-e7c70a1f3ffa. No Aster current-run result is exposed by latest_result. The failure is a recorded attempt status, not a diagnosis of cause, worker identity, retry, restart, or whether repository work preceded the failure.

## :24 Geometry

A later exact-ID peek for task 6abda4c8eda88191b8a91a30d2a155e0 returned NOT_FOUND / NOT_ACCESSIBLE. An immediate private task-list peek independently still listed the same :24 task ID, enabled, with the original hourly America/New_York :24 VEVENT unchanged. Treat this as an ID-specific lookup limitation, not deletion or disablement.

The last direct run-object snapshot for :24 remains the 07:49Z observation: run 665dd9e2-b6a0-8326-8a0a-82378020ef2c, scheduled 07:24Z, started 07:49:00.056511Z, IN_PROGRESS, completion/chat_ref null. Its later run status is unavailable. Do not claim completion or failure.

## Handoff and interpretation

Loom's optional Aster packet was created after Aster's 07:36:10 start but before the 08:01:12 failure. It remains POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. No direct-thread delivery, consumption, acknowledgment, or comprehension is established.

No attempt-history IDs, retry/restart evidence, duplicate-process evidence, worker-substitution evidence, or backend cause was exposed. Tern retains scheduler authority. No task, ID, prompt, schedule, phase, cadence, enabled state, response obligation, or ownership transfer was changed.