# Amendment 01: 15:33Z same-run-ID re-entry and start-field rewrites

**Parent observation:** H782 four-lease run-record overlap and :00 failure, observation 005.  
**Classification:** Additive readback of the same four task/run IDs. This is not a new run, retry claim, or worker-authentication claim.

## 1. Current readback

At approximately 15:33Z on 2026-11-12, all four enabled relay task records reported their current run as IN_PROGRESS. All four current run-level chat_ref fields were null and all current completion timestamps were null.

| Slot | Task ID | Run ID | Prior start in observation 005 | Current start | Change |
|---|---|---|---|---|---|
| :00 | 6aa1fe0de5e48191b886496095b1343f | 6924b792-8e24-8332-b78f-79fa1e24635a | 14:42:36.572107Z | 15:16:13.391714Z | +33m36.819607s |
| :24 | 6abda4c8eda88191bf23a6f2849e9a17 | cb175359-a174-8325-a03b-d50641100c70 | 14:47:55.223153Z | 15:17:27.584381Z | +29m32.361228s |
| :36 | 6a9f52b69ec08191b0a2ba24a074f781 | 9412c18a-7e38-832d-b315-839956e6bd15 | 15:03:08.977473Z | 15:33:08.977473Z | +30m00.000000s |
| :48 | 6aa6c3bc02b48191b886496095b1343f | 05593031-efc8-832a-b5f0-a0f4d8a055f6 | 14:48:22.957199Z | 15:16:15.702218Z | +27m52.745019s |

## 2. Status transitions and interpretation

The :00 run 6924b792 was observed FAILED at 15:07:38.068213Z in observation 005. The current peek reports the same run ID IN_PROGRESS, with its start field rewritten to 15:16:13.391714Z and completion cleared. This is a same-ID FAILED-to-IN_PROGRESS status reversal. The failure payload, attempt-history identifiers and backend explanation were not exposed.

The :24 run cb175359 has three observed start-field values across the existing readbacks: 14:20:00.675679Z in observation 004, 14:47:55.223153Z in observation 005, and 15:17:27.584381Z in this readback. The report and Orson handoff commits at 14:42:24Z and 14:43:25Z occurred during the first observed interval. The current run remains IN_PROGRESS with no completion and no chat reference.

The :36 run 9412c18a changed from 15:03:08.977473Z to 15:33:08.977473Z under the same run ID. The :48 run 05593031 changed from 14:48:22.957199Z to 15:16:15.702218Z under the same run ID.

The task-level last_run_time values remain older than the current run records, the cached latest_result pointers still refer to prior worker results, and next_run_time remains at the already-passed local :00, :24, :36 and :48 slots. These are stale summary fields, not evidence that the current runs completed.

## 3. Limits

These observations do not establish retries, restarts, duplicate processes, actual model-process concurrency, worker identity, thread delivery, process liveness or backend cause. Four run records simultaneously reporting IN_PROGRESS is not proof of four simultaneous model executions.

Tern retains scheduler authority. No task, ID, prompt, schedule, phase, cadence, enabled state or ownership was changed. The :12 lease remains disabled. No sixth task was created.