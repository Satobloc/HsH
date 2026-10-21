# Addendum 01 | Angular-temporal correlations in hypothetical geometric stellar noise
**Companion to:** *Projected Toroidal Geometry and Testable Angular Statistics for Transient Stellar Visibility* (SANDBOX R0)
**Date:** 2026-10-21
**Authoring:** Meridian with Nathan McKnight
**Status:** SANDBOX ADDENDUM; mathematical model, not an observational detection or a Cruller-derived physical amplitude

## Research motivation
Nathan pointed out that rapidly varying small-scale optical deformations might appear as *noise* rather than selected vanishing-star events. The testable possibility is not generic increased noise but statistically distinctive covariance between sightlines, as a function of angular separation, displacement direction and time lag. The previously hand-rotated corrugated surface did not arise from causal null-ray transport; it supplies intuition, not evidence that this particular signal exists.

## Minimal frozen-screen construction
Let star i have angular tangent-plane coordinate theta_i, a foreground distortion field G(x) a distance D from the observer, and transverse drift velocity v. Define fractional geometric residual g_i(t)=G(D theta_i-v t). Assume stationary spatial Gaussian covariance E[G(x)G(y)]=A² exp[-|x-y|²/(2L²)], with amplitude A and correlation length L. Then the **exact conditional** cross-covariance is

C_ij(tau) = A² exp[-|D(theta_i-theta_j)+v tau|²/(2L²)].

The lag sign depends on the adopted definition of C_ij. Its maximizing lag is tau_peak=-D (delta theta·v)/|v|². The peak is suppressed by transverse separation exp[-D² delta theta_perp²/(2L²)]. Thus correlated fluctuations travel across the sky if the screen is effectively frozen.

At a single sightline, tau_c=L/|v| and angular coherence theta_c=L/D, so theta_c=|v| tau_c/D. Under Fourier convention S(f)=integral C(tau) exp[-2pi i f tau] d tau, single-sightline two-sided spectral density is
S(f)=A² sqrt(2pi) tau_c exp[-2pi² f² tau_c²].
This smooth spectrum has NO compulsory oscillation peak and no intrinsic chirality. Neither Gaussianity nor frozen advection is implied by SAT/H(s)H; these are null-test parameterizations.

## Calculated angular/time values
Actual Python calculation was executed for v=30 km/s using parsec and day conversions. Values below are angular coherence scales, NOT stellar position jitter or directly measured sky structures:

| Effective screen distance | 1-day timescale | 10-day | 365-day |
|---|---:|---:|---:|
| 1 pc | 0.0173264 arcsec | 0.1732645 arcsec | 6.3241542 arcsec |
| 100 pc | 0.000173264 arcsec | 0.00173264 arcsec | 0.0632415 arcsec |
| 1000 pc | 0.0000173264 arcsec | 0.000173264 arcsec | 0.00632415 arcsec |

For a simple foreground screen, fast variability at large screen distance implies extremely small angular coherence; degree-scale, day-scale coherent variability cannot simultaneously fit such an ordinary 30 km/s screen. Coherent global distortion could behave differently and must be modeled separately.

## Discriminating observation and systematic controls
1. Fit per-epoch flux residuals after stellar variability, magnitude and uncertainty normalization. Check astrometric residuals, passbands, seeing, airmass and detector positions.
2. Measure pairwise lag covariance as a function of angular separation parallel and perpendicular to candidate sky drift.
3. Preserve actual timestamps and Rubin visit geometry when testing null distributions. Use detector-coordinate and atmospheric controls; those can produce correlated noise.
4. Hold out nights or spatial sectors and preregister drift/scale models before significance testing. Count independent stars/nights, not raw pair counts.
5. Distinguish frozen-screen signatures from observer-local parallax, source-dependent propagation and genuine cosmological coherence.

## Physical gates
The full Cruller calculation must provide a conserved finite-core stress response, 3+1 Lorentzian metric, complete null-ray transfer and total flux. Lensing may *magnify* sources, and local fold-pair loss does not imply disappearance of the entire source. No source-independent A, L, D, v, handedness, Rubin detection rate or observed anomaly follows yet from the proposed geometry.

## Figures and computational provenance
Locally generated: `cruller_noise_scaling_gate.png` and `cruller_noise_scaling_gate.svg`; plotted via Python with SciPy constants. They were not uploaded to the repository in this addendum operation. The mathematical numbers are reproduced above and are independent of any published site rendering.

## Relation to parent paper
This addendum proposes a **continuous-spectrum precursor/test** to the parent paper's rarer disappearance and return catalog test. It adds a time-lagged angular covariance observable and a falsification scale. It does not revise the parent paper's status and requires review before being presented as a derived cosmological prediction.
