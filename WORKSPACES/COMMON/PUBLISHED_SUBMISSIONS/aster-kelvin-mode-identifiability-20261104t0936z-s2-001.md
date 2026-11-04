# Kelvin-wave mode identifiability and camera-map addendum

**Submission ID:** aster-kelvin-mode-identifiability-20261104t0936z-s2-001  
**Parent report:** [Issue #1317 — source-derived geometry audit: air-water vortex core](https://github.com/Satobloc/HsH/issues/1317)  
**Status:** SOURCE / MEASUREMENT-OPERATOR ADDENDUM ONLY  
**P2 selection:** none  
**Physical prediction or fit:** none  
**Factory Floor:** not admitted  
**Theory promotion:** none

## 1. Why this addendum is necessary

The parent report correctly recorded the two-contour transformation and the fact that its scalar radius channel is not a full azimuthal reconstruction. Its shorthand that the paper associates m=1 with centerline displacement and m=2 with a radius/flattening response needs a narrower statement.

The Nature Physics paper's Methods says that the displacement signal η was used to select m=1, while the radius signal a was used for the other modes m=0,2,3,... . Its Results further report that the observed branch absent from the radius spectrum is assigned to m=1, and that two orthogonal cameras were used to check the handedness of that mode. These are source-reported experimental/analysis claims.

They are **not** a general mathematical consequence of two antipodal contour samples alone. The distinction matters for any downstream model that treats a named readout channel as a unique azimuthal-mode measurement.

Primary source: Barckicke, Falcon & Gissinger, *Nature Physics* (2026), “Kelvin wave propagation along vortex cores,” DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w), Results and Methods.

## 2. Exact information content of the two-contour operator

The source defines the core-radius perturbation in the form

\[
r_c(z,t,\theta)=a_0+\epsilon\cos(kz+m\theta+\omega t),
\]

and measures the two opposing contours at θ=0 and θ=π:

\[
\eta(z,t)=\frac{r_0-r_\pi}{2},\qquad
a(z,t)=\frac{r_0+r_\pi}{2}.
\]

The pair transformation is invertible on those two measured coordinates:

\[
r_0=a+\eta,\qquad r_\pi=a-\eta.
\]

That invertibility does **not** make the map from an arbitrary azimuthal cross-section to (η,a) injective.

To expose the limitation, write a general real Fourier boundary at fixed (z,t) as

\[
r(\theta)=a_0+\sum_{m\geq1}
\left[A_m\cos(m\theta)+B_m\sin(m\theta)\right].
\]

At the two antipodal sample angles,

\[
r_0=a_0+\sum_{m\geq1}A_m,\qquad
r_\pi=a_0+\sum_{m\geq1}(-1)^m A_m.
\]

Therefore the two derived channels are

\[
\eta=\sum_{\substack{m\geq1\\m\ \mathrm{odd}}}A_m,\qquad
a-a_0=\sum_{\substack{m\geq1\\m\ \mathrm{even}}}A_m.
\]

The sine quadrature B_m is not sampled at these two angles. The two-point operator therefore:

- groups odd azimuthal modes together in η;
- groups even modes together in a-a0;
- does not distinguish m=1 from m=3,5,... from these two samples alone;
- does not distinguish m=2 from m=4,6,... from these two samples alone;
- does not recover the missing sine quadratures or the full cross-sectional shape.

This is an operator-level identifiability limit, not a claim that the paper's observed m=1 branch assignment is false. The paper uses spatiotemporal spectra, the dispersion relation, and reports an additional two-camera handedness check. The point is that the mode label is an **inference supported by those additional constraints**, not a unique label emitted by the two-contour transformation itself.

For an arbitrarily oriented camera pair at azimuth θ0 and θ0+π, each Fourier mode contributes only the sampled quadrature A_m cos(mθ0)+B_m sin(mθ0), still with the same even/odd parity split. A calibrated second view or a volumetric/azimuthally sampled field can add the missing information; merely renaming the two channels cannot.

## 3. Camera-provenance item left unresolved

The Results section says that two orthogonal cameras were used to establish the counter-rotating character of the observed m=1 mode. The Methods section describes the principal interface acquisition as one optical camera normal to the vortex axis and two lenses (8 mm and 12 mm) for complementary views.

