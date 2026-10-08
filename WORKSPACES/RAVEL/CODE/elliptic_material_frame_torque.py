#!/usr/bin/env python3
"""Exact surface quadrature for an elliptic core in a rotating material frame."""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "DATA" / "elliptic_material_frame_torque.json"
FIGURE = ROOT / "FIGURES" / "elliptic_material_frame_torque.svg"

LAM = 0.55  # ellipse semiaxis ratio b/a
G = 1.3  # arbitrary local traction-gradient magnitude
Q = 0.60  # R_h^2/(R_h^2+p_h^2)
NPHI = 40_000
PHI = np.linspace(-np.pi, np.pi, NPHI, endpoint=False)
BASE_E = np.sin(PHI) ** 2 + LAM**2 * np.cos(PHI) ** 2
BASE_W = np.sqrt(BASE_E)
BASE_NORM = BASE_W.sum()


def weighted_mean(values: np.ndarray) -> float:
    return float(np.sum(BASE_W * values) / BASE_NORM)


def shape_fields(psi: float) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Dimensionless radial and binormal coordinates plus twist metric term."""
    h = np.cos(PHI) * np.cos(psi) - LAM * np.sin(PHI) * np.sin(psi)
    k = np.cos(PHI) * np.sin(psi) + LAM * np.sin(PHI) * np.cos(psi)
    d = (1.0 - LAM**2) ** 2 * np.sin(PHI) ** 2 * np.cos(PHI) ** 2 / BASE_E
    return h, k, d


def exact_factor(x: float, psi: float, zeta: float, q: float = Q) -> float:
    """Torque per centerline length at fixed traction density, normalized at x=0.

    zeta = R_h*(tau_h + dpsi/ds) is the dimensionless material twist rate.
    """
    h, k, _ = shape_fields(psi)
    rho = np.sqrt((1.0 - x * h) ** 2 + (1.0 - q) * x * x * k * k)
    jac_ratio = np.sqrt(
        BASE_E * (1.0 - q * x * h) ** 2
        + (zeta * x) ** 2
        * (1.0 - LAM**2) ** 2
        * np.sin(PHI) ** 2
        * np.cos(PHI) ** 2
    ) / np.sqrt(BASE_E)
    torque_ratio = rho * np.exp(-G * (rho - 1.0))
    return weighted_mean(jac_ratio * torque_ratio)


def analytic_moments() -> dict[str, float]:
    mc = weighted_mean(np.cos(PHI) ** 2)
    ms = weighted_mean(LAM**2 * np.sin(PHI) ** 2)
    d = weighted_mean((1.0 - LAM**2) ** 2 * np.sin(PHI) ** 2 * np.cos(PHI) ** 2 / BASE_E)
    return {"M_c": mc, "M_s": ms, "M_plus": 0.5 * (mc + ms), "M_minus": 0.5 * (mc - ms), "D": d}


def analytic_c2(psi: np.ndarray | float, zeta: np.ndarray | float, q: float = Q) -> np.ndarray | float:
    m = analytic_moments()
    alpha = 1.0 - G
    beta = G * G - 2.0 * G
    c0 = m["M_plus"] * (beta + alpha * (1.0 + q)) / 2.0
    c2psi = m["M_minus"] * (beta - alpha + 3.0 * q * alpha) / 2.0
    return c0 + c2psi * np.cos(2.0 * psi) + 0.5 * zeta * zeta * m["D"]


def material_tube_mesh(psi0: float = 0.35, zeta: float = 0.75):
    r_h = 1.0
    p_h = np.sqrt(1.0 / Q - 1.0)
    l_h = np.sqrt(r_h * r_h + p_h * p_h)
    tau_h = p_h / (l_h * l_h)
    theta = np.linspace(0.0, 3.5 * np.pi, 84)
    phi = np.linspace(0.0, 2.0 * np.pi, 20)
    th, ph = np.meshgrid(theta, phi, indexing="ij")
    s = l_h * th
    psi = psi0 + (zeta / r_h - tau_h) * s
    er = np.stack((np.cos(th), np.sin(th), np.zeros_like(th)), axis=-1)
    ephi = np.stack((-np.sin(th), np.cos(th), np.zeros_like(th)), axis=-1)
    ez = np.zeros_like(er)
    ez[..., 2] = 1.0
    n = -er
    bvec = (r_h * ez - p_h * ephi) / l_h
    d1 = np.cos(psi)[..., None] * n + np.sin(psi)[..., None] * bvec
    d2 = -np.sin(psi)[..., None] * n + np.cos(psi)[..., None] * bvec
    center = r_h * er + (p_h * th)[..., None] * ez
    a = 0.18
    offset = a * np.cos(ph)[..., None] * d1 + (LAM * a) * np.sin(ph)[..., None] * d2
    return center + offset, center[:, 0, :]


def main() -> None:
    moments = analytic_moments()
    psi_grid = np.linspace(0.0, np.pi, 61)
    zeta_grid = np.linspace(0.0, 3.0, 71)
    x_fit = np.linspace(-0.012, 0.012, 25)

    fit_records = []
    max_c2_error = 0.0
    max_even_error = 0.0
    for psi in np.linspace(0.0, np.pi, 13):
        for zeta in np.linspace(0.0, 3.0, 9):
            vals = np.array([exact_factor(float(x), float(psi), float(zeta)) - 1.0 for x in x_fit])
            coefs = np.polynomial.polynomial.polyfit(x_fit, vals, 4)
            expected = float(analytic_c2(psi, zeta))
            err = abs(float(coefs[2]) - expected)
            max_c2_error = max(max_c2_error, err)
            even = max(abs(exact_factor(float(x), float(psi), float(zeta)) - exact_factor(float(-x), float(psi), float(zeta))) for x in x_fit)
            max_even_error = max(max_even_error, even)
            fit_records.append({"psi": float(psi), "zeta": float(zeta), "fit_c2": float(coefs[2]), "analytic_c2": expected})

    # At each director orientation, the twist-rate null kills C2 if the untwisted C2 is negative.
    untwisted = np.asarray(analytic_c2(psi_grid, 0.0))
    zeta_null = np.sqrt(np.maximum(0.0, -2.0 * untwisted / moments["D"]))
    slopes = {}
    for psi in [0.0, np.pi / 4.0, np.pi / 2.0]:
        znull = float(np.sqrt(max(0.0, -2.0 * float(analytic_c2(psi, 0.0)) / moments["D"])))
        xs = np.geomspace(2e-4, 7e-3, 24)
        regular = np.abs(np.array([exact_factor(float(x), psi, 0.0) - 1.0 for x in xs]))
        xs_null = np.geomspace(3e-3, 6e-2, 24)
        nulled = np.abs(np.array([exact_factor(float(x), psi, znull) - 1.0 for x in xs_null]))
        slopes[f"psi={psi:.8f}"] = {
            "zeta_null": znull,
            "untwisted_slope": float(np.polyfit(np.log(xs), np.log(regular), 1)[0]),
            "null_slope": float(np.polyfit(np.log(xs_null), np.log(nulled), 1)[0]),
        }

    payload = {
        "model": {
            "lambda=b/a": LAM,
            "g": G,
            "q": Q,
            "zeta_definition": "zeta=R_h*(tau_h+dpsi/ds)",
            "normalization": "total axial torque per centerline length at fixed traction density",
        },
        "moments": moments,
        "analytic": {
            "alpha": 1.0 - G,
            "beta": G * G - 2.0 * G,
            "c2": "M_plus[beta+alpha(1+q)]/2 + M_minus[beta-alpha+3q alpha]cos(2psi)/2 + D zeta^2/2",
            "parity": "complete or antipodally paired contact is exactly even in signed x",
        },
        "verification": {
            "max_abs_c2_error": max_c2_error,
            "max_full_even_error": max_even_error,
            "small_x_slopes": slopes,
        },
        "psi_grid": psi_grid.tolist(),
        "zeta_null": zeta_null.tolist(),
        "fit_records": fit_records,
    }
    DATA.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    fig = plt.figure(figsize=(11.8, 7.8))
    gs = fig.add_gridspec(2, 2, hspace=0.30, wspace=0.28)
    ax0 = fig.add_subplot(gs[0, 0], projection="3d")
    tube, center = material_tube_mesh()
    for i in range(0, tube.shape[0], 7):
        ax0.plot(tube[i, :, 0], tube[i, :, 1], tube[i, :, 2], color="#66b3c9", lw=0.65, alpha=0.75)
    for j in range(0, tube.shape[1], 4):
        ax0.plot(tube[:, j, 0], tube[:, j, 1], tube[:, j, 2], color="#27758b", lw=0.55, alpha=0.60)
    ax0.plot(center[:, 0], center[:, 1], center[:, 2], color="#222222", lw=1.2)
    ax0.set_title("Elliptic core in an independent material frame")
    ax0.set_box_aspect((1, 1, 2.0))
    ax0.set_axis_off()

    ax1 = fig.add_subplot(gs[0, 1])
    ps, zs = np.meshgrid(psi_grid, zeta_grid)
    c2map = analytic_c2(ps, zs)
    im = ax1.pcolormesh(psi_grid / np.pi, zeta_grid, c2map, shading="auto", cmap="coolwarm", rasterized=True)
    ax1.contour(psi_grid / np.pi, zeta_grid, c2map, levels=[0], colors="k", linewidths=1.4)
    ax1.plot(psi_grid / np.pi, zeta_null, "k--", lw=1, label=r"$C_2=0$")
    ax1.set(xlabel=r"director angle $\psi/\pi$", ylabel=r"material twist $\zeta$", title=r"Quadratic coefficient $C_2(\psi,\zeta)$")
    ax1.legend(fontsize=8)
    fig.colorbar(im, ax=ax1, shrink=0.88)

    ax2 = fig.add_subplot(gs[1, 0])
    xs = np.geomspace(2e-4, 0.08, 60)
    for psi, color in zip([0.0, np.pi / 4.0, np.pi / 2.0], ["C0", "C1", "C2"]):
        znull = np.sqrt(max(0.0, -2.0 * float(analytic_c2(psi, 0.0)) / moments["D"]))
        y0 = np.abs(np.array([exact_factor(float(x), psi, 0.0) - 1.0 for x in xs]))
        yn = np.abs(np.array([exact_factor(float(x), psi, znull) - 1.0 for x in xs]))
        ax2.loglog(xs, y0, color=color, label=rf"$\psi={psi/np.pi:.2g}\pi$, $\zeta=0$")
        ax2.loglog(xs, yn, color=color, ls="--", label=rf"same $\psi$, $C_2=0$")
    ax2.set(xlabel=r"signed-scale magnitude $|x|=a/R_h$", ylabel=r"$|\mathcal{T}-1|$", title="Quadratic response and quartic masquerade")
    ax2.grid(alpha=0.25)
    ax2.legend(fontsize=7, ncol=2)

    ax3 = fig.add_subplot(gs[1, 1])
    for zeta, color in zip([0.0, 1.5, 2.5], ["C3", "C4", "C5"]):
        expected = np.asarray(analytic_c2(psi_grid, zeta))
        fitted = []
        for psi in psi_grid[::3]:
            vals = np.array([exact_factor(float(x), float(psi), zeta) - 1.0 for x in x_fit])
            fitted.append(np.polynomial.polynomial.polyfit(x_fit, vals, 4)[2])
        ax3.plot(psi_grid / np.pi, expected, color=color, label=rf"analytic $\zeta={zeta}$")
        ax3.plot(psi_grid[::3] / np.pi, fitted, ".", color=color, ms=3)
    ax3.axhline(0, color="0.2", lw=0.8)
    ax3.set(xlabel=r"director angle $\psi/\pi$", ylabel=r"$C_2$", title="Director harmonic: analytic lines, exact-fit points")
    ax3.grid(alpha=0.25)
    ax3.legend(fontsize=8)

    fig.suptitle("Elliptic material frame: head-tail symmetry preserves parity; twist moves the coefficient", fontsize=12)
    fig.savefig(FIGURE, format="svg", bbox_inches="tight")
    print(json.dumps(payload["verification"], indent=2))


if __name__ == "__main__":
    main()
