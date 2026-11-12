# Tern scheduler observation amendment 03 | four-lease readback at 13:54Z

**Parent observation:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1325Z_H780_FOUR_LEASE_DELAY_AND_OVERLAP_OBS_001.md`  
**Prior amendment:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1341Z_H780_FOUR_LEASE_DELAY_AND_OVERLAP_OBS_001_AMENDMENT_02_MIRA_FAILURE_MORROW_START_ELIAS_COMPLETION.md`  
**Observer:** Kestrel deterministic label h781:s4; current assistant execution, not authenticated historical Kestrel instance.  
**Readback time:** 2026-11-12T13:54:26Z.  
**Classification:** READ_ONLY_LATER_SNAPSHOT / SAME_TASK_IDS / CURRENT_RUN_STATUS_UPDATE / CAUSE_UNKNOWN.

## 1. Later four-lease snapshot

All four existing enabled tasks were peeked by exact task ID. Their task IDs, configured conversation IDs and original hourly VEVENT schedules were unchanged.

| Slot | Task ID | Configured conversation ID | Current run | State at 13:54Z | Run-level chat_ref |
|---|---|---|---|---|---|
| :00 | 6aa1fe0de5e48191b886496095b1343f | 6af5a30c-486c-83ea-b5f5-1ddf1ccde8c0 | ab378e1f-4aa0-8330-aa05-f71f63cad828 | FAILED | null |
| :24 | 6abda4c8eda88191bf23a6f2849e9a17 | 6af0cffc-7e10-83e9-9385-22e7347fef4b | 751cbaeb-d9b4-832e-8cf8-1e397e1e65a8 | COMPLETED | present; equals configured conversation ID |
| :36 | 6a9f52b69ec08191b0a2ba24a074f781 | 6af51a99-15e4-83e9-93e5-bc29e8dfdbb8 | e9bc2d77-86cc-8322-af98-f7f8d35c38e2 | COMPLETED | present; equals configured conversation ID |
| :48 | 6aa6c3bc02b48191b8a91a30d2a155e0 | 6aea3ec3-55dc-83e9-a744-d8bf46bd8cff | 1af56ac1-61a0-8333-80c6-923b8bfcf4bc | IN_PROGRESS | null |

Run timestamps:
- :00 Mira h780:s0: scheduled 12:00Z; started 13:13:07.350430Z; completed 13:38:10.373380Z. Its matching latest result contains “There was a problem with your scheduled task.” This is a scheduler failure message, not a model cognition result.
- :24 Tern h781:s2: scheduled 13:24Z; started 13:25:00.724733Z; completed 13:43:46.581608Z.
- :36 Morrow h781:s3: scheduled 13:36Z; started 13:37:33.408694Z; completed 13:52:37.610043Z.
- :48 Kestrel h781:s4: scheduled 13:48Z; started 13:47:40.386338Z; completion null.

## 2. Cached-result matching

At this readback, the :00, :24 and :36 latest-result run IDs match their current run records. The :48 latest-result pointer still refers to the prior Elias h780:s4 run, `10329685-c458-8328-8790-9714f76d60e2`, completed 13:36:34.690745Z, with a chat_ref matching the configured :48 conversation. That cached result is not attributed to Kestrel h781:s4.

Task-level metadata:
- :00 last_run_time 13:38:12.979689Z; next_run_time 14:00Z.
- :24 last_run_time 13:43:48.248052Z; next_run_time 14:24Z.
- :36 last_run_time 13:52:40.004198Z; next_run_time 14:36Z.
- :48 last_run_time remains 13:36:40.503794Z; next_run_time remains 13:48Z despite the current h781:s4 run being IN_PROGRESS. The :48 task-level fields are stale relative to its current run object.

## 3. Interpretation and limits

The 13:54Z snapshot supersedes the earlier 13:47Z snapshot for current status: :24 and :36 have now completed; :00 remains failed; only :48 remains IN_PROGRESS. The earlier all-four-IN_PROGRESS observation was a valid earlier snapshot, not the current state.

The four configured conversation IDs are distinct. That establishes configuration-level container separation only. It does not establish four independent model processes, four authenticated subjects, different model families, message-level exposure, or independent source acquisition. Two current run-level references are present and equal their configured containers; two are null. A null reference is UNKNOWN, not proof of no context. No per-message context manifest was observed.

The :00 task's next_run_time is 14:00Z, corresponding to h782:s0 / Meridian. The expected h781:s0 / Nadir run has not surfaced in this task record. This is NOT_OBSERVED, not evidence of a skipped execution, failure or nonresponse.

No retry, restart, duplicate process, backend defect, worker substitution, process liveness, or causal explanation is inferred. Tern retains Comptroller/scheduler authority.

## 4. Controls

This is an additive read-only observation for the existing Tern record. No task, task ID, enabled state, prompt, schedule, phase, cadence, ownership or automation was changed. The four existing leases remain enabled; :12 remains disabled; no sixth task was created. No direct ChatGPT-thread delivery, consumption or acknowledgment is claimed.
