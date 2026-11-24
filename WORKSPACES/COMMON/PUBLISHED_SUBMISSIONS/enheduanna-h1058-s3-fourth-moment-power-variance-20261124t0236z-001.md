# H1058:S3 — Fourth-moment identifiability gate for quadratic spectral uncertainty

**Nominal:** 2026-11-24T02:36Z  
**Run key:** `REVROT3-19-20261011:1058:s3`  
**Status at artifact freeze:** `FORMALIZATION_ADDED / EXACT_HEAD_CI_IN_PROGRESS / NO_PHYSICAL_CALCULATION / NOT_BEDROCK`

## One substantive improvement

The existing Lane 36 chain now distinguishes three uncertainty layers:

1. covariance propagation through the linear measurement and Fourier maps;
2. the nonlinear squared-magnitude power estimator;
3. sampling uncertainty of that quadratic estimator.

The previous spectral-power module formalizes the estimator's algebraic nonlinearity. This addition formalizes why input mean/covariance information alone cannot, in general, determine the variance of a quadratic output. It makes the missing fourth-order evidence an explicit identifiability boundary rather than an informal caveat.

## Source-defined measurement object

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

The Methods define the same-frame contour readouts

\[
\eta(z,t)=\frac{r(z,t,0)-r(z,t,\pi)}{2},\qquad
a(z,t)=\frac{r(z,t,0)+r(z,t,\pi)}{2},
\]

and the spatiotemporal power spectrum

\[
S_X(\omega,k)=\frac{|\widetilde X(\omega,k)|^2}{LT},
\qquad X\in\{\eta,a\},
\]

where \(\widetilde X\) is the two-dimensional Fourier transform. The paper reports a 12.5 cm axial window, 300 fps acquisition, 30 s recordings, 60 μm/px spatial resolution, 0.5 mm contour width, and approximately 0.1 mm typical radius/position uncertainty. See Methods, pp. 6–7, DOI above.

The inspected Methods describe the transform and normalization, but do not specify a finite-record power-spectrum uncertainty estimator, taper/window, or segment-averaging procedure. This is a limit of the inspected description, not evidence that no such analysis was performed.

The same Methods state that \(a_0=\langle a(z)\rangle_z\) is measured, while \(\Gamma\) and \(v_z\) are fitted to the dispersion data and checked a posteriori against PIV/PTV. That is a fit plus a consistency check, not a blind holdout prediction from independently frozen parameters.

The supporting raw data are cited at Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The raw file inventory, version, bytes, checksums, sample identifiers, and joint Fourier-coefficient records were not retrieved in this run.

## Formal result

For a real-valued random variable \(X\) with finite fourth moment,

\[
\operatorname{Var}(X^2)=\mathbb E[X^4]-\bigl(\mathbb E[X^2]\bigr)^2.
\]

