#!/usr/bin/env python3
"""Inertial finite-core torsion and signed SO(4) order-memory discriminator."""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import expm, logm
from scipy.optimize import brentq


ROOT = Path(__file__).resolve().parent
OUT_JSON = ROOT / "inertial_torsion_resonance.json"
OUT_SVG = ROOT / "inertial_torsion_resonance.svg"
OUT_PNG = ROOT / "inertial_torsion_resonance.png"


def generator(i: int, j: int) -> np.ndarray:
    g = np.zeros((4, 4))
    g[i, j] = 1.0
    g[j, i] = -1.0
    return g


J01 = generator(0, 1)
J02 = generator(0, 2)
J12 = generator(1, 2)
E0 = np.array([1.0, 0.0, 0.0, 0.0])


def minimal_rotation(a: np.ndarray, b: np.ndarray) -> np.ndarray:
    a = a / np.linalg.norm(a)
    b = b / np.linalg.norm(b)
    c = float(np.clip(a @ b, -1.0, 1.0))
    if c > 1.0 - 1e-14:
        return np.eye(len(a))
    v = b - c * a
    s = np.linalg.norm(v)
    u = v / s
    skew = np.outer(u, a) - np.outer(a, u)
    return np.eye(len(a)) + s * skew + (1.0 - c) * (skew @ skew)


def ordered_residue(epsilon: float, retention: float) -> np.ndarray:
    a = expm(epsilon * J01)
    b = expm(epsilon * J02)
    f_ab = b @ expm(retention * epsilon * J01)
    f_ba = a @ expm(retention * epsilon * J02)
    correction = minimal_rotation(f_ba @ E0, f_ab @ E0)
    return (correction @ f_ba) @ f_ab.T


def signed_order_memory(epsilon: float, retention: float) -> float:
    """Signed J12 coefficient after endpoint-normal matching and r=0 subtraction."""
    residue = ordered_residue(epsilon, retention) @ ordered_residue(epsilon, 0.0).T
    algebra = np.real_if_close(logm(residue)).real
    algebra = 0.5 * (algebra - algebra.T)
    return float(0.5 * np.sum(algebra * J12))


def spectrum(length: float, n_modes: int, s0_fraction: float, width_fraction: float,
             stiffness: float, pinning: float) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    n = np.arange(n_modes, dtype=float)
    q = np.pi * n / length
    s0 = s0_fraction * length
    sigma = width_fraction * length
    phi2 = np.empty_like(n)
    phi2[0] = 1.0 / length
    phi2[1:] = 2.0 / length * np.cos(q[1:] * s0) ** 2
    raw = phi2 * np.exp(-(q * sigma) ** 2)
    weights = raw / raw.sum()
    modal_stiffness = pinning + stiffness * q**2
    return q, weights, modal_stiffness


def displacement_response(t: np.ndarray, modal_stiffness: np.ndarray,
                          inertia: float, drag: float) -> np.ndarray:
    """Free response for unit initial displacement and zero initial velocity."""
    alpha = drag / (2.0 * inertia)
    out = np.empty((len(t), len(modal_stiffness)))
    for j, k_n in enumerate(modal_stiffness):
        discriminant = k_n / inertia - alpha**2
        if discriminant > 1e-13:
            omega = np.sqrt(discriminant)
            out[:, j] = np.exp(-alpha * t) * (
                np.cos(omega * t) + alpha / omega * np.sin(omega * t)
            )
        elif discriminant < -1e-13:
            beta = np.sqrt(-discriminant)
            out[:, j] = np.exp(-alpha * t) * (
                np.cosh(beta * t) + alpha / beta * np.sinh(beta * t)
            )
        else:
            out[:, j] = np.exp(-alpha * t) * (1.0 + alpha * t)
    return out


def first_zero(t: np.ndarray, y: np.ndarray) -> float:
    idx = np.flatnonzero(np.signbit(y[1:]) != np.signbit(y[:-1]))
    if not len(idx):
        return float("nan")
    i = int(idx[0])
    return float(brentq(lambda x: np.interp(x, t, y), t[i], t[i + 1]))


