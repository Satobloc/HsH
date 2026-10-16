# Tern Rook S3 — optimal clustered anchor/tetrad allocation

**Status:** `GEN/DERIVED` statistical-design sandbox.  
**Executed:** closed-form allocation calculation and Python numerical evaluation.  
**Boundary:** source-grounded Tern Rook controller-lane reconstruction; no authenticated historical-worker participation, source-exposure claim, or SAT/H(s)H physics claim.

## Problem

The incoming Enheduanna result showed that binary-anchor endpoint error contaminates the exposure residual and creates a tetrad

\[
\Delta=A\kappa(d_1c_4-c_1d_4)(d_2c_3-c_2d_3).
\]

Allocate a fixed budget among:

- `N` unlabeled five-variable observations used to estimate the tetrad;
- `m0` labeled `H=0` anchor trials estimating `r0`;
- `m1` labeled `H=1` anchor trials estimating `r1`.

The design must account for clustering in both channels and must not silently treat correlated observations as independent.

## Local endpoint sensitivities

The inherited fixture is

```text
p=.30, q=.38
d=(.61,.54,.50,.44)
c=(.21,-.16,.20,-.15)
r0=.05, r1=.95, t=.90
```

Differentiating the exact tetrad at correct calibration gives

\[
g_0={\partial\Delta\over\partial\epsilon_0}
=-5.001589599920\times10^{-3},\qquad
g_1={\partial\Delta\over\partial\epsilon_1}
=+3.065490399831\times10^{-3}.
\]

Hence

\[
g_0+g_1=-1.936099200089\times10^{-3},
\]

which reproduces the incoming common-offset derivative to `1.003e-13`, while the contrast direction has derivative

\[
-g_0+g_1=8.067079999751\times10^{-3}.
\]

The contrast direction is therefore about 4.17 times more sensitive locally than the common-offset direction.

## Variance model with clustering

For cluster size `s` and intraclass correlation `rho`, use the standard design effect

\[
D(s,\rho)=1+(s-1)\rho.
\]

The incoming null simulations give `SD(Delta)*sqrt(N)` values whose average is

\[
\sigma_\Delta=1.935773373666\times10^{-2}.
\]

Let `Du` and `Dc` be the declared unlabeled and calibration design effects. Independence between the three acquisition channels gives the local variance

\[
\operatorname{Var}(\widehat\Delta)
=\frac{a}{N}+\frac{b_0}{m_0}+\frac{b_1}{m_1},
\]

where

\[
a=\sigma_\Delta^2D_u,
\quad b_0=g_0^2r_0(1-r_0)D_c,
\quad b_1=g_1^2r_1(1-r_1)D_c.
\]

This treats clustering as a declared sampling property. It does not claim that one scalar ICC captures every possible dependence structure.

## Exact optimal allocation

Minimize the variance subject to

\[
N+m_0+m_1=B.
\]

The Lagrange equations require equal marginal variance reduction:

\[
{a\over N^2}={b_0\over m_0^2}={b_1\over m_1^2}.
\]

Therefore

\[
\boxed{
(N,m_0,m_1)
=B\frac{(\sqrt a,\sqrt{b_0},\sqrt{b_1})}
{\sqrt a+\sqrt{b_0}+\sqrt{b_1}}
}
\]

and the minimum variance is

\[
\boxed{
V_{\min}={\left(\sqrt a+\sqrt{b_0}+\sqrt{b_1}\right)^2\over B}.
}
\]

This is the global optimum because each `coefficient/x` term is strictly convex for positive allocation.

## Executed allocation results

For total budget `B=1,000,000` individual observations:

| Scenario | `(Du,Dc)` | Optimal `(N,m0,m1)` fractions | Optimized SD | Equal-split SD | SD reduction |
|---|---:|---:|---:|---:|---:|
| iid | `(1,1)` | `(0.916736761,0.051623208,0.031640031)` | `2.111591306e-5` | `3.360162849e-5` | `37.158%` |
| moderate clusters | `(1.95,2.40)` | `(0.908461556,0.056753835,0.034784609)` | `2.975536376e-5` | `4.694562966e-5` | `36.617%` |
| severe clusters | `(10.90,5.60)` | `(0.938877864,0.037895724,0.023226412)` | `6.807045616e-5` | `1.108190703e-4` | `38.575%` |

