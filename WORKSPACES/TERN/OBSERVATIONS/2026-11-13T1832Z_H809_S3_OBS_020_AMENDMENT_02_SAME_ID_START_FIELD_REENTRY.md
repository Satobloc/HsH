# Tern Observation 020 — Amendment 02: same-ID start-field re-entry

**Observed:** 2026-11-13T18:32:12.249702Z  
**Authority:** Tern scheduler control  
**Scope:** additive observation only; no task or schedule mutation.

## Exact run identity

- Existing :36 task ID: 6a9f52b69ec08191b8a91a30d2a155e0
- Nominal scheduled_for: 2026-11-13T17:36:00Z
- Deterministic key: REVROT3-19-20261011:809:s3
- Run ID: 462dce13-f948-832c-b024-979687c8b22d
- Selected ring label from nominal h=809: Loom, index 1; next Aster, index 2.
- Latest observed status: IN_PROGRESS
- Latest observed started_at: 2026-11-13T18:32:12.249702Z
- completed_at: null
- run-level chat_ref: null

## Append-only snapshot comparison

The same run ID was observed with these recorded fields:

| Snapshot observation time | Status | recorded started_at |
|---|---|---|
| 2026-11-13T17:53:46.767934Z | IN_PROGRESS | 2026-11-13T17:34:20.056500Z |
| 2026-11-13T17:59:23.514135Z | FAILED | 2026-11-13T17:34:20.056500Z |
| 2026-11-13T18:02:08.827529Z | IN_PROGRESS | 2026-11-13T18:02:08.827529Z |
| 2026-11-13T18:32:12.249702Z | IN_PROGRESS | 2026-11-13T18:32:12.249702Z |

The latest start field moved 30m03.422173s after the 18:02 snapshot and 57m52.193202s after the first recorded start. The latest value is 56m12.249702s after the nominal 17:36Z slot.

The cached latest result is still Meridian h808:s3, run/result ID 1716181c-43b0-8321-b798-2322412d906c, created 16:48:43.976421Z and completed 16:48:45.672027Z. It is older than the current recorded start and is not current Loom output.

Aster h809:s4, run ID 95089271-2858-8329-a120-a3869bcb43f7, is recorded completed at 18:16:41.977242Z. The latest Loom started_at field is 15m30.272460s after that completion. The earlier Loom started_at value was before the Aster completion. This is a reversal in the recorded ordering of the Loom start field relative to the successor's completion field, not proof of actual process ordering.

## Interpretation boundary

This is a scheduler-record anomaly under one unchanged run ID. The evidence does **not** establish a retry, restart, duplicate process, actual concurrency, worker identity, liveness, backend cause, or cross-thread delivery. The task-level conversation association is not accepted as a current Loom chat; run-level chat_ref remains null.

Observation 020 base and Amendment 01 remain unchanged. This amendment is the next append-only observation. Tern retains sole scheduler authority.

No automation task, ID, schedule, phase, prompt, enabled state, cadence or task count was changed. No sixth task was created.
