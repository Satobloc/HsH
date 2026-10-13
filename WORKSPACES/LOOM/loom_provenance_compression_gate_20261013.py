#!/usr/bin/env python3
"""Loom provenance-compression gate: clones are not evidence channels.

Model (deliberately narrow): binary truth T has prior 1/2.  Independent root
source r reports T correctly with known reliability p_r>1/2.  Every derivative
record attached to that root is a deterministic clone of its report.  Then

  log BF(T=1:T=0) = sum_r (2 v_r - 1) log[p_r/(1-p_r)].

Clone multiplicity is absent.  A lossless compact token for this model must
retain (root id, root vote, root likelihood weight); a claim-only mention count
is not lossless.  This is a synthetic information-preservation calculation,
not an estimate of any SAT/H(s)H source's truth or worker reliability.
"""

from __future__ import annotations

import math
import numpy as np


def logistic(x: float) -> float:
    if x >= 0.0:
        z = math.exp(-x)
        return 1.0 / (1.0 + z)
    z = math.exp(x)
    return z / (1.0 + z)


def root_log_bayes(votes: np.ndarray, reliability: np.ndarray) -> float:
    signs = 2.0 * votes - 1.0
    weights = np.log(reliability / (1.0 - reliability))
    return float(signs @ weights)


def exact_posterior(votes: np.ndarray, reliability: np.ndarray) -> float:
    return logistic(root_log_bayes(votes, reliability))


def expand_clones(
    votes: np.ndarray, reliability: np.ndarray, multiplicity: np.ndarray
) -> tuple[np.ndarray, np.ndarray]:
    return np.repeat(votes, multiplicity), np.repeat(reliability, multiplicity)


def direct_likelihood_posterior(votes: np.ndarray, reliability: np.ndarray) -> float:
    like_one = float(np.prod(np.where(votes == 1, reliability, 1.0-reliability)))
    like_zero = float(np.prod(np.where(votes == 0, reliability, 1.0-reliability)))
    return like_one / (like_one + like_zero)


def case(
    label: str,
    votes: list[int],
    reliability: list[float],
    multiplicity: list[int],
) -> dict[str, float | int | str]:
    v = np.asarray(votes, dtype=float)
    p = np.asarray(reliability, dtype=float)
    m = np.asarray(multiplicity, dtype=int)
    clone_v, clone_p = expand_clones(v, p, m)
    proper = exact_posterior(v, p)
    naive = exact_posterior(clone_v, clone_p)
    direct = direct_likelihood_posterior(v, p)
    return {
        "label": label,
        "roots": len(v),
        "mentions": int(np.sum(m)),
        "compression_ratio": float(np.sum(m) / len(v)),
        "proper": proper,
        "naive": naive,
        "inflation": naive - proper,
        "direct_check": abs(direct - proper),
    }


def monte_carlo(seed: int = 20261013, trials: int = 20_000) -> dict[str, float]:
    rng = np.random.default_rng(seed)
    invariant_errors = []
    lossy_errors = []
    negative_control_errors = []
    for _ in range(trials):
        roots = int(rng.integers(2, 13))
        votes = rng.integers(0, 2, roots).astype(float)
        reliability = rng.uniform(0.55, 0.95, roots)
        multiplicity = rng.integers(1, 21, roots)

        proper = exact_posterior(votes, reliability)
        clone_v, clone_p = expand_clones(votes, reliability, multiplicity)
        lossy = exact_posterior(clone_v, clone_p)

        # Dependency-aware compression reconstructs one token per root exactly.
        reconstructed = exact_posterior(votes.copy(), reliability.copy())
        invariant_errors.append(abs(reconstructed - proper))
        lossy_errors.append(abs(lossy - proper))

        # Negative control: when every record is an independent root, mention
        # counting and root counting are the same model.
        unit_v, unit_p = expand_clones(votes, reliability, np.ones(roots, dtype=int))
        negative_control_errors.append(
            abs(exact_posterior(unit_v, unit_p) - proper)
        )

    loss = np.asarray(lossy_errors)
    return {
        "max_dependency_aware_error": max(invariant_errors),
        "max_singleton_control_error": max(negative_control_errors),
        "median_lossy_abs_error": float(np.median(loss)),
        "p95_lossy_abs_error": float(np.quantile(loss, 0.95)),
        "max_lossy_abs_error": float(np.max(loss)),
        "fraction_lossy_error_gt_0p1": float(np.mean(loss > 0.1)),
    }


def main() -> None:
    unanimous = case(
        "five roots expanded to nineteen unanimous mentions",
        votes=[1, 1, 1, 1, 1],
        reliability=[0.7]*5,
        multiplicity=[10, 3, 3, 2, 1],
    )
    adversarial = case(
        "one strong yes root cloned seventeen times versus two no roots",
        votes=[1, 0, 0],
        reliability=[0.9, 0.7, 0.7],
        multiplicity=[17, 1, 1],
    )
    singleton = case(
        "all mentions are independent roots",
        votes=[1, 1, 0, 1, 0],
        reliability=[0.72, 0.68, 0.83, 0.61, 0.77],
        multiplicity=[1, 1, 1, 1, 1],
    )

    for item in (unanimous, adversarial, singleton):
        print(
            f"{item['label']}: roots={item['roots']}, mentions={item['mentions']}, "
            f"ratio={item['compression_ratio']:.3f}, proper={item['proper']:.12f}, "
            f"naive={item['naive']:.12f}, inflation={item['inflation']:+.12f}"
        )
        assert item["direct_check"] < 2e-15

    audit = monte_carlo()
    for key, value in audit.items():
        print(f"{key}={value:.12g}")

    assert abs(singleton["naive"] - singleton["proper"]) < 2e-15
    assert audit["max_dependency_aware_error"] == 0.0
    assert audit["max_singleton_control_error"] == 0.0
    assert unanimous["proper"] < 0.99 < unanimous["naive"]
    assert adversarial["proper"] < 0.65
    assert adversarial["naive"] > 0.999999999
    assert audit["fraction_lossy_error_gt_0p1"] > 0.25

    print("status=PASS")
    print(
        "boundary=perfect deterministic clones and stipulated source "
        "reliabilities; real dependence and reliability must be estimated"
    )


if __name__ == "__main__":
    main()
