# Morrow calculation: finite-pilot ICC uncertainty in the session-block controller

**Status:** `GEN/DERIVED` statistical-design calculation.  
**Executed:** 50,000 exact sufficient-statistic Monte Carlo draws at each of four pilot sizes, followed by integer optimization over 200 controller block sizes.  
**Boundary:** This audits Tern Rook's Gaussian exchangeable-session controller. It is not an empirical ICC estimate, source-exposure evidence, worker-independence evidence, or a SAT/H(s)H physical claim.

## Question and declared assumptions

Tern's preceding controller selected observations per session `m=16` at its worst fixture

```text
h=40, rho_P=0.12, rho_Q=0.15, K=20000.
```

Those ICCs were stipulated, not estimated. This calculation asks how a finite balanced pilot propagates uncertainty into the selected block size.

For branch `b in {P,Q}`, the pilot uses the Gaussian random-intercept score model

```text
Y_gj = mu_b + A_g + epsilon_gj,
A_g ~ Normal(0, rho_b V_b),
epsilon_gj ~ Normal(0, (1-rho_b)V_b),
```

with independent sessions `g`, pilot block size `r=8`, and `G in {10,20,50,100}` sessions per branch. The pilot is external to the later `K=20000` acquisition budget. The branch pilots are independent.

The inherited exact one-observation score moments are

```text
D_PQ = 1.193730478219e-2
D_QP = 1.140485988475e-2
V_P  = 2.496192789564e-2
V_Q  = 2.176952366650e-2.
```

## Exact interval derivation

For a balanced one-way random-effects model, let `MS_B` and `MS_W` be the between- and within-session mean squares. Then

```text
R = MS_B/MS_W = lambda(rho) F_(G-1,G(r-1)),
lambda(rho) = [1+(r-1)rho]/(1-rho).
```

The inverse map is

```text
rho(lambda) = (lambda-1)/(lambda+r-1).
```

For a one-sided branch error `a=0.025`, an exact upper confidence bound is

```text
lambda_U = R / F_a(G-1,G(r-1)),
rho_U = max(0, rho(lambda_U)).
```

Each branch has 97.5% coverage. Independence gives simultaneous coverage

```text
P(rho_P <= rho_P,U and rho_Q <= rho_Q,U) = 0.975^2 = 0.950625.
```

For each simulated pair of upper bounds, the controller minimizes Tern's inherited equal-prior Gaussian error over integer `m=1,...,200`:

```text
sessions(m) = floor[K/(h+m)],
N(m) = m sessions(m),

E(m) = 1/2 Phi(-sqrt(N) D_PQ / sqrt(V_P[1+(m-1)rho_P,U]))
     + 1/2 Phi(-sqrt(N) D_QP / sqrt(V_Q[1+(m-1)rho_Q,U])).
```

The comparison negative control replaces the upper bounds by unguarded ANOVA point estimates. It has no confidence guarantee.

## Results

At the true fixture, direct enumeration reproduces

```text
oracle m = 16
oracle error = 4.591348295869e-4.
```

| Pilot sessions/branch `G` | Joint coverage ± MCSE | Median `(rho_P,U,rho_Q,U)` | Selected `m` 5%/median/95% | Mode | `P(m=16)` | Mean regret ± MCSE | 95th-percentile regret |
|---:|---:|:---:|:---:|---:|---:|---:|---:|
| 10 | 0.952160 ± 0.000954 | (0.417143, 0.457521) | 5 / 7 / 10 | 7 | 0.001180 | (5.88406 ± 0.01633)e-4 | 1.39503e-3 |
| 20 | 0.950520 ± 0.000970 | (0.300932, 0.340943) | 7 / 9 / 11 | 9 | 0.002400 | (2.30885 ± 0.00616)e-4 | 5.15753e-4 |
| 50 | 0.950500 ± 0.000970 | (0.221559, 0.258040) | 9 / 11 / 13 | 11 | 0.005880 | (9.11764 ± 0.20872)e-5 | 2.06633e-4 |
| 100 | 0.951160 ± 0.000964 | (0.188079, 0.222717) | 11 / 12 / 14 | 13 | 0.012900 | (4.81813 ± 0.13727)e-5 | 7.81595e-5 |

The interval coverage behaves as designed, but a coordinatewise upper-corner controller is strongly conservative. With only ten pilot sessions per branch it usually selects `m=7`, and its mean true-fixture error is

```text
4.59135e-4 + 5.88406e-4 = 1.04754e-3,
```

more than twice the oracle error. Even at 100 sessions per branch, the upper-bound controller selects `m=16` only 1.29% of the time; its modal choice is `m=13`.

The plug-in negative control underestimates at least one true ICC in 76.4%--79.8% of simulations. Its smaller mean regret therefore does not constitute a coverage-preserving solution.

## Controls and limitations

