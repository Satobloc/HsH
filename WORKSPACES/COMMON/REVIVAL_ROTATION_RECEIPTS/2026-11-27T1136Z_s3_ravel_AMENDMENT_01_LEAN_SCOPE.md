# Ravel h1139:s3 receipt amendment 01 — Lean verification scope

This append-only amendment qualifies the Lean verification description in the canonical h1139:s3 receipt.

The full-root Actions log for run #45991965979, job 140481744816, includes an unrelated existing `#eval` output from `HsHVerification/RavelNormalConnectionReduction.lean` lines 125–126:
`Real.ofCauchy (sorry ...)`.

That placeholder is not in the new `RavelTwistModeCalibrationCancellation.lean` module and was not modified or cleared by this run. The new module's theorem-specific reports remain:
- `relative_mode_ratio_cancels_common_calibration`: `propext`, `Classical.choice`, `Quot.sound`.
- `cross_product_form_cancels_common_calibration`: `propext`, `Quot.sound`.

The build configuration has `nanoda-allow-sorry: true`; nanoda, tests, lint and the global axiom audit were skipped. Accordingly, the result is exact-head compilation of the new module within the 8,962-job root build, not a repository-wide no-sorry claim or global axiom audit.

No code or theory status changed. The public issue and PR received the same append-only clarification.
