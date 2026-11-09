# Publication-attempt vs persisted-artifact temporal classification

**Date:** 2026-11-09 14:36 UTC  
**Run key:** `REVROT3-19-20261011:710:s3`  
**Classification:** source-grounded workflow-architecture cross-check; no schema, code, Lean module, scheduler, paper, or theory change.

## Result

Two real publisher cases that both precede their nominal relay's recorded start must receive different event classifications:

- **Issue #1499:** a publication attempt was opened, then rejected for an exact SHA-256 mismatch. No artifact was committed or read back. This is `ATTEMPT_BEFORE_RECORDED_START`, not an artifact-before-start event.
- **Issue #1490:** a publication attempt produced a committed artifact whose bytes and digest were read back exactly. This is `ARTIFACT_BEFORE_RECORDED_START`.

In both cases, the nominal run key is present in the submission ID, but no exact producer run ID or distinct attempt token is exposed. Producer attribution therefore remains unresolved.

This is a source-backed regression pair for the existing process-attempt / publisher-readback / artifact-observation architecture, not a proposal for a second ledger.

## Case A — rejected attempt, no artifact

Source: [HsH issue #1499](https://github.com/Satobloc/HsH/issues/1499), submission `sable-task-upkeep-triage-explainability-20261108t1936z-s3-001`.

- Issue created: **2026-11-08T20:02:15Z**.
- Publisher comment #6726423212: `REJECTED: SHA-256 mismatch`.
- The issue payload had the required four keys. Its content was **5,600 UTF-8 bytes** and did **not** end in LF.
- Declared digest: `f6c733be0e7bb0f1c3200f6f5e1c707aadbcbf58bf3935ccda17090c415286b1`.
- Independently recomputed `SHA256(UTF8(content))`: `6f888d0fb7aa38a76ad2aec9483b964b83e505729a47d4ef1e314164ac2acdea`.
- Independently recomputed `SHA256(UTF8(content + LF))`: `f6c733be0e7bb0f1c3200f6f5e1c707aadbcbf58bf3935ccda17090c415286b1`, exactly matching the declared value.
- The expected fixed-destination artifact path returned 404. No committed artifact or readback exists.

The h691:s3 :36 scheduler snapshot recorded start **2026-11-08T20:37:05.364938Z**, which is **2,090.364 seconds (34m 50.364s)** after issue creation.

**Correct classification:** `PUBLICATION_ATTEMPT_BEFORE_RECORDED_START / PUBLISHER_REJECTED_SHA256_MISMATCH / NOT_PUBLISHED / PRODUCER_ATTRIBUTION_UNRESOLVED`.

Do not call this `ARTIFACT_BEFORE_RECORDED_START`: there is no artifact event. Do not edit/reopen issue #1499, resubmit its submission ID, create a duplicate, or bypass the opened-only publisher. The issue remains the sole public incident record.

## Case B — persisted artifact before recorded start

Source: [HsH issue #1490](https://github.com/Satobloc/HsH/issues/1490), submission `orson-trail-persona-memory-carryover-20261108t1536z-s3-001`.

- Issue created: **2026-11-08T16:05:02Z**.
- Publisher commit: `cd15987f1e798d5a8160567f3be03fdae8a8f9a6`, committed **16:06:36Z**.
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-trail-persona-memory-carryover-20261108t1536z-s3-001.md`.
- Artifact blob: `3f598b9d0d3868f99d299f49f4d0bde6d76fa2d5`.
- Issue-payload and artifact content are byte-identical.
- SHA-256: `488eb686376d8614e64826d29fffab73527827711e246213330ea8c064607723`.
- Publisher comment #6723779198 records publication and readback verification.

The h687:s3 :36 scheduler snapshot recorded start **2026-11-08T16:07:45.958473Z**. Issue creation preceded that start by **163.958 seconds**; publisher commit preceded it by **69.958 seconds**.

**Correct classification:** `ARTIFACT_BEFORE_RECORDED_START / PUBLISHED_VERIFIED / PRODUCER_ATTRIBUTION_UNRESOLVED`.

The artifact's content and persistence are verified. Its producer is not. The submission ID's nominal h687:s3 label is not an authenticated scheduler run ID or attempt token.

## Architecture refinement

The existing design already has the right major separations:

1. Elias's [publisher-attempt and evidence-ledger architecture](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/2026-11-03T2336Z_PUBLISHER_ATTEMPT_AND_EVIDENCE_LEDGER_ARCHITECTURE.md) distinguishes process-attempt state from publisher-readback evidence. A process attempt may be submitted, started, cancelled, completed, rejected, or read back; these are not interchangeable evidence outcomes.
2. Orson's [h687 same-key artifact attribution case](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/2026-11-08T1536Z_H687_SAME_KEY_ARTIFACT_ATTRIBUTION_CASE.md) adds an append-only artifact observation and separates artifact integrity from producer attribution.
3. The existing [Elias Track A formalization, PR #951](https://github.com/Satobloc/HsH/pull/951), models occurrence identity, attempt identity, result identity, and conservative result acceptance. It requires a distinct nonempty attempt token, matching occurrence identity, temporal compatibility, and completed status.

The new contribution is a **two-case temporal regression specification** for those existing layers:

| Evidence observed | Temporal class | Artifact state | Producer attribution |
|---|---|---|---|
| Issue opened; publisher rejects; artifact path absent | `ATTEMPT_BEFORE_RECORDED_START` | `NOT_PUBLISHED` | `UNRESOLVED` without exact run/attempt binding |
| Issue opened; publisher commits; exact artifact readback | `ARTIFACT_BEFORE_RECORDED_START` | `PUBLISHED_VERIFIED` | `UNRESOLVED` without exact run/attempt binding |

Record `issueCreatedAt` and `publisherCommitAt` separately. Compare each event time with the scheduler's recorded `started_at`. Do not collapse them into one timestamp or infer a retry, restart, earlier attempt, or scheduler defect from chronology alone.

Keep three axes independent:

- **Attempt outcome:** submitted / accepted / rejected / cancelled / failed / unknown.
- **Artifact persistence and integrity:** absent / committed / exact readback verified / mismatch / unknown.
- **Producer attribution:** exact run-and-attempt binding / unresolved / not exposed.

A nominal run key, issue number, worker label, or task-level conversation pointer is not a producer credential. A `latest_result` pointer is separate from `last_run`; compare both run IDs and their timestamps before attributing content to the current occurrence.

## Publication preflight applied to this report

The previous rejection was caused by hashing a final LF that was not present in the submitted `content` string. This submission uses a preflight before issue creation:

1. Freeze the exact Markdown content, including its intentional final LF.
2. Compute SHA-256 over exactly `UTF8(content)`, not over an imagined normalized variant.
3. Serialize the four-key `hsh-publish-v1` envelope.
4. Parse it back and verify exact key set, byte count, final-LF state, unchanged content, and recomputed digest.
5. Only then open the issue; after Actions, independently verify the publisher comment and exact artifact readback.

This is a one-run use of the existing publisher, not new tooling or a workflow-code change.

## Formalization and limits

No new Lean theorem or module was introduced. The event classification is a source-level workflow acceptance rule, not a new physical or geometric proposition. The existing PR #951 remains owner-specific Track A work. Its current head `9b88076a842814ebe69e53420551c6450a99c2d3` is open/draft/unmerged; exact-head Actions run #42623155056 failed at the **Install Lean and compile formal library** step. The connector exposed no job-log cause, so this is a CI failure of unknown cause, not evidence that a particular theorem is false. The earlier successful run on an older head is not current-head proof evidence. No new Lean run was initiated.

This report does not establish scheduler backend semantics, authenticate a producer, prove a retry/restart, or validate any physical model. No physical calculation, measured-data fit, prediction, H(s)H candidate promotion, BEDROCK change, SAT-O/Blockwave equation edit, or P1/P2/P3 gate advancement occurred.

## Next bounded use

When the existing Track B owner reviews the event model, add these two cases as acceptance fixtures to the existing process-attempt / publisher-readback architecture. Preserve the existing issue IDs and artifacts; do not create duplicate submissions.



## Internal execution record

### Rotation and source authority

- Nominal UTC slot: **2026-11-09T14:36:00Z**.
- (h=710), (seq=5h+3=3553), (3553 \bmod 19=0).
- Selected label: **Sable** (index 0); successor: **Loom** (index 1).
- This is deterministic routing, not authenticated ChatGPT instance/thread identity.
- Existing-thread-first check: no authenticated current Sable thread surfaced. The historical Sable remit was recovered from the raw Library export **Sable Revival Rotation**, inspecting direct Nathan-authored messages rather than treating an assistant summary as the charter. The supported remit is systems/workflow architecture, team-state and resource/tool audits, durable continuity, provenance, and quarantine separation.
- The same-hour predecessor h710:s2 Ravel handoff and receipt were not present at their expected paths (404). h710:s1 Mercer and h710:s0 Meridian receipts were also absent. This is `HANDOFF_MISSING_OR_IN_FLIGHT`, not evidence that those workers did not run.

### Live control and repository state

- Read current BEDROCK and its 2026-11-08 primary operational methodology, Steering Charter 2026-10-26, Phase Steering, Three Paper Campaign, three-repository onboarding, current workflow orientation, Revival Rotation V3/V4 and thread-first rules, task branch graph, Sable checkpoint/inbox, and current receipts/handoffs.
- HsH main before this report write: `19ab090320f15d7543067f0b70c1d8a2aa48c339`.
- SAT archive main head recorded: `35804a91bca29e596033837971de5db9848e9dfb`; its top-level annotated archive survey was read. HSH_RESOURCES main head recorded: `f00a82caa091df02e745b772a695e6c59fb4de8d`; its README, human-readable index, and Tool Chest were read. The private-resource boundary was preserved.
- HSH_RESOURCES Tool Chest and HsH write-safety instructions were inspected. No local HsH checkout or local `lean`, `lake`, or `elan` executable was present. The existing issue publisher is the approved public route; direct Contents API is the documented fallback for internal continuity files. No new tooling was built.
- Mersearch was not exposed in this runtime. Raw Library/Files source retrieval and GitHub repository reads were used; no Mersearch run is claimed. No quarantined `PRIOR_ART` surface was accessed.

### Formalization and ownership boundary

- Existing Elias Track A PR #951 remains open/draft/unmerged. Current head: `9b88076a842814ebe69e53420551c6450a99c2d3`.
- Exact-head Actions run #42623155056 failed at **Install Lean and compile formal library**. The connector exposed no job-log cause; no theorem-specific failure is inferred. The earlier successful run was on an older head and is not current-head evidence.
- No PR #951 edits, new Lean module, theorem, or build were made. The new contribution is a source-backed temporal regression pair for the existing process-attempt / publisher-readback / artifact-observation architecture, not a second ledger or a physical proposition.

### Paper and freshness gates

- P1, Nov 9 cognition paper: **Orson-owned / NOT READY**.
- P2, Nov 30 measured-system geometry: **HOLD**.
- P3, Dec 14 full theory: **INCOMPLETE**.
- FIE rereview: last full review 2026-10-27; due 2026-11-10, not yet due.
- Unrelated reading continued Lewis Carroll, *Alice's Adventures in Wonderland*, Chapter I, Project Gutenberg eBook #11, lines 181–220; next cursor **221**. Source: https://www.gutenberg.org/cache/epub/11/pg11.txt
- No physical calculation, fit, prediction, data-free numerical fixture, SAT-O/Blockwave equation edit, manuscript gate advancement, or BEDROCK theory promotion occurred.

### Current automation observation

- Existing task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Enabled: **true**.
- Exact schedule preserved: `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`.
- Current `last_run.id`: `fb39c0d9-a528-832e-bee5-c5af6b3912d0`; scheduled `2026-11-09T14:36:00Z`; started `2026-11-09T14:38:01.509008Z`; recorded status **in_progress**; `completed_at=null`; `chat_ref=null`.
- `latest_result.run_id=f7379c01-874c-8322-89d6-483e208e303b` belongs to h700 Calder, scheduled 04:36Z and completed 05:45Z. It is stale relative to the current h710 run and must not be attributed to Sable.
- No task ID, enabled state, schedule, phase, cadence, or task count was changed. No sixth task was created.

### Publication verification

- New public issue: #1529.
- Submission ID: `sable-publication-event-temporal-crosscheck-20261109t1436z-s3-001`.
- Exact content SHA-256: `7706e53913fe59b0b76ee39d3f668078fb347561009e887a0f81d32f5915b5df`; UTF-8 bytes: **8286**; final LF present; four-key JSON round-trip and exact digest preflight passed.
- Publisher Actions run #42639169169 completed **SUCCESS**.
- Publisher comment #6743143988: `PUBLISHED`, commit `47b5178a260efeb814b65a65896ecaa0fca192e1`, exact digest above, readback verified.
- Published artifact blob: `81a9e8239bfe2b9d760265b05071af7cf6ab488f`. Independent fetch confirmed exact content equality with the issue payload; status **PUBLISHED_VERIFIED**.
