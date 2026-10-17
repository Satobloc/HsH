#!/usr/bin/env python3
"""Exact topology gate for a finite straight 4D tube cut by a 3D hyperplane.

Local coordinates are (z,x1,x2,x3).  The tube lateral boundary is
|z| <= L/2, |x| = a.  The resolving hyperplane is

    cos(iota) z + sin(iota) x1 = d.

The code classifies the intersection support and generates a Class-P SVG.
All symbols are local to this artifact.
"""

from __future__ import annotations

import json
import math
from pathlib import Path

import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
import numpy as np


HERE = Path(__file__).resolve().parent


def classify_support(a: float, L: float, iota: float, d: float, tol: float = 1e-12):
    """Return topology and allowed latitude-coordinate interval u=x1/a."""
    c = abs(math.cos(iota))
    s = abs(math.sin(iota))
    m = 0.5 * L * c
    b = a * s

    if b <= tol:
        if abs(d) <= m + tol:
            return "closed_S2", (-1.0, 1.0), 1.0
        return "none", (math.nan, math.nan), 0.0

    # |d-bu| <= m, u in [-1,1]
    raw_lo = (d - m) / b
    raw_hi = (d + m) / b
    lo = max(-1.0, raw_lo)
    hi = min(1.0, raw_hi)

    if hi < lo - tol:
        return "none", (math.nan, math.nan), 0.0
    if hi - lo <= tol:
        return "degenerate", (lo, hi), 0.0
    if raw_lo <= -1.0 + tol and raw_hi >= 1.0 - tol:
        return "closed_S2", (-1.0, 1.0), 1.0

    lower_cut = raw_lo > -1.0 + tol
    upper_cut = raw_hi < 1.0 - tol
    if lower_cut and upper_cut:
        topology = "open_band_S1xI"
    else:
        topology = "open_cap_D2"
    # Coordinate-area fraction on the cross-sectional S2; not the tilted
    # intersection's physical area, whose metric includes dz/du.
    fraction = max(0.0, min(1.0, 0.5 * (hi - lo)))
    return topology, (lo, hi), fraction


def closed_sphere_rates(d4_sphere: float, ell_max: int = 5):
    """Rates normalized by A/eta for A h + D Delta_S^2 h on radius a sphere.

    d4_sphere = D/(A a^4).  Multiplicity is 2*ell+1.
    """
    out = []
    for ell in range(ell_max + 1):
        lam_a2 = ell * (ell + 1)
        rate = 1.0 + d4_sphere * lam_a2**2
        out.append({"ell": ell, "multiplicity": 2 * ell + 1, "rate_A_over_eta": rate})
    return out


