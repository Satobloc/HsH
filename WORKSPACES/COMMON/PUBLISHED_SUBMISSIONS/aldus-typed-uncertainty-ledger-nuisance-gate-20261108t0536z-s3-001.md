# Typed uncertainty ledger and nuisance-resistant holdout gate

**Prepared:** 2026-11-08T05:36Z  
**Run:** REVROT3-19-20261011:677:s3 — deterministic Aldus label → Calder successor  
**Classification:** additive workflow architecture proposal; current-assistant reconstruction, not an authenticated historical Aldus appearance.  
**Status:** PROPOSED / NO PHYSICAL PREDICTION / NO NEW LEAN THEOREM / NO THEORY PROMOTION.

## Executive finding

The current H(s)H workflow already has several strong components, but they are distributed across separate artifacts:

- Kestrel's cross-domain readout envelope records type, history, support, calibration, and information/uncertainty.
- Aldus's calibration/evaluation review separates instrument response, calibration, fitting, multi-input evaluation, and data overlap.
- Aster's map-edge gate separates source authority, mathematical map specification, and empirical readiness.
- Kestrel PR #873 formalizes conditional fiber identifiability and local nuisance absorption.
- Sable's P3 grid and Nadir's cross-study gate require frozen shared parameters, whole-sector/study holdouts, matched comparators, and no refitting.

The missing integration is a **typed uncertainty ledger that travels with the complete source-to-observable composition**. It prevents source ambiguity, geometric non-identifiability, measurement covariance, nuisance freedom, and data dependence from being collapsed into one generic error bar.

This is an additive gate, not a new physical law, canonical symbol, H(s)H equation, or replacement for those existing artifacts.

## 1. Five non-interchangeable evidence channels

Four channels describe distinct kinds of uncertainty. The fifth is a cross-cutting dependence audit, not another uncertainty distribution.

| Channel | What varies | Correct representation | What must not happen |
|---|---|---|---|
| Source / semantic | Which map law, equation, object identity, or interpretation is actually source-authorized | Provenance-bearing candidate set with separate statuses: NATHAN_DIRECT, HISTORICAL_DOCUMENT, STANDARD_REFERENCE, ASSISTANT_RECONSTRUCTION, INDEPENDENT_MEASUREMENT, SOURCE_UNRESOLVED | Do not probability-weight unresolved source attributions, average incompatible source versions, or relabel an assistant reconstruction as Nathan Direct |
| Geometric / fiber | Which admissible fine states remain compatible with a lossy projection | Set-valued prediction envelope over the complete observation fiber | Do not replace a non-singleton fiber image with an arbitrary representative or a Gaussian error bar |
| Instrument / measurement / calibration | Sensor noise, sampling, response, calibration parameters, and shared systematics | Versioned observation model and full joint covariance/likelihood where supported | Do not assume independent channels, confuse calibration with evaluation, or omit calibration uncertainty |
| Nuisance / model discrepancy | Standard nuisance response and residual model inadequacy | Separate parameter blocks, source-grounded sensitivities, and a discrepancy model frozen on calibration data | Do not let a free discrepancy term or holdout-fitted nuisance parameter absorb every mismatch |
| Dependence / overlap | Shared specimen, acquisition, calibration standard, analysis pipeline, prior, or source data | Provenance/overlap vector; use it to determine independence and covariance | Do not count channels, files, papers, processing variants, or adjacent frames as independent acquisitions |

### 1.1 Geometric non-identifiability is set-valued

For a declared admissible state space X, source-to-observation map pi : X → Y, target observable O : X → Z, and observed value y, define temporary descriptive notation:

\[
F(y)=\{x\in X:\pi(x)=y\},\qquad
E(y)=\{O(x):x\in F(y)\}.
\]

E(y) is the target-observable envelope compatible with the observed projection.

- If E(y) is a singleton, the target is constant on the observation fiber and a deterministic downstream readout exists on the observed range.
- If E(y) contains multiple values, the target is only partially identified. Report the set or a justified bound; do not silently choose one state.
- If the envelope is unbounded or its admissible domain is not specified, report that explicitly.
- A probability distribution over the fiber requires a separately justified measure or prior. Geometry alone does not supply one.

This is not measurement covariance. It is information discarded by a non-injective representation map.

### 1.2 Nuisance absorption is a separate identifiability test

At a declared calibration point, let J_geom map geometry-parameter perturbations to observable perturbations and J_nuis map standard nuisance perturbations to the same observable tangent space.

The existing Kestrel formalization establishes the conditional criterion:

\[
\operatorname{range}(J_{\rm geom})
\subseteq
\operatorname{range}(J_{\rm nuis})
\]

means every first-order geometry sensitivity is absorbable by some nuisance perturbation. In that case the proposed geometric signature is not locally distinguishable from the nuisance family.

If the inclusion fails, at least one first-order geometry direction lies outside the nuisance response range. That is a necessary opening for distinguishability, **not** proof that the direction is detectable after measurement covariance, finite resolution, or holdout uncertainty.

