#!/usr/bin/env python3
"""Ravel finite-core helix reach gate in Euclidean R^4.

Status
------
The tube geometry is standard Euclidean differential geometry (STD/DERIVED).
Its use as an admissibility gate for an H(s)H finite-core representation is
GEN/CANDIDATE, not a physical claim.

Centerline and dimensionless pitch
----------------------------------
Embed a circular helix in R^4,

    gamma(t) = (R cos t, R sin t, p t, 0),       q = p/R > 0.

Its curvature and local focal radius are

    kappa = R/(R^2+p^2),       rho/R = 1 + q^2.

For two points separated by Delta,

    d(Delta)^2/R^2 = 2(1-cos Delta) + q^2 Delta^2.

A doubly-critical chord is perpendicular to both tangents, equivalently

    sin Delta + q^2 Delta = 0.

The larger root in (pi,2pi) is the adjacent-turn local minimum.  It exists
only for q < q_c, where the two roots coalesce at tan Delta_c = Delta_c and

    q_c^2 = -sin(Delta_c)/Delta_c = -cos(Delta_c).

For a round normal 3-ball core of radius a, the embedding gate is

    a/R < min(1+q^2, d(Delta_min)/(2R)).

The second term is omitted when the adjacent-turn minimum does not exist.
At equality the tube is marginal: either its normal exponential map becomes
focal or distinct cross-sections touch.

Volume null result
------------------
In a relatively-parallel normal frame, normal coordinates y in B^3_a have
Jacobian J = 1-kappa*y_1.  While a*kappa < 1 and there is no self-overlap,

    integral_{B^3_a} J dy = 4*pi*a^3/3.

Thus bending a uniform round R^4 tube changes neither its four-volume per unit
arclength nor a uniform-volume mass proxy.  Any such effect needs nonround
core structure, nonuniform density, self-contact, or a resolving intersection.
"""

from __future__ import annotations

import argparse
import json
import math
import random


def bisect(f, lo: float, hi: float, *, iterations: int = 100) -> float:
    flo, fhi = f(lo), f(hi)
    if flo == 0:
        return lo
    if fhi == 0:
        return hi
    if flo * fhi > 0:
        raise ValueError("root is not bracketed")
    for _ in range(iterations):
        mid = 0.5 * (lo + hi)
        fmid = f(mid)
        if flo * fmid <= 0:
            hi, fhi = mid, fmid
        else:
            lo, flo = mid, fmid
    return 0.5 * (lo + hi)


DELTA_C = bisect(
    lambda x: math.tan(x) - x,
    math.pi + 1e-12,
    1.5 * math.pi - 1e-12,
)
Q_CRIT = math.sqrt(-math.sin(DELTA_C) / DELTA_C)


def adjacent_minimum_delta(q: float) -> float | None:
    """Larger stationary root in (pi,2pi), or None after its saddle-node."""
    if q < 0:
        raise ValueError("q must be nonnegative")
    if q == 0:
        return 2.0 * math.pi
    if q >= Q_CRIT:
        return None
    return bisect(
        lambda x: math.sin(x) + q * q * x,
        DELTA_C,
        2.0 * math.pi,
    )


def reach_components(q: float) -> dict:
    """Dimensionless local, contact, and controlling radii, all divided by R."""
    rho = 1.0 + q * q
    delta = adjacent_minimum_delta(q)
    if delta is None:
        return {
            "q": q,
            "pitch_per_turn_over_R": 2.0 * math.pi * q,
            "delta_min": None,
            "curvature_radius_over_R": rho,
            "contact_radius_over_R": None,
            "reach_over_R": rho,
            "limiter": "curvature",
            "stationary_residual": None,
            "stationary_second_derivative_sign": None,
        }
    chord = math.sqrt(2.0 * (1.0 - math.cos(delta)) + q * q * delta * delta)
    contact = 0.5 * chord
    return {
        "q": q,
        "pitch_per_turn_over_R": 2.0 * math.pi * q,
        "delta_min": delta,
        "curvature_radius_over_R": rho,
        "contact_radius_over_R": contact,
        "reach_over_R": min(rho, contact),
        "limiter": "contact" if contact < rho else "curvature",
        "stationary_residual": math.sin(delta) + q * q * delta,
        "stationary_second_derivative_sign": math.cos(delta) + q * q,
    }


