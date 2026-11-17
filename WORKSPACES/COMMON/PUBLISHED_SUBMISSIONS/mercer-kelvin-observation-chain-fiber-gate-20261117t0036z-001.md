# Kelvin-vortex observation chain: composition and fiberwise identifiability

**Status:** source-grounded measurement-architecture note. This is not a physical calculation, a new measurement, an H(s)H prediction, or a theory promotion.

## 1. Measured system and source boundary

Barckicke, Falcon and Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409-414 (2026), published 10 February 2026, DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w), report a controlled classical air-water vortex with a finite air core. The paper identifies supporting data, including data used for spatiotemporal power spectra, at [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The DOI is identified, but the file inventory, exact version, raw bytes, acquisition IDs, calibration files and paired-channel covariance were not retrieved in this review.

The paper distinguishes a helical bending mode (m = 1) from a double-helix flattening mode (m = 2). Its extended data describe m = 1 as displacing the vortex axis without radius variation. The m = 2 mode changes core shape without the same centerline displacement. These are source-reported experimental interpretations, not SAT twist sectors. An azimuthal wavenumber m is not automatically a SAT twist label.

Source-reported measurement scales include approximately 60 micrometres per pixel for contour imaging, typical instantaneous core-radius/position uncertainty around 0.1 mm, circulation uncertainty around 0.005 m^2/s, and vertical-velocity uncertainty around 0.05 m/s. The averaged core-radius caption and the typical instantaneous uncertainty refer to different averaging levels; the raw covariance and propagation are not available here. The reported uncertainty figures are not a substitute for a joint acquisition-level covariance.

## 2. Typed observation chain

The experiment must be represented as a composition of distinct maps, not as one undifferentiated vortex measurement:

\[
X_{\rm boundary}(z,\theta,t)
\xrightarrow{I_{\rm contour}}
I_{\rm camera}
\xrightarrow{C_{\rm contour}}
r(z,t,\theta)
\xrightarrow{P_2}
(r_0,r_\pi)
\xrightarrow{L}
(\eta,a)
\xrightarrow{\mathcal F_{z,t}}
(S_\eta,S_a).
\]

Here:

- I_contour is image acquisition with camera geometry, calibration and timing.
- C_contour is contour extraction from image data.
- P_2 samples the contour at the two stated antipodal angles, θ = 0, π.
- L is the paper's two-channel linear readout.
- F_(z,t) is the subsequent spatiotemporal transform and power-spectrum construction.

The PIV and PTV paths are separate channels:

\[
X_{\rm flow}\to I_{\rm PIV}\to v_\theta(r,z,t)\to\Gamma,
\qquad
X_{\rm flow}\to I_{\rm PTV}\to v_z(z,t).
\]

Each channel needs its own acquisition identity, instrument and calibration identity, clock/synchronization record, spatial transform, analysis pipeline, uncertainty and covariance. Shared instruments, forcing conditions and sample blocks are dependencies, not independent replications.

## 3. The readout is invertible, the upstream projection is not

For fixed (z,t), the paper defines

\[
r_0=r(z,t,0),\qquad r_\pi=r(z,t,\pi),
\]
\[
\eta=\frac{r_0-r_\pi}{2},\qquad
a=\frac{r_0+r_\pi}{2}.
\]

The inverse is exact:

\[
r_0=a+\eta,\qquad r_\pi=a-\eta.
\]

Therefore L:(r_0,r_π) ↦ (η,a) is a bijective reparameterization of the two sampled values. It loses no information about that pair.

That does **not** make the upstream sampling map P_2:r(θ) ↦ (r(0),r(π)) injective on the full angular contour. Distinct full contours can agree at the two sampled angles. Under the paper's single-harmonic radial ansatz, the existing formalization proves the antipodal alias m ↦ m+2, and proves that no deterministic downstream classifier of only the two readout scalars can restore that distinction. The same formalization gives the conditional m = 1 and m = 2 readout formulas; their outputs separate only when the sampled harmonic signal ε cos φ is nonzero.

This is a statement about the two-point channel under the declared ansatz. It is not a claim that the full experiment failed to identify its modes: additional imaging, spectral information or physical constraints may carry information outside this two-sample map. The source-to-instrument mapping for those additional channels must be explicit before they are credited.

## 4. A general composition and observability gate

The existing Lean formalization in [PR #1189](https://github.com/Satobloc/HsH/pull/1189) supplies a general map-composition criterion. Let

\[
P:W_f\to O_f,\qquad C_4:W_f\to W_c,\qquad
P_c:W_c\to O_c.
\]

A deterministic induced map C_3 on the actual image of P exists with

\[
P_c\circ C_4=C_3\circ P
\]

if and only if the composite P_c ∘ C_4 is constant on every fiber of P:

\[
P(x)=P(y)\;\Longrightarrow\;
P_c(C_4(x))=P_c(C_4(y)).
\]

The induced map is unique on the image of P. The existing witness-carrying composition module extends this condition across two stages while retaining intermediate image witnesses.

**Operational consequence:** a proposed H(s)H target observable is admissible through an instrument channel only if it is constant on that channel's measurement fibers. If two physically admitted states produce the same measured channel but different values of the proposed target, no deterministic decoder from that channel can recover the target. The choices are to add a genuinely discriminating measurement channel, restrict the admitted state domain with independently justified conditions, or mark the target unidentifiable. A label change or a downstream classifier cannot restore information discarded upstream.

For H(s)H, the required composition is still unconstructed:

\[
X_{H(s)H}
\xrightarrow{\Phi_H}
X_{\rm lab}
\xrightarrow{\Pi_j}
Y_j
\xrightarrow{\mathcal O_j}
Z_j.
\]

The maps Φ_H, Π_j and O_j must declare domains, codomains, units, frames, timebases, calibration, uncertainty and composition conditions. No source-faithful H(s)H-to-laboratory map has been established by this note.

## 5. Conditional comparison and falsifiability

| Element | Standard H0 | H(s)H H1 |
|---|---|---|
| Shared parameters | Measured a0, fitted/calibrated Γ and vz, forcing and instrument parameters with roles declared | Exactly the same shared parameters and calibration |
| Calibration | Independent calibration and training acquisitions, frozen before holdout | Same calibration and training acquisitions; H(s)H map and additional observable frozen before holdout |
| Holdout | Entire independent acquisition or operating condition, not adjacent frames or Fourier bins from one record | Same untouched acquisition or condition |
| Predicted observable | Standard hollow-core Kelvin limit and finite-core Rankine-vortex dispersion, plus declared Sη, Sa and flow channels | A pre-registered H(s)H-specific cross-channel relation that factors through a declared measurement map and is not absorbed by standard nuisance parameters |
| Falsification | Held-out joint residual outside a pre-registered predictive region derived from actual covariance | Failure of the pre-registered relation, no identifiable factorization through the measured channel, or no out-of-sample distinction from H0 |

The paper reports fitting Γ and vz to the dispersion data and then checking consistency against PIV/PTV measurements. That is a fit plus an a-posteriori consistency check, not a blind held-out prediction. A fair comparison must freeze shared parameters before inspecting the whole holdout acquisition.

No numerical rejection threshold is assigned here. The raw data, exact file version, paired-channel covariance, calibration covariance, acquisition manifest and independent holdout are not available. No fit, physical calculation, independent measurement or prediction was performed.

## 6. Forced versus optional geometry

**Forced by the experiment:** a finite spatial air core, an air-water interface, an axial vortex structure, the reported contour and flow measurements, and their instrument-specific observation maps.

**Not forced by the experiment:** identifying the measured spatial core radius a with a finite 4D worldtube thickness; identifying azimuthal mode number m with SAT twist; identifying the air-water interface with an H(s)H contact surface; or adding a distinct physical timesheet or responsive-medium primitive. Those require explicit source-grounded maps and independently identifiable observables. The water is not automatically an H(s)H responsive medium.

## 7. Formal verification status and limits

The existing PR #1189 already contains the relevant modules:

- NadirVortexTwoChannelReadout.lean: invertibility of the two-scalar readout, one-channel non-injectivity, antipodal m-to-m+2 aliasing and downstream non-recovery.
- NadirProjectionCoarseGrainFactorization.lean: existence and uniqueness of an induced coarse map exactly under fiberwise constancy.
- NadirWitnessCarryingComposition.lean: two-stage range-to-range composition with intermediate witnesses.

The last successful exact-head build was [Actions run #43314038015](https://github.com/Satobloc/HsH/actions/runs/43314038015) on commit 4d426c45a9782a409bf049d5ff65a3c7896f8261. It checked the exact source checkout and built the full library successfully, 8,960 jobs, with Lean 4.34.0 and Lake 5.0.0. The three module blobs are unchanged at the current PR head 8a6a0c288b0091a19b604ab96f94fec05adcc40e. However, no workflow run was found for that newer full PR head, so the current PR head is **not** claimed as verified.

The inspected theorem reports use standard dependencies including propext, Classical.choice and Quot.sound; no sorryAx or custom axioms were reported in these modules. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. Lean verifies only the formalized map statements. It does not establish the physical premises, the correctness of the source-to-instrument translation, the Figshare data, or the truth of an H(s)H model.

## 8. Next evidence gate

1. Retrieve the exact Figshare record version, complete file inventory, per-file checksums and license.
2. Identify which raw contour series, PIV/PTV data, calibration files, analysis scripts and acquisition IDs are actually included.
3. Resolve the source-to-instrument path for any additional camera/view used in the mode or handedness claims.
4. Obtain paired-channel and calibration covariance at acquisition level.
5. Define and freeze the H(s)H forward map and its observable before selecting an independent whole-run holdout.
6. Test the fiber-constancy condition for every claimed H(s)H observable before fitting or prediction.

**Disposition:** the measurement-map architecture is sharper, but P2 remains HOLD. The existing formalization provides a conditional identifiability gate; the H(s)H physical forward map and measurement-level data package remain missing. No theory promotion is proposed.