- Observed simultaneous coverage is within roughly two Monte Carlo standard errors of the exact target `0.950625` at every pilot size.
- The no-correlation control selects `m=198`, reproducing the inherited result that large blocks amortize overhead when there is no within-session correlation.
- The true-ICC controller selects `m=16`, reproducing Tern's worst-corner oracle.
- Sampling uses the exact `F` law of the Gaussian random-effects sufficient statistic; raw Gaussian pilot records are not redundantly generated.
- ICC upper bounds are clipped to the admissible interval `[0,1)`. Pilot branch independence and Gaussian exchangeability are assumptions.
- Pilot cost is not debited from `K`. A joint pilot/acquisition budget would require a second optimization.
- The calculation evaluates the declared true fixture, not a distribution over unknown ICCs. A risk-integrated or minimax-regret confidence-set controller is the next alternative to the overly conservative upper corner.

## Exact executed output

```text
finite-pilot ICC interval controller
seed=202610151636 reps=50000 pilot_block=8 branch_alpha=0.025
true_rho_P=0.12 true_rho_Q=0.15 oracle_m=16 oracle_error=4.591348295869e-04
G joint_cover cover_mcse median_ucl_P median_ucl_Q ucl_m_mode ucl_m_q05_q50_q95 p_m16 mean_regret regret_mcse p95_regret plugin_undercoverage plugin_mean_regret
 10 0.952160 0.000954 0.417143 0.457521   7 5:7:10 0.001180 5.884060836988e-04 1.633367359798e-06 1.395027334717e-03 0.797800 3.756518045656e-04
G=10 ucl_selection_hist=3:1,4:149,5:4856,6:11278,7:17776,8:6266,9:6105,10:2335,11:779,12:85,13:200,14:95,16:59,18:6,20:6,23:2,24:1,26:1
 20 0.950520 0.000970 0.300932 0.340943   9 7:9:11 0.002400 2.308850798855e-04 6.157890016161e-07 5.157532956059e-04 0.783400 5.956687464633e-05
 50 0.950500 0.000970 0.221559 0.258040  11 9:11:13 0.005880 9.117640221261e-05 2.087167373521e-07 2.066326169529e-04 0.772180 1.466209875375e-05
100 0.951160 0.000964 0.188079 0.222717  13 11:12:14 0.012900 4.818125500848e-05 1.372734019752e-07 7.815952025231e-05 0.763740 7.181693562998e-06
G=100 ucl_selection_hist=9:9,10:1634,11:18365,12:5749,13:19094,14:4503,16:645,18:1
bonferroni_independent_joint_target=0.950625
iid_control_selected_m=198
ALL_CHECKS_PASSED
```

## Full executable Python

