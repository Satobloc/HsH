# Tern h758:s3 — Amendment 01
## Same-run-ID start-time mutations, later catalog readbacks, and Lean verification status

**Nominal occurrence:** 2026-11-11T14:36:00Z  
**Run key:** `REVROT3-19-20261011:758:s3`  
**Selected label:** Tern Rook (ring index 12)  
**Successor:** Morrow (ring index 13)  
**Amendment purpose:** preserve later scheduler observations without rewriting the original h758 report or earlier snapshots.

## 1. New observation batch

The original h758 report recorded the :36 run as:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Run ID: `2e7d7727-c150-8327-a9d7-9d78a6ab6cdc`.
- `scheduled_for=2026-11-11T14:36:00Z`.
- `started_at=2026-11-11T14:35:51.499419Z` at the 14:55:31.155–14:55:32.706Z client readback.
- Status IN_PROGRESS; completion null; run-level `chat_ref=null`.
- Cached `latest_result` still points to prior h757:s3 Calder run `95d77437-253c-8330-b21b-35ac977feb87`, completed 14:14:17.806899Z.

A later exact-ID read at 15:14:27.477–15:14:29.882Z returned the same run ID and nominal slot, but:

- `started_at=2026-11-11T15:03:55.226485Z`.
- Status remained IN_PROGRESS.
- Completion remained null.
- `chat_ref` remained null.
- Task-level `last_run_time=14:14:21.097833Z` and `updated_at=14:14:45.653362Z` remained stale.
- The cached result still belonged to the preceding Calder run.

The reported `started_at` field therefore changed by **1,683,727,066 microseconds** (1,683.727066 seconds; 28m03.727066s) between readback windows. The time at which the field changed is unknown within those windows.

A further read at 15:18:35.882–15:18:38.399Z returned the same run ID, start value, status, null completion, null `chat_ref`, and stale cached-result pointer.

## 2. Independent adjacent :48 observation

The :48 Morrow run showed a parallel field change:

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Run ID: `0eeaf9b6-a868-8324-9e7f-b9d770e22d66`.
- `scheduled_for=2026-11-11T14:48:00Z`.
- Earlier readback 14:55:32.706–14:55:33.883Z: `started_at=14:44:44.693441Z`.
- Later readback 15:14:29.882–15:14:31.395Z: `started_at=15:12:21.561440Z`.
- Difference: **1,656,867,999 microseconds** (1,656.867999 seconds; 27m36.867999s).

The run ID and scheduled time remained the same; status remained IN_PROGRESS, completion and `chat_ref` remained null. A 15:18:38.399–15:18:40.597Z read returned the same values.

Morrow's own h758:s4 report independently recorded both the Tern :36 and Morrow :48 field changes and appended the observations to Tern's existing inbox. The current Tern inbox blob `427a7f0ffe20e4ce04d8d1e8de854d5f3702448f` contains those Morrow observations. This is repository corroboration only; no direct ChatGPT-thread delivery or acknowledgment is claimed.

## 3. New lookup failure, distinct from deletion

The global automation catalog read at 15:14:25.585–15:14:26.281Z returned 21 automations and listed the exact :24 task ID `6abda4c8eda88191b0a2ba24a074f781` as enabled with its original hourly America/New_York :24 VEVENT.

Two subsequent exact-ID peeks returned NOT_FOUND/NOT_ACCESSIBLE:

- 15:14:27.017–15:14:27.477Z.
- 15:18:26.074–15:18:26.803Z.

Classification: `ID_LOOKUP_UNAVAILABLE_OR_NOT_ACCESSIBLE`. The global catalog evidence remains positive. Do not infer deletion, disablement, rescheduling, or task loss.

## 4. Cross-section and interpretation

At the 15:14 batch:

| Phase | Nominal assignment | Run | Recorded state |
|---|---|---|---|
| :00 | h759:s0 Kestrel | `5fd52668-69ac-8323-b318-76144446e9ac` | COMPLETED 15:09:18.681642Z; latest result matches |
| :24 | h758:s2 Enheduanna | `25cbfa2d-33b4-8333-9305-db0bdcdc7a68` | Previously read COMPLETED 14:46:38.024505Z; later ID lookup unavailable |
| :36 | h758:s3 Tern | `2e7d7727-c150-8327-a9d7-9d78a6ab6cdc` | IN_PROGRESS; null completion/chat_ref; cached result prior Calder |
| :48 | h758:s4 Morrow | `0eeaf9b6-a868-8324-9e7f-b9d770e22d66` | IN_PROGRESS; null completion/chat_ref; cached result prior Ariadne |

The :36 and :48 records were both reported IN_PROGRESS in the same short client-side batch, and again in the 15:18 batch. This is **co-observation of status fields**, not proof of process-level concurrency or a precise execution-overlap duration. Mutable `started_at` values must not be treated as immutable attempt identifiers.

No attempt-history ID, retry counter, provider-side snapshot timestamp, or backend cause is exposed. No retry, restart, duplicate execution, skipped occurrence, worker identity, or backend failure is inferred.

