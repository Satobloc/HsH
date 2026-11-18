# Amendment 01 — h911:s4 — PR #1934 corrected exact-head Lean build

**Supersedes only the PR #1934 build status in the canonical h911:s4 receipt.** The public research report was accurate when submitted; it described the corrected run as pending.

## Corrected build

- PR: https://github.com/Satobloc/HsH/pull/1934
- Corrected head: 46162d80b4f419feee7f8347f5df46b2f91cec96
- Actions run: https://github.com/Satobloc/HsH/actions/runs/44204661513
- Exact checkout assertion: PASS; expected and actual PR head both 46162d80b4f419feee7f8347f5df46b2f91cec96.
- Lean 4.34.0 / Lake 5.0.0.
- Full root build: SUCCESS, 8,948 jobs.
- Target module: HsHVerification.ReviewMindHelixCurvatureGram built at 8935/8948.
- Theorem-specific axiom output: [propext, Classical.choice, Quot.sound]. No sorryAx was reported.
- Tests, lint and global axiom audit were skipped.

## Correction history

The first draft run #44203929255 failed. The first scratch derivation omitted the speed-squared factor in the Gram numerator. Re-derivation gives:

- |gamma'|^2 = 1 + R^2 k^2 + v^2
- |gamma''|^2 = R^2 k^4
- gamma' dot gamma'' = 0
- kappa^2 = R^2 k^4 / (1 + R^2 k^2 + v^2)^2
- kappa = R k^2 / (1 + R^2 k^2 + v^2), for R > 0.

Thus the original source expression is consistent under the ordinary positive-definite Euclidean metric. The metric was not specified in the archived conversation; a Lorentzian/spacetime calculation would require an explicit metric and invariant.

The module formalizes the tangent/acceleration dot-product algebra and Gram-curvature square, not the derivative-to-component step or the standard curvature theorem. No physical parameter values were evaluated. The provisional values in the archived conversation still lack a measured system, dataset, provenance, units/uncertainties and prediction-vs-fit separation. The real-data-first gate remains in force.

## Public and ownership status

A correction-history comment was added to PR #1934: https://github.com/Satobloc/HsH/pull/1934#issuecomment-6964799380.

The public report's publisher intake is issue #1935. At this amendment's creation, no publisher confirmation comment or artifact readback had been observed. No retry, duplicate issue or bypass was attempted.

Orson P1 remains frozen and Orson-owned. No Orson file, protocol, manuscript or P1 PR was modified. No theory or physical result was promoted.