The new Lean module is `HsHVerification.SpectralEstimatorMomentGate` in the existing [PR #2458](https://github.com/Satobloc/HsH/pull/2458) branch. It defines finite three-atom probability laws and proves that no function of only the input mean and second raw moment can recover the variance of the quadratic output for every such law.

The finite mathematical witness is:

| Law | Outcomes and probabilities | Mean | Second moment | Fourth moment | Variance of input | Variance of square |
|---|---|---:|---:|---:|---:|---:|
| A | \(-1:1/2,\ +1:1/2,\ 0:0\) | 0 | 1 | 1 | 1 | 0 |
| B | \(0:3/4,\ +2:1/8,\ -2:1/8\) | 0 | 1 | 4 | 1 | 3 |

Both are normalized nonnegative finite probability laws. They have the same first two raw moments and the same input variance, but different fourth moments and different variances of the squared output.

An independent exact-rational Python replay reproduced the table. These are abstract mathematical probability witnesses only: they are not physical fixtures, measurements, synthetic vortex data, or an H(s)H model.

For a complex Fourier amplitude \(Z=X+iY\), the power is \(|Z|^2=X^2+Y^2\), and its variance involves fourth-order joint information, including \(\mathbb E[X^4]\), \(\mathbb E[Y^4]\), and \(\mathbb E[X^2Y^2]\). The new Lean theorem is the real one-component restriction; the full complex fourth-order tensor is not yet formalized.

## Workflow consequence

A future power-spectrum uncertainty claim should enter `POWER_UNCERTAINTY_READY` only when it carries:

- the source-paired sample/frame lineage and immutable input identity;
- either fourth-order joint-moment evidence for the actual complex Fourier coefficients, or a predeclared data-grounded segment/block resampling method;
- the estimator's window/taper, segment length, overlap, stationarity assumptions, effective-sample treatment, and uncertainty calculation;
- a separate calibration/holdout declaration.

If those requirements are not met, use `POWER_UNCERTAINTY_UNDERIDENTIFIED`. A covariance matrix propagated through the preceding linear maps is not, by itself, a sampling-uncertainty estimate for the quadratic power estimator.

## Prediction and identifiability boundary

| Hypothesis | Shared parameters | Required holdout observable | Comparator / failure condition |
|---|---|---|---|
| Standard Kelvin/Rankine account | Measured \(a_0\), instrument map, frozen \(\Gamma\) and \(v_z\) | Paired \(S_\eta,S_a\) dispersion ridges and their uncertainty | Standard dispersion prediction; reject only against a predeclared covariance-aware holdout region |
| H(s)H representation-only | Same physical forward observable and shared parameters | Exactly the same registered readout | No discriminator if the projected predictions coincide |
| H(s)H with additional finite-core geometry | Standard parameters plus independently identifiable geometric variables | A distinct, frozen observable on whole-run holdout | Reject the specified extension if its predeclared prediction fails the measured uncertainty region |

No numerical falsification threshold is supplied: the raw Figshare files, sample manifest, calibration records, and joint uncertainty data have not been retrieved. No physical calculation, fit, optimization, numerical prediction, or observational validation was performed.

Thickness, twist/framing, and contact surfaces remain optional representational additions until an explicit source-authorized forward map makes one identifiable and produces a distinct held-out prediction. No physical equivalence is inferred from the formal result.

## Existing-work reuse

- Meridian's covariance-composition result in PR #2458 supplies the full-covariance pushforward through linear maps.
- The existing `SpectralPowerEstimatorBoundary` module supplies the quadratic addition, scaling, and quarter-turn identities.
- Mercer PR #1918 already covers the phase-sensitive complex cross-spectral matrix; it was not duplicated.
- Nadir PR #1189 supplies the source-specific paired-sample identity/admission gate.
- Sable PR #1538 supplies the source-specific covariance bridge.

The new delta is the fourth-moment non-identifiability theorem and the corresponding uncertainty-admission boundary. It does not modify another worker's branch or protected P0 work.

## Lean verification status at artifact freeze

- Existing PR: [#2458](https://github.com/Satobloc/HsH/pull/2458), draft/open/unmerged.
- PR head: `d563ccca37482458ebaf81652709ddeef6f47bd3`.
- Exact-head Actions run: [#45314104868](https://github.com/Satobloc/HsH/actions/runs/45314104868).
- Exact PR-head checkout assertion: PASS.
- Lake dependency-manifest generation: IN PROGRESS at last readback.
- Lean compilation: NOT STARTED at last readback.
- Theorem-specific axiom output: NOT YET AVAILABLE.
- No independent review is claimed.

No theorem in the new module is claimed as compiled or verified until the exact-head workflow completes and its output is inspected. The Lean model checks only its formalized finite-probability statement; it does not establish that the experimental data follow either witness law or that any H(s)H physical premise is true.

## Epistemic status

This is an assistant-level mathematical and workflow result, not a historical Enheduanna-worker statement, not a Nathan Direct theory amendment, not an empirical measurement, and not BEDROCK promotion. The finite laws are mathematical witnesses, not physical fixtures. The source-to-observable translation, raw-data analysis, and any independent physical test remain separate work.
