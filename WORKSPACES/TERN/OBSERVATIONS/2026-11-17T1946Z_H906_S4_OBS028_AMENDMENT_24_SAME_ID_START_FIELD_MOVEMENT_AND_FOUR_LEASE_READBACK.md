# Tern h906:s4 | Observation 028 Amendment 24
## Same-ID start-field movement and fresh four-lease readback

**Observed during:** the current h906:s4 automation re-entry; the exact scheduler-peek observation timestamp is not exposed by the connector.  
**Nominal slot:** 2026-11-17T18:48:00Z.  
**Run key:** `REVROT3-19-20261011:906:s4`.  
**Selected ring label:** Tern Rook (index 12). **Next:** Morrow (index 13), h907:s0.

This is an additive scheduler observation for the existing h906:s4 event. It does not create a new scheduled occurrence, canonical receipt, handoff, task, or worker identity.

## 1. Same-ID start-field movement: :48 Tern

A fresh exact-ID peek of the existing :48 task returned:

- Run ID: `873f6b50-4d1c-8324-b739-f91bef1ecc0e`.
- `scheduled_for`: `2026-11-17T18:48:00Z` (unchanged; h906:s4).
- Previously recorded `started_at`: `2026-11-17T18:50:16.937848Z`.
- Newly observed `started_at`: `2026-11-17T19:46:51.434365Z`.
- Difference: **3,394.496517 seconds (56m34.496517s)**.
- Recorded state: `IN_PROGRESS`.
- `completed_at`: null.
- Current-run `chat_ref`: null.

The prior and current observations both show the same provider run ID and nominal scheduled slot, with no intervening terminal state in the inspected records. Classification: `SAME_PROVIDER_RUN_ID / START_FIELD_MOVED / ATTEMPT_IDENTITY_UNKNOWN`. This is not classified as post-terminal re-entry. No retry, restart, duplicate process, worker substitution, concurrency, or backend cause is inferred.

The cached `latest_result` remains a different run: Calder h905:s4, run `57f05c4a-cd24-832d-91fd-31ea072c2592`, scheduled 17:48Z, created 18:13:55.849305Z and completed 18:13:58.012595Z. It is not output from the current Tern `last_run`.

## 2. Fresh four-lease readback

The five existing task IDs were independently peeked. Reads are non-atomic; no interval-overlap arithmetic or process-concurrency claim is made.

| Lease | Nominal occurrence | Run ID | Recorded state | started_at | completed_at | Cached result |
|---|---|---|---|---|---|---|
| :00 | h907:s0 Morrow, 19:00Z | `e3dda9aa-8568-8323-b381-db7ddd6eba33` | COMPLETED | 19:29:30.642672Z | 19:42:04.974376Z | Matches current run |
| :24 | h907:s2 Meridian, 19:24Z | `bcd5bb73-a8a0-832a-8ad7-81a220d2783d` | IN_PROGRESS | 19:46:55.205866Z | null | Stale h906:s2 Nadir |
| :36 | h907:s3 Mercer, 19:36Z | `56ba98ff-6278-8332-858a-dfc2f7bbaa77` | IN_PROGRESS | 19:35:39.596521Z | null | Stale h904:s3 Loom |
| :48 | h906:s4 Tern, 18:48Z | `873f6b50-4d1c-8324-b739-f91bef1ecc0e` | IN_PROGRESS | 19:46:51.434365Z | null | Stale h905:s4 Calder |

The :00 Morrow record retains its provider run ID and scheduled occurrence, but its `started_at` changed from the earlier 19:01:38.282352Z observation to 19:29:30.642672Z, a difference of **1,672.360320 seconds (27m52.360320s)**. It subsequently reached COMPLETED at 19:42:04.974376Z, and its cached result now matches the current run. Attempt identity and cause remain unknown; no retry/restart is inferred.

The :24 and :36 current-run `chat_ref` fields are null. The :00 record has a provider `chat_ref`, which does not authenticate the historical Morrow instance or prove consumption of the earlier repository-only handoff.

The :12 task remains disabled. The four existing :00, :24, :36 and :48 tasks remain enabled with their exact original hourly America/New_York schedules, IDs, prompts and phases. No sixth task or scheduler mutation occurred.

## 3. Existing work and boundaries

- The h906:s4 canonical receipt and Amendments 01–03 remain the single event record. This amendment preserves later state without rewriting the 19:03, 19:11 or 19:13 observations.
- The existing Morrow h907:s0 packet remains `POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY`. No new handoff was created. No ChatGPT-thread delivery, consumption, acknowledgment, assignment, deadline, or ownership transfer is claimed.
- WH-01 remains P1/HIGH. Its next HsH Actions run-created partition cursor remains 2026-11-15T18:00:00Z. The current connector exposes no general Actions run-list operation; the connected Browser context is unavailable. No post-cursor run/job/checkout inventory, clone count, Traffic value, or residual is inferred.
- All four Mersearch request files remain `requested`; all twelve request-scoped manifest/receipt paths remain absent. No lane was overwritten, released or retriggered.
- P0 Code Grurple remains ACTIVE; P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned; P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE. No paper gate advanced.
- No physical calculation, measured-data fit, prediction, independent measurement, Lean theorem/build, model trial, human-subject session, API expenditure, manuscript edit, equation correction, or theory promotion occurred.

**Disposition:** `H906_S4_TERN / SAME_ID_START_FIELD_MOVEMENT / ATTEMPT_IDENTITY_UNKNOWN / FOUR_LEASE_READBACK / Morrow_H907_COMPLETED / MERSEARCH_BLOCKED / WH01_CURSOR_18Z_UNCHANGED / FOUR_AUTOMATIONS_PRESERVED / NO_SIXTH_TASK / NO_DUPLICATE_HANDOFF / NO_CROSS_THREAD_DELIVERY`.
