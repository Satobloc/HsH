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
