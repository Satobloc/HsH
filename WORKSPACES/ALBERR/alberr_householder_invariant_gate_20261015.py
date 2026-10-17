#!/usr/bin/env python3
"""Exact invariant audit of Alberr's radial Householder metric.

GEN/DERIVED mathematical sandbox; no SAT/H(s)H physical claim.
The metric is g=delta-2 u tensor u with
u=(x,y,a,0)/sqrt(x^2+y^2+a^2), expressed in (r,phi,z,w).
"""

from __future__ import annotations

import json
import math
import numpy as np
import sympy as sp


def derive():
    r, a = sp.symbols("r a", positive=True, real=True)
    q = r*r + a*a
    g = sp.Matrix([
        [(a*a-r*r)/q, 0, -2*a*r/q],
        [0, r*r, 0],
        [-2*a*r/q, 0, (r*r-a*a)/q],
    ])
    gi = sp.simplify(g.inv())
    coords = [r, sp.Symbol("phi"), sp.Symbol("z")]
    n = 3
    C = [[[
        sp.simplify(sum(gi[i, k] * (
            sp.diff(g[k, j], coords[l]) + sp.diff(g[k, l], coords[j])
            - sp.diff(g[j, l], coords[k])) for k in range(n)) / 2)
        for l in range(n)] for j in range(n)] for i in range(n)]
    Ric = sp.Matrix(n, n, lambda i, j: sp.factor(sum(
        sp.diff(C[k][i][j], coords[k]) - sp.diff(C[k][i][k], coords[j])
        + sum(C[k][i][j]*C[l][k][l] - C[l][i][k]*C[k][j][l]
              for l in range(n)) for k in range(n))))
    mixed = sp.simplify(gi * Ric)
    R = sp.factor(sp.trace(mixed))
    Ric2 = sp.factor(sp.trace(mixed * mixed))
    # The 4D metric is this 3D factor times a flat w-line. In 3D,
    # Riemann^2=4 Ricci^2-R^2; the same contraction holds for the product.
    K = sp.factor(4*Ric2 - R*R)
    Weyl2 = sp.factor(K - 2*Ric2 + R*R/3)
    charpoly = sp.factor(mixed.charpoly().as_expr())
    return r, a, g, Ric, R, Ric2, K, Weyl2, charpoly


def metric_numeric(r: float, a: float) -> np.ndarray:
    q = r*r + a*a
    return np.array([[(a*a-r*r)/q, 0.0, -2*a*r/q],
                     [0.0, r*r, 0.0],
                     [-2*a*r/q, 0.0, (r*r-a*a)/q]])


def christoffel_fd(r: float, a: float, dh: float) -> np.ndarray:
    g = metric_numeric(r, a)
    gi = np.linalg.inv(g)
    dg = (metric_numeric(r+dh, a)-metric_numeric(r-dh, a))/(2*dh)
    C = np.zeros((3, 3, 3))
    for i in range(3):
        for j in range(3):
            for l in range(3):
                for k in range(3):
                    C[i, j, l] += 0.5*gi[i, k]*(
                        (dg[k, j] if l == 0 else 0.0)
                        + (dg[k, l] if j == 0 else 0.0)
                        - (dg[j, l] if k == 0 else 0.0))
    return C


def ricci_fd(r: float, a: float, h: float) -> np.ndarray:
    # Metric derivatives inside Gamma use a smaller nested step.
    inner = h/8
    C = christoffel_fd(r, a, inner)
    dC = (christoffel_fd(r+h, a, inner)
          - christoffel_fd(r-h, a, inner))/(2*h)
    Ric = np.zeros((3, 3))
    for i in range(3):
        for j in range(3):
            Ric[i, j] = dC[0, i, j]
            if j == 0:
                Ric[i, j] -= sum(dC[k, i, k] for k in range(3))
            for k in range(3):
                for l in range(3):
                    Ric[i, j] += (C[k, i, j]*C[l, k, l]
                                  - C[l, i, k]*C[k, j, l])
    return Ric


def run():
    r, a, g, Ric, R, Ric2, K, Weyl2, charpoly = derive()
    values = {}
    for name, radius in (("class_change_r_eq_a", a),
                         ("scalar_zero_r_eq_sqrt3a", sp.sqrt(3)*a)):
        values[name] = {
            "R_times_a2": sp.simplify(R.subs(r, radius)*a*a),
            "Ricci2_times_a4": sp.simplify(Ric2.subs(r, radius)*a**4),
            "Kretschmann_times_a4": sp.simplify(K.subs(r, radius)*a**4),
            "Weyl2_times_a4": sp.simplify(Weyl2.subs(r, radius)*a**4),
        }

    formulas = {
        "R": R, "Ricci2": Ric2, "Kretschmann": K,
        "Weyl2": Weyl2, "mixed_Ricci_charpoly": charpoly,
    }
    # Independent centered-finite-difference reconstruction from the metric.
    an, rn = 0.37, 0.83
    exact_R = float(R.subs({a: an, r: rn}))
    exact_Ric2 = float(Ric2.subs({a: an, r: rn}))
    convergence = []
    for h in (2e-3, 1e-3, 5e-4, 2.5e-4):
        Ric_n = ricci_fd(rn, an, h)
        mixed_n = np.linalg.inv(metric_numeric(rn, an)) @ Ric_n
        R_n = float(np.trace(mixed_n))
        Ric2_n = float(np.trace(mixed_n @ mixed_n))
        convergence.append({
            "h": h,
            "R_abs_error": abs(R_n-exact_R),
            "Ricci2_abs_error": abs(Ric2_n-exact_Ric2),
        })
    # Independent exact controls and limiting cases.
    assert sp.simplify(R - 4*a*a*(3*a*a-r*r)/(a*a+r*r)**3) == 0
    assert sp.simplify(K - (4*Ric2-R*R)) == 0
    assert sp.simplify(Weyl2 - (2*Ric2-sp.Rational(2,3)*R*R)) == 0
    assert all(sp.limit(expr, a, 0) == 0 for expr in (R, Ric2, K, Weyl2))
    assert all(sp.limit(expr, r, sp.oo) == 0 for expr in (R, Ric2, K, Weyl2))
    assert values["scalar_zero_r_eq_sqrt3a"]["R_times_a2"] == 0
    assert values["scalar_zero_r_eq_sqrt3a"]["Kretschmann_times_a4"] != 0
    assert sp.factor(g.det()) == -r*r
    assert convergence[-1]["R_abs_error"] < 2e-6
    assert convergence[-1]["Ricci2_abs_error"] < 2e-5

    def txt(x):
        return str(sp.factor(x))
    return {
        "status": "GEN/DERIVED mathematical sandbox",
        "formulas": {k: txt(v) for k, v in formulas.items()},
        "special_radii": {
            k: {kk: txt(vv) for kk, vv in row.items()}
            for k, row in values.items()
        },
        "finite_difference_control": {
            "a": an, "r": rn, "exact_R": exact_R,
            "exact_Ricci2": exact_Ric2, "convergence": convergence,
        },
        "controls": {
            "det_g": txt(sp.factor(g.det())),
            "a_to_zero_all_invariants": 0,
            "r_to_infinity_all_invariants": 0,
            "identity_used": "3D Riemann^2=4 Ricci^2-R^2; flat-w product",
        },
    }


if __name__ == "__main__":
    print(json.dumps(run(), indent=2, sort_keys=True))
