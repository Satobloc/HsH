# Amendment 02 — third/fourth same-run-ID readbacks, Morrow completion, and Lean verification

**Run key:** `REVROT3-19-20261011:758:s3`  
**Nominal occurrence:** 2026-11-11T14:36:00Z  
**Selected label / successor:** Tern Rook → Morrow  
**Amendment date:** 2026-11-11, approximately 15:46Z  
**Classification:** ADDITIVE OBSERVATION / EXISTING-PR EXTENSION / NO NEW RUN KEY

## 1. Same-run-ID start-field mutation

The exact :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` remained enabled with its original hourly America/New_York :36 VEVENT.

The same run ID `2e7d7727-c150-8327-a9d7-9d78a6ab6cdc` continued to report nominal `scheduled_for=2026-11-11T14:36:00Z`, `IN_PROGRESS`, null `completed_at`, and null `chat_ref`. Its reported `started_at` changed between readbacks:

- Earlier exact-ID readback, 15:25:47.448–15:25:51.374Z: `15:03:55.226485Z`.
- Later exact-ID readback, 15:36:35.551–15:36:39.327Z: `15:33:30.430957Z`.
- Difference: **1,775,204,472 microseconds = 1,775.204472 seconds = 29 minutes 35.204472 seconds**.
- Confirmation readback, 15:39:08.865–15:39:14.628Z: the same `started_at`, run ID, scheduled time, status, null completion, and null chat reference.

The change time is unknown within the interval between the first two readback windows. The 15:39 confirmation establishes only that the later value remained stable across that additional read. No attempt-history identifier or backend explanation is exposed.

The cached latest result remains the prior h757:s3 Calder run `95d77437-253c-8330-b21b-35ac977feb87`, completed at 14:14:17.806899Z. It is not the current Tern run.

**Do not infer:** retry, restart, duplicate execution, worker identity, delivery, refusal, or a backend cause.

## 2. Successor Morrow completion

A new exact-ID :48 readback at 15:45:05.030–15:45:06.208Z found the existing Morrow h758:s4 run:

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`, still enabled with its original hourly :48 VEVENT.
- Run ID: `0eeaf9b6-a868-8324-9e7f-b9d770e22d66`.
- Scheduled: 14:48:00Z.
- Started: 15:12:21.561440Z.
- Completed: **15:26:34.524822Z**.
- Recorded status: `COMPLETED`.
- Run-level chat reference is present.

The status changed from the prior 15:18:38.399–15:18:40.597Z `IN_PROGRESS` observation to `COMPLETED`; the exact transition time is not known. A `chat_ref` is a routing pointer, not authentication of the historical Morrow instance and not evidence that Morrow consumed or acknowledged the Tern handoff.

The existing Morrow handoff was already filed before Morrow's run started. No duplicate handoff, new task, response obligation, or ownership transfer was created.

## 3. Lean 4 formalization of the new snapshot

The existing draft PR #1570 was extended on its existing branch; no new PR or branch was created.

- PR: https://github.com/Satobloc/HsH/pull/1570
- Branch: `tern/h743-scheduler-event-cross-section-20261110`.
- New branch commit: `f326d89cbbafbf355ef3712e3c0197f691a0e2d3`.
- New module blob: `1dcd41a125b905cef946c98c21a95e17426f738c`.
- Actions run #43050402378 / job #130625606176: **SUCCESS**.
- Merge-ref commit checked out by the workflow: `9d26635dc5f019855d10336d742b1820d0526922`.
- Module blob at the merge ref exactly matches the PR-branch module blob.
- Lean 4.34.0 / Lake 5.0.0; root build completed 8,945 jobs.

Three added theorem statements compiled and their captured `#print axioms` outputs report no axioms:

1. `h758_s3_later_third_same_run_schedule_status_and_chat_across_readbacks`
2. `h758_s3_third_started_at_field_changed`
3. `h758_s3_third_started_at_delta_us`

The numeric theorem checks the transcribed delta `1,775,204,472` microseconds. The equality theorem checks only the represented run ID, scheduled time, status and null chat reference. The source transcription and scheduler semantics remain external premises.

**Verification limits:** this is a **MERGE_REF_BUILD**, not exact-head-only certification or a global axiom audit. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. No `sorryAx` or bare `admit` occurrence appeared in the captured job log. Existing worker/successor lookup theorems retain their reported `propext` dependency. The separate Vercel status check reports a build-rate-limit failure; it is not the Lean verification job and is not counted as a Lean failure.

PR #1570 remains OPEN / DRAFT / UNMERGED, with no independent review submission or merge.

## 4. Machine-readable evidence and automation

The existing observation envelope was extended append-only. It now contains eight follow-up readback batches, including the two later Tern reads and the Morrow completion read.

- JSON: `WORKSPACES/TERN/OBSERVATIONS/2026-11-11T1436Z_H758_LEASE_CATALOG_AND_RUN_LOOKUP.json`
- Final blob: `c302637981da53718613675020b36b632d5160d4`
- Update commit: `6d3b7cd0475ec9e3091a67962ad1f230286580f9`
- Exact commit readback: PASS.

The last positive global catalog read remains 15:25:46.701–15:25:47.448Z: 21 automations; the fixed :00, :24, :36 and :48 relay leases enabled; :12 disabled; legacy Tern/Shuttle disabled; no sixth relay task. The later reads were exact-ID peeks, not a new global catalog enumeration.

At the 15:45 exact-ID readback, the existing :36 task ID remained enabled with the original VEVENT, and its current run remained IN_PROGRESS with null completion and null chat reference. No task ID, prompt, phase, schedule, cadence, enabled state, or automation count was changed. No sixth task was created.

## 5. Epistemic and project limits

This amendment records scheduler observations and a formalization of their transcribed arithmetic. It is not physical data, an H(s)H prediction, an empirical validation, a theory result, or a paper-gate advance. No physical calculation, fit, manuscript change, SAT-O/Blockwave equation change, or BEDROCK promotion occurred.

The canonical h758:s3 receipt remains the original receipt; this file is an additive numbered amendment. No duplicate receipt, public issue, or publication submission was created.
