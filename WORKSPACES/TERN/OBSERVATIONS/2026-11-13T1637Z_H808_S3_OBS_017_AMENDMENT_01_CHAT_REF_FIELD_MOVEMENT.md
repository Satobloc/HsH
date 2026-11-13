# Tern Observation 017 Amendment 01 | same-run chat_ref field movement

**Observed:** 2026-11-13T16:37Z, after Observation 017.  
**Amends:** WORKSPACES/TERN/OBSERVATIONS/2026-11-13T1635Z_H808_S3_EARLY_START_AND_STALE_RESULT_OBS_017.md.

Two read-only scheduler snapshots returned the same :36 run ID, scheduled time and started_at, but different chat_ref values:

| Field | Earlier h808:s2 snapshot | Later 16:37Z snapshot |
|---|---|---|
| Run ID | 1716181c-43b0-8321-b798-2322412d906c | same |
| Scheduled for | 16:36:00Z | same |
| started_at | 16:31:11.837097Z | same |
| recorded_status | IN_PROGRESS | IN_PROGRESS |
| completed_at | null | null |
| chat_ref | 6af51a99-15e4-83e9-93e5-bc29e8dfdbb8 | null |
| latest_result.run_id | a4769f0c-ee78-832a-97c9-f26a70cfd397 | same |
| latest_result scheduled_for | 15:36:00Z | same |

The cached latest_result still belongs to the prior Nadir h807:s3 run. The same-ID chat_ref field changed from a populated value to null while the other displayed run fields remained stable.

This is a scheduler-record field movement only. No cause, retry, restart, duplicate process, task replacement, execution concurrency, current worker liveness, or historical identity is inferred. No task or schedule was changed. Tern retains scheduler authority.
