#!/usr/bin/env python3
"""Hale: observable timestamp information needed to break parity alias.

GEN/DERIVED correspondence-inference calculation.  This replaces the
stipulated Mallows prior in Calder's four-landmark gate with an observable
sequential marker model

    T_i = i*Delta + epsilon_i,  epsilon_i ~ N(0,tau^2), i=0,...,3.

Sorting the four measured T_i induces weights on all 24 correspondences.
Those weights are inserted into Calder's exact noiseless parity-risk formula.
Scrambled Sobol Gaussian draws provide deterministic, repeatable quasi-Monte
Carlo integration; independent scrambles quantify numerical uncertainty.

The calculation does not assert that such timestamps exist in SAT/H(s)H.
"""

from __future__ import annotations

import hashlib
import math
from itertools import permutations

import numpy as np
from scipy.optimize import minimize_scalar
from scipy.special import logsumexp, ndtr, ndtri
from scipy.stats import qmc


PERMS = list(permutations(range(4)))
INV = np.array(
    [sum(p[i] > p[j] for i in range(4) for j in range(i + 1, 4)) for p in PERMS],
    dtype=float,
)
SIGN = (-1.0) ** INV
DISTINCT_POSITION = np.array([p.index(3) for p in PERMS])
ENCODE = np.array([1, 4, 16, 64], dtype=int)
LOOKUP = np.full(256, -1, dtype=int)
for index, p in enumerate(PERMS):
    LOOKUP[int(np.dot(p, ENCODE))] = index

MASTER_SEED = 20261015
MASTER_POWER = 20          # 1,048,576 quasi-random four-marker draws
UNCERTAINTY_POWER = 18     # 262,144 draws in each independent scramble
UNCERTAINTY_REPS = 8


def sobol_normals(seed: int, power: int) -> np.ndarray:
    u = qmc.Sobol(4, scramble=True, seed=seed).random_base2(power)
    return ndtri(np.clip(u, 1e-15, 1.0 - 1e-15))


def permutation_weights(tau_over_delta: float, z: np.ndarray) -> np.ndarray:
    if tau_over_delta < 0:
        raise ValueError("tau/Delta must be nonnegative")
    measured = np.arange(4, dtype=float) + tau_over_delta * z
    ordered = np.argsort(measured, axis=1)
    index = LOOKUP[ordered @ ENCODE]
    if np.any(index < 0):
        raise RuntimeError("invalid permutation encoding")
    return np.bincount(index, minlength=24).astype(float) / len(z)


def parity_bayes_error(weights: np.ndarray) -> float:
    """Calder's exact risk after geometry identifies (position, parity product)."""
    risk = 0.0
    for position in range(4):
        cell = DISTINCT_POSITION == position
        even = weights[cell & (SIGN == 1)].sum()
        odd = weights[cell & (SIGN == -1)].sum()
        risk += min(even, odd)
    return float(risk)


def threshold_for_error(target: float, z: np.ndarray, steps: int = 34) -> float:
    """Monotone bisection on tau/Delta using a fixed QMC design."""
    lo, hi = 0.02, 2.0
    for _ in range(steps):
        mid = 0.5 * (lo + hi)
        error = parity_bayes_error(permutation_weights(mid, z))
        if error < target:
            lo = mid
        else:
            hi = mid
    return 0.5 * (lo + hi)


def mallows_weights(lam: float) -> np.ndarray:
    logw = -lam * INV
    return np.exp(logw - logsumexp(logw))


def fit_mallows(weights: np.ndarray) -> tuple[float, float, float]:
    """Return KL-optimal lambda, KL(true||Mallows), and Mallows parity risk."""
    positive = weights > 0

    def kl(lam: float) -> float:
        qweights = mallows_weights(lam)
        return float(np.sum(weights[positive] * (
            np.log(weights[positive]) - np.log(qweights[positive])
        )))

    optimum = minimize_scalar(kl, bounds=(0.0, 20.0), method="bounded")
    fitted = mallows_weights(float(optimum.x))
    return float(optimum.x), float(optimum.fun), parity_bayes_error(fitted)


