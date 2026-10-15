#!/usr/bin/env python3
"""Elias calculation relay: noisy identifiability of an SO(4) order alias.

Provenance/status: GEN/DERIVED sandbox mathematics. This extends Elias's
`elias_so4_order_spectrum_metric_gate_20261014_s2.py` (commit 4981fe0...) and
does not assert SAT/H(s)H physics or original-worker participation.

For A=R01(a), B=R12(b), u=AB e0, v=BA e0 and an anchored observation
Y ~ N(u, sigma^2 I_4) or N(v, sigma^2 I_4), equal priors give the exact
Bayes error

    P_e(n) = Phi[-sqrt(n) ||u-v|| / (2 sigma)]

for n independent observations.  The exact sample requirement for target p is

    n_min = ceil((2 sigma Phi^{-1}(1-p) / ||u-v||)^2).

If an unknown Haar-distributed global Q is independently applied and no anchor
is observed, Qu and Qv have the same uniform distribution on S^3.  Isotropic
noise preserves that equality, so every classifier has Bayes error 1/2.
"""

from __future__ import annotations

import math
from statistics import NormalDist

import numpy as np


ND = NormalDist()


def rotation(i: int, j: int, theta: float) -> np.ndarray:
    q = np.eye(4)
    c, s = math.cos(theta), math.sin(theta)
    q[i, i] = q[j, j] = c
    q[i, j], q[j, i] = -s, s
    return q


def ordered_directors(a: float, b: float) -> tuple[np.ndarray, np.ndarray]:
    A, B = rotation(0, 1, a), rotation(1, 2, b)
    e0 = np.array([1.0, 0.0, 0.0, 0.0])
    return A @ B @ e0, B @ A @ e0


def exact_distance(a: float, b: float) -> float:
    return 2.0 * abs(math.sin(a) * math.sin(b / 2.0))


def bayes_error(d: float, sigma: float, n: int = 1) -> float:
    if sigma <= 0 or n < 1:
        raise ValueError("sigma must be positive and n >= 1")
    return ND.cdf(-math.sqrt(n) * d / (2.0 * sigma))


def samples_for_error(d: float, sigma: float, target: float) -> int | None:
    if not 0.0 < target < 0.5:
        raise ValueError("target must lie in (0,1/2)")
    # Treat floating representations of exact trigonometric boundaries as zero.
    if abs(d) <= 16.0 * np.finfo(float).eps:
        return None
    z = ND.inv_cdf(1.0 - target)
    return math.ceil((2.0 * sigma * z / d) ** 2)


def simulate_anchored(u: np.ndarray, v: np.ndarray, sigma: float, n: int,
                      trials: int, seed: int) -> tuple[float, float]:
    """Monte Carlo error of the exact likelihood-ratio classifier."""
    rng = np.random.default_rng(seed)
    labels = rng.integers(0, 2, size=trials)
    means = np.where(labels[:, None] == 0, u, v)
    # The sample mean is sufficient and has covariance sigma^2 I / n.
    ybar = means + (sigma / math.sqrt(n)) * rng.normal(size=(trials, 4))
    delta = u - v
    midpoint = 0.5 * (u + v)
    pred = (np.einsum("ij,j->i", ybar - midpoint, delta) < 0.0).astype(int)
    err = float(np.mean(pred != labels))
    se = math.sqrt(err * (1.0 - err) / trials)
    return err, se


def haar_orthogonal(rng: np.random.Generator, count: int) -> np.ndarray:
    """Independent Haar O(4) draws; adequate because O(4) and SO(4) act
    identically transitively on S^3 for a single director."""
    out = np.empty((count, 4, 4))
    for k in range(count):
        z = rng.normal(size=(4, 4))
        q, r = np.linalg.qr(z)
        q = q @ np.diag(np.sign(np.diag(r)))
        out[k] = q
    return out


