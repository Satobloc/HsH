# Review-MIND QC: uncertainty semantics, P0 currentness, and source provenance

Run: **h1019:s4 / Calder ring label**. This is assistant-level source-grounded work, not authenticated participation by a historical Calder instance or current Calder thread.

## 1. Historical role and source boundary

The strongest recovered empirical-Calder role witness is the 2026-09-12 Calder entry in `WORKSPACES/COMMON/CHECKINS.md` (current blob `886069e71d4aec7a3f8d199d6d889b930a05c17e`). It is a worker-authored self-report, not a Nathan-authored charter or signed specialist charter.

That record describes an external empirical/statistical remit: preregistered angle-clustering tests, adversarial local/shifted nulls, independent-unit discipline, source/provenance separation, and preservation of negative results. It explicitly quarantines theory-bearing outputs from a mixed external-data/SAT-interpretation conversation. The internal target values mentioned there are search targets, not externally validated constants.

The separate archived Calder identity labelled “Construction Story Retelling” is not treated as the empirical Calder thread. No authenticated current empirical-Calder thread was established. Calder BOOT/CURRENT_WORK remain at h1004 and were not overwritten.

## 2. New cross-lane formalization audit: PR #2330

Current reviewed PR head: `8e4be38c50f864ffb8f94232aefdce8981b7a88b`.

New module: `FORMAL_VERIFICATION/HsHVerification/UncertaintyRobustSeparation.lean`, blob `f4b4558d11e96029ff6ebb6deae82cd3c8d9981c`.

### Mathematical scope

The module defines one shared set-valued observation map and applies it to both heterogeneous candidate models after their distinct state/field projections and common detector readout.

The implication `uncertaintyRobustSeparation_implies_nominalSeparation` is mathematically sound under that shared-map premise: if the nominal detector values were equal, the same `possibleObservations` function would give the same possible-observation set, contradicting a robust-exclusive observation. The converse is not claimed.

This is a conditional set-theoretic result, not a statistical or physical uncertainty calculation.

### Semantic and evidence limits

`FrozenObservationUncertainty` (lines 53–60) provides an arbitrary `Payload → Set Payload` function. It does not require the set to be nonempty or to contain its nominal input. The actual formal object is therefore a shared set-valued observation correspondence, not necessarily a centered uncertainty envelope.

The module correctly disclaims probability distributions, confidence regions, metric balls, covariance models, and coverage guarantees. Those properties are not encoded and must not be inferred.

The `readoutDeclaration` field proves only that the frozen readout declares an uncertainty model. The cited `SourceEvidenceRecord` must occur in the candidate-family evidence lineage and carry an allowed authority class, but Lean does not prove that the cited artifact implements the supplied set-valued function. This is an explicit external source-review obligation, not a theorem.

### Actual Lean result

The current-head Actions run **#45021241113 FAILED** at the Lean compilation step. The workflow checked out merge commit `9a0e923b4919f0c4b595cbc79c64316cd0d296e5`, which merges PR head `8e4be38c50f864ffb8f94232aefdce8981b7a88b` into base `c20eb516e5e214ef948d621d721fb060b410831e`.

Lean 4.34.0 / Lake 5.0.0. The new module failed at 8,950/8,952 build targets.

The narrow root cause is a type-namespace mismatch: the new file declares `Payload : MeasurementMode → Type`, but does not open or qualify `HsHVerification.MeasurementDomainCompatibility`. The `open` inside `PrecommittedHoldoutAdmission.lean` is local to that file and is not re-exported. Lean consequently reports that `Payload` has the wrong `MeasurementMode` type at lines 54, 66, 77, 87, 100, 114, 127, 150, 173, and 198. Later unknown-identifier/function errors are cascades. Opening or fully qualifying `MeasurementDomainCompatibility.MeasurementMode` is the minimal candidate repair, not an applied change.

The `[sorryAx]` reports emitted after elaboration failed are error-recovery output, not proof evidence. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. Earlier successful run #45014721410 built the prior PR head `838e9803...`; it does not verify this new module.

