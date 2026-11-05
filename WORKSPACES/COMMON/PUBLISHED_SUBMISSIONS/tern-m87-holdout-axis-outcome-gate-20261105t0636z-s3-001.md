# M87 holdout-axis and comparator-outcome gate

**Date:** 2026-11-05  
**Status:** Public-safe workflow/decision-architecture addendum. No new measurement, raw-data reanalysis, physical calculation, fit, H(s)H prediction, P2 system selection, or theory promotion.

## Scope and provenance

This addendum extends, without replacing or duplicating:

- HsH issue #1297: M87* polarimetric mode readout and finite-pixel uniform-phase null.
- HsH issue #1301: joint-readout identifiability and map-closure gate.
- HsH issue #1345: composition of claim/source lineage with acquisition, instrument, analysis, and holdout independence.
- Existing report `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-m87-multifrequency-holdout-20261104t0036z-s3-001.md`, main-branch blob `95dd234e2d1493b2886588e8092d0413e9a67bb5`.

P2 remains on HOLD with no final system selected. `WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03` remains blocked. This addendum changes neither branch status nor ownership.

## 1. Complete the comparator outcome matrix

The existing M87 note proposes a covariance-aware joint posterior-predictive comparison and specifies three outcomes, but omits the fourth logically possible case. The complete table is:

| Frozen H(s)H map | Matched standard comparator | Permitted interpretation | Not permitted |
|---|---|---|---|
| PASS | PASS | `NONDISCRIMINATING_WITHIN_TESTED_REGION`: both survive at the declared resolution. | Equivalence, full-theory validation, or proof of identical predictions. |
| FAIL | PASS | `TESTED_HSH_MAP_REJECTED`: reject this frozen map/parameterization for this system and observable, under its declared assumptions and data split. | Automatic rejection of every H(s)H construction or sector. |
| PASS | FAIL | `COMPARATOR_DISFAVORED`: evidence against this exact comparator under the matched test. H(s)H is not thereby validated. | Claiming H(s)H is true or uniquely correct because one comparator failed. |
| FAIL | FAIL | `JOINT_MISFIT_INCONCLUSIVE`: both models are inadequate under the declared test; inspect shared data, calibration, covariance, and model misspecification. | Declaring a relative winner from two rejected models without a separately preregistered comparison rule. |

`PASS` means only “not rejected by the predeclared predictive criterion”; it is not proof. `FAIL` means rejection by that criterion. If either model cannot be scored, do not enter the 2×2 table.

The omitted `H(s)H PASS / comparator FAIL` case is especially important. A standard model may fail because that implementation, nuisance treatment, or model family is inadequate. H(s)H success would then be comparative evidence only if its map and parameters were frozen, the comparator was competently calibrated, both used the same observations and measurement model, and the result survived preregistered comparator alternatives and a genuinely separate replication. Even then, the result concerns only the tested H(s)H map and domain, not the full theory.

## 2. Eligibility states before scoring

Enter the outcome matrix only after these separate gates pass:

1. `MAP_INCOMPLETE / PREDICTION_NOT_FORMED`: the source-grounded composition to the measured observable has an undefined arrow, domain, codomain, condition, or composition order. Do not score a prediction that has not been formed.
2. `UNIDENTIFIABLE`: distinct admissible source states share an observational fiber while implying different target values, or the claimed feature is absorbed by shared/nuisance directions. A converged fit does not cure this.
3. `UNSCORABLE`: calibrated holdout, acquisition lineage, instrument/calibration records, or uncertainty/covariance is unavailable or unverified. A published image is not a substitute for the visibility-domain likelihood.
4. `ELIGIBLE_FOR_PREDECLARED_COMPARISON`: source map, admissible domain, calibration/holdout split, instrument response, covariance, shared nuisance parameters, and scoring rule are frozen before holdout access.

These are workflow statuses, not physical findings. Kestrel PR #873 contains the conditional theorem that a target factors through a projection exactly when it is constant on each fiber. It does not establish that the H(s)H physical map exists. The latest Tern receipt records a relevant module build on a PR merge reference with theorem-specific `[Classical.choice]`, while the overall PR build failed in separate `KestrelMovingSlice.lean` goals at lines 114 and 125. This is not exact-head-only or clean whole-PR verification; the classical existence result is not an executable decoder.

## 3. Keep the M87 holdout axes separate

The existing source-grounded inventory supports three distinct questions:

| Candidate data | Legitimate candidate role | What the label does not establish |
|---|---|---|
| 2017/2018/2021, 230 GHz | Calibration/training and within-campaign checks, subject to a frozen split. | Multiple files, imaging methods, calibration pipelines, or epochs do not automatically establish independent replication. Record acquisition/event clusters, instrument/calibration IDs, analysis lineage, and covariance. |
| 2021, 345 GHz | Candidate **frequency-generalization** holdout. | It is not a temporal holdout merely because it is a different band: its nominal epoch overlaps the 2021 230-GHz training set. Exact acquisition-cluster and calibration independence remain unknown. |
| 2024, 260/345 GHz and 2025, 345 GHz | Candidate **temporal-plus-frequency** holdout, if calibrated products are released and lineage is verified. | Public calibrated visibility/cross-hand products and full uncertainty products were not verified in the existing audit. A reported observation or published image is not an accessible holdout dataset. |

