#!/usr/bin/env python3
"""MK144: transverse ᚼ-lane deformation of MK143's half-turn reach gate.

Status: GEN/DERIVED sandbox geometry.  This is a statement about one declared
Euclidean curve family, not a constitutive law or SAT/H(s)H physical claim.

Start from Kestrel MK143's moving centerline, use u=s/T in [0,1], and activate
the previously zero coordinate with a transverse sinusoidal deformation:

    c_A(u) = (A sin(2*pi*u), H cos(theta(u)), H sin(theta(u)), T*u),
    theta(u) = pi(3*u^2-2*u^3), H=sqrt(3)/2, T=3*pi*H/2.

For a<b, delta=b-a, and Delta=theta(b)-theta(a),

  [c_A(b)-c_A(a)] . c_A'(a)
    = T^2 delta + H^2 theta'(a) sin(Delta)
      + 2*pi*A^2[sin(2*pi*b)-sin(2*pi*a)]cos(2*pi*a).

The first two terms are positive.  The Lipschitz bound
|sin(2*pi*b)-sin(2*pi*a)| <= 2*pi*delta proves positivity whenever

    A < A_safe = T/(2*pi) = 3*H/4.

Thus every such small deformation preserves MK143's no-doubly-normal
certificate.  The bound is sufficient, not claimed sharp.

For the symmetric pair a=1/2-x, b=1/2+x, both endpoint normality equations
coincide.  When x in (1/4,1/2), a genuine doubly-normal chord occurs at

 A^2(x) = [2*T^2*x + H^2*theta'(1/2-x)*sin(Delta(x))]
          /[-2*pi*sin(4*pi*x)].

The script deterministically minimizes this scalar function, verifies both
normality residuals, and compares the resulting half-chord with the local
focal radius and the ell/2 cross-center cap.  It also locates the earlier
amplitude at which local curvature first makes the focal radius equal ell/2.
"""

from __future__ import annotations

import json
import math

import numpy as np
from scipy.optimize import brentq, minimize_scalar


ELL = 1.0
H = math.sqrt(3.0) * ELL / 2.0
T = 1.5 * math.pi * H
A_SAFE = T / (2.0 * math.pi)


def theta(u: float) -> float:
    return math.pi * (3.0 * u * u - 2.0 * u**3)


def theta_prime(u: float) -> float:
    return 6.0 * math.pi * u * (1.0 - u)


def theta_second(u: float) -> float:
    return 6.0 * math.pi * (1.0 - 2.0 * u)


def point(u: float, amplitude: float) -> np.ndarray:
    phase = theta(u)
    return np.array(
        [
            amplitude * math.sin(2.0 * math.pi * u),
            H * math.cos(phase),
            H * math.sin(phase),
            T * u,
        ]
    )


def tangent(u: float, amplitude: float) -> np.ndarray:
    phase = theta(u)
    rate = theta_prime(u)
    return np.array(
        [
            2.0 * math.pi * amplitude * math.cos(2.0 * math.pi * u),
            -H * rate * math.sin(phase),
            H * rate * math.cos(phase),
            T,
        ]
    )


def acceleration(u: float, amplitude: float) -> np.ndarray:
    phase = theta(u)
    rate = theta_prime(u)
    accel = theta_second(u)
    return np.array(
        [
            -(2.0 * math.pi) ** 2 * amplitude * math.sin(2.0 * math.pi * u),
            -H * (accel * math.sin(phase) + rate * rate * math.cos(phase)),
            H * (accel * math.cos(phase) - rate * rate * math.sin(phase)),
            0.0,
        ]
    )


def curvature(u: float, amplitude: float) -> float:
    velocity = tangent(u, amplitude)
    accel = acceleration(u, amplitude)
    speed2 = float(velocity @ velocity)
    gram = speed2 * float(accel @ accel) - float(velocity @ accel) ** 2
    return math.sqrt(max(0.0, gram)) / speed2**1.5


def max_curvature(amplitude: float, grid_size: int = 4001) -> tuple[float, float]:
    """Deterministically bracket every sampled local maximum, then refine."""
    grid = np.linspace(0.0, 1.0, grid_size)
    values = np.array([curvature(float(u), amplitude) for u in grid])
    candidates = [(float(values[0]), 0.0), (float(values[-1]), 1.0)]
    for index in range(1, grid_size - 1):
        if values[index] >= values[index - 1] and values[index] >= values[index + 1]:
            result = minimize_scalar(
                lambda u: -curvature(float(u), amplitude),
                bounds=(float(grid[index - 1]), float(grid[index + 1])),
                method="bounded",
                options={"xatol": 2e-14},
            )
            candidates.append((-float(result.fun), float(result.x)))
    return max(candidates)


