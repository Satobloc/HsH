# 3D bubble–vortex-ring interaction: candidate-only readout and holdout gate

**Status: CANDIDATE ONLY.** This note does not select a P2 system, assert an H(s)H prediction, validate SAT/H(s)H, or advance a manuscript gate. It records a source-grounded experimental candidate and a stricter way to test it without confusing fitted parameters, projected readouts, or non-independent runs.

## 1. Primary source and measured system

Cecilia Estepa-Cantero, Manuel Lorite-Díez, Javier Ruiz-Rus, Sébastien Cazin, Rocío Bolaños-Jiménez, Patricia Ern, and Carlos Martínez-Bazán, “Three-dimensional experimental investigation of the interaction between a rising bubble and a vortex ring,” *Journal of Fluid Mechanics* 1045 (25 October 2026), A27. Published online 16 October 2026. DOI: https://doi.org/10.1017/jfm.2026.12078. Preprint: https://arxiv.org/abs/2606.08193.

The experiment studies a rising bubble meeting a descending vortex ring in counterflow. The authors combine time-resolved three-dimensional Lagrangian particle tracking (4D-LPT) with shadowgraphy/tomographic bubble reconstruction. They report three representative outcomes: weak interaction; capture, drag and release; and binary bubble breakup.

## 2. What is actually available

The publisher lists supplementary movie 1 as a volumetric bubble reconstruction and movies 2–4 as raw images from six cameras for Cases I–III, captured at 1496 Hz:

- Case I raw images: https://doi.org/10.1017/jfm.2026.12078.sm002 (43.8 MB).
- Case II raw images: https://doi.org/10.1017/jfm.2026.12078.sm003 (37.7 MB).
- Case III raw images: https://doi.org/10.1017/jfm.2026.12078.sm004 (44.9 MB).
- Volumetric reconstruction: https://doi.org/10.1017/jfm.2026.12078.sm001 (165.9 KB).

The paper states that supporting data are available upon reasonable request. The inspected public record therefore supplies useful raw camera movies, but not a verified deposit of the full 4D-LPT trajectories, per-experiment calibration coefficients/target images, complete acquisition/run IDs, or a joint covariance package. No movie, trajectory file, calibration file, or raw-data package was downloaded or analyzed for this note.

Published methods report four frontal cameras for the liquid 4D-LPT/Shake-The-Box reconstruction and six cameras for bubble tomography using MLOS. Calibration used 11 target positions separated by 10 mm, with per-experiment volumetric self-calibration and an image scale of 17.91 px/mm. The reconstruction produced roughly 80,000–100,000 tracks per experiment and a typical Eulerian grid resolution of 0.7–1 mm. Reported velocity uncertainty ranges from below 2% in high-displacement vortex-core regions to a conservative 10% in the far field; reported errors in flow-related parameters and bubble size are below 3% and 1%, respectively.

## 3. A crucial holdout constraint: the transition is stochastic

The three cases are representative and illustrative selections made after numerous preliminary experiments, not a published replicated factorial design. The paper explicitly places them in a transition region where breakup is not deterministic: experiments with approximately the same Weber number and the same vortex-to-bubble and core-to-ring size ratios can still yield different outcomes (breakup versus trapping).

Consequently:
- Case I, II and III are not three independent training/holdout units.
- Adjacent frames from one movie are not independent acquisitions.
- A single deterministic breakup label is not an adequate target in the transition region.
- A valid test needs independent experimental runs at matched conditions and must predict a conditional outcome distribution, not merely reproduce one selected movie.

The paper's Table 1 gives the following published Case II → Case III changes:

| Quantity | Case II | Case III | Descriptive change |
|---|---:|---:|---:|
| Reynolds number, Re | 14,600 | 11,800 | −19.2% |
| Weber number, We | 1.00 | 0.77 | −23.0% |
| Core ratio, a₀/R₀ | 0.38 | 0.28 | −26.3% |
| Core/bubble ratio, a₀/Rb | 1.71 | 1.18 | −31.0% |
| Ring/bubble ratio, R₀/Rb | 4.5 | 4.2 | −6.7% |

These percentages are descriptive arithmetic on the published case values, not a new physical fit, causal estimate, or independent measurement. Several parameters change together. The case comparison therefore does not isolate a unique core-thickness effect, even though the authors interpret the thinner Case III core and its concentrated strain as important to breakup. The paper also notes that unmeasured initial relative position can contribute.

## 4. The measurement hierarchy is part of the test

The source defines a concrete chain:

1. Six-camera raw image sequences.
2. Four-frontal-camera 4D-LPT reconstruction of three-dimensional liquid particle tracks and velocity fields.
3. Six-camera MLOS reconstruction of the bubble surface and volume.
4. Vortex identification and extraction of core position/size, circulation, kinetic energy and enstrophy.
5. Three-dimensional volumetric quantities and azimuthal planar reductions.

The authors divide the reconstructed volume into 80 azimuthal divisions containing both cores, giving 160 half-planes for local analysis. They explicitly warn that a fixed 2D-PIV plane can miss out-of-plane motion, loss of axial symmetry and localized bubble effects. A 2D summary is therefore not automatically a sufficient statistic for the 3D readout.

