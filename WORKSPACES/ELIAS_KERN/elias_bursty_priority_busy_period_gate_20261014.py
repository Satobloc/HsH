#!/usr/bin/env python3
"""Exact burst-sensitivity gate for Elias's priority busy-period model.

Status: GEN/DERIVED sandbox queueing mathematics.  This does not authorize a
scheduling rule and makes no claim that real directive arrivals follow either
distribution.

The earlier gate used Poisson(lambda) new directives per serviced directive,
giving a Borel total busy period B.  Here the offspring count is instead
negative-binomial with shape r and success probability p=r/(r+lambda), so its
mean remains lambda while its variance becomes lambda+lambda^2/r.

Dwass's identity gives, for n>=1,

  P(B=n) = (1/n) P(X_1+...+X_n=n-1)
         = Gamma(n r+n-1)/(n Gamma(n r) Gamma(n))
           * p^(n r) * (1-p)^(n-1).

For lambda<1,

  E[B]=1/(1-lambda),
  Var[B]=(lambda+lambda^2/r)/(1-lambda)^3.

Thus fixed mean load fixes the expectation but not liveness-tail risk.
"""

from __future__ import annotations

import json
import math

import numpy as np


def nb_total_pmf(lam: float, r: float, n: int) -> float:
    """Exact total-progeny mass for NB(r,p) offspring, evaluated in log space."""
    if not (lam >= 0 and r > 0 and n >= 1):
        raise ValueError("require lambda>=0, r>0, n>=1")
    if lam == 0:
        return float(n == 1)
    p = r / (r + lam)
    k = n - 1
    nr = n * r
    log_mass = (
        -math.log(n)
        + math.lgamma(k + nr)
        - math.lgamma(nr)
        - math.lgamma(k + 1)
        + nr * math.log(p)
        + k * math.log1p(-p)
    )
    return math.exp(log_mass)


def borel_pmf(lam: float, n: int) -> float:
    """Poisson-offspring limit used by the preceding Elias checkpoint."""
    if lam == 0:
        return float(n == 1)
    return math.exp(-lam*n + (n-1)*math.log(lam*n) - math.lgamma(n+1))


def cdf(pmf, limit: int) -> float:
    return math.fsum(pmf(n) for n in range(1, limit + 1))


def quantiles(pmf, probs=(0.95, 0.99, 0.999, 0.9999), cap=200_000):
    out = {str(p): None for p in probs}
    total = 0.0
    for n in range(1, cap + 1):
        total += pmf(n)
        for p in probs:
            if out[str(p)] is None and total >= p:
                out[str(p)] = n
        if all(v is not None for v in out.values()):
            return out
    raise RuntimeError("quantile cap too small")


def crossover(lam: float, r: float, cap=20_000) -> int:
    """First H where NB survival exceeds Poisson survival."""
    c_nb = c_po = 0.0
    for h in range(1, cap + 1):
        c_nb += nb_total_pmf(lam, r, h)
        c_po += borel_pmf(lam, h)
        if 1.0 - c_nb > 1.0 - c_po:
            return h
    raise RuntimeError("no crossover below cap")


def extinction_probability(lam: float, r: float) -> float:
    """Smallest fixed point of the NB offspring PGF."""
    if lam <= 1:
        return 1.0
    p = r / (r + lam)
    q = 0.0
    for _ in range(100_000):
        q_new = (p / (1.0 - (1.0-p)*q))**r
        if abs(q_new-q) < 1e-15:
            return q_new
        q = q_new
    raise RuntimeError("fixed point did not converge")


def simulate_survival(lam: float, r: float, horizon: int, trials: int, seed: int):
    """Actually execute the queue for P(B>horizon)."""
    rng = np.random.default_rng(seed)
    p = r / (r + lam)
    backlog = np.ones(trials, dtype=np.int64)
    for _ in range(horizon):
        active = backlog > 0
        backlog[active] -= 1
        backlog[active] += rng.negative_binomial(r, p, int(active.sum()))
    estimate = float(np.mean(backlog > 0))
    exact = 1.0 - cdf(lambda n: nb_total_pmf(lam, r, n), horizon)
    se = math.sqrt(exact*(1.0-exact)/trials)
    return {"estimate": estimate, "exact": exact, "z_error": (estimate-exact)/se,
            "trials": trials, "seed": seed}


def fixture(lam: float, r: float):
    nb = lambda n: nb_total_pmf(lam, r, n)
    po = lambda n: borel_pmf(lam, n)
    tails = {}
    for h in (100, 1000):
        s_nb = 1.0 - cdf(nb, h)
        s_po = 1.0 - cdf(po, h)
        tails[str(h)] = {"NB": s_nb, "Poisson": s_po, "ratio": s_nb/s_po}
    return {
        "lambda": lam,
        "shape_r": r,
        "offspring_variance": lam + lam*lam/r,
        "busy_mean": 1.0/(1.0-lam),
        "busy_sd": math.sqrt((lam+lam*lam/r)/(1.0-lam)**3),
        "P_B_eq_1": nb(1),
        "tail_crossover_H": crossover(lam, r),
        "tails": tails,
        "NB_quantiles": quantiles(nb),
        "Poisson_quantiles": quantiles(po),
    }


def main() -> None:
    f08 = fixture(0.8, 0.1)
    f095 = fixture(0.95, 0.1)
    sim = simulate_survival(0.8, 0.1, horizon=100, trials=200_000,
                            seed=20261014)

    # Poisson-limit negative control at r=10^6.
    po_tail = 1.0 - cdf(lambda n: borel_pmf(0.8, n), 100)
    nb_limit_tail = 1.0 - cdf(lambda n: nb_total_pmf(0.8, 1.0e6, n), 100)

    # Supercritical comparison: burstiness changes non-clearance probability,
    # while the mean-one critical threshold itself stays unchanged.
    inf_nb = 1.0 - extinction_probability(1.1, 0.1)
    q_po = 0.0
    for _ in range(100_000):
        q_new = math.exp(1.1*(q_po-1.0))
        if abs(q_new-q_po) < 1e-15:
            break
        q_po = q_new
    inf_po = 1.0 - q_new

    out = {
        "exact_law": "Dwass total progeny for NB offspring",
        "fixed_mean_not_fixed_tail": [f08, f095],
        "executed_simulation": sim,
        "poisson_limit_control": {
            "r": 1.0e6,
            "NB_tail_100": nb_limit_tail,
            "Poisson_tail_100": po_tail,
            "absolute_difference": abs(nb_limit_tail-po_tail),
        },
        "supercritical_lambda_1.1": {
            "NB_r_0.1_P_infinite": inf_nb,
            "Poisson_P_infinite": inf_po,
        },
        "status": "GEN/DERIVED synthetic queue mathematics; no scheduling authorization",
    }

    assert abs(sim["z_error"]) < 3.0
    assert out["poisson_limit_control"]["absolute_difference"] < 2.0e-9
    assert f08["tail_crossover_H"] == 30
    assert f095["tail_crossover_H"] == 435
    assert f08["NB_quantiles"]["0.9999"] == 992
    print(json.dumps(out, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
