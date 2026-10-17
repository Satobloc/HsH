#!/usr/bin/env python3
"""Sable calculation: correlated-panel gate for reconstruction convergence.

Model only.  Each worker's correctness indicator is exchangeable with marginal
probability p and pairwise correlation rho.  For rho>0 this is represented by
a beta-binomial mixture.  The calculation quantifies when a larger, correlated
panel carries less majority-vote information than a smaller independent panel.
"""

from __future__ import annotations

import math
import random


def logsumexp(values: list[float]) -> float:
    peak = max(values)
    return peak + math.log(sum(math.exp(x - peak) for x in values))


def independent_majority_probability(n: int, p: float) -> float:
    """P(K > n/2) for K~Binomial(n,p), odd n."""
    assert n > 0 and n % 2 == 1 and 0.0 < p < 1.0
    return sum(
        math.comb(n, k) * p**k * (1.0 - p) ** (n - k)
        for k in range(n // 2 + 1, n + 1)
    )


def correlated_majority_probability(n: int, p: float, rho: float) -> float:
    """Exact beta-binomial majority probability.

    theta~Beta(alpha,beta), C_i|theta iid Bernoulli(theta), with
    alpha=p*(1/rho-1), beta=(1-p)*(1/rho-1).  Thus E[C_i]=p and
    Corr(C_i,C_j)=rho for i!=j.  rho=0 is evaluated by its binomial limit.
    """
    assert n > 0 and n % 2 == 1 and 0.0 < p < 1.0 and 0.0 <= rho < 1.0
    if rho == 0.0:
        return independent_majority_probability(n, p)
    concentration = 1.0 / rho - 1.0
    alpha = p * concentration
    beta = (1.0 - p) * concentration
    log_beta = math.lgamma(alpha) + math.lgamma(beta) - math.lgamma(alpha + beta)
    terms = []
    for k in range(n // 2 + 1, n + 1):
        terms.append(
            math.log(math.comb(n, k))
            + math.lgamma(k + alpha)
            + math.lgamma(n - k + beta)
            - math.lgamma(n + alpha + beta)
            - log_beta
        )
    return math.exp(logsumexp(terms))


def critical_rho(p: float, large_n: int = 19, reference_n: int = 5) -> tuple[float, float]:
    """rho where correlated large_n ties independent reference_n."""
    target = independent_majority_probability(reference_n, p)
    lo, hi = 0.0, 1.0 - 1e-12
    for _ in range(80):
        mid = (lo + hi) / 2.0
        if correlated_majority_probability(large_n, p, mid) > target:
            lo = mid
        else:
            hi = mid
    return (lo + hi) / 2.0, target


def monte_carlo(n: int, p: float, rho: float, trials: int, seed: int) -> tuple[float, float]:
    """Seeded beta-mixture validation; returns estimate and binomial SE."""
    rng = random.Random(seed)
    concentration = 1.0 / rho - 1.0
    alpha = p * concentration
    beta = (1.0 - p) * concentration
    wins = 0
    for _ in range(trials):
        theta = rng.betavariate(alpha, beta)
        correct = sum(rng.random() < theta for _ in range(n))
        wins += correct > n // 2
    estimate = wins / trials
    se = math.sqrt(estimate * (1.0 - estimate) / trials)
    return estimate, se


def main() -> None:
    panels = (1, 3, 5, 9, 19)
    correlations = (0.0, 0.01, 0.05, 0.10, 0.25, 0.50)
    p = 0.70
    print("model=exchangeable_beta_binomial")
    print(f"marginal_accuracy={p:.2f}")
    print("rho," + ",".join(f"n{n}" for n in panels))
    for rho in correlations:
        values = [correlated_majority_probability(n, p, rho) for n in panels]
        print(f"{rho:.2f}," + ",".join(f"{x:.9f}" for x in values))

    print("critical_rho_where_n19_equals_independent_n5")
    for marginal in (0.55, 0.60, 0.70, 0.80):
        rho_star, target = critical_rho(marginal)
        print(f"p={marginal:.2f},rho_star={rho_star:.12f},shared_success={target:.9f}")

    # Limiting cases and negative control.
    for n in panels:
        exact = correlated_majority_probability(n, p, 0.0)
        control = independent_majority_probability(n, p)
        assert abs(exact - control) < 1e-14
    near_full_correlation = correlated_majority_probability(19, p, 1.0 - 1e-9)
    assert abs(near_full_correlation - p) < 1e-7
    print(f"rho_to_1_limit_n19={near_full_correlation:.9f},expected={p:.9f}")
    print("negative_control_rho0=exact_binomial_pass")

    # Independent numerical check at the policy-relevant counterexample point.
    exact = correlated_majority_probability(19, p, 0.25)
    estimate, se = monte_carlo(19, p, 0.25, trials=500_000, seed=20261013)
    z = (estimate - exact) / se
    print(
        "mc_n19_p070_rho025="
        f"estimate={estimate:.9f},exact={exact:.9f},se={se:.9f},z={z:.3f}"
    )
    assert abs(z) < 4.0

    independent_five = independent_majority_probability(5, p)
    correlated_nineteen = correlated_majority_probability(19, p, 0.25)
    print(
        "counterexample="
        f"independent_n5={independent_five:.9f},"
        f"correlated_n19_rho025={correlated_nineteen:.9f},"
        f"loss={independent_five-correlated_nineteen:.9f}"
    )
    print(
        "boundary=correlation is a modeled shared-error parameter; convergence "
        "does not itself estimate rho or establish correctness"
    )


if __name__ == "__main__":
    main()