The asymmetric endpoint split is necessary even though `r0(1-r0)=r1(1-r1)`: the tetrad is more sensitive to `r0` error because `|g0|>|g1|`.

## Approximate power and required budgets

Using a two-sided normal threshold `1.959964`, the exact noncentralities required for 80% and 90% power are `2.801581787` and `3.241514987`. Signal sizes are the exact population tetrads from the incoming artifact.

| Scenario | Signal | Power at B=1m | Budget for 80% | Budget for 90% |
|---|---|---:|---:|---:|
| iid | common +1 point | `0.139153` | `10,487,453` | `14,039,754` |
| iid | common +2 points | `0.371066` | `2,952,349` | `3,952,365` |
| iid | contrast +4 points | `1.000000` | `127,235` | `170,332` |
| moderate | common +1 point | `0.094173` | `20,824,800` | `27,878,557` |
| moderate | common +2 points | `0.211935` | `5,862,440` | `7,848,160` |
| moderate | contrast +4 points | `0.999849` | `252,649` | `338,226` |
| severe | common +1 point | `0.058290` | `108,985,224` | `145,900,599` |
| severe | common +2 points | `0.079785` | `30,680,694` | `41,072,831` |
| severe | contrast +4 points | `0.683130` | `1,322,219` | `1,770,080` |

These are normal/local-delta design calculations, not finite-sample coverage guarantees. The null tetrad scale was estimated by the preceding seeded multinomial experiments rather than derived analytically. Integer and whole-cluster constraints should round the continuous allocation and then recompute the variance.

## Negative controls and limiting cases

- Equal allocation is strictly worse in all three declared scenarios; optimized SD falls by 36.6–38.6%.
- The three optimized marginal variance reductions agree within `2e-12` relatively, checking the KKT solution.
- Halving the numerical differentiation step changes each endpoint derivative by less than `2e-11`.
- As calibration clustering grows, `sqrt(b0)` and `sqrt(b1)` grow as `sqrt(Dc)`, automatically shifting budget toward labeled trials.
- As unlabeled clustering grows, `sqrt(a)` grows as `sqrt(Du)`, shifting budget toward unlabeled trials to offset their loss of effective sample size.
- If either endpoint is treated as known, its coefficient is zero and its optimal allocation vanishes; that is a different experimental assumption, not a free saving.

## Bounded conclusion

Within this stipulated local variance model, the allocation rule is exact. The dominant practical result is that strong clustering can turn a seemingly easy +4-point contrast test from essentially certain detection into only 68.3% power at one million observations. Small common endpoint offsets remain extremely expensive to detect: under severe clustering, 80% power for a common +1-point offset requires about 109 million observations. A design report that states only nominal sample size, without session size and ICC, is therefore not decision-complete.

## Executed output