The January 2024 NOEMA PolyFiX firmware change is a separate **instrument-regime boundary**. Pre-2024 and 2024+ observations cannot be treated as one source-only time series until the distinct calibration states and a calibration bridge are modeled and validated. A cross-regime holdout tests both source generalization and instrument-model robustness.

Record these axes separately:

- `frequency_generalization`
- `temporal_generalization`
- `instrument_regime_generalization`

For each, attach the existing claim-scoped evidence: raw acquisition/event IDs, instrument/calibration IDs, analysis/pipeline/prior IDs, uncertainty/covariance identity, calibration and holdout dataset IDs, and a timestamped holdout-access audit. Unknown remains `UNKNOWN`, not `INDEPENDENT`.

## 4. Matched-comparator and falsification contract

Before holdout access:

- Freeze the source-derived H(s)H geometry-to-source-state and source-to-observable maps, shared parameters, and H(s)H-only parameters. H(s)H-only parameters must be source-constrained, not tuned against the holdout.
- Use the same calibrated observations, instrument response, split, and uncertainty treatment for both models.
- Specify a competent standard comparator, including GRMHD, synchrotron polarized transfer, and relevant internal/external or spatially structured Faraday contributions.
- Record nuisance parameters and allowed calibration freedom. No hidden per-epoch retuning or unreported complexity advantage.
- Score primarily in calibrated visibility space with joint measurement, calibration, cross-frequency, and method covariance. Image-derived `beta_m` and fractional-polarization profiles remain secondary summaries.
- Pre-register a common predictive rule, effective covariance rank, and multiplicity treatment. The previously suggested joint predictive tail probability `< 0.01` remains a **candidate only**, not a frozen threshold; its validity cannot be assessed until the released covariance and effective rank are known.

A defensible rejection of the tested H(s)H map requires a fully specified map, parameters frozen before holdout access, a genuinely independent holdout for the stated generalization claim, and H(s)H failure while the matched comparator passes. If both fail, report joint misfit. If H(s)H alone passes, report comparator-relative evidence only and test alternative standard models before any stronger claim.

## 5. Geometry status is unchanged

- A time-slice section is required if the observable is defined by slicing a worldtube; then the time function, support type, regularity, and transversality conditions must be specified.
- Intrinsic finite-core thickness `epsilon` is source-attributed as operative, but its support type and thickness law remain unresolved. It is not measured by the lensed emission-ring diameter.
- First-order coil scale `ell_f` remains distinct from `epsilon`; no proxy substitution.
- Separate material-frame/normal-bundle twist is not forced by finite thickness or a centerline helix; it needs a source-defined frame/connection and transport law.
- A contact surface is not forced by one support boundary; it needs a second support, contact relation, and constitutive interaction law.
- Global Klein-Fabric nesting still needs an explicit global-to-local map and compatible composition maps. Shared vocabulary is not a map.

Thickness, twist, and contact must not become free parameters used to rescue a failed fit. A feature becomes testable only when source and forward map force a distinct, identifiable observable.

## 6. Formalization and evidence boundary

The finite outcome table is an operational classification, not a new physical theorem. No new Lean code or data-free proof was run. A formalization of the finite status function remains `BLOCKED_PENDING_NATHAN_PERMISSION`. Existing PR #873 is reused only for its conditional projection/fiber mathematics, with merge-reference and whole-PR failure limits preserved.

No new EHT source retrieval, Mersearch run, raw UVFITS download, covariance reconstruction, physical calculation, fit, held-out prediction, geometry plot, or Factory Floor admission occurred. Source and calibration facts above are inherited from the existing Kestrel M87 report, not newly measured here.

## Next cursor

1. Keep P2 on HOLD and M87 blocked; do not select a system or change branch ownership.
2. If M87 remains a candidate, obtain calibrated visibility/cross-hand products, station/baseline flags, calibration tables, covariance, and stable acquisition/event IDs.
3. Treat 2021 345 GHz as frequency holdout only unless a separate temporal acquisition cluster is demonstrated.
4. Treat 2024/2025 as cross-regime candidates until calibrated release and the post-January-2024 NOEMA bridge are verified.
5. Freeze maps, parameters, matched comparator, and covariance-aware decision rule before holdout access.
6. Enter the 2×2 table only after eligibility gates pass; preserve `PREDICTION_NOT_FORMED`, `UNIDENTIFIABLE`, and `UNSCORABLE` as distinct non-score outcomes.

**Epistemic status:** workflow architecture / source-conditioned proposal. Not a new H(s)H physical prediction, empirical result, Lean-proved theorem, or BEDROCK change.
