#!/usr/bin/env python3
"""Exact block-exchangeability tail gate for Aldus's joint-null problem.

Synthetic question
------------------
For n=100 binary source-family indicators with marginal q=0.01 and local
intraclass correlation rho=1/11, how does P(K >= 8) change when the common
latent exposure is shared globally versus independently within m equal
time/domain blocks?

Each block has b=n/m trials and its own
    Q_g ~ Beta(alpha, beta),  X_i | Q_g ~ Bernoulli(Q_g),
with alpha=q*(1/rho-1), beta=(1-q)*(1/rho-1).  Blocks are independent.
The count distribution is computed exactly by convolving beta-binomial PMFs.

This is a synthetic identifiability calculation, not an empirical SAT/H(s)H
claim.  It tests a provenance/exposure null used to judge apparent recurrence.
"""

from __future__ import annotations

import json
from math import comb

import numpy as np
from scipy.special import betaln, gammaln


N = 100
Q = 0.01
RHO_LOCAL = 1.0 / 11.0
THRESHOLD = 8
BLOCK_COUNTS = (1, 2, 4, 5, 10, 20, 25, 50, 100)


def beta_binomial_pmf(n: int, q: float, rho: float) -> np.ndarray:
    """Return the exact beta-binomial PMF in double precision."""
    if n < 0 or not (0.0 < q < 1.0) or not (0.0 < rho < 1.0):
        raise ValueError("require n>=0, 0<q<1, and 0<rho<1")
    concentration = 1.0 / rho - 1.0
    alpha, beta = q * concentration, (1.0 - q) * concentration
    k = np.arange(n + 1, dtype=float)
    log_choose = gammaln(n + 1.0) - gammaln(k + 1.0) - gammaln(n - k + 1.0)
    log_pmf = log_choose + betaln(k + alpha, n - k + beta) - betaln(alpha, beta)
    pmf = np.exp(log_pmf)
    return pmf / pmf.sum()


def binomial_pmf(n: int, q: float) -> np.ndarray:
    k = np.arange(n + 1)
    pmf = np.array([comb(n, int(j)) * q**j * (1.0 - q) ** (n - j) for j in k])
    return pmf / pmf.sum()


def convolve_identical_blocks(block_pmf: np.ndarray, m: int) -> np.ndarray:
    total = np.array([1.0])
    for _ in range(m):
        total = np.convolve(total, block_pmf)
    return total / total.sum()


def moments(pmf: np.ndarray) -> tuple[float, float]:
    k = np.arange(pmf.size, dtype=float)
    mean = float(k @ pmf)
    variance = float((k - mean) ** 2 @ pmf)
    return mean, variance


def main() -> None:
    records = []
    max_norm_error = 0.0
    max_mean_error = 0.0
    max_variance_error = 0.0

    for m in BLOCK_COUNTS:
        if N % m:
            raise AssertionError("all block counts must divide N")
        b = N // m

        # With b=1, the latent Q is observationally irrelevant: Bernoulli(q).
        one_block = binomial_pmf(1, Q) if b == 1 else beta_binomial_pmf(b, Q, RHO_LOCAL)
        pmf = convolve_identical_blocks(one_block, m)
        tail = float(pmf[THRESHOLD:].sum())
        mean, variance = moments(pmf)

        variance_formula = N * Q * (1.0 - Q) * (1.0 + (b - 1.0) * RHO_LOCAL)
        rho_global_average = ((b - 1.0) / (N - 1.0)) * RHO_LOCAL

        # Negative comparison: a globally exchangeable beta mixture having the
        # same mean and average pairwise ICC as the block model.  It matches the
        # first two count moments but not the higher-order dependence structure.
        if rho_global_average == 0.0:
            matched_global = binomial_pmf(N, Q)
        else:
            matched_global = beta_binomial_pmf(N, Q, rho_global_average)
        matched_tail = float(matched_global[THRESHOLD:].sum())
        matched_mean, matched_variance = moments(matched_global)

        max_norm_error = max(max_norm_error, abs(float(pmf.sum()) - 1.0))
        max_mean_error = max(max_mean_error, abs(mean - N * Q), abs(matched_mean - N * Q))
        max_variance_error = max(
            max_variance_error,
            abs(variance - variance_formula),
            abs(matched_variance - variance_formula),
        )

        records.append(
            {
                "blocks_m": m,
                "block_size_b": b,
                "rho_local": RHO_LOCAL,
                "rho_global_average": rho_global_average,
                "mean": mean,
                "variance": variance,
                "tail_block_model": tail,
                "tail_matched_global_beta": matched_tail,
                "block_to_matched_tail_ratio": tail / matched_tail,
            }
        )

    # Exact limiting-case controls.
    prior_global_tail = 0.0395519148416818
    prior_independent_tail = 8.22020473856653e-6
    assert abs(records[0]["tail_block_model"] - prior_global_tail) < 5e-14
    assert abs(records[-1]["tail_block_model"] - prior_independent_tail) < 5e-16
    assert max_norm_error < 2e-15
    assert max_mean_error < 2e-12
    assert max_variance_error < 2e-11

    result = {
        "status": "GEN/DERIVED synthetic exact calculation",
        "definitions": {
            "n": N,
            "q": Q,
            "rho_local": RHO_LOCAL,
            "threshold": THRESHOLD,
            "block_model": "m independent Beta-Bernoulli exposure blocks of size b=n/m",
            "matched_control": "one global Beta-Bernoulli mixture with same mean and average pairwise ICC",
        },
        "identity": {
            "variance_block": "n*q*(1-q)*(1+(b-1)*rho_local)",
            "rho_global_average": "((b-1)/(n-1))*rho_local",
        },
        "records": records,
        "numerical_checks": {
            "max_pmf_normalization_error": max_norm_error,
            "max_mean_absolute_error": max_mean_error,
            "max_variance_absolute_error": max_variance_error,
        },
        "interpretation_boundary": (
            "Equal q and equal average pairwise ICC fix mean and variance but not P(K>=8); "
            "higher-order dependence and the domain/time correlation graph remain necessary."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
