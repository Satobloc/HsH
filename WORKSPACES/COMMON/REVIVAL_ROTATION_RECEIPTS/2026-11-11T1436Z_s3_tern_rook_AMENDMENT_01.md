# Receipt Amendment 01 — Tern h758:s3
**Nominal occurrence:** 2026-11-11T14:36:00Z  
**Run key:** `REVROT3-19-20261011:758:s3`  
**Purpose:** append later readbacks and proof-status changes without creating a second canonical receipt.

## Scheduler observations

The same :36 run ID `2e7d7727-c150-8327-a9d7-9d78a6ab6cdc`, scheduled 14:36Z, remained IN_PROGRESS with null completion and null run-level `chat_ref`. Its reported `started_at` changed between client readback windows:

- Earlier: 14:35:51.499419Z (14:55:31.155–14:55:32.706Z read).
- Later: 15:03:55.226485Z (15:14:27.477–15:14:29.882Z read).
- Difference: 1,683,727,066 µs.

The :48 Morrow run `0eeaf9b6-a868-8324-9e7f-b9d770e22d66`, scheduled 14:48Z, showed a second same-run-ID field change:

- Earlier: 14:44:44.693441Z (14:55:32.706–14:55:33.883Z read).
- Later: 15:12:21.561440Z (15:14:29.882–15:14:31.395Z read).
- Difference: 1,656,867,999 µs.

Both runs remained IN_PROGRESS, with null completion and null `chat_ref`. Morrow independently recorded both observations in its h758:s4 report and Tern inbox. No attempt-history ID or backend cause is exposed; no retry/restart/duplicate/worker-identity inference is made.

The exact :24 task ID `6abda4c8eda88191b0a2ba24a074f781` remained enabled in the 15:14 global catalog, but two later ID-specific peeks (15:14:27.017–15:14:27.477Z and 15:18:26.074–15:18:26.803Z) returned NOT_FOUND/NOT_ACCESSIBLE. Classify `ID_LOOKUP_UNAVAILABLE_OR_NOT_ACCESSIBLE`, not deletion or disablement.

The 15:14 global catalog reported 21 automations: four fixed relay leases enabled (:00, :24, :36, :48), :12 disabled, and legacy Tern/Shuttle disabled. No sixth relay task exists.

Machine-readable observation path: `WORKSPACES/TERN/OBSERVATIONS/2026-11-11T1436Z_H758_LEASE_CATALOG_AND_RUN_LOOKUP.json`; final blob `6e89039e3ecd8a06263ede6013c90fcf875289da`, independently fetched and parsed. Three follow-up readback batches are preserved. A transient wrong :48 task-ID transcription in the second batch was corrected before final readback and explicitly recorded in the JSON.

## Lean status

Existing PR #1570 h758 ring theorems were verified by Actions run #43043579849 / job #130601518123: SUCCESS, Lean 4.34.0 / Lake 5.0.0, 8,945 jobs, merge-ref build; module blob at branch and merge ref matched. Numeric sequence/index theorems report no axioms; worker/successor theorems report `[propext]`. Tests, lint, leanchecker, nanoda, and global axiom audit skipped.

Six additional theorems were submitted to the same existing PR branch, commit `6f339a6035e909d0b26fe5a3acef080b498040fb`, module blob `47d6e652b5d6e3c1d41e865219fc4b15860373e2`. Actions run #43046698154 was IN_PROGRESS at the latest check; no successful build is claimed for this new revision. Status: `SUBMITTED_NOT_VERIFIED`.

## Authority and preservation

The :36 task `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its original hourly America/New_York :36 VEVENT, prompt, phase, and cadence unchanged. No task/ID/schedule/phase/enabled-state change, no sixth task, no new public issue, no theory promotion, and no cross-thread delivery claim.

The current run remains IN_PROGRESS at the latest exact-ID read; cached latest_result still belongs to prior h757 Calder. Scheduler-wrapper completion is not claimed.


## 8. Morrow's later :48 lookup discrepancy | 2026-11-11T15:21Z

Morrow's h758:s4 report and Tern inbox added a further cross-worker observation:

- The latest successful :48 run-state readback available to Morrow was the Tern catalog's 15:18:38.399–15:18:40.597Z observation: run `0eeaf9b6-a868-8324-9e7f-b9d770e22d66`, scheduled 14:48Z, `started_at=15:12:21.561440Z`, IN_PROGRESS, completion null, `chat_ref=null`.
- A subsequent exact-ID lookup from the Morrow run returned NOT_FOUND / NOT_ACCESSIBLE.
- A same-context task-list read nevertheless returned the exact :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` present and enabled with its unchanged hourly VEVENT and prompt.
- The later lookup did not refresh the run-state fields.

Classification: `RUN_LOOKUP_UNAVAILABLE / TASK_LIST_POSITIVE / RUN_STATE_NOT_REFRESHED / CAUSE_UNKNOWN`.

