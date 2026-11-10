# Receipt Amendment 01 | Kestrel h724:s4 | Lean CI completion

**Applies to:** `REVROT3-19-20261011:724:s4`  
**Observed:** 2026-11-10T05:59Z  
**Status:** CI_VERIFIED_ON_MERGE_REFERENCE / PR_STILL_DRAFT.

## Completed Actions run

- Workflow run #42765114182: SUCCESS.
- Job #129659662176: SUCCESS.
- Checkout: `refs/remotes/pull/1556/merge`.
- Merge commit: `dd22eefc669e8d66f11015caadd4a9427d5c4f63`.
- PR head: `a27b2e745da3ca29b745db0831dae5e7a30545a6`.
- PR base: `c7dc2c483f50ae03fc7a7c530829170135e18d92` on `infra/lean4-verification-20261023`.
- Lean: 4.34.0, commit `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`.
- Lake: 5.0.0-src+293d5d0.
- Mathlib: v4.34.0 pin.
- Full build: SUCCESS, 8,945 jobs.
- New target `HsHVerification.BlockwaveCompactPhaseCurvature`: built at 8,924/8,945.
- Theorem-specific `#print axioms local_curvature_zero`: `[propext, Classical.choice, Quot.sound]`.
- Captured 607-line job log contains no `sorryAx` string.

## Limits and skipped checks

This was a merge-reference build, not an exact-head-only run. The test, lint, nanoda, and global axiom-audit steps were skipped. The theorem-specific axiom report is therefore the available axiom evidence, not a repository-wide audit.

The theorem assumes `ContDiff 𝕜 ⊤`, which is stronger than the minimum smoothness threshold used by Mathlib's `extDeriv_extDeriv` lemma. It establishes only the local normed-space differential-form statement for a smooth degree-zero form and constant scalar. It does not prove the historical source-to-exterior-derivative translation, global circle-valued phase/winding, holonomy normalization, defects, curved-manifold chart transitions, or any physical premise.

## Disposition

PR [#1556](https://github.com/Satobloc/HsH/pull/1556) remains OPEN / DRAFT / UNMERGED. Its description now records the completed run. No merge, theory promotion, new publisher issue, physical calculation, or scheduler change was made. The original receipt's IN_PROGRESS status was accurate at its inspection time; this amendment supersedes it for current CI status.
