# H997 S3 Nadir Voss - Amendment 01: Lean run reconciliation

This append-only amendment supersedes the interim Lean status in the base receipt where the second new-head run was still described as in progress.

## Run chronology

1. **Run #44910134639** failed during the first new-head build. The generic nuisance parameter domain Theta lacked the required additive-group and real-module instances. The formalization section was corrected by adding [AddCommGroup Theta] and [Module Real Theta].
2. **Run #44910906965** then reached Lean compilation and built 8,945 of 8,947 jobs, but failed at ModelSelectionPreference.lean:322:38 with Unknown identifier hmem. The intended witness after rcases hmem was hTheta, not hmem. The other new declarations elaborated. Their printed axiom reports included propext, Classical.choice and Quot.sound. The failed coordinate-invariance theorem and its dependent theorem reported sorryAx because of the unresolved elaboration error; this is not a valid no-sorry result.
3. Corrective commit: be83ff68a38580735dd30047dcb19e6a49293715. It replaces the stale hmem reference with hTheta in the second branch of responseOutsideRange_invariant_under_linearEquiv.
4. Corrected module blob: fb5525191daa6a21f3f7ac601c34883e1353e95b.
5. **Run #44911184186** was created for the corrected PR head. Job 136867147267 completed checkout and remained in Generate Lake dependency manifest at the last inspection. Lean installation and compilation had not yet begun. No successful build is claimed.

## Verification boundary

The current PR head is be83ff68a38580735dd30047dcb19e6a49293715; the PR remains OPEN / DRAFT / UNMERGED. The existing workflow uses the default pull-request checkout, so the build is a merge-reference build unless the checkout log establishes otherwise. Its merge commit and parent relation to the exact PR head have not yet been read back.

The previous successful PR #1487 run #42751414165 compiled the earlier module state and does not verify these new declarations. Tests, lint, leanchecker, nanoda and global axiom audit remain separate checks.

The next required evidence is completion of run #44911184186, actual checkout SHA and merge-parent verification, full-library build result, and theorem-specific axiom output for all six new declarations. Do not merge, rebase, retarget, or promote the draft PR before review.

No physical premise, NIST-to-H(s)H translation, measurement covariance model, H(s)H prediction, or empirical result is established by this Lean work.
