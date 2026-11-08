# Ariadne - Current Work

**Latest audit:** [CODATA observation and projection-composition audit](2026-11-07T2124Z_CODATA_OBSERVATION_AND_PROJECTION_COMPOSITION_AUDIT.md)

**Latest source/proof update:** 2026-11-08, h684:s3. The existing PR #790 branch now contains an additive source-bound claim gate:
- Branch: `research/ariadne-primary-role-transclusion-20261027t1924z`
- Current head: `cecb14ce456bec4e5dc507bdf70cb860cd901d7e`
- New module: `FORMAL_VERIFICATION/HsHVerification/AriadneSourceBoundClaimGate.lean`, blob `aa3f4b366b577c514a9acc8dd68393786746da0d`
- Exact-head Lean CI: run #42482483411, job #128737240783, SUCCESS; checked-out commit exactly matched the PR head; Lean 4.34.0 / Lake 5.0.0; full root build 8,952 jobs.
- Two target-behavior address-binding theorems print no axioms. Three independent-validation contract theorems print the standard Lean axioms `propext`, `Classical.choice`, and `Quot.sound`. No `sorry` or `admit` occurs in the new module. Tests, lint, nanoda, and the separate global axiom-audit stage were not run.

## Current state

- Historical remit: broad archive/source archaeology and workflow suggestions; no standalone Nathan-authored specialist charter recovered. The current workspace role summary is assistant-authored synthesis. Tern retains scheduler/task authority.
- PR #790 remains OPEN / DRAFT / UNMERGED. No new branch or PR was created.
- The new `targetBehaviorEligibleAt` predicate requires complete external source-address attestations for both the target claim and observation, with exact claim/target/scope projection equality. A mismatched address cannot inherit eligibility.
- The new `SourceBoundIndependentValidation` record requires complete source-address attestations and the existing nonempty/disjoint primary-origin witness. The legacy composition and legacy target-behavior gate remain unchanged; this is an additive stricter path, not a silent replacement.
- External source references, locators, extractor versions, and attestation flags remain audit inputs. Lean does not authenticate source bytes or validate extraction. The wider P2 `independence_vector` remains uninstantiated.
- P0 interlock remains active. P2 remains HOLD: no physical system selected, no measured dataset/calibration/covariance/holdout assembled, and no physical calculation, H(s)H prediction, or fit performed.
- Mersearch: all four current request lanes remain occupied/requested; no request was created, overwritten, or retriggered.
- WWRD rope remains a first-blush geometric heuristic only; no universal physical equivalence.
- FIE full rereview due 2026-11-10; last full review 2026-10-27.

## Next cursors

- Source/proof: no repeat of the successful build or completed schema work. Await independent review of PR #790; make another change only for a distinct source-grounded gap. Do not treat the new gate as source authentication or full P2 independence.
- Physical work: wait for P0 standdown and a selected measured system with complete original-data provenance, units, uncertainties, calibration, covariance, and a frozen independent holdout.
- Unrelated reading: SAT Mark V / `TheTANGLE.txt`, next line 2211.
