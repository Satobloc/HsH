#!/usr/bin/env python3
"""Exact quadrature test for transported helical-tube torque parity."""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "DATA" / "transported_helical_tube_torque.json"
FIGURE = ROOT / "FIGURES" / "transported_helical_tube_torque.svg"

G = 1.3  # arbitrary logarithmic traction-gradient magnitude at rho=R_h
Q_SHOW = np.array([0.05, 0.30, 0.60, 1.00])


def exact_factor(x: float, q: float, domain: str, nphi: int = 20_001) -> float:
    """Return area-weighted axial torque divided by the centerline value.

    f(rho)/f(R_h) = exp[-G(rho/R_h - 1)].  The helical tube's exact
    surface Jacobian contributes (1-q*x*cos(phi)).
    """
    if domain == "full":
        phi = np.linspace(-np.pi, np.pi, nphi, endpoint=False)
        norm = 2.0 * np.pi
    elif domain == "inward_half":
        phi = np.linspace(-0.5 * np.pi, 0.5 * np.pi, nphi)
        norm = np.pi
    else:
        raise ValueError(domain)

    c, s = np.cos(phi), np.sin(phi)
    rho = np.sqrt((1.0 - x * c) ** 2 + (1.0 - q) * x * x * s * s)
    integrand = (1.0 - q * x * c) * rho * np.exp(-G * (rho - 1.0))
    if domain == "full":
        return float(integrand.mean())
    return float(np.trapezoid(integrand, phi) / norm)


def c2_analytic(q: np.ndarray | float) -> np.ndarray | float:
    u, v = -G, G * G
    return (v + 1.0 + q + u * (3.0 + q)) / 4.0


def c1_analytic(q: np.ndarray | float) -> np.ndarray | float:
    u = -G
    return -(2.0 / np.pi) * (q + 1.0 + u)


