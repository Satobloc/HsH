# Run 072 — Raw linear-recurrence estimator negative control

**Status:** SANDBOX / CLAIMED numerical benchmark / estimator failure retained  
**Date:** 2026-09-20 09:30 -04:00

## Question
Can a global curve-only linear recurrence replace the noise-sensitive pointwise derivative-moment decoder on the identical noisy 4D double-rotation samples used in Run 071?

## Model and exact recurrence
For sampled coordinates of the constant double rotation with rates `w,v` and spacing `dt`, every coordinate is a linear combination of modes with roots `exp(+-i w dt), exp(+-i v dt)`. Therefore each coordinate obeys

`c[n+4] - s1 c[n+3] + s2 c[n+2] - s1 c[n+1] + c[n] = 0`,

with

`s1 = 2(cos(w dt)+cos(v dt))`,

`s2 = 2 + 4 cos(w dt) cos(v dt)`.

The two cosines are roots of

`q^2 - (s1/2) q + (s2-2)/4 = 0`.

This is a curve-only constant-SO(4)-invariant rate representation when the recurrence coefficients are recovered exactly.

## Benchmark
Same primitive model as Run 071: `a=1.2`, `b=0.65`, `w=1.1`, 161 samples on `[-2,2]`, `dt=0.025`, iid coordinate Gaussian noise `sigma=1e-4`. For each gap `w-v = 0.1, 0.03, 0.01, 0.003`, 200 trials were run. A naive global ordinary least-squares fit estimated `(s1,s2)` jointly from all four coordinates.

Median relative separation errors were catastrophic: approximately `886`, `3027`, `9082`, and `30267` respectively. All trials returned numerical roots, so a mere validity count concealed the failure.

## Diagnostic
The exact/noiseless recurrence decoder works. At gap `0.1` it returned frequencies approximately `[1.00000002, 1.09999998]`; at gap `0.03`, `[1.07000002, 1.09999998]`.

The failure appears when noisy samples enter both sides of the regression. Example at gap `0.1`:

- true `(s1,s2) = (3.9986188302, 5.9972381330)`;
- one noisy OLS realization gave `(0.7026160221, -0.5923720838)`;
- decoded rates became approximately `[1.07837, 91.04734]`.

This is an errors-in-variables / near-collinearity failure of the naive OLS implementation, not a failure of the exact recurrence identity. With `dt=0.025`, the physically relevant roots are extremely near unity and the regression columns are strongly dependent; coordinate noise corrupts predictors as well as response.

## Result
Run 071's next cursor produced a useful negative control: replacing local third-derivative estimation by a naive global recurrence is not automatically a robustness improvement. Exact compact representations can still be practically poor acquisition coordinates.

Do not promote a rate-resolution result from this OLS estimator. Retain the exact recurrence as a candidate representation and repair the estimator before comparison to Gram fitting.

## Next cursor
Use a noise-aware recurrence estimator rather than OLS: total least squares / structured low-rank Hankel-SVD (matrix-pencil/ESPRIT-like internal construction), with the same coordinate samples and no frame/director information. First demand recovery of the exact two-rate spectrum away from collision under `sigma=1e-4`; only then compare model-selection boundaries against Run 071 Gram results.

No external literature, PRIOR_ART, nLab, quarantine, Kerr, or Kelvin material was used.