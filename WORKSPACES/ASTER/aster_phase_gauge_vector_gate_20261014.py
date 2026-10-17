#!/usr/bin/env python3
"""Aster: phase-gauge gate for Loom's finite-slab moment inversion.

GEN/DERIVED geometry only.  For

    h(t) = 1{|A sin(t-alpha)-d| <= a},

define the accessible fraction f and the laboratory first-harmonic vector

    S = <h sin t>,   C = <h cos t>.

In the unsaturated regime, Loom's canonical signed moment m obeys

    (S,C) = m (cos alpha, -sin alpha).

Therefore f plus both vector components recovers |d|, a, and phase alpha
without an external phase-origin token.  The unavoidable gauge equivalence
(d,alpha) ~ (-d,alpha+pi) means the sign of d needs a convention.  Keeping
only one scalar component S is non-identifying when alpha is unknown.

This script proves those claims numerically, constructs an exact scalar-only
counterexample, checks the centered and saturated limits, and validates
linear uncertainty propagation against a seeded Monte Carlo experiment.
"""

from __future__ import annotations

import json
import math

import numpy as np


def canonical_moments(A: float, d: float, a: float) -> tuple[float, float]:
    """Return (f,m) with clipping; m=<h sin(phi)> in canonical phase."""
    if A <= 0.0 or a < 0.0:
        raise ValueError("require A>0 and a>=0")
    lower = float(np.clip((d - a) / A, -1.0, 1.0))
    upper = float(np.clip((d + a) / A, -1.0, 1.0))
    if lower >= upper:
        return 0.0, 0.0
    f = (math.asin(upper) - math.asin(lower)) / math.pi
    m = (
        math.sqrt(max(0.0, 1.0 - lower * lower))
        - math.sqrt(max(0.0, 1.0 - upper * upper))
    ) / math.pi
    return f, m


def lab_moments(A: float, d: float, a: float, alpha: float) -> np.ndarray:
    """Return y=(f,S,C) after a phase-origin rotation alpha."""
    f, m = canonical_moments(A, d, a)
    return np.array([f, m * math.cos(alpha), -m * math.sin(alpha)])


def invert_vector(A: float, y: np.ndarray) -> tuple[float, float, float | None]:
    """Invert unsaturated y under the gauge convention d>=0."""
    f, S, C = map(float, y)
    if not 0.0 < f < 1.0:
        raise ValueError("require 0<f<1")
    delta = math.pi * f / 2.0
    r = math.hypot(S, C)
    q = math.pi * r / (2.0 * math.sin(delta))
    if q >= 1.0:
        raise ValueError("outside unsaturated vector inverse")
    mu = math.asin(q)
    d = A * math.sin(mu) * math.cos(delta)
    a = A * math.cos(mu) * math.sin(delta)
    lower, upper = (d - a) / A, (d + a) / A
    if not -1.0 < lower < upper < 1.0:
        raise ValueError("inverse reaches a clipped boundary")
    alpha = None if r == 0.0 else math.atan2(-C, S) % (2.0 * math.pi)
    return d, a, alpha


def matched_fraction(A: float, f: float, mu: float) -> tuple[float, float]:
    """Parameterize the f-only continuum by mean endpoint angle mu."""
    delta = math.pi * f / 2.0
    return A * math.sin(mu) * math.cos(delta), A * math.cos(mu) * math.sin(delta)


def circular_error(x: np.ndarray | float, reference: float) -> np.ndarray | float:
    return (np.asarray(x) - reference + math.pi) % (2.0 * math.pi) - math.pi


def numerical_jacobian(A: float, x: np.ndarray, step: float = 1e-7) -> np.ndarray:
    columns = []
    for index in range(3):
        xp, xm = x.copy(), x.copy()
        xp[index] += step
        xm[index] -= step
        columns.append((lab_moments(A, *xp) - lab_moments(A, *xm)) / (2.0 * step))
    return np.column_stack(columns)


def monte_carlo(A: float, truth: np.ndarray, sigma: float, count: int) -> dict:
    rng = np.random.default_rng(20261014)
    y0 = lab_moments(A, *truth)
    noise = rng.normal(0.0, sigma, size=(count, 3))
    estimates = np.empty((count, 3))
    accepted = 0
    for y in y0 + noise:
        try:
            d, a, alpha = invert_vector(A, y)
        except ValueError:
            continue
        estimates[accepted] = (d, a, alpha)
        accepted += 1
    estimates = estimates[:accepted]
    errors = estimates - truth
    errors[:, 2] = circular_error(estimates[:, 2], truth[2])
    return {
        "draws": count,
        "accepted": accepted,
        "rejected_fraction": 1.0 - accepted / count,
        "bias_d_a_alpha": errors.mean(axis=0).tolist(),
        "empirical_sigma_d_a_alpha": errors.std(axis=0, ddof=1).tolist(),
    }


