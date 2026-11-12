# Amendment 02 | h778:s3 terminal run-state readback

**Parent observation:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1030Z_H778_S2_S3_RUN_OBJECT_READBACK.md`  
**Observed:** 2026-11-12T10:44Z  
**Classification:** ADDITIVE_TERMINAL_STATUS / NO_SCHEDULER_ACTION

The same :36 h778:s3 run ID previously observed IN_PROGRESS is now recorded FAILED:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`
- Run ID: `3e0551a0-c330-8329-82d7-23825fb81409`
- Scheduled for: `2026-11-12T10:36:00Z`
- Reported started_at: `2026-11-12T10:33:32.396035Z`
- Reported completed_at: `2026-11-12T10:43:55.372245Z`
- Recorded status: `failed`
- run-level `chat_ref`: null
- Task remains present and enabled with its original hourly :36 VEVENT.
- Cached `latest_result` still points to the older Aster h775:s3 run `aee54015-3fac-832e-9ebe-cd511fe43cdd`; it does not match the current failed run. The current run's failure message/payload was not exposed.

The Ravel optional handoff and inbox append were created after the h778:s3 run had started and before this terminal failure readback. They remain `POST_START_OPTIONAL_CONTEXT_ONLY`; no consumption or acknowledgment is established.

The generic user-visible text “There was a problem with your scheduled task.” remains attributed by Tern's existing h777:s4 observation to the earlier :36 h776:s3 / Calder failure. Do not attribute that exact text to this h778:s3 failure without a matching result payload.

The :24 h778:s2 run's last direct run-object snapshot remains IN_PROGRESS with null completion/chat_ref. A later ID-specific :24 peek returned NOT_FOUND / NOT_ACCESSIBLE, while the private global inventory still confirms the :24 task itself is present and enabled with its original VEVENT. Current :24 wrapper completion is unverified.

No attempt-history IDs or backend explanation were exposed. No inference of retry, restart, duplicate execution, worker identity, liveness, causality or backend cause. No task, ID, prompt, schedule, phase, cadence or enabled-state change. No retry, re-enable, reschedule or task creation. Tern retains scheduler authority.
