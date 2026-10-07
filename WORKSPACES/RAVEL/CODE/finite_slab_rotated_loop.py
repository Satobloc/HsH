#!/usr/bin/env python3
"""Finite-core circular carrier intersecting a finite resolving slab.

LOCAL:RAVEL notation only.  This is a sandbox geometry/readout model, not a
claim that the modeled object is literally circular or that the readout is
the whole H(s)H map.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


OUT_JSON = Path("finite_slab_rotated_loop.json")
OUT_SVG = Path("finite_slab_rotated_loop.svg")
OUT_PNG = Path("finite_slab_rotated_loop.png")


def antiderivative_ball_area(z: np.ndarray, core_radius: float) -> np.ndarray:
    """Integral of pi*(r^2-z^2); pi cancels after normalization."""
    return core_radius**2 * z - z**3 / 3.0


def cross_section_weight(q_center: np.ndarray, slab_thickness: float, core_radius: float) -> np.ndarray:
    """Fraction of a 3-ball normal cross-section lying inside |q| <= d/2.

    The carrier is a 1D centerline with a 3D normal-ball core in four ambient
    dimensions.  q_center is the centerline's signed normal displacement.
    """
    if core_radius <= 0:
        return (np.abs(q_center) <= slab_thickness / 2.0).astype(float)
    z_lo = np.maximum(-core_radius, -slab_thickness / 2.0 - q_center)
    z_hi = np.minimum(core_radius, slab_thickness / 2.0 - q_center)
    raw = antiderivative_ball_area(z_hi, core_radius) - antiderivative_ball_area(z_lo, core_radius)
    raw = np.where(z_hi > z_lo, raw, 0.0)
    return 3.0 * raw / (4.0 * core_radius**3)


def incidence_fraction_analytic(theta: np.ndarray, radius: float, slab_thickness: float, core_radius: float) -> np.ndarray:
    """Centerline-phase fraction whose finite core has nonempty slab incidence."""
    amp = radius * np.abs(np.sin(theta))
    a_eff = slab_thickness / 2.0 + core_radius
    out = np.ones_like(amp, dtype=float)
    active = amp > a_eff
    out[active] = (2.0 / np.pi) * np.arcsin(a_eff / amp[active])
    return out


def geometry(radius: float, theta: float, phase: np.ndarray) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Projection coordinates (x,y) and resolving-normal coordinate q."""
    x = radius * np.cos(phase)
    y = radius * np.cos(theta) * np.sin(phase)
    q = radius * np.sin(theta) * np.sin(phase)
    return x, y, q


