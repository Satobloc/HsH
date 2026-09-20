# RUN 071 — Same-sample curve-only resolution/model-selection benchmark

**Status:** SANDBOX / CLAIMED numerical benchmark  
**Date:** 2026-09-20  
**Lane:** Meridian

## Question

Do the four-moment decoder and lagged-Gram decoder behave similarly when both are estimated from the same noisy 4D coordinate samples, and when does a two-rate description cease to be justified against a one-rate baseline?

## Primitive data

Constant 4D double rotation

`C(t)=(a cos(wt), a sin(wt), b cos(vt), b sin(vt))`

with `a=1.2`, `b=0.65`, `w=1.1`; 161 equally spaced samples on `[-2,2]`; iid Gaussian coordinate noise `sigma=1e-4`; rate gaps `Delta=w-v` in `{0.1,0.03,0.01,0.003}`; 40 independent trials per gap.

No frame/director information is supplied. Both estimators see exactly the same noisy coordinates.

## Estimator A — derivative moments

Estimate `m_k=<||C^(k)||^2>` for `k=0..3`. Derivatives 1..3 use a fixed Savitzky-Golay differentiator (window 41, polynomial degree 7, sample spacing inherited from the grid); 25 samples are trimmed from each edge. Decode the two squared rates with the established four-moment recurrence.

This is intentionally a concrete fixed differentiator rather than an oracle derivative.

## Estimator B — lagged Gram kernel

Estimate `g(tau)=<C(t) dot C(t+tau)>` for lags 0..60. Fit the two-cosine model with bounded nonlinear least squares and three fixed initial rate separations (`0.01,0.04,0.1`). Separately fit a one-cosine model.

Model selection uses BIC on the same 61 lag values. `Delta BIC = BIC_one - BIC_two`; positive values favor the two-rate fit.

## Results

| true Delta | valid moment decodes | median relative separation error, moments | median relative separation error, Gram | median Delta BIC | fraction BIC favoring two rates |
|---:|---:|---:|---:|---:|---:|
| 0.100 | 40/40 | 2.55 | 0.157 | +571.1 | 1.000 |
| 0.030 | 40/40 | 72.7 | 0.0469 | +274.0 | 1.000 |
| 0.010 | 33/40 | 480.6 | 0.227 | +57.0 | 0.825 |
| 0.003 | 24/40 | 1845.6 | 0.999 | -8.19 | 0.325 |

Relative separation error is `|Delta_hat-Delta|/Delta`.

## Interpretation

1. The equal-rate information-loss boundary survives a same-primitive-data comparison. The Gram representation resolves the two rates well at `Delta=0.03`, degrades at `0.01`, and is essentially unresolved by `0.003`; BIC correspondingly changes from strong two-rate preference to median one-rate preference.
2. The local four-derivative moment packet is dramatically less robust under raw coordinate noise with this fixed differentiator. This is not evidence against the exact four-moment identity: it exposes the cost of estimating third derivatives from noisy samples. Run 067's direct-moment perturbation benchmark was therefore optimistic relative to coordinate-level acquisition.
3. The model-selection question is better posed than forcing a two-rate estimate arbitrarily close to collision. At `Delta=0.003`, a large fraction of trials no longer justify the extra mode under this observation/noise/estimator setup.
4. Thresholds are not universal. They depend on observation window, sampling, noise, derivative estimator, lag range, optimizer, and BIC's independence assumptions. Lagged Gram residuals are correlated, so the BIC values are a practical score rather than a fully calibrated statistical likelihood test.

## Failure retained

The moment decoder's very poor same-sample performance is retained rather than repaired away. A later operation may test regularized/global derivative estimation or fit moments indirectly, but that would be a different estimator and should not overwrite this result.

## Provenance / exposure

Generated in Meridian from the established sandbox double-rotation carrier and prior Runs 067–070. No external literature, PRIOR_ART, nLab, or quarantine material used. Current Common controls and math-provenance protocol were reread before work.

## Current status

`CLAIMED` numerical benchmark. No validation/disclaimer promotion.

## Next cursor

Replace pointwise high-order differentiation with a global curve-only spectral/linear-recurrence estimator on the identical noisy samples, and compare its two-mode resolution/model-selection boundary against the Gram fit without supplying frame/director information.