def unknown_frame_control(u: np.ndarray, v: np.ndarray, sigma: float,
                          trials: int, seed: int) -> tuple[float, float, float]:
    """Verify equal radial laws after independent unobserved global frames.

    A radius-threshold learner is trained on half the draws and evaluated on
    the other half. Since both classes have the same noncentral-chi radial law,
    its population error is exactly 1/2; the finite result is a negative
    control, not a proof replacing the group-action argument above.
    """
    rng = np.random.default_rng(seed)
    labels = rng.integers(0, 2, size=trials)
    base = np.where(labels[:, None] == 0, u, v)
    q = haar_orthogonal(rng, trials)
    y = np.einsum("nij,nj->ni", q, base) + sigma * rng.normal(size=(trials, 4))
    radius = np.linalg.norm(y, axis=1)
    cut = trials // 2
    # Choose orientation and threshold minimizing training error.
    candidates = np.quantile(radius[:cut], np.linspace(0.02, 0.98, 97))
    best = None
    for t in candidates:
        for orient in (0, 1):
            p = ((radius[:cut] > t).astype(int) ^ orient)
            e = float(np.mean(p != labels[:cut]))
            if best is None or e < best[0]:
                best = (e, t, orient)
    _, t, orient = best
    pred = ((radius[cut:] > t).astype(int) ^ orient)
    err = float(np.mean(pred != labels[cut:]))
    se = math.sqrt(err * (1.0 - err) / (trials - cut))
    # Radial mean difference is another directly interpretable null statistic.
    mean_gap = float(abs(radius[labels == 0].mean() - radius[labels == 1].mean()))
    return err, se, mean_gap


def main() -> None:
    a, b = 0.2387, 0.246
    sigma = 0.10
    u, v = ordered_directors(a, b)
    d = float(np.linalg.norm(u - v))
    assert abs(d - exact_distance(a, b)) < 2e-15

    print(f"a={a:.7f} b={b:.7f} sigma={sigma:.6f}")
    print(f"anchored separation d={d:.15f}")
    print(f"KL_per_sample={d*d/(2*sigma*sigma):.12f}")
    print(f"Bhattacharyya_exponent_per_sample={d*d/(8*sigma*sigma):.12f}")
    for target in (0.10, 0.05, 0.01):
        n = samples_for_error(d, sigma, target)
        assert n is not None
        prev = bayes_error(d, sigma, n - 1) if n > 1 else 0.5
        curr = bayes_error(d, sigma, n)
        assert curr <= target < prev
        print(f"target={target:.2%} n_min={n} exact_error={curr:.9f}")

    trials = 300_000
    for n in (1, 33, 65):
        theory = bayes_error(d, sigma, n)
        observed, se = simulate_anchored(u, v, sigma, n, trials, 1000 + n)
        z = abs(observed - theory) / se
        assert z < 4.5
        print(f"MC n={n:2d}: theory={theory:.9f} observed={observed:.9f} "
              f"SE={se:.9f} z={z:.3f}")

    null_err, null_se, radial_gap = unknown_frame_control(
        u, v, sigma, 80_000, seed=20261015
    )
    assert abs(null_err - 0.5) < 4.5 * null_se
    print(f"unknown-frame radial classifier: error={null_err:.9f} "
          f"SE={null_se:.9f} mean_radius_gap={radial_gap:.9f}")

    # Boundary and limiting controls.
    for aa, bb in ((0.0, b), (a, 0.0), (math.pi, math.pi)):
        uu, vv = ordered_directors(aa, bb)
        dd = float(np.linalg.norm(uu - vv))
        assert dd < 2e-15 and samples_for_error(dd, sigma, 0.05) is None
        assert abs(bayes_error(dd, sigma, 1000) - 0.5) < 2e-13
    eps = np.array([0.08, 0.04, 0.02, 0.01])
    ratios = np.array([exact_distance(e, e) / e**2 for e in eps])
    assert np.max(abs(ratios - 1.0)) < 0.004
    print("small-angle d/eps^2:", " ".join(f"{x:.9f}" for x in ratios))
    print("PASS")


if __name__ == "__main__":
    main()
