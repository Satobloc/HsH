# Calibration/holdout unit partition and prediction-domain gate

**Run:** h1038, ring index 6 (Aldus), nominal 2026-11-23T06:36Z  
**Lane:** Workshop Relay :36, architecture / workflow / prediction  
**Disposition:** `LEAN_MERGE_REF_BUILD_PASS / PR_DRAFT / NO_PHYSICAL_RESULT`

## 1. The gap closed

The existing draft [PR #2330](https://github.com/Satobloc/HsH/pull/2330) defined a precommitted calibration/holdout plan and required distinct `calibrationSetId` and `holdoutSetId` strings. That proves only that the labels differ. It does not prove that the underlying observation units are disjoint: two different labels can designate the same event, run, acquisition, subject, or frame set.

This matters because a nominal holdout can still leak calibration units while appearing to have a different dataset name.

## 2. Typed partition contract added

The existing PR branch now adds:

- `PredictorDomainGoal`: `interpolation`, `extrapolation`, or `mixed`.
- `CalibrationHoldoutPartition`: source system and dataset identities/artifacts; calibration and holdout set identities/artifacts; a declared independence-unit kind and source definition; nonempty calibration and holdout unit-ID sets; an explicit disjointness proof; a declared prediction/generalization target; a predictor-domain goal; and a source locator for its domain assessment.
- `PrecommittedHoldoutPlan` bindings that require the partition's source system, dataset, dataset artifact, set IDs, and set artifacts to match the frozen plan.
- Evidence projections exposing those bindings and the nonempty/disjoint unit-set conditions.

The declared unit grain may be a frame, acquisition, run, event, subject, or another source-defined unit. The choice must match the intended generalization claim. The type records the choice; it does not decide it.

**Important limit:** disjoint IDs at a declared grain do not prove statistical independence. Nor does Lean authenticate that the IDs enumerate the actual measurements or that the predictor-domain assessment is correct. Those require source-bound manifests and independent review.

## 3. Lean verification

Two theorems were added:

- `distinct_set_labels_do_not_imply_unit_disjointness`: an abstract logical counterexample showing that distinct set labels can still designate the same nonempty unit set. The witness is not a physical dataset or synthetic experimental fixture.
- `holdoutPlan_has_disjoint_unit_partition`: exposes the required nonempty calibration/holdout unit sets and their disjointness.

[Actions run #45125583538](https://github.com/Satobloc/HsH/actions/runs/45125583538), job `137529050807`, compiled the PR merge reference:

- PR head: `1ce668b23bfa4513e6dfb92a2420d1eed13171e5`
- Merge reference: `2a077969aeeb3090b83be9f332c9d808ce148429`
- Lean 4.34.0 / Lake 5.0.0 / Mathlib
- **8,952 build jobs completed successfully**

This was a merge-reference build, not an exact-head-only build. Tests, lint, leanchecker, nanoda, and the separate axiom audit were skipped. The new theorem reports list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`, `admit`, or build error appeared in the retrieved log. The PR remains draft, open, and unmerged.

Lean verifies the formalized contract, not the correctness of the source-to-ID mapping, statistical assumptions, physical premises, or H(s)H.

## 4. Why the prediction-domain field matters

The existing P2 docket's finite-core vortex candidate illustrates the need. Issue #565 comment [#7064513435](https://github.com/Satobloc/HsH/issues/565#issuecomment-7064513435) records that the paper's m=2 example is U=9 V, while the stated a0 calibration input is taken from a U=11 V measurement. The source audit classifies this as an unresolved cross-condition calibration/validation gap, not a demonstrated paper error. The Figshare DOI is known, but its exact version, file inventory, raw bytes, acquisition IDs, and paired covariance remain unretrieved. No P2 selection follows.

A second, cross-disciplinary constraint comes from Roberts et al., “Cross-validation strategies for data with temporal, spatial, hierarchical, or phylogenetic structure” (2017, DOI [10.1111/ecog.02881](https://doi.org/10.1111/ecog.02881)). Blocking can reduce dependence leakage, but depending on the target it can also turn an interpolation task into extrapolation and produce an inappropriate error estimate. Therefore a split must state both **which units are held out** and **what prediction domain is being tested**.

## 5. Consequence for an independently falsifiable test

Before a candidate can be scored, its test packet must bind:

1. an identifiable measured system and version-pinned dataset/artifacts;
2. units and acquisition provenance;
3. a declared split-unit definition and nonoverlapping calibration/holdout unit IDs;
4. the intended prediction/generalization target and interpolation/extrapolation regime;
5. shared parameters, calibration procedure, nuisance parameters, and frozen model/readout maps;
6. the predicted observable, standard comparator, joint uncertainty/covariance model, and predeclared falsification threshold;
7. a genuinely untouched holdout evaluation with no holdout-driven retuning.

If any required identity, partition, domain, uncertainty, or comparator field is absent, the result is `NOT_SCOREABLE`, not positive or negative evidence for H(s)H.

## 6. Research and campaign boundary

No measured system was selected for this run. No raw dataset was downloaded or analyzed; no physical calculation, fit, H(s)H prediction, numerical threshold, or independent measurement was produced. The new Lean objects are an abstract admission contract, not an empirical result or a new physical law.

P0 Code Grurple remains active. P1 remains overdue/frozen/not ready and Orson-owned. P2 remains HOLD; the November 23 first-draft/hostile-review checkpoint is not met, and the November 30 major and December 14 full-theory gates remain separate. No BEDROCK, SAT-O, or Blockwave equation was changed. No task, schedule, ID, phase, or enabled state was changed; no sixth task was created.

## 7. Provenance and tooling

The historical Aldus remit is source-grounded broad cross-reading and combining information not usually combined, supported by direct-user message `fcff5c18-85c4-4efc-b7e5-df7ee20c0646` in conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`. No standalone signed Aldus specialist charter or authenticated current Aldus thread was found. The raw export's known blob locator returned no fresh content payload; the September 12 worker-authored check-in and prior source-audit receipts were used as bounded provenance witnesses.

Mersearch was not run: no callable connector was available and all four canonical request lanes remain occupied/requested. GitHub known-path reads were a bounded fallback, not a Mersearch search. HsH, SAT archive, and HSH_RESOURCES front doors were checked; HSH_RESOURCES is treated as an internal reference boundary and only its root README was read. Existing Math Hopper #578 / draft PR #991, Whirligig Kernel 0, existing Lean PR #2330, and SciSpace availability were checked. The existing GitHub Actions/Mathlib route was free; no new tool, fork, dependency, subscription, or expenditure was introduced.
