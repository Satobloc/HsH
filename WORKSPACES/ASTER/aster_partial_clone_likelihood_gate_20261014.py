#!/usr/bin/env python3
"""Aster partial-clone likelihood gate.

Extends Loom's deterministic-clone provenance calculation to exchangeable,
partially correlated derivative mentions.  For a root with reliability p,
m derivative votes, k positive votes, and intracluster correlation rho, use

    Q | H+ ~ Beta(p*c, (1-p)*c),       c = 1/rho - 1
    K | Q  ~ Binomial(m, Q).

Under H-, swap p and 1-p.  The exact root log Bayes factor is the difference
of the two beta-binomial log likelihoods.  This is a synthetic dependence
calculation: p and rho are stipulated and do not estimate source truth,
authorship, worker reliability, or SAT/H(s)H physics.
"""

from __future__ import annotations

import math
from dataclasses import dataclass

from scipy.optimize import brentq
from scipy.special import betaln, expit, gammaln


@dataclass(frozen=True)
class RootCluster:
    positive: int
    mentions: int
    reliability: float
    rho: float


def _validate(cluster: RootCluster) -> None:
    if not (0 <= cluster.positive <= cluster.mentions):
        raise ValueError("positive must lie in [0, mentions]")
    if cluster.mentions < 1:
        raise ValueError("mentions must be positive")
    if not (0.5 < cluster.reliability < 1.0):
        raise ValueError("reliability must lie in (1/2, 1)")
    if not (0.0 <= cluster.rho < 1.0):
        raise ValueError("rho must lie in [0, 1)")


def log_beta_binomial(k: int, m: int, mean: float, rho: float) -> float:
    """Exact log PMF, with the independent limit evaluated analytically."""
    if rho == 0.0:
        return (
            gammaln(m + 1)
            - gammaln(k + 1)
            - gammaln(m - k + 1)
            + k * math.log(mean)
            + (m - k) * math.log1p(-mean)
        )
    concentration = 1.0 / rho - 1.0
    alpha = mean * concentration
    beta = (1.0 - mean) * concentration
    return (
        gammaln(m + 1)
        - gammaln(k + 1)
        - gammaln(m - k + 1)
        + betaln(k + alpha, m - k + beta)
        - betaln(alpha, beta)
    )


def cluster_log_bf(cluster: RootCluster) -> float:
    """log P(K=k|H+)/P(K=k|H-) for one correlated root family."""
    _validate(cluster)
    p = cluster.reliability
    return log_beta_binomial(
        cluster.positive, cluster.mentions, p, cluster.rho
    ) - log_beta_binomial(
        cluster.positive, cluster.mentions, 1.0 - p, cluster.rho
    )


def unanimous_log_bf_product(m: int, p: float, rho: float) -> float:
    """Independent stable check for k=m using a finite product.

    For rho>0, log BF = sum_i log[(p*c+i)/((1-p)*c+i)].
    Its i=0 term survives as rho->1, proving the one-root limit.
    """
    if rho == 0.0:
        return m * math.log(p / (1.0 - p))
    c = 1.0 / rho - 1.0
    return sum(
        math.log((p * c + i) / ((1.0 - p) * c + i))
        for i in range(m)
    )


def posterior(clusters: list[RootCluster]) -> float:
    """Equal-prior posterior P(H+|clusters)."""
    return float(expit(sum(cluster_log_bf(c) for c in clusters)))


def total_log_bf(clusters: list[RootCluster]) -> float:
    return sum(cluster_log_bf(c) for c in clusters)


def loom_adversarial(rho: float) -> list[RootCluster]:
    """Loom's 19-mention fixture: 17 yes clones vs two no roots."""
    return [
        RootCluster(17, 17, 0.90, rho),
        RootCluster(0, 1, 0.70, 0.0),
        RootCluster(0, 1, 0.70, 0.0),
    ]


def effective_sample_size(m: int, rho: float) -> float:
    """Moment diagnostic, not substituted for the exact likelihood."""
    return m / (1.0 + (m - 1.0) * rho)


def main() -> None:
    rhos = [0.0, 0.01, 0.05, 0.10, 0.25, 0.50, 0.75, 0.90, 0.99, 0.999999]
    independent_log_bf = total_log_bf(loom_adversarial(0.0))
    independent = float(expit(independent_log_bf))
    independent_tail = float(expit(-independent_log_bf))
    root_only = float(expit(math.log(0.9 / 0.1) - 2 * math.log(0.7 / 0.3)))

    print("rho,m_eff,posterior,excess_over_root")
    for rho in rhos:
        post = posterior(loom_adversarial(rho))
        print(
            f"{rho:.6f},{effective_sample_size(17, rho):.9f},"
            f"{post:.12f},{post-root_only:+.12f}"
        )

    # Solve the smallest rho making the exact posterior no more than one
    # percentage point above the deterministic-root limit.
    rho_1pct = brentq(
        lambda rho: posterior(loom_adversarial(rho)) - root_only - 0.01,
        1e-12,
        1.0 - 1e-12,
        xtol=1e-14,
    )

    # Negative controls and limiting cases.
    singleton = RootCluster(1, 1, 0.73, 0.83)
    singleton_expected = math.log(0.73 / 0.27)
    balanced = RootCluster(5, 10, 0.80, 0.37)
    product_errors = [
        abs(
            cluster_log_bf(RootCluster(17, 17, 0.90, rho))
            - unanimous_log_bf_product(17, 0.90, rho)
        )
        for rho in rhos
    ]
    near_root = posterior(loom_adversarial(1.0 - 1e-10))

    assert abs(cluster_log_bf(singleton) - singleton_expected) < 2e-14
    assert abs(cluster_log_bf(balanced)) < 2e-14
    assert max(product_errors) < 5e-11
    assert abs(near_root - root_only) < 2e-9
    assert independent > 1.0 - 1e-12

    print(f"independent_posterior={independent:.12f}")
    print(f"independent_log_bf={independent_log_bf:.12f}")
    print(f"independent_tail_probability={independent_tail:.12e}")
    print(f"deterministic_root_posterior={root_only:.12f}")
    print(f"rho_for_within_0p01={rho_1pct:.12f}")
    print(f"m_eff_at_threshold={effective_sample_size(17, rho_1pct):.12f}")
    print(f"max_betaln_vs_product_error={max(product_errors):.3e}")
    print("negative_singleton_error=" f"{abs(cluster_log_bf(singleton)-singleton_expected):.3e}")
    print(f"negative_balanced_log_bf={cluster_log_bf(balanced):.3e}")
    print(f"rho_to_one_limit_error={abs(near_root-root_only):.3e}")
    print("status=PASS")
    print(
        "boundary=exchangeable beta-binomial dependence with stipulated p,rho; "
        "no truth, authorship, or physics inference"
    )


if __name__ == "__main__":
    main()
