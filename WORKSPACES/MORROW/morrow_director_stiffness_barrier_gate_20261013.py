#!/usr/bin/env python3
"""Quadratic director-stiffness gate for Morrow's explicit unwinding path.

Status: SAT/CANDIDATE geometric calculation, not a physical claim.

For u=w/L and n_C=v_C/|v_C|, use Morrow's prior path

  v_C = ((1-s)cos(2*pi*u)+s,
         (1-s)sin(2*pi*u),
         C*s*(1-s)*sin(pi*u)^2).

Test the smallest positive quadratic relative-director penalty

  E_D(s) = (K/2) integral_0^L |d_w(R n_C)|^2 dw
         = K R^2/(2L) G_C(s),
  G_C(s) = integral_0^1 |d_u n_C|^2 du.

At s=0, G_C=4*pi^2.  Direct expansion of normalized v_C gives

  G'_C(0)=0,
  G''_C(0)=-2*pi^2*(C^2-2).

Consequently C>sqrt(2) makes the initial winding a local maximum of this
energy, not a protected minimum.  Numerical quadrature tests the entire path
for the previously optimized C*=7.507905739369 and uses C=1 as a barrier-
forming negative control.  A missing barrier here does not rule out bending,
twist, nonlocal contact, or connection-dependent material energies.
"""

from __future__ import annotations

import argparse
import json
import math

import numpy as np
from scipy.integrate import simpson
from scipy.optimize import minimize_scalar


def director_energy(C: float, s: float, samples: int = 40001) -> float:
    """Dimensionless G_C(s)=integral |partial_u(v/|v|)|^2 du."""
    if C <= 0.0 or not 0.0 <= s <= 1.0 or samples < 101 or samples % 2 == 0:
        raise ValueError("require C>0, s in [0,1], and odd samples>=101")
    u = np.linspace(0.0, 1.0, samples)
    theta = 2.0 * np.pi * u
    v = np.column_stack(
        (
            (1.0 - s) * np.cos(theta) + s,
            (1.0 - s) * np.sin(theta),
            C * s * (1.0 - s) * np.sin(np.pi * u) ** 2,
        )
    )
    v_u = np.column_stack(
        (
            -2.0 * np.pi * (1.0 - s) * np.sin(theta),
            2.0 * np.pi * (1.0 - s) * np.cos(theta),
            C * s * (1.0 - s) * np.pi * np.sin(2.0 * np.pi * u),
        )
    )
    v2 = np.einsum("ij,ij->i", v, v)
    if np.min(v2) <= 0.0:
        return math.inf
    dot = np.einsum("ij,ij->i", v, v_u)
    n_u2 = np.einsum("ij,ij->i", v_u, v_u) / v2 - dot * dot / (v2 * v2)
    return float(simpson(n_u2, x=u))


def analytic_second_derivative(C: float) -> float:
    return -2.0 * math.pi**2 * (C * C - 2.0)


def maximize_path(C: float, samples: int) -> tuple[float, float]:
    result = minimize_scalar(
        lambda s: -director_energy(C, s, samples),
        bounds=(0.0, 1.0),
        method="bounded",
        options={"xatol": 1e-13},
    )
    # Bounded minimization does not sample endpoints; compare them explicitly.
    candidates = [(result.x, -result.fun), (0.0, director_energy(C, 0.0, samples)), (1.0, 0.0)]
    return max(candidates, key=lambda item: item[1])


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--C", type=float, default=7.507905739369)
    parser.add_argument("--samples", type=int, default=40001)
    args = parser.parse_args()

    C_star = args.C
    G0 = 4.0 * math.pi**2
    max_s, max_G = maximize_path(C_star, args.samples)
    control_s, control_G = maximize_path(1.0, args.samples)
    mid_G = director_energy(C_star, 0.5, args.samples)

    # Grid test for a hidden above-initial barrier and resolution convergence.
    s_grid = np.linspace(0.0, 1.0, 1001)
    coarse = np.array([director_energy(C_star, float(s), 10001) for s in s_grid])
    fine = np.array([director_energy(C_star, float(s), args.samples) for s in s_grid])
    resolution_error = float(np.max(np.abs(fine - coarse)))
    grid_excess = float(np.max(fine - G0))

    # One-sided finite-difference check because s is a homotopy endpoint.
    h = 2.0e-4
    finite_Gpp = 2.0 * (director_energy(C_star, h, args.samples) - G0) / (h * h)
    exact_Gpp = analytic_second_derivative(C_star)

    # Limits and negative controls.
    assert abs(director_energy(C_star, 0.0, args.samples) - G0) < 1e-11
    assert director_energy(C_star, 1.0, args.samples) == 0.0
    assert max_G <= G0 + 2e-11
    assert grid_excess <= 2e-11
    assert control_G > G0 and 0.0 < control_s < 1.0
    assert analytic_second_derivative(1.0) > 0.0
    assert exact_Gpp < 0.0
    assert abs(finite_Gpp - exact_Gpp) / abs(exact_Gpp) < 1.0e-3

    result = {
        "classification": "SAT/CANDIDATE geometry using a GEN/CANDIDATE quadratic stiffness",
        "C": C_star,
        "G_initial_exact": G0,
        "G_final_exact": 0.0,
        "G_midpoint": mid_G,
        "path_maximum": {"s": max_s, "G": max_G, "relative_barrier": max_G / G0 - 1.0},
        "analytic_G_second_at_zero": exact_Gpp,
        "finite_difference_G_second_at_zero": finite_Gpp,
        "grid_points_s": len(s_grid),
        "quadrature_samples_fine": args.samples,
        "max_10001_vs_fine_discrepancy": resolution_error,
        "negative_control_C1": {
            "barrier_s": control_s,
            "barrier_G": control_G,
            "relative_barrier": control_G / G0 - 1.0,
            "analytic_G_second_at_zero": analytic_second_derivative(1.0),
        },
        "derived_gate": "This quadratic director-gradient term does not protect the C* winding.",
        "failure_conditions": [
            "The physical material energy is not established to be this Dirichlet functional.",
            "Connection, twist, curvature, nonlocal contact, or self-avoidance terms can add a barrier.",
            "The numerical whole-path result is specific to Morrow's explicit homotopy family.",
            "No claim of global minimum energy or physical Interbraid confinement follows.",
        ],
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
