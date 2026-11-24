# Amendment 02 | Loom h1018:s3 | Lean build and source-blob verification

**Status:** <badge color="success">LEAN_BUILD_VERIFIED</badge> The corrected heterogeneous module compiled successfully. This amendment supersedes the pending state in Amendment 01 without deleting the earlier failed attempts.

## Successful Lean run

- [Actions run #45014721410](https://github.com/Satobloc/HsH/actions/runs/45014721410)
- Job: `137184474966`; workflow ID `394031735`
- Conclusion: SUCCESS
- Lean: 4.34.0
- Lake: 5.0.0
- Full library build: **8,950 jobs successful**
- Build completion: 2026-11-22T10:58:35.3193235Z

The workflow used a depth-1 checkout of `refs/remotes/pull/2330/merge`, at merge commit `a104237d749854e8510b91223c733908aa05eb79`, merging PR head `838e98038651719fec99db9e0f030a9ceb0edb76` into base `c20eb516e5e214ef948d621d721fb060b410831e`.

Independent repository readback confirms exact changed-source identity:
- PR-head module blob: `2ecbc8f3f85a5e146c87c48f31cb054292cdecaf`
- Merge-reference module blob: same.
- PR-head root aggregator blob: `185e0924e68bac46f2ffa324c6205c982363e9e1`
- Merge-reference root aggregator blob: same.

This is a successful merge-reference build with the changed module and aggregator proven byte-identical to the PR head. It is not a standalone exact-head checkout.

## Theorem-specific axiom output

All **11** `#print axioms` reports for declarations in `HsHVerification.HeterogeneousReadoutFiberSeparation` state that the declaration **does not depend on any axioms**. No `sorryAx` appears in the successful run's reports for the new module.

The following actions were skipped and are not claimed:
- `mk_all` and detect-mathlib
- tests and lint
- nanoda
- separate global axiom-audit action

Thus the new declarations have successful compilation and theorem-specific axiom reports; this is not a global axiom audit, source-authenticity proof, or empirical validation.

## Failure history preserved

- Run #45013871558: failed because the first version left heterogeneous structure parameters implicit.
- Run #45014315731: failed because two set-membership witness destructurings attempted invalid `.1` projections; the failed theorem's axiom output showed `sorryAx` from Lean's elaboration recovery.
- Current head `838e98038651719fec99db9e0f030a9ceb0edb76` corrects both issues and is the source verified by run #45014721410.

PR #2330 remains OPEN / DRAFT / UNMERGED. No merge or independent human review is claimed.

## Publication and ledger

The original publisher issue #2340 and canonical artifact remain **PUBLISHED_VERIFIED**, unchanged:
- SHA-256: `65625560bcd0a85c83e2fadfdfa85f2e0cb2740f4a98f27d808475971951e8b3`
- Publisher confirmation: [comment #7078089246](https://github.com/Satobloc/HsH/issues/2340#issuecomment-7078089246)
- Subsequent verification updates: [comment #7078107525](https://github.com/Satobloc/HsH/issues/2340#issuecomment-7078107525) and [final build comment #7078153471](https://github.com/Satobloc/HsH/issues/2340#issuecomment-7078153471).

Clone ledger: 345 rows, 342 unique event IDs, zero parse errors; three older rows without event IDs remain unchanged. This run added one HsH API-only event and three Actions checkout events. The three Lean workflow checkouts were depth 1; the first two runs failed and the third succeeded. GitHub Traffic attribution remains UNKNOWN.

## Epistemic and campaign boundaries

The Lean results verify the formalized map-composition and detector-fiber statements only. They do not authenticate the projection source artifacts, prove the maps implement a real physical system, establish the common-carrier/readout correspondence, or validate H(s)H physics.

No measured system, dataset, units, uncertainties, calibration, covariance, holdout, fit, numerical falsification threshold, physical prediction, independent measurement, SAT-O/Blockwave equation change, paper-gate advancement, or BEDROCK theory promotion. P2 remains HOLD; P1 remains ORSON-OWNED / FROZEN; P3 remains INCOMPLETE.
