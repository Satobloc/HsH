# Calder h1122:s2 | Kelvin-wave rotation-scale input-status audit

**Disposition:** `P2_CANDIDATE_ONLY / FIT_CONDITIONED_ARITHMETIC_CHECK / RAW_DATA_NOT_RETRIEVED / NO_HSH_MAP / NO_P2_SELECTION`

This is an incremental source-and-input-status audit of the existing Barckicke–Falcon–Gissinger air–water vortex candidate. It does not create a new P2 system selection, reanalyse raw data, or assert an H(s)H equivalence.

## 1. Identifiable measured system and source

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics*, published online 10 February 2026, DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The experiment is a controlled classical bathtub vortex with an air core in water, not a superfluid measurement. The authors describe it as a classical analogue and caution that quantum-vortex topology and core scales differ.

For the reported \(m=1\) dispersion example (Fig. 3), the condition is pump \(U=11\ \mathrm V\), drain diameter \(d=5\ \mathrm{mm}\). The caption gives \(a_0=1.9\ \mathrm{mm}\), \(\Gamma=0.022\ \mathrm{m^2\,s^{-1}}\), and \(v_z=0.57\ \mathrm{m\,s^{-1}}\), describing the parameters as consistent with experimental measurements.

The source's acquisition chain is:
- \(a(z,t)\) and \(\eta(z,t)\): optical contour detection from opposing sides of the air–water interface;
- \(\Gamma\): PIV from seeded hollow-glass particles, \(6{,}000\ \mathrm{fps}\), \(37\times23\) grid, \(2.7\ \mathrm{mm}\) spatial resolution;
- \(v_z\): PTV of expanded-polystyrene tracers along the core.

The paper reports a typical circulation measurement uncertainty/axial-variability scale \(\delta\Gamma \simeq 5.10\times10^{-3}\ \mathrm{m^2\,s^{-1}}\). It says the mean \(a_0\) uncertainty in Extended Data Fig. 4 is negligible, while the general Methods section reports typical per-contour core-radius/position uncertainty of about \(0.1\ \mathrm{mm}\). These statements refer to different measurement summaries; their relationship and joint covariance are not specified in the retrieved text.

The supporting-data DOI is [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The DOI is identified, but its version, file inventory, raw bytes, acquisition IDs and calibration/covariance package were not retrieved. This is not a raw-data reanalysis.

## 2. Input-status correction: the reported \(\Gamma\) is fit-conditioned

The Methods state that the authors use measured \(a_0\), then fit the pair \((\Gamma,v_z)\) to the dispersion data using Eq. (2), and only afterward check that the fitted pair is consistent with PIV/PTV measurements.

Therefore, for the Fig. 3 parameter tuple:
- \(a_0=1.9\ \mathrm{mm}\) is a measured contour-derived input;
- \(\Gamma=0.022\ \mathrm{m^2\,s^{-1}}\) and \(v_z=0.57\ \mathrm{m\,s^{-1}}\) are the reported dispersion-fit parameters, with a posteriori consistency checks against measurements;
- \(\delta\Gamma\) is a reported PIV measurement uncertainty/variability scale, **not** the covariance or standard error of the fitted \(\Gamma\).

The fitted value must not be silently relabelled as an independent PIV measurement. Nor may the PIV uncertainty be attached to the fitted value as a formal fit uncertainty without the fit covariance and same-run measurement correspondence.

## 3. Reproducible nominal rotation-scale calculation

The paper defines the core angular rotation scale

\[
\Omega_0=\frac{\Gamma}{2\pi a_0^2}.
\]

Using the reported Fig. 3 parameter tuple, with \(\Gamma\) explicitly treated as fit-conditioned and \(a_0\) as measured:

```python
import math

Gamma_fit = 0.022       # m^2 s^-1, dispersion-fit parameter
a0_measured = 1.9e-3    # m, contour-derived mean core radius

Omega0_nominal = Gamma_fit / (2 * math.pi * a0_measured**2)
period_nominal = 2 * math.pi / Omega0_nominal

print(Omega0_nominal, period_nominal)
```

Output:

```text
969.9193207816336 0.006478049434169561
```

Thus the mixed-input nominal scale is \(\Omega_{0,\mathrm{nominal}}\approx 9.70\times10^2\ \mathrm{s^{-1}}\), with nominal rotation period \(T\approx6.48\ \mathrm{ms}\). This reproduces the paper's order-of-magnitude statement \(\Omega_0\sim10^3\ \mathrm{s^{-1}}\).

A sensitivity calculation shows that changing \(\Gamma\) by the reported PIV uncertainty scale would change this nominal \(\Omega_0\) by

\[
\Delta\Omega_{\Gamma,\mathrm{sensitivity}}
=\frac{5.10\times10^{-3}}{2\pi(1.9\times10^{-3})^2}
\approx 2.25\times10^2\ \mathrm{s^{-1}}.
\]

This is **not** a formal propagated uncertainty on the fitted \(\Omega_0\): the PIV uncertainty scale is not the fit-parameter covariance, and the \(a_0\)-\(\Gamma\) covariance is unavailable. No confidence interval is assigned.

## 4. Fit versus prediction and next admissible test

The nominal arithmetic is a unit/magnitude consistency check on a published fit-conditioned parameter tuple. It is not an independent prediction, an independent measurement, or validation of Eq. (2).

A genuinely predictive comparison would require same-run, independently calibrated \(a_0\), PIV \(\Gamma\), and PTV \(v_z\), with their uncertainty/covariance and acquisition identities frozen before the spectrum is examined. A separate acquisition or condition must be held out at the run/condition level; frames, spatial slices, FFT bins, files, or channels are not independent replications.

The \(m=2\) Fig. 4 case is not used here: it is reported at \(U=9\ \mathrm V\), while the cited Extended Data \(a_0\) measurement is at \(U=11\ \mathrm V\). The previously recorded cross-condition dependency remains unresolved.

## 5. H(s)H boundary and disposition

This is a classical finite-core fluid-vortex comparator. No source-defined map has been supplied from its laboratory worldtube, fluid response, or instrument acquisition to the tentative H(s)H worldtube/timesheet construction. A shared word such as “vortex,” “filament,” or “core” does not establish physical equivalence. The paper's “rope-like” tornado phase is not a climbing-rope mechanics result and does not establish WWRD rope universality.

No CODATA comparison is applicable to this rotation-scale check. No H(s)H prediction, fit, new Lean theorem, or physical equivalence is claimed. Existing source-to-observation and identifiability formalizations are reused; their compilation does not validate the physical translation.

**P2 disposition remains HOLD / candidate unselected.** Next admissible step: retrieve and version-pin the Figshare files and acquisition manifest; identify the same-run PIV/PTV/contour records and calibration covariance; then freeze a measurement-only baseline and a separate spectral holdout before any H(s)H forward comparison.

**Prior source/map work reused:** P2 register [#565](https://github.com/Satobloc/HsH/issues/565), two-contour operator and mode-identifiability addendum [#1347](https://github.com/Satobloc/HsH/issues/1347), and axial-broadening arithmetic audit [#7146407297](https://github.com/Satobloc/HsH/issues/565#issuecomment-7146407297).
