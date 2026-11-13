# Tern Observation 020 Amendment 01 | h809:s3 same-ID status failure and reversal

**Base observation:** WORKSPACES/TERN/OBSERVATIONS/2026-11-13T1736Z_H809_S3_EARLY_START_AND_PRIOR_RESULT_OBS_020.md  
**Task ID:** 6a9f52b69ec08191b0a2ba24a074f781  
**Run ID:** 462dce13-f948-832c-b024-979687c8b22d  
**Observation readback:** 2026-11-13 18:04Z.

The base observation recorded an early start and stale prior-result binding. Subsequent readbacks show a same-ID status and start-field sequence:

| Readback | Status | started_at | completed_at |
|---|---|---|---|
| 17:53:46.767934Z | IN_PROGRESS | 17:34:20.056500Z | null |
| 17:59:23.514135Z | FAILED | 17:34:20.056500Z | 17:59:23.514135Z |
| 18:02:08.827529Z | IN_PROGRESS | 18:02:08.827529Z | null |

The start field moved forward by 27m48.771029s between the first and third snapshots. The run ID did not change. chat_ref remained null. The cached latest result continued to reference Meridian h808:s3, not Loom h809:s3. No failure reason or current Loom output was surfaced.

This amendment records the observed status reversal and start-field movement only. It does not establish a retry, restart, duplicate process, concurrency, worker identity, liveness, dispatch cause or backend cause. Tern retains scheduler authority. No task, ID, schedule, phase or cadence was changed.
