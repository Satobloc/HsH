# Aldus h1023:s2 | Instrument-support semantics and verification status

**Status:** SOURCE/TYPE QC COMPLETE / MERGE-REFERENCE BUILD VERIFIED / NO PHYSICAL EVALUATION / P0 ACTIVE.

## Scope and attribution

This is an assistant-authored, source-grounded review of existing PR #2330. It is not a formal GitHub review, an authenticated Aldus-instance action, a Nathan Direct theorem, or a physical result.

The historical Aldus remit is supported by direct user messages in the raw conversation *Aldus [AUTO H(s)H Gitter]* (conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`; raw blob `63b03960d87c6410d186be698ea8692df1dd3363`). Those messages assign broad cross-domain reading, combining information not usually combined, and exploring intersections. No standalone signed specialist charter or authenticated current Aldus thread was found.

## Current formalization and actual Lean build

- PR: [#2330](https://github.com/Satobloc/HsH/pull/2330), branch `research/relay36-evidence-gated-candidate-admission-20261122t0736z`.
- Current PR head: `e41e31d0b7d0aa1aaf930acdf944d8b0c57f5d2e`.
- Module: `FORMAL_VERIFICATION/HsHVerification/UncertaintyRobustSeparation.lean`, blob `f0edc5df5a631a5062e0da85bab148a238698b60`.
- Root aggregator blob: `7a9f681fee2712c9662bf4ef0f8113706964d8fb`.
- Successful run: [Actions #45024107990](https://github.com/Satobloc/HsH/actions/runs/45024107990), job `137213221533`.
- Tested merge reference: `792431e038b51fceca29e466e65faea63fb3a80e`, merging PR head `e41e31d0...` into base `c20eb516e5e214ef948d621d721fb060b410831e`.
- The changed module and root aggregator blobs independently match at PR head and merge reference.
- Lean 4.34.0, Lake 5.0.0, Mathlib v4.34.0; full build completed successfully with 8,952 jobs.
- Nine theorem-specific axiom reports for `InstrumentSupportRobustSeparation` state that the declarations do not depend on any axioms. The retrieved complete job log contains zero `sorryAx`, `admit`, or `error:` occurrences.
- Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped.

This is a successful **merge-reference build**, not a standalone exact-head-only build or current-main integration. The earlier namespace/type failure on prior head `8e4be38c...` is corrected in the current refactor. Compilation verifies only the formalized statements.

## Existing source/type QC remains applicable

The earlier non-blocking QC at [PR comment #7079031066](https://github.com/Satobloc/HsH/pull/2330#issuecomment-7079031066) identified two specification gaps. Both remain in the current `FrozenInstrumentObservationSupport` type.

1. `possibleInstrumentObservations : Payload readout.mode → Set (Payload readout.mode)` is an arbitrary shared set-valued map. The type does not require nonempty sets or require a nominal readout to belong to its own support set. The proved robust-separation-to-nominal-separation implication remains valid under the shared-map premise, but the object is not necessarily a conservative uncertainty envelope. Keep the narrower “source-defined set-valued observation relation” interpretation unless additional admissibility laws are encoded.

2. `evidence.artifact` and its digest are not bound to the supplied support function or to an identified readout uncertainty-model artifact. `readoutDeclaration` proves only the generic `uncertaintyModelDeclared` proposition. Family-lineage membership, authority class, and claim scope do not establish that the cited artifact implements the supplied function. A typed support-model identity/digest and readout-artifact binding would strengthen the record shape; source-to-function correspondence would still require independent source review.

No code was changed and no new theorem was added. This is a specification-strength observation, not a compiler failure or a physical-evidence result.

## P0 and campaign status

At main `64955144a093eadd5d4b82cc2123dbb77041c2bd`, all eight protected Paper A/B source and presentation-control objects match the pinned Git blob vector (8/8). The three discovery source/control blobs remain unchanged.

- [P0 issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains open and ACTIVE.
- [PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains open, draft, and unmerged: 3 commits ahead, 4,290 behind main, zero exact-head Actions runs, and zero formal reviews.
- No live reader acceptance, independent browser verification, deployment, source repair, merge, rebase, or standdown was established.

P1 cognition remains overdue/frozen/not ready and Orson-owned. P2 remains HOLD: no measured system is selected; the November 23 first-draft/hostile-review gate and November 30 major gate remain separate. P3 remains incomplete for December 14. Lane 24 Cycle 08/08 remains complete; no Cycle 09.

The latest recorded full FIE review is November 20, next due December 4. The latest unrelated-reading break is November 21; return cursor is SAT archive `fun break - lx.txt`, line 3126.

## Research and physical-evidence boundary

All four canonical Mersearch request lanes remain occupied/requested; no lane was overwritten, released, or retriggered. No Mersearch query was run in this activation.

No measured physical system or dataset was selected. No physical calculation, CODATA comparison, fit, prediction, calibration/holdout evaluation, or independent measurement was performed. No original SAT-O/Blockwave equation was recovered or modified. No theory or paper status was promoted.

## Return

The next useful step is independent review of PR #2330, with the two existing semantic gaps kept distinct from its successful build. Lane 24 remains held until P0 receives a positive reader-acceptance trigger or explicit Code Grurple standdown. After release, resume original-equation custody, explicit typed geometric maps, and only then a real measured-system comparison.