def symmetric_required_amplitude_squared(x: float) -> float:
    if not 0.25 < x < 0.5:
        raise ValueError("symmetric cancellation branch requires 1/4 < x < 1/2")
    a = 0.5 - x
    b = 0.5 + x
    phase_difference = theta(b) - theta(a)
    numerator = (
        2.0 * T * T * x
        + H * H * theta_prime(a) * math.sin(phase_difference)
    )
    denominator = -2.0 * math.pi * math.sin(4.0 * math.pi * x)
    return numerator / denominator


def symmetric_double_normal(xtol: float) -> dict[str, float]:
    result = minimize_scalar(
        symmetric_required_amplitude_squared,
        bounds=(0.2500000001, 0.4999999999),
        method="bounded",
        options={"xatol": xtol, "maxiter": 1000},
    )
    x = float(result.x)
    amplitude = math.sqrt(float(result.fun))
    a, b = 0.5 - x, 0.5 + x
    chord = point(b, amplitude) - point(a, amplitude)
    residual_a = float(chord @ tangent(a, amplitude))
    residual_b = float(chord @ tangent(b, amplitude))
    return {
        "x": x,
        "a": a,
        "b": b,
        "amplitude": amplitude,
        "amplitude_over_H": amplitude / H,
        "phase_separation": theta(b) - theta(a),
        "half_chord": float(np.linalg.norm(chord)) / 2.0,
        "normality_residual_a": residual_a,
        "normality_residual_b": residual_b,
    }


def curvature_cap_amplitude() -> tuple[float, float]:
    """Find the large-A branch where max curvature first returns to 2/ell."""
    root = brentq(
        lambda amplitude: max_curvature(amplitude)[0] - 2.0 / ELL,
        1.0,
        1.4,
        xtol=2e-13,
        rtol=1e-14,
    )
    kappa, ustar = max_curvature(root)
    return float(root), float(ustar)


def main() -> None:
    coarse = symmetric_double_normal(1e-10)
    fine = symmetric_double_normal(2e-14)
    amplitude_delta = abs(coarse["amplitude"] - fine["amplitude"])
    x_delta = abs(coarse["x"] - fine["x"])

    baseline_kappa, baseline_u = max_curvature(0.0)
    onset_kappa, onset_u = max_curvature(fine["amplitude"])
    onset_kappa_coarse, _ = max_curvature(fine["amplitude"], grid_size=2001)
    local_amplitude, local_u = curvature_cap_amplitude()

    out = {
        "family": "c_A(u)=(A sin(2*pi*u),H cos(theta),H sin(theta),T*u)",
        "parameters": {"ell": ELL, "H": H, "T": T},
        "rigorous_sufficient_no_double_normal_bound": {
            "A_less_than": A_SAFE,
            "A_over_H_less_than": A_SAFE / H,
        },
        "minimal_symmetric_double_normal": fine,
        "local_curvature_cap_onset": {
            "amplitude": local_amplitude,
            "amplitude_over_H": local_amplitude / H,
            "u_at_kappa_max": local_u,
            "kappa_max": 2.0 / ELL,
        },
        "comparisons": {
            "baseline_kappa_max": baseline_kappa,
            "baseline_u_at_kappa_max": baseline_u,
            "double_normal_onset_kappa_max": onset_kappa,
            "double_normal_onset_focal_radius": 1.0 / onset_kappa,
            "cross_center_reach_cap": ELL / 2.0,
            "double_normal_half_chord": fine["half_chord"],
            "amplitude_ordering_gap": fine["amplitude"] - local_amplitude,
        },
        "numerical_checks": {
            "amplitude_tolerance_delta": amplitude_delta,
            "x_tolerance_delta": x_delta,
            "kappa_2001_to_4001_delta": abs(onset_kappa - onset_kappa_coarse),
        },
        "status": "GEN/DERIVED sandbox geometry; symmetric chord branch only",
    }

    # Analytic and numerical gates.
    assert abs(A_SAFE / H - 0.75) < 2e-15
    assert fine["amplitude"] > local_amplitude > A_SAFE
    assert max(abs(fine["normality_residual_a"]), abs(fine["normality_residual_b"])) < 2e-13
    assert fine["half_chord"] > ELL / 2.0
    assert 1.0 / onset_kappa < ELL / 2.0
    assert amplitude_delta < 2e-8 and x_delta < 2e-8
    assert abs(onset_kappa - onset_kappa_coarse) < 2e-10

    print(json.dumps(out, indent=2, sort_keys=True))
    print(
        "PASS: small-wobble certificate; explicit symmetric double normal; "
        "local curvature binds first"
    )


if __name__ == "__main__":
    main()
