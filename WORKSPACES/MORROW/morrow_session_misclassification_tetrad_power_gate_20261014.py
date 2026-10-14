#!/usr/bin/env python3
"""Morrow: symmetric session-label misclassification tetrad power gate.

Continue Enheduanna/Tern's four-probe two-factor fixture.  The true session
H is balanced, but the recorded label G flips independently with probability
epsilon.  Within each observed G stratum,

  Cov(X_i,X_j|G) = A d_i d_j + B_eps c_i c_j,
  A=pi_Z(1-pi_Z),  B_eps=epsilon(1-epsilon).

Hence the conditional tetrad is exactly

  T_eps = 4 epsilon(1-epsilon) T_pooled

for PI_H=1/2.  We solve the delta-method noncentral-chi-square power equation
for 50% joint two-stratum power at N=50,000, then verify it with an actually
executed seeded multinomial experiment.

Status: GEN/DERIVED synthetic identifiability mathematics; no authorship,
worker-independence, empirical, or SAT/H(s)H physics claim.
"""

from __future__ import annotations

import itertools
import json
import math

import numpy as np
from scipy.optimize import brentq
from scipy.stats import chi2, ncx2


PI_Z = 0.30
PI_H = 0.50
FALSE_POSITIVE = np.array([0.06, 0.08, 0.10, 0.12])
EXPOSURE_LIFT = np.array([0.64, 0.56, 0.50, 0.44])
SESSION_DIRECTION = np.array([0.18, -0.06, 0.12, -0.10])
TARGET_TETRAD_ABS = 0.000876204
N = 50_000
REPLICATES = 20_000
SEED = 20_261_014
PATTERNS = np.array(list(itertools.product((0, 1), repeat=4)), dtype=float)
CUTOFF = float(chi2.ppf(0.95, df=2))


def scaled_session_effect() -> np.ndarray:
    a = PI_Z * (1.0 - PI_Z)
    b = PI_H * (1.0 - PI_H)
    d, c = EXPOSURE_LIFT, SESSION_DIRECTION
    base = a * b * (d[0] * c[3] - c[0] * d[3]) * (d[1] * c[2] - c[1] * d[2])
    return SESSION_DIRECTION * math.sqrt(TARGET_TETRAD_ABS / abs(base))


def pattern_pmf_given_h(h: int, session_effect: np.ndarray) -> np.ndarray:
    pmf = np.zeros(16)
    for z in (0, 1):
        weight = PI_Z if z else 1.0 - PI_Z
        p = FALSE_POSITIVE + EXPOSURE_LIFT * z + session_effect * h
        if np.any((p < 0.0) | (p > 1.0)):
            raise ValueError("conditional response probability outside [0,1]")
        pmf += weight * np.prod(p**PATTERNS * (1.0 - p) ** (1.0 - PATTERNS), axis=1)
    return pmf / pmf.sum()