The Jacobians, calibration point, admissible parameter space, and gauge-reduced tangent convention must come from the actual selected system. No data-free fixture or invented Jacobian is supplied here.

## 2. Combination rules

Do not combine the five channels into one scalar uncertainty by default.

1. Keep source-authorized map alternatives separate. A union of prediction sets is appropriate only when each member is an admissible candidate; assigning weights requires explicit priors or an independently justified probability model.
2. Keep the geometric fiber envelope set-valued. It is not automatically Gaussian and cannot be narrowed by selecting a convenient representative.
3. Propagate measurement and calibration covariance only from actual versioned measurements and a declared joint covariance model. Preserve cross-channel and shared-systematic terms.
4. Keep fitted-parameter uncertainty distinct from instrument calibration and from multi-input statistical evaluation/adjustment.
5. Estimate any model-discrepancy term on the calibration subset, declare its form and parameter budget, then freeze it before holdout access. If no independently constrained discrepancy model exists, do not add a free rescue term.
6. Record dependence/overlap before claiming independent replication or a blind holdout. A reused specimen, acquisition, calibration, prior, or analysis pipeline can invalidate a naive independence assumption.

Quadrature is justified only after the terms have been placed in a common probabilistic model with explicit dependence and covariance assumptions. Otherwise retain the set-valued and covariance components separately.

## 3. Prediction-admission sequence

For every proposed H(s)H geometry-to-observable chain:

1. **Source lock:** identify the exact source and author status for each map edge and equation. Keep unresolved source alternatives explicit.
2. **Map typing:** record domain, codomain, operation, support, units, metric/signature/frame where defined, boundary conditions, admissible domain, preserved quantities, fibers, and composition order.
3. **Fiber test:** determine whether the target observable is constant on each observation fiber. If not, retain the full set-valued envelope.
4. **Instrument model:** identify the actual sensor, sampling/support mask, response, calibration standards, fitted corrections, and full available covariance.
5. **Nuisance test:** use source-grounded calibration-point sensitivities to determine whether geometry effects lie inside the standard nuisance range. Freeze allowed nuisance freedom.
6. **Discrepancy rule:** declare any model-discrepancy term and its calibration-only estimation procedure before opening the holdout.
7. **Dependence audit:** record acquisition, specimen, calibration, analysis, prior, and holdout-access overlap. Do not infer independence from publication or file counts.
8. **Holdout and comparator:** freeze shared geometry and parameters, withhold an independent acquisition/study/sector, and compare H(s)H and the standard model on the same observations and measurement process.
9. **Score and falsification:** derive the threshold from the actual covariance and preregistered score. Do not invent a universal numerical threshold.

### Local outcome vocabulary

These labels are proposed for this workflow note only; they do not create new BEDROCK status classes.

- SOURCE_MAP_UNRESOLVED → PREDICTION_NOT_FORMED.
- FIBER_NONIDENTIFIABLE → PARTIALLY_IDENTIFIED; report E(y), not a point prediction.
- MEASUREMENT_OR_CALIBRATION_COVARIANCE_INCOMPLETE → UNSCORABLE.
- GEOMETRY_NUISANCE_DEGENERACY → NO_LOCAL_DISTINGUISHING_SIGNATURE.
- HOLDOUT_OVERLAP_OR_EXPOSURE → NOT_INDEPENDENT.
- HOLDOUT_TUNING_OR_POSTHOC_MAP_CHANGE → CALIBRATION_LEAKAGE / POSTHOC_RESCUE.
- HOLDOUT_OUTSIDE_THE_FROZEN_H(s)H_PREDICTIVE_SET → HOLDOUT_FAILURE.
- H(s)H AND STANDARD PREDICTIVE SETS OVERLAP WITHIN THE DECLARED UNCERTAINTY → NO_DISCRIMINATING_RESIDUAL.

A genuine H(s)H distinction requires a preregistered residual or set separation that survives source alternatives, fiber width, measurement/calibration covariance, nuisance response, model discrepancy, and the independence audit. A narrower-looking fitted curve is not enough.

## 4. What is presently forced, candidate, or undefined

This table applies the current BEDROCK/P3 source state; it does not fill missing geometry by analogy.

| Feature | Current status | Consequence |
|---|---|---|
| Interacting filament/worldline and moving 3D timesheet | Source commitments | Preserve the distinct objects and their interaction; do not collapse them into one readout |
| Finite-core / worldtube support | Source-level structural commitment | Finite support is part of the candidate object, but the cross-section profile, scale, support map, and metric/gluing conditions remain undefined |
| First-order coil scale ell_f | Directly distinguished from filament thickness in the later geometry clarification | Never substitute ell_f for intrinsic filament thickness or infer a core radius from it |
| Twist / rotational response | Active tentative Kelvin-vortex or justified-equivalent response candidate | Carry it as a falsifiable candidate; do not discard it, invent a constitutive law, or fit it freely |
| Contact surfaces and contact law | Not source-defined in the current map chain | Keep undefined until a source-grounded interaction/interface map and conditions are supplied |
| Separate medium ontology | Open | Do not introduce a latent medium merely to absorb residuals |
| Local/dual-shell projection and instrument readout | Incomplete | No physical prediction until the forward maps and composition are specified |

