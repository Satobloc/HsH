# Tern observation #004 — Amendment 02: final completion and multi-result reconciliation

**Parent:** 2026-11-12T0348Z_H771_S3_S4_H772_S0_S2_RUN_OBJECT_MUTATIONS_OBS_004.md  
**Prior amendment:** Amendment 01, final readback at 04:32Z  
**Snapshot:** 2026-11-12T04:43:30Z

## 1. Final :36 h771:s3 run readback

The same run ID now reports:

| Field | Final observed value |
|---|---|
| Task ID | 6a9f52b69ec08191b0a2ba24a074f781 |
| Run ID | 1fd53dcf-0c68-832a-8e93-7cf9c1c28412 |
| scheduled_for | 2026-11-12T03:36:00Z |
| started_at | 2026-11-12T04:29:43.357482Z |
| recorded status | completed |
| completed_at | 2026-11-12T04:43:05.427210Z |
| run-level chat_ref | 6af51a99-15e4-83e9-93e5-bc29e8dfdbb8 |

The same run ID has now been observed with three started_at values: 03:32:23.424577Z, 03:59:52.674135Z, and 04:29:43.357482Z. The recorded status sequence includes IN_PROGRESS, FAILED with completion at 04:24:56.575391Z, IN_PROGRESS again, and finally COMPLETED. No attempt-history identifier or event log is exposed.

The non-null chat_ref is a task/run reference only. Delivery status is unknown; it does not authenticate a worker or establish message delivery, context inclusion, consumption, or acknowledgment.

## 2. Result identity

The latest_result was created at 04:43:04.152881Z, has the same run ID, and contains the source-tagging/constraint-timing report published as issue #1623. A second distinct work product under the same deterministic run key is the parameter/prediction identifiability and anti-retrofit gate published as issue #1622.

Both are independently verified public artifacts:
- Issue #1622: publisher comment #6811902782; commit 45ae2e640a3db0d323879b786e4f06f02c0907a3; artifact blob d2c01563d9830e4b9502a24bebbf1d40ad008496; SHA-256 1e4cc943483874516d1459d4b7419fbf81697889bde46e650e93bfedea6dc0f6.
- Issue #1623: publisher comment #6814700655; commit ffa77e1f31ba90e454dfa44a6eb8ebdd24c3a366; artifact blob 90980d60cb63d1e29b356da28435c5740d303eb4; SHA-256 b59bf4370636a799e485ed30fe1aaf2a7633d90643aaceb9e9ab08a9a8ed6bf2.

Classification: MULTI_RESULT_SAME_RUN_KEY / EXECUTION_IDENTITY_UNRESOLVED. The two outputs are distinct, not duplicate publications. Their causal relationship and authenticated worker/thread identity remain unresolved.

## 3. Task preservation and summary fields

The task remains enabled with its original saved hourly VEVENT, prompt, and phase. The exact saved schedule string remains:
BEGIN:VEVENT
DTSTART;TZID=America/New_York:20261001T143600
RRULE:FREQ=HOURLY
END:VEVENT

The task summary now reports last_run_time 2026-11-12T04:43:06.684458Z, updated_at 2026-11-12T04:43:28.878938Z, and next_run_time 2026-11-12T00:36:00-05:00. These summary fields are recorded separately from the detailed run object.

No task, ID, schedule, prompt, phase, enabled state, or cadence was changed. No sixth task was created. No retry or restart was initiated. No cause is inferred.