#!/usr/bin/env python3
"""Mira: finite-core boundary gate for Alberr's flat Householder director.

For u=(cos(theta(x)),sin(theta(x)),0,0), q=cos(2 theta), Alberr derived
R=q''.  On a finite interval [0,L], flatness therefore permits every affine
q=q0+b x whose values stay in (-1,1).  This script determines which common
boundary closures force b=0 and quantifies the curvature cost of matching a
nonconstant affine interior to constant exteriors through C1 collars.

Status: GEN/DERIVED sandbox mathematics for the explicit Householder ansatz.
No director dynamics or SAT/H(s)H physics claim.
"""

from __future__ import annotations

import json
import math

import numpy as np


L = 1.0  # m
Q0 = 0.2
Q1 = 0.8
B = (Q1 - Q0) / L  # m^-1
EPS = 0.05
COLLAR_WIDTHS = np.array([0.2, 0.1, 0.05, 0.025])  # m


def director_angle(q: float) -> float:
    """Principal smooth-branch angle theta=arccos(q)/2."""
    if not (-1.0 < q < 1.0):
        raise ValueError("q must stay on the smooth branch (-1,1)")
    return 0.5 * math.acos(q)


def collar_integral_numeric(width: float, points: int = 200_001) -> float:
    """Numerically integrate R^2 over both cubic-Hermite C1 collars.

    Left collar has q=q0+b*w*(t^3-t^2), taking derivative 0 -> b while
    keeping q equal to q0 at both endpoints.  The right collar is its
    derivative-reversed counterpart.  R=q''.
    """
    t = np.linspace(0.0, 1.0, points)
    r_left = B * (6.0 * t - 2.0) / width
    r_right = B * (6.0 * t - 4.0) / width
    return float(
        width * np.trapezoid(r_left**2, t)
        + width * np.trapezoid(r_right**2, t)
    )


def main() -> None:
    theta0 = director_angle(Q0)
    theta1 = director_angle(Q1)

    # Exact boundary classification for q=a+b x on [0,L].
    boundary_gate = {
        "unequal_Dirichlet": {
            "conditions": f"q(0)={Q0}, q(L)={Q1}",
            "slope_m^-1": B,
            "forces_constant": False,
            "bulk_R_m^-2": 0.0,
        },
        "equal_Dirichlet_or_periodic": {
            "condition": "q(0)=q(L)",
            "consequence": "b L=0, hence b=0 for L>0",
            "forces_constant": True,
        },
        "one_Neumann_or_C1_constant_exterior": {
            "condition": "q'=0 at either endpoint",
            "consequence": "affine q has q'=b everywhere, hence b=0",
            "forces_constant": True,
        },
    }

    collars = []
    max_relative_error = 0.0
    for width in COLLAR_WIDTHS:
        exact = 8.0 * B**2 / width
        numeric = collar_integral_numeric(float(width))
        rel = abs(numeric - exact) / exact
        max_relative_error = max(max_relative_error, rel)
        collars.append(
            {
                "width_m": float(width),
                "peak_abs_R_m^-2": 4.0 * abs(B) / float(width),
                "exact_integral_R2_m^-3": exact,
                "numeric_integral_R2_m^-3": numeric,
                "relative_quadrature_error": rel,
            }
        )

    # Negative control: same Dirichlet endpoints, but a sinusoidal interior
    # perturbation.  Endpoint data alone do not imply flatness.
    x = np.linspace(0.0, L, 200_001)
    r_control = -EPS * (math.pi / L) ** 2 * np.sin(math.pi * x / L)
    control_numeric = float(np.trapezoid(r_control**2, x))
    control_exact = EPS**2 * math.pi**4 / (2.0 * L**3)
    control_peak = EPS * math.pi**2 / L**2

    # Smooth-branch checks, including the collar overshoots.
    # max |t^3-t^2| = 4/27, so each collar overshoots by at most 4|b|w/27.
    largest_overshoot = 4.0 * abs(B) * float(max(COLLAR_WIDTHS)) / 27.0
    branch_min = Q0 - largest_overshoot
    branch_max = Q1 + largest_overshoot

    assert -1.0 < branch_min < branch_max < 1.0
    assert max_relative_error < 1e-9
    assert abs(control_numeric - control_exact) / control_exact < 1e-9
    assert abs((Q0 + B * L) - Q1) < 1e-15

    out = {
        "ansatz": "u=(cos(theta(x)),sin(theta(x)),0,0); q=cos(2theta); R=q''",
        "finite_interval_fixture": {
            "L_m": L,
            "q0": Q0,
            "q1": Q1,
            "affine_slope_m^-1": B,
            "theta0_rad": theta0,
            "theta1_rad": theta1,
            "director_rotation_rad": theta1 - theta0,
            "director_rotation_deg": math.degrees(theta1 - theta0),
            "bulk_flat": True,
            "smooth_branch_range_with_widest_collars": [branch_min, branch_max],
        },
        "boundary_gate": boundary_gate,
        "constant_exterior_C1_collars": {
            "construction": "cubic Hermite collars with q continuous and q' ramped 0<->b",
            "exact_law": "integral R^2 dx over two collars = 8 b^2 / w",
            "width_sweep": collars,
            "maximum_relative_quadrature_error": max_relative_error,
            "sharp_interface_limit": "diverges as 1/w for nonzero b",
        },
        "nonaffine_same_endpoint_negative_control": {
            "q": "q0+b*x+eps*sin(pi*x/L)",
            "epsilon": EPS,
            "peak_abs_R_m^-2": control_peak,
            "exact_integral_R2_m^-3": control_exact,
            "numeric_integral_R2_m^-3": control_numeric,
            "relative_quadrature_error": abs(control_numeric - control_exact) / control_exact,
        },
        "conclusion": (
            "Finite extent alone does not select the constant director: unequal "
            "Dirichlet data admit a nonconstant exactly flat bulk. Equal/periodic "
            "Dirichlet data, any zero-slope boundary, or C1 matching to a constant "
            "exterior force the constant branch. If nonconstant bulk data are "
            "retained, smooth constant-exterior closure localizes curvature in "
            "boundary collars with an R^2 cost diverging as 1/w."
        ),
        "status": (
            "GEN/DERIVED sandbox mathematics for the explicit Householder ansatz; "
            "no boundary dynamics or SAT/H(s)H physics claim"
        ),
    }
    print(json.dumps(out, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