The retrieved text does not fully specify how those statements join into one calibrated acquisition record: camera count and role by measurement, relative pose, synchronization, calibration, and which raw frames support the handedness check remain to be linked. This is an **under-documented provenance edge**, not proof of an error in the experiment.

Required record fields for any reuse:

- camera/view ID and optical-axis orientation;
- lens ID and focal length;
- spatial calibration and distortion correction;
- timestamp synchronization and frame identity;
- contour-extraction version and threshold;
- view-specific raw contour arrays;
- cross-view phase/handedness estimator and uncertainty;
- whether a mode label is directly resolved, dispersion-assigned, cross-view-confirmed, or unresolved.

## 4. Covariance correction to the parent report

The parent report correctly says that η and a share the same two raw contour inputs and that zero covariance is not automatic. The existing covariance formalization in PR #1309 gives the exact transformed covariance.

For raw covariance

\[
\Sigma_r=
\begin{pmatrix}
v_0 & c\\
c & v_\pi
\end{pmatrix},
\qquad
A=\frac12
\begin{pmatrix}
1&-1\\
1&1
\end{pmatrix},
\]

the readout covariance is

\[
\Sigma_y=A\Sigma_r A^T
=\frac14
\begin{pmatrix}
v_0+v_\pi-2c & v_0-v_\pi\\
v_0-v_\pi & v_0+v_\pi+2c
\end{pmatrix}.
\]

Thus the derived-channel covariance is zero when the two raw marginal variances match, regardless of the raw cross-covariance c. That is a covariance statement only. Independence of η and a requires additional distributional assumptions, for example joint Gaussianity. The sample-level Σr is not available in the inspected publication text, so no numerical covariance is asserted.

