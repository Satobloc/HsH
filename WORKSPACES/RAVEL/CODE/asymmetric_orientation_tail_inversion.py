#!/usr/bin/env python3
"""Two-orientation finite-slab inversion for an asymmetric B3/S2 carrier family."""

from __future__ import annotations

import json
import math
from pathlib import Path

import numpy as np
from scipy.integrate import quad


def base_density(u: float, bulk_fraction: float) -> float:
    p_bulk = 0.75 * (1.0 - u * u)
    p_boundary = 0.5
    return bulk_fraction * p_bulk + (1.0 - bulk_fraction) * p_boundary


def stretched_coordinate(u: float, rho_plus: float, rho_minus: float) -> float:
    return rho_plus * u if u < 0.0 else rho_minus * u


def contact_kernel(z: float, h: float, facing_support: float) -> float:
    return (
        math.sqrt(max(0.0, h - z)) - math.sqrt(max(0.0, -h - z))
    ) / math.sqrt(h + facing_support)


def occupancy(
    h: float,
    rho_plus: float,
    rho_minus: float,
    bulk_fraction: float,
    orientation: int,
) -> float:
    if h <= 0.0 or min(rho_plus, rho_minus) <= 0.0 or orientation not in (-1, 1):
        raise ValueError("invalid geometry")
    facing = rho_plus if orientation == 1 else rho_minus

    def integrand(u: float) -> float:
        z = stretched_coordinate(u, rho_plus, rho_minus)
        return base_density(u, bulk_fraction) * contact_kernel(orientation * z, h, facing)

    left = quad(integrand, -1.0, 0.0, epsabs=2e-13, epsrel=2e-13, limit=300)[0]
    right = quad(integrand, 0.0, 1.0, epsabs=2e-13, epsrel=2e-13, limit=300)[0]
    return left + right


def exact_centroid(rho_plus: float, rho_minus: float, bulk_fraction: float) -> float:
    return (rho_minus - rho_plus) * (0.25 - bulk_fraction / 16.0)


def tail_constant(
    h: float,
    rho_plus: float,
    rho_minus: float,
    bulk_fraction: float,
    orientation: int,
) -> float:
    return 2.0 * h * (
        1.0 - occupancy(h, rho_plus, rho_minus, bulk_fraction, orientation)
    )


def richardson_tail(
    h: float,
    rho_plus: float,
    rho_minus: float,
    bulk_fraction: float,
    orientation: int,
) -> float:
    # T(h)=T_inf+c/h+O(h^-2); this cancels the leading bias.
    return 2.0 * tail_constant(
        2.0 * h, rho_plus, rho_minus, bulk_fraction, orientation
    ) - tail_constant(h, rho_plus, rho_minus, bulk_fraction, orientation)


def recover_bulk_fraction(
    rho_plus: float, rho_minus: float, tail_plus: float, tail_minus: float
) -> tuple[float, float]:
    if math.isclose(rho_plus, rho_minus, rel_tol=0.0, abs_tol=1e-15):
        raise ZeroDivisionError("tail inversion is singular at symmetric support")
    mu = 0.5 * ((tail_plus - rho_plus) + (rho_minus - tail_minus))
    return 4.0 - 16.0 * mu / (rho_minus - rho_plus), mu