def binary_information_bits(correct_probability: float) -> float:
    error = 1.0 - correct_probability
    if error <= 0.0:
        return 1.0
    entropy = -error * math.log2(error) - (1.0 - error) * math.log2(1.0 - error)
    return 1.0 - entropy


def main() -> None:
    master = sobol_normals(MASTER_SEED, MASTER_POWER)
    targets = (0.10, 0.05, 0.01)

    print("HALE OBSERVABLE TIMESTAMP-ORDER INFORMATION GATE")
    print(f"master QMC samples          = {len(master):,}")
    print("model                       = T_i=i*Delta+N(0,tau^2), i=0..3")
    print("\ntarget  tau/Delta    Delta/tau  adjacent-correct  pair-info(bits)  fitted-lambda  KL-to-Mallows  Mallows-risk")

    results = []
    for target in targets:
        threshold = threshold_for_error(target, master)
        weights = permutation_weights(threshold, master)
        achieved = parity_bayes_error(weights)
        adjacent_correct = float(ndtr(1.0 / (math.sqrt(2.0) * threshold)))
        pair_bits = binary_information_bits(adjacent_correct)
        lam, kl, mallows_risk = fit_mallows(weights)
        results.append({
            "target": target,
            "threshold": threshold,
            "achieved": achieved,
            "adjacent_correct": adjacent_correct,
            "pair_bits": pair_bits,
            "lambda": lam,
            "kl": kl,
            "mallows_risk": mallows_risk,
        })
        print(
            f"{target:5.2%}  {threshold:10.8f}  {1/threshold:9.5f}  "
            f"{adjacent_correct:16.10f}  {pair_bits:15.10f}  "
            f"{lam:13.8f}  {kl:13.8f}  {mallows_risk:12.8f}"
        )

    # Independent randomized-QMC scrambles estimate threshold uncertainty.
    print("\nindependent-scramble threshold uncertainty (8 x 2^18)")
    for row in results:
        values = []
        for rep in range(UNCERTAINTY_REPS):
            z = sobol_normals(MASTER_SEED + 100 + rep, UNCERTAINTY_POWER)
            values.append(threshold_for_error(row["target"], z, steps=27))
        mean = float(np.mean(values))
        sd = float(np.std(values, ddof=1))
        span = float(np.ptp(values))
        row.update({"replicate_mean": mean, "replicate_sd": sd, "replicate_span": span})
        print(
            f"target={row['target']:.2%}: mean={mean:.9f}, "
            f"sd={sd:.3e}, span={span:.3e}"
        )

    # Limiting cases and negative controls.
    identity = np.zeros(24)
    identity[0] = 1.0
    uniform = np.full(24, 1.0 / 24.0)
    small_noise = parity_bayes_error(permutation_weights(0.10, master))
    large_noise = parity_bayes_error(permutation_weights(20.0, master))
    print("\ncontrols")
    print(f"tau=0 identity-prior risk  = {parity_bayes_error(identity):.12g}")
    print(f"tau/Delta=0.10 QMC risk    = {small_noise:.12g}")
    print(f"tau/Delta=20 QMC risk      = {large_noise:.12g}")
    print(f"order-discarded risk        = {parity_bayes_error(uniform):.12g}")
    print("common-mode timestamp noise = cancels exactly from every ordering")

    # Reproducibility and sanity assertions.
    assert parity_bayes_error(identity) == 0.0
    assert abs(parity_bayes_error(uniform) - 0.5) < 2e-16
    assert small_noise == 0.0
    assert abs(large_noise - 0.5) < 2e-4
    for row in results:
        assert abs(row["achieved"] - row["target"]) < 2e-6
        assert row["replicate_sd"] < 1.2e-4
    assert results[0]["threshold"] > results[1]["threshold"] > results[2]["threshold"]
    assert results[0]["mallows_risk"] < 0.095
    assert results[2]["kl"] < results[0]["kl"]

    digest = hashlib.sha256(open(__file__, "rb").read()).hexdigest()
    print(f"\nartifact sha256             = {digest}")
    print(
        "STATUS: GEN/DERIVED four-landmark correspondence inference. The "
        "timestamp model is observable in principle but stipulated here; no "
        "empirical marker, SAT/H(s)H mechanism, or physical validity is claimed."
    )


if __name__ == "__main__":
    main()