def main():
    a = 0.25
    L = 1.0
    d4_sphere = 2.5

    examples = [
        ("closed", math.radians(30.0), 0.10),
        ("cap", math.radians(60.0), 0.30),
        ("band", math.radians(75.0), 0.00),
        ("none", math.radians(75.0), 0.50),
    ]
    example_rows = []
    for label, angle, offset in examples:
        topology, interval, fraction = classify_support(a, L, angle, offset)
        serial_interval = [value if math.isfinite(value) else None for value in interval]
        example_rows.append(
            {
                "label": label,
                "iota_deg": math.degrees(angle),
                "offset_d": offset,
                "topology": topology,
                "u_interval": serial_interval,
                "cross_section_coordinate_area_fraction": fraction,
            }
        )

    assert [row["topology"] for row in example_rows] == [
        "closed_S2",
        "open_cap_D2",
        "open_band_S1xI",
        "none",
    ]

    critical_iota = math.atan(L / (2.0 * a))
    rates = closed_sphere_rates(d4_sphere)
    closed_gap = rates[1]["rate_A_over_eta"] / rates[0]["rate_A_over_eta"]
    assert abs(math.degrees(critical_iota) - 63.43494882292201) < 1e-12
    assert abs(closed_gap - 11.0) < 1e-12

    # Phase map.
    angles = np.linspace(0.0, math.pi / 2.0, 361)
    offsets = np.linspace(-0.75, 0.75, 401)
    code = {
        "none": 0,
        "degenerate": 1,
        "open_cap_D2": 2,
        "open_band_S1xI": 3,
        "closed_S2": 4,
    }
    grid = np.zeros((offsets.size, angles.size), dtype=int)
    for j, offset in enumerate(offsets):
        for k, angle in enumerate(angles):
            topology, _, _ = classify_support(a, L, float(angle), float(offset))
            grid[j, k] = code[topology]

    fig = plt.figure(figsize=(12.5, 8.0), constrained_layout=True)
    gs = fig.add_gridspec(2, 2, width_ratios=(1.45, 1.0))

    ax = fig.add_subplot(gs[:, 0])
    cmap = ListedColormap(["#f2f2f2", "#ffcc80", "#7fcdbb", "#41b6c4", "#253494"])
    im = ax.imshow(
        grid,
        origin="lower",
        aspect="auto",
        extent=[0, 90, offsets[0], offsets[-1]],
        interpolation="nearest",
        cmap=cmap,
        vmin=-0.5,
        vmax=4.5,
    )
    ax.axvline(math.degrees(critical_iota), color="black", lw=1.3, ls="--")
    ax.text(math.degrees(critical_iota) + 1.0, -0.70, r"$\iota_c=63.43495^\circ$", fontsize=10)
    ax.set_xlabel(r"hyperplane tilt $\iota$ from tube-axis normal (degrees)")
    ax.set_ylabel(r"offset $d/L$")
    ax.set_title(r"Exact support topology: $a/L=0.25$")
    cbar = fig.colorbar(im, ax=ax, shrink=0.82, ticks=range(5))
    cbar.ax.set_yticklabels(["none", "degenerate", r"cap $D^2$", r"band $S^1\!\times I$", r"closed $S^2$"])

    ax2 = fig.add_subplot(gs[0, 1])
    u = np.linspace(-1, 1, 600)
    y = np.sqrt(np.maximum(0.0, 1 - u**2))
    ax2.plot(u, y, color="0.35", lw=1.0)
    ax2.plot(u, -y, color="0.35", lw=1.0)
    colors = ["#253494", "#7fcdbb", "#41b6c4", "#999999"]
    for row, color in zip(example_rows, colors):
        lo, hi = row["u_interval"]
        if lo is not None:
            mask = (u >= lo) & (u <= hi)
            ax2.fill_between(u[mask], -y[mask], y[mask], alpha=0.30, color=color, label=f"{row['label']}: {row['topology']}")
    ax2.set_aspect("equal")
    ax2.set_xlabel(r"latitude coordinate $u=x_1/a$")
    ax2.set_ylabel("projected cross-section")
    ax2.set_title("Representative retained sphere latitudes")
    ax2.legend(fontsize=7, loc="lower center", bbox_to_anchor=(0.5, -0.43))

    ax3 = fig.add_subplot(gs[1, 1])
    ells = np.array([r["ell"] for r in rates[:4]])
    rr = np.array([r["rate_A_over_eta"] for r in rates[:4]])
    mult = np.array([r["multiplicity"] for r in rates[:4]])
    ax3.bar(ells, rr, color=["#253494", "#2c7fb8", "#41b6c4", "#7fcdbb"])
    for x, rate, multiplicity in zip(ells, rr, mult):
        ax3.text(x, rate * 1.025, f"m={multiplicity}\nr={rate:g}", ha="center", va="bottom", fontsize=8)
    ax3.set_yscale("log")
    ax3.set_xticks(ells)
    ax3.set_xlabel(r"spherical degree $\ell$")
    ax3.set_ylabel(r"rate $r_\ell/(A/\eta)$")
    ax3.set_title(r"Closed $S^2$: $D/(Aa^4)=2.5$, gap $r_1/r_0=11$")

    fig.suptitle("Finite 4D tube × resolving hyperplane: morphology and closed-support spectrum", fontsize=14)
    svg_path = HERE / "finite_tube_sheet_topology.svg"
    png_path = HERE / "finite_tube_sheet_topology.png"
    fig.savefig(svg_path)
    fig.savefig(png_path, dpi=180)
    plt.close(fig)

    payload = {
        "model": {
            "ambient_coordinates": "(z,x1,x2,x3)",
            "tube_lateral_boundary": "|z|<=L/2, x1^2+x2^2+x3^2=a^2",
            "resolving_hyperplane": "cos(iota) z + sin(iota) x1 = d",
            "a": a,
            "L": L,
            "aspect_ratio_a_over_L": a / L,
        },
        "classification": {
            "m": "(L/2)|cos(iota)|",
            "b": "a|sin(iota)|",
            "closed_condition": "|d|+b <= m",
            "absent_condition": "|d|-b > m",
            "partial_condition": "otherwise",
        },
        "centered_transition": {
            "critical_iota_rad": critical_iota,
            "critical_iota_deg": math.degrees(critical_iota),
        },
        "examples": example_rows,
        "closed_sphere_spectrum": {
            "operator": "eta h_tau = -A h - D Delta_S^2 h",
            "d4_sphere_D_over_Aa4": d4_sphere,
            "rates": rates,
            "first_gap": closed_gap,
            "tenfold_threshold_D_over_Aa4": 2.25,
        },
        "open_support_warning": {
            "operator": "integral [(A/2)h^2+(D/2)(Delta_S h)^2] dA",
            "natural_boundary_conditions": "Delta_S h=0 and normal_derivative(Delta_S h)=0",
            "consequence": "every harmonic h lies in the zero-bending kernel; on a domain with boundary this kernel is infinite-dimensional",
        },
    }
    (HERE / "finite_tube_sheet_topology.json").write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    print(json.dumps(payload, indent=2))


if __name__ == "__main__":
    main()
