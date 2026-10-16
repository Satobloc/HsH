# Hale relay: finite-sample profile coverage under clustered calibration

**Status:** GEN/DERIVED statistical sandbox with an EXECUTED seeded Monte Carlo audit. The HMM and calibration mechanisms are stipulated. This is not a physical SAT/H(s)H inference.

## 1. Question and inherited model

The inherited result showed that persistence can identify hidden-sign bias `p` separately from emission error `e`, while independent labeled calibration sharpens the likelihood. Fisher curvature and a profile interval from one realized sample do not establish finite-sample coverage. This audit asks whether the nominal 95% profile-likelihood interval for `p` still covers when calibration errors are clustered.

Hidden signs `S_t` and observations `Y_t` lie in `{-1,+1}`. With known persistence parameter `alpha`,

`P(S_t=+1 | S_(t-1)=+1) = 1-alpha(1-p)`,

`P(S_t=+1 | S_(t-1)=-1) = alpha p`,

and `P(Y_t != S_t)=e`.

The fixture fixes

`p=0.70`, `e=0.10`, `alpha=0.50`, track length `n=80`, calibration size `M=24`, and calibration ICC `rho=0.20`.

Treating `alpha` and `rho` as known narrows the question to finite-sample inference for `(p,e)`; it does not claim they are known in an empirical application.

## 2. Three calibration designs

The independent control is

`K ~ Binomial(M,e)`.

For clustered designs define

`phi=(1-rho)/rho=4`, `a=e phi`, `b=(1-e) phi`.

For a cluster of size `s`, draw `U~Beta(a,b)` and then `K_g|U~Binomial(s,U)`. The marginal cluster count is beta-binomial:

`q_s(k|e)=C(s,k) B(k+a,s-k+b)/B(a,b)`.

Two clustered designs were tested:

- **independent sessions:** four independent clusters of size six. Only their total count is retained, so its correct likelihood is the four-fold convolution `q_6^{*4}(K|e)`;
- **global shared latent:** one cluster of size 24, with correct likelihood `q_24(K|e)`.

Both have the same marginal error rate and ICC. Their count variances differ:

`Var(K)=M e(1-e)[1+(s-1)rho]`.

The design effects are therefore 2 for six-trial sessions and 5.6 for one globally shared 24-trial latent.

## 3. Profile-likelihood coverage test

The scaled forward recursion supplies the ordered-track likelihood. The total log likelihood is

`ell(p,e)=ell_HMM(p,e)+ell_cal(e)`.

For every replicate, compute the unconstrained maximum `ell_hat` and the maximum `ell_ptrue` with `p` fixed at 0.70. The nominal profile interval contains the true value exactly when

`LR_true = 2(ell_hat-ell_ptrue) <= chi2_1(.95) = 3.841458821`.

This membership test avoids calculating thousands of interval endpoints but is identical to checking whether each likelihood-ratio interval contains `p_true`.

Five analysis combinations use the same 1,200 seeded HMM tracks:

1. iid calibration analyzed with the binomial likelihood;
2. session-clustered calibration analyzed naively as binomial;
3. the same session data analyzed with the correct convolution likelihood;
4. globally shared calibration analyzed naively as binomial;
5. the same global data analyzed with the correct beta-binomial likelihood.

Monte Carlo coverage uncertainty is reported with 95% Wilson intervals. It is simulation uncertainty, not parameter uncertainty in an individual experiment.

## 4. Executed results

| Generative calibration | Analysis likelihood | Coverage | 95% Wilson interval | Median LR | Empirical LR 95th percentile |
|---|---|---:|---:|---:|---:|
| iid | binomial | 0.952500 | [0.938954, 0.963158] | 0.439358 | 3.774099 |
| session clusters | binomial (naive) | 0.949167 | [0.935243, 0.960224] | 0.460868 | 3.849242 |
| session clusters | correct convolution | 0.950000 | [0.936169, 0.960959] | 0.441277 | 3.811488 |
| global latent | binomial (naive) | 0.935833 | [0.920530, 0.948355] | 0.484549 | 4.298330 |
| global latent | correct beta-binomial | 0.948333 | [0.934317, 0.959488] | 0.475266 | 3.891088 |

