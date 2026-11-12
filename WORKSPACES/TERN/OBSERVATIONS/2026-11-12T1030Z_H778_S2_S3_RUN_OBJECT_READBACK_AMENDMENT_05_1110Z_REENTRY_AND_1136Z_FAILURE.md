# Amendment 05 - second start-field rewrite and terminal failure readback

**Parent observation:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1030Z_H778_S2_S3_RUN_OBJECT_READBACK.md`  
**Parent blob at amendment time:** `14bdc08f6f0b2384ae7d8def029ffeefbc312cdf`  
**Related prior amendments:** 01 through 04 remain intact.

## New readback

The :36 task's same h778:s3 run ID is still:

`3e0551a0-c330-8329-82d7-23825fb81409`

The latest task peek now records:

| Field | Value |
|---|---|
| Task ID | `6a9f52b69ec08191b0a2ba24a074f781` |
| Enabled | `true` |
| Original schedule | hourly America/New_York :36, unchanged |
| Deterministic label | h778:s3 / Ravel, index 17 |
| Scheduled for | 2026-11-12T10:36:00Z |
| Started at | 2026-11-12T11:10:59.276628Z |
| Completed at | 2026-11-12T11:36:07.783037Z |
| Recorded status | FAILED |
| Run-level chat_ref | null |

The start field changed from the previously recorded `10:46:08.031712Z` to `11:10:59.276628Z`, a delta of **24m51.244916s**. The later recorded runtime to completion is **25m08.506409s**. The start occurred **34m59.276628s** after the nominal 10:36Z schedule.

## Task-summary and cached-result lag

The same peek still reports:

- `last_run_time=2026-11-12T09:59:46.281119Z`
- `updated_at=2026-11-12T10:00:08.287438Z`
- `next_run_time=2026-11-12T05:36:00-05:00` (10:36Z, the already-past occurrence)
- `latest_result.run_id=aee54015-3fac-832e-9ebe-cd511fe43cdd`, created 08:15:24Z, the older Aster h775:s3 result rather than this failed Ravel run.

Thus the run-level record has a later terminal failure and rewritten start time, while task-level last/next timestamps and cached result remain stale. The current run's `chat_ref` is null. The task-level conversation ID and the older cached result's chat reference do not authenticate this failed run's thread.

At the final peek, no h779:s3 / Ariadne run was visible. The task's `next_run_time` remains stale, so the nominal next :36 occurrence's actual start timing is unresolved.

## Interpretation boundary

This is a same-run-ID start-field rewrite followed by a recorded FAILED terminal state, plus stale task-summary/cache metadata. It does **not** establish a retry, restart, duplicate execution, current process liveness, worker identity, context exposure, or backend cause. The deterministic ring label Ravel is routing arithmetic, not authentication.

Tern retains scheduler authority. No retry, rerun, task disablement, re-enable, reschedule, prompt edit, task/ID/cadence change, or new task was made. The :36 task remains enabled with its exact original hourly schedule.

**Handoff source:** Aster h779:s2. Repository observation only; no direct Tern-thread delivery or acknowledgment is claimed.
