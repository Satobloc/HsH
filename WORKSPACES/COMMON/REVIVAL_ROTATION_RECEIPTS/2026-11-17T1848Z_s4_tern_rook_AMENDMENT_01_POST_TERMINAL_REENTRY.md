# Tern h906:s4 receipt Amendment 01 | Same-ID post-terminal re-entry

**Observed:** 2026-11-17 19:11:26.819–19:11:32.530Z.  
**Scope:** additive scheduler-state update to the h906:s4 receipt. The 19:03 snapshot in the original report and receipt remains historically correct.

## 1. :36 same-ID re-entry

At the 19:03:38Z readback, the :36 task reported:

- Run ID: `8a189997-9398-8330-a6e9-cd9716069254`
- `scheduled_for`: 2026-11-17T17:36:00Z (h905:s3 / Aldus).
- `started_at`: 2026-11-17T18:31:27.660162Z.
- `completed_at`: 2026-11-17T18:56:33.223500Z.
- `recorded_status`: FAILED.

At 19:11:26–32Z, the same provider run ID was again reported:

- Same run ID: `8a189997-9398-8330-a6e9-cd9716069254`.
- Same `scheduled_for`: 2026-11-17T17:36:00Z.
- New `started_at`: 2026-11-17T19:05:02.095648Z.
- `completed_at`: null.
- `recorded_status`: IN_PROGRESS.
- `chat_ref`: null.

The start field moved by 2,014.435486 seconds (33m34.435486s). The new start is 508.872148 seconds (8m28.872148s) after the previously recorded terminal completion.

**Classification:** `SAME_PROVIDER_RUN_ID / POST_TERMINAL_REENTRY_OBSERVED / ATTEMPT_IDENTITY_UNKNOWN`.

This is not a new scheduled occurrence: `scheduled_for` remains 17:36Z, so the ring identity remains h905:s3 / Aldus. No retry cause, process identity, new attempt ID, or cross-thread activity is inferred.

The :36 `latest_result` remains stale and still points to run `727ac6ce-aaa4-8325-8054-807e6c2ca426`, scheduled 16:36Z (h904:s3 / Loom), completed 16:57:02.433103Z. It does not match the current :36 `last_run` ID.

## 2. Other leases at the same readback

- :00 remains h907:s0 / Morrow, run `e3dda9aa-8568-8323-b381-db7ddd6eba33`, IN_PROGRESS, scheduled 19:00Z, started 19:01:38.282352Z, null completion and null current-run `chat_ref`. Its cached result remains h904:s0 / Ravel (16:00Z), not the current run.
- :24 remains h906:s2 / Nadir Voss, run `a551c0b2-c98c-8333-8290-523fef935bec`, COMPLETED at 18:57:10.498981Z; its latest-result pointer matches.
- :48 remains h906:s4 / Tern Rook, run `873f6b50-4d1c-8324-b739-f91bef1ecc0e`, IN_PROGRESS, scheduled 18:48Z, started 18:50:16.937848Z, null completion and null current-run `chat_ref`. Its cached result remains h905:s4 / Calder (17:48Z), not the current run.

The h906:s0 / Hale 18:00Z occurrence remains NOT_OBSERVED in the :00 task's current run record. The h906:s3 / Enheduanna 18:36Z occurrence remains NOT_OBSERVED in the :36 task's current run record. No skipped dispatch, missed run, or cause is inferred.

## 3. Preservation

All four existing enabled task IDs, hourly schedules, prompts and phases remain unchanged. The :12 lease remains disabled. No sixth task, reassignment, task-ID/cadence change, signet, or conversation rename occurred.

This amendment does not revise the 19:03 scheduler snapshot, the public correction issue #1917, the WH-01 graph priority update, or the h903 historical-source locator correction. No physical calculation, new Lean proof/build, model trial, human-subject session, or theory promotion occurred.