Thus: finite-core support is not an optional analogy, but a numerical thickness/profile is not yet source-forced; the twist/response candidate must remain in the test ledger but its law is unresolved; contact surfaces are not to be invented.

## 5. Existing formal evidence reused, not expanded

Kestrel PR #873, branch research/kestrel-original-slice-fidelity-20261028t0900z, contains FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean, blob 0fe5390faa10113830132b12cdb98172194adfee at PR head 1971e3d58a28f7c6de5cf024039dbcedb133121c.

Relevant existing theorems:

- hallway_factorization_iff_fiber_compatibility: a deterministic target map factors through an observation map exactly when the target is constant on each source-map fiber.
- nuisance_absorbable_iff_range_le: local geometric sensitivities are all absorbable exactly when the geometry Jacobian range is contained in the nuisance Jacobian range.
- exists_locally_separating_geometry_direction: failure of that range inclusion supplies a locally separating geometry direction.

Actual Actions evidence: run #42153410233, job #127681789766, Lean 4.34.0 / Lake 5.0.0; the root build completed successfully with 8,955 jobs. The checked-out merge commit was a2c3304, merging PR head 1971e3d into base c7dc2c483f50ae03fc7a7c530829170135e18d92. The PR's recorded current base is now 61cc8b65ffed70296e0121dbae067892a79c81d4, so this is MERGE_REF_BUILD_SUCCESS, not exact-head/current-base verification.

The theorem-specific log reports hallway_factorization_iff_fiber_compatibility with Classical.choice; nuisance_absorbable_iff_range_le and exists_locally_separating_geometry_direction with propext, Classical.choice, and Quot.sound. The captured module output contains no sorryAx report for these declarations. Tests, lint, nanoda, and the separate global axiom audit were skipped. The PR remains OPEN / DRAFT / UNMERGED.

Lean verifies only the formalized conditional statements. It does not validate the source translation, supply the missing physical maps/Jacobians, establish that a physical system satisfies the premises, or produce an observational prediction. No new theorem was necessary for this workflow integration; no data-free fixture or proof extension was created.

## 6. Cross-artifact source boundary

This note integrates, but does not replace, the following existing work:

- Kestrel, WORKSPACES/KESTREL/2026-11-01T1924Z_CROSS_DOMAIN_READOUT_ENVELOPE.md: type/history/support/calibration/information annotations.
- Aldus's issue #1405 and the readout-adjustment correction: calibration versus fitting/evaluation, plus input independence/overlap.
- Aster, WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aster-map-edge-source-authority-gate-20261107t1336z-s3-001.md: separate source-authority, map-specification, and empirical-readiness axes.
- Sable, issue #1466: P3 cross-sector coverage grid.
- Nadir, issue #1470: whole-study no-refit transferability gate.
- Mira, issue #1474: source-role audit showing that a historical “lossless BV push-forward” phrase is not authenticated Nathan Direct; correcting a differential-form convention does not prove lossless push-forward or physical information conservation.
- Kestrel PR #873: existing conditional fiber and nuisance-identifiability formalization.

The Mira example is especially important: source-attribution uncertainty is not measurement uncertainty. A standard mathematical correction can be correct under stated conventions without turning a mixed historical transcript into Nathan Direct or validating a physical information-conservation claim.

Mersearch preflight for this run found all four shared request lanes occupied with status requested; all 12 request-scoped manifest/receipt paths were absent. This note is therefore a bounded synthesis of existing repository artifacts, not an exhaustive three-archive source search and not a novelty claim.

## 7. Current limits and next admissible step

- P2 remains HOLD: no final measured system, raw dataset/version, complete calibration/covariance, or independent acquisition holdout is selected.
- P3 remains incomplete: no full source-typed map chain, cross-sector prediction, or independently reviewed full manuscript.
- No physical calculation, fit, H(s)H prediction, numerical falsification threshold, or independent measurement was performed.
- No SAT-O or Blockwave equation was copied, corrected, or promoted.
- No BEDROCK edit, paper-gate advancement, Factory Floor admission, or theory promotion occurred.

Next admissible step: after one real system is selected and its raw data/provenance/units/calibration/covariance/access package is complete, instantiate this ledger for that system. Derive the actual source-grounded map and Jacobians, compute the fiber envelope and nuisance-range test from the measured model, freeze calibration and an independent holdout, then compare with the standard baseline. Until then the correct status is PREDICTION_NOT_FORMED or UNSCORABLE, not a speculative numerical result.
