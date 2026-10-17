#!/usr/bin/env python3
"""Exact/numerical gate for transporting Morrow's hollow B3 fiber in R4.

Status: GEN/DERIVED conditional Euclidean geometry; not a physical H(s)H claim.

The centreline is the radius-A circle gamma(s)=(A cos s,A sin s,0,0).
Its normal 3-ball has radial coordinate

    d(x,gamma) = sqrt((sqrt(x1^2+x2^2)-A)^2+x3^2+x4^2).

The swept hollow carrier is Rin <= d <= Rout.  At s=0, the tempting
fixed-fiber meridian about the central S2 is

    C(t)=(A+Rm+eps cos t, eps sin t, 0, 0),

where the second coordinate is the centreline tangent, i.e. the transverse
direction that supplied winding before the sweep.  Its frozen-fiber winding
is +1, but its clearance is computed against the *entire* swept carrier.
"""

from __future__ import annotations

import json
import math
import numpy as np


def centreline_distance(A: float, x: np.ndarray) -> np.ndarray:
    polar = np.hypot(x[..., 0], x[..., 1])
    return np.sqrt((polar - A) ** 2 + x[..., 2] ** 2 + x[..., 3] ** 2)


def shell_clearance(d: np.ndarray, rin: float, rout: float) -> np.ndarray:
    """Euclidean distance to {rin <= distance-to-centreline <= rout}."""
    return np.maximum.reduce((rin - d, d - rout, np.zeros_like(d)))


def candidate(A: float, rm: float, eps: float, t: np.ndarray) -> np.ndarray:
    x = np.zeros((len(t), 4))
    x[:, 0] = A + rm + eps * np.cos(t)
    x[:, 1] = eps * np.sin(t)
    return x


def polygon_winding(z: np.ndarray) -> float:
    return float(np.angle(np.roll(z, -1) / z).sum() / (2 * np.pi))


def root_cos(A: float, rm: float, eps: float, radius: float) -> float:
    """cos(t) at which the candidate has centreline distance == radius."""
    return ((A + radius) ** 2 - (A + rm) ** 2 - eps**2) / (
        2 * eps * (A + rm)
    )


def analytic_material_fraction(A: float, rm: float, eps: float,
                               rin: float, rout: float) -> float:
    # d(t) is strictly increasing in cos(t) for A+rm > eps.
    c_in = float(np.clip(root_cos(A, rm, eps, rin), -1.0, 1.0))
    c_out = float(np.clip(root_cos(A, rm, eps, rout), -1.0, 1.0))
    # Fraction with c_in <= cos(t) <= c_out.
    return (math.acos(c_in) - math.acos(c_out)) / math.pi


def run() -> dict:
    A, rin, rout, eps, a = 5.0, 0.8, 1.2, 0.3, 0.05
    rm, w = (rin + rout) / 2, (rout - rin) / 2
    fixture = {}
    convergence = []
    exact_fraction = analytic_material_fraction(A, rm, eps, rin, rout)

    for n in (256, 1024, 4096, 16384, 65536):
        t = 2 * np.pi * np.arange(n) / n
        x = candidate(A, rm, eps, t)
        d = centreline_distance(A, x)
        clear = shell_clearance(d, rin, rout)
        z = eps * np.exp(1j * t)  # frozen-fiber contact coordinates
        frac = float(np.mean((d >= rin) & (d <= rout)))
        convergence.append({
            "n": n,
            "winding": polygon_winding(z),
            "minimum_global_clearance": float(clear.min()),
            "sampled_material_fraction": frac,
            "material_fraction_error": frac - exact_fraction,
        })

    # Exterior non-winding loop around a point safely outside the shell.
    n = 65536
    t = 2 * np.pi * np.arange(n) / n
    centre, radius = 1.50, 0.10
    x0 = np.zeros((n, 4))
    x0[:, 0] = A + centre + radius * np.cos(t)
    x0[:, 1] = radius * np.sin(t)
    d0 = centreline_distance(A, x0)
    c0 = shell_clearance(d0, rin, rout)
    z0 = (centre - rm) + radius * np.exp(1j * t)

    # Curvature scan: every finite A tested retains W=1 but intersects K.
    curvature_scan = []
    for AA in (1.5, 2.0, 5.0, 10.0, 100.0, 1e6):
        x = candidate(AA, rm, eps, t)
        d = centreline_distance(AA, x)
        curvature_scan.append({
            "A": AA,
            "minimum_clearance": float(shell_clearance(d, rin, rout).min()),
            "material_fraction": float(np.mean((d >= rin) & (d <= rout))),
            "analytic_fraction": analytic_material_fraction(AA, rm, eps, rin, rout),
        })

    # Endpoint inequalities are an IVT certificate of forced contact.
    d_outer = rm + eps
    d_inner = rm - eps
    fixture.update({
        "A": A, "Rin": rin, "Rout": rout, "Rm": rm, "w": w,
        "eps": eps, "excluded_clearance_a": a,
        "fixed_fiber_prediction_eps_minus_w": eps - w,
        "swept_endpoint_distances": [d_inner, d_outer],
        "forced_contact_certificate": bool(d_inner < rin and d_outer > rout),
        "analytic_material_fraction": exact_fraction,
        "negative_control_winding": polygon_winding(z0),
        "negative_control_minimum_clearance": float(c0.min()),
        "negative_control_clearance_margin_over_a": float(c0.min() - a),
    })
    result = {
        "status": "GEN/DERIVED; Euclidean model gate only",
        "fixture": fixture,
        "convergence": convergence,
        "curvature_scan": curvature_scan,
        "limiting_cases": {
            "flat_A_to_infinity_material_fraction": (
                math.acos(-w / eps) - math.acos(w / eps)
            ) / math.pi,
            "eps_le_w": "formal loop cannot connect inner and outer complement",
            "eps_gt_w": "IVT forces two shell crossings; global clearance is zero",
        },
    }
    assert fixture["forced_contact_certificate"]
    assert abs(convergence[-1]["winding"] - 1.0) < 1e-12
    assert convergence[-1]["minimum_global_clearance"] == 0.0
    assert abs(convergence[-1]["material_fraction_error"]) < 1e-4
    assert abs(fixture["negative_control_winding"]) < 1e-12
    assert fixture["negative_control_clearance_margin_over_a"] > 0
    assert all(row["minimum_clearance"] == 0.0 for row in curvature_scan)
    return result


if __name__ == "__main__":
    print(json.dumps(run(), indent=2, sort_keys=True))
