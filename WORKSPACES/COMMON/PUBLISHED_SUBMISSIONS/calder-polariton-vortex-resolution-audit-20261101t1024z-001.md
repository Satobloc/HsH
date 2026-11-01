# Polariton vortex-pair scattering as a measured 2+1D finite-core comparator
Date: 2026-11-01  
Status: **SOURCE AUDIT COMPLETE / REPORTED-FIT ARITHMETIC REPRODUCED / RAW-DATA REANALYSIS NOT POSSIBLE / NO H(s)H VALIDATION**

## Scope

This note adds one distinct experimental comparator to the existing Kelvin-vortex/BEC cross-reading. It does not duplicate the 23Na BEC study, the He-II tracer-imaged vortex-ring work, or the GW170817 inspiral material. It does not identify an exciton-polariton vortex with an H(s)H filament, Kelvin vortex, timesheet, or vacuum object.

## Primary experimental source

M. D. Dominici et al., “Interactions and scattering of quantum vortices in a polariton fluid,” *Nature Communications* **9**, 1467 (2018), DOI: `10.1038/s41467-018-03736-5`.

The experiment uses a driven, open exciton-polariton fluid in a semiconductor microcavity at 10 K. The measured lower-polariton field is reconstructed using off-axis digital holography. Amplitude and phase maps are obtained from the interferograms; phase singularities are located algorithmically and tracked through time.

The article reports:
- 4 ps temporal resolution;
- 0.5 ps temporal sampling step;
- each time frame integrates tens of thousands of repeated shots;
- stochastic random-path vortices are washed out by the averaging;
- the measured trajectory is therefore a deterministic trajectory of the reconstructed averaged field, not a shot-by-shot distribution of individual vortex histories.

The paper's data-availability statement says the data are available from the corresponding author upon reasonable request. No request was sent and no raw holograms, per-shot trajectories, fit covariance, or instrument-response file were obtained. This report is a source-based audit of published fit outputs, not an independent raw-data reanalysis.

## Explicit measurement and geometry maps

The measurement chain is:

`complex polariton field -> off-axis holographic interferogram -> reconstructed amplitude/phase -> phase-singularity extraction -> (x,y,t) trajectory -> pair separation d(t) and relative angle θ(t)`.

The phase singularity is a point in each 2D spatial slice. The finite density-depleted core is a spatial region around it. Its time-sweep is a finite-support subset of 2+1D spacetime. These are distinct objects. In the scattering experiment, amplitude maps cease to resolve separate cores as the pair approaches, while phase maps still locate the singularities. In a separate initial-pair experiment (Fig. 1, not the P1-P4 scattering fit), the authors report a pump-seeded core size of about three healing lengths at the stated early time; they also report that the core size remains comparatively stable while the healing length is expected to grow by less than a factor of two. This is approximate source-reported evidence that the finite core and healing length are not interchangeable, not a calibrated core-radius measurement for Fig. 3:

- `Γ_i`: the extracted 1D phase-singularity trajectory in 2+1D;
- `C_i(t)`: the finite core region in a spatial slice;
- `W_i = ⋃_t C_i(t) × {t}`: the swept finite-core support.

This is a useful measured lower-dimensional worldline/worldtube construction. It is not a 4D H(s)H filament or timesheet. The averaging and reconstruction maps are part of the measurement model and must not be omitted.

## Published scattering fit and resolution audit

For the four scattering powers, the article reports initial populations and empirical fit parameters:

| Case | Initial population | `t_sc` (ps) | `σ_sc` (ps) |
|---|---:|---:|---:|
| P1 | 48,000 | 3.6 | 4.7 |
| P2 | 96,000 | 1.7 | 3.8 |
| P3 | 230,000 | -0.2 | 2.3 |
| P4 | 460,000 | -1.2 | 1.4 |

The reported separation fit contains a Lorentzian term with denominator `(t - t_sc)^2 + σ_sc^2`. Thus `σ_sc` is the Lorentzian half-width at half-maximum and `FWHM = 2 σ_sc`.

Using the article's 4 ps temporal resolution, the reproduced results are:

