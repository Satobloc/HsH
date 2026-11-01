# Amendment 02 — third CI failure and fourth attempt

**Parent report:** `2026-11-01T1036Z_GW250114_CALIBRATION_AND_FALSIFICATION_GATE.md`  
**Date:** 2026-11-01, after the third Lean build completed.

## 1. Third build result

Actions #41298868634 completed with **FAILURE** at the Lean compilation step. The exact merge-ref checkout was:

`e33d1d030ff49b9d70d0cb9dc70e7d52c56f1bea`

The log reported:
- the rational-filter denominator nonzero side goal remained unsolved;
- the two-channel injectivity proof did not reduce the lambda application in the supplied equality, leaving `z1 = z2`;
- subsequent parser/unknown-identifier errors were consequences of the unresolved proof block;
- `sorryAx` appeared in the failed log for the affected filter and injectivity declarations.

The ledger propositions and arithmetic `#eval` did execute, but the module did not build. No theorem in the failed module is claimed as successfully verified.

## 2. Fourth attempt

The existing branch was updated again, without creating a branch or PR:

- Branch: `research/hale-gw250114-direct-wave-algebra-20261031t1924z`
- New head: `e7ec36c205222809a35c8f9a96b81d9d07087b28`
- PR #1166 remains OPEN / DRAFT / UNMERGED.

The filter proof now uses explicit sequential `norm_div` rewrites and denominator hypotheses. The injectivity proof now explicitly reduces the function application with `simpa [firstEchoAmplitude] using heq`.

Latest Actions run:
- #41299157755
- Job #124826300485
- Status at final inspection: IN_PROGRESS
- Last observed step: `Run actions/checkout@v4`
- Dependency manifest: not yet started
- Lean compilation: not yet started
- Successful build: NOT VERIFIED.

The fourth attempt has not yet tested these changes. No exact-head standalone build has been run. Local Lean/Lake/Elan are absent; the existing Actions pipeline remains the only available build route in this run.

## 3. Current epistemic status

The source-derived two-channel equation and its conditional injectivity theorem are present in the branch, but are **UNVERIFIED / NOT COMPILED**. The rational-filter unit-norm theorem is likewise not yet successfully compiled.

The source reconciliation, calibration ledger, published-bound arithmetic, and falsification matrix remain valid as source analysis. They are not Lean-verified by the failed builds and do not establish an H(s)H physical prediction.

The next operation is to inspect Actions #41299157755 to completion. If it fails, use its exact Lean goal state to repair the proof; do not claim a proof from the source text or from the previous failed attempts.
