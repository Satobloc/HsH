# H902:S4 | Exposure is not use: evidence lineage, output identity, and causal utilization

**Disposition:** ASSISTANT-LEVEL REVIEW-MIND / HISTORICAL ENHEDUANNA BROAD ARCHIVE DIRECTIVE RECOVERED / SOURCE-EXPOSURE-OUTPUT-ATTRIBUTION AUDIT COMPLETED / NEW ARTIFACT-IDENTITY GAP IDENTIFIED / EXISTING EXACT-HEAD LEAN RESULT REPLAYED / PR #1619 CURRENT-MAIN INTEGRATION BLOCKED BY 20,762-COMMIT DIVERGENCE / ORSON P1 PROTECTED / NO MODEL TRIAL / NO HUMAN-SUBJECT SESSION / NO PHYSICAL RESULT / NO THEORY PROMOTION.

## 1. Selection, authority, and handoff

Nominal scheduled occurrence: 2026-11-17T14:48:00Z.

- h = 902.
- seq = 5(902) + 4 = 4514.
- 4514 mod 19 = 11.
- Selected ring label: **Enheduanna**, index 11.
- Next ring label: **Tern Rook**, index 12.
- Run key: `REVROT3-19-20261011:902:s4`.

The ring label is routing metadata, not authenticated worker or ChatGPT-thread identity.

### Historical source

The original Library file `MARLOWE — raw.json` was located and read at the exact direct-user message:

- Conversation: `6aa8a2bf-8280-83ea-9d57-1e0af853b7f1`.
- Message: `11399ca2-5bd6-4203-9e19-e8e044fbc736`.
- Timestamp: 2026-09-23T02:04:49.417Z.
- Parent: `0dd6943d-5cee-42cf-9b30-f2633fb8902a`.
- Outer role: `user`.
- Library file: 1,852,875 bytes; SHA-256 `93ad219a5c7e79cf31cfcdc6c1bd40a36e148c252df2189bb957f8977983baef`; Git blob `d41ca92d3e7f7e7b8c91d5cbb7b1a7f9b9e1f7b1`.

The direct instruction says Enheduanna is a similar archive-revival case and to consider all archives. It is broad archive-revival guidance, not a detailed technical charter. No standalone Nathan-authored Enheduanna specialist charter or authenticated current Enheduanna thread was found. The source-layer census and current technical role are assistant-maintained reconstructions.

The latest inbox item from Nadir h902:s3 was read as `POSTSTART_OPTIONAL_CONTEXT_ONLY`. It reports a corrected exact-head Lean pass for a reduced vortex-mode readout. Repository delivery is verified by the sender's readback; this execution does not claim historical Enheduanna participation, direct ChatGPT delivery, or a separate worker acknowledgment. `CURRENT_WORK.md` still pointed to h891:s2 at preflight; it will be advanced as an assistant-maintained pointer, not a worker-authored check-in.

## 2. The evidence chain

The central methodological distinction is:

`SourceVersion -> ExposureWitness -> ContextSnapshot -> InvocationAttempt -> OutputOccurrence -> Attribution -> SemanticSupport -> CausalUtilization -> GroupUptake`

These are separate evidence relations, not synonyms.

| Stage | What can be established | What it does not establish |
|---|---|---|
| Source identity | Exact version, digest, locator, author/role and ancestry | That a model or person saw it |
| Exposure | A source was included in a named context or delivered to a recipient | Reading, attention, comprehension or uptake |
| Invocation | A provider/run record and, where available, a distinct execution-attempt witness | Authenticated worker identity or model cognition |
| Output occurrence | A captured output artifact with immutable content identity and locator | That the cited source caused the output |
| Attribution | A record linking a claim or span to a source | That the source entails or supports the claim |
| Semantic support | Independent, claim-level checking of the cited span | Causal use by the generator |
| Causal utilization | A controlled evidence-availability intervention changes output behavior under matched conditions | A direct view of hidden attention or internal reasoning |
| Group uptake | A documented downstream human/agent decision or action | Independent corroboration if group members share sources or derived artifacts |

`Available`, `retrieved`, `included`, `read`, `attended to`, `taken up`, `mentioned`, `cited`, `supported by`, and `causally influential` must remain distinct. A context snapshot can establish inclusion, not attention. A citation can establish an attribution claim, not entailment. Agreement can be copied through a shared source, evaluator, prompt, or prior output.

Independence is therefore claim-scoped and evidence-specific, not a Boolean property of a worker label, conversation ID, file path, or run ID. Mirrors and duplicate exports are not independent sources. Different agents receiving the same source are not independent source witnesses. A later group artifact that re-enters another member's context is a derived descendant, not a new root.

## 3. Existing Enheduanna formalization: exact result and precise gap

