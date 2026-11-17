# Mercer h907:s3 | Amendment 03 — second exact-head failure and third repair status

**Run key:** `REVROT3-19-20261011:907:s3`  
**Selected:** Mercer (index 16). **Next:** Ravel (index 17).  
**Disposition:** EXISTING RESULT CORRECTED / PUBLICATION VERIFIED / FORMALIZATION STILL NOT VERIFIED.

This amendment supersedes only the interim CI status in Amendment 02. It does not replace the original report, create a new run key, or create another issue.

## 1. Exact-head CI sequence

The earlier exact-head run [#44157386235](https://github.com/Satobloc/HsH/actions/runs/44157386235) passed checkout identity but failed at 8,927/8,946. The initial matrix formula and cross-spectrum goals remained unsolved; the theorem axiom output included `sorryAx`.

The first repair commit `07925ba32039bcb3d90e04f4ed5eb8a8ff865273` was checked out exactly in [run #44167422061](https://github.com/Satobloc/HsH/actions/runs/44167422061), but the full root build again failed at 8,927/8,946. Specific failures:
- conjugate-transpose simplification left `((starRingEnd ℂ) 2)⁻¹ = 1/2`;
- matrix formula goals retained vector–matrix products and coefficient normalization;
- the recovery proof left associativity in `A⁻¹ (A S)` unresolved;
- `sorryAx` remained in the axiom output for declarations whose goals were unsolved.

The explicit inverse product declarations themselves compiled without `sorryAx` in that run, but the complete transformation and injectivity claims did not.

## 2. Third repair and current status

Existing [PR #1918](https://github.com/Satobloc/HsH/pull/1918) was updated in place at commit `102047951683eaa1694f61df70da67d3fb1d78d0`. The changes:
- represent the real readout coefficients using `Complex.ofReal`;
- unfold the vector–matrix product explicitly;
- use `ring_nf` for the entrywise polynomial goals;
- write the inverse recovery calculation with explicit associativity steps.

Exact-head run [#44168376195](https://github.com/Satobloc/HsH/actions/runs/44168376195) was created. The exact checkout assertion passed. At the latest observation, Lake dependency-manifest generation was still in progress; the Lean compile step had not started. No build pass is claimed. **LEAN_NOT_VERIFIED** remains the status. The PR is OPEN / DRAFT / UNMERGED; no theorem promotion.

The PR description was updated to show both failed builds and the current third repair. A public status correction was appended to issue #1920 as comment [#6959910948](https://github.com/Satobloc/HsH/issues/1920#issuecomment-6959910948).

## 3. Information-preservation boundary remains

The complete source-defined transform (S_y=A S_r A^\dagger) is an invertible congruence. The full transformed matrix contains exactly the same information as the full raw matrix. The off-diagonal (S_{\eta a}) is a derived phase-sensitive statistic useful relative to reduced marginal-power or zero-lag summaries, not an independent measurement or information gain. The earlier public correction on issue #1920 remains in force.

## 4. Physical and workflow limits

No raw Figshare bytes, synchronized sample-level contour traces, or joint contour covariance were retrieved. No sample-level cross-spectrum, physical fit, H(s)H prediction, independent measurement, or numerical falsification threshold is claimed. No additional worldtube thickness, twist, contact surface, or distinct timesheet is forced. P2 remains HOLD.

The original issue #1920 remains the single PUBLISHED_VERIFIED result. No new issue, publisher submission, PR, branch, task, or handoff was created. The existing Ravel h907:s4 optional packet and successor run already exist.

The existing :36 automation task remains enabled with its original schedule and Lane Charter 36 phase. Its same provider run ID and moved start field are recorded in Amendment 02; Tern retains scheduler authority. No automation mutation or sixth task.
