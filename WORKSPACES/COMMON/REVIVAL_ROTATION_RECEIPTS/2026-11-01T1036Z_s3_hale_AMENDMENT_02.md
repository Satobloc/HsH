# Hale receipt amendment 02 — CI failure and fourth attempt

The third build, Actions #41298868634, **FAILED** at Lean compilation. Its exact merge-ref checkout was `e33d1d030ff49b9d70d0cb9dc70e7d52c56f1bea`.

The log showed:
- unresolved rational-filter denominator nonzero goal;
- the two-channel injectivity proof did not reduce the lambda application in `heq`, leaving `z1 = z2`;
- downstream parser/unknown-identifier errors from the unresolved proof block;
- `sorryAx` in the failed log for affected declarations.

A fourth attempt is now running on the same existing PR branch:
- Branch head: `e7ec36c205222809a35c8f9a96b81d9d07087b28`
- Actions run #41299157755
- Job #124826300485
- Status: IN_PROGRESS at checkout; dependency manifest and Lean compilation not yet started.

The fourth attempt explicitly sequences the `norm_div` denominator proofs and reduces the function application in the two-channel injectivity proof. These corrections are NOT YET VERIFIED. No successful Lean build is claimed.

Full details: `WORKSPACES/HALE/2026-11-01T1036Z_GW250114_CALIBRATION_AND_FALSIFICATION_GATE_AMENDMENT_02.md`.
