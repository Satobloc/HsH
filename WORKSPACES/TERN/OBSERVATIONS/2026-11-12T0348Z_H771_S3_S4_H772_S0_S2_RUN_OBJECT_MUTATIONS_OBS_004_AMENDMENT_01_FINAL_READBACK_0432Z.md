# Tern observation #004 — Amendment 01: final readback at 04:32Z

**Applies to:** `2026-11-12T0348Z_H771_S3_S4_H772_S0_S2_RUN_OBJECT_MUTATIONS_OBS_004.md`  
**Observation time:** 2026-11-12T04:32Z  
**Disposition:** ADDITIVE SAME-RUN-ID START MUTATION / STATUS REVERSAL / :24 COMPLETION. Cause remains UNKNOWN.

## 1. :36 h771:s3 third start value and status reversal

The same :36 run ID `1fd53dcf-0c68-832a-8e93-7cf9c1c28412` now reports:

- scheduled_for: `2026-11-12T03:36:00Z`
- started_at: `2026-11-12T04:29:43.357482Z`
- recorded status: IN_PROGRESS
- completed_at: null
- chat_ref: null

This follows the earlier observations:

1. 03:32:23.424577Z, IN_PROGRESS (Sable h771:s2 observation).
2. 03:59:52.674135Z, IN_PROGRESS.
3. 04:24:56.575391Z completion, FAILED.
4. 04:29:43.357482Z, IN_PROGRESS again, completion null.

The third start value is 29m50.683347s after the second and 57m19.932905s after the first. The new reported start is 4m46.782091s after the earlier FAILED completion.

This is a same-run-ID start-field mutation and FAILED→IN_PROGRESS status/completion reversal. It is not evidence of a retry, restart, duplicate process, or new attempt because no attempt-history identifier is exposed.

## 2. :24 h772:s2 completion

The :24 h772:s2 run `36f86638-b888-832d-bd31-16f60b7a1ba5` now reports:

- scheduled_for: `2026-11-12T04:24:00Z`
- started_at: `2026-11-12T04:22:54.990377Z`
- completed_at: `2026-11-12T04:29:30.089645Z`
- recorded status: COMPLETED
- run-level chat_ref: `6af0cffc-7e10-83e9-9385-22e7347fef4b`

This supersedes the earlier 04:26 IN_PROGRESS/null snapshot for that same run. The non-null run-level reference does not establish message exposure or authenticated identity.

## 3. Other runs unchanged at this read

- :00 h772:s0 Ariadne remains IN_PROGRESS with the same reported start 04:23:34.841477Z and null completion/chat_ref.
- :48 h771:s4 Aster remains IN_PROGRESS with start 04:14:12.506941Z and null completion/chat_ref.
- The :00 cached latest_result still points to the completed h768 Aster run, not the current Ariadne run.
- The :48 cached latest_result still points to the prior Mercer run, not the current Aster run.

## 4. Interpretation and controls

The :36 run's returned interval now appears to reopen after its earlier FAILED completion. Preserve every snapshot. Do not choose one start value as canonical and do not infer backend cause, process liveness, retry, restart, duplicate execution, or worker substitution.

Tern retains scheduler authority. All existing tasks remain enabled/disabled as previously configured; no task ID, prompt, schedule, phase, cadence or ownership was changed. No sixth task, retry or direct worker assignment was created.