def main() -> None:
    radius = 1.0
    slab_thickness = 0.08
    core_radius = 0.06
    a_eff = slab_thickness / 2.0 + core_radius
    theta_critical = float(np.arcsin(a_eff / radius))

    phase = np.linspace(0.0, 2.0 * np.pi, 200_000, endpoint=False)
    theta_grid = np.linspace(0.0, np.pi / 2.0, 501)
    analytic = incidence_fraction_analytic(theta_grid, radius, slab_thickness, core_radius)
    numeric = []
    weighted = []
    for theta in theta_grid:
        _, _, q = geometry(radius, theta, phase)
        numeric.append(np.mean(np.abs(q) <= a_eff))
        weighted.append(np.mean(cross_section_weight(q, slab_thickness, core_radius)))
    numeric = np.asarray(numeric)
    weighted = np.asarray(weighted)

    sample_degrees = [0.0, 10.0, 30.0, 60.0, 90.0]
    samples = []
    for deg in sample_degrees:
        theta = np.deg2rad(deg)
        _, _, q = geometry(radius, theta, phase)
        mask_fraction = float(np.mean(np.abs(q) <= a_eff))
        analytic_fraction = float(incidence_fraction_analytic(np.array([theta]), radius, slab_thickness, core_radius)[0])
        samples.append(
            {
                "theta_deg": deg,
                "projection_semiaxes": [radius, float(radius * abs(np.cos(theta)))],
                "incidence_fraction_analytic": analytic_fraction,
                "incidence_fraction_numeric": mask_fraction,
                "weighted_cross_section_signal": float(np.mean(cross_section_weight(q, slab_thickness, core_radius))),
                "intersection_components": 1 if analytic_fraction == 1.0 else 2,
            }
        )

    result = {
        "status": "GEN/CANDIDATE sandbox geometry",
        "local_namespace": "LOCAL:RAVEL:FINITE_SLAB_LOOP",
        "parameters": {
            "carrier_radius_R": radius,
            "slab_thickness_dSigma": slab_thickness,
            "normal_core_radius_rCore": core_radius,
            "effective_incidence_halfwidth_aEff": a_eff,
            "critical_tilt_deg": float(np.rad2deg(theta_critical)),
        },
        "equations": {
            "normal_coordinate": "q(phi)=R sin(theta_clip) sin(phi)",
            "incidence": "|q| <= dSigma/2 + rCore",
            "kappa": "(dSigma/2+rCore)/(R|sin(theta_clip)|)",
            "visible_fraction": "1 if kappa>=1; otherwise (2/pi) asin(kappa)",
            "projection_semiaxes": "(R, R|cos(theta_clip)|)",
        },
        "validation": {
            "max_abs_analytic_numeric_fraction_error": float(np.max(np.abs(analytic - numeric))),
            "weight_min": float(weighted.min()),
            "weight_max": float(weighted.max()),
        },
        "samples": samples,
        "discriminator": {
            "projection_model": "continuous full ellipse for every theta<90 deg; line segment at 90 deg",
            "pure_intersection_model": "full loop below critical tilt; two arcs above; two points in zero-width limit",
        },
    }
    OUT_JSON.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")

    fig = plt.figure(figsize=(13.5, 8.2), constrained_layout=True)
    grid = fig.add_gridspec(2, 3)
    cmap = plt.get_cmap("viridis")
    draw_phase = np.linspace(0.0, 2.0 * np.pi, 1600, endpoint=False)
    for ax, deg in zip([fig.add_subplot(grid[0, i]) for i in range(3)] + [fig.add_subplot(grid[1, 0])], [0, 30, 60, 90]):
        theta = np.deg2rad(deg)
        x, y, q = geometry(radius, theta, draw_phase)
        w = cross_section_weight(q, slab_thickness, core_radius)
        ax.plot(x, y, color="0.82", lw=1.5, label="full projection")
        keep = w > 1e-9
        sc = ax.scatter(
            x[keep], y[keep], c=w[keep], s=7, cmap=cmap, vmin=0, vmax=1,
            linewidths=0, rasterized=True,
        )
        ax.set_aspect("equal", adjustable="box")
        ax.set_xlim(-1.12, 1.12)
        ax.set_ylim(-1.12, 1.12)
        ax.set_title(rf"$\theta_{{clip}}={deg}^\circ$")
        ax.set_xlabel("sheet coordinate x / R")
        ax.set_ylabel("sheet coordinate y / R")
        ax.grid(alpha=0.18)
    cbar = fig.colorbar(sc, ax=fig.axes[:4], shrink=0.75, pad=0.01)
    cbar.set_label("fraction of finite-core cross-section in slab")

    ax = fig.add_subplot(grid[1, 1:])
    ax.plot(np.rad2deg(theta_grid), analytic, color="#d95f02", lw=2.5, label="nonempty incidence fraction")
    ax.plot(np.rad2deg(theta_grid), weighted, color="#1b9e77", lw=2.5, label="cross-section-weighted signal")
    ax.axvline(np.rad2deg(theta_critical), color="black", ls="--", lw=1.3, label=rf"critical tilt {np.rad2deg(theta_critical):.2f}°")
    ax.set(xlabel=r"tilt $\theta_{clip}$ (degrees)", ylabel="normalized readout", xlim=(0, 90), ylim=(-0.02, 1.03))
    ax.grid(alpha=0.22)
    ax.legend(frameon=False, loc="upper right")
    ax.set_title("Projection and pure intersection make different morphology predictions")
    fig.suptitle("Finite-core loop × finite resolving slab (LOCAL:RAVEL sandbox)", fontsize=15)
    fig.savefig(OUT_SVG)
    fig.savefig(OUT_PNG, dpi=180)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