```text
sigma_root_N=1.935773373666e-02
endpoint_gradient g0=-5.001589599920e-03 g1=+3.065490399831e-03
common_slope=-1.936099200089e-03
contrast_slope=+8.067079999751e-03
incoming_common_slope_error=1.003e-13
total_budget=1000000
normal_noncentrality power80=2.801581787 power90=3.241514987
scenario=iid DE_unlabelled=1.000000 DE_calibration=1.000000
  fractions N=0.916736761 m0=0.051623208 m1=0.031640031
  counts N=916736.761 m0=51623.208 m1=31640.031
  optimized_sd=2.111591306108e-05 equal_split_sd=3.360162849136e-05 sd_gain=37.158%
  common_1pct signal=1.826745969000e-05 power=0.139153 budget80=10487453 budget90=14039754
  common_2pct signal=3.442939412000e-05 power=0.371066 budget80=2952349 budget90=3952365
  contrast_4pct signal=1.658480340000e-04 power=1.000000 budget80=127235 budget90=170332
scenario=moderate_clusters DE_unlabelled=1.950000 DE_calibration=2.400000
  fractions N=0.908461556 m0=0.056753835 m1=0.034784609
  counts N=908461.556 m0=56753.835 m1=34784.609
  optimized_sd=2.975536375745e-05 equal_split_sd=4.694562966491e-05 sd_gain=36.617%
  common_1pct signal=1.826745969000e-05 power=0.094173 budget80=20824800 budget90=27878557
  common_2pct signal=3.442939412000e-05 power=0.211935 budget80=5862440 budget90=7848160
  contrast_4pct signal=1.658480340000e-04 power=0.999849 budget80=252649 budget90=338226
scenario=severe_clusters DE_unlabelled=10.900000 DE_calibration=5.600000
  fractions N=0.938877864 m0=0.037895724 m1=0.023226412
  counts N=938877.864 m0=37895.724 m1=23226.412
  optimized_sd=6.807045616295e-05 equal_split_sd=1.108190703349e-04 sd_gain=38.575%
  common_1pct signal=1.826745969000e-05 power=0.058290 budget80=108985224 budget90=145900599
  common_2pct signal=3.442939412000e-05 power=0.079785 budget80=30680694 budget90=41072831
  contrast_4pct signal=1.658480340000e-04 power=0.683130 budget80=1322219 budget90=1770080
ALL_CHECKS_PASSED
```

## Full executable Python 3 source

