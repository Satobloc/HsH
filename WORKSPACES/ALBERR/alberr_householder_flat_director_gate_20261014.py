#!/usr/bin/env python3
"""Exact local/global flatness gate for a varying Householder director.

Status: GEN/DERIVED sandbox mathematics.  This is a calculation about the
metric ansatz g = delta - 2 u tensor u, not an H(s)H dynamics or physics claim.

Take Euclidean coordinates (x,y,z,w), with x measured in metres, and

    u(x) = (cos(theta(x)), sin(theta(x)), 0, 0),   |u|_delta = 1.

Let q(x) = cos(2 theta(x)).  The nontrivial 2x2 metric block is

    [[-q, -sqrt(1-q^2)],
     [-sqrt(1-q^2), q]],

on a branch with sin(2 theta)>0; z,w are flat spectators.  Direct
Levi-Civita contraction gives

    R = -2 d/dx[sin(2 theta) theta'] = q''.

In two dimensions Riemann is determined by R, and the four-dimensional
metric is a direct product with R^2.  Hence this ansatz is locally flat iff
q is affine.  Nonconstant local flat directors therefore exist, but a real
affine q with |q|<=1 on the whole real line must have zero slope: the only
globally defined flat members on all R^4 are constant directors.

The executable checks the identity against an independent finite-difference
Levi-Civita calculation, includes constant and nonlinear negative controls,
and prints dimensioned curvature diagnostics.
"""

from __future__ import annotations

import json
import math
from typing import Callable

import numpy as np


def metric_from_q(x: float, qfun: Callable[[float], float]) -> np.ndarray:
    """Return the 2D Householder block; the omitted z,w block is identity."""
    q = float(qfun(x))
    if not (-1.0 < q < 1.0):
        raise ValueError(f"q={q} leaves the smooth branch at x={x}")
    s = math.sqrt(1.0 - q * q)
    return np.array([[-q, -s], [-s, q]], dtype=float)


def derivative_5(f: Callable[[float], np.ndarray], x: float, h: float) -> np.ndarray:
    """Fourth-order centered first derivative."""
    return (f(x - 2*h) - 8*f(x - h) + 8*f(x + h) - f(x + 2*h)) / (12*h)


def christoffel_fd(x: float, qfun: Callable[[float], float], h: float) -> np.ndarray:
    """Levi-Civita connection from metric values only; y derivatives vanish."""
    mf = lambda t: metric_from_q(t, qfun)
    g = mf(x)
    gi = np.linalg.inv(g)
    dg = derivative_5(mf, x, h)
    gamma = np.zeros((2, 2, 2), dtype=float)
    for a in range(2):
        for b in range(2):
            for c in range(2):
                total = 0.0
                for d in range(2):
                    db_gdc = dg[d, c] if b == 0 else 0.0
                    dc_gdb = dg[d, b] if c == 0 else 0.0
                    dd_gbc = dg[b, c] if d == 0 else 0.0
                    total += gi[a, d] * (db_gdc + dc_gdb - dd_gbc)
                gamma[a, b, c] = 0.5 * total
    return gamma


def scalar_curvature_fd(x: float, qfun: Callable[[float], float], h: float) -> float:
    """Independent metric -> connection -> Ricci -> scalar calculation."""
    g = metric_from_q(x, qfun)
    gi = np.linalg.inv(g)
    gf = lambda t: christoffel_fd(t, qfun, h)
    dgamma = derivative_5(gf, x, h)
    gamma = gf(x)
    ric = np.zeros((2, 2), dtype=float)
    for a in range(2):
        for b in range(2):
            val = 0.0
            for c in range(2):
                val += dgamma[c, a, b]  # partial_c Gamma^c_ab; only c=0 survives below
                if c != 0:
                    val -= dgamma[c, a, b]
                if b == 0:
                    val -= dgamma[c, a, c]
                for d in range(2):
                    val += gamma[c, a, b] * gamma[d, c, d]
                    val -= gamma[d, a, c] * gamma[c, b, d]
            ric[a, b] = val
    return float(np.einsum("ab,ab->", gi, ric))


def main() -> None:
    # Smooth domain in metres.  The affine flat fixture stays in 0 < q < 1.
    xmin, xmax = -0.45, 1.45
    A, slope = 0.6, -0.4  # q=A+slope*x; slope=-2C
    eps, k = 0.03, math.pi  # eps dimensionless, k in m^-1
    h = 2.0e-4

    q_constant = lambda x: 0.3
    q_affine = lambda x: A + slope*x
    q_nonlinear = lambda x: A + slope*x + eps*math.sin(k*x)
    r_exact_nonlinear = lambda x: -eps*k*k*math.sin(k*x)

    xs = np.linspace(xmin, xmax, 81)
    r_const_fd = np.array([scalar_curvature_fd(x, q_constant, h) for x in xs])
    r_flat_fd = np.array([scalar_curvature_fd(x, q_affine, h) for x in xs])
    r_curve_fd = np.array([scalar_curvature_fd(x, q_nonlinear, h) for x in xs])
    r_curve_exact = np.array([r_exact_nonlinear(x) for x in xs])

    # A finer analytic grid quantifies the deliberately curved control.
    xf = np.linspace(-0.5, 1.5, 20001)
    re = np.array([r_exact_nonlinear(x) for x in xf])
    rms = float(np.sqrt(np.trapezoid(re*re, xf) / (xf[-1] - xf[0])))

    out = {
        "ansatz": "u=(cos(theta(x)),sin(theta(x)),0,0); q=cos(2theta)",
        "exact_identity": "R=q''; Ricci^2=R^2/2; Kretschmann=R^2",
        "flat_iff": "q(x) is affine on the connected smooth branch",
        "global_R4_gate": "bounded affine |q|<=1 on all real x forces zero slope",
        "affine_fixture": {
            "q": f"{A} {slope:+g} x",
            "director_is_nonconstant": True,
            "max_abs_R_fd_m^-2": float(np.max(np.abs(r_flat_fd))),
        },
        "constant_control_max_abs_R_fd_m^-2": float(np.max(np.abs(r_const_fd))),
        "nonlinear_control": {
            "epsilon": eps,
            "k_m^-1": k,
            "exact_peak_abs_R_m^-2": eps*k*k,
            "exact_rms_R_m^-2": rms,
            "max_abs_fd_minus_exact_m^-2": float(np.max(np.abs(r_curve_fd-r_curve_exact))),
            "peak_K_m^-4": (eps*k*k)**2,
        },
        "numerics": {"points": len(xs), "fd_step_m": h},
        "status": "GEN/DERIVED sandbox mathematics; no dynamics or physics claim",
    }

    # Conservative tolerances for nested finite differences in double precision.
    assert out["affine_fixture"]["max_abs_R_fd_m^-2"] < 2.0e-7
    assert out["constant_control_max_abs_R_fd_m^-2"] < 1.0e-10
    assert out["nonlinear_control"]["max_abs_fd_minus_exact_m^-2"] < 2.0e-7
    assert abs(rms - eps*k*k/math.sqrt(2.0)) < 2.0e-8
    print(json.dumps(out, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
