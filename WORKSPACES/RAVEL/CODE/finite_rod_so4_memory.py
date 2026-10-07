#!/usr/bin/env python3
"""Finite torsional-worldtube spectrum coupled to an SO(4) order test."""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import expm, logm


ROOT = Path(__file__).resolve().parent
OUT_JSON = ROOT / "finite_rod_so4_memory.json"
OUT_SVG = ROOT / "finite_rod_so4_memory.svg"
OUT_PNG = ROOT / "finite_rod_so4_memory.png"


def generator(i: int, j: int) -> np.ndarray:
    g = np.zeros((4, 4))
    g[i, j] = 1.0
    g[j, i] = -1.0
    return g


J01 = generator(0, 1)
J02 = generator(0, 2)
E0 = np.array([1.0, 0.0, 0.0, 0.0])


def rotation_angle(m: np.ndarray) -> float:
    """Frobenius-normalized Lie-algebra angle for an SO(4) matrix."""
    a = np.real_if_close(logm(m)).real
    return float(np.linalg.norm(a, "fro") / np.sqrt(2.0))


def minimal_rotation(a: np.ndarray, b: np.ndarray) -> np.ndarray:
    """Shortest SO(n) rotation taking unit a to unit b."""
    a = a / np.linalg.norm(a)
    b = b / np.linalg.norm(b)
    c = float(np.clip(a @ b, -1.0, 1.0))
    if c > 1.0 - 1e-14:
        return np.eye(len(a))
    v = b - c * a
    s = np.linalg.norm(v)
    u = v / s
    k = np.outer(u, a) - np.outer(a, u)
    return np.eye(len(a)) + s * k + (1.0 - c) * (k @ k)


def ordered_residue(epsilon: float, retention: float) -> np.ndarray:
    """Compare AB and BA after matching their transported time normals."""
    a = expm(epsilon * J01)
    b = expm(epsilon * J02)
    f_ab = b @ expm(retention * epsilon * J01)
    f_ba = a @ expm(retention * epsilon * J02)
    correction = minimal_rotation(f_ba @ E0, f_ab @ E0)
    return (correction @ f_ba) @ f_ab.T


def exact_baseline_subtracted_angle(epsilon: float, retention: float) -> float:
    """Ordered-kick mismatch with the fully forgotten (r=0) mismatch removed."""
    rel = ordered_residue(epsilon, retention)
    rel0 = ordered_residue(epsilon, 0.0)
    return rotation_angle(rel @ rel0.T)


def rod_spectrum(
    length: float,
    stiffness: float,
    pinning: float,
    drag: float,
    n_modes: int,
    location_fraction: float,
    width_fraction: float,
) -> tuple[np.ndarray, np.ndarray]:
    """Neumann torsion modes, collocated localized actuation and resolution."""
    n = np.arange(n_modes, dtype=float)
    q = np.pi * n / length
    s0 = location_fraction * length
    sigma = width_fraction * length

    phi2 = np.empty_like(n)
    phi2[0] = 1.0 / length
    phi2[1:] = (2.0 / length) * np.cos(q[1:] * s0) ** 2
    raw_weights = phi2 * np.exp(-(q * sigma) ** 2)
    weights = raw_weights / raw_weights.sum()
    rates = (pinning + stiffness * q**2) / drag
    return weights, rates


def kernel(times: np.ndarray, weights: np.ndarray, rates: np.ndarray) -> np.ndarray:
    return np.exp(-np.outer(times, rates)) @ weights


def effective_rate(times: np.ndarray, weights: np.ndarray, rates: np.ndarray) -> np.ndarray:
    decays = np.exp(-np.outer(times, rates))
    return (decays @ (weights * rates)) / (decays @ weights)


def fit_single_rate(times: np.ndarray, r: np.ndarray, lo: float, hi: float) -> float:
    mask = (times >= lo) & (times <= hi) & (r > 0)
    # Fit through r(0)=1: minimize ||log r + lambda t||^2.
    return float(-np.dot(times[mask], np.log(r[mask])) / np.dot(times[mask], times[mask]))