The iid control reproduces nominal coverage. Session-local clustering has little effect in this fixture: the naive and correct estimates differ by only 0.000833, well inside Monte Carlo uncertainty. The ordered persistent track already contains information about `e`, so the calibration count is not the sole identification channel.

The globally shared latent is materially different. Naive coverage is 0.935833 and its Wilson upper bound, 0.948355, is below 0.95. Its empirical LR 95th percentile is 4.298330, above the assumed chi-square cutoff. Using the correct known-ICC beta-binomial likelihood raises coverage to 0.948333 and lowers the LR 95th percentile to 3.891088. The latter small excess over 3.841459 is compatible with finite-sample and Monte Carlo error; this experiment does not establish exact coverage.

The simulated calibration-count variances were checked against the analytic design-effect values:

| Design | Empirical variance | Theoretical variance | Ratio |
|---|---:|---:|---:|
| iid | 2.223466 | 2.160000 | 1.029382 |
| session | 3.925160 | 4.320000 | 0.908602 |
| global | 12.357066 | 12.096000 | 1.021583 |

## 5. Negative controls and limits

- The iid design is the zero-clustering control and retains nominal coverage.
- Reanalyzing exactly the same clustered observations with their correct likelihood isolates likelihood misspecification from random sample differences.
- As `rho -> 0`, `phi -> infinity` and both clustered calibration laws converge to the binomial law.
- As session size `s -> 1`, the independent-session design becomes iid even when the latent-rate parametrization is retained.
- A single global latent maximizes the declared design effect for fixed `M` and `rho`; it is not equivalent to several refreshed sessions.
- Coverage is not proven exact: 1,200 replicates give percent-level Monte Carlo uncertainty, and the chi-square profile cutoff is itself asymptotic.
- `alpha` and `rho` were fixed at their true values. Estimating them adds nuisance uncertainty and requires a separate coverage calculation.

## 6. Executed console output

```text
truth p=0.7 e=0.1 alpha=0.5 n=80 m=24 rho=0.2
reps=1200 seed=202610161436 chi2_cutoff=3.841458821
design=iid     likelihood=naive   coverage=0.952500 wilson95=[0.938954,0.963158] medianLR=0.439358 q95LR=3.774099
design=session likelihood=naive   coverage=0.949167 wilson95=[0.935243,0.960224] medianLR=0.460868 q95LR=3.849242
design=session likelihood=session coverage=0.950000 wilson95=[0.936169,0.960959] medianLR=0.441277 q95LR=3.811488
design=global  likelihood=naive   coverage=0.935833 wilson95=[0.920530,0.948355] medianLR=0.484549 q95LR=4.298330
design=global  likelihood=global  coverage=0.948333 wilson95=[0.934317,0.959488] medianLR=0.475266 q95LR=3.891088
count_variance design=iid     empirical=2.223466 theory=2.160000 ratio=1.029382
count_variance design=session empirical=3.925160 theory=4.320000 ratio=0.908602
count_variance design=global  empirical=12.357066 theory=12.096000 ratio=1.021583
ALL_CHECKS_PASSED
```

## 7. Full executable Python 3 source