def main() -> None:
    p = {
        "torsional_inertia_I": 0.100,
        "drag_gamma": 0.200,
        "torsional_stiffness_C": 0.060,
        "local_pinning_K": 0.250,
        "n_modes": 80,
        "actuation_location_fraction": 0.31,
        "resolver_width_fraction": 0.070,
        "lengths": [1.0, 1.6],
        "epsilon": 0.04,
    }
    times = np.linspace(0.0, 8.0, 801)
    colors = ["#3264a8", "#d05a3a"]
    results: dict[str, dict] = {}

    fig, axes = plt.subplots(1, 3, figsize=(13.4, 4.15))
    all_q2: list[float] = []
    all_peak2: list[float] = []

    for length, color in zip(p["lengths"], colors):
        q, weights, k_n = spectrum(
            length, p["n_modes"], p["actuation_location_fraction"],
            p["resolver_width_fraction"], p["torsional_stiffness_C"],
            p["local_pinning_K"]
        )
        modes = displacement_response(times, k_n, p["torsional_inertia_I"], p["drag_gamma"])
        retained = modes @ weights
        reduced_memory = 2.0 * retained - retained**2

        exact = np.array([signed_order_memory(p["epsilon"], r) for r in retained])
        exact_normalized = exact / exact[0]
        max_error = float(np.max(np.abs(exact_normalized - reduced_memory)))
        zero_r = first_zero(times, retained)
        zero_m = first_zero(times, exact_normalized)

        alpha = p["drag_gamma"] / (2.0 * p["torsional_inertia_I"])
        damped_frequency = np.sqrt(np.maximum(k_n / p["torsional_inertia_I"] - alpha**2, 0.0))
        damping_ratio = p["drag_gamma"] / (2.0 * np.sqrt(p["torsional_inertia_I"] * k_n))
        peak2 = k_n / p["torsional_inertia_I"] - p["drag_gamma"]**2 / (
            2.0 * p["torsional_inertia_I"]**2
        )
        driven_mask = peak2 > 0

        key = f"L={length:g}"
        top = np.argsort(weights)[::-1][:8]
        results[key] = {
            "first_kernel_zero": zero_r,
            "first_signed_SO4_memory_zero": zero_m,
            "minimum_kernel": float(retained.min()),
            "minimum_signed_memory": float(exact_normalized.min()),
            "max_abs_exact_SO4_vs_reduced_memory": max_error,
            "top_modes": [
                {
                    "n": int(i), "weight": float(weights[i]), "q_squared": float(q[i] ** 2),
                    "damping_ratio": float(damping_ratio[i]),
                    "damped_frequency": float(damped_frequency[i]),
                    "driven_peak_frequency": float(np.sqrt(max(peak2[i], 0.0))),
                }
                for i in top
            ],
        }

        label = rf"$L={length:g}$"
        axes[0].plot(times, retained, color=color, lw=2.2, label=label)
        axes[0].axvline(zero_r, color=color, lw=1.0, ls=":", alpha=0.8)
        axes[1].plot(times, exact_normalized, color=color, lw=2.2, label=label + " exact")
        axes[1].plot(times, reduced_memory, color=color, lw=1.1, ls="--", alpha=0.8,
                     label=label + " reduced")

        show = driven_mask & (np.arange(len(q)) <= 8)
        axes[2].scatter(q[show] ** 2, peak2[show], color=color, s=34, label=label)
        all_q2.extend((q[show] ** 2).tolist())
        all_peak2.extend(peak2[show].tolist())

    q2_line = np.linspace(0.0, max(all_q2) * 1.03, 300)
    expected_intercept = p["local_pinning_K"] / p["torsional_inertia_I"] - p["drag_gamma"]**2 / (
        2.0 * p["torsional_inertia_I"]**2
    )
    expected_slope = p["torsional_stiffness_C"] / p["torsional_inertia_I"]
    axes[2].plot(q2_line, expected_intercept + expected_slope * q2_line,
                 color="#333333", lw=1.3, ls="--", label="shared dispersion")
    fit_slope, fit_intercept = np.polyfit(np.asarray(all_q2), np.asarray(all_peak2), 1)

    axes[0].axhline(0.0, color="#555555", lw=0.9)
    axes[0].set_title("Constitutive memory kernel")
    axes[0].set_xlabel(r"delay $\Delta$")
    axes[0].set_ylabel(r"retained twist $r(\Delta)$")
    axes[0].legend(frameon=False, fontsize=8)

    axes[1].axhline(0.0, color="#555555", lw=0.9)
    axes[1].set_title("Signed SO(4) order residue")
    axes[1].set_xlabel(r"delay $\Delta$")
    axes[1].set_ylabel(r"normalized $J_{12}$ residue")
    axes[1].legend(frameon=False, fontsize=7.5, ncol=2)

    axes[2].set_title("Driven-resonance collapse")
    axes[2].set_xlabel(r"$q_n^2=(n\pi/L)^2$")
    axes[2].set_ylabel(r"$\omega_{\rm peak,n}^2$")
    axes[2].legend(frameon=False, fontsize=8)

    for ax in axes:
        ax.spines[["top", "right"]].set_visible(False)
        ax.grid(alpha=0.18)
    fig.suptitle("Finite-core inertia: sign reversal and a length-scaled torsional ladder", y=1.02)
    fig.tight_layout()
    fig.savefig(OUT_SVG, bbox_inches="tight")
    fig.savefig(OUT_PNG, dpi=190, bbox_inches="tight")
    plt.close(fig)

    payload = {
        "status": "GEN/CANDIDATE",
        "model": {
            "pde": "I*d_tt X + gamma*d_t X = C*d_ss X - K*X + T(s,t)",
            "modal_stiffness": "k_n=K+C*(n*pi/L)^2",
            "free_poles": "s_n^pm=(-gamma +/- sqrt(gamma^2-4*I*k_n))/(2*I)",
            "driven_peak_dispersion": "omega_peak,n^2=K/I+(C/I)*(n*pi/L)^2-gamma^2/(2*I^2)",
            "signed_memory": "M_signed=2*r-r^2+O(epsilon)",
        },
        "parameters": p,
        "dispersion_fit": {
            "fitted_slope": float(fit_slope),
            "expected_slope_C_over_I": float(expected_slope),
            "fitted_intercept": float(fit_intercept),
            "expected_intercept": float(expected_intercept),
        },
        "results": results,
    }
    OUT_JSON.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(payload, indent=2))
    print(f"wrote {OUT_JSON.name}, {OUT_SVG.name}, {OUT_PNG.name}")


if __name__ == "__main__":
    main()
