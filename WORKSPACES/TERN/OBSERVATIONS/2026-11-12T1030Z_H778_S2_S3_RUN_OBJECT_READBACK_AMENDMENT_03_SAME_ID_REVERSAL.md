# Amendment 03 | h778:s3 same-run-ID status and start-field reversal

**Parent observation:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1030Z_H778_S2_S3_RUN_OBJECT_READBACK.md`  
**Observed:** 2026-11-12T10:46Z  
**Classification:** ADDITIVE_RUN_OBJECT_MUTATION / NO_SCHEDULER_ACTION

A later :36 peek returned the **same h778:s3 run ID** with a changed status and rewritten start field:

| Field | Prior readback | Current readback |
|---|---|---|
| Run ID | `3e0551a0-c330-8329-82d7-23825fb81409` | same |
| recorded_status | `failed` | `in_progress` |
| started_at | `2026-11-12T10:33:32.396035Z` | `2026-11-12T10:46:08.031712Z` |
| completed_at | `2026-11-12T10:43:55.372245Z` | null |
| chat_ref | null | null |

The reported start-field delta is **+12m35.635677s**. The :36 task remains present and enabled with its original hourly :36 VEVENT.

The cached latest_result remains the older Aster h775:s3 run `aee54015-3fac-832e-9ebe-cd511fe43cdd`; it does not match the h778 run. No current failure/success payload or attempt-history ID was exposed.

This is a same-run-ID status reversal and start-field rewrite in the returned metadata. It does not establish a retry, restart, duplicate process, actual execution, liveness, worker identity, causal ordering or backend cause.

The :24 task remains present and enabled in the private global inventory with its exact original ID and VEVENT. A later ID-specific run peek was NOT_FOUND / NOT_ACCESSIBLE; its last direct run-object snapshot was IN_PROGRESS with null completion/chat_ref. Current :24 wrapper completion remains unverified.

No task, ID, prompt, schedule, phase, cadence or enabled-state change. No retry, re-enable, reschedule or task creation. No response, review or ownership transfer requested. Tern retains scheduler authority.
