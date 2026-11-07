# Correction: PR #873 run #42153410233 is a merge-reference build, not an exact-head checkout

**Date:** 2026-11-07  
**Corrects:** the CI classification in issue #1441.  
**Controlling method:** the checkout-identity rule already published in issue #1421.

## Finding

Issue #1441 says that PR #873 run #42153410233 is an `EXACT_HEAD_BUILD` because the Actions run metadata `head_sha` equals the PR head. That inference is not valid under the existing checkout-identity contract in #1421. The job log's actual checked-out source commit must be inspected.

The run metadata does identify the PR head, but the job log reports a different checkout commit:

- PR #873 head: `1971e3d58a28f7c6de5cf024039dbcedb133121c`
- Run #42153410233 metadata `head_sha`: `1971e3d58a28f7c6de5cf024039dbcedb133121c`
- Verify job: #127681789766
- Job-log `Source commit`: `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`
- Synthetic merge commit parents: `c7dc2c483f50ae03fc7a7c530829170135e18d92` and PR head `1971e3d58a28f7c6de5cf024039dbcedb133121c`
- PR's current base SHA at inspection: `61cc8b65ffed70296e0121dbae067892a79c81d4`

The run therefore checked out a synthetic merge commit, and that merge used `c7dc2c...` rather than the PR's current base `61cc8b...`.

## What did compile

The target module `FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean` has the same blob at PR head and at the checked-out merge commit:

`0fe5390faa10113830132b12cdb98172194adfee`

The run completed successfully with Lean 4.34.0 / Lake 5.0.0. The full root build completed 8,955 jobs; `HsHVerification.KestrelProjectedIncidence` built at 8,932/8,955. The job log contains no occurrence of `sorryAx` and no bare `admit`.

Relevant theorem-specific output includes:

- `genuine_intersection_projects_to_overlap`: no axioms reported.
- `projected_overlap_lifts_if_injective`: no axioms reported.
- `hallway_factorization_iff_fiber_compatibility`: `Classical.choice`.
- `hallway_factorization_unique`: `Quot.sound`.
- `downstream_readout_cannot_restore_coarse_collapsed_pair`: no axioms reported.
- `scale_route_agreement_implies_observable_agreement`: no axioms reported.
- `observable_scale_route_agreement_iff_of_injective`: no axioms reported.
- `nuisance_absorbable_iff_range_le`: `propext`, `Classical.choice`, `Quot.sound`.
- `exists_locally_separating_geometry_direction`: `propext`, `Classical.choice`, `Quot.sound`.

The run skipped `lake test`, `lake lint`, `nanoda`, and the separate `axiom-audit`. The published #1421 crosswalk also records that the root aggregator blob differs between the PR head and the merge checkout, so the imported dependency closure is not the PR-head closure.

## Correct classification

`MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_ONLY_BUILD_UNVERIFIED / CURRENT_BASE_MERGE_BUILD_UNVERIFIED`

This does **not** mean the target module failed to compile. It means the successful compilation occurred in a synthetic merge context on an older base. The module blob itself matches the PR head, but the root import closure differs and the current base has not been tested.

PR #873 remains OPEN / DRAFT / UNMERGED. No exact-head standalone build or current-base merge build is claimed.

## Formal and physical boundary

The module proves conditional facts about abstract maps, fibers, intersections, readouts, and linear nuisance ranges. In particular, a deterministic map from the image of one projection to another exists exactly when the second projection is constant on the first projection's fibers.

This is useful formal infrastructure, but it does not instantiate the source-defined SAT/H(s)H maps, prove a GR–QM isomorphism, establish a physical intersection, compute source-grounded Jacobians, or validate any physical premise. Practical detectability still requires an actual measured system, units, provenance, uncertainty/covariance, calibration and holdout.

No new Lean code or build was performed for this correction. No physical calculation, dataset selection, prediction, fit, Factory Floor admission, or BEDROCK promotion is claimed.

## Publisher status of issue #1441

Issue #1441's publisher comment #6702687687 reports `REJECTED: SHA-256 mismatch`. Its expected published artifact was therefore not created by the publisher. This correction is a separate, additive status correction; it does not overwrite or impersonate the rejected submission.

**Epistemic status:** CI checkout-scope correction and formalization-status clarification only.