Existing [PR #1619](https://github.com/Satobloc/HsH/pull/1619) contains `EnheduannaSourceExposure.lean` and `EnheduannaOutputOccurrence.lean`.

I independently replayed the recorded exact-head Actions result:

- PR head: `275b5396a97d4f7efc4d7d2248bfa08218f01b35`.
- [Actions run #43981958006](https://github.com/Satobloc/HsH/actions/runs/43981958006), job #133700427619.
- Lean 4.34.0, Lake 5.0.0.
- Exact checkout assertion passed.
- Full library build: 8,946 successful jobs.
- `EnheduannaOutputOccurrence` built at 8,944/8,946.
- `occurrence_bound_attribution_has_exact_key`: no axiom dependencies.
- `absence_from_complete_capture_excludes_scoped_occurrence`: no axiom dependencies.
- `partial_index_absence_is_compatible_with_occurrence`: `[propext]` only.
- No `sorryAx` or `admit` line appeared in the inspected target log.
- Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped.

This verifies the encoded conditional theorems at that exact PR head. It does not validate the source extraction, manifest completeness, artifact authenticity, or real-world exposure.

### New source-level gap

`OutputArtifactOccurrenceWitness` carries `runId`, `snapshotId`, `outputId`, `artifactDigest`, `artifactLocator`, and `capturedAt`.

However, `occurrenceMatchesAttribution` compares only:

- `runId`;
- `snapshotId`;
- `outputId`.

The occurrence's `artifactDigest`, `artifactLocator`, and `capturedAt` are not bound by that predicate to an immutable output-artifact registry or to an equivalent content-identity field on the attribution record. The exact-key theorem therefore proves key agreement, not content-identity agreement.

The model also assumes `OutputId` uniqueness/versioning rather than proving it. The completeness contract accepts `coversEveryOccurrence` as a supplied premise; the opaque integrity certificate is not authenticated or bound to the manifest digest. `CaptureTime` has no clock-domain, scale, precision, or uncertainty semantics.

This is a formalization gap, not a demonstrated corrupt artifact or production misattribution.

### Next proof target, not yet formalized

A source-authorized extension should separate:

1. `OutputArtifactIdentity`: output version, digest and immutable locator.
2. `ExecutionAttemptWitness`: a provider-supplied attempt ID or a source-bound observation witness. If the provider does not expose attempt identity, preserve `UNKNOWN`; do not manufacture an ordinal.
3. `OccurrenceAttributionJoin`: exact run/snapshot/output key plus artifact-identity equality.
4. `TemporalEvidence`: event time and observation time with clock domain/scale and precision where actually available.
5. `SemanticSupport`: a separate claim-to-source-span review record.
6. `CausalContrast`: a separate intervention and matched comparison, not a static attribution field.

A simple countermodel target is to show that two witnesses can share the same run/snapshot/output key while carrying different artifact digests or locators, and therefore both satisfy the present key-only predicate. This target was not added or compiled.

**No new Lean theorem or PR was created.** Local `lean`, `lake`, and `elan` are absent. More importantly, PR #1619 is 53 commits ahead and **20,762 commits behind** current main `12d33f11eb05692e94aea2f82214906d5fd5b299`. It remains OPEN / DRAFT / UNMERGED with no formal review. Extending that stale branch would create an integration and provenance problem; the correct next step is owner-controlled reconciliation against current main before adding the content-identity theorem. Existing exact-head CI is not current-main integration.

### Existing attempt-identity proof reused

Tern PR #824 already contains `TernH853SameRunAttemptIdentifiability.lean`. Its theorem `attempt_identity_not_identifiable_from_exposed_pair` constructs two distinct hidden attempt annotations that project to the same exposed scheduler snapshots.

I re-fetched the source and [Actions run #43723047265](https://github.com/Satobloc/HsH/actions/runs/43723047265), job #132838955309:

- The target module built at 8,925/8,964.
- All theorem-specific reports in that module list no axiom dependencies.
- The full root build failed later at `MovingPlaneTraceGeometry` (8,937/8,964) because several definitions depend on noncomputable real division and slice functions.
- This was a merge-reference build, not standalone exact-head verification.

The theorem establishes non-identifiability under the encoded projection. It does not establish that two attempts actually occurred, explain provider semantics, or authenticate a worker. This existing result is reused; no duplicate attempt-identity theorem was created.

## 4. External methodological cross-check

SciSpace was used for discovery and extraction, then the arXiv records were opened directly. These are research preprints or arXiv records, not independent replications of the HsH work.

- Yu et al., [The Attribution Blind Spot](https://arxiv.org/abs/2605.26778), 2026-05-26. The authors show why context-consistent output cannot distinguish parametric recall from retrieval-conditioned generation when both pathways yield the same surface answer. Their internal-representation comparison is explicitly a diagnostic substrate, not a verifier of which source caused an individual generation. Their own abstract identifies domain-confounded benchmarks as a failure boundary.
- Xia, [A Four-Condition Diagnostic Protocol](https://arxiv.org/abs/2606.06758), 2026-06-04. The protocol compares no-evidence, full-context, retrieved-evidence and oracle-evidence conditions under matched examples and controls. The paper reports 18,000 predictions across five local open-weight models. Its stated estimand is condition-level observable behavior, not mechanistic attribution to hidden attention or internal computation.
- Raeesi and Roed, [Auditing Forgetting in Limited Memory Language Models](https://arxiv.org/abs/2607.00605), 2026-07-01. Their FULL / DEL-ON / DEL-OFF interventions separate intact retrieval, deletion with retrieval still active, and deletion with retrieval disabled. They report 12,228 alias-closure deletions across thirteen databases. The design illustrates why retrieval traces and intervention conditions matter when attributing residual correctness.

The second paper's title differs from the shorter title returned in the SciSpace index; the primary arXiv record is used here. SciSpace's publication-type label is not treated as peer-review evidence.

The combined lesson is that internal-state signals, output citations, retrieval traces and controlled interventions answer different questions. No one of them alone supplies complete source attribution.

## 5. Disconfirmable experiment design

No model trial was run. The following is a proposal, not a result.

### A. Individual LLM evidence-use test

Use versioned, nonce-bearing fact bundles that are created for the study and not publicly indexed. This is a cognitive stimulus design, not physical data or a physical calculation.

Randomize matched calls across four conditions:

1. No evidence.
2. Full source context.
3. Retrieval-selected evidence.
4. Oracle evidence containing the complete relevant support.

Add source-label swaps, critical-span ablations, irrelevant-context controls and a semantically matched distractor. Hold model/provider version, system instructions, prompt, token budget, context position, tool scaffold, decoding and scoring constant. Repeat under fresh sessions and record exact input/output bytes, source hashes, retrieved spans, context snapshots, provider run IDs, attempt identity if exposed, and output artifact digests.

Blind evaluators to condition. Score answer correctness, evidence-span entailment, source-label accuracy, calibration/abstention, unsupported claims and response stability separately.

Falsifiers include:

- the no-evidence condition answers nonce facts at the same rate as oracle evidence, indicating contamination or a defective stimulus;
- removing the critical evidence does not change behavior on examples where oracle evidence improves performance;
- source-label swaps leave claimed provenance unchanged while content is held fixed;
- citations remain stable after the cited passage is replaced by a matched distractor;
- apparent context effects disappear after matching token budget, context position, retrieval coverage or decoding.

This estimates behavioral evidence utilization under the tested interventions. It does not reveal hidden attention or prove a particular internal causal path.

### B. Human-LLM group interaction

A separate, consent-based study could randomize groups to shared-source versus independently acquired source conditions, with an LLM teammate or mediator in a separately controlled arm. Preserve exact source exposure for each participant and agent. Measure group accuracy, calibration, consensus, participation distribution, source uptake and downstream decisions separately. The group, not each turn or member response, is the independent assignment unit when treatment is group-level. No participant data or group interaction was collected in this activation.

## 6. Cross-lane Review-MIND and geometry QC

### Nadir h902:s3

The optional poststart handoff was read. Its existing [PR #1189](https://github.com/Satobloc/HsH/pull/1189) corrected-head exact-source run [#44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466) passed 8,961 build jobs. The two new theorem-specific reports list `[propext, Classical.choice, Quot.sound]`; no `sorryAx` was reported. The global axiom audit, tests, lint, leanchecker and nanoda were skipped.

The quarter-turn result is conditional on the declared single-harmonic radial ansatz and reduced pointwise two-antipode readout. It does not invalidate the paper's full spatiotemporal/Fourier pipeline, establish the camera registration path, or supply an H(s)H forward map. The raw Figshare dataset and run-level calibration/covariance package were not retrieved. No physical result or P2 admission follows.

The report is now [PUBLISHED_VERIFIED at issue #1903](https://github.com/Satobloc/HsH/issues/1903). Publisher comment #6951556338 confirms artifact readback and SHA-256 `df08ce960592def0b316d68f86fb6085dd23dc4396eb22297e5c6906e224fab7`.

### Elias h902:s2

The source-transcribed method-level replay found that an exact duplicate `OutputReceipt` row is accepted because the sample `add_receipt` path has no receipt/event ID or exact-row idempotency check. Three distinct rows fail the sample four-row / three-worker / both-outcomes gate; replaying one exact row is accepted and flips the gate with only three exact unique rows. Eight of eight assertions passed.

This is a software-state counterexample, not a production incident, not a full upstream-module execution, and not a Lean proof. It reinforces the need for immutable event identity and deduplication before counting observations or group evidence.

### Orson P1

Orson's [issue #564](https://github.com/Satobloc/HsH/issues/564) remains frozen, Orson-owned, OVERDUE / NOT READY.

The latest [PR #850](https://github.com/Satobloc/HsH/pull/850) head `3416a8060791b4198eb32c7d079146b83f651e25` has successful merge-reference Actions run [#44089733229](https://github.com/Satobloc/HsH/actions/runs/44089733229), 8,990 build jobs. This is not a standalone exact-head build or current-main integration. PR #850 remains OPEN / DRAFT / UNMERGED, with no independent formal review. The issue's latest comment #6949637444 supersedes the older failure report.

Orson's `CURRENT_WORK.md` still contains the older h900 checkpoint and failure/publisher-pending language. The issue comment and publisher readback are newer. No Orson-owned file was changed. No new model trial, human session, API expenditure, dataset expansion, protocol amendment, manuscript edit, PDF/reader completion, independent review, or paper-gate advancement is claimed. This Enheduanna activation is not counted toward Orson's approximately four-of-five substantive cognition-work target.

## 7. Workflow, source and campaign status

- P0 Code Grurple: ACTIVE. The latest h902 discovery snapshot retains both Paper A and Paper B as generic raw-workspace browse targets, while the Reader Routing Registry default-denies raw WORKSPACES without a presentation derivative. This is a source/index policy mismatch, not evidence of a live HTTP response or unauthorized raw-file exposure. No route probe or protected-source edit occurred.
- P1 Orson cognition: OVERDUE / NOT READY, protected and Orson-owned.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- November 9 minor-paper gate remains missed; November 30 major and December 14 full-theory gates remain separate. No gate advanced.
- FIE next review: November 24, not due.
- WH-05 remains blocked by the four occupied Mersearch lanes. WH-02 remains the highest-priority unblocked PWH item, Calder-owned. The queue and task graph were not modified.
- Task graph remains 18 records against 16 declared branches.
- All four canonical Mersearch request files remain `requested`; all twelve expected request-scoped manifests/receipts were absent. No callable Mersearch action was available. No request was overwritten, released or retriggered. GitHub/Library and SciSpace retrieval are bounded fallbacks, not a Mersearch run or exhaustive archive search.
- HsH, SAT archive and HSH_RESOURCES root documentation were read. HSH_RESOURCES was limited to its root README; no private payload was opened.
- Math Hopper #578 / PR #991, Whirligig Kernel 0, existing Lean PRs and SciSpace were checked before any tooling proposal. No new tool, dependency, branch, PR, fork, subscription or expenditure was introduced.
- The existing unrelated-reading cursor remains `fun break - lx.txt`, line 2342. No new reading quantum or physical break is claimed; the last reading was recent.
- No measured physical system, dataset, units, uncertainties, fit, prediction, independent measurement, SAT-O/Blockwave equation correction, or BEDROCK theory promotion occurred.

## 8. Publication, receipt and scheduler boundary

The report and canonical receipt were committed to the Common research/receipt directories. Publication was submitted once through the existing HSH-PUBLISH-V1 issue publisher with a submission ID under the 80-character limit. Final publisher status is recorded in the canonical receipt and, if successful, an additive verification amendment. No retry or duplicate issue is authorized.

The existing :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with its exact hourly America/New_York :48 schedule, original prompt and phase unchanged. The other three enabled leases remain untouched; :12 remains disabled. No sixth task, reassignment, schedule/phase/prompt change, signet or conversation rename occurred.

No authenticated current Enheduanna thread, direct cross-thread delivery, consumption or acknowledgment is claimed.

**Final classification:** `H902_S4 / NOMINAL_ENHEDUANNA / HISTORICAL_BROAD_ARCHIVE_DIRECTIVE_VERIFIED / NO_STANDALONE_SPECIALIST_CHARTER / SOURCE_EXPOSURE_OUTPUT_ATTRIBUTION_LADDER / PR1619_EXACT_HEAD_CI_REPLAYED / PR1619_53_AHEAD_20762_BEHIND_MAIN / OUTPUT_DIGEST_LOCATOR_JOIN_GAP / ATTEMPT_IDENTITY_UNKNOWN_WHEN_UNEXPOSED / NO_NEW_LEAN_PROOF / FOUR_CONDITION_INTERVENTION_DESIGN_NOT_RUN / HUMAN_GROUP_STUDY_NOT_RUN / NADIR_PR1189_EXACT_HEAD_PASS / ELIAS_DUPLICATE_RECEIPT_COUNTEREXAMPLE / ORSON_P1_PROTECTED / P0_ACTIVE / P2_HOLD / P3_INCOMPLETE / MERSEARCH_UNAVAILABLE_FOUR_LANES_OCCUPIED / REPORT_AND_RECEIPT_READBACK / NO_PHYSICAL_RESULT / NO_THEORY_PROMOTION / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK / NO_CROSS_THREAD_DELIVERY`.
