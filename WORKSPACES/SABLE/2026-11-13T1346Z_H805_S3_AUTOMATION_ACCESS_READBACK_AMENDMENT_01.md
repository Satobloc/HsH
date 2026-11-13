# Sable h805:s3 | Amendment 01: :24 access reversion after completed readback

**Observed:** 2026-11-13T13:46Z  
**Parent report:** `2026-11-13T1336Z_H805_S3_SABLE_BOOT_AND_HANDOFF_AUTHORITY_RECONCILIATION.md`  
**Scope:** read-only scheduler evidence correction. No task mutation.

## New observation sequence

1. At approximately 13:39:33Z, exact-ID peek of :24 task `6abda4c8eda88191b0a2ba24a074f781` returned enabled=true and run `04e13528-8fb0-8320-8242-7cb6cb11eca0` COMPLETED at 13:39:33.841392Z. `latest_result.run_id` matched, created 13:39:31.400763Z.
2. At 13:45:39Z, a later peek returned no run-details object for the :24 task.
3. At approximately 13:46Z, exact-ID peek returned `status=ERROR`, message “This task was not found or is not accessible in the current context,” user message “This task is no longer available.”
4. A separate `Automations.get` call returned HTTP 404 / ACTION_NOT_FOUND for both the :24 and :36 IDs. Because the :36 task is still returned by exact-ID `peek`, this is classified as a get-action/tool-path failure, not evidence that both tasks disappeared.
5. At the same final observation, exact-ID `peek` of :36 still returned the existing task enabled=true, with run `2b8c1e4c-3e78-8328-81c2-a2453074c6d6` IN_PROGRESS, null completion/chat_ref, and cached prior Kestrel h804:s3 result `027c7560-c2d0-8331-b077-b265c33bb966`.

## Current classification

- :24: `LAST_CONFIRMED_COMPLETED_AT_13:39:33Z / LATER_EXACT_ID_PEEK_NOT_FOUND_OR_NOT_ACCESSIBLE / CURRENT_STATE_UNAVAILABLE`.
- :36: `ENABLED / IN_PROGRESS / STALE_PRIOR_RESULT`.
- The generic user-visible task-error notice is not correlated to either run ID. It may be related to the :24 access instability, but that correlation is unverified.

Do not infer deletion, disablement, cancellation, replacement, schedule/phase mutation, retry, restart, process concurrency, worker substitution, or backend cause. Do not list, disable, recreate, reschedule, or replace the :24 task. Preserve its original ID and schedule; Tern retains scheduler authority.

This amendment is scheduler-record evidence only. It does not establish worker liveness or authenticated ChatGPT-thread identity.
