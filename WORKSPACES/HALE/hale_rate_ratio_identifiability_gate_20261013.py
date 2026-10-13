#!/usr/bin/env python3
"""Exact rate-ratio and transport-bias gate for archive trend comparisons.

This is standard probability/statistics, not a SAT/H(s)H physical claim.

Counts Y0,Y1 observed over exposures T0,T1 are modeled as independent
Poisson variables.  Conditional on n=Y0+Y1,

    Y1 | n ~ Binomial(n, p),
    p = rho*T1 / (T0 + rho*T1),

where rho=lambda1/lambda0.  An exact Clopper-Pearson interval for p maps to

    rho = (p/(1-p))*(T0/T1).

If transport returns fractions q0,q1 of the true records, the observed ratio
is r_obs=(q1/q0)*rho.  Given only qmin <= qi <= 1, the sharp identified set is

    r_obs*qmin <= rho <= r_obs/qmin.

Thus a reported increase is sign-identifiable only when r_obs > 1/qmin.
Bonferroni simultaneous intervals use alpha/m per tested keyword family.
"""

from __future__ import annotations

import argparse
import json
import math


def _betacf(a: float, b: float, x: float) -> float:
    """Continued fraction for the incomplete beta (Numerical Recipes form)."""
    max_iter, eps, fpmin = 300, 3e-14, 1e-300
    qab, qap, qam = a + b, a + 1.0, a - 1.0
    c = 1.0
    d = 1.0 - qab * x / qap
    d = fpmin if abs(d) < fpmin else d
    d = 1.0 / d
    h = d
    for m in range(1, max_iter + 1):
        m2 = 2 * m
        aa = m * (b - m) * x / ((qam + m2) * (a + m2))
        d = 1.0 + aa * d
        d = fpmin if abs(d) < fpmin else d
        c = 1.0 + aa / c
        c = fpmin if abs(c) < fpmin else c
        d = 1.0 / d
        h *= d * c
        aa = -(a + m) * (qab + m) * x / ((a + m2) * (qap + m2))
        d = 1.0 + aa * d
        d = fpmin if abs(d) < fpmin else d
        c = 1.0 + aa / c
        c = fpmin if abs(c) < fpmin else c
        d = 1.0 / d
        delta = d * c
        h *= delta
        if abs(delta - 1.0) < eps:
            return h
    raise ArithmeticError("incomplete-beta continued fraction did not converge")


def regularized_beta(x: float, a: float, b: float) -> float:
    if not (a > 0.0 and b > 0.0 and 0.0 <= x <= 1.0):
        raise ValueError("require a,b>0 and x in [0,1]")
    if x == 0.0:
        return 0.0
    if x == 1.0:
        return 1.0
    front = math.exp(
        math.lgamma(a + b) - math.lgamma(a) - math.lgamma(b)
        + a * math.log(x) + b * math.log1p(-x)
    )
    if x < (a + 1.0) / (a + b + 2.0):
        return front * _betacf(a, b, x) / a
    return 1.0 - front * _betacf(b, a, 1.0 - x) / b


def beta_ppf(prob: float, a: float, b: float) -> float:
    if not 0.0 <= prob <= 1.0:
        raise ValueError("probability must lie in [0,1]")
    if prob in (0.0, 1.0):
        return prob
    lo, hi = 0.0, 1.0
    for _ in range(180):
        mid = (lo + hi) / 2.0
        if regularized_beta(mid, a, b) < prob:
            lo = mid
        else:
            hi = mid
    return (lo + hi) / 2.0


def clopper_pearson(k: int, n: int, alpha: float) -> tuple[float, float]:
    if not (0 <= k <= n and n > 0 and 0.0 < alpha < 1.0):
        raise ValueError("require 0<=k<=n, n>0, and 0<alpha<1")
    lower = 0.0 if k == 0 else beta_ppf(alpha / 2.0, k, n - k + 1)
    upper = 1.0 if k == n else beta_ppf(1.0 - alpha / 2.0, k + 1, n - k)
    return lower, upper