def main() -> None:
    parameters = {
        "torsional_stiffness_C": 0.060,
        "local_pinning_K": 0.250,
        "drag_gamma": 1.0,
        "n_modes": 80,
        "actuation_location_fraction": 0.31,
        "resolver_width_fraction": 0.070,
        "lengths": [1.0, 1.6],
        "epsilon": 0.08,
    }
    t = np.linspace(0.0, 12.0, 481)
    epsilon = parameters["epsilon"]
    records: dict[str, dict] = {}

    fig, axes = plt.subplots(1, 3, figsize=(13.2, 4.1))
    colors = ["#3264a8", "#d05a3a"]

    for length, color in zip(parameters["lengths"], colors):
        w, lam = rod_spectrum(
            length,
            parameters["torsional_stiffness_C"],
            parameters["local_pinning_K"],
            parameters["drag_gamma"],
            parameters["n_modes"],
            parameters["actuation_location_fraction"],
            parameters["resolver_width_fraction"],
        )
        r = kernel(t, w, lam)
        memory = 2.0 * r - r**2
        lam_eff = effective_rate(t, w, lam)
        fit_rate = fit_single_rate(t, r, 0.35, 8.0)
        r_fit = np.exp(-fit_rate * t)
        memory_fit = 2.0 * r_fit - r_fit**2

        exact = np.array([exact_baseline_subtracted_angle(epsilon, x) for x in r])
        exact_norm = exact / exact[0]
        max_exact_error = float(np.max(np.abs(exact_norm - memory)))
        rms_single_residual = float(np.sqrt(np.mean((memory - memory_fit) ** 2)))

        key = f"L={length:g}"
        top = np.argsort(w)[::-1][:8]
        records[key] = {
            "lowest_rate": float(lam[0]),
            "initial_effective_rate": float(lam_eff[0]),
            "effective_rate_t1": float(np.interp(1.0, t, lam_eff)),
            "effective_rate_t4": float(np.interp(4.0, t, lam_eff)),
            "fitted_single_rate_window_0.35_8": fit_rate,
            "rms_single_memory_residual": rms_single_residual,
            "max_abs_exact_SO4_vs_quadratic_memory": max_exact_error,
            "top_modes": [
                {"n": int(i), "weight": float(w[i]), "rate": float(lam[i])}
                for i in top
            ],
            "samples": [
                {
                    "time": float(ts),
                    "retained_kernel_r": float(np.interp(ts, t, r)),
                    "normalized_memory_M": float(np.interp(ts, t, memory)),
                    "effective_rate": float(np.interp(ts, t, lam_eff)),
                }
                for ts in [0.0, 0.5, 1.0, 2.0, 4.0, 8.0, 12.0]
            ],
        }

        label = rf"$L={length:g}$"
        axes[0].plot(t, memory, color=color, lw=2.2, label=label + " rod")
        axes[0].plot(t, memory_fit, color=color, lw=1.2, ls="--", alpha=0.75,
                     label=label + " 1-mode fit")
        axes[1].semilogy(t, r, color=color, lw=2.2, label=label)
        axes[2].plot(t, lam_eff, color=color, lw=2.2, label=label)

    axes[0].set_title("Ordered-frame memory")
    axes[0].set_xlabel(r"delay $\Delta$")
    axes[0].set_ylabel(r"$M=2r-r^2$")
    axes[0].set_ylim(-0.02, 1.03)
    axes[0].legend(fontsize=8, frameon=False)

    axes[1].set_title("Recovered constitutive kernel")
    axes[1].set_xlabel(r"delay $\Delta$")
    axes[1].set_ylabel(r"$r_{\rm obs}=1-\sqrt{1-M}$")
    axes[1].legend(fontsize=8, frameon=False)
    axes[1].grid(axis="y", which="both", alpha=0.22)

    axes[2].axhline(
        parameters["local_pinning_K"] / parameters["drag_gamma"],
        color="#555555", lw=1.1, ls=":", label=r"$K/\gamma$"
    )
    axes[2].set_title("Spectral-rate drift")
    axes[2].set_xlabel(r"delay $\Delta$")
    axes[2].set_ylabel(r"$-d\ln r/d\Delta$")
    axes[2].legend(fontsize=8, frameon=False)

    for ax in axes:
        ax.spines[["top", "right"]].set_visible(False)
        ax.grid(alpha=0.16)

    fig.suptitle("Finite torsional core: a mode spectrum replaces an imposed relaxation time", y=1.02)
    fig.tight_layout()
    fig.savefig(OUT_SVG, bbox_inches="tight")
    fig.savefig(OUT_PNG, dpi=190, bbox_inches="tight")
    plt.close(fig)

    payload = {
        "model": {
            "pde": "gamma*d_t X = C*d_s^2 X - K*X + T(s,t)",
            "boundary_condition": "Neumann/free ends",
            "rates": "lambda_n=(K+C*(n*pi/L)^2)/gamma",
            "kernel": "r(Delta)=sum_n w_n exp(-lambda_n Delta)",
            "memory_law": "M(Delta)=2*r-r^2 (quadratic SO(4) limit)",
        },
        "parameters": parameters,
        "results": records,
    }
    OUT_JSON.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    print(json.dumps(payload, indent=2))
    print(f"wrote {OUT_JSON.name}, {OUT_SVG.name}, {OUT_PNG.name}")


if __name__ == "__main__":
    main()
