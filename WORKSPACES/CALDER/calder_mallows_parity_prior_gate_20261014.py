#!/usr/bin/env python3
"""Calder: time-order prior needed to break the SO(4) correspondence alias.

GEN/DERIVED inference sandbox extending Aldus's four-landmark parity gate.
The three equal-radius landmarks admit odd permutation symmetries, so a
uniform correspondence prior makes proper and improper O(4) fits identical.

We impose a Mallows time-order prior

    P_lambda(pi) = exp[-lambda * inv(pi)] / Z(lambda),

where inv(pi) is the Kendall inversion count.  For each parity, the Gaussian
profile likelihood over the continuous orthogonal map is summed over all 24
correspondences with these weights.  The script derives the exact zero-noise
Bayes error by symmetry classes, solves lambda thresholds, and checks finite
noise by seeded Monte Carlo.  Lambda is stipulated prior information, not
evidence extracted from geometry or a SAT/H(s)H physical claim.
"""

from __future__ import annotations

import json
import math
from itertools import permutations

import numpy as np
from scipy.optimize import brentq
from scipy.special import logsumexp


SEED = 2026101420
TRIALS = 20_000
PERMS = np.array(list(permutations(range(4))), dtype=int)


def inversion_count(p: np.ndarray) -> int:
    return sum(int(p[i] > p[j]) for i in range(4) for j in range(i + 1, 4))


INV = np.array([inversion_count(p) for p in PERMS], dtype=float)
SIGN = np.array([(-1) ** int(v) for v in INV], dtype=int)


def mallows_weights(lam: float) -> np.ndarray:
    logw = -lam * INV
    return np.exp(logw - logsumexp(logw))


def prior_diagnostics(lam: float) -> dict:
    w = mallows_weights(lam)
    return {
        "lambda": lam,
        "adjacent_inversion_odds_ratio": math.exp(lam),
        "identity_probability": float(w[0]),
        "mean_inversions": float(w @ INV),
    }


def distinct_axis_position(p: np.ndarray) -> int:
    """Observed column occupied by source landmark 3 under x[:,p]."""
    return int(np.flatnonzero(p == 3)[0])


def exact_noiseless_error_from_weights(w: np.ndarray) -> float:
    """Bayes risk over the eight identifiable (position, chirality) classes.

    Exact data identify the position of the radius-0.4 landmark and the
    product of geometric parity with permutation parity.  They cannot identify
    either factor separately.  With equal geometric-parity priors, summing the
    smaller class mass gives the exact Bayes error.
    """
    risk = 0.0
    for position in range(4):
        even = float(w[(SIGN == 1) & np.array([
            distinct_axis_position(p) == position for p in PERMS
        ])].sum())
        odd = float(w[(SIGN == -1) & np.array([
            distinct_axis_position(p) == position for p in PERMS
        ])].sum())
        # Two chirality classes each contribute 1/2 min(even,odd).
        risk += min(even, odd)
    return risk


def exact_noiseless_error(lam: float) -> float:
    return exact_noiseless_error_from_weights(mallows_weights(lam))


def parity_rss(y_aligned: np.ndarray, x: np.ndarray, parity: int) -> np.ndarray:
    m = y_aligned @ x.T
    s = np.linalg.svd(m, compute_uv=False)
    sign_m = np.sign(np.linalg.det(m))
    optimum = s.sum(axis=-1) - 2.0 * s[..., -1] * (sign_m != parity)
    return (
        (y_aligned * y_aligned).sum(axis=(-2, -1))
        + (x * x).sum()
        - 2.0 * optimum
    )