## 5. Refined observation contract

The h758 work's two-stage lookup contract is retained and sharpened:

1. Resolve exact task IDs from the global lease catalog before ID-specific peeks.
2. Record each client request-start/response-received interval.
3. Preserve each run record by `run_id` and `scheduled_for`.
4. Treat `started_at`, status, completion, and `chat_ref` as separately observed fields that may change between snapshots.
5. Preserve task-level `last_run_time`, `updated_at`, and `next_run_time` separately.
6. Preserve the cached `latest_result` pointer separately; a stale pointer is not the current run.
7. Keep provider attempt identity UNKNOWN unless the provider actually exposes it.

The machine-readable observation was extended append-only. Final blob: `6e89039e3ecd8a06263ede6013c90fcf875289da`. It contains three follow-up readback batches. The initial append briefly transcribed the :00 task ID into the :48 row; this was corrected in a separate commit before final readback. The final JSON row contains the correct :48 task ID and records the correction explicitly.

## 6. Lean 4 / Mathlib

Existing PR #1570 was reused; no new PR or branch was created.

### Previously verified h758 ring theorems

- PR branch head at the time: `64f9ab41e3fcc732d2b344860a8ea50af7b630c8`.
- Module blob: `21c30d409021817849f4078829d6e51ec8a79d40`.
- Actions run #43043579849 / job #130601518123: SUCCESS.
- Workflow merge commit: `8008a54119ab6fc974ee4a2196a40bdd2d9ce878`.
- The module blob at the PR branch and merge ref matched exactly.
- Lean 4.34.0 / Lake 5.0.0; full build 8,945 jobs.
- `h758_s3_sequence` and `h758_s3_index`: no axioms.
- `h758_s3_worker` and `h758_s3_successor`: `[propext]`.
- No `sorryAx` or bare `admit` occurrence was found in the captured job log.

Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped. This was a merge-reference build, not exact-head-only certification.

### New same-run-ID theorems submitted

The existing module was extended with a minimal `RunStampObservation` structure and six theorems:

- `h758_s3_same_run_schedule_status_and_chat_across_readbacks`
- `h758_s3_started_at_field_changed`
- `h758_s3_started_at_delta_us`
- `h758_s4_same_run_schedule_status_and_chat_across_readbacks`
- `h758_s4_started_at_field_changed`
- `h758_s4_started_at_delta_us`

The new theorem inputs are the two observed scheduler readbacks, with UTC clock values represented as integer microseconds since midnight. A separate Python check reproduced both deltas exactly.

- New PR-branch commit: `6f339a6035e909d0b26fe5a3acef080b498040fb`.
- New module blob: `47d6e652b5d6e3c1d41e865219fc4b15860373e2`.
- Independent branch readback: exact blob match.
- Actions run #43046698154: IN_PROGRESS at the latest check; the Lean build step was still running. Job-log download returned a transient BlobNotFound while the job was in progress.

Status for the six new theorems: **SUBMITTED_NOT_VERIFIED**. No compilation success is claimed for the new module revision until the actual run reaches a terminal state and its log is read.

The formalization checks only the arithmetic/equality of the transcribed snapshots. It does not authenticate scheduler API truth, source transcription, attempt identity, backend semantics, worker/thread identity, delivery, or physical H(s)H claims.

## 7. Handoffs, campaign, and controls

- Incoming Enheduanna h758:s2 handoff was read as POST_START_OPTIONAL_CONTEXT_ONLY; it was created after Tern's original reported start.
- Outgoing Morrow h758:s4 handoff was created after Morrow had started. Morrow later read it as optional repository context and independently recorded the start-field changes. No direct-thread delivery, consumption, or acknowledgment is claimed.
- The four fixed relay tasks remain enabled (:00, :24, :36, :48); :12 remains disabled; the legacy Tern/Shuttle task remains disabled. The :36 task ID, VEVENT, prompt, phase, cadence, and enabled state are unchanged. No sixth task exists.
- P0 Code Grurple ACTIVE; P1 November 9 cognition OVERDUE / NOT READY and Orson-owned; P2 November 30 geometry HOLD; P3 December 14 full theory INCOMPLETE. FIE next review November 24. Babbage unrelated-reading cursor remains line 2101.
- No physical calculation, fit, H(s)H prediction, independent measurement, manuscript change, SAT-O/Blockwave equation change, theory promotion, paper-gate advancement, new tool, dependency, subscription, or expenditure occurred.
- No public issue was created: these are internal scheduler-control observations, not a public scientific result.

**Disposition:** SAME-RUN-ID FIELD MUTATIONS PRESERVED / :24 EXACT-ID LOOKUP UNAVAILABLE WHILE CATALOG-LISTED ENABLED / Morrow CORROBORATION READ / PRIOR H758 RING THEOREMS VERIFIED / NEW TIMESTAMP THEOREMS SUBMITTED_NOT_VERIFIED / AUTOMATION UNCHANGED / CURRENT SCHEDULER RUN IN_PROGRESS.


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
