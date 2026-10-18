# Calder | Cost-optimal iid track/calibration acquisition gate

**Status:** executed GEN/DERIVED statistical sandbox. Not authenticated Calder participation, a physical correspondence model, SAT/H(s)H validation, or a BEDROCK promotion. All quantities are dimensionless.

## Control and continuity

Live BEDROCK was read completely at blob ea2126ab88a6625177d2c488b75fee0e27a70ca2; STATE_OF_THE_THEORY was read as subordinate at blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Calder's distinct historical identities were not merged. This extends the published Calder Markov profile gate.

The calculation leaves BR-000/001 ancestry, BR-003 tentative status, BR-004 stratigraphy, BR-005 theta4, BR-006 interaction physics, OC-001 scaling, and OC-002 electromagnetic support unchanged. No restricted source or imported ontology is used.

## Derivation

At the iid-redraw boundary, let X~Binomial(n,r) and K~Binomial(M,e) independently, with r=e+p(1-2e). Estimate

$$
\widehat p={\widehat r-\widehat e\over1-2\widehat e}.
$$

Writing a=2p-1 and b=1-2e gives derivatives dp/dr=1/b and dp/de=a/b. Hence

$$
\operatorname{Var}(\widehat p)\approx {A\over n}+{C\over M},\quad
A={r(1-r)\over b^2},\quad C={a^2e(1-e)\over b^2}.
$$

For calibration cost c and budget n+cM=B, Lagrange optimization gives

$$
{n_*\over M_*}=\sqrt{Ac/C},\qquad
\operatorname{Var}_{\min}={\left(\sqrt A+\sqrt{cC}\right)^2\over B}.
$$

For a two-sided normal 95% half-width h,

$$
B_{\min}=\left(\sqrt A+\sqrt{cC}\right)^2\left({1.959963984540054\over h}\right)^2.
$$

## Executed results

For p=0.7914541417127793 and e=0.03143198557693108: r=0.7731321769554735, A=0.19971991949832174, C=0.011778693568291572.

At equal costs and B=11000, the current 10000/1000 allocation has SD 0.005634774664 and nominal 95% half-width 0.011043955403. The continuous optimum is n=8850.6265, M=2149.3735; the integer optimum 8851/2149 has SD 0.005295817623 and half-width 0.010379611809, reducing variance by 11.6690%.

Equal-cost target budgets: h=0.020 requires B=2962.749 (n=2383.835,M=578.914); h=0.010 requires B=11850.997 (n=9535.341,M=2315.656); h=0.005 requires B=47403.990 (n=38141.365,M=9262.625).

Cost sensitivity at numeric B=11000: c=(0.25,1,4,16) gives optimal n/M=(2.058885,4.117770,8.235541,16.471082). Constraint is n+cM=B, so n+M need not equal B when c differs from 1.

## Monte Carlo validation

Two runs of 200,000 independent repetitions used seed base 202610180036. For 10000/1000, simulated SD=0.005635154896 versus predicted 0.005634774664 (relative error 6.75e-5), bias=4.91e-5. For 8851/2149, simulated SD=0.005293527479 versus predicted 0.005295817623 (relative error 4.32e-4), bias=3.63e-5.

Controls: p=1/2 and e=0 each give C=0; e->1/2 makes b->0 and destroys sign information; M=0 with unknown e restores the iid p/e ridge. The result is local in stipulated p,e and excludes persistence, misspecification, and setup costs.

## Bounded conclusion

At the iid boundary and equal per-trial costs, the inherited design underinvests in labelled calibration for its own local precision objective. Reallocating 1,149 trials from track to calibration reduces first-order variance by 11.67%. A nominal 95% half-width 0.01 needs about 11,851 equal-cost trials, 7.7% more than the inherited 11,000. This does not supply a physical correspondence mechanism.

## Complete executable Python

~~~python
#!/usr/bin/env python3
"""Optimal track/calibration allocation at the iid boundary of Calder's HMM.

For iid observed positives X~Bin(n,r), labelled flip calibration K~Bin(M,e),
and r=e+p(1-2e), estimate p=(r-e)/(1-2e).  The delta variance is A/n+C/M.
This script derives the cost-constrained optimum, evaluates the inherited
fixture, and validates the variance with seeded Monte Carlo.

GEN/DERIVED statistical sandbox only; no SAT/H(s)H physical inference.
"""

from __future__ import annotations

import json
import math
import numpy as np


P = 0.7914541417127793
E = 0.03143198557693108
CURRENT_N = 10_000
CURRENT_M = 1_000
TOTAL_EQUAL_COST = CURRENT_N + CURRENT_M
REPS = 200_000
SEED = 202610180036
Z95 = 1.959963984540054


def coefficients(p: float, e: float) -> tuple[float, float, float]:
    """Return r and coefficients A,C in Var(p_hat)=A/n+C/M."""
    b = 1.0 - 2.0 * e
    a = 2.0 * p - 1.0
    r = e + p * b
    A = r * (1.0 - r) / b**2
    C = a**2 * e * (1.0 - e) / b**2
    return r, A, C


def optimal_allocation(
    budget: float, calibration_cost: float, A: float, C: float
) -> tuple[float, float, float]:
    """Continuous optimum under n + calibration_cost*M = budget."""
    # Lagrange conditions give n/M=sqrt(A*cost/C).
    ratio = math.sqrt(A * calibration_cost / C)
    M = budget / (ratio + calibration_cost)
    n = ratio * M
    variance = A / n + C / M
    return n, M, variance


