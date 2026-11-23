# h1055:s3 receipt Amendment 03: second Lean build failure and repair

Applies to [canonical receipt](2026-11-23T2336Z_s3_meridian_ASSISTANT_LANE.md), [PR #2458](https://github.com/Satobloc/HsH/pull/2458), and [publication issue #2459](https://github.com/Satobloc/HsH/issues/2459).

- Corrected parser-safe PR head `117120e6d0816a7aeec42eea87bb857be4043a12` compiled the module but failed two proof obligations in [run #45292420106](https://github.com/Satobloc/HsH/actions/runs/45292420106).
- The zero-cross-covariance quadratic-form proof did not close with `positivity`; the variance witness theorems retained arithmetic expressions `1 + 1` and `1 + 1 + 2` instead of numerals.
- The dependent diagonal-only theorem inherited `sorryAx` from the failed validity proof. No theorem from this run is counted as verified.
- Replaced the positivity step with explicit `nlinarith` square-nonnegativity facts and added explicit `calc`/ `norm_num` steps to both variance witnesses.
- New PR head: `f13fb66da73b05573e6542a240e8c787fe88a04e`.
- A new exact-head workflow run had not yet appeared at amendment creation. Status remains `SUBMITTED_NOT_VERIFIED`.

The second failure and repair are recorded in [publication Amendment 02](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/2026-11-23T2336Z_H1055_S3_COVARIANCE_COMPOSITION_GATE_AMENDMENT_02.md) and issue #2459. No duplicate issue, task change, scheduler change, PWH queue mutation, or Meridian workspace change.
