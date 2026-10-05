#!/usr/bin/env python3
"""Common-unit finite-slab occupancy for B^3 bulk and S^2 boundary carriers."""

from __future__ import annotations

import json
import math
from pathlib import Path

import numpy as np
from scipy.integrate import quad
from scipy.optimize import brentq, minimize_scalar

def occupancy_bulk(lam: float) -> float:
    """Contact-support averaged admitted fraction of a uniform B^3 carrier."""
    if lam < 0:
        raise ValueError("lambda must be nonnegative")
    if lam <= 1.0:
        t = math.sqrt((1.0 - lam) / (1.0 + lam))
        p = 3*t**6 + 3*t**5 + 10*t**4 + 10*t**3 + 10*t**2 + 3*t + 3
        return (8.0 / 35.0) * (1.0 - t) * p / (1.0 + t*t) ** 3
    u = math.sqrt((lam - 1.0) / (lam + 1.0))
    q = 3*u**4 + 9*u**3 + 11*u**2 + 9*u + 3
    return (8.0 / 35.0) * q / (1.0 + u) ** 3


def occupancy_surface(lam: float) -> float:
    """Contact-support averaged admitted fraction of a uniform S^2 carrier."""
    if lam < 0:
        raise ValueError("lambda must be nonnegative")
    if lam <= 1.0:
        t = math.sqrt((1.0 - lam) / (1.0 + lam))
        return (2.0 / 3.0) * (1.0 - t**3) / (1.0 + t*t)
    u = math.sqrt((lam - 1.0) / (lam + 1.0))
    return (2.0 / 3.0) * (1.0 + u + u*u) / (1.0 + u)


def bulk_fraction_at_x(x: float, lam: float) -> float:
    lo = max(-1.0, -lam - x * x)
    hi = min(1.0, lam - x * x)
    if hi <= lo:
        return 0.0
    return 0.75 * ((hi - hi**3 / 3.0) - (lo - lo**3 / 3.0))


def surface_fraction_at_x(x: float, lam: float) -> float:
    lo = max(-1.0, -lam - x * x)
    hi = min(1.0, lam - x * x)
    return max(0.0, hi - lo) / 2.0


def occupancy_quadrature(lam: float, fraction_fn) -> float:
    b = math.sqrt(1.0 + lam)
    value, _ = quad(lambda x: fraction_fn(x, lam), -b, b, epsabs=2e-13, epsrel=2e-13, points=[-b, b], limit=400)
    return value / (2.0 * b)


def separation_stationary_polynomial(t: float) -> float:
    # Unique (0,1) root controls max[O_B3 - O_S2] on the lambda<1 branch.
    return t**7 - 7.0 * t**5 - 70.0 * t**4 + 175.0 * t**3 + 196.0 * t**2 - 105.0 * t - 22.0


def main() -> None:
    t_star = brentq(separation_stationary_polynomial, 0.4, 0.7, xtol=1e-15)
    lam_star = (1.0 - t_star * t_star) / (1.0 + t_star * t_star)
    delta_star = occupancy_bulk(lam_star) - occupancy_surface(lam_star)
    numerical = minimize_scalar(
        lambda z: -(occupancy_bulk(float(z)) - occupancy_surface(float(z))),
        bounds=(0.0, 20.0),
        method="bounded",
        options={"xatol": 1e-14},
    )

    check_lams = [0.01, 0.1, lam_star, 0.9, 1.0, 1.5, 5.0]
    quad_errors = {}
    for lam in check_lams:
        quad_errors[str(lam)] = {
            "bulk": occupancy_quadrature(lam, bulk_fraction_at_x) - occupancy_bulk(lam),
            "surface": occupancy_quadrature(lam, surface_fraction_at_x) - occupancy_surface(lam),
        }

    grid = np.geomspace(1e-7, 1e4, 20001)
    ob = np.array([occupancy_bulk(float(v)) for v in grid])
    os = np.array([occupancy_surface(float(v)) for v in grid])
    delta = ob - os
    checks = {
        "definition": "mean admitted carrier fraction over the full contact-support interval",
        "lambda_star_max_separation": lam_star,
        "t_star": t_star,
        "stationary_polynomial_residual": separation_stationary_polynomial(t_star),
        "bulk_occupancy_at_lambda_star": occupancy_bulk(lam_star),
        "surface_occupancy_at_lambda_star": occupancy_surface(lam_star),
        "maximum_absolute_separation": delta_star,
        "maximum_relative_to_surface": delta_star / occupancy_surface(lam_star),
        "numerical_optimizer_lambda": float(numerical.x),
        "numerical_optimizer_delta": float(-numerical.fun),
        "grid_bulk_min_increment": float(np.min(np.diff(ob))),
        "grid_surface_min_increment": float(np.min(np.diff(os))),
        "grid_min_bulk_minus_surface": float(np.min(delta)),
        "large_lambda_bulk": occupancy_bulk(1e6),
        "large_lambda_surface": occupancy_surface(1e6),
        "quadrature_minus_closed_form": quad_errors,
    }
    Path("common_unit_occupancy.json").write_text(
        json.dumps(checks, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )

    import matplotlib.pyplot as plt

    fig, axes = plt.subplots(1, 2, figsize=(11.0, 4.25), constrained_layout=True)
    ax = axes[0]
    lams = np.linspace(0.0, 2.0, 1201)
    obp = np.array([occupancy_bulk(float(v)) for v in lams])
    osp = np.array([occupancy_surface(float(v)) for v in lams])
    ax.plot(lams, obp, color="#7c3aed", lw=2.3, label=r"bulk $B^3$")
    ax.plot(lams, osp, color="#0f766e", lw=2.3, label=r"boundary $S^2$")
    ax.axvline(lam_star, color="#dc2626", lw=1.1, ls="--")
    ax.scatter([lam_star, lam_star], [occupancy_bulk(lam_star), occupancy_surface(lam_star)], color=["#7c3aed", "#0f766e"], zorder=5)
    ax.set(xlim=(0, 2), ylim=(0, 0.88), xlabel=r"thickness ratio $\lambda=h_\Sigma/r_c$", ylabel="mean admitted carrier fraction", title="One common dimensionless detector unit")
    ax.legend(frameon=False)

    ax = axes[1]
    lams2 = np.linspace(0.0, 4.0, 1601)
    sep = np.array([occupancy_bulk(float(v)) - occupancy_surface(float(v)) for v in lams2])
    ax.plot(lams2, sep, color="#b45309", lw=2.3)
    ax.axvline(lam_star, color="#dc2626", lw=1.1, ls="--")
    ax.scatter([lam_star], [delta_star], color="#dc2626", zorder=5)
    label = fr"$\lambda_\Delta={lam_star:.6f}$" + "\n" + fr"$\Delta O={delta_star:.6f}$"
    ax.annotate(label, (lam_star, delta_star), xytext=(1.25, 0.052), arrowprops={"arrowstyle": "->", "color": "#dc2626"}, fontsize=9)
    ax.set(xlim=(0, 4), ylim=(0, 0.067), xlabel=r"thickness ratio $\lambda=h_\Sigma/r_c$", ylabel=r"$\bar O_{B^3}-\bar O_{S^2}$", title="Carrier contrast has one interior optimum")
    fig.savefig("common_unit_occupancy.svg", format="svg")
    fig.savefig("common_unit_occupancy.png", dpi=180)
    print(json.dumps(checks, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