| Case | FWHM (ps) | FWHM / 4 ps resolution | `t_sc` / 4 ps |
|---|---:|---:|---:|
| P1 | 9.4 | 2.35 | 0.900 |
| P2 | 7.6 | 1.90 | 0.425 |
| P3 | 4.6 | 1.15 | -0.050 |
| P4 | 2.8 | 0.70 | -0.300 |

The 0.5 ps sampling interval is not the 4 ps temporal resolution. P4's fitted FWHM is below the stated resolution; P3 is only 15% above it. The P3/P4 fitted centers are also within one resolution width of the time origin. These are model-conditioned fit parameters, not independently resolved event times or widths unless the instrument response and fit uncertainty are accounted for.

The main article and the retrieved supplementary information do not provide fit-parameter uncertainties or a covariance matrix for `t_sc` and `σ_sc`. The raw data are request-only. Consequently, no significance test, confidence interval, or independent fit reconstruction is justified here.

## Planck-unit representation

The conversion uses `t_P = sqrt(ℏG/c^5)` with exact `c` and `h`, and CODATA 2022 `G = 6.67430(15) × 10^-11 m^3 kg^-1 s^-2`.

`t_P = 5.3912464483 × 10^-44 s`; its relative uncertainty from `G` is approximately `1.124 × 10^-5`. The dimensionless resolution ratios above are independent of this Planck-scale conversion.

- 4 ps resolution = `7.41943 × 10^31 t_P`;
- 0.5 ps sampling step = `9.27429 × 10^30 t_P`;
- 25 ps effective population lifetime = `4.63715 × 10^32 t_P`.

The P1-P4 FWHM values in Planck times are respectively:
- P1: `1.74357 × 10^32 t_P`;
- P2: `1.40969 × 10^32 t_P`;
- P3: `8.53235 × 10^31 t_P`;
- P4: `5.19360 × 10^31 t_P`.

These conversions do not introduce a new physical prediction or a CODATA comparison.

## Two different model layers must not be conflated

**Figure 3 scattering fit:** an empirical parabolic baseline with a Lorentzian dip. Its `t_sc` and `σ_sc` values above are fitted descriptors.

**Supplementary Note 6 rotational-saturation toy model:** a separate model uses, under its stated approximations,

`dθ/dt = B ρ(r0,t) / d(t)^2`  
`dρ/dt = A exp[-(t-t0)^2/q^2] - γρ`.

Its stated parameters include `q = 2 ps`, `d0 = 15.6 μm`, `v = 0.04 μm/ps`, and `γ = 0.2 ps^-1`. This is not the Figure 3 scattering fit and must not be used as if it were a fitted density trace for P1-P4.

The article's numerical study identifies photonic kinetic energy, intrinsic excitonic nonlinearity, and Rabi coupling as the combination producing the spiral vortex channels; it reports that removing losses, inter-spin interaction, or spin-orbit coupling still leaves the qualitative channeling. This is a model-specific decomposition, not a universal vortex law.

The toy-model rate gives `τ_γ = 1/γ = 5 ps`. That numerical timescale matches the article's bare photon lifetime (5–6 ps) more closely than its stated lower-polariton lifetime (10–12 ps) or effective population lifetime (about 25 ps). This is not declared an error: the model may be using a bare-photon loss parameter. But the text labels `γ` as the lower-polariton decay rate, so the mapping between the simplified rate and the measured/effective lifetimes needs clarification.

## Density-time confounding in an apparent distance law

Under the toy model's conditional relation `ω(t) = dθ/dt = Bρ(t)d(t)^(-2)`, with constant `B` and positive differentiable `ρ,d`,

`d ln(ω) / d ln(d) = -2 + d ln(ρ) / d ln(d)`.

Therefore a slope measured in a plot of `ω` against `d` along a time-evolving trajectory is not automatically a spatial interaction exponent. It contains the density evolution along that trajectory. The observed separation is non-monotonic (approach and rebound) while the polariton population decays; projecting `(t,d,ρ,ω)` to `(d,ω)` can therefore merge distinct times and distinct density states at the same separation.

