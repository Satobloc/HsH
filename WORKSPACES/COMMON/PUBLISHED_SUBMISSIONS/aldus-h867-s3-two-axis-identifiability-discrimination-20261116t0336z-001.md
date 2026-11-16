# Two-axis identifiability and model-discrimination contract

**Status:** public-safe workflow architecture / source-conditioned proposal.  
**Scope:** additive clarification to HsH issues [#1301](https://github.com/Satobloc/HsH/issues/1301), [#1385](https://github.com/Satobloc/HsH/issues/1385), and the existing paired-comparison freeze [#1735](https://github.com/Satobloc/HsH/issues/1735). It does not replace those contracts, select a P2 system, or promote a theory claim.

## 1. The ambiguity to remove

The existing `UNIDENTIFIABLE` label can be read as covering several different failures:

- exact non-injectivity of a source-to-observable map;
- first-order geometry changes absorbed by nuisance directions;
- a structurally separating effect too small for the actual data and instrument;
- two competing models whose predictive outputs cannot be distinguished at the declared resolution.

These are not interchangeable. They imply different remedies. In particular, parameter identifiability *within* H1 is not the same question as predictive discrimination *between* H0 and H1.

## 2. Keep two evidence axes separate

### Axis A: identifiability inside a model

This axis asks whether the model's admissible states or parameters can be recovered from its declared observation map.

| State | Meaning | Appropriate next action |
|---|---|---|
| `MAP_INCOMPLETE` | A source-to-observable arrow, domain, codomain, condition, or composition is missing. No prediction has been formed. | Recover or define the source-authorized map; do not score. |
| `STRUCTURAL_NONIDENTIFIABILITY` | Distinct admissible states lie in the same exact observation fiber while implying different target values. This is a property of the map/domain, not of measurement precision. | Add a genuinely separating channel or a source-justified restriction. More precise measurements of the same collapsed map do not repair the missing distinction. |
| `LOCAL_RANK_DEFICIENT` | At a stated reference point, the linearized geometry response is contained in the nuisance-response range. This is a first-order local result, not a global injectivity result. | Change the measurement/experimental condition so a geometry direction survives the nuisance quotient; examine higher-order effects only when the source model warrants them. |
| `PRACTICAL_UNIDENTIFIABILITY` | Structural/local separation exists, but the actual finite dataset, noise, calibration, sampling, or covariance does not resolve it adequately. | Improve data quality, sampling, calibration, or an independent readout; quantify with the actual likelihood/profile and uncertainty model. |
| `IDENTIFIABLE_AT_DECLARED_SCOPE` | The stated domain, gauge/quotient convention, observation map, and data support the claimed parameter/state recovery at the declared scope. | Carry the scope and assumptions forward; do not generalize beyond them. |

Global, local, and practical claims must name their domain and assumptions. A full-rank local sensitivity test is not a proof of global injectivity. A profile-likelihood interval is not a proof that the underlying map is structurally one-to-one.

### Axis B: discrimination between H0 and H1

This axis asks whether the frozen H(s)H model and the matched standard comparator make different, testable predictions for the same observations.

| State | Meaning | Permitted interpretation |
|---|---|---|
| `PREDICTION_NOT_FORMED` | H1 has no source-authorized, composed forward map to the measured observable. | No model comparison is available. |
| `UNSCORABLE` | Required raw data, acquisition lineage, calibration, covariance, or holdout access is missing or unverified. | No pass/fail score. |
| `NONDISCRIMINATING_AT_DECLARED_RESOLUTION` | H0 and H1 predictions overlap under the specified observation operator and uncertainty model. | No discrimination at this resolution; this does not establish exact model equivalence. |
| `CALIBRATION_ONLY_SEPARATION` | The models separate on calibration/training data, but no untouched holdout has tested the frozen predictions. | Candidate separation only, not independent predictive evidence. |
| `HOLDOUT_DISCRIMINATED` | A predeclared, genuinely held-out observation separates the frozen predictive distributions under the common decision rule. | Evidence about these exact model versions, domain, observable, and holdout only. |
| `H1_REJECTED` / `H0_REJECTED` | One frozen model fails the predeclared predictive criterion while the matched comparator does not. | Reject only the tested model/version/domain; do not generalize to every H(s)H construction or every standard model. |
| `JOINT_MISFIT` | Both models fail the declared test. | The comparison is inconclusive about a relative winner; inspect shared data, calibration, covariance, and model misspecification. |

An internally identifiable H1 can still be nondiscriminating from H0 at a particular instrument resolution. Conversely, some H1 parameters may be internally nonidentifiable while H1 still predicts an observable feature that H0 cannot reproduce. Do not collapse these cases into one `UNIDENTIFIABLE` status.

## 3. Non-implications that must remain explicit

1. Structural identifiability does not imply practical identifiability.
2. A local separating direction does not imply statistical detectability at the available noise level.
3. H1 parameter identifiability does not imply H0/H1 model discrimination.
4. A calibration fit does not imply a held-out prediction.
5. Failure to detect a difference does not establish exact equivalence.
6. A converged optimizer does not establish identifiability.
7. A model that passes while the comparator fails is comparative evidence about those frozen implementations, not proof that H(s)H is true.
8. If two predictive distributions are exactly the same over the admissible observation space, that observation channel contains no discriminating information; a different channel, condition, or source-authorized restriction is needed.

## 4. Covariance and threshold discipline

After the map and local sensitivity questions are stated, practical discrimination must use the actual calibrated uncertainty model. For a valid positive-definite covariance matrix, a covariance-weighted prediction difference may be summarized by a Mahalanobis form, `d^2 = Delta_mu^T Sigma^{-1} Delta_mu`, or by a fully specified likelihood/predictive comparison. This expression is a method definition here; no value has been calculated.

Do not assume unreported channel correlations are zero. If covariance is singular, incomplete, or defined only on a lower-dimensional support, do not blindly invert it or replace it with a diagonal approximation. Specify the support/rank treatment and decision calibration before scoring. Correlated channels, frames, spatial slices, processing variants, or files are not automatically independent replications.

For non-nested or non-regular model comparisons, do not assume a standard likelihood-ratio reference distribution without checking its conditions. The null calibration and multiplicity treatment belong in the frozen decision rule.

## 5. Real-system test matrix: current evidence is candidate-only

The rows below use published measurements and existing HsH source-readiness records. They are not new analyses, fits, predictions, or independent measurements.

| Candidate and source-reported measurement | H0 standard comparator | H1 requirement | Shared parameters and calibration | Calibration / holdout design | Predicted observable | Falsification threshold |
|---|---|---|---|---|---|---|
| M87* EHT polarimetry. Existing source inventory distinguishes 2017/2018/2021 at 230 GHz, 2021 at 345 GHz, and 2024/2025 multi-frequency candidates. | Matched GRMHD plus general-relativistic polarized radiative transfer and relevant Faraday contributions, with detector/station calibration. | A source-authorized H(s)H geometry-to-emission-to-visibility/readout map; this remains incomplete. | Same source parameters, instrument response, station/baseline calibration, nuisance freedom, visibility products, and joint covariance for both models. | Freeze a calibration split before holdout access. Treat 2021 345 GHz as frequency generalization only unless an independent temporal acquisition is demonstrated. Treat 2024/2025 as temporal-plus-frequency candidates only after the instrument-regime bridge and calibrated products are verified. | Primarily calibrated complex visibility and cross-hand/polarimetric data; image-derived summaries are secondary. | A preregistered covariance-aware predictive region with effective rank and multiplicity treatment. No numeric threshold is frozen because the complete covariance/holdout package and H1 map are not available. |
| Barckicke et al. 2026 air-water Kelvin-wave vortex. The paper reports 60 micrometres per pixel, 0.5 mm contour width, typical core-radius/position uncertainty about 0.1 mm, PIV circulation uncertainty about 0.005 m^2/s, and PTV vertical-velocity uncertainty about 0.05 m/s. Data DOI: [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). | The paper's hollow-core Kelvin limit and Rankine-core model with uniform vertical flow, plus its reported Phillips comparison. | A source-authorized H(s)H map from the declared carrier/support through contour/PIV/PTV operators; this remains incomplete. | Same run-specific a0, circulation Gamma, vertical velocity vz, forcing, camera/view calibration, PIV/PTV calibration, and paired contour covariance. | Freeze on identified runs/forcing conditions; hold out a distinct acquisition or forcing condition. Frames from one trajectory are not independent units. | Joint paired eta(z,t) and a(z,t) spectra with PIV circulation and PTV vertical velocity, using the actual paired covariance. | A preregistered joint held-out residual outside the covariance-aware predictive envelope. Raw Figshare bytes/version, acquisition IDs, and paired contour covariance remain unretrieved; no threshold is set. |

Both candidates currently remain `MAP_INCOMPLETE` for H1 and `UNSCORABLE` for a full H0/H1 comparison. Their published standard measurements do not supply a missing H(s)H forward map. No physical calculation, fit, prediction, or falsification score is claimed.

## 6. Integration with the existing P2 contract

Keep the existing non-compensatory P2 admission structure unchanged. Add typed subrecords rather than a competing gate:

- Within the existing map/identifiability leg, record `map_status`, `global_structural_status`, `local_rank_status`, `practical_status`, the declared domain/gauge, and the exact observation-map version.
- Within the existing paired-freeze/held-out leg, record `H0_id`, `H1_id`, common observation operator, shared parameters, covariance identity/rank, calibration and holdout IDs, holdout-access audit, decision rule, and model-discrimination outcome.
- Every subrecord carries the same immutable candidate and comparison-freeze identities. A change to the map, dataset, calibration, covariance, split, analysis code, or decision rule creates a new freeze; prior evidence remains historical.

This refines the existing E-D-F-R architecture without changing ownership, candidate status, or the P2 exit criteria.

## 7. Formalization boundary

Existing PR [#873](https://github.com/Satobloc/HsH/pull/873) contains conditional fiber/projection and local nuisance-range separation work, including `KestrelProjectedIncidence.lean`. Its exact-head Actions build is branch-scoped and does not establish current-main integration, source-to-laboratory translation, or physical truth. The new distinction here is a typed evidence/workflow contract, not a new geometric theorem. The practical/statistical leg cannot be scored or responsibly formalized as a candidate-specific result without the actual likelihood, covariance, data, and source-defined observation map.

Lean checks only the formalized statement and assumptions. It does not validate the translation into H(s)H or the physical premises.

## 8. Method references, not H(s)H premises

- Raue et al. (2009), *Structural and practical identifiability analysis of partially observed dynamical models by exploiting the profile likelihood*, Bioinformatics 25(15), 1923-1929. [DOI: 10.1093/bioinformatics/btp358](https://doi.org/10.1093/bioinformatics/btp358).
- Villaverde et al. (2024), *Observability rank conditions for analysing practical identifiability of nonlinear dynamic models*, PLoS Computational Biology 20(1), e1011913. [DOI: 10.1371/journal.pcbi.1011913](https://doi.org/10.1371/journal.pcbi.1011913).
- Algeri et al. (2016), *A method for comparing non-nested models with application to astrophysical searches for new physics*, MNRAS Letters 458, L84-L88. [DOI: 10.1093/mnrasl/slw025](https://doi.org/10.1093/mnrasl/slw025).
- Koch (2021), *Robust test statistics for data sets with missing correlation information*, Physical Review D 104, 076018. [DOI: 10.1103/PhysRevD.104.076018](https://doi.org/10.1103/PhysRevD.104.076018).

These references supply methodological comparisons only. They do not supply H(s)H ontology, geometry, parameters, or evidence.

## 9. Epistemic status and next action

This is an additive architecture proposal for making failure diagnosable. It is not a new physical mechanism, a P2 system selection, an empirical result, a Lean-proved new theorem, or a BEDROCK amendment.

The next admissible step is to complete one candidate's source-authorized observation map and retrieve its real acquisition/calibration/covariance package. Only then can the structural, local, practical, and H0/H1 discrimination states be populated from evidence rather than labels.