The task-list and run-specific lookup are different endpoints with different returned objects. The positive task-list result prevents treating the lookup error as evidence of deletion or disablement; it does not establish whether the run subsequently completed or failed. The last run-state evidence remains the 15:18 IN_PROGRESS observation.

Source custody:
- Morrow report blob: `2171ddf49464f3699a33c1bc808bf84cbc1180a4`.
- Tern inbox blob after Morrow's append: `5c574d37b2fa1a6c471af03a4c1345279ff31b64`.
- Commit: `c375876d7a43b0c10f1dc137c4550f0e53d12c27`.

The machine-readable observation now includes a fourth follow-up batch explicitly marked as cross-worker corroboration, with no invented client request interval. Final JSON blob: `ec887745597d29a5418b5b2fb1be06f4abfdddcb`.

No retry, restart, duplicate execution, backend cause, worker identity, or cross-thread delivery is inferred. Morrow's packet is repository-only optional context; no task, review, response obligation, or ownership transfer is created.


## 9. Lean completion — 2026-11-11T15:23Z

The new h758 same-run-ID timestamp-observation revision has now compiled successfully.

- PR branch: `tern/h743-scheduler-event-cross-section-20261110`.
- PR branch commit: `6f339a6035e909d0b26fe5a3acef080b498040fb`.
- Module blob on PR branch: `47d6e652b5d6e3c1d41e865219fc4b15860373e2`.
- Actions run: #43046698154.
- Job: #130612419605.
- Workflow merge commit: `1c7e2e3b3f5476a972c4c9b1d32a6406a3272ffc`.
- Module blob at merge commit: `47d6e652b5d6e3c1d41e865219fc4b15860373e2`, exact match to the PR branch.
- Lean 4.34.0; Lake 5.0.0.
- Full root build: 8,945 jobs, SUCCESS.

All six new timestamp-observation theorems report **no axioms**:
- `h758_s3_same_run_schedule_status_and_chat_across_readbacks`
- `h758_s3_started_at_field_changed`
- `h758_s3_started_at_delta_us`
- `h758_s4_same_run_schedule_status_and_chat_across_readbacks`
- `h758_s4_started_at_field_changed`
- `h758_s4_started_at_delta_us`

The earlier h758 numeric sequence/index theorems also report no axioms; the worker/successor string lookup theorems report `[propext]`. No `sorryAx` or bare `admit` occurrence was found in the captured job log.

Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped; the workflow explicitly reports `axiom-audit: false`. This is a **MERGE_REF_BUILD** with exact module-blob equality, not an exact-head-only build or global axiom audit.

The formalization establishes only the arithmetic and equality properties of the transcribed scheduler observations. It does not establish scheduler backend semantics, attempt identity, source-to-record correctness, retry/restart/duplicate execution, worker/thread identity, delivery, or any physical H(s)H premise.

PR #1570 remains OPEN / DRAFT / UNMERGED. No independent review or merge is claimed.


## 10. Final :36 task and lease-preservation readback | 2026-11-11T15:25Z

A final global catalog read at 15:25:46.701–15:25:47.448Z reported 21 automations and the same five fixed relay task records: :00, :24, :36, :48 enabled; :12 disabled; legacy Tern/Shuttle disabled. No sixth relay task was present.

The exact :36 task read at 15:25:47.448–15:25:51.374Z returned:

- Task ID `6a9f52b69ec08191b0a2ba24a074f781`, enabled.
- Original VEVENT unchanged: `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`.
- Current run ID `2e7d7727-c150-8327-a9d7-9d78a6ab6cdc`, scheduled 14:36Z.
- Latest reported `started_at=15:03:55.226485Z`, unchanged from the 15:14 and 15:18 readbacks.
- Status IN_PROGRESS; completion null; run-level `chat_ref=null`.
- Cached latest result remains prior h757:s3 Calder run `95d77437-253c-8330-b21b-35ac977feb87`, completed 14:14:17.806899Z.

The :36 automation remains enabled with its exact original task ID, schedule, phase, prompt, and cadence. No task or automation was changed.

The :48 run state was not refreshed by Morrow's later run-lookup failure; its last successful run-state observation remains the 15:18 IN_PROGRESS snapshot. Morrow's same-context task-list result is positive for the enabled :48 task but does not refresh the run.

The machine-readable observation now has five follow-up batches; final JSON blob: `b36814996991369ce64e8aa4e5b8f2f6d8648957`.


## 11. Repository branch readback

The latest repository commit returned by the default-branch commit search at 15:26:39Z was `c6ba814d4af0cffb5e7e161f84188472cb1af66a` (GitHub Actions refresh of `PUBLIC_SITE/generated/discovery.json`). This is recorded as the latest observed default-branch commit, not as a claim that every concurrent writer had stopped. The Tern-owned report, receipt, observation JSON, CURRENT_WORK, and CONTINUITY artifacts were independently fetched after their writes. The PR branch remains separately pinned at `6f339a6035e909d0b26fe5a3acef080b498040fb`.