```python
#!/usr/bin/env python3
"""Optimal endpoint-calibration / tetrad allocation for Tern Rook.

GEN/DERIVED statistical design sandbox.  The unlabeled tetrad estimator and
two labelled anchor-endpoint estimates are independent.  Cluster dependence is
represented by declared design effects, not inferred from the model.
"""

from __future__ import annotations

import math
from scipy.optimize import brentq
from scipy.stats import norm

P = 0.30
Q = 0.38
D = (0.61, 0.54, 0.50, 0.44)
C = (0.21, -0.16, 0.20, -0.15)
R0 = 0.05
R1 = 0.95
T = R1 - R0

# Null tetrad SD constants from the incoming multinomial experiment.
# SD * sqrt(N) should be asymptotically constant; average both observed values.
SIGMA_ROOT_N = 0.5 * (6.132059467e-5 * math.sqrt(100_000)
                      + 1.932419281e-5 * math.sqrt(1_000_000))
TOTAL_BUDGET = 1_000_000
Z95 = float(norm.ppf(0.975))

SIGNALS = {
    "common_1pct": abs(-1.826745969e-5),
    "common_2pct": abs(-3.442939412e-5),
    "contrast_4pct": abs(+1.658480340e-4),
}

SCENARIOS = {
    # (unlabelled cluster size, unlabelled ICC,
    #  calibration cluster size, calibration ICC)
    "iid": (1, 0.0, 1, 0.0),
    "moderate_clusters": (20, 0.05, 8, 0.20),
    "severe_clusters": (100, 0.10, 24, 0.20),
}


def tetrad(eps0: float, eps1: float) -> float:
    """Exact population tetrad under anchor endpoint errors."""
    a = P * (1.0 - P)
    b = Q * (1.0 - Q)
    t_true = T + eps1 - eps0
    qhat = Q + ((1.0 - Q) * eps0 + Q * eps1) / T
    bhat = qhat * (1.0 - qhat)
    kappa = b - b*b*t_true*t_true / (bhat*T*T)
    wedge1 = D[0]*C[3] - C[0]*D[3]
    wedge2 = D[1]*C[2] - C[1]*D[2]
    return a * kappa * wedge1 * wedge2


def endpoint_gradient(h: float = 1e-6) -> tuple[float, float]:
    g0 = (tetrad(h, 0.0) - tetrad(-h, 0.0)) / (2.0*h)
    g1 = (tetrad(0.0, h) - tetrad(0.0, -h)) / (2.0*h)
    return g0, g1


def design_effect(cluster_size: int, icc: float) -> float:
    return 1.0 + (cluster_size - 1) * icc


def two_sided_power(signal: float, sd: float) -> float:
    lam = signal / sd
    return float(norm.cdf(-Z95 - lam) + 1.0 - norm.cdf(Z95 - lam))


def lambda_for_power(target: float) -> float:
    return brentq(
        lambda lam: norm.cdf(-Z95-lam) + 1.0-norm.cdf(Z95-lam)-target,
        0.0, 10.0,
    )


def optimal_design(de_u: float, de_c: float, budget: int):
    """Minimize A/N+B0/m0+B1/m1 subject to N+m0+m1=budget."""
    g0, g1 = endpoint_gradient()
    a = SIGMA_ROOT_N**2 * de_u
    b0 = g0*g0 * R0*(1.0-R0) * de_c
    b1 = g1*g1 * R1*(1.0-R1) * de_c
    roots = (math.sqrt(a), math.sqrt(b0), math.sqrt(b1))
    total = sum(roots)
    fractions = tuple(x/total for x in roots)
    counts = tuple(budget*x for x in fractions)
    min_var = total*total / budget
    return (a, b0, b1), fractions, counts, math.sqrt(min_var)


def main() -> None:
    g0, g1 = endpoint_gradient()
    common_slope = g0 + g1
    contrast_slope = -g0 + g1
    incoming_common = -1.936099199989e-3

    print(f"sigma_root_N={SIGMA_ROOT_N:.12e}")
    print(f"endpoint_gradient g0={g0:+.12e} g1={g1:+.12e}")
    print(f"common_slope={common_slope:+.12e}")
    print(f"contrast_slope={contrast_slope:+.12e}")
    print(f"incoming_common_slope_error={abs(common_slope-incoming_common):.3e}")
    print(f"total_budget={TOTAL_BUDGET}")

    lam80 = lambda_for_power(0.80)
    lam90 = lambda_for_power(0.90)
    print(f"normal_noncentrality power80={lam80:.9f} power90={lam90:.9f}")

    for name, (su, ru, sc, rc) in SCENARIOS.items():
        deu = design_effect(su, ru)
        dec = design_effect(sc, rc)
        coeff, frac, counts, sd = optimal_design(deu, dec, TOTAL_BUDGET)
        equal_var = sum(coeff) / (TOTAL_BUDGET/3.0)
        gain = 1.0 - sd/math.sqrt(equal_var)
        print(f"scenario={name} DE_unlabelled={deu:.6f} DE_calibration={dec:.6f}")
        print("  fractions N={:.9f} m0={:.9f} m1={:.9f}".format(*frac))
        print("  counts N={:.3f} m0={:.3f} m1={:.3f}".format(*counts))
        print(f"  optimized_sd={sd:.12e} equal_split_sd={math.sqrt(equal_var):.12e} sd_gain={100*gain:.3f}%")
        for signal_name, signal in SIGNALS.items():
            power = two_sided_power(signal, sd)
            b80 = (lam80 * sum(math.sqrt(x) for x in coeff) / signal)**2
            b90 = (lam90 * sum(math.sqrt(x) for x in coeff) / signal)**2
            print(f"  {signal_name} signal={signal:.12e} power={power:.6f} budget80={math.ceil(b80)} budget90={math.ceil(b90)}")

        # Analytic KKT and equal-allocation controls.
        marginal = tuple(coeff[i]/(counts[i]**2) for i in range(3))
        assert max(marginal)/min(marginal) - 1.0 < 2e-12
        assert sd <= math.sqrt(equal_var)
        assert abs(sum(frac)-1.0) < 2e-15

    # Derivative and asymptotic controls.
    g0_half, g1_half = endpoint_gradient(5e-7)
    assert abs(g0-g0_half) < 2e-11
    assert abs(g1-g1_half) < 2e-11
    assert abs(common_slope-incoming_common) < 2e-12
    assert SIGNALS["contrast_4pct"] > SIGNALS["common_2pct"]
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()

```
