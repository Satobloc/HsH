# h687:s3 — Same-key artifact / recorded-start attribution case

**Status:** INTERNAL WORKFLOW ARCHITECTURE ADDENDUM / SAME-KEY OUTPUT RECONCILED / PRODUCER ATTRIBUTION UNRESOLVED. No code, Lean module, scheduler, paper, or theory change.

## 1. Deterministic selection

- Nominal slot: 2026-11-08T15:36:00Z.
- h = 687; seq = 5h + 3 = 3438; 3438 mod 19 = 18.
- Selected deterministic label: Orson Vay, ring index 18.
- Successor: Sable, ring index 0.
- Run key: REVROT3-19-20261011:687:s3.
- Successor key: REVROT3-19-20261011:687:s4.

The ring label is not authentication of a historical or current ChatGPT instance.

## 2. Read-only scheduler state

Existing :36 automation:
- ID: 6a9f52b69ec08191b0a2ba24a074f781.
- Enabled: true.
- Exact existing schedule: DTSTART;TZID=America/New_York:20261001T143600; RRULE:FREQ=HOURLY.
- No task, ID, phase, cadence, enabled-state, or prompt change was made.

The latest peek reports:
- last_run.id = 07f17957-e5f8-8333-ba8c-4589832ed33d.
- last_run.scheduled_for = 2026-11-08T15:36:00Z.
- last_run.started_at = 2026-11-08T16:07:45.958473Z.
- last_run.recorded_status = in_progress.
- last_run.completed_at = null.
- last_run.chat_ref = null.

The cached latest_result is a different run:
- latest_result.run_id = 52714cd9-3300-8324-b4d9-70faff69c311.
- scheduled_for = 2026-11-08T10:36:00Z.
- created_at = 2026-11-08T11:08:05.174504Z.
- completed_at = 2026-11-08T11:08:06.650998Z.
- Its content is the earlier h682 Tern result. It is not the current h687 result and is not attributed to this run.

No attempt token or per-snapshot observation timestamp is exposed. In-progress does not establish worker liveness.

## 3. Existing same-key artifact and timing discrepancy

The public publisher artifact for this nominal key already exists:

- Issue: https://github.com/Satobloc/HsH/issues/1490
- Submission ID: orson-trail-persona-memory-carryover-20261108t1536z-s3-001.
- Issue created: 2026-11-08T16:05:02Z.
- Published artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-trail-persona-memory-carryover-20261108t1536z-s3-001.md.
- Artifact Git blob: 3f598b9d0d3868f99d299f49f4d0bde6d76fa2d5.
- Publisher SHA-256 recorded in the issue comment: 488eb686376d8614e64826d29fffab73527827711e246213330ea8c064607723.
- Publisher commit: cd15987f1e798d5a8160567f3be03fdae8a8f9a6, committed 2026-11-08T16:06:36Z.
- Exact fetched issue-payload content equals the fetched artifact. The publisher comment records PUBLISHED and readback verified.

The issue was created 163.958473 seconds before the scheduler's recorded start. The publisher commit was committed 69.958473 seconds before that recorded start.

The artifact's content is the source-grounded TRAIL longitudinal persona-memory carryover and 2x2 identifiability review. It is already published. No second issue, artifact, or publisher submission was created.

The artifact submission ID encodes the nominal h687:s3 key, but it does not expose the current scheduler run ID or a unique attempt token. Therefore the correct distinction is:

- Artifact integrity/publication: VERIFIED.
- Nominal run-key match: YES.
- Artifact before the currently recorded start: YES.
- Producer run/attempt identity: NOT EXPOSED.
- Current run attribution: UNRESOLVED.

The artifact may belong to an earlier execution whose scheduler start was recorded late, another execution associated with the same nominal slot, or another timing/recording path. The available timestamps do not distinguish these possibilities. Do not claim that the current recorded run produced the artifact, and do not infer a scheduler defect or a retry.

The expected h687:s3 canonical receipt and s3-to-s4 handoff paths were absent at preflight. This reconciliation creates those continuity records without duplicating the already-published research artifact.

## 4. Substantive architecture improvement: artifact-event lineage

Aster's h680 report, WORKSPACES/COMMON/2026-11-08T0836Z_ASTER_ATTEMPT_SNAPSHOT_LINEAGE_TEST_CASE.md (blob 473aaec6f860b629ce1c05ee0fd3fcb172634f65), proposed an append-only AutomationSnapshotObservation layer for the existing Elias occurrence/attempt/result model. That layer records what a scheduler connector reported at each observation time.

The h687 case identifies a distinct missing event class: a research artifact can be published under a nominal run key before the scheduler's currently recorded start. A snapshot of scheduler state alone cannot establish which execution produced that artifact.

**Additive proposal for Track B review, not a canonical schema change:**

AutomationArtifactObservation {
  observedAtUnixMicros,
  submissionId,
  nominalRunKey,
  automationId,
  scheduledForUnixMicros,
  issueNumber?,
  issueCreatedAtUnixMicros?,
  publisherCommitSha?,
  publisherCommitAtUnixMicros?,
  artifactPath,
  artifactBlobSha?,
  contentSha256?,
  readbackVerifiedAtUnixMicros?,
  producerRunId?,
  producerAttemptToken?,
  sourceCommitSha?
}

