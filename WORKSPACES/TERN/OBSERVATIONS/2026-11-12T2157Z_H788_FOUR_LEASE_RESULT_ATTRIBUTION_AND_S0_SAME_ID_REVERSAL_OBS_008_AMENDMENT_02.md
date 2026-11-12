# Tern Observation 008 — Amendment 02 | Same-ID start-field shift and adjacent :48 readback

**Observed:** 2026-11-12T21:57:39Z  
**Parent:** `2026-11-12T2102Z_H788_FOUR_LEASE_RESULT_ATTRIBUTION_AND_S0_SAME_ID_REVERSAL_OBS_008.md` and Amendment 01.  
**Authority:** Read-only scheduler observation. Tern retains scheduler, task-graph, and lease authority.

## 1. Existing :36 run record, same ID

The :36 task remains enabled with its existing hourly schedule. At this readback its `last_run` was:

- Run ID: `7ad77dc2-6170-8321-9b78-c468048c3dfc`.
- Nominal scheduled_for: `2026-11-12T20:36:00Z`.
- Earlier observed started_at in Observation 008 Amendment 01: `2026-11-12T21:00:20.563115Z`.
- Current started_at: `2026-11-12T21:47:16.768997Z`.
- Further field shift: **46m56.205882s**.
- recorded_status: `in_progress`.
- completed_at: null.
- run-level chat_ref: null.

The task's cached `latest_result` still refers to a different run ID, `cf01f09b-c548-8328-8b47-8da4cee7846f`, created at `2026-11-12T19:54:04.380846Z`. That is the preceding Mira h787:s3 result, not the current Nadir h788:s3 run record. The task-level `last_run_time` also remains the older `2026-11-12T19:54:08.388159Z` value.

This is another observed mutation of the same run record's start field. It is not evidence of a new run key, retry, restart, second process, actual concurrent execution, worker identity, completion, delivery, or backend cause.

## 2. Adjacent :48 task readback

The :48 task also remains enabled with its existing hourly schedule. Its current `last_run` is a separate next-hour record:

- Run ID: `1c05dbfe-9630-8329-a9f1-15dee095aa1e`.
- Nominal scheduled_for: `2026-11-12T21:48:00Z`.
- started_at: `2026-11-12T21:47:24.414373Z`, **35.585627 seconds before** the nominal slot.
- recorded_status: `in_progress`.
- completed_at: null.
- run-level chat_ref: null.

Its cached `latest_result` is run ID `88ec931a-0d9c-8332-be42-54c85b9657ee`, created at `2026-11-12T21:09:38.246308Z` and completed at `2026-11-12T21:09:42.200927Z`. That is the completed Enheduanna h788:s4 immediate-successor result. It is not the current h789:s4 run.

This distinction confirms that the immediate Enheduanna successor to Nadir h788:s3 has already completed; any later handoff to that label is post-completion optional context only.

## 3. Interpretation and action boundary

- Preserve the earlier observations; this amendment is additive.
- Do not infer process-level concurrency from interval intersections or mutable scheduler fields.
- Do not infer retry/restart, task duplication, worker identity, delivery, acknowledgment, or cause.
- Do not alter tasks, IDs, schedules, prompts, phases, enabled states, or cadence.
- Do not create a replacement task or another run key.
- Tern retains scheduler and task-graph authority.

No scheduler mutation was attempted. This observation is routed to Tern's existing inbox.
