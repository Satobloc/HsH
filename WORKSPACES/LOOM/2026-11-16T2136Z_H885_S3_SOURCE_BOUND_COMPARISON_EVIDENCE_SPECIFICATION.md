# H885:S3 | Source-bound comparison evidence specification

**Nominal slot:** 2026-11-16T21:36:00Z  
**Run key:** `REVROT3-19-20261011:885:s3`  
**Selected ring label:** Loom (index 1)  
**Next ring label:** Aster (index 2)  
**Disposition:** `SOURCE_BUNDLE_JOIN_FORMALIZED / EXACT_HEAD_LEAN_BUILD_PASS / DRAFT_PR / NO_PHYSICAL_RESULT / P2_HOLD`

## 1. Selection, participation, and continuity

For the :36 lease, `s=3`:

\[
h=885,\qquad seq=5(885)+3=4428,\qquad 4428\bmod19=1.
\]

The fixed ring therefore selects Loom, index 1, followed by Aster, index 2.

This is a source-grounded Loom revival, not an authenticated continuation of the historical Loom ChatGPT thread. The historical `Tag Conversation Corpus` raw export was fetched by its exact Git blob `6668ca60e451f8737903423727da7f9a430484e1` and parsed from its actual conversation mapping. Ten user-role nodes are present in the export; the latest active user message is dated 2026-09-19. The direct instructions establish cumulative corpus tagging, source chronology, terminology crosswalks, correction/supersession, glossary and navigation work. They do not establish a separate signed specialist charter or current-thread authentication.

The optional Sable h885:s2 source-genealogy packet was read as context, not as an assignment. The current :36 run record is `29d71c7d-7118-8330-8271-0e53b032c420`, scheduled 21:36Z and started 21:59:26.267210Z. At final inspection it remained `IN_PROGRESS`, with null completion and null run-level `chat_ref`. The task-level cached result belongs to h884:s3, not this run. The :48 Aster h885:s4 execution had already completed at 21:54:18.487558Z before this run started; any successor packet is therefore post-nominal optional context only. No direct-thread delivery, consumption, or acknowledgment is claimed.

## 2. Source and control preflight

The current HsH `main` front door, BEDROCK, its superseding Primary Operational Guideline, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, Revival Rotation V3/V4, current Loom workspace, current branch, receipts, and the selected worker's historical source were inspected.

Repository entry points:
- HsH root README: live workflow/workbench and theory-status routing.
- SAT archive root README: historical SAT/GLASS source archive; historical presence is not current theory authority.
- HSH_RESOURCES root README only: private-reference boundary and citation policy. No private payload was opened.

Mersearch was not callable in this execution context. All four existing request files remain `requested`; all twelve request-scoped `RUN_MANIFEST.json`, `SEARCH_RECEIPT.json`, and `SEARCH_RECEIPT.md` paths were checked and returned not found. No request lane was overwritten, released, or retriggered. GitHub code search is a bounded fallback, not a Mersearch result and not exhaustive three-repository coverage. No local pinned three-repository checkout was available.

The live campaign remains:
- P1 minor, November 9: overdue / not ready; Orson retains cognition ownership.
- P2 major, November 30: actual measured-system geometry paper; P2 remains HOLD.
- P3 full theory, December 14: incomplete.

The November 16 P2 source-readiness gate is not satisfied by the available vortex candidate: the exact Nature Figshare version/file inventory, raw bytes/checksums, acquisition IDs, calibration and joint covariance remain unverified. No physical system was selected. No calculation, fit, prediction, independent measurement, or falsification threshold was produced.

## 3. Substantive architecture improvement

The existing Nadir comparison-freeze specification in PR #1852 declared `ComparisonFreeze.sourceBundleId`, but the field was not carried by E/D/F/R receipts or used in a theorem. Enheduanna's independent source review on PR #1852 identified this as a concrete structural omission. It also noted that comparison and model-freeze identifiers were plain strings without nonempty predicates.

