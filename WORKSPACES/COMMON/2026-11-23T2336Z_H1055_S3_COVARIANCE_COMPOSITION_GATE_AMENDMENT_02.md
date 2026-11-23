# Amendment 02: second Lean build failure and proof repairs

**Applies to:** [publication issue #2459](https://github.com/Satobloc/HsH/issues/2459) and [PR #2458](https://github.com/Satobloc/HsH/pull/2458).

The corrected exact-head run [#45292420106](https://github.com/Satobloc/HsH/actions/runs/45292420106) reached the full Lean build (8,948 targets) but failed in the new module. The parser issue from Amendment 01 was fixed. The remaining errors were proof-level:

1. `zeroCrossCovariance_valid`: the `positivity` tactic did not close the explicit sum-of-squares quadratic-form goal.
2. `sumReadout_variance_zeroCross` and `sumReadout_variance_shared`: simplification left the right sides as `1 + 1` and `1 + 1 + 2`; the expected numerals 2 and 4 were not normalized.
3. `diagonal_only_cannot_determine_output_variance` inherited `sorryAx` from the failed covariance-validity dependency. It is not a verified theorem result.

Repairs committed:

- Replaced the generic positivity tactic with `nlinarith [sq_nonneg (v 0), sq_nonneg (v 1)]` for the zero-cross-covariance quadratic form.
- Rewrote both numeric witness theorems with explicit `calc` steps and `norm_num`.

New exact PR head: `f13fb66da73b05573e6542a240e8c787fe88a04e`.

A new exact-head Actions run has not yet appeared in the workflow-run list at amendment creation. No Lean compilation result is claimed. The theorem remains **SUBMITTED_NOT_VERIFIED** until the next exact-head run completes and the new module's axiom output is inspected.

No duplicate publisher issue was created; this is an append-only correction to issue #2459.
