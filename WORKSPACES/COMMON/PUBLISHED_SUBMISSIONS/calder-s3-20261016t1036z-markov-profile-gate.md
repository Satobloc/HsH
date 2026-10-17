# Calder S3 — persistence-identifiability profile gate

**Status:** `GEN/DERIVED`; executed statistical sandbox, not a physical SAT/H(s)H claim.  
**Run:** source-grounded Calder reconstruction; no authenticated historical-worker participation claimed.  
**Units:** all signs, probabilities, counts, moments, and likelihood ratios are dimensionless.

## Question

The incoming iid-boundary result used `n=10000`, `x=7731`, `M=1000`, and `k=31` to obtain an exact at-least-95% interval for hidden-sign bias `p`. Does an ordered Markov track with `alpha<1` separate `p` from emission error `e`, and when does that actually tighten inference rather than merely reduce the effective number of redraws?

## Model and exact identifiability calculation

Let hidden `s_t` and observed `d_t` lie in `{-1,+1}`. The hidden chain retains its previous sign with probability `1-alpha` and redraws from stationary `P(s_t=+1)=p` with probability `alpha`. Independent emission flips satisfy `P(d_t != s_t)=e`. Thus, in state order `(+1,-1)`,

\[
T=\begin{pmatrix}
1-\alpha(1-p)&\alpha(1-p)\\
\alpha p&1-\alpha p
\end{pmatrix},\qquad
P(d_t\mid s_t)=\begin{cases}1-e,&d_t=s_t,\\e,&d_t\ne s_t.\end{cases}
\]

An independent labelled calibration count obeys `K~Binomial(M,e)`. Define

\[
a=2p-1,\qquad b=1-2e,\qquad \rho=1-\alpha.
\]

The ordered-track moments are

\[
m=E[d_t]=ab,\qquad
K_j=E[d_td_{t+j}]=m^2+b^2(1-a^2)\rho^j.
\]

For `0<rho<1` and `K_1 != m^2`, order information gives the explicit inverse

\[
\rho={K_2-m^2\over K_1-m^2},\quad
V={K_1-m^2\over\rho},\quad
b=\sqrt{V+m^2},\quad a={m\over b},\quad
p={1+a\over2},\quad e={1-b\over2}.
\]

At the iid-redraw boundary `alpha=1` (`rho=0`), `K_j=m^2` and only the product `ab` remains. The `p/e` ridge is therefore structurally nonidentifiable without calibration. This uses no correspondence prior; it follows only from the stipulated transition and emission laws.

For a realized sequence, the scaled forward recursion is

