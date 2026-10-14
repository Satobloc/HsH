#!/usr/bin/env python3
"""Ariadne: exact non-exchangeable dependency-tree likelihood gate.

This extends Aster's exchangeable beta-binomial partial-clone model.  Each
of 17 binary derivative mentions has stipulated marginal reliability p.
Dependence follows a stationary binary Markov process on a tree:

    P(X_child=1 | X_parent=1,H+) = p + c(1-p)
    P(X_child=1 | X_parent=0,H+) = p(1-c).

Every node therefore has marginal P(X_i=1|H+)=p, and Pearson correlation
between nodes i,j is c**distance(i,j).  For each topology, c is solved so
the average over all 136 pairs equals the same target rho_bar.  Exact
enumeration of all 2**17 states then tests whether (p,rho_bar) identifies
the likelihood.  Under H-, replace p by 1-p.

Status: GEN/DERIVED provenance mathematics.  Reliabilities/dependence are
stipulated; no inference about source truth, authorship, workers, or physics.
"""

from __future__ import annotations

import json
import math
from dataclasses import asdict, dataclass

import numpy as np
from scipy.optimize import brentq
from scipy.special import betaln, expit


N = 17
P = 0.90
RHO_BAR = 0.90
NEGATIVE_ROOT_RELIABILITY = 0.70


@dataclass
class TreeResult:
    name: str
    edge_correlation: float
    achieved_average_pair_correlation: float
    maximum_marginal_error: float
    count_mean: float
    count_variance: float
    unanimous_log_bf: float
    posterior_with_two_negative_roots: float
    probability_k_ge_15_hplus: float
    probability_k_ge_15_hminus: float
    count_tail_log_bf: float
    normalization_error_hplus: float
    normalization_error_hminus: float


def tree_edges(name: str) -> list[tuple[int, int]]:
    if name == "star":
        return [(0, i) for i in range(1, N)]
    if name == "path":
        return [(i, i + 1) for i in range(N - 1)]
    raise ValueError(name)


def distances(edges: list[tuple[int, int]]) -> np.ndarray:
    d = np.full((N, N), N + 1, dtype=int)
    np.fill_diagonal(d, 0)
    for a, b in edges:
        d[a, b] = d[b, a] = 1
    for k in range(N):
        d = np.minimum(d, d[:, k, None] + d[None, k, :])
    return d


def average_pair_correlation(c: float, d: np.ndarray) -> float:
    upper = d[np.triu_indices(N, 1)]
    return float(np.mean(c**upper))


def solve_edge_correlation(d: np.ndarray) -> float:
    return float(brentq(
        lambda c: average_pair_correlation(c, d) - RHO_BAR,
        0.0, 1.0, xtol=2e-15,
    ))


def state_probabilities(
    states: np.ndarray, edges: list[tuple[int, int]], p_h: float, c: float
) -> np.ndarray:
    """Exact factorized tree probability for every binary state."""
    root = states[:, 0]
    prob = np.where(root == 1, p_h, 1.0 - p_h)
    for parent, child in edges:
        xp = states[:, parent]
        xc = states[:, child]
        child_one = np.where(xp == 1, p_h + c * (1.0 - p_h), p_h * (1.0 - c))
        prob *= np.where(xc == 1, child_one, 1.0 - child_one)
    return prob


def enumerate_tree(name: str, states: np.ndarray) -> tuple[TreeResult, np.ndarray, np.ndarray]:
    edges = tree_edges(name)
    d = distances(edges)
    c = solve_edge_correlation(d)
    plus = state_probabilities(states, edges, P, c)
    minus = state_probabilities(states, edges, 1.0 - P, c)
    counts = np.sum(states, axis=1).astype(int)

    plus_norm = float(np.sum(plus))
    minus_norm = float(np.sum(minus))
    marginals = states.T @ plus
    max_marginal_error = float(np.max(np.abs(marginals - P)))

    # Directly recover the average Pearson correlation from enumeration.
    centered = states - P
    covariance = centered.T @ (centered * plus[:, None])
    corr = covariance / (P * (1.0 - P))
    avg_corr = float(np.mean(corr[np.triu_indices(N, 1)]))

    pmf_plus = np.bincount(counts, weights=plus, minlength=N + 1)
    pmf_minus = np.bincount(counts, weights=minus, minlength=N + 1)
    tail_plus = float(np.sum(pmf_plus[15:]))
    tail_minus = float(np.sum(pmf_minus[15:]))
    unanimous_log_bf = float(math.log(pmf_plus[N] / pmf_minus[N]))
    total_log_bf = unanimous_log_bf - 2.0 * math.log(
        NEGATIVE_ROOT_RELIABILITY / (1.0 - NEGATIVE_ROOT_RELIABILITY)
    )

    result = TreeResult(
        name=name,
        edge_correlation=c,
        achieved_average_pair_correlation=avg_corr,
        maximum_marginal_error=max_marginal_error,
        count_mean=float(np.dot(np.arange(N + 1), pmf_plus)),
        count_variance=float(np.dot((np.arange(N + 1) - N * P) ** 2, pmf_plus)),
        unanimous_log_bf=unanimous_log_bf,
        posterior_with_two_negative_roots=float(expit(total_log_bf)),
        probability_k_ge_15_hplus=tail_plus,
        probability_k_ge_15_hminus=tail_minus,
        count_tail_log_bf=float(math.log(tail_plus / tail_minus)),
        normalization_error_hplus=plus_norm - 1.0,
        normalization_error_hminus=minus_norm - 1.0,
    )
    return result, pmf_plus, pmf_minus


