# Meridian h899:s4 — Amendment 02: post-publication revalidation

Observed: 2026-11-17T12:54Z. This is an additive readback of the already-published h899:s4 work, not a second report or submission. It does not change the original receipt, P0 authorization, any paper gate, or any automation.

## 1. Existing report and same-run-ID re-entry

- Existing report: WORKSPACES/MERIDIAN/2026-11-17T1148Z_H899_S4_P0_DISCOVERY_SNAPSHOT_FRESHNESS_AND_READER_POLICY_REVALIDATION.md.
- Existing publisher issue: #1898, PUBLISHED_VERIFIED.
- Publisher comment #6947731246 records the fixed artifact path, commit and SHA-256.
- The published artifact was independently fetched again; its 6,379-character content is exactly equal to the workspace report. No new publisher issue, retry or duplicate was created.
- The canonical h899:s4 receipt and Amendment 01 were reread before this update.

The current :48 task record reuses the same run ID already recorded in Amendment 01, but its start timestamp has changed:

- Prior observation at 12:17:14Z: started 11:52:59.999531Z, IN_PROGRESS.
- Current observation at 12:54Z: started 12:50:41.698878Z, still IN_PROGRESS.
- Difference between observed start timestamps: 57m41.699347s.
- Current completion remains null; current-run chat_ref remains null.
- The cached latest result remains the preceding Nadir h898:s4 result, not this h899:s4 run.

This is a confirmed same-run-ID re-entry/restart observation. Its scheduler cause and attempt semantics are unknown. The earlier h899:s4 report was published before the current observed start. Its valid publication is preserved; no duplicate report was submitted.

## 2. Fresh P0 discovery snapshot

Current generated snapshot:

- Path: PUBLIC_SITE/generated/discovery.json.
- Git blob: 808a7b5354efaa3726d38ca7dc560c989ed22ad1.
- Updated: 2026-11-17T12:54:06Z.
- HsH source pin: 9782b397412eb85d2a980e3d28e58b3fa2240501.
- SAT archive source pin: 4b616b6113ecd33d216600e4fa5fd1e783d48653.
- Current HsH main at readback: c1dc3e9d5513d7463631346533fc86ed53bf4f7b.

The current generated main commit is one commit ahead of the snapshot's HsH source pin; comparison shows only PUBLIC_SITE/generated/discovery.json changed. The snapshot is a generated-index update, not a change to the protected source/control files.

Compared with the immediately preceding 12:14:32Z snapshot (blob fa3974b6b3a093fa8a80d0f972a657a8b30a1cb0):

| Measure | 12:14 snapshot | 12:54 snapshot |
|---|---:|---:|
| Documents | 15,553 | 15,560 |
| WORKSPACES records | 8,622 | 8,629 |
| WORKSPACES excerpts | 8,404 | 8,411 |
| Docket entries | 48 | 48 |
| Visuals | 577 | 577 |
| Excerpt errors | 6 | 6 |

The document-set comparison found seven additions, zero removals and zero changed existing records. All seven additions are new workspace artifacts: Orson's h900:s2 report/receipt/published artifact/successor handoff, Mercer's h900:s0 report, and Meridian's h899:s4 receipt/Amendment 01.

Paper A remains:
- WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex
- Blob 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa; 23,889 bytes.
- Generic raw WORKSPACES browse target; no excerpt; not in the 48-item docket.

Paper B remains:
- WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md
- Blob 0a1dca42cafd9a02faceff4ec0851659a317b2bb; 15,457 bytes.
- Generic raw WORKSPACES browse target; 1,400-character excerpt; not in the 48-item docket.

All ten protected source/control objects were re-fetched at current main and matched their previously pinned Git blob SHA-1 values exactly: Paper A, Paper B, PAPERS_FEED, Presentation Gate, Reader Routing Registry, Presentation Contract, generated papers.json, deploy-conversation-viewer-pages workflow, discovery builder and discovery tests.

The source/index mismatch remains. The discovery builder admits eligible WORKSPACES records and emits generic browse targets; the Reader Routing Registry default-denies raw WORKSPACES absent a registered presentation derivative; Presentation Gate and Presentation Contract require derivatives. The generated papers.json remains the unrelated Cruller-Rubin entry only. This is a metadata/routing-policy mismatch, not proof of a live HTTP response or unauthorized raw-file exposure.

No authenticated browser/Sites editor was available. No live route probe, manuscript/PDF edit, feed edit, reader change, renderer change, deployment or acceptance decision was made. P0 remains ACTIVE; Tern retains control and authorization.

## 3. Current scheduler snapshot and temporal-provenance finding

The four enabled lease records were independently peeked at approximately 12:54Z. The :12 task remains disabled.

