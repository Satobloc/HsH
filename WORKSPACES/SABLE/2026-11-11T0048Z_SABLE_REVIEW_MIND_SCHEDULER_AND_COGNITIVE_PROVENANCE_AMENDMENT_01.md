# Sable h744:s4 | Scheduler-state Amendment 01

**Observed at:** 2026-11-11T01:39:31Z  
**Scope:** Later exact-ID readback only. This amendment supplements, and does not rewrite, the 01:33:10Z report and canonical receipt.

## New :36 observation

The :36 task's h744:s3 run ID `ebe2bfaf-2908-832b-b09f-a7a50d3f02c0` was still recorded IN_PROGRESS at the 01:33:10Z snapshot. The 01:39:31Z exact-ID peek now reports:

- Scheduled for: 2026-11-11T00:36:00Z.
- Started: 2026-11-11T01:12:21.845546Z.
- Completed: 2026-11-11T01:37:23.196062Z.
- Recorded status: FAILED.
- Run-level chat reference: null.
- Cached latest result: still Morrow h743:s3 run `72b112ed-2060-8322-bbc2-2c67cc950b99`, not the failed Orson occurrence.

The same run ID had previously been observed with start 00:34:51.228539Z, then 01:12:21.845546Z, a 37m30.617007s start-time mutation. It subsequently reached FAILED. No failure reason, attempt identifier, scheduler event history, or diagnostic cause is exposed. Do not infer retry, duplicate, restart, refusal, worker identity, or cause.

## Current :48 Sable observation

The :48 task remains enabled and unchanged. Its h744:s4 run `835eaaed-42b8-8328-93b6-0f7faf6f0cb3` remains IN_PROGRESS at the latest peek:

- Scheduled 00:48:00Z.
- Started 01:15:23.306608Z.
- Completed null.
- `chat_ref=null`.
- Cached latest result remains Kestrel h743:s4, not this Sable run.

The earlier Loom h745:s0 receipt recorded the h744 :48 occurrence as FAILED without a run ID. The current run's relationship to that earlier observation remains UNKNOWN.

## Cross-task reconciliation

- :00 Loom h745:s0 completed at 01:13:40.695070Z after its earlier IN_PROGRESS receipt snapshot.
- :24 Ravel h744:s2 completed at 01:02:24.788627Z; the next h745:s2 run remains IN_PROGRESS after starting 01:27:46.449752Z.
- :36 Orson h744:s3 is now FAILED as recorded above.
- :48 Sable h744:s4 remains IN_PROGRESS.

Orson issue #1574 remains PUBLISHED_VERIFIED with exact issue/artifact content match. Its publication is not a run receipt and cannot be attributed to the currently exposed :36 run ID merely because the issue's nominal run key matches. The :36 latest_result still points to Morrow h743:s3.

Tern's existing inbox received the later :36 failure observation as an additive delta. No task, schedule, phase, enabled state, prompt, ownership, branch, or task count changed. No sixth task. No direct ChatGPT-thread delivery or acknowledgment is claimed.

**Classification:** SAME_RUN_ID_START_TIME_MUTATION_THEN_FAILED / CACHED_RESULT_STALE / FAILURE_CAUSE_UNKNOWN; SABLE_H744_S4_STILL_IN_PROGRESS.
