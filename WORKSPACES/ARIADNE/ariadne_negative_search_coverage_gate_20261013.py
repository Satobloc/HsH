#!/usr/bin/env python3
"""Exact negative-search coverage and optimal inspection ordering.

Context
-------
Ariadne's current bounded search has N=56 unique candidate conversation groups
and k=9 perfect-inspection negatives.  This script quantifies what that can and
cannot establish.  It does not assign a probability to the historical source.

Model A: equal-weight catalog
-----------------------------
Let pi=P(target lies somewhere in the N-item catalog).  If k distinct items are
inspected and each inspection has false-negative probability eta, the eliminated
catalog mass is

    E = (1-eta) k/N.

Bayes' rule after k negative results gives

    P(outside catalog | negatives) = (1-pi)/(1-pi E).

For a desired outside posterior tau, the required weighted catalog coverage is

    C_required = (tau - 1 + pi) / (tau*pi*(1-eta)).

If C_required>1, the requested conclusion is impossible even after inspecting
the complete catalog.  The calculation is conditional on pi and eta; it is not
an archive-absence claim.

Model B: heterogeneous candidates
---------------------------------
Let p_i be the unconditional probability that candidate i is the unique target,
with sum(p_i)<=1, and let c_i>0 be inspection cost.  If inspection is perfect
and search stops on a hit, the expected cost of order sigma is

    E[C|sigma] = sum_j c_{sigma_j}(1-sum_{l<j} p_{sigma_l}).

An adjacent-swap proof gives i before j iff p_i/c_i >= p_j/c_j.  A bitmask
dynamic program independently verifies the ratio ordering on a deterministic
nine-candidate fixture.
"""

from __future__ import annotations

import argparse
import json
import math
from functools import lru_cache


def posterior_outside(pi: float, coverage: float, false_negative: float = 0.0) -> float:
    """Posterior target mass outside the catalog after a negative screened mass."""
    if not (0.0 <= pi <= 1.0):
        raise ValueError("pi must lie in [0,1]")
    if not (0.0 <= coverage <= 1.0):
        raise ValueError("coverage must lie in [0,1]")
    if not (0.0 <= false_negative <= 1.0):
        raise ValueError("false_negative must lie in [0,1]")
    evidence = 1.0 - pi * (1.0 - false_negative) * coverage
    if evidence == 0.0:
        raise ValueError("negative evidence has zero probability under the model")
    return (1.0 - pi) / evidence


def required_coverage(pi: float, tau: float, false_negative: float = 0.0) -> float:
    """Weighted catalog coverage needed for P(outside|negative)>=tau."""
    if not (0.0 < pi <= 1.0 and 0.0 < tau < 1.0):
        raise ValueError("require 0<pi<=1 and 0<tau<1")
    denominator = tau * pi * (1.0 - false_negative)
    if denominator == 0.0:
        return math.inf
    return max(0.0, (tau - 1.0 + pi) / denominator)


def expected_cost(order: tuple[int, ...], probabilities: list[float], costs: list[float]) -> float:
    survival = 1.0
    total = 0.0
    for i in order:
        total += costs[i] * survival
        survival -= probabilities[i]
    return total


def ratio_order(probabilities: list[float], costs: list[float]) -> tuple[int, ...]:
    return tuple(sorted(range(len(probabilities)), key=lambda i: (-probabilities[i] / costs[i], i)))


