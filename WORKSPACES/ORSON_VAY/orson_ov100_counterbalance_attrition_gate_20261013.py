#!/usr/bin/env python3
"""OV-100: exact attrition-robustness gate for OV-99 counterbalancing.

Status: STD/DERIVED synthetic experimental-design calculation.  No LLM trial
was administered and no behavioral claim is made.

OV-99 uses n_AB=n_BA=12 and the pair-difference fixture

    d_i = beta*s_i + gamma + error_i,

where s=+1 for AB and -1 for BA.  If attrition leaves a AB cases and b BA
cases, the design remains identifiable iff a*b>0.  Conditional on that,

    Var(beta_hat) = sigma^2*(a+b)/(4ab),

and relative to perfect balance at the same retained total, the variance
inflation factor is

    VIF = (a+b)^2/(4ab).

The unadjusted contrast remains beta_naive=beta+gamma*(a-b)/(a+b).  This
script enumerates the exact independent-binomial attrition distribution and
also gives the sharp adversarial loss bound from the original 12/12 design.
"""

from __future__ import annotations

import argparse
import json
import math


def binomial_pmf(k: int, n: int, retention: float) -> float:
    return math.comb(n, k) * retention**k * (1.0 - retention) ** (n - k)


def allocation_metrics(a: int, b: int, beta: float, gamma: float) -> dict[str, float | bool]:
    if min(a, b) < 0 or a + b == 0:
        raise ValueError("retained counts must be nonnegative with positive total")
    n = a + b
    naive = beta + gamma * (a - b) / n
    identifiable = a > 0 and b > 0
    return {
        "identifiable": identifiable,
        "naive_effect": naive,
        "naive_sign_reversal": naive * beta < 0.0,
        "vif_vs_balanced_same_n": math.inf if not identifiable else n * n / (4.0 * a * b),
    }


def exact_attrition_distribution(
    initial_per_order: int,
    retention_ab: float,
    retention_ba: float,
    beta: float,
    gamma: float,
    vif_threshold: float,
) -> dict[str, float]:
    if initial_per_order < 1 or not (0.0 <= retention_ab <= 1.0 and 0.0 <= retention_ba <= 1.0):
        raise ValueError("invalid allocation or retention probability")
    singular = high_vif = reversal = expected_vif = nonsingular = 0.0
    expected_retained = 0.0
    total_probability = 0.0
    for a in range(initial_per_order + 1):
        pa = binomial_pmf(a, initial_per_order, retention_ab)
        for b in range(initial_per_order + 1):
            p = pa * binomial_pmf(b, initial_per_order, retention_ba)
            total_probability += p
            expected_retained += p * (a + b)
            if a + b == 0 or a == 0 or b == 0:
                singular += p
                continue
            metrics = allocation_metrics(a, b, beta, gamma)
            nonsingular += p
            vif = float(metrics["vif_vs_balanced_same_n"])
            expected_vif += p * vif
            if vif > vif_threshold:
                high_vif += p
            if bool(metrics["naive_sign_reversal"]):
                reversal += p
    return {
        "probability_sum": total_probability,
        "expected_retained": expected_retained,
        "probability_singular": singular,
        "probability_vif_above_threshold": high_vif,
        "probability_naive_sign_reversal": reversal,
        "expected_vif_given_identifiable": expected_vif / nonsingular,
    }


def worst_case_after_losses(initial_per_order: int, losses: int) -> dict[str, float | int | bool]:
    """Adversary removes as many cases as possible from only one order arm."""
    if not 0 <= losses <= 2 * initial_per_order:
        raise ValueError("invalid loss count")
    if losses <= initial_per_order:
        a, b = initial_per_order - losses, initial_per_order
    else:
        a, b = 0, 2 * initial_per_order - losses
    if a == 0 or b == 0:
        vif = math.inf
    else:
        vif = (a + b) ** 2 / (4.0 * a * b)
    return {"losses": losses, "retained_ab": a, "retained_ba": b, "identifiable": a * b > 0, "worst_vif": vif}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--initial-per-order", type=int, default=12)
    parser.add_argument("--beta", type=float, default=0.12)
    parser.add_argument("--gamma", type=float, default=-0.20)
    parser.add_argument("--vif-threshold", type=float, default=1.5)
    args = parser.parse_args()

    scenarios = {
        "symmetric_retention_0.50": (0.50, 0.50),
        "symmetric_retention_0.75": (0.75, 0.75),
        "symmetric_retention_0.90": (0.90, 0.90),
        "asymmetric_retention_0.90_0.70": (0.90, 0.70),
        "stress_retention_0.95_0.50": (0.95, 0.50),
    }
    exact = {
        name: exact_attrition_distribution(
            args.initial_per_order, ra, rb, args.beta, args.gamma, args.vif_threshold
        )
        for name, (ra, rb) in scenarios.items()
    }
    adversarial = [worst_case_after_losses(args.initial_per_order, k) for k in range(13)]
    robust_losses = max(
        row["losses"]
        for row in adversarial
        if bool(row["identifiable"]) and float(row["worst_vif"]) <= args.vif_threshold
    )

    # Exact and negative controls.
    assert allocation_metrics(12, 12, args.beta, args.gamma)["vif_vs_balanced_same_n"] == 1.0
    assert allocation_metrics(12, 0, args.beta, args.gamma)["identifiable"] is False
    assert allocation_metrics(12, 0, args.beta, args.gamma)["naive_sign_reversal"] is True
    assert robust_losses == 8
    assert math.isinf(float(adversarial[12]["worst_vif"]))
    for result in exact.values():
        assert abs(result["probability_sum"] - 1.0) < 2e-14
        assert result["expected_vif_given_identifiable"] >= 1.0
    assert exact["symmetric_retention_0.90"]["probability_naive_sign_reversal"] < 1e-7
    assert exact["stress_retention_0.95_0.50"]["probability_naive_sign_reversal"] > 0.04

    output = {
        "classification": "STD/DERIVED synthetic design calculation; no behavioral trial",
        "initial_allocation": [args.initial_per_order, args.initial_per_order],
        "synthetic_fixture": {"beta": args.beta, "period_drift_gamma": args.gamma},
        "vif_threshold": args.vif_threshold,
        "maximum_adversarial_losses_with_vif_at_most_threshold": robust_losses,
        "adversarial_frontier": adversarial,
        "exact_binomial_attrition": exact,
        "derived_gate": (
            "Preregister balanced order and require the analyzed sample to retain both orders; "
            "report post-attrition VIF and adjusted beta, not the naive contrast."
        ),
        "failure_conditions": [
            "Attrition is informative beyond the modeled order-specific retention rates.",
            "Carryover or case-by-treatment interactions violate the two-column linear fixture.",
            "Repeated calls are not independent experimental units.",
            "The stipulated beta and gamma are synthetic and must not be reported as observations.",
        ],
    }
    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