The current connector does not expose all these fields. Missing values must remain NOT_EXPOSED rather than being reconstructed from a task title or nominal slot.

**Acceptance rules:**

1. Keep artifact integrity and producer attribution as separate axes. PUBLISHED_VERIFIED means the artifact was persisted and its content/hash was read back; it does not identify the producing execution.
2. A nominal run key embedded in a submission ID is a routing label, not an authenticated producer ID or attempt token.
3. Attribute an artifact to a run only when a trusted publisher/receipt event binds the exact submission ID to the exact scheduler run ID or attempt token, with compatible source-commit and event chronology.
4. If issue creation or publisher commit precedes the scheduler's recorded start, preserve the observation and classify ARTIFACT_BEFORE_RECORDED_START / PRODUCER_ATTRIBUTION_UNRESOLVED. Do not silently rewrite the start time or infer an earlier attempt.
5. Keep latest_result as a separate pointer. A latest_result.run_id that differs from last_run.id is not the current run's output.
6. A null chat_ref means no current thread binding. A deterministic worker label does not authenticate the producer.
7. Append observations; do not overwrite earlier scheduler or artifact timestamps.

**Current case classification:**

| Axis | Status |
|---|---|
| Artifact persistence and content readback | PUBLISHED_VERIFIED |
| Nominal h687:s3 key | MATCH |
| Issue creation before recorded run start | TRUE |
| Publisher commit before recorded run start | TRUE |
| Exact producer run ID | NOT_EXPOSED |
| Unique producer attempt token | NOT_EXPOSED |
| Cached latest_result matches last_run | FALSE |
| Current chat_ref | NULL |
| Producer attribution | UNRESOLVED |

This is an additive extension of the existing EvidenceLedger/attempt-result architecture, not a second ledger. No code, schema, PR #951, or scheduler control was changed.

## 5. Formalization and empirical boundaries

The cognition design theorem is already represented in Orson's draft PR #1115, module HumanAIMemoryCarryover.lean. Current PR head: 7e3b3e5e1ac9933cd6a7c0f5c42879b469f34c7e; module blob: bc2aeb0b533fe85933bcb151d0642d222e0b4e21; root import blob: e510a169788ec6689cf5c8c18d9c2fb71f554554.

PR #1115 remains OPEN / DRAFT / UNMERGED. The only Actions run found on the current head is push-triggered conversation-json-content-ci run #42496973026, which failed. It is not a Lean run; the PR-triggered workflow lookup returned no runs and the run-job listing returned no jobs. The local runtime has no lean, lake, or elan executable. Formal verification status therefore remains LEAN_NOT_RUN. No compilation, theorem-specific axiom result, or proof success is claimed.

The conditional 2x2 theorem remains distinct from causal identification, source translation, platform implementation, and empirical behavior. No participant data, platform code, memory snapshots, model requests, human session, model trial, API call, or API spend was accessed or produced.

No physical calculation, fit, H(s)H prediction, SAT-O/Blockwave equation change, BEDROCK promotion, or theory claim was made.

## 6. Historical remit, source recovery, and campaign boundaries

The live Steering Charter protects Orson's LLM-cognition remit and approximately four-of-five actual substantive appearances. This h687 work is cognition-focused. Recent :36 work records h611 VEY-030, h630 VEY-031, h649 VEY-032, and an h668 CGD projection/dual-history entry in Orson CURRENT_WORK. The h668 expected receipt path was not recovered, so its work is treated as a current-work record, not an independently verified receipt. No distinct historical/current ChatGPT instances are inferred.

The original October 9 Orson role-reset message remains unrecovered. The current role card is an assistant-maintained synthesis, not a verbatim Nathan-authored charter. The existing Mersearch request orson-cognition-origin-bank-20261103-1745 was reused; its manifest covers all three repositories and its compact receipt records 16,942 files, 21,037,890 records, 135 hits and 74 distinct paths, with zero SAT archive-root hits. Raw result files remain withheld. No new Mersearch request or lane overwrite was made.

P1 remains Orson-owned, ACTIVE / METHODS-ARCHIVAL / NOT READY for November 9. Its frozen ConsistencyBench scope is unchanged. P2 November 30 and P3 December 14 remain separate; no paper gate advanced. FIE's last full review remains October 27, with the next review due November 10. The recent unrelated Babbage reading cursor remains lines 1581–1620 read, next cursor 1621; it was not repeated.

The current task graph still declares branch_count 16 while listing 18 records. Tern owns that reconciliation; no graph edit was made.

## 7. Disposition

- Existing issue #1490 and its artifact: VERIFIED; do not duplicate.
- New architecture result: additive artifact-event lineage gate specified and recorded.
- PR #1115: unchanged; LEAN_NOT_RUN.
- Scheduler task: unchanged and enabled.
- Current scheduler run: IN_PROGRESS in the last readback; completion not verified.
- Current ChatGPT thread: NOT AUTHENTICATED.
- Next deterministic label: Sable, h687:s4.
- No task, ID, schedule, phase, enabled state, branch ownership, paper scope, or theory status was changed.
