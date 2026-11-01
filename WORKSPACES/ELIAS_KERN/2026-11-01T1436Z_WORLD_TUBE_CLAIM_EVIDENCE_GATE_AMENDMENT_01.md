# Amendment 01 | Final Lean verification | 2026-11-01 14:36Z

This amendment supersedes the initial report's `SUBMITTED_NOT_VERIFIED` status for the final Elias module build. It does not change the physical or source-translation status.

## Exact run and build

- Existing PR: #951, still open, draft and unmerged.
- PR branch: `research/elias-tracka-publisher-status-20261028t23z`.
- Exact branch head: `faa51b91e1cb32801eccd90aac337062883b81c6`.
- New module: `FORMAL_VERIFICATION/HsHVerification/EliasWorldtubeClaimEvidenceGate.lean`.
- Module blob at branch: `a34720b07942f973000271a961bf6363d1cd55dd`.
- Actions run: #41318147025.
- Build source/merge ref: `3f69b2c0aa60728fd61b6837b05363f2b07c6cf8`.
- Lean: 4.34.0, commit `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`.
- Lake: 5.0.0.
- Target module built at 8951/8953; root aggregator at 8952/8953.
- Full library: **Build completed successfully (8953 jobs)**.
- Full retrieved log: zero `sorryAx` occurrences and zero `admit` occurrences.

The target module blob matches exactly between PR branch and merge ref. The root aggregator blobs differ because the merge ref includes base-branch changes, but the merged root aggregator and full library built successfully. Classification:

`MERGE_REF_BUILD_SUCCESS / TARGET_MODULE_BLOB_MATCH / AGGREGATOR_BLOB_DIVERGED`

This is not a standalone exact-head build. The separate tests, lint, nanoda and automated axiom-audit stages were not run.

## Theorem-specific axiom results

All source-class and source-maturity equalities, direct status-field equalities, build-scope/blob-match facts, recorded-contract facts, and publication/chat status equalities report **no axioms**.

The gate-nonpass propositions and the proposition that publication does not imply empirical validation report only `propext`. The new module reports no `sorryAx`, `admit`, `Classical.choice` or `Quot.sound` dependency.

This verifies the encoded status record and gate logic. It does not establish:
- soundness of the source-to-formal translation;
- truth of the source's physical premises;
- existence of the missing bulk-to-diagrammatic or bulk-to-timesheet maps;
- physical fiber transport, force response or current constitutive law;
- measured-system validation or a successful holdout.

## Final disposition

`LEAN_BUILD_VERIFIED_ON_MERGE_REF`

The independent translation review remains `NOT_CHECKED`. The geometric representation, interaction-response, testability and empirical-validation gates remain unpassed for the current Ravel worldtube record. The latest 12:24 branch additions still have no separate publisher-artifact readback. No physical calculation, prediction, equation change or theory promotion is claimed.

The original report remains unchanged as the contemporaneous pending record; this amendment supplies the terminal build result.
