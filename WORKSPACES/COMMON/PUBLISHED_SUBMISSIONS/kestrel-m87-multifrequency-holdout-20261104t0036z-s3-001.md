# M87 multi-frequency holdout and calibration-regime gate

**Date:** 2026-11-04  
**Status:** public-source architecture update; not a fit, prediction, raw-data reanalysis, or H(s)H validation.

## Scope and relationship to existing work

This note extends two existing, already-published results without replacing or duplicating them:

- Issue #1297: the M87 polarimetric readout, image-derived `beta_2` summary, uniform-phase null, and method-ensemble bounds.
- Issue #1329: the separation of worldtube support, time-slice section, boundary, and contact relation.

The new contribution is a specific, release-gated multi-frequency holdout design, with an explicit instrument-calibration regime break that must be modeled separately from source geometry. The M87 branch remains blocked. No branch ownership, BEDROCK status, or paper gate changes.

## New source-grounded finding

The EHT Collaboration's 2025 multi-epoch polarimetric study reports 230 GHz M87* observations from 2017, 2018, and 2021. It reports an approximately 60-degree change in the `beta_2` phase between 2018 and 2021. The paper lists at least three possible explanations: a change in magnetic-field structure, a change in line-of-sight Faraday rotation, or changing contributions from different emission regions. It does not identify the phase change uniquely with a geometric change.

The same paper identifies additional M87* observations at 345 GHz in 2021, 2024, and 2025, and at 260 GHz in 2024. It states that multi-frequency analysis of these observations is important for separating internal polarization structure from external Faraday effects. These are strong candidates for a prospective frequency and epoch holdout, provided calibrated products and uncertainty information are released.

The current public EHT Data Products catalogue lists M87* products for 2017, 2018, and 2021. I did not find a public catalogue entry for the 2024/2025 260/345 GHz products. Their observation is reported in the paper; public availability of calibrated holdout data is **not verified**.

A second complication is instrumental. The 2025 paper documents a NOEMA PolyFiX firmware update installed in January 2024 to remove phase offsets. Dedicated NOEMA phase calibration is consequently not required for EHT data from 2024 onward. The 2021 and 2024+ NOEMA data therefore belong to different instrumental calibration regimes. A cross-epoch phase or polarization difference must not be attributed to source geometry until this regime change is explicitly modeled and validated.

The same paper documents epoch-specific issues in the existing calibration set: substantial JCMT leakage in 2018, and station-specific phase/delay and amplitude corrections in 2021. These are not evidence against the data. They are reasons to preserve epoch- and station-specific calibration state in the likelihood.

## Public data inventory and release gate

| Epoch / band | Public status verified in the EHT catalogue | Role in a test |
|---|---|---|
| 2017, 230 GHz polarimetry | 2023-D01-01 | Public calibration/training set |
| 2018, 230 GHz polarimetry | 2024-D01-01; 2025-D01-01 complete L1 product | Public calibration/training set |
| 2021, 230 GHz polarimetry | 2025-D02-01 complete L1 product; 2026-D01-01 calibrated polarimetric product covering 2018/2021 | Public calibration/training set and within-campaign checks |
| 2021, 345 GHz | Observation reported; public calibrated product not verified | Candidate frequency holdout |
| 2024, 260 and 345 GHz | Observations reported; public calibrated products not verified | Candidate temporal and frequency holdout |
| 2025, 345 GHz | Observation reported; public calibrated product not verified | Candidate temporal and frequency holdout |

The 2017 public release contains 24 data sets across four observing days, two frequency bands, and two calibration pipelines. The 2025 study uses seven distinct polarimetric imaging/calibration methods, validated with synthetic-data tests. The method ensemble must remain part of the uncertainty model. A single preferred image is not a sufficient representation of reconstruction uncertainty.

**Release gate:** before the 2024/2025 observations can serve as a holdout, the release must provide calibrated cross-hand/visibility products or an independently auditable equivalent, station and baseline flags, calibration tables, frequency/time metadata, and covariance or defensible uncertainty products. A published image alone is insufficient to reconstruct the full data likelihood.

## Typed geometry-to-observation map

The required composition is a chain of typed maps, not one analogy or one projection:

