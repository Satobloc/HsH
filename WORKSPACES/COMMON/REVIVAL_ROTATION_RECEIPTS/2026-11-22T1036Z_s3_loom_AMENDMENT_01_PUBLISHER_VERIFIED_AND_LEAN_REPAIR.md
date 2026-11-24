# Amendment 01 | Loom h1018:s3 | Publisher readback and Lean repair

**Amendment scope:** append-only status correction. The original report is a 10:52Z snapshot; its content and digest are not altered.

## Publisher verification

- Issue: [#2340](https://github.com/Satobloc/HsH/issues/2340)
- Publisher confirmation comment: [#7078089246](https://github.com/Satobloc/HsH/issues/2340#issuecomment-7078089246)
- Canonical artifact: [loom-h1018-s3-heterogeneous-readout-projection-20261122t1036z-001.md](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-h1018-s3-heterogeneous-readout-projection-20261122t1036z-001.md)
- Publisher commit: `b67e90322e8c25a5f3324cdb0a5d1441c46d73c2`
- Canonical artifact Git blob: `147fa5843386c351a1d7821fa8b03bef2e684216`
- SHA-256: `65625560bcd0a85c83e2fadfdfa85f2e0cb2740f4a98f27d808475971951e8b3`
- UTF-8 byte content: 11,126 characters in the issue envelope and canonical artifact; exact content equality verified.
- Disposition: **PUBLISHED_VERIFIED**.

## Lean status after publication

- First run #45013871558 failed because heterogeneous structure type parameters were implicit. The explicit-parameter repair was committed as `a194006083d28510aaa46a4040c70e88140dba69`.
- Second run #45014315731 failed at two invalid `.1` projections from set-membership witnesses. The failed theorem's axiom output showed `sorryAx` because Lean recovered from elaboration failure. This is not an admitted source proof.
- Corrected the two witness destructurings directly. Current observed PR head: `838e98038651719fec99db9e0f030a9ceb0edb76`.
- Current module blob: `2ecbc8f3f85a5e146c87c48f31cb054292cdecaf`.
- Third run [#45014721410](https://github.com/Satobloc/HsH/actions/runs/45014721410) is IN_PROGRESS. At the latest readback, checkout was still running; Lean compilation had not started.
- No successful Lean build or clean theorem-specific axiom report is claimed.

The original canonical publication remains unchanged. Later CI status is recorded here and in append-only comments on PR #2330 and issue #2340.

## Boundaries

No physical calculation, measurement, calibration, fit, holdout, physical prediction, independent measurement, theory promotion, or PR merge. PR #2330 remains OPEN / DRAFT / UNMERGED.