def beta_binomial_unanimous_log_bf() -> float:
    concentration = 1.0 / RHO_BAR - 1.0
    alpha_plus = P * concentration
    beta_plus = (1.0 - P) * concentration
    alpha_minus = (1.0 - P) * concentration
    beta_minus = P * concentration
    log_p_plus = betaln(N + alpha_plus, beta_plus) - betaln(alpha_plus, beta_plus)
    log_p_minus = betaln(N + alpha_minus, beta_minus) - betaln(alpha_minus, beta_minus)
    return float(log_p_plus - log_p_minus)


def independence_control(states: np.ndarray) -> float:
    plus_star = state_probabilities(states, tree_edges("star"), P, 0.0)
    plus_path = state_probabilities(states, tree_edges("path"), P, 0.0)
    return float(np.max(np.abs(plus_star - plus_path)))


def main() -> None:
    labels = np.arange(2**N, dtype=np.uint32)
    states = ((labels[:, None] >> np.arange(N, dtype=np.uint32)) & 1).astype(float)

    star, star_plus, _ = enumerate_tree("star", states)
    path, path_plus, _ = enumerate_tree("path", states)
    expected_variance = N * P * (1.0 - P) * (1.0 + (N - 1) * RHO_BAR)

    controls = {
        "maximum_normalization_error": max(
            abs(star.normalization_error_hplus), abs(star.normalization_error_hminus),
            abs(path.normalization_error_hplus), abs(path.normalization_error_hminus),
        ),
        "maximum_marginal_error": max(star.maximum_marginal_error, path.maximum_marginal_error),
        "maximum_average_correlation_error": max(
            abs(star.achieved_average_pair_correlation - RHO_BAR),
            abs(path.achieved_average_pair_correlation - RHO_BAR),
        ),
        "mean_difference": abs(star.count_mean - path.count_mean),
        "variance_difference": abs(star.count_variance - path.count_variance),
        "variance_error_from_pairwise_formula": max(
            abs(star.count_variance - expected_variance),
            abs(path.count_variance - expected_variance),
        ),
        "c_zero_topology_probability_error": independence_control(states),
        "count_pmf_total_variation": float(0.5 * np.sum(np.abs(star_plus - path_plus))),
    }

    assert controls["maximum_normalization_error"] < 2e-12
    assert controls["maximum_marginal_error"] < 2e-12
    assert controls["maximum_average_correlation_error"] < 2e-12
    assert controls["mean_difference"] < 2e-12
    assert controls["variance_difference"] < 2e-11
    assert controls["variance_error_from_pairwise_formula"] < 2e-11
    assert controls["c_zero_topology_probability_error"] < 2e-15

    beta_log_bf = beta_binomial_unanimous_log_bf()
    payload = {
        "status": (
            "GEN/DERIVED provenance mathematics; stipulated p/dependence only; "
            "no truth, authorship, worker-quality, or physics inference"
        ),
        "fixture": {
            "nodes": N,
            "marginal_reliability": P,
            "target_average_pairwise_correlation": RHO_BAR,
            "observed_cluster": "17 unanimous positive mentions",
            "additional_evidence": "two independent negative roots, reliability 0.70 each",
        },
        "tree_results": [asdict(star), asdict(path)],
        "exchangeable_beta_binomial_unanimous_log_bf": beta_log_bf,
        "topology_spread": {
            "unanimous_log_bf_difference_path_minus_star": (
                path.unanimous_log_bf - star.unanimous_log_bf
            ),
            "posterior_difference_path_minus_star": (
                path.posterior_with_two_negative_roots
                - star.posterior_with_two_negative_roots
            ),
            "tail_log_bf_difference_path_minus_star": (
                path.count_tail_log_bf - star.count_tail_log_bf
            ),
            "beta_minus_star_unanimous_log_bf": beta_log_bf - star.unanimous_log_bf,
            "beta_minus_path_unanimous_log_bf": beta_log_bf - path.unanimous_log_bf,
        },
        "controls": controls,
        "conclusion": (
            "Equal marginal reliability and equal average pairwise correlation fix "
            "the count mean and variance but not the exact likelihood. Dependency "
            "topology/higher-order structure is therefore required for lossless "
            "provenance compression."
        ),
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