def crossover_q() -> float:
    """Pitch ratio where contact and curvature bounds are equal."""
    def difference(q: float) -> float:
        row = reach_components(q)
        return row["contact_radius_over_R"] - row["curvature_radius_over_R"]

    # The crossover is far from zero; avoid the sub-ulp displacement of the
    # adjacent-turn root from 2*pi when q is extremely tiny.
    return bisect(difference, 1e-4, Q_CRIT * (1.0 - 1e-12))


def volume_jacobian_mc(q: float, core_fraction_of_reach: float, samples: int, seed: int) -> dict:
    """Seeded check that mean normal Jacobian is one in the embedded regime."""
    row = reach_components(q)
    a_over_r = core_fraction_of_reach * row["reach_over_R"]
    kappa_times_r = 1.0 / (1.0 + q * q)
    rng = random.Random(seed)
    total = 0.0
    total2 = 0.0
    min_j = math.inf
    for _ in range(samples):
        # Uniform point in a 3-ball: isotropic direction and radius U^(1/3).
        x, y, z = rng.gauss(0, 1), rng.gauss(0, 1), rng.gauss(0, 1)
        norm = math.sqrt(x * x + y * y + z * z)
        radius = a_over_r * rng.random() ** (1.0 / 3.0)
        y1_over_r = radius * x / norm
        jac = 1.0 - kappa_times_r * y1_over_r
        total += jac
        total2 += jac * jac
        min_j = min(min_j, jac)
    mean = total / samples
    sample_var = (total2 - samples * mean * mean) / (samples - 1)
    se = math.sqrt(sample_var / samples)
    exact_se = (kappa_times_r * a_over_r) / math.sqrt(5.0 * samples)
    return {
        "q": q,
        "a_over_R": a_over_r,
        "a_over_reach": core_fraction_of_reach,
        "samples": samples,
        "mean_jacobian": mean,
        "analytic_mean_jacobian": 1.0,
        "sample_standard_error": se,
        "analytic_standard_error": exact_se,
        "z_error": (mean - 1.0) / se,
        "minimum_sampled_jacobian": min_j,
        "four_volume_per_arclength_over_a_cubed": 4.0 * math.pi / 3.0,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--samples", type=int, default=400_000)
    parser.add_argument("--seed", type=int, default=20261013)
    parser.add_argument(
        "--q",
        type=float,
        nargs="+",
        default=[0.01, 0.05, 0.10, 0.20, 0.30, 0.3998047365665228, 0.40, 0.45, 0.50, 1.0],
    )
    args = parser.parse_args()

    q_cross = crossover_q()
    rows = [reach_components(q) for q in args.q]

    # Exact/limiting controls.
    assert abs(math.tan(DELTA_C) - DELTA_C) < 2e-14
    assert abs(reach_components(1e-4)["reach_over_R"] / (math.pi * 1e-4) - 1.0) < 1e-7
    assert reach_components(0.2)["limiter"] == "contact"
    assert reach_components(0.45)["limiter"] == "curvature"
    assert reach_components(Q_CRIT)["contact_radius_over_R"] is None
    for row in rows:
        if row["delta_min"] is not None:
            assert abs(row["stationary_residual"]) < 2e-14
            assert row["stationary_second_derivative_sign"] > 0

    mc = [
        volume_jacobian_mc(0.20, 0.90, args.samples, args.seed),
        volume_jacobian_mc(0.45, 0.99, args.samples, args.seed + 1),
    ]

    result = {
        "classification": "STD/DERIVED geometry; GEN/CANDIDATE H(s)H admissibility gate",
        "critical_points": {
            "delta_c": DELTA_C,
            "q_stationary_branch_ends": Q_CRIT,
            "q_contact_curvature_crossover": q_cross,
            "pitch_over_R_at_crossover": 2.0 * math.pi * q_cross,
        },
        "rows": rows,
        "volume_null_checks": mc,
        "limiting_cases": {
            "q_to_zero": "reach/R ~ pi*q -> 0; repeated-circle limit is not embedded",
            "q_at_or_above_qcrit": "adjacent-turn stationary minimum absent; curvature limits reach",
            "a_to_zero": "centerline limit always passes this geometric gate",
            "a_at_reach": "marginal focal singularity or distinct-cross-section contact",
        },
        "failure_condition": "A round-core H(s)H helix is not an embedded tube when a >= reach.",
        "negative_result": (
            "Below reach, curvature/torsion alone do not change four-volume per arclength "
            "for a uniform round 3-ball core."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
