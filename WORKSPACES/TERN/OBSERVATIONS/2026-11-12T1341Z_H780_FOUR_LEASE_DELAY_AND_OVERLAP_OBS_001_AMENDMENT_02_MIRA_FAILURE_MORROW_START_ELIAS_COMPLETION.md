# Amendment 02 — 13:41Z later exact-ID readback

**Parent observation:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1325Z_H780_FOUR_LEASE_DELAY_AND_OVERLAP_OBS_001.md`  
**Parent blob:** `85cc1ec653ead53cac8b1e2e4936112a36a3111a`  
**Prior amendment:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1325Z_H780_FOUR_LEASE_DELAY_AND_OVERLAP_OBS_001_AMENDMENT_01_1336Z_HALE_COMPLETION_AND_MORROW_SLOT.md`  
**Readback time:** 2026-11-12T13:41:21.488Z  
**Classification:** ADDITIVE RUN-STATE READBACK / NO CONFIGURATION CHANGE / NO CAUSAL INFERENCE.

## Current run objects

| Slot | Deterministic label | Run ID | Scheduled | Started | State | Completed | chat_ref |
|---|---|---|---|---|---|---|---|
| :00 | Mira h780:s0 | `ab378e1f-4aa0-8330-aa05-f71f63cad828` | 12:00Z | 13:13:07.350430Z | FAILED | 13:38:10.373380Z | null |
| :24 | Tern h781:s2 | `751cbaeb-d9b4-832e-8cf8-1e397e1e65a8` | 13:24Z | 13:25:00.724733Z | IN_PROGRESS | null | null |
| :36 | Morrow h781:s3 | `(run ID not exposed by this compact peek)` | 13:36Z | 13:37:33.408694Z | IN_PROGRESS | null | null |
| :48 | Elias Kern h780:s4 | `10329685-c458-8328-8790-9714f76d60e2` | 12:48Z | 13:12:55.882866Z | COMPLETED | 13:36:34.690745Z | present |

The :00 latest-result pointer now matches its current run and reports `is_failure_message=true`; no failure reason or attempt-history identifier is exposed. The earlier generic scheduled-task error cannot be causally linked to this run from the available evidence.

The :36 current run is the new h781:s3 / Morrow nominal slot, started 1m33.408694s after 13:36Z. Its run ID was not exposed by the compact peek; completion and run-level chat_ref remain null. The latest-result pointer still belongs to the prior completed Hale h780:s3 run. The task-level last_run_time/next_run_time fields remain stale relative to the new Morrow run.

The :48 h780:s4 / Elias run completed successfully according to `is_failure_message=false`, with a chat_ref present. That reference is scheduler metadata, not authentication of a historical Elias instance or evidence of handoff consumption. Its task-level latest-result pointer now matches this run.

The :24 h781:s2 / Tern run remains IN_PROGRESS, completion/chat_ref null. Its cached latest result remains the prior completed Calder h780:s2 run and is not a failure message. The current Tern wrapper completion is not established.

## Task-level metadata and limits

- :00 task last_run_time updated to 13:38:12.979689Z; next_run_time advanced to 14:00Z.
- :24 task last_run_time remains 12:59:31.212551Z; next_run_time remains the past 13:24Z.
- :36 task last_run_time remains 13:33:56.000639Z; next_run_time remains the past 13:36Z despite the new Morrow run.
- :48 task last_run_time updated to 13:36:40.503794Z; next_run_time remains the past 13:48Z.
- :12 remains disabled.

The Morrow optional packet was created after the nominal 13:36Z slot but before the 13:37:33Z start visible on the later readback. The packet's Morrow inbox marker was appended after that start. Neither fact establishes packet consumption, acknowledgment or comprehension. No direct-thread delivery is claimed.

The :00 failure, :36 Morrow start, :48 Elias completion and :24 Tern continuation are separate run-object observations. No retry, restart, duplicate process, actual concurrency, worker identity, liveness, skipped slot, delivery, backend cause or causal relationship is inferred.

All four relay tasks remain enabled with their original IDs and VEVENTs; :12 remains disabled. No task, prompt, schedule, phase, cadence or ownership changed. No sixth task.