The existing generic factorization criterion is directly relevant: for a projection P from a fine state to a coarse state, a deterministic target O factors through P if and only if O is constant on every fibre of P. In this application, a proposed 3D target can be reconstructed from a 2D summary only if it is constant across all 3D states that the summary collapses together. This criterion is formalized in the existing Nadir PR #1189 module; its exact-head Lean 4.34.0 build succeeded on head 536cfb8f30ae8bae8c3f9d729eb964216b7f4e4f. That formal result checks the abstract map statement only. It does not prove that a particular experimental observable is or is not preserved by this paper's 3D-to-2D reduction.

## 5. Conditional SAT/H(s)H comparison architecture

The candidate is a standard-fluid experiment, not an established H(s)H analogue. The following distinctions must remain explicit:

- The measured fluid vortex-core radius a₀ is not H(s)H worldtube thickness ε unless a source-grounded map identifies them.
- Azimuthal vorticity/circulation is not automatically the discrete H(s)H twist sector τ.
- The measured bubble interface is not automatically a distinct H(s)H contact surface.
- Water is the experimental liquid medium; it is not automatically the provisional H(s)H responsive medium.
- Laboratory time stamps are not a measured timesheet or global H(s)H foliation.

A usable comparison needs an explicit map from the H(s)H worldtube/timesheet/medium variables to the same measured liquid velocity/vorticity field and bubble-surface readout. No such system-specific map is currently supplied, so no H(s)H prediction is yet available.

| Model | Shared measured inputs | Calibration and holdout | Target observable | Comparator | Current falsification status |
|---|---|---|---|---|---|
| H0: standard fluid baseline | Fluid properties, Re, We, Bo, Ga, Fr, ring/bubble dimensions, initial position and velocity | Same camera calibration and reconstruction pipeline; hold out complete independent runs | 3D velocity/vorticity, core geometry, bubble surface/trajectory, breakup probability | Frozen conventional fluid-mechanics model with the same initial/boundary conditions and instrument operator | Not yet executable; exact solver/closures and raw run data must be frozen |
| H1: minimal H(s)H representation | Same shared inputs; no new free fit parameters | Same run-level split and readout | Same full 3D fields and bubble observables | H0 | Not evaluable until the geometry-to-fluid and fluid-to-instrument maps are explicit |
| H2: H(s)H plus local twist | Same as H1; twist law and units must be source-derived | Same holdout; test sensitivity against shared/nuisance parameters | Predeclared azimuthal/local 3D residual or outcome-distribution change | H0 and H1 | Optional, not forced; no local τ field or constitutive law supplied |
| H3: H(s)H plus contact law | Same as H1; contact surface/law must be independently defined | Same holdout; no per-channel retuning | Bubble-interface deformation, capture/release and breakup distribution | H0 and H1 | Optional, not forced; the measured bubble interface alone does not establish an H(s)H contact surface |

## 6. Holdout, identifiability and falsification rule

The calibration/holdout unit must be an independently acquired experimental run, with run IDs and acquisition metadata. Do not split adjacent frames or spatial cells from the same movie and call them independent. Because the transition regime is stochastic, freeze a predictive distribution for both continuous observables and categorical outcomes (capture/release/breakup) before exposing the holdout.

An extra H(s)H parameter is testable only if its effect on the predicted readout is not absorbed by changes in shared parameters, nuisance parameters or calibration. Once a forward model exists, evaluate the extra-parameter sensitivity direction against the span of the shared/nuisance sensitivity columns. No Jacobian or parameter-identifiability calculation is possible yet because the H(s)H forward map and raw run data are absent.

A prospective continuous-observable rejection statistic is the covariance-aware quadratic residual Q = rᵀΣ⁻¹r, compared with a preregistered χ² quantile for the effective independent observable dimension. Breakup outcomes require a calibrated probability model scored on independent runs. The significance level, degrees of freedom, covariance and required replicate count must be frozen after the complete data and power analysis are recovered; no numerical threshold is defensible from the published marginal uncertainty statements alone.

## 7. Disposition and next data gate

**CANDIDATE ONLY / NOT A P2 SYSTEM SELECTION / NO H(s)H PREDICTION / NO FIT / NO PHYSICAL VALIDATION.**

Before any calculation or blind test, obtain and hash the full 4D-LPT track files, per-experiment calibration coefficients and target images, raw camera metadata, acquisition/run IDs, complete parameter records and joint covariance. Verify independent replicate counts in the transition region. Then freeze (i) the conventional forward model and observation operator, (ii) the source-grounded H(s)H maps and forced/optional parameter list, and (iii) a run-level holdout and falsification protocol before fitting.

This candidate profile is linked to the open P2 docket, issue #565. It does not change the P2 HOLD status or advance the November 30 paper gate.

### Sources

- Publisher article and publication metadata: https://doi.org/10.1017/jfm.2026.12078
- Publisher supplementary material: https://doi.org/10.1017/jfm.2026.12078.sm001 through sm007
- Preprint: https://arxiv.org/abs/2606.08193
- Existing formal factorization substrate: https://github.com/Satobloc/HsH/pull/1189
- P2 docket: https://github.com/Satobloc/HsH/issues/565