I added an additive source-bound refinement in [PR #1858](https://github.com/Satobloc/HsH/pull/1858):

- `SourceBundleIdentity` requires a nonempty source-bundle ID equal to the comparison manifest's `sourceBundleId`.
- `NonemptyFreezeIdentity` requires nonempty comparison ID, canonical-manifest digest, H0/H1 model-freeze IDs, observation freeze, calibration, covariance, shared-parameter manifest, comparator, analysis plan, decision rule, holdout partition, and observable-operator IDs.
- `SourceBoundEvidenceReceipt` wraps each empirical, discrimination, and review receipt with the same source-bundle identity.
- `SourceBoundFreezeWitness` binds the freeze witness to that same source bundle.
- `SourceBoundPredictionReceipt` binds both H0 and H1 prediction receipts to the same source bundle while retaining their distinct model sides and model-freeze IDs.
- `SourceBoundP2Bundle` requires the complete E/D/F/R bundle plus both paired predictions.
- `forgetSourceBindings` recovers the existing `P2EvidenceBundle`; the refinement strengthens the current contract rather than replacing it.

The new theorem targets establish that all six evidence/prediction records carry one exact source-bundle ID, that the ID matches the comparison manifest, that it is nonempty, that the required freeze identifiers are nonempty, and that the refined bundle still satisfies the existing P2 bundle contract.

This closes a source-bundle join gap in the formal schema. It does not establish that the named bundle actually contains the asserted source bytes.

## 4. Lean verification

**EXACT-HEAD BUILD PASS**

- PR: [#1858](https://github.com/Satobloc/HsH/pull/1858), OPEN / DRAFT / UNMERGED.
- Branch: `research/loom-source-bound-comparison-20261116t2136z`.
- Exact PR head: `35df9d43602792e761710145703c3adb5b36ea0a`.
- Base: `research/nadir-p2-comparison-freeze-coherence-20261116t1936z`, exact base head `0bc31d2aafac9d3639c06aa93aaf4643033b7718` (PR #1852 branch).
- Module: `FORMAL_VERIFICATION/HsHVerification/LoomSourceBoundComparison.lean`, blob `694e76cdef97638e0b946f3c808c6702f3b95c69`.
- Root aggregator: `FORMAL_VERIFICATION/HsHVerification.lean`, blob `e952fc337b54ba1de0d7c72cf983a071c3f1637c`.
- Actions run [#43966655498](https://github.com/Satobloc/HsH/actions/runs/43966655498), job `133647753428`.

The workflow's explicit checkout assertion matched expected and actual PR head `35df9d43602792e761710145703c3adb5b36ea0a`. Lean 4.34.0, Lake 5.0.0, Mathlib dependency state inherited from the parent branch. The full build completed successfully: 8,950 jobs. The five new theorem-specific `#print axioms` reports each stated that the theorem does not depend on any axioms.

Tests, lint, leanchecker, nanoda and the separate automated axiom-audit step were skipped. This is a successful exact-head compilation of the encoded conditional mathematics, not a global proof audit, source authentication, implementation refinement proof, reviewer-independence proof, pre-unblinding proof, or physical validation. PR #1858 remains draft/unmerged and is stacked on PR #1852.

## 5. Formal and empirical limits

The identifiers are opaque strings. The Lean module does not compute SHA-256, validate canonical serialization, authenticate Git artifacts, prove that a source bundle contains the claimed source set, establish the truth of supplied `verified = true` attestations, or prove independent reviewer status. Distinct reviewer/author identity and pre-unblinding chronology remain separate workflow obligations. The actual geometry-map graph, projection and composition conditions, physical premises, and observation operator are not formalized here.

The theorem therefore does not establish a worldtube thickness, twist, contact surface, or any other added H(s)H structure. Those features remain optional unless a source-faithful map and an identifiable held-out observable require them. The standard comparator remains the minimally sufficient established-physics model under shared calibration and parameters.

No SAT-O or Blockwave equation was changed. Original source notation and existing source hashes remain untouched. No BEDROCK promotion or paper-gate advancement occurred.

## 6. Lateral reading and source-tag update

Read `fun break - lx.txt`, lines 1681-1720, from both HsH and SAT archive copies. Both resolve to Git blob `f33eb29fbac65efa1db054239bb9c28a04a13a42` (3,372 lines). The passage continues a language-discovery game and includes a Huitoto spelling correction. The transcript is flattened with textual speaker labels; no raw-role metadata, real-world speaker attribution, or Nathan Direct claim is inferred. This is lateral reading, not theory evidence. The Loom tagging ledger received Section AI; next cursor is line 1721.

## 7. Durable status and next step

The new source-bound module and aggregator are read back from the exact PR branch. The public-safe report and canonical receipt are stored in the existing Loom/Common surfaces; publication status is recorded separately from PR/Lean status. The optional Aster packet is post-nominal/post-completion repository context only, with no task, deadline, review request, response obligation, ownership transfer, inbox write, or direct-thread delivery claim.

Standing workstreams: P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY; P2 measured geometry HOLD; P3 full theory INCOMPLETE; FIE next review November 24.

**Next formal step:** obtain independent review of PR #1858, especially whether the source-bundle ID should bind to an explicit immutable manifest artifact and whether the same bundle is required to include both source and observation manifests. Do not promote the schema to an implemented runtime validator.

**Next empirical step:** acquire the exact Nature Figshare package and provenance manifest, then define a source-authorized H(s)H forward map and matched standard comparator before any calculation or holdout prediction.

No automation, task, ID, schedule, phase, prompt, cadence, or enabled-state change. No sixth task.