def main() -> None:
    A = math.sin(0.246)
    truth = np.array([0.15, 0.0737331375595, 0.73])
    y = lab_moments(A, *truth)
    recovered = invert_vector(A, y)
    exact_errors = np.array(recovered) - truth
    exact_errors[2] = circular_error(recovered[2], truth[2])

    # Exact counterexample: same (f,S), different (d,a,alpha); C separates it.
    f0 = 0.269384638879
    mu1, mu2 = 0.28, 0.72
    d1, a1 = matched_fraction(A, f0, mu1)
    d2, a2 = matched_fraction(A, f0, mu2)
    m1 = canonical_moments(A, d1, a1)[1]
    m2 = canonical_moments(A, d2, a2)[1]
    alpha1 = 0.0
    alpha2 = math.acos(m1 / m2)
    y1, y2 = lab_moments(A, d1, a1, alpha1), lab_moments(A, d2, a2, alpha2)

    # The sign/phase gauge gives the exact same observable mask moments.
    gauge_partner = lab_moments(A, -truth[0], truth[1], truth[2] + math.pi)

    # At d=0 the vector vanishes: a remains identifiable, alpha does not.
    centered_y = lab_moments(A, 0.0, 0.1, 1.234)
    centered_inverse = invert_vector(A, centered_y)

    # Clipping negative control survives the vector upgrade.
    sat1 = lab_moments(A, 0.20, 0.10, 0.73)
    sat2 = lab_moments(A, 0.25, 0.15, 0.73)

    # Local uncertainty and an independent Monte Carlo validation.
    sigma = 1.0e-4
    jacobian = numerical_jacobian(A, truth)
    singular = np.linalg.svd(jacobian, compute_uv=False)
    inverse = np.linalg.inv(jacobian)
    covariance = sigma * sigma * inverse @ inverse.T
    linear_sigma = np.sqrt(np.diag(covariance))
    mc = monte_carlo(A, truth, sigma, 100_000)
    empirical_sigma = np.array(mc["empirical_sigma_d_a_alpha"])

    out = {
        "geometry": {"A": A, "truth_d_a_alpha": truth.tolist()},
        "observed_f_S_C": y.tolist(),
        "exact_vector_inverse": {
            "recovered_d_a_alpha": list(recovered),
            "max_abs_error": float(np.max(np.abs(exact_errors))),
        },
        "scalar_only_counterexample": {
            "case1_d_a_alpha": [d1, a1, alpha1],
            "case2_d_a_alpha": [d2, a2, alpha2],
            "same_f_error": float(abs(y1[0] - y2[0])),
            "same_S_error": float(abs(y1[1] - y2[1])),
            "separating_C_difference": float(abs(y1[2] - y2[2])),
        },
        "sign_phase_gauge_max_error": float(np.max(np.abs(y - gauge_partner))),
        "centered_limit": {
            "f_S_C": centered_y.tolist(),
            "recovered_d_a_alpha": list(centered_inverse),
            "interpretation": "d and a recover; alpha is undefined because harmonic amplitude is zero",
        },
        "saturation_negative_control_max_error": float(np.max(np.abs(sat1 - sat2))),
        "uncertainty_sigma_observable_1e-4": {
            "jacobian_rank": int(np.linalg.matrix_rank(jacobian)),
            "condition_number": float(singular[0] / singular[-1]),
            "linear_sigma_d_a_alpha": linear_sigma.tolist(),
            "monte_carlo": mc,
            "max_relative_sigma_disagreement": float(
                np.max(np.abs(empirical_sigma / linear_sigma - 1.0))
            ),
        },
        "minimal_token": "operation, f, S, C, saturation flag; impose d>=0 or retain a sign/orientation convention",
        "boundary": "GEN/DERIVED ring/slab accessibility mathematics; not a physical coupling or worldtube-volume claim",
    }

    assert out["exact_vector_inverse"]["max_abs_error"] < 2e-13
    assert out["scalar_only_counterexample"]["same_f_error"] < 3e-16
    assert out["scalar_only_counterexample"]["same_S_error"] < 3e-16
    assert out["scalar_only_counterexample"]["separating_C_difference"] > 0.05
    assert out["sign_phase_gauge_max_error"] < 2e-16
    assert centered_inverse[2] is None
    assert abs(centered_inverse[1] - 0.1) < 2e-16
    assert out["saturation_negative_control_max_error"] < 2e-16
    assert out["uncertainty_sigma_observable_1e-4"]["jacobian_rank"] == 3
    assert mc["rejected_fraction"] < 1e-4
    assert out["uncertainty_sigma_observable_1e-4"]["max_relative_sigma_disagreement"] < 0.015

    print(json.dumps(out, indent=2, sort_keys=True))
    print("PASS: vector first harmonic removes phase-token dependence; scalar-only and saturation gates fail")


if __name__ == "__main__":
    main()