def minimum_budget_for_halfwidth(
    halfwidth: float, calibration_cost: float, A: float, C: float
) -> tuple[float, float, float]:
    """Continuous minimum budget and allocation for Z95*sqrt(var)<=halfwidth."""
    target_variance = (halfwidth / Z95) ** 2
    # At optimum, min variance at budget B is
    # (sqrt(A)+sqrt(cost*C))^2/B.
    budget = (
        math.sqrt(A) + math.sqrt(calibration_cost * C)
    ) ** 2 / target_variance
    n, M, variance = optimal_allocation(budget, calibration_cost, A, C)
    return budget, n, M


def estimate_p(x: np.ndarray, n: int, k: np.ndarray, m: int) -> np.ndarray:
    rhat = x / n
    ehat = k / m
    return (rhat - ehat) / (1.0 - 2.0 * ehat)


def simulate(n: int, m: int, r: float) -> dict[str, float]:
    rng = np.random.default_rng(SEED + n + 17 * m)
    # Chunk to keep memory bounded and preserve one deterministic RNG stream.
    chunks = []
    remaining = REPS
    while remaining:
        q = min(20_000, remaining)
        x = rng.binomial(n, r, size=q)
        k = rng.binomial(m, E, size=q)
        chunks.append(estimate_p(x, n, k, m))
        remaining -= q
    vals = np.concatenate(chunks)
    return {
        "mean": float(vals.mean()),
        "bias": float(vals.mean() - P),
        "sd": float(vals.std(ddof=1)),
        "q025": float(np.quantile(vals, 0.025)),
        "q975": float(np.quantile(vals, 0.975)),
    }


def main() -> None:
    r, A, C = coefficients(P, E)
    current_var = A / CURRENT_N + C / CURRENT_M
    n_opt_f, m_opt_f, opt_var_f = optimal_allocation(
        TOTAL_EQUAL_COST, 1.0, A, C
    )
    n_opt = int(round(n_opt_f))
    m_opt = TOTAL_EQUAL_COST - n_opt
    opt_integer_var = A / n_opt + C / m_opt

    costs = {}
    for cost in (0.25, 1.0, 4.0, 16.0):
        n, m, var = optimal_allocation(TOTAL_EQUAL_COST, cost, A, C)
        costs[str(cost)] = {
            "n": n,
            "M": m,
            "n_over_M": n / m,
            "variance": var,
        }

    targets = {}
    for h in (0.02, 0.01, 0.005):
        budget, n, m = minimum_budget_for_halfwidth(h, 1.0, A, C)
        targets[str(h)] = {"budget": budget, "n": n, "M": m}

    sim_current = simulate(CURRENT_N, CURRENT_M, r)
    sim_optimal = simulate(n_opt, m_opt, r)

    predicted_current_sd = math.sqrt(current_var)
    predicted_optimal_sd = math.sqrt(opt_integer_var)
    current_sd_error = abs(sim_current["sd"] / predicted_current_sd - 1.0)
    optimal_sd_error = abs(sim_optimal["sd"] / predicted_optimal_sd - 1.0)

    # Controls: C=0 when p=1/2, so calibration has no first-order value;
    # e=0 makes calibration noiseless in the limiting coefficient.
    _, _, C_balanced = coefficients(0.5, E)
    _, _, C_perfect = coefficients(P, 0.0)
    assert C_balanced == 0.0
    assert C_perfect == 0.0
    assert abs(n_opt + m_opt - TOTAL_EQUAL_COST) == 0
    assert opt_integer_var < current_var
    assert current_sd_error < 0.01
    assert optimal_sd_error < 0.01
    assert abs(sim_current["bias"]) < 2.0e-4
    assert abs(sim_optimal["bias"]) < 2.0e-4

    payload = {
        "fixture": {
            "p": P,
            "e": E,
            "r": r,
            "A_track": A,
            "C_calibration": C,
            "current_n": CURRENT_N,
            "current_M": CURRENT_M,
            "equal_cost_budget": TOTAL_EQUAL_COST,
        },
        "current": {
            "variance": current_var,
            "sd": predicted_current_sd,
            "95pct_halfwidth": Z95 * predicted_current_sd,
            "simulation": sim_current,
        },
        "equal_cost_optimum_continuous": {
            "n": n_opt_f,
            "M": m_opt_f,
            "n_over_M": n_opt_f / m_opt_f,
            "variance": opt_var_f,
        },
        "equal_cost_optimum_integer": {
            "n": n_opt,
            "M": m_opt,
            "variance": opt_integer_var,
            "sd": predicted_optimal_sd,
            "95pct_halfwidth": Z95 * predicted_optimal_sd,
            "variance_reduction_vs_current": 1.0 - opt_integer_var / current_var,
            "simulation": sim_optimal,
        },
        "cost_sensitivity_at_numeric_budget_11000": costs,
        "equal_cost_budget_for_target_95pct_halfwidth": targets,
        "delta_vs_monte_carlo_relative_sd_error": {
            "current": current_sd_error,
            "optimal": optimal_sd_error,
        },
        "controls": {
            "calibration_coefficient_at_p_half": C_balanced,
            "calibration_coefficient_at_e_zero": C_perfect,
        },
        "status": (
            "PASS; GEN/DERIVED iid acquisition design with stipulated p,e; "
            "no physical correspondence or SAT/H(s)H inference"
        ),
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
~~~

Python source SHA-256: 38f7e373bdf13f4eaebf6ddd056283973ecd43547b9109581a8ebcc3267944c8.

