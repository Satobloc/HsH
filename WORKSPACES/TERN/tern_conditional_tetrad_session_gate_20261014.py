#!/usr/bin/env python3
"""Tern conditional-tetrad session-label gate.

GEN/DERIVED synthetic identifiability mathematics.  Continue Enheduanna's
two-factor alias model and test the proposed control: if session state H is
recorded, do tetrads conditional on H recover the one-factor exposure model?

For probes conditionally independent given latent exposure Z and observed H,

  P(X_i=1 | Z,H) = f_i + d_i Z + c_i H,

and independent Z,H, the off-diagonal conditional covariance is

  Cov(X_i,X_j | H=h) = A d_i d_j,  A=pi_Z(1-pi_Z).

Therefore every conditional tetrad is exactly zero.  This solver checks the
identity, its finite-sample joint chi-square calibration, and a shuffled-label
negative control.  It is not evidence about authorship, worker independence,
or SAT/H(s)H physics.
"""

from __future__ import annotations

import itertools
import math

import numpy as np
from scipy.stats import chi2


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
    """Vectorized tetrads for rows of normalized 16-cell tables."""
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


def wilson(successes: int, trials: int, z: float = 1.959963984540054) -> tuple[float, float]:
    p = successes / trials
    den = 1.0 + z * z / trials
    center = (p + z * z / (2.0 * trials)) / den
    half = z * math.sqrt(p * (1 - p) / trials + z * z / (4 * trials * trials)) / den
    return center - half, center + half


def simulate_joint(
    conditional_pmfs: tuple[np.ndarray, np.ndarray],
    rng: np.random.Generator,
) -> dict[str, object]:
    joint = np.concatenate(((1.0 - PI_H) * conditional_pmfs[0], PI_H * conditional_pmfs[1]))
    counts = rng.multinomial(N, joint, size=REPLICATES).reshape(REPLICATES, 2, 16)
    n_h = counts.sum(axis=2)
    freq_h = counts / n_h[:, :, None]
    t_h = np.column_stack(
        (tetrads_from_freq(freq_h[:, 0, :]), tetrads_from_freq(freq_h[:, 1, :]))
    )

    unit_variance = np.array(
        [delta_variance_per_observation(conditional_pmfs[h]) for h in (0, 1)]
    )
    se_h = np.sqrt(unit_variance[None, :] / n_h)
    joint_stat = np.sum((t_h / se_h) ** 2, axis=1)
    cutoff = float(chi2.ppf(0.95, df=2))
    joint_reject = joint_stat > cutoff

    pooled_freq = counts.sum(axis=1) / N
    pooled_t = tetrads_from_freq(pooled_freq)
    pooled_pmf = joint[:16] + joint[16:]
    pooled_se = math.sqrt(delta_variance_per_observation(pooled_pmf) / N)
    pooled_reject = np.abs(pooled_t) > 1.959963984540054 * pooled_se

    joint_successes = int(joint_reject.sum())
    pooled_successes = int(pooled_reject.sum())
    return {
        "joint_conditional_rejection": joint_successes / REPLICATES,
        "joint_conditional_wilson95": wilson(joint_successes, REPLICATES),
        "pooled_rejection": pooled_successes / REPLICATES,
        "pooled_wilson95": wilson(pooled_successes, REPLICATES),
        "mean_conditional_tetrads": t_h.mean(axis=0),
        "empirical_conditional_sd": t_h.std(axis=0, ddof=1),
        "mean_delta_se": se_h.mean(axis=0),
        "chi2_cutoff": cutoff,
    }


def main() -> None:
    c = scaled_session_effect()
    pmf_h = (pattern_pmf_given_h(0, c), pattern_pmf_given_h(1, c))
    pooled = (1.0 - PI_H) * pmf_h[0] + PI_H * pmf_h[1]

    exact_conditional = np.array([tetrad_from_cov(covariance(p)[1]) for p in pmf_h])
    exact_pooled = tetrad_from_cov(covariance(pooled)[1])

    # If recorded labels are randomized independently of true H, each apparent
    # stratum has the pooled distribution and retains the alias tetrad.
    shuffled_exact = np.array([exact_pooled, exact_pooled])

    correct = simulate_joint(pmf_h, np.random.default_rng(SEED))
    shuffled = simulate_joint((pooled, pooled), np.random.default_rng(SEED + 1))

    # Negative control: without a session effect, pooling is one-factor too.
    zero_pmfs = (
        pattern_pmf_given_h(0, np.zeros(4)),
        pattern_pmf_given_h(1, np.zeros(4)),
    )
    zero_pooled = (1.0 - PI_H) * zero_pmfs[0] + PI_H * zero_pmfs[1]
    zero_tetrad = tetrad_from_cov(covariance(zero_pooled)[1])

    assert np.max(np.abs(exact_conditional)) < 3e-17
    assert abs(abs(exact_pooled) - TARGET_TETRAD_ABS) < 3e-16
    assert np.max(np.abs(shuffled_exact - exact_pooled)) == 0.0
    assert abs(zero_tetrad) < 3e-17
    assert correct["joint_conditional_wilson95"][0] < 0.05 < correct["joint_conditional_wilson95"][1]
    assert shuffled["joint_conditional_rejection"] > 0.999
    assert correct["pooled_rejection"] > 0.999

    print(f"session_effect={c.tolist()}")
    print(f"exact_pooled_tetrad={exact_pooled:.12g}")
    print(f"exact_conditional_tetrads={exact_conditional.tolist()}")
    print(f"correct_label_joint_rejection={correct['joint_conditional_rejection']:.9f}")
    print(f"correct_label_joint_wilson95={correct['joint_conditional_wilson95']}")
    print(f"correct_label_pooled_rejection={correct['pooled_rejection']:.9f}")
    print(f"conditional_empirical_sd={correct['empirical_conditional_sd'].tolist()}")
    print(f"conditional_mean_delta_se={correct['mean_delta_se'].tolist()}")
    print(f"shuffled_label_exact_tetrads={shuffled_exact.tolist()}")
    print(f"shuffled_label_joint_rejection={shuffled['joint_conditional_rejection']:.9f}")
    print(f"no_session_pooled_tetrad={zero_tetrad:.3e}")
    print(f"replicates={REPLICATES},sample_size={N},seed={SEED}")
    print("status=PASS")
    print(
        "boundary=labels restore the one-factor tetrad null only if they track "
        "the actual session factor and the additive conditional-independence model holds"
    )


if __name__ == "__main__":
    main()