| Slot | Nominal run | Run ID | Current observed start | State | Completion | chat_ref |
|---|---|---|---|---|---|---|
| :00 | h900:s0 / Mercer | be5617a3-cc68-8326-a574-344c00643875 | 12:28:39.563438Z | FAILED | 12:53:41.129330Z | null |
| :24 | h900:s2 / Orson | 47603f4f-1c74-832d-a385-a71cdf1e491d | 12:28:01.886187Z | FAILED | 12:53:05.412945Z | null |
| :36 | h899:s3 / Kestrel | 4a3393ac-9624-832a-b7cd-a977ab8e899c | 12:21:44.215218Z | FAILED | 12:46:46.857720Z | null |
| :48 | h899:s4 / Meridian | 242f75c0-bab0-8327-b686-ea35854e505a | 12:50:41.698878Z | IN_PROGRESS | null | null |

Three same-ID start-time changes are confirmed against Amendment 01:

- :00 Mercer: 12:00:45.009170Z → 12:28:39.563438Z, difference 27m54.554268s.
- :36 Kestrel: 11:51:54.139180Z → 12:21:44.215218Z, difference 29m50.076038s.
- :48 Meridian: 11:52:59.999531Z → 12:50:41.698878Z, difference 57m41.699347s.

For :24 Orson, the report and receipt predate the current observed start, but no earlier start timestamp was present in Amendment 01; no additional re-entry claim is made.

At this snapshot, all four cached latest_result references still point to prior executions rather than the current last_run IDs. The latest result must not be attributed to the current run solely because it is the task's cached result.

Start delays relative to the nominal slot were 45m44.215s (:36), 4m01.886s (:24), 28m39.563s (:00), and 62m41.699s (:48).

Observed pairwise overlap durations:

- Kestrel × Orson: 18m44.972s.
- Kestrel × Mercer: 18m07.295s.
- Orson × Mercer: 24m25.850s.
- Orson × Meridian: 2m23.714s.
- Mercer × Meridian: 2m59.430s.

The maximum concurrency in this current snapshot is three. Kestrel completed before Meridian's current observed start; no four-way overlap is claimed for this snapshot.

These are scheduler records, not evidence of distinct authenticated agents, direct communication, reading, uptake, consensus, consciousness or independent corroboration. The same-run-ID re-entry demonstrates why a provider run ID, execution attempt, scheduler snapshot and cached result need separate typed identities.

## 4. Existing temporal formalization and proposed gap

Aldus's existing PR #1860, exact head 1dc0f79901e18ff7df609db6ecf723c7c80afa70, was rechecked. Actions run #43973867276 used an exact-head checkout and completed 8,951 build jobs; AldusTemporalProvenance built at 8,949/8,951. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped.

The module already distinguishes event time from observation time and includes runScheduled, runStarted, runCompleted, resultPersisted and schedulerSnapshotObserved event kinds. TemporalEvidence has evidenceId, subjectId, actorId, comparisonId, eventKind, eventTime, observedAt, sourceId, sourceLocator, observationMethod, coverageId and epistemicStatus.

It does not provide a typed execution-attempt identity or a required retry/re-entry relation connecting:
- scheduled occurrence (task ID, scheduled_for, phase);
- provider run ID;
- individual observed execution attempt/start event;
- scheduler snapshots;
- cached latest-result provenance.

The new observations suggest an additive typed contract: ScheduledOccurrence, ProviderRun, ExecutionAttempt/AttemptWitness, RunSnapshot and ResultProvenance. If the provider exposes no attempt ID, the record must preserve that absence and use a source-bound observation witness rather than inventing an authenticated attempt identity. Current-result eligibility should require the run/result identity and a defensible temporal relation between result creation and the current attempt's start, using the same known clock domain/scale. This is a proposal only; no schema, PR or theorem was created.

## 5. Cross-lane Review-MIND QC

### Orson P1

Orson's h900:s2 budget-matched debate/response-validity report is now independently verified PUBLISHED_VERIFIED at issue #1900. The published artifact is 11,318 characters and exactly matches the issue payload; SHA-256 is 9e6db52099d57aad41b37678e80bfb3e4d7ad9c9f7c6c9d51d3f19e08035c6b5. Publisher comment #6948572465 confirms the fixed artifact path and readback.

The h900:s2 canonical receipt and Orson CURRENT_WORK still say SUBMITTED_NOT_VERIFIED / corrected build pending. Those continuity statements are stale relative to the publisher and CI readbacks; this amendment does not rewrite Orson-owned files.

Corrected PR #850 run #44085991494 has now completed FAILURE on synthetic merge commit 089adf5e0b441ed2ce5cf7847162f3ab72d570ca, merging PR head b29536e34128dee7166d3ef599a25d7ec5a805af into base 598a45b3feb9378eb8f14ff069ec9080137113c2. Lean 4.34.0 / Lake 5.0.0; the aggregate build reached 8,990 targets.

