#!/usr/bin/env python3
"""OV-101: exact value of independent source groups under shared contamination.

GEN/DERIVED synthetic cognition model; not an administered LLM experiment.

Extends OV-100 while holding N reports fixed. Reports are partitioned into G
independent source groups of equal size m=N/G. Under a false target, each
source is contaminated independently with probability q, inducing correlated
reports within a group. Group labels are retained in the inference.
"""

from __future__ import annotations

import itertools
import json
import math
import numpy as np


def binom_pmf(m: int, p: float) -> np.ndarray:
    return np.array([math.comb(m, k) * p**k * (1-p)**(m-k)
                     for k in range(m+1)], dtype=float)


def metrics(N: int, G: int, pi: float, t: float,
            q: float, c: float, f: float) -> dict:
    assert N % G == 0
    m = N // G
    p1g = binom_pmf(m, t)
    p0g = (1-q)*binom_pmf(m, f) + q*binom_pmf(m, c)
    mi = 0.0
    bayes_error = 0.0
    normalization = [0.0, 0.0]
    for counts in itertools.product(range(m+1), repeat=G):
        p1 = float(np.prod(p1g[list(counts)]))
        p0 = float(np.prod(p0g[list(counts)]))
        normalization[0] += p0
        normalization[1] += p1
        joint0, joint1 = (1-pi)*p0, pi*p1
        mix = joint0 + joint1
        bayes_error += min(joint0, joint1)
        if joint0:
            mi += joint0 * math.log2(joint0 / ((1-pi)*mix))
        if joint1:
            mi += joint1 * math.log2(joint1 / (pi*mix))

    p1_all = t**N
    p0_all = ((1-q)*f**m + q*c**m)**G
    post_all = pi*p1_all / (pi*p1_all + (1-pi)*p0_all)
    asymptotic_post = pi / (pi + (1-pi)*q**G) if c == t else None
    return {
        "groups_G": G,
        "reports_per_group_m": m,
        "mutual_information_bits": mi,
        "bayes_error": bayes_error,
        "posterior_all_positive": post_all,
        "asymptotic_all_positive_ceiling_m_to_infinity": asymptotic_post,
        "normalization_error": max(abs(normalization[0]-1),
                                   abs(normalization[1]-1)),
    }


def classify_batch(rng: np.random.Generator, trials: int, N: int, G: int,
                   pi: float, t: float, q: float, c: float, f: float):
    m = N // G
    truth = rng.random(trials) < pi
    contaminated = rng.random((trials, G)) < q
    p = np.where(truth[:, None], t, np.where(contaminated, c, f))
    counts = rng.binomial(m, p)
    p1g = binom_pmf(m, t)
    p0g = (1-q)*binom_pmf(m, f) + q*binom_pmf(m, c)
    llr = math.log(pi/(1-pi)) + np.sum(
        np.log(p1g[counts] / p0g[counts]), axis=1)
    pred = llr >= 0
    errors = pred != truth
    rate = float(errors.mean())
    se = math.sqrt(rate*(1-rate)/trials)
    return rate, se


def run() -> dict:
    pi, t, q, c, f = 0.10, 0.90, 0.08, 0.90, 0.02
    N = 12
    table = [metrics(N, G, pi, t, q, c, f)
             for G in (1, 2, 3, 4, 6, 12)]

    rng = np.random.default_rng(20261015)
    trials = 400_000
    mc = []
    for G in (1, 3, 12):
        rate, se = classify_batch(rng, trials, N, G, pi, t, q, c, f)
        exact = next(x["bayes_error"] for x in table if x["groups_G"] == G)
        mc.append({"groups_G": G, "trials": trials, "error": rate,
                   "standard_error": se, "exact": exact,
                   "z_score": (rate-exact)/se})

    # Negative control: q=0 removes shared contamination; grouping must vanish.
    q0 = [metrics(N, G, pi, t, 0.0, c, f) for G in (1, 2, 3, 4, 6, 12)]
    q0_span = max(x["mutual_information_bits"] for x in q0) - min(
        x["mutual_information_bits"] for x in q0)

    # No-information control: if every false source is contaminated and c=t.
    q1 = metrics(N, 3, pi, t, 1.0, t, f)

    assert max(x["normalization_error"] for x in table) < 3e-12
    assert all(table[i+1]["mutual_information_bits"] >=
               table[i]["mutual_information_bits"]-1e-12
               for i in range(len(table)-1))
    assert q0_span < 2e-12
    assert q1["mutual_information_bits"] < 1e-12
    assert all(abs(x["z_score"]) < 3.5 for x in mc)

    return {
        "status": "GEN/DERIVED synthetic model; stipulated probabilities",
        "parameters": {"N": N, "pi": pi, "t": t, "q": q,
                       "c": c, "f": f},
        "exact_allocation_table": table,
        "monte_carlo_checks": mc,
        "controls": {
            "q_zero_grouping_MI_span": q0_span,
            "q_one_c_equals_t_MI_bits": q1["mutual_information_bits"],
        },
        "interpretation": (
            "Independent source acquisition, not report count alone, breaks "
            "the OV-100 shared-contamination ceiling."
        ),
    }


if __name__ == "__main__":
    print(json.dumps(run(), indent=2, sort_keys=True))
