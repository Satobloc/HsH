#!/usr/bin/env python3
"""Meridian sandbox: soft-overlap penalty converging to hard contact in R4.

For two equal-radius isotropic tubes about nonparallel infinite lines,

    V(p) = I(2R-p,R)/sin(theta),  p=max(2R-D,0),

where p is penetration.  Under a fixed compressive generalized load P and
penalty strength Lambda, equilibrium solves Lambda*dV/dp=P.  Near contact,

    V ~ C p^(5/2),  C=(16*pi/15) R^(3/2)/sin(theta),
    p_asym = [2P/(5 Lambda C)]^(2/3).

The rescaled quadrature below stays stable as p -> 0 and verifies the
Lambda^(-2/3) hard-contact convergence rate.  This is GEN/DERIVED sandbox
geometry, not an H(s)H constitutive law or physical validation.
"""

from __future__ import annotations

import json
import math

import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.optimize import brentq


def overlap_volume_from_penetration(
    p: float, R: float, theta: float, order: int = 180
) -> float:
    """Exact four-volume for 0<p<2R using a near-contact-stable quadrature."""
    if R <= 0.0:
        raise ValueError("R must be positive")
    sine = abs(math.sin(theta))
    if sine < 1.0e-12:
        raise ValueError("parallel infinite carriers require finite endpoints")
    if p <= 0.0:
        return 0.0
    if p >= 2.0 * R:
        raise ValueError("fixture is restricted to 0 < p < 2R")

    nodes, weights = leggauss(order)
    xi = nodes
    delta = p / (4.0 * R)

    # Exact rescaling:
    # y=R-p/2+(p/2)xi, z=sqrt(Rp) eta.
    eta2_a = 1.0 - xi - delta * (1.0 - xi) ** 2
    eta2_b = 1.0 + xi - delta * (1.0 + xi) ** 2
    eta_max = np.sqrt(np.maximum(np.minimum(eta2_a, eta2_b), 0.0))
    eta = eta_max[:, None] * nodes[None, :]
    w_eta = eta_max[:, None] * weights[None, :]

    abar = (
        1.0 - xi[:, None] - eta * eta
        - delta * (1.0 - xi[:, None]) ** 2
    )
    bbar = (
        1.0 + xi[:, None] - eta * eta
        - delta * (1.0 + xi[:, None]) ** 2
    )
    integrand = np.sqrt(np.maximum(abar * bbar, 0.0))
    scaled_integral = float(np.sum(weights[:, None] * w_eta * integrand))
    normal_kernel = 2.0 * R**1.5 * p**2.5 * scaled_integral
    return normal_kernel / sine


def asymptotic_coefficient(R: float, theta: float) -> float:
    return (16.0 * math.pi / 15.0) * R**1.5 / abs(math.sin(theta))


def force_per_lambda(p: float, R: float, theta: float, order: int = 180) -> float:
    """Five-point numerical dV/dp, with step proportional to p."""
    if p <= 0.0:
        return 0.0
    h = min(1.0e-3 * p, 0.1 * (2.0 * R - p))
    if p - 2.0 * h <= 0.0:
        h = 0.2 * p
    vm2 = overlap_volume_from_penetration(p - 2.0 * h, R, theta, order)
    vm1 = overlap_volume_from_penetration(p - h, R, theta, order)
    vp1 = overlap_volume_from_penetration(p + h, R, theta, order)
    vp2 = overlap_volume_from_penetration(p + 2.0 * h, R, theta, order)
    return (vm2 - 8.0 * vm1 + 8.0 * vp1 - vp2) / (12.0 * h)


def equilibrium_penetration(
    load: float, penalty: float, R: float, theta: float, order: int = 180
) -> float:
    """Solve penalty*dV/dp=load on the near-contact branch."""
    if load <= 0.0 or penalty <= 0.0:
        raise ValueError("load and penalty must be positive")
    C = asymptotic_coefficient(R, theta)
    estimate = (2.0 * load / (5.0 * penalty * C)) ** (2.0 / 3.0)

    def residual(p: float) -> float:
        return penalty * force_per_lambda(p, R, theta, order) - load

    lo = estimate / 4.0
    hi = min(estimate * 4.0, 0.25 * R)
    while residual(lo) > 0.0:
        lo *= 0.5
    while residual(hi) < 0.0:
        hi *= 2.0
        if hi >= 0.5 * R:
            raise RuntimeError("failed to bracket the near-contact equilibrium")
    return float(brentq(residual, lo, hi, xtol=1.0e-14, rtol=2.0e-13))


def main() -> None:
    R = 1.2
    theta = math.radians(60.0)
    load = 0.1
    C = asymptotic_coefficient(R, theta)
    penalties = np.array([1.0e1, 1.0e2, 1.0e3, 1.0e4, 1.0e5, 1.0e6])

    rows = []
    for penalty in penalties:
        exact = equilibrium_penetration(load, penalty, R, theta)
        asym = (2.0 * load / (5.0 * penalty * C)) ** (2.0 / 3.0)
        volume = overlap_volume_from_penetration(exact, R, theta)
        contact_force = penalty * force_per_lambda(exact, R, theta)
        rows.append(
            {
                "Lambda": float(penalty),
                "p_exact": exact,
                "p_asym": asym,
                "ratio_exact_to_asym": exact / asym,
                "Lambda_times_V": penalty * volume,
                "contact_force": contact_force,
            }
        )

    exact_p = np.array([row["p_exact"] for row in rows])
    slopes = np.diff(np.log(exact_p)) / np.diff(np.log(penalties))
    assert max(abs(row["contact_force"] - load) for row in rows) < 3.0e-10
    assert abs(slopes[-1] + 2.0 / 3.0) < 2.0e-4
    assert abs(rows[-1]["ratio_exact_to_asym"] - 1.0) < 2.0e-4

    # Angular fixture at fixed Lambda: p ~ sin(theta)^(2/3).
    angular = []
    penalty = 1.0e4
    for degrees in (15.0, 30.0, 45.0, 60.0, 90.0):
        angle = math.radians(degrees)
        exact = equilibrium_penetration(load, penalty, R, angle)
        asym = (
            2.0 * load
            / (5.0 * penalty * asymptotic_coefficient(R, angle))
        ) ** (2.0 / 3.0)
        angular.append(
            {
                "theta_deg": degrees,
                "p_exact": exact,
                "p_asym": asym,
                "scaled_p_over_sin_2_3": exact / math.sin(angle) ** (2.0 / 3.0),
            }
        )

    scaled = [row["scaled_p_over_sin_2_3"] for row in angular]
    assert max(scaled) / min(scaled) - 1.0 < 0.004

    # Hard-contact and zero-load controls.
    assert overlap_volume_from_penetration(0.0, R, theta) == 0.0
    try:
        overlap_volume_from_penetration(0.1, R, 0.0)
    except ValueError:
        parallel_control = "REJECTED_WITHOUT_FINITE_ENDPOINTS"
    else:
        raise AssertionError("parallel infinite-line control did not reject")

    out = {
        "status": "GEN/DERIVED sandbox; executed",
        "parameters": {
            "R": R,
            "theta_deg": 60.0,
            "load": load,
            "C": C,
        },
        "penalty_sweep": rows,
        "local_log_slopes": slopes.tolist(),
        "angle_sweep_at_Lambda_1e4": angular,
        "controls": {
            "hard_contact_p": 0.0,
            "hard_contact_overlap": 0.0,
            "parallel_infinite_line": parallel_control,
        },
    }
    print(json.dumps(out, indent=2))


if __name__ == "__main__":
    main()
