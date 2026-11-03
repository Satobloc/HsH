# Quantum Kelvin-wave dispersion: figure-data and mass-provenance addendum

**Run:** Workshop Relay :24, 2026-11-03 15:24 UTC  
**Run key:** `REVROT3-19-20261011:567:s2`  
**Status:** SOURCE-VERIFIED / FIGURE-DATA REPRODUCTION / FIT, NOT PREDICTION / NOT H(s)H / NOT BEDROCK  
**Scope:** A distinct superfluid-helium data source. This addendum extends the Kelvin-wave cross-read in issue #1275 and complements the finite-core readout gate in #1301; it does not retry or overwrite the rejected #1275 publisher payload.

## 1. Measured system and data provenance

Minowa et al., “Direct excitation of Kelvin waves on quantized vortices,” *Nature Physics* 21, 233–238 (2025), DOI [10.1038/s41567-024-02720-9](https://doi.org/10.1038/s41567-024-02720-9), study a quantized vortex in superfluid helium-4 at approximately 1.4 K.

The experiment drives a charged tracer attached to the vortex with an AC electric field over 0.8–3.0 Hz. Silicon nanoparticles visualize the vortex. Two camera views (front and bottom, with a 45-degree mirror) are recorded at 30.029 frames/s; the authors combine coordinates from the two views and spline-fit the reconstructed three-dimensional vortex line.

The article's data-availability statement points to [Zenodo record 13959678](https://zenodo.org/records/13959678), version 2, published 2024-10-21. The record describes figure data for arXiv:2402.16411. The file `fig1_dispersion.csv` contains six figure-level points, not raw video, particle trajectories, or the full reconstruction. Its readme specifies wavenumber in m^-1, angular frequency in rad/s, and asymmetric lower/upper wavenumber errors. The Figure 1 caption identifies the plotted error bars as 99% confidence intervals.

The CSV's angular frequencies equal 2π times the controlled drive frequencies. They are therefore treated here as imposed excitation inputs, not as six independent frequency measurements. The CSV supplies no omega uncertainty or joint covariance.

## 2. Circulation-constant provenance before comparison

The standard dispersion form used by the paper is

\[
\omega = C\,\kappa\,k^2,\qquad \kappa=\frac{h}{m_4},
\]

where \(C\) is dimensionless and \(m_4\) is the mass of a helium-4 atom.

Inputs used here:

- \(h=6.62607015\times10^{-34}\ \mathrm{J\,s}\), exact by the SI definition.
- CODATA 2022 atomic mass constant \(u=1.66053906892(52)\times10^{-27}\ \mathrm{kg}\), relative standard uncertainty \(3.13\times10^{-10}\). This is an evaluated/adjusted constant, not a single direct measurement. The CODATA 2022 least-squares adjustment uses input data available through 2022-12-31 and publishes correlations among adjusted constants; its uncertainty is not independent of the wider adjustment model.
- For the relative atomic mass of helium-4, the calculation uses the 2023 Penning-trap result \(A_r(^{4}\mathrm{He})=4.002603254653(48)\ \mathrm{u}\), DOI [10.1103/PhysRevLett.131.093201](https://doi.org/10.1103/PhysRevLett.131.093201). The experiment measures the \(^{4}\mathrm{He}^{2+}\)-to-\(^{12}\mathrm{C}^{6+}\) cyclotron-frequency ratio in a Penning trap (482 ratios across 32 runs), applies stated image-charge, relativistic, magnetic-inhomogeneity, electrostatic-anharmonicity and lineshape corrections, then derives the neutral-atom mass by restoring the electrons and accounting for binding energies. The quoted 48×10^-12 u is the total mass uncertainty.
- This 2023 mass result postdates the CODATA 2022 input cutoff and is not silently described as part of that adjustment. The Penning-trap paper reports a 3.2σ difference from AME2020 and 6.6σ from CODATA 2018. The AME2020 value \(4.00260325413(6)\ \mathrm{u}\) is retained as a sensitivity comparator, not substituted without notice.

Using the 2023 mass result and CODATA 2022 \(u\),

\[
\kappa = 9.969293619243111\times10^{-8}\ \mathrm{m^2\,s^{-1}}.
\]

The \(u\) conversion uncertainty dominates the SI \(\kappa\) uncertainty (about \(3.13\times10^{-10}\) relative under quadrature; a conservative linear combination is about \(3.25\times10^{-10}\)). The full cross-covariance between the evaluated \(u\) and the relative-mass result was not propagated. Replacing the 2023 mass with AME2020 changes \(\kappa\) by only \(1.31\times10^{-10}\) relative and changes the fitted \(C\) below \(10^{-10}\) absolutely. Those constant-source differences are negligible beside the experiment's percent-to-tens-of-percent wavenumber intervals, but the provenance distinction is preserved.

## 3. Reproduction of the published dispersion fit

For each point, calculate \(C_i=\omega_i/(\kappa k_i^2)\). Map each asymmetric 99% wavenumber interval through the same relation; because \(C\propto k^{-2}\), the upper wavenumber endpoint gives the lower compatible \(C\).

| Drive \(f\) (Hz) | \(k\) (m^-1) | Reported 99% \(k\) interval (m^-1) | Central \(C_i\) | \(C\) interval induced by that \(k\) interval |
|---:|---:|---:|---:|---:|
| 0.8 | 8891.300 | [8173.297, 9747.602] | 0.6378 | [0.5307, 0.7548] |
| 1.0 | 10300.304 | [9006.683, 12027.851] | 0.5940 | [0.4357, 0.7769] |
| 1.5 | 10850.551 | [8079.384, 16515.107] | 0.8030 | [0.3466, 1.4483] |
| 2.0 | 16390.918 | [13815.261, 20147.047] | 0.4692 | [0.3105, 0.6604] |
| 2.5 | 17575.344 | [15192.148, 20845.360] | 0.5101 | [0.3626, 0.6827] |
| 3.0 | 18896.798 | [17614.014, 20381.102] | 0.5295 | [0.4552, 0.6094] |

A scale-weighted least-squares reproduction in \(k\)-space, using the mean of each point's lower and upper one-sided 99% error-bar magnitudes only as a relative weight scale, gives \(C=0.568734\). The paper reports \(C=0.56\). All six \(k\) predictions obtained from \(C=0.56\) lie inside their respective reported 99% intervals. The intersection of the six pointwise \(C\)-compatibility intervals is [0.5307, 0.6094], which contains both values.

This is a reproduction/compatibility check, not a formal likelihood or joint 99% confidence interval: the data record does not specify the full interval-generation procedure, frequency uncertainty, or cross-point covariance. The scale-weighted fit is not claimed to reproduce the authors' exact optimizer. The same six points are used to estimate \(C\); there is no blind holdout and no independent prediction.

Reproduction recipe (the arrays are transcribed from the Zenodo CSV; `elo` and `ehi` are the published asymmetric wavenumber errors):

```python
import numpy as np
from scipy.optimize import minimize_scalar

f = np.array([0.8, 1.0, 1.5, 2.0, 2.5, 3.0])
k = np.array([8891.299971, 10300.303782, 10850.551245,
              16390.918194, 17575.343517, 18896.797916])
elo = np.array([718.003186, 1293.620345, 2771.167200,
                2575.657684, 2383.195500, 1282.784058])
ehi = np.array([856.301850, 1727.547457, 5664.556026,
                3756.128669, 3270.015993, 1484.304086])
omega = 2*np.pi*f

h = 6.62607015e-34
u = 1.66053906892e-27
Ar_He4 = 4.002603254653
kappa = h/(u*Ar_He4)

C_i = omega/(kappa*k**2)
C_low = omega/(kappa*(k+ehi)**2)
C_high = omega/(kappa*(k-elo)**2)
scale = (elo+ehi)/2
C_fit = minimize_scalar(
    lambda C: np.sum(((np.sqrt(omega/(C*kappa))-k)/scale)**2),
    bounds=(0.1, 2.0), method="bounded"
).x
print(C_i, C_low.max(), C_high.min(), C_fit)
```

## 4. What the two vortex experiments do and do not share

The 2025 helium experiment measures a three-dimensional vortex-line/centerline reconstruction and its dispersion. It does not resolve or measure a finite cross-sectional core-radius channel; the core scale used in the filament model is not a measured radius from this dataset.

The distinct 2026 Barckicke–Falcon–Gissinger air–water bathtub-vortex experiment, DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w), does measure a macroscopic finite core. Its opposite-contour readout supplies centerline displacement \(\eta\) and mean core radius \(a\), with PIV circulation and PTV axial-velocity cross-checks. The existing public readout gate is issue [#1301](https://github.com/Satobloc/HsH/issues/1301); the conditional two-contour map and inverse are in [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873). The raw Figshare bytes and joint covariance were not retrieved in this run, so no sample-level reanalysis is claimed.

A minimal *measurement-state* distinction is:

\[
X_{\rm core}=(s(z,t),a(z,t),\eta(z,t),\Gamma,v_z,\ldots),
\qquad
\pi_{\rm line}(X_{\rm core})=s(z,t).
\]

The line projection discards cross-sectional and medium variables. It is generally many-to-one; downstream processing of \(s\) alone cannot recover \(a\). The Kestrel formalization already contains the corresponding conditional non-recovery and joint-readout theorems. This is an information/readout statement, not a claim that the two fluids share a constitutive law.

The 2025 dual-camera map is a separate measurement chain. Its joint 3D reconstruction is conditional on calibrated, synchronized views and point correspondence. The paper describes the two-view reconstruction, but the figure-level CSV does not provide the full camera calibration covariance; no new injectivity theorem is claimed for the physical camera system.

The shared phrase “Kelvin wave” identifies a standard vortex-wave phenomenon in two different media. It does not establish a common H(s)H mechanism, scale invariance, a worldtube/timesheet equivalence, or WWRD climbing-rope universality.

## 5. Formal verification boundary

Kestrel PR #873 already contains `coreReadout` / `recoverSides` for the classical two-contour transformation, plus the generic joint-readout injectivity and downstream non-recovery results. Its successful Actions run #41585887441 used Lean 4.34.0 and completed an 8,954-job build. The run's merge commit `cda8faecbba04be775cd601d0b5fc76b0147559c` has base parent `c7dc2c483f50ae03fc7a7c530829170135e18d92` and PR-head parent `0da1050bd0e20e55004c86053e9ccd1b582633d9`. The current PR base has since advanced to `61cc8b65ffed70296e0121dbae067892a79c81d4`; therefore current-base integration and an exact-head-only build are not verified. The fetched log contains no `sorryAx` or `admit`; theorem reports use standard dependencies including `propext`, `Classical.choice`, and `Quot.sound`. The separate automated axiom audit, tests, lint, and nanoda were skipped.

No new Lean module was added because the relevant conditional map mathematics already exists in another worker's open PR. No change was made to that PR. Local `lean`, `lake`, and `elan` executables are not installed in this runtime.

## 6. Forward/reverse/prediction status

- **Forward standard-fluid relation:** the published \(\omega=C\kappa k^2\) fit was independently reproduced from the six public figure-data points.
- **Reverse geometry:** \((k,\omega)\) and fitted \(C\) do not reconstruct the full three-dimensional vortex line, its cross-section, or a four-dimensional worldtube.
- **Independent prediction:** none. The six points estimate the same \(C\) being checked; no holdout was used.
- **Raw-data status:** the public Zenodo figure CSV was retrieved and read. Raw camera frames/trajectories were not. A separate `fig4_velocity.csv` retrieval was rate-limited; no phase-velocity reanalysis was performed.
- **H(s)H status:** no source-grounded geometry-to-medium-to-observable map, no H(s)H fit, no prediction, no physical equivalence, and no BEDROCK promotion.

## 7. Next discriminators

1. Recover raw 2025 vortex trajectories and calibration/covariance, not just six figure points.
2. Recover the 2026 air–water Figshare data and the joint PIV/PTV/contour covariance.
3. Freeze a calibration subset and predict a distinct frequency or measurement channel before opening the holdout.
4. For any H(s)H test, specify the generating geometry, its projection to the medium, the instrument/readout map, units, nuisance parameters and covariance. If the map is non-injective, state exactly which geometric degrees of freedom remain unidentifiable.

No paper gate is advanced. P1 November 9, P2 November 30, and P3 December 14 remain separate. This is a source/data/metrology addendum, not a manuscript or theory claim.

## Sources

- Minowa et al., *Nature Physics* (2025): https://doi.org/10.1038/s41567-024-02720-9
- Zenodo figure-data record, version 2: https://zenodo.org/records/13959678
- Penning-trap helium-4 mass measurement, *Physical Review Letters* (2023): https://doi.org/10.1103/PhysRevLett.131.093201
- CODATA 2022 recommended values, NIST: https://physics.nist.gov/cuu/Constants/
- CODATA 2022 adjustment paper: https://doi.org/10.1103/RevModPhys.97.025002
- Barckicke–Falcon–Gissinger, *Nature Physics* (2026): https://doi.org/10.1038/s41567-026-03175-w
- Existing finite-core readout gate: https://github.com/Satobloc/HsH/issues/1301
- Existing conditional Lean formalization: https://github.com/Satobloc/HsH/pull/873
- Prior classical-vortex cross-read intake: https://github.com/Satobloc/HsH/issues/1275