def rate_ratio_interval(
    y0: int, y1: int, t0: float, t1: float, alpha: float = 0.05, tests: int = 1
) -> dict[str, float]:
    if min(y0, y1) < 0 or t0 <= 0.0 or t1 <= 0.0 or tests < 1:
        raise ValueError("counts nonnegative; exposures positive; tests>=1")
    n = y0 + y1
    if n == 0:
        raise ValueError("two zero counts do not identify a rate ratio")
    adjusted_alpha = alpha / tests
    p_lo, p_hi = clopper_pearson(y1, n, adjusted_alpha)
    rr_hat = math.inf if y0 == 0 else (y1 / t1) / (y0 / t0)
    rr_lo = 0.0 if p_lo == 0.0 else (p_lo / (1.0 - p_lo)) * (t0 / t1)
    rr_hi = math.inf if p_hi == 1.0 else (p_hi / (1.0 - p_hi)) * (t0 / t1)
    return {
        "rate_ratio_hat": rr_hat,
        "lower": rr_lo,
        "upper": rr_hi,
        "familywise_confidence": 1.0 - alpha,
        "tests": tests,
        "per_interval_alpha": adjusted_alpha,
    }


def transport_identified_set(observed_ratio: float, qmin: float) -> tuple[float, float]:
    if observed_ratio < 0.0 or not 0.0 < qmin <= 1.0:
        raise ValueError("observed ratio nonnegative and 0<qmin<=1 required")
    return observed_ratio * qmin, observed_ratio / qmin


def exact_conditional_coverage(n: int, p: float, alpha: float) -> float:
    """Enumerate exact binomial coverage of the Clopper-Pearson interval."""
    total = 0.0
    for k in range(n + 1):
        lo, hi = clopper_pearson(k, n, alpha)
        if lo <= p <= hi:
            total += math.comb(n, k) * p**k * (1.0 - p) ** (n - k)
    return total


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--qmin", type=float, default=0.90)
    args = parser.parse_args()

    single = rate_ratio_interval(100, 120, 1.0, 1.0)
    simultaneous = rate_ratio_interval(100, 120, 1.0, 1.0, tests=20)
    transport_110 = transport_identified_set(1.10, args.qmin)
    transport_120 = transport_identified_set(1.20, args.qmin)
    coverage = exact_conditional_coverage(40, 0.5, 0.05)

    # Limiting cases and negative controls.
    assert transport_identified_set(1.0, 1.0) == (1.0, 1.0)
    assert transport_110[0] < 1.0 < transport_110[1]  # apparent +10% is ambiguous
    assert transport_120[0] > 1.0                     # apparent +20% survives q>=0.9
    assert single["lower"] < 1.0 < single["upper"]   # 100 vs 120 is not significant
    assert simultaneous["lower"] < single["lower"]
    assert simultaneous["upper"] > single["upper"]
    assert coverage >= 0.95
    assert math.isinf(rate_ratio_interval(0, 3, 1.0, 1.0)["upper"])

    result = {
        "classification": "STD/DERIVED conditional Poisson inference; not a physics claim",
        "fixture_counts": {"baseline": 100, "comparison": 120, "exposures": [1.0, 1.0]},
        "exact_95_percent_interval": single,
        "bonferroni_20_keyword_interval": simultaneous,
        "transport_fraction_lower_bound": args.qmin,
        "sharp_transport_sets": {
            "observed_ratio_1.10": transport_110,
            "observed_ratio_1.20": transport_120,
        },
        "increase_identifiability_threshold": 1.0 / args.qmin,
        "exact_CP_coverage_n40_equal_rates": coverage,
        "failure_conditions": [
            "Counts are not adequately modeled as independent Poisson events.",
            "Exposure denominators are wrong or incomparable.",
            "Transport completeness falls below qmin or differs outside the bound.",
            "Keyword tests are selected after seeing results or are strongly dependent.",
        ],
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