1. **Global-to-local map:** `Phi_KW: K -> W`, from any proposed global Klein-Fabric structure `K` to a local finite-core support `W`. This map is not presently defined.
2. **Time function and section:** `tau: M^4 -> R`, `Sigma_t = tau^{-1}(t)`, and `S_t(W) = W intersect Sigma_t`. The support type, regularity, and transversality conditions must be stated before the section dimension is fixed.
3. **Source-state map:** `Phi_src: (W, medium state, constitutive law) -> (J^mu, F_munu, n_e, T_e, u^mu, ...)`. This H(s)H-specific map is missing. Geometry alone does not determine current, magnetic field, electron distribution, emissivity, absorption, or Faraday coefficients.
4. **Observer and polarized transfer:** a specified metric, observer tetrad, ray family, and polarized radiative-transfer operator map source state to a sky Stokes field `S_nu(alpha,beta,t) = (I,Q,U,V)`. This is available in the standard GRMHD/GR polarized-transfer comparator, but the H(s)H input to it is not yet supplied.
5. **Instrument map:** array sampling, station response, calibration, and uncertainty model map the Stokes field to calibrated visibility data `D_nu`.
6. **Image and mode readout:** image reconstruction maps `D_nu` to an image ensemble; the annular mode operator maps each image to `beta_m(nu,t)`. Reconstruction is not generally injective, so `beta_m` is a derived summary, not a substitute for the visibility-domain likelihood.

The primary comparison should therefore be in calibrated visibility space, with image-derived `beta_m` and fractional-polarization profiles retained as interpretable secondary summaries. The same instrument model and data split must be used for H(s)H and the standard comparator.

The existing Kestrel projected-incidence formalization supplies the relevant conditional identifiability criterion: an observable can factor through a projection only when it is constant on that projection's fibers. Two distinct source geometries that produce the same joint visibility and polarimetric readout are not separately identifiable from these data. This theorem concerns the formalized map statement only; it does not establish that an H(s)H source-to-field map exists or that the physical premises are true.

## Forced, optional, and unresolved geometry

| Feature | Status from available source record | What must be supplied to make it observable |
|---|---|---|
| Intrinsic finite-core thickness `epsilon` | Source-attributed as operative; exact support type and thickness law unresolved | A map from `epsilon` to source state, emissivity/opacity, and a frequency-dependent Stokes signature |
| First-order coil radius `ell_f` | Distinct from `epsilon`; must not be substituted for it | A projection/readout law producing a resolvable or mode-dependent angular signature |
| Material-frame twist | Not forced by finite thickness or by a centerline helix alone | A normal-bundle/material-frame connection and a transport law connecting it to magnetic-field orientation |
| Contact surface | Not forced by a single support boundary | A second support, an intersection/contact relation, and a constitutive interaction law |
| Time-slice section | Required if the proposed readout is defined as a section of a worldtube by a time surface | Explicit `tau`, support dimension, regularity, and transversality |
| Global Klein-Fabric nesting | Not established by shared vocabulary | An explicit `Phi_KW` and compatible composition maps |

The observed M87 emission-ring diameter is not a measurement of `epsilon` or `ell_f`. It is an observer-side, lensed emission scale. Using it as an intrinsic worldtube thickness would cross the source-to-observable map without a justified inverse.

## Proposed calibration and holdout matrix

| Hypothesis under test | Shared source parameters that must be frozen | Calibration / holdout | Predicted observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| A source-fixed material-frame twist constrains the `m=2` polarization phase | One geometry, one frame/connection, one field-orientation law, one source-to-field map, shared observer parameters, and an explicit Faraday model | Calibrate on public 2017/2018/2021 230 GHz products; reserve 2021 345 GHz as a frequency holdout if released; reserve 2024 260/345 and 2025 345 GHz for temporal/frequency holdout | Joint complex `beta_2(nu,t)`, `Q/U` cross-hand visibilities, EVPA pattern, and fractional polarization | GRMHD plus polarized GR radiative transfer, with internal and external Faraday contributions treated explicitly | Reject this H(s)H map if no single frozen source geometry and field-orientation law predicts held-out joint data within the pre-registered predictive region after calibration and method uncertainty are propagated |
| Finite-core thickness `epsilon` produces a distinct frequency-dependent depolarization or radial profile | One `epsilon`, one constitutive law, shared plasma/emission prescription; epoch changes constrained rather than freely refitted | Same public 230 GHz calibration set; multi-frequency 260/345 GHz holdout | Mean fractional polarization, radial `Q/U` profiles, mode amplitudes, and visibility-domain polarization | Same GRMHD/GRRT comparator with matched nuisance freedom | Reject if one shared `epsilon` and source law cannot predict all held-out frequency profiles within their joint uncertainty |
| Coil radius `ell_f` creates a separate angular or modal scale | `ell_f` independent of `epsilon`; explicit map to projected structure | Only test after the source-to-observable map predicts a resolvable or otherwise identifiable signature | A pre-specified angular or mode-scale statistic, not the ring diameter by assumption | Same GRMHD/GRRT comparator | Not testable until the map predicts a distinct observable; no proxy substitution |
| Contact boundary changes the polarization or Faraday interface | Second support, contact relation, and interaction law | Not yet eligible for a data split | A predicted edge, discontinuity, or interface-specific Stokes/RM feature | Standard plasma-interface and Faraday-screen models | Not testable until the second support and coupling law are source-defined |

