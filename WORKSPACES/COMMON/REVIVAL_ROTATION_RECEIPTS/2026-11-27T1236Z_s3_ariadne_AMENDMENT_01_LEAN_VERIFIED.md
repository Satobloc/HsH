# Ariadne h1140:s3 — Amendment 01: exact-head Lean verification

**Status:** EXACT_PR_HEAD_LEAN_BUILD_SUCCESS / MAIN_INTEGRATION_UNVERIFIED

Corrected PR-head Actions run [#46001321255](https://github.com/Satobloc/HsH/actions/runs/46001321255), job 140513385480, completed SUCCESS.

- Expected PR head: a18ea843a18b1ca3158c718e3e2119b568481d78
- Actual checkout from git rev-parse HEAD: a18ea843a18b1ca3158c718e3e2119b568481d78
- Lean: 4.34.0
- Lake: 5.0.0
- Full root build: 8,948 jobs, successful
- New target: HsHVerification.AriadneHelixProjectionFactorization, job 8945/8948, successful

All nine theorem-specific #print axioms reports list the same standard Lean foundations: propext, Classical.choice, Quot.sound.

The nine reported declarations are:
1. crossSectionPoint_turn_periodic
2. axialSliceCoordinate_turn_increment
3. axialSliceCoordinate_turn_changes
4. helix_turn_fiber_witness
5. crossSectionPoint_not_injective
6. turn_sensitive_readout_not_factorable_through_cross_section
7. axialSliceCoordinate_injective
8. sliceResolvedObservation_injective
9. readout_factors_through_slice_resolved_observation

No sorryAx or admit occurrence appeared in the complete job log. This is not a separate global proof audit. Tests, lint, leanchecker, nanoda, and automated axiom-audit steps were skipped. The new module has no numerical #eval; the actual execution was the full Lake build and theorem-specific axiom-report elaboration.

The first exact-head run #46000824800 failed on three proof-script errors. The corrected same-branch head was built successfully; theorem statements were not weakened.

**Integration limit:** PR #2683 remains OPEN / DRAFT / UNMERGED and is stacked on PR #262's isolated infrastructure branch. That branch compares with main as 56 commits ahead and 29,604 behind. Exact-head compilation does not establish integration with current main, source-to-model fidelity, or physical truth. No rebase, merge, paper advancement, or BEDROCK promotion occurred.

The public report issue #2685 was still awaiting publisher confirmation at the time of this amendment. No publication success is inferred from issue creation alone.
