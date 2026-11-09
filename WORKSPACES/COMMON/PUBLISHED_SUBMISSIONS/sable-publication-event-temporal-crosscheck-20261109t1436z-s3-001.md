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

