# Ravel sandbox checkpoint: causal-zero calibration does not make atomicity interval-robust

**Status:** `GEN/CANDIDATE`. This is a conditional inverse-problem result for a declared readout model, not canonical H(s)H theory and not a physical prediction.

## Exact question

Does the native-support atomicity pass survive when the allowed relaxation interval alone is expanded from `[0.04,12]` to `[0.01,48]` while the calibrated causal zero, seeds, repeats, covariance, joint pole/residue observable, grids, and estimator are held fixed?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT_HSH_SYNTHESIS_STATE.md` — **full sequential read**. Retained its object/representation/readout separation and its requirement that fluctuation spectra remain downstream of a declared quadratic operator and observation map. No particle assignment, universal constant, or historical mechanism was imported.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md` — **full sequential read**. Retained its method: a degeneracy in one readout can be broken only by a separately reconstructed observable; do not jointly refit hidden quantities and call the result emergence.

An additional archive fetch of `H(s)H Dev +/H(s)H MANIFOLDS.txt` was used only as historical quarry; its lattice, fixed constants, KNdS identifications, recursive attenuation, and completion claims were excluded. A targeted Drive search returned no relevant construction. The targeted Ravel Slack search returned the immediately preceding causal-zero checkpoint and earlier wide-support failures, not an independent solution.

## Source / inference / new-construction boundary

- **Source:** finite-core object, H(s)H representation, and detector/readout are distinct; an independent observable may break a support degeneracy.
- **Inference:** interval expansion tests whether apparent atomicity belongs to the measured quotient of the spectrum or to a chosen inversion boundary.
- **New construction:** rerun the unchanged calibrated-zero joint pole/residue inversion on the fourfold-expanded support and render the exact squared-resolvent sensitivity over radius and candidate relaxation time.

## Unchanged model

The measured response remains

\[
H(z;a,\nu)=\frac{N(z;a,\nu)}{D(z;a,\nu)},
\qquad
N(z;a,\nu)=G(a,\nu)(1-iz\tau_N),
\]

with

\[
G(a,\nu)=\exp(c_0+c_a\log a+c_\nu\log\nu).
\]

The numerator coefficients and \(\tau_N\) are independently estimated in every repeat from known-load probes. No constitutive relaxation channel was added. The residue contribution samples the squared resolvent kernel

\[
K_2(z,\tau)=\frac{1}{(1-iz\tau)^2}.
\]

Protocol: 50 seeds, 192 repeats per seed, 41 radii, `nu={0.65,1,1.55}`, relative complex noise `3e-4`, and 25/49/97 positive-spectrum bins. The only changed input is the support `[0.01,48]`.

## Result

| Bins | Fast centroid | Slow centroid | Fast mass | Median fast width | U95 fast width | Endpoint mass U95 |
|---:|---:|---:|---:|---:|---:|---:|
| 25 | 0.24868 | 1.99984 | 0.60009 | 0.10544 | 0.10644 | 0 |
| 49 | 0.24940 | 1.99988 | 0.60002 | 0.07339 | 0.09718 | 0.00399 |
| 97 | 0.24975 | 1.99997 | 0.59998 | 0.04681 | 0.17027 | 0.00586 |

The central solution is extremely stable: both centroids converge, the mass split remains approximately `0.60/0.40`, median width contracts, and median endpoint mass is zero. Atomicity nevertheless fails its preregistered interval-robust criterion because the 97-bin U95 width rebounds and endpoint-mass U95 grows under refinement.

Relative to the preceding frequency-independent calibrated-gain run, the causal zero slightly improves the finest wide-support U95 (`0.1703` rather than approximately `0.1885` in the earlier joint pole/residue fixture), but it does not remove the rare tail branch.

## Surviving residual and candidate classification

The surviving representation is:

\[
\boxed{\text{stable central two-sector quotient} \; + \; \text{rare unresolved wide-support tail}.}
\]

The Class P sensitivity map shows that large candidate \(\tau\) occupies a low-sensitivity region of \(|K_2|\) over much of the finite-core radius range. The tail is therefore a candidate null direction of the declared readout, not evidence for a third physical channel. This classification remains `OPEN` until the Jacobian null space is computed explicitly.

## Failure condition

For this measurement class, a discrete fast channel cannot be called interval-robust while the U95 width and endpoint leakage grow under support refinement. The stronger two-atom interpretation also fails if the tail displacement has a non-negligible projection onto well-conditioned observable directions.

## Prediction status

No empirical prediction is earned.

## Exact next dependency

On the unchanged 97-bin wide grid, construct the calibration-marginalized whitened joint pole/residue Jacobian, compute its singular-value decomposition, and decompose every rare tail solution into identifiable and null-space components. If the tail lies in the numerical null space while projected centroids and masses remain stable, freeze the measurable object as an equivalence class rather than a discrete spectrum. Add no constitutive mode.
