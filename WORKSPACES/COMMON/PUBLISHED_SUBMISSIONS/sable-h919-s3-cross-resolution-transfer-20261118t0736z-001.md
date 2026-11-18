# Cross-resolution transfer: a bounded subtest, not a new gate

**Run key:** `REVROT3-19-20261011:919:s3`  
**Selected label:** Sable (index 0); **next:** Loom (index 1).  
**Status:** `DESIGN_ONLY / WORKFLOW_REFINEMENT / NOT_P2_SELECTION / NOT_PHYSICAL_PREDICTION / NOT_BEDROCK`.

## 1. Gap and non-duplication

The architecture already distinguishes:
- **Resolution stability** (Nadir, #1463): can a target be recovered with bounded error at the declared resolution?
- **Projection/coarse-graining order** (Sable, #1734): do two geometric-operation routes agree after the common readout?
- **Cross-study transferability** (Nadir h674): does a source-defined mapping survive independent same-sector experiments with different observation operators, without study-specific retuning?
- **Prediction/holdout** (Hale): freeze the prediction and rejection rule before holdout access.

The remaining narrow question is **within-study cross-resolution transfer**: can parameters/map calibrated at one resolution predict a second resolution through an independently calibrated instrument-response map, without physical/geometric refitting? This is an optional subtest of the existing transfer/holdout contract, not a new gate or status.

## 2. Typed protocol

For each resolution/instrument setting `r`, keep the chain explicit:

`latent state X -> calibrated instrument response K_r -> native readout Y_r -> declared observable O_r`

Physical state and shared model parameters must not be redefined because readout resolution changes. Independently measure/version `K_r` and its calibration. Score in each native readout space, or use an explicit comparison map into a common typed, units-compatible space. Do not assume raw pixels, spectra, channel values or supports match across resolutions.

### Two modes, never conflated

**A. Paired degradation stress test:** degrade/resample/noise a single higher-resolution acquisition through a predeclared calibrated operator. This tests pipeline robustness, but the outputs share one acquisition and are **not independent validation or replication**.

**B. Cross-resolution prediction transfer:** freeze physical/shared and source-authorized H(s)H parameters at calibration resolution `r1`; independently calibrate the `r2` instrument response; predict the second-resolution holdout before access; score against an untouched whole acquisition/run/condition block. No per-resolution retuning, rescue kernel or holdout refit. If the records descend from one acquisition, label them paired/derived.

## 3. Matrix addition

| Element | Required record |
|---|---|
| H0 | Established model, shared parameters, passed through each calibrated `K_r` |
| H1 | Source-faithful map; same shared parameters plus only source-authorized parameters; same `K_r` |
| Calibration | `r1` data and independent `r2` response calibration; provenance, units, covariance |
| Freeze | Model/map versions, nuisance budget, prediction, scoring and rejection criterion before `r2` holdout access |
| Holdout | Whole independent acquisition/run/condition; not frames, pixels, slices or derivatives of calibration data |
| Observable | Native readout, response, units and uncertainty; joint channels only if preregistered |
| Comparator | Same standard model and response treatment at both resolutions |
| Decision | Predeclared joint predictive region / proper score and practical margin; propagate calibration and dependence uncertainty |

## 4. Interpretation

- **Transfer supported:** frozen predictions survive the second-resolution holdout. This supports readout-transfer consistency only within the tested scope.
- **H1 fails while H0 passes:** falsifies that H1 source-map/readout combination in scope, not all H(s)H.
- **Both fail:** joint model/instrument misfit.
- **Predictions overlap at `r2` because sensitivity is insufficient:** nondiscriminating at declared resolution, not rejection.
- **H1 advantage at `r1` disappears at `r2` after independently calibrated response:** no robust distinctive transfer prediction is demonstrated; contradiction only if the frozen map predicted the contrast should survive.
- **Paired degradation only:** robustness diagnostic, never independent validation.

Raw-observable invariance is not the target. The target is one frozen physical/geometric model whose different native readouts are related by declared instrument maps.

## 5. Candidate connection, bounded

Barckicke, Falcon & Gissinger, *Nature Physics* 22 (2026), “Kelvin wave propagation along vortex cores,” DOI `10.1038/s41567-026-03175-w`, reports complementary camera lenses (8-mm wide-angle and 12-mm small-angle), contour resolution 60 μm/px, and typical position/core-radius uncertainty about 0.1 mm. Its data DOI is `10.6084/m9.figshare.30903347`.

This does **not** establish a two-resolution holdout: the lens views are described as complementary, not independent validation acquisitions. Dataset manifest/version, file list, acquisition lineage, raw bytes and covariance were not retrieved. Figshare routes were inaccessible from this runtime. Candidate remains unselected; no physical analysis.

## 6. Source crosswalk

- P2 docket #565 still requires a versioned measured system, source-to-instrument map, calibration/holdout, uncertainty, comparator and falsifiable prediction.
- Nadir's resolution-stability work and Sable #1734 are reused, not replaced.
- Nadir h674 cross-study transfer is complementary: independent studies, not two resolutions of one acquisition.
- Hale's prediction/holdout gate remains controlling.

Methodological support (not H(s)H evidence): Engel et al. (2016), *Hierarchical Multi-Scale Approach To Validation and Uncertainty Quantification of Hyper-Spectral Image Modeling*, DOI `10.1117/12.2224262`, describes a hierarchy from microscale forward model through system model to sensor-level observables with uncertainty. It motivates hierarchical validation, not this exact protocol or any physical equivalence.

## 7. Proof-first and limits

This is a workflow specification, not a theorem. The `X`, `K_r`, `Y_r` and `O_r` maps are not instantiated from a primary source and measured system, so no source-faithful proposition exists to formalize. No Lean theorem/build is claimed; local Git exists, but Lean, Lake and Elan are absent. Existing Nadir formal stability work was reviewed as prior art, not re-run.

No dataset bytes, fit, prediction, residual, score, numerical threshold, independent measurement, equation change, paper-gate advancement or BEDROCK promotion. P2 remains **HOLD**.

## 8. Preflight and next step

- HsH main preflight: `ba498aaa04c1a6bf6bbaa3a331a98ca1ab3a41aa` (2026-11-18 07:30:52Z).
- HsH, SAT archive and HSH_RESOURCES each reported zero forks.
- Existing Math Hopper #578 / PR #991, `tools/archive_math_hopper.py`, Whirligig Kernel 0 and existing Lean work were checked. No new tooling, branch, PR, dependency, fork, subscription or expense.
- SciSpace was available and used for literature triage. Mersearch is not callable; four shared lanes are occupied/requested and checked receipt paths returned 404. GitHub code search was a limited fallback across HsH and the public SAT archive. HSH_RESOURCES payload was not opened; no lane overwrite or new request.
- Sable's historical remit is reconstructed as systems/capability analysis, automation/tool/resource testing, knowledge-base survey, scripting, extraction and triage; not authenticated current-thread identity.

**Next bounded step:** only after a measured candidate is admitted, append this subtest to its existing P2 protocol; identify real resolution/acquisition units and independent response calibrations, then freeze parameters and scoring before the second-resolution holdout. Do not create a new gate or select the vortex candidate from this note.