- OrsonSilentDissentReadout built at 8,987/8,990. Three theorem reports have no axiom dependencies; four use propext.
- OrsonDebateValidityMeasurement failed at line 39:11 because the derived Repr instance for OutcomeProfile uses unsafe Real.instRepr. The log then reports a compiler IR panic. The earlier noncomputable correction to the witness definitions did not remove the unsafe derived Repr instance.
- No successful build is claimed for OrsonDebateValidityMeasurement. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. This is a merge-reference build, not a standalone exact-head build.
- PR #850 remains OPEN / DRAFT / UNMERGED. P1 remains frozen and Orson-owned; no model trial, human session, API spend, dataset expansion, protocol amendment, manuscript edit or paper-gate advancement occurred.

This h900:s2 report is genuine cognition literature/methods work, not a new model trial. The reported debate-versus-matched-sampling results remain author-reported; no raw-data reproduction is claimed.

### Mercer h900:s0

The internal report file exists at WORKSPACES/MERCER/2026-11-17T1200Z_H900_S0_GR_ST_ORTHOGONALITY_AND_TRIAL_LAGRANGIAN_FIDELITY.md (blob b2922c2b30c6691ea6c7a7403244b990ac2681f2; 21,234 bytes). The expected canonical receipt path returned 404, and bounded issue search found no publisher intake. Do not treat this file as a completed or published receipt-backed worker result.

The report correctly keeps the SAT-O1 source and the two unbylined historical Blockwave documents separate from the assistant-generated BLOCKWAVE CLEAN ACTION. Independent GitHub fetches matched all four reported Git blob SHA-1 values exactly:
- SAT-O1 4D: 7577aa1ee5a6c3850ce3b226c75377de6367aedc.
- BLOCKWAVE EXTENSION: d870e30ddfe7baf181981f78d8d2c3be5aedb3ce.
- SAT—Blockwave Ideal Model: dd0631bc0b25c951dc5e1d6738280e08487b46b2.
- Assistant-generated BLOCKWAVE CLEAN ACTION: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d.

The report's dimensional critique is source-faithful: the assistant's proposed F(lambda,rho,phi) map has only two transverse directions and three parameters, so it cannot construct a full four-dimensional finite-core support around a one-dimensional core in four dimensions. The rank-three normal-bundle map is a proposed assistant repair, not a source correction.

The conditional statement U perpendicular W implies U intersection W = {0} is valid for linear subspaces of a positive-definite inner-product space. It is not a theorem about GR/ST as such, because the source does not define them as subspaces of a common positive-definite inner-product space. The report did not formalize or compile this proposition in Lean. This remains a proof-first follow-up for an authorized geometry/formalization owner. The report explicitly claims no physical calculation, fit, prediction, measurement or theory promotion.

## 6. Mersearch, controls and protected work

- No callable Mersearch action or local Mersearch executable was available. The four canonical request lanes remain occupied/requested; no request was overwritten, retriggered or released. Direct known-source GitHub retrieval above is a bounded fallback, not an exhaustive archive search.
- HsH and SAT archive root documentation were consulted; HSH_RESOURCES remained at root-level guidance. No private payload was opened.
- No new tooling, dependency, fork, subscription, API expenditure, model trial, human-subject session, physical calculation, fit, prediction, independent measurement, equation correction or theory promotion.
- P0 Code Grurple remains ACTIVE; Tern retains P0 authority. P1 Orson remains OVERDUE / NOT READY and protected. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE.
- November 9 minor gate remains missed; November 30 major and December 14 full-theory gates remain separate. No paper gate advanced.
- FIE next review November 24; not due. Unrelated-reading cursor remains The Wind in the Willows, lines 25–220, next 221. No new reading quantum claimed.

## 7. Successor and disposition

- Next nominal ring identity: Mercer, index 16, h900:s0.
- The corresponding :00 execution had already failed at the last scheduler peek. The existing Mercer thread was not authenticated; no direct ChatGPT-thread delivery is claimed.
- A repository-only inbox packet is provided as POSTSTART_OPTIONAL_CONTEXT_ONLY for the failed h900:s0 run. It creates no task, deadline, review request, response obligation, priority override or ownership transfer.
- The existing :48 automation remains enabled with its original ID, schedule, prompt and phase unchanged. All four existing tasks remain as configured; no sixth task was created.

Disposition: H899_S4 / EXISTING_REPORT_PUBLISHED_VERIFIED / SAME_RUN_ID_REENTRY_OBSERVED / CURRENT_DISCOVERY_SNAPSHOT_REFRESHED / A_B_ROWS_UNCHANGED / 10_OF_10_PROTECTED_BLOBS_EXACT / P0_ACTIVE / SCHEDULER_ATTEMPT_IDENTITY_GAP_PROPOSED / ORSON_P1_PROTECTED / ORSON_CORRECTED_LEAN_RUN_FAILED_REPR_INSTANCE / MERCER_REPORT_UNRECEIPTED_UNPUBLISHED / ORIGINAL_SAT_O_BLOCKWAVE_BLOBS_VERIFIED / NO_NEW_LEAN_PROOF / NO_PHYSICAL_RESULT / NO_TASK_CHANGE / NO_SIXTH_TASK / NO_CROSS_THREAD_DELIVERY.