def main() -> None:
    x_curve = np.geomspace(2e-4, 0.22, 54)
    x_fit = np.linspace(-0.015, 0.015, 31)
    q_fit = np.linspace(0.0, 1.0, 41)

    curves = {}
    for q in Q_SHOW:
        curves[str(q)] = {
            "x": x_curve.tolist(),
            "full": [exact_factor(float(x), float(q), "full") for x in x_curve],
            "inward_half": [exact_factor(float(x), float(q), "inward_half") for x in x_curve],
        }

    fitted_c2, fitted_c1, even_error = [], [], []
    for q in q_fit:
        yf = np.array([exact_factor(float(x), float(q), "full") - 1.0 for x in x_fit])
        yh = np.array([exact_factor(float(x), float(q), "inward_half") - 1.0 for x in x_fit])
        pf = np.polynomial.polynomial.polyfit(x_fit, yf, 4)
        ph = np.polynomial.polynomial.polyfit(x_fit, yh, 4)
        fitted_c2.append(float(pf[2]))
        fitted_c1.append(float(ph[1]))
        errs = [abs(exact_factor(float(x), float(q), "full") - exact_factor(float(-x), float(q), "full")) for x in x_fit]
        even_error.append(float(max(errs)))

    fitted_c2 = np.asarray(fitted_c2)
    fitted_c1 = np.asarray(fitted_c1)
    c2_expected = np.asarray(c2_analytic(q_fit))
    c1_expected = np.asarray(c1_analytic(q_fit))

    # Independent local log-log slope estimates for the displayed pitches.
    slopes = {}
    for q in Q_SHOW:
        xs = np.geomspace(2e-4, 4e-3, 20)
        df = np.abs(np.array([exact_factor(float(x), float(q), "full") - 1.0 for x in xs]))
        dh = np.abs(np.array([exact_factor(float(x), float(q), "inward_half") - 1.0 for x in xs]))
        slopes[str(q)] = {
            "full": float(np.polyfit(np.log(xs), np.log(df), 1)[0]),
            "inward_half": float(np.polyfit(np.log(xs), np.log(dh), 1)[0]),
        }

    payload = {
        "model": {
            "traction_profile": "f(rho)/f(R_h)=exp[-g(rho/R_h-1)]",
            "g": G,
            "q_definition": "q=R_h^2/(R_h^2+p_h^2)",
            "x_definition": "x=a_c/R_h",
            "surface_jacobian": "a_c(1-q*x*cos(phi))",
        },
        "analytic": {
            "full_c2": "[v+1+q+u(3+q)]/4 with u=-g, v=g^2",
            "inward_half_c1": "-(2/pi)(q+1+u)",
            "pitch_null_q": G - 1.0,
        },
        "verification": {
            "max_abs_c2_error": float(np.max(np.abs(fitted_c2 - c2_expected))),
            "max_abs_c1_error": float(np.max(np.abs(fitted_c1 - c1_expected))),
            "max_full_even_error": float(np.max(even_error)),
            "small_x_log_slopes": slopes,
        },
        "q_grid": q_fit.tolist(),
        "fitted_full_c2": fitted_c2.tolist(),
        "analytic_full_c2": c2_expected.tolist(),
        "fitted_half_c1": fitted_c1.tolist(),
        "analytic_half_c1": c1_expected.tolist(),
        "curves": curves,
    }
    DATA.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    plt.rcParams.update({"font.size": 9, "axes.grid": True, "grid.alpha": 0.22})
    fig, axes = plt.subplots(1, 3, figsize=(12.4, 3.8))
    colors = plt.cm.viridis(np.linspace(0.08, 0.92, len(Q_SHOW)))

    for q, color in zip(Q_SHOW, colors):
        xs = np.asarray(curves[str(q)]["x"])
        full = np.asarray(curves[str(q)]["full"])
        half = np.asarray(curves[str(q)]["inward_half"])
        axes[0].loglog(xs, np.abs(full - 1.0), color=color, label=f"q={q:.2f}")
        axes[1].plot(xs, half - 1.0, color=color, label=f"q={q:.2f}")

    refx = np.array([4e-4, 3e-3])
    axes[0].loglog(refx, 0.34 * refx**2, "k--", lw=1, label=r"$\propto x^2$")
    axes[0].set(xlabel=r"core ratio $x=a_c/R_h$", ylabel=r"$|\mathcal{T}_{full}-1|$", title="Complete circumference: even parity")
    axes[0].legend(fontsize=7)

    axes[1].axhline(0, color="0.25", lw=0.8)
    axes[1].set(xlabel=r"core ratio $x=a_c/R_h$", ylabel=r"$\mathcal{T}_{half}-1$", title="Inward half: linear, pitch-sensitive")
    axes[1].legend(fontsize=7)

    axes[2].plot(q_fit, c2_expected, "C0-", label=r"analytic $C_2$ (full)")
    axes[2].plot(q_fit, fitted_c2, "C0.", ms=3, label=r"quadrature fit $C_2$")
    axes[2].plot(q_fit, c1_expected, "C3-", label=r"analytic $C_1$ (half)")
    axes[2].plot(q_fit, fitted_c1, "C3.", ms=3, label=r"quadrature fit $C_1$")
    axes[2].axvline(G - 1.0, color="0.2", ls="--", lw=1, label=r"half-mask null $q=g-1$")
    axes[2].axhline(0, color="0.25", lw=0.8)
    axes[2].set(xlabel=r"pitch parameter $q=R_h^2/(R_h^2+p_h^2)$", ylabel="coefficient", title="Analytic coefficients vs exact quadrature")
    axes[2].legend(fontsize=7)

    fig.suptitle("Transported helical tube torque: geometry changes coefficients, not the parity test", y=1.02, fontsize=11)
    fig.tight_layout()
    fig.savefig(FIGURE, format="svg", bbox_inches="tight")

    print(json.dumps(payload["verification"], indent=2))


if __name__ == "__main__":
    main()