def main() -> None:
    kappa = 1.7
    cases = []
    for rho_plus, rho_minus in [(0.55, 1.4), (0.8, 1.2), (1.3, 0.7), (1.6, 0.45)]:
        for bulk_fraction in (0.1, 0.5, 0.9):
            h = 100.0 * max(rho_plus, rho_minus)
            t_plus = richardson_tail(h, rho_plus, rho_minus, bulk_fraction, 1)
            t_minus = richardson_tail(h, rho_plus, rho_minus, bulk_fraction, -1)
            recovered_w, recovered_mu = recover_bulk_fraction(
                rho_plus, rho_minus, t_plus, t_minus
            )
            alpha_plus = math.sqrt(2.0 * kappa * rho_plus)
            alpha_minus = math.sqrt(2.0 * kappa * rho_minus)
            cases.append(
                {
                    "rho_plus": rho_plus,
                    "rho_minus": rho_minus,
                    "bulk_fraction": bulk_fraction,
                    "exact_centroid": exact_centroid(
                        rho_plus, rho_minus, bulk_fraction
                    ),
                    "tail_plus": t_plus,
                    "tail_minus": t_minus,
                    "tail_sum_minus_support_sum": t_plus
                    + t_minus
                    - rho_plus
                    - rho_minus,
                    "recovered_centroid": recovered_mu,
                    "recovered_bulk_fraction": recovered_w,
                    "bulk_fraction_error": recovered_w - bulk_fraction,
                    "recovered_rho_plus": alpha_plus * alpha_plus / (2.0 * kappa),
                    "recovered_rho_minus": alpha_minus * alpha_minus / (2.0 * kappa),
                }
            )

    results = {
        "family": "piecewise-affine pushforward of even B3/S2 projected measures",
        "threshold_laws": {
            "alpha_plus_squared": "2*kappa*rho_plus",
            "alpha_minus_squared": "2*kappa*rho_minus",
        },
        "tail_laws": {
            "T_plus": "rho_plus + centroid",
            "T_minus": "rho_minus - centroid",
            "bulk_fraction": "4 - 16*centroid/(rho_minus-rho_plus)",
        },
        "max_absolute_bulk_fraction_error_at_100_supports": max(
            abs(c["bulk_fraction_error"]) for c in cases
        ),
        "max_absolute_tail_closure_error": max(
            abs(c["tail_sum_minus_support_sum"]) for c in cases
        ),
        "cases": cases,
    }
    Path("asymmetric_orientation_tail_inversion.json").write_text(
        json.dumps(results, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )

    import matplotlib.pyplot as plt

    plt.rcParams["svg.fonttype"] = "none"
    rho_plus, rho_minus, w = 0.7, 1.3, 0.45
    fig, axes = plt.subplots(1, 3, figsize=(14.2, 4.25), constrained_layout=True)

    z_left = np.linspace(-rho_plus, 0.0, 400, endpoint=False)
    z_right = np.linspace(0.0, rho_minus, 400)
    z = np.concatenate([z_left, z_right])
    u = np.where(z < 0.0, z / rho_plus, z / rho_minus)
    jac = np.where(z < 0.0, rho_plus, rho_minus)
    p_bulk = 0.75 * (1.0 - u * u) / jac
    p_boundary = 0.5 / jac
    p_mix = w * p_bulk + (1.0 - w) * p_boundary
    axes[0].plot(z, p_bulk, color="#7c3aed", lw=2.0, label=r"bulk $B^3$")
    axes[0].plot(z, p_boundary, color="#0f766e", lw=2.0, label=r"boundary $S^2$")
    axes[0].plot(z, p_mix, color="#b45309", lw=2.4, label=fr"mixture $w_B={w:.2f}$")
    axes[0].axvline(0.0, color="#64748b", lw=0.8)
    axes[0].set(
        xlabel=r"projected normal coordinate $z$",
        ylabel="normalized projected density",
        title="Declared asymmetric carrier family",
    )
    axes[0].legend(frameon=False, fontsize=8)

    hs = np.geomspace(0.003, 30.0, 500)
    o_plus = np.array([occupancy(float(h), rho_plus, rho_minus, w, 1) for h in hs])
    o_minus = np.array([occupancy(float(h), rho_plus, rho_minus, w, -1) for h in hs])
    axes[1].semilogx(hs, o_plus, color="#2563eb", lw=2.2, label="orientation +")
    axes[1].semilogx(hs, o_minus, color="#dc2626", lw=2.2, label="orientation −")
    axes[1].set(
        xlabel=r"slab half-thickness $h$",
        ylabel="contact-support occupancy",
        ylim=(0.0, 1.01),
        title="Orientation reversal exposes skew",
    )
    axes[1].legend(frameon=False, fontsize=8)

    eta = np.r_[np.geomspace(0.2, 0.98, 300), np.geomspace(1.02, 5.0, 300)]
    rp = 1.0 / np.sqrt(eta)
    rm = np.sqrt(eta)
    sensitivity = 16.0 / np.abs(rm - rp)
    axes[2].loglog(eta, sensitivity, color="#9333ea", lw=2.2)
    axes[2].axvline(1.0, color="#dc2626", lw=1.1, ls="--")
    axes[2].set(
        xlabel=r"support ratio $\eta=\rho_-/\rho_+$",
        ylabel=r"tail sensitivity $|\partial w_B/\partial\mu|$",
        title="Tail inversion fails at symmetry",
    )

    fig.savefig("asymmetric_orientation_tail_inversion.svg", format="svg")
    fig.savefig("asymmetric_orientation_tail_inversion.png", dpi=180)
    print(json.dumps(results, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
