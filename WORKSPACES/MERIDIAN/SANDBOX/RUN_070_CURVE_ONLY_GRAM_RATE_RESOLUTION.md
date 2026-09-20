# RUN 070 — Curve-only Gram rate-resolution benchmark

**Status:** SANDBOX / CLAIMED numerical benchmark. Not promoted theory; not a validation verdict.
**Date:** 2026-09-20

## Question
After RUN 069 showed that the full moving-frame connection is not identifiable from curve coordinates alone, can a genuinely curve-only, constant-SO(4)-invariant representation resolve the two rates of the constant double-rotation carrier near equal-rate collapse?

## Primitive and invariant
Use sampled 4D coordinates

`C(t)=(a cos wt, a sin wt, b cos vt, b sin vt)`

with `a=1.2`, `b=0.65`, `w=1.1`. Add independent Gaussian coordinate noise with sigma `1e-4` to 161 samples on `t in [-2,2]`.

The competitor uses only the lagged Gram/autocorrelation kernel

`g(tau)=C(t)·C(t+tau)=a^2 cos(w tau)+b^2 cos(v tau)`.

This is invariant under any constant orthogonal change of the observed 4D coordinates. For each noisy sample set, estimate `g` by averaging dot products at integer lags 0..60, then nonlinear-least-squares fit two nonnegative cosine amplitudes and two positive rates. Three fixed initializations are tried and the smallest residual retained. No frame/director primitive is supplied.

## Numerical stress test
100 noise realizations per gap `Delta=w-v`. Because individual-rate relative error becomes misleading as the two true rates merge, score the recovered **rate separation** `Delta_hat/Delta` and relative separation error `|Delta_hat-Delta|/Delta`.

| true Delta | median Delta_hat/Delta | median relative separation error | 95% relative separation error |
|---:|---:|---:|---:|
| 1e-1 | 0.843 | 0.164 | 0.252 |
| 3e-2 | 0.972 | 0.0413 | 0.115 |
| 1e-2 | 1.006 | 0.238 | ~1.00 |
| 3e-3 | 1.079 | ~1.00 | 2.83 |
| 1e-3 | 0.0106 | ~1.00 | 10.0 |

## Result
The curve-only Gram representation has a clear finite-noise resolution boundary: in this particular sampling/noise/fitting regime, separation recovery becomes unreliable between roughly `Delta=1e-2` and `3e-3`, and by `1e-3` the median fit has effectively merged the rates.

This is useful for RUN 067/068 interpretation. The equal-rate boundary is not merely a pathology of the four-derivative-moment algebra. A completely different curve-only invariant representation also loses the two-rate split under finite noise. The exact location of the numerical boundary is estimator- and observation-window-dependent and is **not** claimed universal.

The `Delta=0.1` fit being worse than `0.03` is a warning that the simple multi-start nonlinear fit has optimization/basin effects; this run is a benchmark prototype, not an estimator-optimality study.

## What this does / does not establish
- Establishes numerically for the stated implementation that a constant-SO(4)-invariant, curve-only Gram channel can estimate the two rates away from collapse and itself develops a finite-noise resolution limit near collision.
- Does not establish that Gram fitting is superior/inferior to the four-moment decoder, because RUN 067 perturbed moments directly whereas this run perturbs primitive coordinate samples. A same-sample comparison remains needed.
- Does not identify a full moving-frame connection; RUN 069's stabilizer ambiguity remains.
- Does not supply physical interpretation.

## Reproducibility recipe
Seed `20260920`; 161 equally spaced samples on `[-2,2]`; coordinate noise sigma `1e-4`; lag set 0..60; nonlinear least squares with bounds amplitudes `[0,4]`, rates `[0.1,4]`; initial rate pairs `(1,1.2)`, `(0.8,1.4)`, `(1.05,1.15)`; 100 trials per gap.

## Next cursor
Run the four-moment and Gram estimators from the **same noisy coordinate samples**, with derivatives for the moment packet estimated by an explicit fixed local/global differentiator. Score separation recovery, not merely individual-rate error, and include a one-mode/null model-selection baseline.