An assistant-level QC comment and an append-only CI-failure follow-up were posted on [PR #2330](https://github.com/Satobloc/HsH/pull/2330): comments [#7079031066](https://github.com/Satobloc/HsH/pull/2330#issuecomment-7079031066) and [#7079063061](https://github.com/Satobloc/HsH/pull/2330#issuecomment-7079063061). These are not formal GitHub reviews or approvals. No branch edit, retry, rebase, merge, or theory promotion was made.

## 3. P0 Code Grurple and WH-02 currentness

The inspected HsH main snapshot was `cbb606743a77fdbd0469ea8503df026f359ad38b`.

All eight protected Paper A/B presentation objects matched their pinned Git blobs:

| Protected object | Blob |
|---|---|
| Paper A accepted R1 | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B reviewed R1 | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` |
| Presentation Gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Reader Routing Registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| Presentation Contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Generated papers index | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| Viewer Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

**P0 remains ACTIVE.** PR #2009 is OPEN / DRAFT / UNMERGED, 3 commits ahead and 4,116 main-side commits beyond its merge base; mergeability is false. The current PR head has no exact-head Actions run and no formal review.

The PR source still appends prior records verbatim in the incomplete-tree fallback and continues before the workspace presentation sanitization path. The current PR source blob `c648a5666ddf87c3ab0ad6607f0762796bc7f160` and test blob `e7ca2989115e44aab570f6baefa73e2882bc3caa` exactly match the source/test bytes used in the earlier h1013 full-module regression reproduction. That reproduction found the stale fallback retained old reader URLs and excerpts while the four existing tests passed. The current test suite still tests stale status separately from complete-tree workspace sanitization; it does not test sanitization of retained workspace records on the stale fallback. No duplicate test run was performed because the source/test bytes are identical to the previously executed reproduction.

WH-02 PR #1710 remains OPEN / DRAFT / UNMERGED, 7 commits ahead and 9,533 main-side commits beyond its merge base; mergeability is false. No exact-head Actions run or formal review was returned for its current head. No rebase or merge was attempted. Calder/authorized maintainers retain WH-02 code/rebase authority; Tern retains PWH coordination.

## 4. Mersearch, campaign, and cadence

All four Mersearch lanes remain occupied/requested. Lane 1, 3, and 4 have no request-scoped manifest or compact receipt. Lane 2 has a manifest and compact receipts, but its request status remains `requested`; the compact receipt is not exhaustive source recovery or independent source-critical attribution. No raw results were opened, no lane was released or overwritten, and no new search was triggered.

Campaign status remains: P0 ACTIVE; P1 November 9 cognition paper OVERDUE / NOT READY / FROZEN / ORSON-OWNED; P2 November 30 measured-system paper HOLD; P3 December 14 full-theory paper INCOMPLETE.

The controlling FIE review is Enheduanna h982:s3 on November 20, with the next review due December 4. No rereview was due in this activation. The unrelated-reading break was already completed November 20; no duplicate break was performed.

No measured physical system or dataset was selected. No physical calculation, fit, prediction, independent measurement, human-subject experiment, CODATA comparison, SAT-O/Blockwave equation change, or BEDROCK promotion occurred.

## 5. Continuity and handoff

The immediate predecessor, Aldus h1019:s3, was still IN_PROGRESS at last observation. Its cached task result belonged to Loom h1018:s3, not the current Aldus run. No current addressed Aldus receipt or handoff was present in the inspected main snapshot. No predecessor work or acknowledgment is attributed to Aldus.

The next ring label is Hale, h1020:s0. Hale's scheduled run had already started before this packet was prepared. Any repository packet is therefore POSTSTART_OPTIONAL_CONTEXT_ONLY, not a prestart handoff. No direct ChatGPT delivery, consumption, acknowledgment, assignment, or ownership transfer is claimed.

No task ID, schedule, phase, prompt, enabled state, or ownership was changed. The four existing enabled Workshop Relay tasks remain preserved; the :12 task remains disabled. No sixth task was created.
