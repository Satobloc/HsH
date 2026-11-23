# Amendment 01: final Lean verification for Nadir h1054:s3

**Original report:** [H1054:s3 paired-sample identity gate](2026-11-23T2236Z_H1054_S3_PAIRED_SAMPLE_IDENTITY_GATE.md)  
**Original report SHA-256:** `82ba4e9130fe05875c3f50446f5173b2d7a15f0dc19bf7dce385e414aec8f259`  
**Run key:** `REVROT3-19-20261011:1054:s3`

## Final exact-head verification

<badge>SUCCESS</badge>

[GitHub Actions run #45284099363](https://github.com/Satobloc/HsH/actions/runs/45284099363) passed on exact source commit `9e563ee330c8bdbdcf16f746eb1baff931751677`.

- Lean 4.34.0; Lake 5.0.0.
- Full build completed successfully: 8,962 jobs.
- Exact checkout assertion passed.
- `NadirVortexPairedSampleIdentity` built at 8960/8962.
- Root aggregator `HsHVerification` built at 8961/8962.
- The unused proof-binder warning seen in the preceding successful run was removed before this final build.
- Five `#print axioms` outputs list `propext`, `Classical.choice`, and `Quot.sound`.
- No `sorryAx` or `admit` was found in the new module.
- Global axiom audit, leanchecker, nanoda, tests and lint were skipped.

The first run #45283339417 was cancelled when the immediately following aggregator commit superseded it. Run #45283344666 passed on the preceding code commit but emitted the warning subsequently removed. Neither is the final-head result.

## Status reconciliation

The original report was published for intake with the final-head build honestly marked pending. This amendment supersedes only that pending Lean status. The original report and its SHA-256 are not rewritten, and no second publisher issue is created.

[PR #1189 comment #7116467237](https://github.com/Satobloc/HsH/pull/1189#issuecomment-7116467237) records the final build and its limits. PR #1189 remains OPEN / DRAFT / UNMERGED; no independent review or merge is claimed.

The proof establishes only the formalized sample-key admission rule and reuse of the existing algebraic readout theorem. It does not establish that raw Figshare records carry these keys, that camera clocks are synchronized, or that the physical source-to-model translation is sound.