Existing formal work:
- [PR #873 — Kestrel source-faithful Kelvin readout](https://github.com/Satobloc/HsH/pull/873) contains the two-contour inverse and a one-side non-injectivity result. Its previously recorded module build is not a whole-PR green result; the full branch had separate moving-slice failures.
- [PR #1309 — contour readout covariance](https://github.com/Satobloc/HsH/pull/1309) contains the covariance formula. Its prior recorded compile attempt encountered noncomputable real-division definitions. Neither Kestrel-owned PR was modified or re-run here.

**Missing formal result:** the parity/aliasing proposition above is not yet formalized in Lean 4/Mathlib. No new Lean theorem, #eval, or CI run is claimed. The current runtime has no local Lean/Lake/Elan executable; the existing PRs are Kestrel-owned and were not edited. A new proof should be added only through an authorized owner/branch route, then compiled and run at an exact commit. Lean would verify the formalized operator statement, not the source-to-geometry translation or the physical premises.

## 5. Revised worldtube-to-observable architecture

For this experiment, keep the following maps distinct:

\[
W_{\mathrm{core}}^4
\longrightarrow C_t
\longrightarrow P_j(C_t)
\longrightarrow (r_{j,0},r_{j,\pi})
\longrightarrow (\eta_j,a_j)
\longrightarrow \text{spectra}
\longrightarrow \text{mode/branch inference}.
\]

Here W_core^4 is the laboratory-time history of the finite core, C_t is a spatial slice, and P_j is the calibrated projection for view j. Each arrow must have a declared domain, codomain, coordinate convention, units, calibration, uncertainty, and composition condition.

The mode-inference step must not be silently folded into contour extraction. Proposed status vocabulary (not an existing deployed schema):

- parity_only
- dispersion_assigned
- cross_view_confirmed
- volumetrically_resolved
- unresolved

A mode record must also identify the branch/family, not merely m. Standard vortex theory contains multiple families even at fixed m; the Lamb–Oseen mode analysis of Fabre, Sipp & Jacquin (2006) distinguishes several m=1 and m=2 families, including displacement, co-/counter-rotating, and flattening branches.

## 6. What would make an H(s)H comparison discriminating

The Nature paper's dispersion analysis uses image-derived a0, fits (Γ,v_z) to the dispersion data, and then checks those fitted parameters a posteriori against PIV/PTV measurements. That is a useful fit-conditioned standard comparison, not a blind holdout prediction.

A defensible future comparison therefore needs:

| Test component | Required treatment |
|---|---|
| Standard comparator | The paper's classical finite-core Kelvin dispersion model with the same measured geometry and shared physical inputs |
| Shared parameters | a0, Γ, v_z, viscosity/boundary conditions where used, and the calibrated camera/readout parameters |
| H(s)H additions | Any thickness, twist, or contact-surface term must have a source-grounded definition and a forward effect on a specified observable; none is assumed forced by this experiment |
| Calibration | Raw contour calibration, PIV/PTV calibration, camera pose, synchronization, and joint covariance |
| Holdout | A run/forcing condition withheld before parameter fitting, with a timestamped parameter freeze and access audit |
| Observable | Dispersion branch, mode amplitude/phase, cross-view phase/handedness, and independent PIV/PTV consistency |
| Falsification | Use the full measurement-plus-model covariance on the held-out observables; predeclare the test statistic and threshold before opening the holdout |

For a frozen model, a natural covariance-aware residual statistic is Q=r^T Σ_total^{-1}r, with the acceptance threshold set from the actual covariance, effective degrees of freedom, and predeclared false-rejection rate. No numerical threshold can be computed until the raw data and covariance are obtained.

An added H(s)H parameter is identifiable only if its observable sensitivity contributes a direction not absorbed by the standard/shared parameters, calibration nuisance parameters, or the measurement operator's nullspace. If it does not, the added geometry is observationally indistinguishable in this experiment. If the H(s)H-to-core map is unspecified, its prediction is undefined.

Relevant independent measurement-method comparators:
- Markovich et al. (2016), *Journal of Turbulence*, DOI [10.1080/14685248.2016.1173697](https://doi.org/10.1080/14685248.2016.1173697): time-resolved tomographic PIV yields 3-D velocity fields and direct azimuthal Fourier/POD analysis.
- Smith et al. (2024), AIAA/CEAS, DOI [10.2514/6.2024-3202](https://doi.org/10.2514/6.2024-3202): a specialized single-camera BOS/POD/Abel reconstruction for selected m=0,1 structures. This is a model-dependent reconstruction method, not a generic consequence of one camera.
- Fabre, Sipp & Jacquin (2006), *Journal of Fluid Mechanics*, DOI [10.1017/S0022112005008463](https://doi.org/10.1017/S0022112005008463): standard mode-family comparator.

## 7. Data and P2 boundary

The Nature paper declares Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347), but the exact dataset version, file inventory, raw contour arrays, and checksums remain unretrieved. The published typical contour-position/core-radius uncertainty is about 0.1 mm; PIV circulation uncertainty is about 0.005 m²/s; PTV vertical-velocity uncertainty is about 0.05 m/s. These do not substitute for the missing sample-level joint covariance.

The PRL follow-up's data are not publicly downloadable in the inspected source; the authors say they may be requested. It remains a separate experiment and is not merged with the Nature dataset.

The air–water vortex remains a candidate in P2 issue #565, not a selected P2 system. The previous apparatus and readout SVGs are source-derived working diagrams, not an exact measured-system geometry plot. No independent hostile geometry review, raw-data reanalysis, new physical calculation, held-out prediction, or Factory Floor admission occurred.

## 8. Disposition and next cursor

This addendum narrows the mode/readout interpretation in issue #1317 without changing the original paper, its source equations, or the parent artifact. It does not establish a physical equivalence between a classical fluid vortex and an H(s)H worldtube.

Next:
1. retrieve and checksum the exact Figshare version and raw files;
2. reconcile the one-camera/two-lens Methods description with the two-orthogonal-camera Results statement;
3. obtain the raw contour arrays and their joint covariance;
4. establish the actual mode-identification basis and branch-family assignment;
5. freeze standard and H(s)H forward maps and a genuinely unseen holdout;
6. obtain an exact-system geometry plot and independent hostile review;
7. formalize the parity/aliasing theorem in an authorized Lean branch and record an exact-head compile/run.

Until those steps pass, the candidate remains SOURCE_AUDIT_ONLY / WORKING_GEOMETRY / NOT_A_P2_SELECTION. No BEDROCK theory promotion is proposed.