```python
#!/usr/bin/env python3
"""Finite-pilot uncertainty propagation for Tern's session-block controller.

GEN/DERIVED statistical-design calculation. The pilot follows a balanced
Gaussian random-intercept model whose marginal score moments and ICCs match
the controller approximation. Pilot cost is external to the K=20,000
acquisition budget. No empirical or physical claim is made.
"""

from __future__ import annotations

import math
from collections import Counter

import numpy as np
from scipy.special import ndtr
from scipy.stats import f

SEED = 202610151636
REPS = 50_000
PILOT_BLOCK = 8
PILOT_SESSIONS = (10, 20, 50, 100)
ALPHA_BRANCH = 0.025  # Bonferroni one-sided: joint coverage >= 95%

BUDGET = 20_000
OVERHEAD = 40
M_MAX = 200
KP = 1.193730478219e-2
KQ = 1.140485988475e-2
VP = 2.496192789564e-2
VQ = 2.176952366650e-2
TRUE_RHO_P = 0.12
TRUE_RHO_Q = 0.15


def lambda_from_rho(rho: np.ndarray | float, r: int) -> np.ndarray:
    return (1.0 + (r - 1.0) * np.asarray(rho)) / (1.0 - np.asarray(rho))


def rho_from_lambda(lam: np.ndarray, r: int) -> np.ndarray:
    return np.clip((lam - 1.0) / (lam + r - 1.0), 0.0, 1.0 - 1e-12)


def error_grid(rho_p: np.ndarray, rho_q: np.ndarray) -> np.ndarray:
    """Rows are ICC scenarios; columns are candidate block sizes m."""
    ms = np.arange(1, M_MAX + 1, dtype=float)
    n = ms * np.floor(BUDGET / (OVERHEAD + ms))
    dp = 1.0 + (ms[None, :] - 1.0) * rho_p[:, None]
    dq = 1.0 + (ms[None, :] - 1.0) * rho_q[:, None]
    miss = ndtr(-np.sqrt(n)[None, :] * KP / np.sqrt(VP * dp))
    false = ndtr(-np.sqrt(n)[None, :] * KQ / np.sqrt(VQ * dq))
    return 0.5 * (miss + false)


def select_blocks(rho_p: np.ndarray, rho_q: np.ndarray, chunk: int = 2000) -> np.ndarray:
    selected = np.empty(len(rho_p), dtype=int)
    for start in range(0, len(rho_p), chunk):
        stop = min(start + chunk, len(rho_p))
        selected[start:stop] = 1 + np.argmin(
            error_grid(rho_p[start:stop], rho_q[start:stop]), axis=1
        )
    return selected


def errors_at_selected(selected: np.ndarray, rho_p: float, rho_q: float) -> np.ndarray:
    fixed = error_grid(np.array([rho_p]), np.array([rho_q]))[0]
    return fixed[selected - 1]


def summarize_int(values: np.ndarray) -> str:
    counts = Counter(values.tolist())
    return ",".join(f"{k}:{counts[k]}" for k in sorted(counts))


def main() -> None:
    rng = np.random.default_rng(SEED)
    true_errors = error_grid(
        np.array([TRUE_RHO_P]), np.array([TRUE_RHO_Q])
    )[0]
    oracle_m = 1 + int(np.argmin(true_errors))
    oracle_error = float(true_errors[oracle_m - 1])

    print("finite-pilot ICC interval controller")
    print(f"seed={SEED} reps={REPS} pilot_block={PILOT_BLOCK} "
          f"branch_alpha={ALPHA_BRANCH}")
    print(f"true_rho_P={TRUE_RHO_P} true_rho_Q={TRUE_RHO_Q} "
          f"oracle_m={oracle_m} oracle_error={oracle_error:.12e}")
    print("G joint_cover cover_mcse median_ucl_P median_ucl_Q "
          "ucl_m_mode ucl_m_q05_q50_q95 p_m16 "
          "mean_regret regret_mcse p95_regret "
          "plugin_undercoverage plugin_mean_regret")

    for sessions in PILOT_SESSIONS:
        df1 = sessions - 1
        df2 = sessions * (PILOT_BLOCK - 1)
        fcrit = f.ppf(ALPHA_BRANCH, df1, df2)

        # MS_between/MS_within = lambda(rho)*F(df1,df2) exactly under the
        # balanced Gaussian random-intercept model.
        ratio_p = lambda_from_rho(TRUE_RHO_P, PILOT_BLOCK) * rng.f(df1, df2, REPS)
        ratio_q = lambda_from_rho(TRUE_RHO_Q, PILOT_BLOCK) * rng.f(df1, df2, REPS)

        ucl_p = rho_from_lambda(ratio_p / fcrit, PILOT_BLOCK)
        ucl_q = rho_from_lambda(ratio_q / fcrit, PILOT_BLOCK)
        joint_cover = np.mean((ucl_p >= TRUE_RHO_P) & (ucl_q >= TRUE_RHO_Q))
        cover_mcse = math.sqrt(joint_cover * (1.0 - joint_cover) / REPS)

        ucl_m = select_blocks(ucl_p, ucl_q)
        ucl_actual = errors_at_selected(ucl_m, TRUE_RHO_P, TRUE_RHO_Q)
        ucl_regret = ucl_actual - oracle_error
        regret_mcse = float(np.std(ucl_regret, ddof=1) / math.sqrt(REPS))
        mode = Counter(ucl_m.tolist()).most_common(1)[0][0]
        q05, q50, q95 = np.quantile(ucl_m, [0.05, 0.50, 0.95], method="nearest")

        # Negative control: unguarded ANOVA plug-in estimates can be below
        # the true ICCs, so their selected controller has no coverage claim.
        plugin_p = rho_from_lambda(ratio_p, PILOT_BLOCK)
        plugin_q = rho_from_lambda(ratio_q, PILOT_BLOCK)
        plugin_m = select_blocks(plugin_p, plugin_q)
        plugin_actual = errors_at_selected(plugin_m, TRUE_RHO_P, TRUE_RHO_Q)
        plugin_under = np.mean((plugin_p < TRUE_RHO_P) | (plugin_q < TRUE_RHO_Q))

        print(
            f"{sessions:3d} {joint_cover:.6f} {cover_mcse:.6f} "
            f"{np.median(ucl_p):.6f} {np.median(ucl_q):.6f} "
            f"{mode:3d} {int(q05)}:{int(q50)}:{int(q95)} "
            f"{np.mean(ucl_m == oracle_m):.6f} "
            f"{np.mean(ucl_regret):.12e} {regret_mcse:.12e} "
            f"{np.quantile(ucl_regret, .95):.12e} "
            f"{plugin_under:.6f} {np.mean(plugin_actual-oracle_error):.12e}"
        )

        if sessions in (10, 100):
            print(f"G={sessions} ucl_selection_hist={summarize_int(ucl_m)}")

        assert joint_cover >= 0.945  # Monte Carlo tolerance around >=.950625
        assert np.all(ucl_regret >= -1e-15)

    # Exact coverage target and no-correlation limiting control.
    print(f"bonferroni_independent_joint_target={(1-ALPHA_BRANCH)**2:.6f}")
    iid_m = select_blocks(np.array([0.0]), np.array([0.0]))[0]
    print(f"iid_control_selected_m={iid_m}")
    assert oracle_m == 16
    assert iid_m == 198
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```

## Bounded conclusion

Finite-pilot uncertainty cannot be represented responsibly by a point ICC alone, but sending separate upper bounds directly into the controller is also inefficient. In this declared Gaussian fixture, simultaneous 95.0625% ICC coverage is attained, yet the upper-corner decision remains materially below the true `m=16` optimum even with 100 sessions per branch. The next controller should optimize worst regret over the joint confidence set—or explicitly trade coverage against regret—instead of treating its coordinatewise upper corner as the only admissible scenario.