def all_profile_rss(y: np.ndarray, x: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    plus, minus = [], []
    for p in PERMS:
        aligned = y[:, :, p]
        plus.append(parity_rss(aligned, x, +1))
        minus.append(parity_rss(aligned, x, -1))
    return np.column_stack(plus), np.column_stack(minus)


def wilson95(k: int, n: int) -> tuple[float, float]:
    z = 1.959963984540054
    phat = k / n
    den = 1.0 + z * z / n
    center = (phat + z * z / (2 * n)) / den
    radius = z / den * math.sqrt(phat * (1 - phat) / n + z * z / (4 * n * n))
    return center - radius, center + radius


def finite_noise_cell(lam: float, sigma: float, seed: int) -> dict:
    rng = np.random.default_rng(seed)
    x = np.diag([1.0, 1.0, 1.0, 0.4])
    w = mallows_weights(lam)
    true_index = rng.choice(len(PERMS), size=TRIALS, p=w)
    true_parity = rng.choice(np.array([-1, 1]), size=TRIALS)
    reflection = np.diag([-1.0, 1.0, 1.0, 1.0])
    y = np.empty((TRIALS, 4, 4))
    for i, (index, parity) in enumerate(zip(true_index, true_parity)):
        q = np.eye(4) if parity == 1 else reflection
        y[i] = (q @ x)[:, PERMS[index]]
    y += rng.normal(0.0, sigma, size=y.shape)

    rp, rm = all_profile_rss(y, x)
    logw = np.log(w)
    log_plus = logsumexp(logw[None, :] - rp / (2.0 * sigma * sigma), axis=1)
    log_minus = logsumexp(logw[None, :] - rm / (2.0 * sigma * sigma), axis=1)
    predicted = np.where(log_plus >= log_minus, 1, -1)
    wrong = int(np.count_nonzero(predicted != true_parity))
    lo, hi = wilson95(wrong, TRIALS)
    return {
        "lambda": lam,
        "sigma_over_L": sigma,
        "wrong": wrong,
        "trials": TRIALS,
        "error": wrong / TRIALS,
        "wilson95": [lo, hi],
    }


def symmetrized_parity_blind_weights(lam: float) -> np.ndarray:
    """Negative control: equalize each permutation with odd swap (0,1)."""
    w = mallows_weights(lam)
    lookup = {tuple(p): i for i, p in enumerate(PERMS)}
    out = np.empty_like(w)
    for i, p in enumerate(PERMS):
        partner = p.copy()
        partner[partner == 0] = -1
        partner[partner == 1] = 0
        partner[partner == -1] = 1
        j = lookup[tuple(partner)]
        out[i] = 0.5 * (w[i] + w[j])
    return out / out.sum()


def main() -> None:
    # Exact thresholds are deterministic, not Monte Carlo fits.
    targets = (0.10, 0.05, 0.01)
    thresholds = {
        str(target): brentq(lambda z: exact_noiseless_error(z) - target, 1e-12, 20.0)
        for target in targets
    }

    grid = [0.0, 0.1, 0.25, 0.5, 1.0, 2.0, 4.0, 8.0]
    exact_rows = []
    for lam in grid:
        row = prior_diagnostics(lam)
        row["exact_noiseless_error"] = exact_noiseless_error(lam)
        exact_rows.append(row)

    # Evaluate the exact thresholds at two noise levels with independent seeds.
    test_lambdas = [0.0] + [thresholds[str(t)] for t in targets] + [8.0]
    mc_rows = []
    for j, lam in enumerate(test_lambdas):
        for i, sigma in enumerate((0.02, 0.05)):
            mc_rows.append(finite_noise_cell(lam, sigma, SEED + 17 * j + i))

    # At lambda=0, correspondence parity is exactly balanced.  Even a highly
    # concentrated prior is useless if it is symmetrized across every odd mate.
    uniform_error = exact_noiseless_error(0.0)
    blind_error = exact_noiseless_error_from_weights(symmetrized_parity_blind_weights(8.0))

    # Direct algebraic validation of the class formula by its probability sum.
    assert abs(mallows_weights(0.0).sum() - 1.0) < 2e-16
    assert abs(uniform_error - 0.5) < 2e-16
    assert abs(blind_error - 0.5) < 2e-16
    for target, lam in thresholds.items():
        assert abs(exact_noiseless_error(lam) - float(target)) < 2e-12
    assert exact_noiseless_error(8.0) < 1e-3

    out = {
        "model": {
            "landmark_radii_over_L": [1.0, 1.0, 1.0, 0.4],
            "prior": "P(pi) proportional to exp(-lambda * Kendall_inversions(pi))",
            "decision": "equal-parity-prior Gaussian profile score, summed over 24 correspondences",
        },
        "exact_noiseless_grid": exact_rows,
        "exact_lambda_thresholds": {
            target: {
                **prior_diagnostics(lam),
                "target_error": float(target),
            }
            for target, lam in thresholds.items()
        },
        "finite_noise_monte_carlo": mc_rows,
        "negative_controls": {
            "uniform_prior_error": uniform_error,
            "lambda8_but_odd_partner_symmetrized_error": blind_error,
        },
        "status": "GEN/DERIVED correspondence-identifiability calculation",
        "boundary": "stipulated time-order prior; no empirical or SAT/H(s)H physical claim",
    }
    print(json.dumps(out, indent=2, sort_keys=True))
    print("PASS: quantified the time-order prior needed to break the exact parity alias")


if __name__ == "__main__":
    main()
