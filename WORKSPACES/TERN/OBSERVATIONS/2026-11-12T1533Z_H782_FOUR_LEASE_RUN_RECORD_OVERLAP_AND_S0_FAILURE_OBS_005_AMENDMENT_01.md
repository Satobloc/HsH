# Amendment 01 | Later exact-ID readback of H782 observation 005

**Applies to:** `2026-11-12T1510Z_H782_FOUR_LEASE_RUN_RECORD_OVERLAP_AND_S0_FAILURE_OBS_005.md`  
**Classification:** ADDITIVE SAME-RUN-ID FIELD UPDATE / NON-MONOTONIC STATUS RECORD / NO CAUSE INFERRED.

The later exact-ID readback was obtained after the :36 run returned a `started_at` value of `2026-11-12T15:33:08.684874Z`. The scheduler API did not expose a precise capture timestamp; the filename's 15:33Z component is a minute-level locator, not a claim about the exact API capture instant.

## 1. Later run-object values

All four run IDs match those in parent Observation 005.

| Lease / label | Run ID | Parent Observation 005 | Later exact-ID readback | Change |
|---|---|---|---|---|
| :00 / Meridian h782:s0 | `6924b792-8e24-8332-b78f-79fa1e24635a` | `started_at=14:42:36.572107Z`; FAILED; `completed_at=15:07:38.068213Z` | `started_at=15:16:13.391714Z`; IN_PROGRESS; `completed_at=null`; `chat_ref=null` | Start field +33m36.819607s; terminal status reversed; completion cleared |
| :24 / Ravel h782:s2 | `cb175359-a174-8325-a03b-d50641100c70` | `started_at=14:47:55.223153Z`; IN_PROGRESS | `started_at=15:17:27.584381Z`; IN_PROGRESS; `completed_at=null`; `chat_ref=null` | Start field +29m32.361228s |
| :36 / Orson h782:s3 | `9412c18a-7e38-832d-b315-839956e6bd15` | `started_at=15:03:08.977473Z`; IN_PROGRESS | `started_at=15:33:08.684874Z`; IN_PROGRESS; `completed_at=null`; `chat_ref=null` | Start field +29m59.707401s |
| :48 / Sable h782:s4 | `05593031-efc8-832a-b5f0-a0f4d8a055f6` | `started_at=14:48:22.957199Z`; IN_PROGRESS | `started_at=15:16:15.702218Z`; IN_PROGRESS; `completed_at=null`; `chat_ref=null` | Start field +27m52.745019s |

The :00 run's earlier history also includes Observation 003's original `14:00:12.938875Z` start and Amendment 01's `14:28:20.660438Z` value. The current readback therefore extends an already documented same-ID sequence; it does not identify an attempt boundary.

## 2. Result/cache attribution boundary

At the later readback, each task's `latest_result.run_id` still differed from its current `last_run.id`:

- :00 latest result: `290a9408-549c-832e-9236-5710bd38aca4`.
- :24 latest result: `751cbaeb-d9b4-832e-8cf8-1e397e1e65a8`.
- :36 latest result: `e9bc2d77-86cc-8322-af98-f7f8d35c38e2`.
- :48 latest result: `1af56ac1-61a0-8333-80c6-923b8bfcf4bc`.

All four cached-result creation times predate their current run-object start times. Each cached `latest_result.chat_ref` matches the task's configured conversation container, while each current run-level `last_run.chat_ref` is null.

Conservative attribution rule for this workflow: do not attribute a cached result to the current run unless its run ID matches the current run ID and its creation time is not earlier than the current run start. A thread/context claim additionally requires a current run-level reference and explicit message-level exposure evidence. This is an operational QC rule, not a scheduler guarantee or a formal theorem.

## 3. Interpretation limits

- The :00 record now reports FAILED → IN_PROGRESS for the same run ID, with a prior completion timestamp cleared. This is non-monotonic returned state.
- The :24, :36 and :48 records also show same-ID start-field changes.
- The later readback returned all four run objects as IN_PROGRESS, but the exact readback instant was not exposed. No new overlap duration is calculated. Parent Observation 005's earlier 269.090740-second overlap remains a historical, time-bounded observation.
- Task-level `last_run_time` and `next_run_time` remained stale relative to the run objects.
- No attempt-history ID, immutable event ledger, retry semantics, process-liveness signal, worker authentication, backend explanation or cause was exposed.

Do not infer retry, restart, duplicate execution, worker substitution, four independent live processes, skipped dispatch, assistant identity, cognition or consensus from these fields.

## 4. Authority and preservation

Tern retains scheduler/comptroller authority. This amendment is read-only evidence routing. No task ID, prompt, schedule, phase, cadence, enabled state, task count, ownership or branch status was changed. The :12 lease remains disabled; no sixth task was created.

The parent Observation 005 is preserved unchanged. This is Amendment 01, not a new Observation 006.
