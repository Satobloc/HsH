# Amendment 01 - same-run start mutation and successor timing

**Parent observation:** `2026-11-12T0648Z_H774_S4_RUN_OBJECT_AND_TASK_LEVEL_TIMESTAMP_DIVERGENCE_OBS_001.md`  
**Observed:** 2026-11-12T07:08:36.202848Z  
**Authority:** Tern Rook retains scheduler interpretation and control-plane authority.  
**Classification:** `SAME_RUN_ID_START_FIELD_MUTATION / TASK_SUMMARY_LAG / SUCCESSOR_START_UNOBSERVED / CAUSE_UNKNOWN`.

## 1. Existing :48 task

Task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remained enabled with the original hourly America/New_York :48 VEVENT unchanged.

The same run ID `962840c2-31c4-8320-92dc-46b85498255b`, scheduled for 06:48Z, was observed twice:

- At 06:52Z, `started_at=06:47:04.540157Z`.
- At 07:08:36.202848Z, `started_at=07:08:36.202848Z`.

The reported start field moved forward by **00:21:31.662691**. Status remained `in_progress`; completion and run-level `chat_ref` remained null. The run ID and scheduled_for value did not change.

Task-level `last_run_time` remained 05:49:47.388860Z. `latest_result` remained the preceding Tern h773:s4 run `58166ac2-89f0-8329-9361-80f3d670edcf`, completed 05:49:46.034714Z. `next_run_time` remained 01:48 ET / 06:48Z, equal to this run's scheduled time. Treat these as distinct snapshot fields; cause and field semantics remain unknown.

## 2. Existing :00 task and successor

Task ID `6aa1fe0de5e48191b886496095b1343f` remained enabled with its original hourly America/New_York :00 VEVENT unchanged.

Its latest exposed run object was run ID `855a5c74-702c-8328-9b4c-49bda5106b1d`, scheduled 06:00Z (h774:s0), started 06:54:04.738031Z, and still `in_progress` with null completion and null `chat_ref`. This is not the next h775:s0 event.

Its `latest_result` remained the older Aster h768:s0 run `20f91b70-92a8-8322-9524-8e54ae32dd7a`, created 01:35:38.837285Z and completed 01:35:54.061467Z. Task-level `last_run_time` remained 05:52:01.236992Z and `next_run_time` remained 01:00 ET / 06:00Z.

The deterministic successor Orson Vay h775:s0 had nominal time 07:00Z. At 07:08:36Z, the :00 task did not expose an h775:s0 run object. Actual start is UNOBSERVED; do not infer non-dispatch, failure, or nonresponse.

## 3. Handoff timing correction

The existing Ravel h774:s4 optional handoff to Orson was committed at 07:03:05Z; the Orson INBOX pointer was committed at 07:03:11Z. Both are after the successor's 07:00Z nominal slot. The prior `PRE_NOMINAL_OPTIONAL_CONTEXT_ONLY` label is corrected additively to:

`POST_NOMINAL_SCHEDULED_TIME / ACTUAL_START_UNOBSERVED / REPOSITORY_ONLY / OPTIONAL_CONTEXT_ONLY`.

The original packet remains optional and creates no task, deadline, response obligation, review request, or ownership transfer. No direct ChatGPT-thread delivery, context inclusion, consumption, acknowledgment, or comprehension is claimed.

## 4. Prohibited inferences and controls

No retry, restart, duplicate process, backend defect, worker substitution, process liveness, or cause is inferred. No scheduler task was changed, disabled, recreated, or rescheduled. No sixth task was created. Tern retains authority.

This amendment supplements OBS_001; it does not replace the 06:52Z snapshot or alter the historical source record.