def covariance(pmf: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    mean = pmf @ PATTERNS
    second = (PATTERNS.T * pmf) @ PATTERNS
    return mean, second - np.outer(mean, mean)


def tetrad_from_cov(cov: np.ndarray) -> float:
    return float(cov[0, 1] * cov[2, 3] - cov[0, 2] * cov[1, 3])


def tetrads_from_freq(freq: np.ndarray) -> np.ndarray:
    mean = freq @ PATTERNS
    c12 = freq @ (PATTERNS[:, 0] * PATTERNS[:, 1]) - mean[:, 0] * mean[:, 1]
    c34 = freq @ (PATTERNS[:, 2] * PATTERNS[:, 3]) - mean[:, 2] * mean[:, 3]
    c13 = freq @ (PATTERNS[:, 0] * PATTERNS[:, 2]) - mean[:, 0] * mean[:, 2]
    c24 = freq @ (PATTERNS[:, 1] * PATTERNS[:, 3]) - mean[:, 1] * mean[:, 3]
    return c12 * c34 - c13 * c24


def delta_variance_per_observation(pmf: np.ndarray) -> float:
    mean, cov = covariance(pmf)

    def dc(i: int, j: int) -> np.ndarray:
        xi, xj = PATTERNS[:, i], PATTERNS[:, j]
        return xi * xj - xi * mean[j] - mean[i] * xj

    gradient = (
        cov[2, 3] * dc(0, 1)
        + cov[0, 1] * dc(2, 3)
        - cov[1, 3] * dc(0, 2)
        - cov[0, 2] * dc(1, 3)
    )
    return float(pmf @ gradient**2 - (pmf @ gradient) ** 2)


def observed_strata(
    epsilon: float, pmf_h: tuple[np.ndarray, np.ndarray]
) -> tuple[np.ndarray, np.ndarray]:
    # Balanced H and symmetric flips imply balanced G and these posterior weights.
    return (
        (1.0 - epsilon) * pmf_h[0] + epsilon * pmf_h[1],
        epsilon * pmf_h[0] + (1.0 - epsilon) * pmf_h[1],
    )


def asymptotic_power(
    epsilon: float, pmf_h: tuple[np.ndarray, np.ndarray]
) -> tuple[float, float, np.ndarray, np.ndarray]:
    strata = observed_strata(epsilon, pmf_h)
    tetrads = np.array([tetrad_from_cov(covariance(p)[1]) for p in strata])
    unit_variances = np.array([delta_variance_per_observation(p) for p in strata])
    n_per = N * 0.5
    noncentrality = float(np.sum(n_per * tetrads**2 / unit_variances))
    power = float(ncx2.sf(CUTOFF, df=2, nc=noncentrality))
    return power, noncentrality, tetrads, unit_variances


def wilson(successes: int, trials: int, z: float = 1.959963984540054) -> tuple[float, float]:
    p = successes / trials
    den = 1.0 + z * z / trials
    center = (p + z * z / (2.0 * trials)) / den
    half = z * math.sqrt(p * (1.0 - p) / trials + z * z / (4 * trials**2)) / den
    return center - half, center + half


def simulate_power(
    epsilon: float,
    pmf_h: tuple[np.ndarray, np.ndarray],
    seed: int,
) -> dict[str, object]:
    strata = observed_strata(epsilon, pmf_h)
    joint = np.concatenate((0.5 * strata[0], 0.5 * strata[1]))
    rng = np.random.default_rng(seed)
    counts = rng.multinomial(N, joint, size=REPLICATES).reshape(REPLICATES, 2, 16)
    n_g = counts.sum(axis=2)
    freq = counts / n_g[:, :, None]
    tetrads = np.column_stack(
        (tetrads_from_freq(freq[:, 0, :]), tetrads_from_freq(freq[:, 1, :]))
    )
    unit_variances = np.array([delta_variance_per_observation(p) for p in strata])
    se = np.sqrt(unit_variances[None, :] / n_g)
    statistic = np.sum((tetrads / se) ** 2, axis=1)
    rejected = statistic > CUTOFF
    successes = int(np.sum(rejected))
    return {
        "rejection_rate": successes / REPLICATES,
        "wilson95": wilson(successes, REPLICATES),
        "mean_tetrads": tetrads.mean(axis=0).tolist(),
        "empirical_sd": tetrads.std(axis=0, ddof=1).tolist(),
        "mean_delta_se": se.mean(axis=0).tolist(),
    }


def main() -> None:
    c = scaled_session_effect()
    pmf_h = (pattern_pmf_given_h(0, c), pattern_pmf_given_h(1, c))
    pooled = 0.5 * (pmf_h[0] + pmf_h[1])
    pooled_tetrad = tetrad_from_cov(covariance(pooled)[1])

    epsilon_50 = float(brentq(
        lambda e: asymptotic_power(e, pmf_h)[0] - 0.5,
        0.0, 0.5, xtol=2e-14,
    ))
    power50, nc50, t50, v50 = asymptotic_power(epsilon_50, pmf_h)
    exact_formula = 4.0 * epsilon_50 * (1.0 - epsilon_50) * pooled_tetrad
    simulation = simulate_power(epsilon_50, pmf_h, SEED)

    # Limits and negative control.
    power0, nc0, t0, _ = asymptotic_power(0.0, pmf_h)
    power_half, nc_half, t_half, _ = asymptotic_power(0.5, pmf_h)
    zero_h = (
        pattern_pmf_given_h(0, np.zeros(4)),
        pattern_pmf_given_h(1, np.zeros(4)),
    )
    zero_tetrads = np.array([
        tetrad_from_cov(covariance(p)[1])
        for p in observed_strata(0.37, zero_h)
    ])

    assert abs(power50 - 0.5) < 2e-12
    assert np.max(np.abs(t50 - exact_formula)) < 3e-17
    assert np.max(np.abs(t0)) < 3e-17
    assert np.max(np.abs(t_half - pooled_tetrad)) < 3e-17
    assert np.max(np.abs(zero_tetrads)) < 3e-17
    assert simulation["wilson95"][0] < 0.5 < simulation["wilson95"][1]

    payload = {
        "status": (
            "GEN/DERIVED synthetic identifiability mathematics; no authorship, "
            "worker-independence, empirical, or physics inference"
        ),
        "exact_result": {
            "formula": "T_eps=4*epsilon*(1-epsilon)*T_pooled",
            "pooled_tetrad": pooled_tetrad,
            "epsilon_for_50pct_asymptotic_power": epsilon_50,
            "label_accuracy_at_threshold": 1.0 - epsilon_50,
            "residual_tetrads": t50.tolist(),
            "formula_residual": float(np.max(np.abs(t50 - exact_formula))),
            "noncentrality": nc50,
            "delta_unit_variances": v50.tolist(),
            "joint_test_cutoff": CUTOFF,
        },
        "executed_seeded_check": {
            "sample_size": N,
            "replicates": REPLICATES,
            "seed": SEED,
            **simulation,
        },
        "limits_and_controls": {
            "epsilon_0_power": power0,
            "epsilon_0_noncentrality": nc0,
            "epsilon_0_tetrads": t0.tolist(),
            "epsilon_half_power": power_half,
            "epsilon_half_noncentrality": nc_half,
            "epsilon_half_tetrads": t_half.tolist(),
            "zero_session_effect_tetrads_at_epsilon_0p37": zero_tetrads.tolist(),
        },
        "conclusion": (
            "Conditioning repairs the one-factor tetrad only for sufficiently "
            "accurate session labels. Symmetric contamination restores the alias "
            "continuously; at this fixed N and effect size, the 50% power boundary "
            "is the reported epsilon threshold."
        ),
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