def dynamic_program_order(probabilities: list[float], costs: list[float]) -> tuple[float, tuple[int, ...]]:
    """Independent exact optimizer over all orderings using subset recursion."""
    n = len(probabilities)
    p_sum = [0.0] * (1 << n)
    for mask in range(1, 1 << n):
        bit = mask & -mask
        i = bit.bit_length() - 1
        p_sum[mask] = p_sum[mask ^ bit] + probabilities[i]

    @lru_cache(maxsize=None)
    def solve(mask: int) -> tuple[float, tuple[int, ...]]:
        if mask == (1 << n) - 1:
            return 0.0, ()
        survival = 1.0 - p_sum[mask]
        best_cost = math.inf
        best_order: tuple[int, ...] = ()
        for i in range(n):
            if mask & (1 << i):
                continue
            future_cost, future_order = solve(mask | (1 << i))
            candidate = costs[i] * survival + future_cost
            if candidate < best_cost - 1e-15:
                best_cost = candidate
                best_order = (i,) + future_order
        return best_cost, best_order

    return solve(0)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--candidates", type=int, default=56)
    parser.add_argument("--inspected", type=int, default=9)
    parser.add_argument("--target-posterior", type=float, default=0.95)
    args = parser.parse_args()
    if not 0 <= args.inspected <= args.candidates:
        raise ValueError("require 0 <= inspected <= candidates")

    coverage = args.inspected / args.candidates
    posterior_table = []
    for pi in (0.50, 0.80, 0.95):
        for eta in (0.00, 0.05):
            needed = required_coverage(pi, args.target_posterior, eta)
            posterior_table.append(
                {
                    "catalog_prior_pi": pi,
                    "false_negative_eta": eta,
                    "posterior_outside_after_current_negatives": posterior_outside(pi, coverage, eta),
                    "coverage_required_for_target": needed,
                    "minimum_total_items_if_equal_weight": (
                        math.ceil(needed * args.candidates - 1e-15) if needed <= 1.0 else None
                    ),
                    "target_achievable_by_exhaustive_catalog_search": needed <= 1.0,
                }
            )

    # Deterministic heterogeneous fixture; labels are synthetic, not source scores.
    probabilities = [0.24, 0.18, 0.12, 0.08, 0.06, 0.045, 0.035, 0.02, 0.01]
    costs = [8.0, 2.0, 5.0, 1.0, 4.0, 3.0, 2.0, 1.0, 1.0]
    greedy = ratio_order(probabilities, costs)
    greedy_cost = expected_cost(greedy, probabilities, costs)
    dp_cost, dp_order = dynamic_program_order(probabilities, costs)

    # Limiting and negative controls.
    assert math.isclose(posterior_outside(0.8, 0.0, 0.0), 0.2, abs_tol=1e-15)
    assert math.isclose(posterior_outside(0.8, 1.0, 0.0), 1.0, abs_tol=1e-15)
    assert abs(posterior_outside(0.8, 1.0, 0.05) - 5.0 / 6.0) < 1e-14
    assert greedy == dp_order
    assert abs(greedy_cost - dp_cost) < 1e-12
    equal_p = [0.1, 0.1, 0.1]
    equal_c = [1.0, 1.0, 1.0]
    assert abs(expected_cost((0, 1, 2), equal_p, equal_c) - expected_cost((2, 1, 0), equal_p, equal_c)) < 1e-15

    result = {
        "classification": "STD/DERIVED probability and scheduling; not a source-absence claim",
        "current_search": {
            "candidate_groups": args.candidates,
            "perfect_negatives": args.inspected,
            "equal_weight_catalog_coverage": coverage,
            "remaining_groups": args.candidates - args.inspected,
            "additional_for_90_percent_count_coverage": max(0, math.ceil(0.90 * args.candidates) - args.inspected),
            "additional_for_95_percent_count_coverage": max(0, math.ceil(0.95 * args.candidates) - args.inspected),
            "additional_for_99_percent_count_coverage": max(0, math.ceil(0.99 * args.candidates) - args.inspected),
            "expected_additional_inspections_if_target_uniform_in_remaining": (args.candidates - args.inspected + 1) / 2,
        },
        "posterior_sensitivity": posterior_table,
        "optimal_order_fixture": {
            "probabilities": probabilities,
            "costs": costs,
            "outside_catalog_probability": 1.0 - sum(probabilities),
            "ratio_order_zero_based": greedy,
            "ratio_order_p_over_c": [probabilities[i] / costs[i] for i in greedy],
            "expected_cost": greedy_cost,
            "dynamic_program_cost": dp_cost,
            "dynamic_program_agrees": greedy == dp_order and abs(greedy_cost - dp_cost) < 1e-12,
        },
        "failure_conditions": [
            "Candidate weights are not calibrated probabilities.",
            "Inspections have unmodeled or correlated false-negative rates.",
            "The candidate catalog omits unknown source classes.",
            "More than one item can satisfy the target definition.",
        ],
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
