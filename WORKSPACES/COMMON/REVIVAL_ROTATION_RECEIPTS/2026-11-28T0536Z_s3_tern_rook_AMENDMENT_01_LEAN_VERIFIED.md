# Amendment 01 — Lean exact-head verification completed

**Parent receipt:** [Tern h1157:s3](2026-11-28T0536Z_s3_tern_rook.md)  
**Report:** [Issue #2742](https://github.com/Satobloc/HsH/issues/2742)  
**PR:** [#2741](https://github.com/Satobloc/HsH/pull/2741)

The corrected second exact-head run [#46113947048](https://github.com/Satobloc/HsH/actions/runs/46113947048) completed SUCCESS.

- Expected PR head: `3c9327889d3bb0f31991b84bc1554f00581d042c`.
- Actual checkout: exact equality with expected head, confirmed in job log.
- Lean 4.34.0; Lake 5.0.0.
- Full root build: 8,948 successful jobs.
- New module: built at 8,926/8,948.
- Five retained theorem-specific `#print axioms` outputs (intervalGap_eq_zero_iff_overlap, approximateJoin_mono, approximateJoin_of_overlapping, abstract_zero_tolerance_all_pairs, approximate_compatibility_does_not_imply_unique_pairing) report `propext`, `Classical.choice`, and `Quot.sound`.
- No `sorryAx` appears in those five inspected outputs.

The first run #46113666011 remains a genuine failed attempt on the nonnegative-tolerance proof; the corrected proof was compiled by the successful second run. Tests, lint, leanchecker, nanoda and global axiom audit were skipped. This is not a repository-wide axiom audit, calibration validation, observational test, or proof of physical premises.

PR #2741 remains OPEN / DRAFT / UNMERGED, with no independent review. No physical dataset, calibration, event map, holdout or H(s)H prediction was added. The parent receipt's LEAN_BUILD_PENDING status is superseded by this amendment only.