```python
#!/usr/bin/env python3
"""Finite-sample profile-LR coverage under clustered calibration.

GEN/DERIVED statistical sandbox. The hidden-track persistence alpha and the
calibration ICC are treated as known. Coverage is estimated by seeded Monte
Carlo and reported with Wilson binomial intervals.
"""

from __future__ import annotations

import math
import numpy as np
from scipy.optimize import minimize, minimize_scalar
from scipy.special import betaln, gammaln
from scipy.stats import chi2

P_TRUE = 0.70
E_TRUE = 0.10
ALPHA = 0.50
N_TRACK = 80
M_CAL = 24
SESSION_SIZE = 6
RHO = 0.20
REPS = 1200
SEED = 202610161436
CUTOFF = float(chi2.ppf(0.95, 1))
BOUNDS = ((0.5001, 0.9999), (0.001, 0.499))


def simulate_track(rng: np.random.Generator) -> np.ndarray:
    reset = rng.random(N_TRACK) < ALPHA
    reset[0] = True
    draws = np.where(rng.random(N_TRACK) < P_TRUE, 1, -1).astype(np.int8)
    last = np.maximum.accumulate(np.where(reset, np.arange(N_TRACK), 0))
    hidden = draws[last]
    flips = rng.random(N_TRACK) < E_TRUE
    return hidden * np.where(flips, -1, 1)


def simulate_calibration(rng: np.random.Generator, design: str) -> int:
    if design == "iid":
        return int(rng.binomial(M_CAL, E_TRUE))
    a, b = E_TRUE * (1.0 - RHO) / RHO, (1.0 - E_TRUE) * (1.0 - RHO) / RHO
    if design == "session":
        rates = rng.beta(a, b, M_CAL // SESSION_SIZE)
        return int(sum(rng.binomial(SESSION_SIZE, rates)))
    if design == "global":
        rate = float(rng.beta(a, b))
        return int(rng.binomial(M_CAL, rate))
    raise ValueError(design)


def hmm_loglike(y: np.ndarray, p: float, e: float) -> float:
    if not (BOUNDS[0][0] <= p <= BOUNDS[0][1] and BOUNDS[1][0] <= e <= BOUNDS[1][1]):
        return -math.inf
    tpp = 1.0 - ALPHA * (1.0 - p)
    tpm = ALPHA * (1.0 - p)
    tmp = ALPHA * p
    tmm = 1.0 - ALPHA * p
    if y[0] == 1:
        fp, fm = p * (1.0 - e), (1.0 - p) * e
    else:
        fp, fm = p * e, (1.0 - p) * (1.0 - e)
    scale = fp + fm
    fp, fm = fp / scale, fm / scale
    ll = math.log(scale)
    for obs in y[1:]:
        pp, pm = fp * tpp + fm * tmp, fp * tpm + fm * tmm
        if obs == 1:
            fp, fm = pp * (1.0 - e), pm * e
        else:
            fp, fm = pp * e, pm * (1.0 - e)
        scale = fp + fm
        fp, fm = fp / scale, fm / scale
        ll += math.log(scale)
    return ll


def log_binomial_pmf(k: int, m: int, e: float) -> float:
    return (gammaln(m + 1) - gammaln(k + 1) - gammaln(m - k + 1)
            + k * math.log(e) + (m - k) * math.log1p(-e))


def beta_binomial_vector(size: int, e: float) -> np.ndarray:
    phi = (1.0 - RHO) / RHO
    a, b = e * phi, (1.0 - e) * phi
    k = np.arange(size + 1)
    logp = (gammaln(size + 1) - gammaln(k + 1) - gammaln(size - k + 1)
            + betaln(k + a, size - k + b) - betaln(a, b))
    return np.exp(logp)


def log_calibration_pmf(k: int, e: float, likelihood: str) -> float:
    if likelihood == "naive":
        return log_binomial_pmf(k, M_CAL, e)
    if likelihood == "session":
        one = beta_binomial_vector(SESSION_SIZE, e)
        pmf = np.array([1.0])
        for _ in range(M_CAL // SESSION_SIZE):
            pmf = np.convolve(pmf, one)
        return math.log(float(pmf[k]))
    if likelihood == "global":
        return math.log(float(beta_binomial_vector(M_CAL, e)[k]))
    raise ValueError(likelihood)


def total_loglike(y: np.ndarray, k: int, p: float, e: float, likelihood: str) -> float:
    return hmm_loglike(y, p, e) + log_calibration_pmf(k, e, likelihood)


def lr_at_truth(y: np.ndarray, k: int, likelihood: str) -> float:
    starts = ((P_TRUE, E_TRUE), (0.65, 0.05), (0.78, 0.16))
    best = None
    for start in starts:
        fit = minimize(
            lambda x: -total_loglike(y, k, float(x[0]), float(x[1]), likelihood),
            np.asarray(start), method="L-BFGS-B", bounds=BOUNDS,
            options={"ftol": 2e-11, "gtol": 1e-7, "maxiter": 250},
        )
        if fit.success and (best is None or fit.fun < best.fun):
            best = fit
    if best is None:
        raise RuntimeError("full likelihood fit failed")
    prof = minimize_scalar(
        lambda e: -total_loglike(y, k, P_TRUE, float(e), likelihood),
        bounds=BOUNDS[1], method="bounded", options={"xatol": 2e-9},
    )
    if not prof.success:
        raise RuntimeError("profile fit failed")
    return max(0.0, 2.0 * (-float(best.fun) + float(prof.fun)))


def wilson(success: int, total: int, z: float = 1.959963984540054) -> tuple[float, float]:
    phat = success / total
    den = 1.0 + z * z / total
    center = (phat + z * z / (2.0 * total)) / den
    half = z * math.sqrt(phat * (1.0 - phat) / total + z * z / (4.0 * total**2)) / den
    return center - half, center + half


def run_case(design: str, likelihood: str, tracks, counts):
    lrs = np.array([lr_at_truth(y, k, likelihood) for y, k in zip(tracks, counts)])
    covered = int(np.count_nonzero(lrs <= CUTOFF))
    lo, hi = wilson(covered, REPS)
    return covered / REPS, lo, hi, float(np.median(lrs)), float(np.quantile(lrs, 0.95))


def main() -> None:
    rng = np.random.default_rng(SEED)
    tracks = [simulate_track(rng) for _ in range(REPS)]
    counts = {d: [simulate_calibration(rng, d) for _ in range(REPS)]
              for d in ("iid", "session", "global")}
    cases = (
        ("iid", "naive"),
        ("session", "naive"),
        ("session", "session"),
        ("global", "naive"),
        ("global", "global"),
    )
    print(f"truth p={P_TRUE} e={E_TRUE} alpha={ALPHA} n={N_TRACK} m={M_CAL} rho={RHO}")
    print(f"reps={REPS} seed={SEED} chi2_cutoff={CUTOFF:.9f}")
    results = {}
    for design, likelihood in cases:
        result = run_case(design, likelihood, tracks, counts[design])
        results[(design, likelihood)] = result
        coverage, lo, hi, median_lr, q95_lr = result
        print(f"design={design:7s} likelihood={likelihood:7s} coverage={coverage:.6f} "
              f"wilson95=[{lo:.6f},{hi:.6f}] medianLR={median_lr:.6f} q95LR={q95_lr:.6f}")

    # Calibration-count variance checks against the declared design effects.
    base = M_CAL * E_TRUE * (1.0 - E_TRUE)
    for design in ("iid", "session", "global"):
        empirical = float(np.var(counts[design], ddof=0))
        de = 1.0 if design == "iid" else 1.0 + ((SESSION_SIZE if design == "session" else M_CAL) - 1.0) * RHO
        print(f"count_variance design={design:7s} empirical={empirical:.6f} theory={base*de:.6f} ratio={empirical/(base*de):.6f}")

    # Directional controls: naive clustered analysis must be worse than its aware counterpart.
    assert results[("session", "naive")][0] < results[("session", "session")][0]
    assert results[("global", "naive")][0] < results[("global", "global")][0]
    assert results[("global", "naive")][4] > CUTOFF
    assert results[("global", "global")][4] < results[("global", "naive")][4]
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```

## 8. Bounded conclusion

For this persistent HMM, refreshing the calibration latent across four sessions largely protects nominal profile coverage even when a naive binomial likelihood is used. Treating all 24 calibration trials as if they were independent when they actually share one latent error rate produces detectable undercoverage. The operational requirement is therefore not merely to report calibration sample size: preserve session boundaries, state the ICC model, and use the corresponding marginal likelihood. This conclusion is conditional on the stipulated HMM, known `alpha`, known `rho`, and the declared beta family.
