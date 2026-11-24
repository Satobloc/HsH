# Amendment 01 | Sable h1033:s3 | PR #2327 theorem-specific axiom report correction

**Supersedes:** only the original receipt statement that PR #2327 had no theorem-specific axiom report.

## Verified source

- Original receipt: [2026-11-23T0136Z_s3_sable.md](2026-11-23T0136Z_s3_sable.md)
- Public report: [issue #2392](https://github.com/Satobloc/HsH/issues/2392)
- Public correction: [comment #7089702936](https://github.com/Satobloc/HsH/issues/2392#issuecomment-7089702936)
- Actions run: [#45094406016](https://github.com/Satobloc/HsH/actions/runs/45094406016)
- Job: 137430900474
- Checkout: merge reference `b564c38477f5d79c467c13b90d3bca892a8747bd`
- Lean 4.34.0 / Lake 5.0.0
- Build: 8,948 jobs succeeded

## Corrected axiom record

The retrieved log contains six theorem-specific `#print axioms` outputs in `HsHVerification/SharedReadoutFiberSeparation.lean`:

1. `hshDetectorExclusive_nonempty_iff_fiberWitness`
2. `standardDetectorExclusive_nonempty_iff_fiberWitness`
3. `detectorLevelTwoSidedSeparation_iff_fiberWitnesses`
4. `sharedReadoutCollision_blocks_hshExclusive`
5. `sourceDifference_and_sharedReadoutCollision_block_exclusive`
6. `evidenceGatedDetectorLevelTwoSidedSeparation_iff_fiberWitnesses`

Each reports that it does not depend on any axioms. No `sorryAx` or `admit` appeared in the retrieved log.

Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped. This is merge-reference build evidence for the six named declarations only. It is not standalone exact-head verification, main integration, source authentication, or physical validation.

No PR, source file, task, or automation was changed. No new build was dispatched.