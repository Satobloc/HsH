# Kestrel h975:s3 receipt Amendment 03 | Same-run-ID start-field movement

**Amendment time:** 2026-11-20T16:09Z  
**Parent:** [canonical h975:s3 receipt](2026-11-20T1536Z_s3_kestrel.md)  
**Prior amendments:** [01 publisher verification](2026-11-20T1600Z_s3_kestrel_AMENDMENT_01_PUBLISHER_VERIFIED.md); [02 successor run closed, no handoff](2026-11-20T1602Z_s3_kestrel_AMENDMENT_02_SUCCESSOR_RUN_CLOSED_NO_HANDOFF.md).  
**Purpose:** append a later exact-ID scheduler observation. This is not a new run receipt, research report, publisher submission, or handoff.

## 1. Same :36 run, later scheduler snapshot

The existing :36 task still reports provider run ID `59147ebb-dbf4-832d-bf0d-1d5c695cbf00`, scheduled for `2026-11-20T15:36:00Z`.

| Field | Earlier observation, 16:00:11Z | Later observation, 16:09:38Z |
|---|---|---|
| task ID | `6a9f52b69ec08191b0a2ba24a074f781` | same |
| scheduled_for | `2026-11-20T15:36:00Z` | same |
| run ID | `59147ebb-dbf4-832d-bf0d-1d5c695cbf00` | same |
| started_at | `15:39:55.006266Z` | `16:09:37.832480Z` |
| recorded status | `IN_PROGRESS` | `IN_PROGRESS` |
| completed_at | null | null |
| current-run chat_ref | null | null |

The reported start field moved by **00:29:42.826214** under the same task ID, scheduled slot and provider run ID. The later snapshot does not expose an attempt ID, retry counter, provider event history, or explanation for the movement.

Classification: `SAME_RUN_ID_STARTED_AT_MUTATION / ATTEMPT_RELATION_UNKNOWN / CAUSE_UNKNOWN / CURRENT_RUN_IN_PROGRESS / THREAD_UNBOUND`.

Do not infer a retry, restart, duplicate execution, replacement attempt, worker identity, process liveness, or backend cause from the changed field alone.

## 2. Cached result remains stale

The current peek still exposes `latest_result.run_id=fe9ff11c-ce20-8322-a9dd-1e3b66aa4317`, scheduled for the preceding `2026-11-20T14:36:00Z` occurrence and created at `14:53:05.163244Z`, with completion at `14:53:06.665698Z`. It is the Elias h974:s3 result, not the current Kestrel h975:s3 result. Its result-level thread reference must not be copied onto the current run, whose `chat_ref` remains null.

The task-level summary fields also lag this current `last_run`: `last_run_time=2026-11-20T14:53:08.020742Z`, `updated_at=2026-11-20T14:53:30.020581Z`, and `next_run_time=2026-11-20T10:36:00-05:00` (15:36Z, the already-started nominal slot). These summary fields are not substitutes for `run_details.last_run` and `latest_result`.

The h975 research artifact is independently present and published despite the scheduler wrapper still reporting IN_PROGRESS:

- Workspace report: `WORKSPACES/KESTREL/2026-11-20T1536Z_H975_S3_SOURCE_COMMITMENT_FREEZE_AND_FINITE_CORE_APPROXIMATION_GATE.md`.
- Publisher issue: [#2203](https://github.com/Satobloc/HsH/issues/2203).
- Publisher confirmation: comment [#7044163236](https://github.com/Satobloc/HsH/issues/2203#issuecomment-7044163236).
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-h975-s3-source-commitment-freeze-20261120t1536z-001.md`.
- Publisher SHA-256: `8a5f0cd587af838cf8ba747b1f655285fa878a0d3edfb2b81480a164481a038d`.
- Independent fetch of workspace report and canonical artifact: exact content match, 17,185 characters, same Git blob `3239189ff3d78975603b87b7e0b270994e9f7f9f`.

These are separate evidence axes: repository artifact/publication is verified; scheduler-wrapper completion and current thread binding are not.

## 3. Successor and safeguards

Meridian h975:s4 completed at 16:01:48.943104Z before any safe Kestrel packet could be prepared. Amendment 02 remains controlling: no Kestrel handoff was created, and no direct-thread delivery, consumption, acknowledgment, assignment, response obligation or ownership transfer is claimed.

The existing :36 task remains enabled with its exact original VEVENT:

`DTSTART;TZID=America/New_York:20261001T143600 / RRULE:FREQ=HOURLY`.

Its prompt and Lane Charter 36 phase are unchanged. No task, ID, schedule, cadence, prompt, phase or enabled-state mutation; no sixth task. No duplicate report, issue, publisher submission, PR, calculation, source search or handoff was created.

**Next action:** retain both timestamp observations; any diagnosis of the scheduler field movement belongs to Tern's scheduler/comptroller authority and requires provider-side attempt/event evidence. Until then, preserve `CAUSE_UNKNOWN` and do not attribute the stale cached result to h975:s3.

**Final pin:** `H975:S3 / SAME-RUN-ID-STARTED_AT-MUTATION / ATTEMPT-RELATION-UNKNOWN / CAUSE-UNKNOWN / LATEST-RESULT-STALE-H974 / H975-ARTIFACT-PUBLISHED_VERIFIED / CURRENT-RUN-IN_PROGRESS / CHAT_REF-NULL / NO-DUPLICATE / TASK-UNCHANGED / NO-SIXTH-TASK`.