The authors themselves attribute the faster-than-`1/d^2` decay to the decaying density. They also caution that, under the non-equilibrium conditions, the apparent effective potential cannot straightforwardly be identified with a genuine pairwise potential. The additional statistical requirement is to split approach and rebound branches and condition on measured local density before assigning a distance exponent. Without the raw `ρ(r0,t)`, phase maps, and covariance, that branch-conditioned test cannot be performed.

## Formalization status

The conditional information-loss principle already exists in Kestrel's `KestrelProjectedIncidence.lean`: a deterministic downstream readout cannot recover distinctions collapsed by an upstream non-injective map. The relevant module compiled in the PR #873 Actions run, but the overall workflow failed in a separate `KestrelKelvinVortexReadout.lean` module. The result is not a green full-PR build and is not a physical proof about this particular experiment.

The density-conditioned logarithmic-slope identity is a new formalization candidate. It was checked symbolically with SymPy, but no Lean module was created or run in this turn. Local Lean/Lake/Elan and a repository checkout were absent; the existing Code Grurple hold also argues against opening or modifying a research branch. **LEAN_NOT_RUN** for this new identity.

## H(s)H relevance and limits

This experiment supplies a standard-physics example of a driven responsive medium with finite vortex cores, phase-singularity trajectories, density-dependent rotation, and non-equilibrium scattering. It provides a measurement-map comparator and a warning against treating an apparent effective attraction as a static pair potential.

It does not establish:
- a BEC ground-state vacuum;
- Kelvin vortices in the H(s)H medium;
- a 4D filament, timesheet, or responsive-vacuum equivalence;
- a universal rope-like or vortex interaction law;
- any H(s)H observable prediction.

The relevant H(s)H source statements about a necessary medium/Kelvin-vortex layer remain Nathan Direct proposals. The polariton experiment is an external standard-physics comparator only.

## Data needed for a genuine independent test

1. Raw time-resolved holograms or complex-field maps for each pump population.
2. Per-shot or per-ensemble identifiers and the averaging procedure.
3. Calibrated instrument response function and temporal point-spread function.
4. Local density `ρ(r0,t)` synchronized with `d(t)` and `θ(t)`.
5. Fit covariance and uncertainty for `t_sc`, `σ_sc`, and the baseline terms.
6. Separate approach/rebound branch fits and a held-out pump-power test.

Until those are available, the correct status is **PUBLISHED-MEASUREMENT SOURCE / FIT-DERIVED CENTRAL VALUES / NO RAW-DATA REANALYSIS / NO H(s)H PREDICTION**.

## Reproducibility code

```python
import math

c = 299_792_458.0
h = 6.626_070_15e-34
hbar = h / (2 * math.pi)
G = 6.67430e-11                 # CODATA 2022
tP = math.sqrt(hbar * G / c**5)

resolution_ps = 4.0
cases = [
    ("P1", 48_000, 3.6, 4.7),
    ("P2", 96_000, 1.7, 3.8),
    ("P3", 230_000, -0.2, 2.3),
    ("P4", 460_000, -1.2, 1.4),
]

print("tP_s =", tP)
for label, population, t_sc_ps, sigma_ps in cases:
    fwhm_ps = 2 * sigma_ps
    print(label, population,
          "t_sc/tP =", t_sc_ps * 1e-12 / tP,
          "FWHM/tP =", fwhm_ps * 1e-12 / tP,
          "FWHM/resolution =", fwhm_ps / resolution_ps)
```

## Sources

- Dominici et al. (2018), *Nature Communications* 9, 1467, DOI `10.1038/s41467-018-03736-5`.
- Dominici et al. (2018), Supplementary Information, especially Notes 1 and 6.
- NIST/CODATA 2022 recommended values, including the Newtonian constant of gravitation.
- Existing HsH cross-reading: issue #1149, “Kelvin-vortex, BEC core response, and Aharonov–Bohm holonomy cross-reading.”
- Existing conditional information-loss formalization: HsH PR #873, `KestrelProjectedIncidence.lean`.

**Classification:** primary experimental article / published fit outputs / assistant-derived arithmetic and conditional identity / standard CODATA unit conversion / no independent measurement / no theory promotion.
