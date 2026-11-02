# M87* 2017 Fourier-visibility and closure-phase audit

**Result:** 51,119 calibrated visibility rows from the public EHT 2017 M87* release were processed. The data show a broad low-correlated-flux region around 3.25–4.0 Gλ and a noise-limited high-baseline edge near 8.3 Gλ. Two fixed station triangles show markedly different closure-phase distributions. This supports a phase-preserving, two-dimensional measurement gate; it does not constitute an H(s)H prediction or validation.

## Data and provenance

Public data repository: https://github.com/eventhorizontelescope/2019-D01-01

Product: HOPS network-calibrated Stokes-I CSVs, observing days 095, 096, 100, 101 (2017 April 5, 6, 10, 11), low/high bands. The eight CSV files contain 51,119 rows total. Each row supplies UTC time, directed station pair, U/V baseline coordinates in wavelengths, visibility amplitude in Jy, phase in degrees, and amplitude uncertainty in Jy.

The exact eight Git blob SHA-1 identities are recorded in the accompanying machine-readable snapshot.

## Method

For each row:

\[
\rho=\frac{\sqrt{u^2+v^2}}{10^9}\quad\mathrm{G}\lambda.
\]

The diagnostic amplitude correction is:

\[
A_{\rm d}=\sqrt{\max(A^2-\sigma_A^2,0)}.
\]

This is an approximate positive-noise-bias correction, not a full Rice likelihood. Radial summaries are medians of individual baseline amplitudes in 0.25 Gλ bins, not complex-visibility averages and not a model fit.

For a complete directed station triangle \(A\to B\to C\to A\), closure phase is:

\[
\Psi_{ABC}=\operatorname{wrap}(\phi_{AB}+\phi_{BC}+\phi_{CA}).
\]

The closure-phase calculation matches exact time strings and reverses the sign of a phase when a stored baseline must be traversed in the opposite direction. Common-triangle summaries use minimum baseline SNR ≥5.

## Results

### Radial amplitude

| Baseline bin (Gλ) | Rows | Median raw amplitude (Jy) | Median debiased diagnostic (Jy) | Median amplitude uncertainty (Jy) |
|---|---:|---:|---:|---:|
| 0.00–0.25 | 5,496 | 1.1412 | 1.1399 | 0.00441 |
| 3.25–3.50 | 2,664 | 0.06734 | 0.04656 | 0.04899 |
| 3.50–3.75 | 1,646 | 0.06058 | 0.04884 | 0.02753 |
| 3.75–4.00 | 1,722 | 0.04089 | 0.03695 | 0.00496 |
| 4.00–4.25 | 5,644 | 0.05728 | 0.05441 | 0.02036 |
| 8.00–8.25 | 515 | 0.08315 | 0.03572 | 0.07760 |
| 8.25–8.50 | 1,021 | 0.08492 | 0.03065 | 0.08222 |

The first low-correlated-flux region is broad across approximately 3.25–4.0 Gλ. This radial summary does not independently locate a unique first null at 3.4 Gλ because it averages over baseline orientation and includes bins with large amplitude uncertainty.

The data end at approximately 8.33 Gλ. In the 8.25–8.50 Gλ bin, the median amplitude is comparable to the median uncertainty and there is no post-null recovery coverage. The second published null near 8.3 Gλ is therefore edge-censored and noise-limited in this simple radial summary.

### Closure phase

For the common triangle AA–AZ–LM, the median absolute closure phase is approximately 42–57° across the four observing days and two bands. For AA–JC–SM, it is approximately 4–8°. These are descriptive summaries, not significance tests. The triangles sample different uv coverage and are not a controlled pairwise comparison.

One directly inspectable measured sample comes from the 2017 April 5 high-band file:

- File: `csv/SR1_M87_2017_095_hi_hops_netcal_StokesI.csv`
- Git blob: `d6cac32d27a6877ca0753574eae07912c143ce8e`
- Header: MJD 57848, 229.0707 GHz
- Time column: `03.60138881`
- Directed triangle: AA→AZ→LM→AA
- Stored phases: AA→AZ = −43.3539°, AZ→LM = −44.3824°, AA→LM = −118.2559°
- The final baseline is reversed for the triangle, contributing +118.2559°.
- Derived closure phase: **30.5196°**
- Baseline SNRs: 21.77, 10.30, 26.79.

This is a measured sample, not a fit or a physical prediction.

## Measurement-architecture implication

A scalar ring diameter or radial amplitude profile is not a sufficient readout of a 3D geometric construction. The external standard measurement chain is:

\[
\text{spacetime/geometry}
\rightarrow
\text{null propagation and radiative transfer}
\rightarrow
I_\nu(\alpha,\beta)
\rightarrow
V(u,v,t)
\rightarrow
\{\lvert V\rvert,\phi,\text{closure phase}\}.
\]

A proposed H(s)H geometry-to-observable map should predict complex visibility and closure phase on held-out baselines and times, not merely a reconstructed ring diameter. The 2017 Stokes-I release cannot test polarization-only twist signatures.

## Limits

- This is a measured-data audit of a public EHT product, not a fit of an H(s)H model.
- No Kerr ray-tracing or GRMHD model was run.
- No worldtube thickness, twist, contact surface, or force law was inferred.
- The radial debiasing is approximate and does not replace a full visibility likelihood.
- The closure-phase summaries are descriptive; no full covariance or significance test is claimed.
- The data release is Stokes I only.
- No SAT-O or Blockwave equation is changed, and no BEDROCK theory promotion is proposed.

## References

- EHT Collaboration, 2019, *First M87 Event Horizon Telescope Results. I. The Shadow of the Supermassive Black Hole*, ApJL 875, L1. https://doi.org/10.3847/2041-8213/ab0ec7
- EHT Collaboration, 2019, *First M87 Event Horizon Telescope Results. III. Data Processing and Calibration*, ApJL 875, L3. https://doi.org/10.3847/2041-8213/ab0c57
- EHT Collaboration, 2019, *First M87 Event Horizon Telescope Results. IV. Imaging the Central Supermassive Black Hole*, ApJL 875, L4. https://doi.org/10.3847/2041-8213/ab0e85
- EHT 2017 M87* data release: https://github.com/eventhorizontelescope/2019-D01-01
- EHT 2017 M87* polarimetric data release: https://github.com/eventhorizontelescope/2023-D01-01