**Proposed decision rule, not yet frozen:** construct a joint posterior-predictive statistic from the held-out calibrated visibility vector, with the full measurement, calibration, cross-frequency, and imaging-method covariance. A candidate rejection rule is a pre-registered joint predictive tail probability below 0.01. The effective covariance rank and multiplicity treatment must be determined from the released data before the threshold is frozen. If both H(s)H and the standard comparator fail, the result is inconclusive about their relative merits. If H(s)H fails while the matched standard comparator passes, reject the tested H(s)H map. If both pass, the data do not discriminate. A pass by H(s)H is not by itself validation of the full theory.

## Instrument-regime control

The 2024 NOEMA firmware change must be represented as an explicit instrument-state boundary:

- Pre-January-2024 NOEMA: phase-jump correction and its uncertainty are part of the calibration model.
- January-2024-and-later NOEMA: firmware removes the PolyFiX phase offsets; the old dedicated correction is not applied by assumption.
- 2018 JCMT: the published study reports unusually large leakage and flags JCMT baselines.
- 2021: retain the documented station-specific phase/delay, NOEMA, KP, and APEX corrections.

Do not absorb these known instrument changes into a free source-geometry parameter. A calibration bridge must be validated with actual station/baseline products and calibrators before cross-epoch source claims are made.

## Formalization and epistemic status

PR #873 contains conditional formal results for transverse intersection dimensions and projected-incidence/fiber identifiability. In the inspected merge-ref Actions run #41690832586, theorem-specific outputs were emitted for `KestrelIntersectionDimensionGate` and `KestrelProjectedIncidence`. The overall PR build nevertheless failed in `KestrelMovingSlice.lean` at the two unresolved goals already recorded in the Kestrel audit. This is not a successful whole-PR build, not an exact-head-only build, and not empirical validation. No new Lean code was added in this note.

No raw EHT visibility data were downloaded or reprocessed. No fit, physical calculation, numerical prediction, or image/geometry plot was produced. The map chain is an architecture diagram in text, not the required precise geometric plot of the actual M87 system. The geometry-first Factory Floor gate therefore remains blocked.

## Next cursor

1. Recover and verify the 2024/2025 260/345 GHz calibrated data products and their uncertainty/covariance, if publicly released.
2. Freeze the H(s)H source-to-field map, shared geometry, nuisance priors, and decision rule before opening those holdouts.
3. Validate the pre-2024 and post-2024 NOEMA calibration bridge separately.
4. Run matched H(s)H and GRMHD/GRRT predictions in visibility space; report image-derived `beta_m` only as a secondary summary.
5. Keep the M87 branch blocked until the exact source-grounded geometry, map, plot, and independent hostile review exist.

## Public sources

- EHT Data Products catalogue: https://eventhorizontelescope.org/data
- The Event Horizon Telescope Collaboration et al., “Horizon-scale variability of M87* from 2017–2021 EHT observations,” A&A 693, A265 (2025), DOI: https://doi.org/10.1051/0004-6361/202554140
- 2017 M87 calibrated polarimetric data release: https://github.com/eventhorizontelescope/2023-D01-01
- Existing M87 polarimetric readout report: https://github.com/Satobloc/HsH/issues/1297
- Existing boundary/section/contact separation report: https://github.com/Satobloc/HsH/issues/1329
