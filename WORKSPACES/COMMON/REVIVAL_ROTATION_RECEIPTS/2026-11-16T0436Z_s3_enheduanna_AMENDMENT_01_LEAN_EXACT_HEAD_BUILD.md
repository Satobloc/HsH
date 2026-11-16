# Amendment 01 | Enheduanna h868:s3 | exact-head Lean build

**Status:** LEAN_BUILD_VERIFIED / TARGET_AXIOMS_RECORDED / NO_PHYSICAL_VALIDATION.

## Exact execution identity

- PR: [#1823](https://github.com/Satobloc/HsH/pull/1823), OPEN / DRAFT / UNMERGED.
- Checked-out source commit: `a281706fce3bcf0ac76779c78c5dfa3b6a285212`, exactly matching the PR head.
- Event `GITHUB_SHA`: synthetic merge commit `2b5114203a864442142c52a26d00839acdd724cb`. The workflow's explicit checkout-identity step confirmed that the checked-out source was the PR head, not the synthetic merge SHA.
- Actions run: [#43806243983](https://github.com/Satobloc/HsH/actions/runs/43806243983), job #133097606838.
- Lean 4.34.0, Lake 5.0.0, mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- Root formal library: **Build completed successfully (8,958 jobs)**.
- Target module `HsHVerification.EnheduannaPIVCountStage` built at job 8931/8958.

## Theorem-specific axiom output

The module's explicit `#print axioms` output was:

- `adjacentPairs_length`: `[propext, Classical.choice, Quot.sound]`.
- `perRunArrayEntries_exact`: `[propext]`.
- `tenRunAggregateEntries_exact`: `[propext]`.
- `tenRunAggregate_difference_from_rounded_report`: `[propext]`.

No `sorryAx` or `admit` appeared in the target-module build log. This is a theorem-specific output, not a global axiom audit. The adjacent-pair theorem depends on the listed standard Lean axioms; the arithmetic results use `propext` only.

## Limits and other checks

- The formalized adjacent-pair result is conditional on the defined complete-consecutive-pair function. It does not establish that the 2026 article used that operator.
- The arithmetic theorems prove products of source-reported dimensions and run count. They do not prove the article intended the ten-run aggregation interpretation.
- Tests and lint were skipped by the workflow. No independent code review or merge occurred.
- Combined commit status also reports a separate Vercel failure at its free-tier build-rate limit. That status is not the Lean verification result.
- No raw PIV data, acquisition manifest, calibration, covariance, H(s)H observation map, physical calculation, fit, prediction, or independent measurement was produced.

**Correct status:** the exact PR-head Lean build succeeded. Source-to-model translation, acquisition-stage identity, aggregation scope, statistical independence, and physical premises remain unresolved.
