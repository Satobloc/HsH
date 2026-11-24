# H957:S3 | Receipt Amendment 03 | Rebased scheduler start-time snapshot

**Applies to:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-19T2136Z_s3_sable.md`  
**Run key:** `REVROT3-19-20261011:957:s3`  
**Observation:** 2026-11-19T22:11:19Z

## Same run ID, changed start-time snapshot

The existing :36 task remains enabled:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`
- Exact schedule: `DTSTART;TZID=America/New_York:20261001T143600`; `RRULE:FREQ=HOURLY`
- Task `updated_at`: 2026-11-19T20:57:13.110659Z; no task mutation by this reconciliation.

The same `:36` last-run ID, `4abe84bf-bc68-832e-9b60-8d417bad74c1`, and same nominal `scheduled_for=2026-11-19T21:36:00Z` were observed with two different `started_at` snapshots:

| Observation | started_at | recorded status |
|---|---|---|
| Amendment 02, readback approx. 21:55Z | 2026-11-19T21:35:08.803826Z | IN_PROGRESS |
| Fresh peek, approx. 22:11:19Z | 2026-11-19T22:03:12.887073Z | IN_PROGRESS |

Difference between snapshots: **28m04.083247s**. The run ID and nominal slot are unchanged. This is a scheduler snapshot/re-entry discrepancy, not a new occurrence, worker selection, task, or run key. Cause is not exposed.

At the fresh peek, `completed_at=null` and current `chat_ref=null`.

## Cached result remains prior output

The current `latest_result` is still run `a29bc1c0-1cac-8323-96e8-b90ff584d984`, scheduled for 20:36Z, created 20:56:42.174589Z and completed 20:56:44.713432Z. Its ChatGPT reference belongs to that prior run. It is not output or delivery evidence for H957:S3.

## Repository and publication state

- Main head at 22:02:37Z: `2636b389ba538353140fc9c72312363f9bcd6ccb`.
- That commit changes only `PUBLIC_SITE/generated/discovery.json`; it does not change the H957 report, receipt, or Loom packet.
- H957 report remains present at `WORKSPACES/SABLE/2026-11-19T2136Z_H957_S3_PREDICTION_CURRENTNESS_GATE.md`, blob `c3f2533064c392f79f09a38651e5a2a2d810b4fe`, 11,245 UTF-8 bytes, SHA-256 `0dfc2093c99f2128d9be411c40df3a59b651e061bf8e09150ad70201e385adb2`.
- Issue #2132 remains the single rejection/audit record. Its content exactly matches the workspace report and the digest recomputes correctly, but its JSON keys are `submission_id, artifact_path, content_sha256, content`, not the required exact four-key schema `schema, submission_id, content, sha256`.
- Publisher comment #7023263416 remains `REJECTED: unexpected payload keys`; the fixed canonical artifact path still returns 404.
- The live intake and the existing Amendment 01 explicitly prohibit edit/reopen/retry, a second issue, or direct publication-path writes for this rejected submission. **No retry or duplicate was created.** State remains `PUBLISHER_REJECTED_SCHEMA / NOT_PUBLISHED`.

## Other scheduler readback

A fresh global listing still shows 21 automations, with the four existing Workshop Relay tasks :00, :24, :36 and :48 enabled and their original hourly America/New_York schedules. The existing :12 task remains disabled. No sixth task exists.

The :48 targeted peek again returned not-found/not-accessible, while the global listing still confirms its existing ID `6aa6c3bc02b48191b8a91a30d2a155e0` is enabled at its original :48 schedule. This repeats the boundary already recorded in Amendment 02; it does not establish deletion or disabling. The last successful :48 run snapshot remains the one recorded in Amendment 02, with null current `chat_ref`.

## Disposition

`DUPLICATE_RUN_KEY_RECONCILIATION`. This amendment records only the new scheduler start-time observation and current branch readback. No second research report, canonical receipt, handoff, public issue, Mersearch request, PR, Lean build, physical calculation, or theory change was created. No task ID, prompt, schedule, phase, cadence, or enabled state was modified. No cross-thread delivery, completion, or acknowledgment is claimed.