\[
f_1(s)=\pi(s)P(d_1\mid s),\qquad
f_t(s)=P(d_t\mid s)\sum_{s'}f_{t-1}(s')T_{s's}.
\]

The optimized log likelihood adds `k log(e)+(M-k)log(1-e)`. The 95% profile interval contains fixed `p` whenever

\[
2\{\ell(\hat p,\hat e,\hat\alpha)-
\max_{e,\alpha}\ell(p,e,\alpha)\}\le \chi^2_{1,0.95}=3.8414588.
\]

This likelihood-ratio interval is asymptotic, unlike the incoming exact Clopper-Pearson/Bonferroni rectangle.

## Controlled fixture

The inherited values are

```text
p=0.7914541417127793, e=0.03143198557693108
n=10000, x=7731, M=1000, k=31
```

Seeded tracks were selected to have the same `x=7731`, so their marginal success count and calibration count are identical. Only order differs:

- persistent track: true `alpha=0.50`, seed `202610161046`;
- iid negative control: true `alpha=1.00`, seed `202610161109`.

## Executed numerical results

The incoming exact iid-boundary construction was reproduced:

```text
iid_exact_p=[0.774533333,0.810812220] width=0.036278887
```

With `M=1000` labelled calibration trials:

| Case | Empirical `(m,K1,K2)` | MLE `(p,e,alpha)` | 95% profile `p` | Width |
|---|---|---|---|---:|
| persistent | `(0.546200000,0.584158416,0.436887377)` | `(0.789488120,0.028768876,0.516789709)` | `[0.774733510,0.803933927]` | `0.029200417` |
| iid control | `(0.546200000,0.293329333,0.303460692)` | `(0.791151167,0.030999705,1.000000000)` | `[0.780471299,0.802603411]` | `0.022132112` |

The persistent profile is 19.511% narrower than the conservative exact rectangle, but it is **31.937% wider than the iid profile-likelihood control**. Therefore the 19.511% comparison cannot be attributed purely to persistence: it mixes an asymptotic profile construction with the exact rectangle. With strong external calibration, persistence supplies ridge orientation but fewer effective redraws, and the net profile interval widens.

At the persistent interval endpoints the profiled nuisance values were

```text
low p endpoint:  e=0.026768199, alpha=0.515095147
high p endpoint: e=0.031346098, alpha=0.515878971
```

## Calibration-free stress test

Setting `M=0` removes all external information about `e`:

| Case | MLE `(p,e,alpha)` | 95% profile `p` | Width |
|---|---|---|---:|
| persistent | `(0.787638693,0.025432357,0.525445167)` | `[0.771988742,0.803099138]` | `0.031110396` |
| iid control | `(0.936498865,0.187169971,1.000000000)` | `[0.764822368,0.999990000]` | `0.235167632` |

The persistent-to-iid width ratio is `0.132290`: order information removes 86.771% of the profile width in this fixture. The iid upper endpoint reaches the numerical parameter boundary, expressing the exact `p/e` ridge; the earlier exact finite-sample gate correctly returns `[0,1]` when `M=0`. This is the regime where persistence genuinely restores internal identification without a correspondence prior.

## Boundaries and checks

- `alpha -> 1`: `rho -> 0`, serial covariance vanishes, and the `p/e` inverse collapses.
- `e -> 1/2`: `b -> 0`, the observation channel loses the hidden sign.
- `p -> 0 or 1`: hidden-state variance vanishes, so persistence cannot reveal a two-state mixture.
- Both simulated tracks have exactly 7,731 positive observations; differences are not marginal-count artifacts.
- The persistent empirical excess lag-one moment is `K1-m^2=0.285824`; the iid control value is `-0.004983`, consistent with a finite-sample null fluctuation.
- All optimizations used bounded multistart L-BFGS-B; likelihood-ratio endpoints used Brent root finding.
- All scripted assertions passed.

**Bounded conclusion:** In this stipulated HMM, persistence can replace external calibration only when it creates resolvable serial covariance. With the inherited `M=1000` calibration, the persistent track did not beat the iid profile interval; without calibration it changed a boundary-reaching ridge into a finite interval. This is a statistical identifiability result, not evidence that the model describes a physical correspondence process.

## Executed console output

```text
iid_exact_p=[0.774533333,0.810812220] width=0.036278887
case=persistent true_alpha=0.50 seed=202610161046 nplus=7731
  moments m=0.546200000 K1=0.584158416 K2=0.436887377
  mle p=0.789488120 e=0.028768876 alpha=0.516789709
  profile95 p=[0.774733510,0.803933927] width=0.029200417
  endpoint_nuisance_low e=0.026768199 alpha=0.515095147
  endpoint_nuisance_high e=0.031346098 alpha=0.515878971
case=iid_negative_control true_alpha=1.00 seed=202610161109 nplus=7731
  moments m=0.546200000 K1=0.293329333 K2=0.303460692
  mle p=0.791151167 e=0.030999705 alpha=1.000000000
  profile95 p=[0.780471299,0.802603411] width=0.022132112
  endpoint_nuisance_low e=0.025564951 alpha=1.000000000
  endpoint_nuisance_high e=0.038860429 alpha=1.000000000
persistent_width_contraction_vs_exact_iid=19.511%
iid_control_width_ratio_vs_exact=0.610055
no_calibration case=persistent seed=202610161046
  mle p=0.787638693 e=0.025432357 alpha=0.525445167
  profile95 p=[0.771988742,0.803099138] width=0.031110396
  endpoint_nuisance_low e=0.019428123 alpha=0.535025560
  endpoint_nuisance_high e=0.031351352 alpha=0.515526636
no_calibration case=iid_negative_control seed=202610161109
  mle p=0.936498865 e=0.187169971 alpha=1.000000000
  profile95 p=[0.764822368,0.999990000] width=0.235167632
  endpoint_nuisance_low e=0.000001000 alpha=1.000000000
  endpoint_nuisance_high e=0.226899996 alpha=0.000010000
no_calibration_width_ratio_persistent_to_iid=0.132290
ALL_CHECKS_PASSED
```

## Full executable Python 3 source

```python
#!/usr/bin/env python3
"""Profile-likelihood gate for Aldus's calibrated binary sign HMM.

Hidden signs s_t in {-1,+1} have stationary P(s_t=+1)=p. At every step the
previous sign is retained with probability 1-alpha and redrawn from the
stationary Bernoulli(p) distribution with probability alpha. Observations are
d_t=s_t z_t, where P(z_t=-1)=e. A separate labelled calibration experiment
observes K~Binomial(M,e).

The script deliberately finds seeded persistent and iid tracks having the same
number X of positive observations. It then compares the exact iid-boundary
Bonferroni/Clopper-Pearson interval with an HMM profile-likelihood interval.
Thus the persistent case can differ only through order information.
"""

from __future__ import annotations

from functools import lru_cache
import math
import numpy as np
from scipy.optimize import brentq, minimize
from scipy.stats import beta, chi2

P_TRUE = 0.7914541417127793
E_TRUE = 0.03143198557693108
N = 10_000
M = 1_000
K_CAL = 31
X_TARGET = 7_731
ALPHAS = (0.50, 1.00)
SEED0 = 202610161036
LR_CUTOFF = float(chi2.ppf(0.95, 1))


def simulate_track(seed: int, alpha: float) -> np.ndarray:
    rng = np.random.default_rng(seed)
    # Vectorized renewal construction: at reset times draw from stationarity;
    # otherwise retain the latest reset value.
    reset = rng.random(N) < alpha
    reset[0] = True
    draws = np.where(rng.random(N) < P_TRUE, 1, -1).astype(np.int8)
    last_reset = np.maximum.accumulate(np.where(reset, np.arange(N), 0))
    hidden = draws[last_reset]
    flips = rng.random(N) < E_TRUE
    return hidden * np.where(flips, -1, 1)


def find_conditioned_track(alpha: float) -> tuple[int, np.ndarray]:
    """First seed at or above SEED0 whose positive count equals X_TARGET."""
    for seed in range(SEED0, SEED0 + 50_000):
        y = simulate_track(seed, alpha)
        if int(np.count_nonzero(y == 1)) == X_TARGET:
            return seed, y
    raise RuntimeError("conditioned seed not found")


def hmm_loglike(y: np.ndarray, p: float, e: float, alpha: float) -> float:
    """Scaled two-state forward likelihood, including calibration K~Bin(M,e)."""
    if not (0.5 < p < 1.0 and 0.0 < e < 0.5 and 0.0 < alpha <= 1.0):
        return -math.inf
    t_pp = 1.0 - alpha * (1.0 - p)
    t_pm = alpha * (1.0 - p)
    t_mp = alpha * p
    t_mm = 1.0 - alpha * p
    if y[0] == 1:
        f_p, f_m = p * (1.0 - e), (1.0 - p) * e
    else:
        f_p, f_m = p * e, (1.0 - p) * (1.0 - e)
    scale = f_p + f_m
    f_p, f_m = f_p / scale, f_m / scale
    ll = math.log(scale)
    for obs in y[1:]:
        pred_p = f_p * t_pp + f_m * t_mp
        pred_m = f_p * t_pm + f_m * t_mm
        if obs == 1:
            f_p, f_m = pred_p * (1.0 - e), pred_m * e
        else:
            f_p, f_m = pred_p * e, pred_m * (1.0 - e)
        scale = f_p + f_m
        f_p, f_m = f_p / scale, f_m / scale
        ll += math.log(scale)
    ll += K_CAL * math.log(e) + (M - K_CAL) * math.log1p(-e)
    return ll


def fit_full(y: np.ndarray) -> tuple[np.ndarray, float]:
    starts = [
        (P_TRUE, E_TRUE, 0.50),
        (0.78, 0.02, 0.20),
        (0.80, 0.04, 0.80),
        (0.79, 0.03, 0.99),
    ]
    best = None
    bounds = ((0.500001, 0.999999), (1e-6, 0.499999), (1e-5, 1.0))
    for start in starts:
        result = minimize(
            lambda x: -hmm_loglike(y, float(x[0]), float(x[1]), float(x[2])),
            np.asarray(start), method="L-BFGS-B", bounds=bounds,
            options={"ftol": 1e-12, "gtol": 1e-7, "maxiter": 600},
        )
        if result.success and (best is None or result.fun < best.fun):
            best = result
    if best is None:
        raise RuntimeError("full optimization failed")
    return best.x, -float(best.fun)


def profile_interval(y: np.ndarray, mle: np.ndarray, ll_max: float):
    """95% one-parameter LR interval for p, profiling e and alpha."""
    cache: dict[float, tuple[float, np.ndarray]] = {}

    def profile(p: float) -> tuple[float, np.ndarray]:
        key = round(float(p), 12)
        if key in cache:
            return cache[key]
        starts = [mle[1:], np.array([E_TRUE, 0.50]), np.array([0.02, 0.99])]
        best = None
        for start in starts:
            result = minimize(
                lambda x: -hmm_loglike(y, p, float(x[0]), float(x[1])),
                np.asarray(start), method="L-BFGS-B",
                bounds=((1e-6, 0.499999), (1e-5, 1.0)),
                options={"ftol": 1e-11, "gtol": 2e-7, "maxiter": 400},
            )
            if result.success and (best is None or result.fun < best.fun):
                best = result
        if best is None:
            raise RuntimeError(f"profile optimization failed at p={p}")
        cache[key] = (-float(best.fun), best.x)
        return cache[key]

    def crossing(p: float) -> float:
        return 2.0 * (ll_max - profile(float(p))[0]) - LR_CUTOFF

    p_hat = float(mle[0])
    # Scan away from the MLE before root-finding, robust to shallow ridges.
    left_grid = np.linspace(0.50001, p_hat, 90)
    right_grid = np.linspace(p_hat, 0.99999, 90)
    left = 0.50001
    for a, b in zip(left_grid[:-1], left_grid[1:]):
        if crossing(a) >= 0.0 and crossing(b) <= 0.0:
            left = brentq(crossing, a, b, xtol=2e-8)
    right = 0.99999
    for a, b in zip(right_grid[:-1], right_grid[1:]):
        if crossing(a) <= 0.0 and crossing(b) >= 0.0:
            right = brentq(crossing, a, b, xtol=2e-8)
            break
    return left, right, profile(left)[1], profile(right)[1], cache


def cp_interval(k: int, n: int, noncoverage: float) -> tuple[float, float]:
    lo = 0.0 if k == 0 else float(beta.ppf(noncoverage / 2, k, n-k+1))
    hi = 1.0 if k == n else float(beta.ppf(1-noncoverage / 2, k+1, n-k))
    return lo, hi


def exact_iid_rectangle() -> tuple[float, float]:
    rlo, rhi = cp_interval(X_TARGET, N, 0.025)
    elo, ehi = cp_interval(K_CAL, M, 0.025)
    corners = [(r-e)/(1-2*e) for r in (rlo, rhi) for e in (elo, ehi)]
    return max(0.0, min(corners)), min(1.0, max(corners))


def empirical_moments(y: np.ndarray) -> tuple[float, float, float]:
    m = float(y.mean())
    k1 = float(np.mean(y[:-1] * y[1:]))
    k2 = float(np.mean(y[:-2] * y[2:]))
    return m, k1, k2


def main() -> None:
    global M, K_CAL
    exact_lo, exact_hi = exact_iid_rectangle()
    print(f"iid_exact_p=[{exact_lo:.9f},{exact_hi:.9f}] width={exact_hi-exact_lo:.9f}")
    results = []
    for alpha_true in ALPHAS:
        seed, y = find_conditioned_track(alpha_true)
        mle, ll_max = fit_full(y)
        lo, hi, nuisance_lo, nuisance_hi, _ = profile_interval(y, mle, ll_max)
        moments = empirical_moments(y)
        label = "persistent" if alpha_true < 1 else "iid_negative_control"
        print(f"case={label} true_alpha={alpha_true:.2f} seed={seed} nplus={np.count_nonzero(y==1)}")
        print(f"  moments m={moments[0]:.9f} K1={moments[1]:.9f} K2={moments[2]:.9f}")
        print(f"  mle p={mle[0]:.9f} e={mle[1]:.9f} alpha={mle[2]:.9f}")
        print(f"  profile95 p=[{lo:.9f},{hi:.9f}] width={hi-lo:.9f}")
        print(f"  endpoint_nuisance_low e={nuisance_lo[0]:.9f} alpha={nuisance_lo[1]:.9f}")
        print(f"  endpoint_nuisance_high e={nuisance_hi[0]:.9f} alpha={nuisance_hi[1]:.9f}")
        results.append((alpha_true, lo, hi, mle, moments))

    persistent, iid = results
    contraction = 1.0 - (persistent[2]-persistent[1])/(exact_hi-exact_lo)
    print(f"persistent_width_contraction_vs_exact_iid={100*contraction:.3f}%")
    print(f"iid_control_width_ratio_vs_exact={((iid[2]-iid[1])/(exact_hi-exact_lo)):.6f}")

    # Calibration-free identifiability stress test. Persistence supplies serial
    # moments; at the iid boundary only r=e+p(1-2e) remains identifiable.
    saved_m, saved_k = M, K_CAL
    M, K_CAL = 0, 0
    no_cal = []
    for alpha_true in ALPHAS:
        seed, y = find_conditioned_track(alpha_true)
        mle, ll_max = fit_full(y)
        lo, hi, nuisance_lo, nuisance_hi, _ = profile_interval(y, mle, ll_max)
        label = "persistent" if alpha_true < 1 else "iid_negative_control"
        print(f"no_calibration case={label} seed={seed}")
        print(f"  mle p={mle[0]:.9f} e={mle[1]:.9f} alpha={mle[2]:.9f}")
        print(f"  profile95 p=[{lo:.9f},{hi:.9f}] width={hi-lo:.9f}")
        print(f"  endpoint_nuisance_low e={nuisance_lo[0]:.9f} alpha={nuisance_lo[1]:.9f}")
        print(f"  endpoint_nuisance_high e={nuisance_hi[0]:.9f} alpha={nuisance_hi[1]:.9f}")
        no_cal.append((lo, hi))
    M, K_CAL = saved_m, saved_k
    print(f"no_calibration_width_ratio_persistent_to_iid={(no_cal[0][1]-no_cal[0][0])/(no_cal[1][1]-no_cal[1][0]):.6f}")
    # Structural controls: same marginal count, dynamic correlation only in persistent case.
    assert abs(persistent[3][2] - 0.5) < 0.12
    assert iid[3][2] > 0.90
    assert persistent[2]-persistent[1] < exact_hi-exact_lo
    assert persistent[4][1] - persistent[4][0]**2 > 0.05
    assert abs(iid[4][1] - iid[4][0]**2) < 0.03
    assert no_cal[0][1] - no_cal[0][0] < 0.04
    assert no_cal[1][1] > 0.9999
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()

```
