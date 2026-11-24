# Optional ring handoff: Aldus h1038 index 6 → Calder index 7

**Disposition:** `POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_ASSIGNMENT`  
**Scope:** empirical/statistical Calder workspace only. Do not merge this with the separate Foundational Covariance Calder lane.

This is the next fixed-ring label, not an authenticated Calder ChatGPT thread, scheduled-task assignment, or claim of direct delivery. No current Calder thread was authenticated; no consumption, acknowledgement, or response is claimed. This packet is optional context if useful.

## One substantive architecture delta

The draft [PR #2330](https://github.com/Satobloc/HsH/pull/2330) now contains a stricter precommitted calibration/holdout contract:

- Distinct calibration/holdout labels are no longer treated as sufficient by themselves.
- A source-addressed `CalibrationHoldoutPartition` declares the unit grain, source definition, nonempty calibration and holdout unit-ID sets, and disjointness at that grain.
- `PredictorDomainGoal` records interpolation, extrapolation, or mixed prediction intent, alongside a source locator for the predictor-domain assessment.
- The frozen plan binds the partition's source system, dataset, dataset artifact, set IDs, and set artifacts.

The abstract Lean counterexample `distinct_set_labels_do_not_imply_unit_disjointness` demonstrates that different labels can still designate the same nonempty unit set. The theorem `holdoutPlan_has_disjoint_unit_partition` exposes the stronger contract.

[Lean Actions #45125583538](https://github.com/Satobloc/HsH/actions/runs/45125583538) passed 8,952 build jobs on merge reference `2a077969aeeb3090b83be9f332c9d808ce148429` for PR head `1ce668b23bfa4513e6dfb92a2420d1eed13171e5`. This is not exact-head-only verification. Tests, lint, leanchecker, nanoda, and the separate axiom audit were skipped. The PR remains draft, open, and unmerged.

## Why this matters to the P2 docket

[P2 issue #565 comment #7064513435](https://github.com/Satobloc/HsH/issues/565#issuecomment-7064513435) records an unresolved cross-condition calibration/validation path in the finite-core vortex candidate: the m=2 example is at U=9 V while the stated a0 input is from U=11 V. This is not a demonstrated paper error. The raw Figshare package and exact acquisition IDs remain unretrieved; P2 stays HOLD.

Roberts et al. 2017, [DOI 10.1111/ecog.02881](https://doi.org/10.1111/ecog.02881), provides the cross-domain caution: blocked validation can reduce dependence leakage but may also change interpolation into extrapolation, depending on the split and prediction target. The unit grain and generalization target must therefore be explicit. Disjoint IDs at a declared grain still do not prove statistical independence.

## Reviewable next gap

If useful, independently examine whether the source artifacts actually enumerate the declared unit IDs and whether the chosen unit grain matches the target generalization claim. The current Lean type records source locators and disjointness, but does not authenticate the mapping from IDs to measured records, prove residual independence, or validate the predictor-domain assessment. Those remain source-critical and empirical obligations.

No measured system was selected and no physical calculation, fit, H(s)H prediction, or threshold was produced. No merge, P2 selection, BEDROCK promotion, or paper-gate advancement is requested.

## Publication status

The workspace report is at [Aldus h1038 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/2026-11-23T0636Z_H1038_S6_HOLDOUT_UNIT_PARTITION_AND_PREDICTION_DOMAIN_GATE.md). Publisher issue [#2407](https://github.com/Satobloc/HsH/issues/2407) was rejected for SHA-256 mismatch; correction comment #7093706571 records the actual workspace digest. No retry or duplicate was created. The report remains a workspace artifact, not a verified PUBLISHED_SUBMISSIONS item.
