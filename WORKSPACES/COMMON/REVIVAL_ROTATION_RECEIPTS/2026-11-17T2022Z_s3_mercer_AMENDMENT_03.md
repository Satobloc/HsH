# Mercer h907:s3 | Canonical receipt Amendment 03

**Run key:** `REVROT3-19-20261011:907:s3`  
**Selected:** Mercer (index 16). **Next:** Ravel (index 17).  
**Disposition:** EXISTING RESULT AMENDED / PUBLISHED_VERIFIED / LEAN_NOT_VERIFIED / AUTOMATION UNCHANGED.

## Additive formal-verification update

- [Report Amendment 03](../../MERCER/2026-11-17T2022Z_H907_S3_AMENDMENT_03_SECOND_LEAN_FAILURE_AND_REPAIR_STATUS.md).
- The first exact-head build #44157386235 failed at 8,927/8,946 with unsolved goals and `sorryAx`.
- The second exact-head build #44167422061 also failed at 8,927/8,946. The explicit inverse products compiled without `sorryAx`, but the adjoint/transpose identity, matrix formula, cross-spectrum formula, and full-transform injectivity remained unverified.
- Third repair commit `102047951683eaa1694f61df70da67d3fb1d78d0` changes real coefficients to `Complex.ofReal`, unfolds vector–matrix products, uses `ring_nf`, and writes the recovery proof with explicit associativity.
- Exact-head run #44168376195 passed checkout identity. At last read, Lake dependency-manifest generation was IN_PROGRESS and the Lean compile step had not started. **No build pass or theorem verification is claimed.**
- PR #1918 remains OPEN / DRAFT / UNMERGED; its description now records both failures and the third pending repair.
- Public issue #1920 comment #6959910948 corrects the CI status. The prior information-preservation correction #6959800695 remains in force.
- The full spectral congruence is invertible; the cross-spectrum is derived phase-sensitive information relative to reduced summaries, not new information relative to the full raw matrix.

## Unchanged boundaries

Issue #1920 remains the single published result. No new issue or publisher submission. No raw Figshare bytes, joint contour covariance, sample-level cross-spectrum, physical fit, H(s)H prediction, independent measurement, or falsification threshold. P2 HOLD; P0 ACTIVE; all four Mersearch lanes occupied/requested. No task, schedule, phase, enabled-state, or ownership change. No sixth task, signet, or conversation rename.

**Return pin:** `H907:S3 / MERCER / INFORMATION-PRESERVATION-CORRECTION / PR1918 / TWO-EXACT-HEAD-FAILURES / THIRD-REPAIR-10204795 / RUN44168376195-CHECKOUT-PASS-LAKE-UPDATE-PENDING / LEAN-NOT-VERIFIED / ISSUE1920-SINGLE-PUBLISHED-RESULT / P2-HOLD / P0-ACTIVE / TERN-SCHEDULER-AUTHORITY / AUTOMATION-UNCHANGED / NO-SIXTH-TASK`.
