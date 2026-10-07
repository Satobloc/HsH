#!/usr/bin/env python3
"""Finite-element test of pre-twist visibility in an anisotropic finite core.

The two-component sector is the real root plane of an SO(4) adjoint mode.
After gauging a constant material pre-twist out of the covariant derivative,
the constitutive tensor rotates along the segment.  This script compares the
resulting Neumann spectrum with the weak-anisotropy coherence formula.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import eigh


plt.rcParams["svg.fonttype"] = "none"

OUT_JSON = Path("anisotropic_pretwist_spectrum.json")
OUT_SVG = Path("anisotropic_pretwist_spectrum.svg")
OUT_PNG = Path("anisotropic_pretwist_spectrum.png")


def coherence(n: int, x: np.ndarray) -> np.ndarray:
    """Magnitude of the first-order anisotropy coherence factor."""
    x = np.asarray(x, dtype=float)
    out = np.empty_like(x)
    near_zero = np.isclose(x, 0.0, atol=1e-10)
    near_resonance = np.isclose(x, n * np.pi, atol=1e-8)
    regular = ~(near_zero | near_resonance)
    out[near_zero] = 1.0
    out[near_resonance] = 0.5
    out[regular] = np.abs(
        n**2 * np.pi**2 * np.sin(x[regular])
        / (x[regular] * (n**2 * np.pi**2 - x[regular] ** 2))
    )
    return out


def assemble(length: float, c0: float, eps: float, twist: float,
             elements: int) -> tuple[np.ndarray, np.ndarray]:
    """Assemble linear finite elements for -d_s(C_s d_s) with free ends."""
    nodes = elements + 1
    h = length / elements
    size = 2 * nodes
    stiffness = np.zeros((size, size))
    mass = np.zeros((size, size))
    local_mass = h / 6.0 * np.array([[2.0, 1.0], [1.0, 2.0]])

    for e in range(elements):
        s_mid = (e + 0.5) * h
        angle = twist * s_mid
        rot = np.array([
            [np.cos(angle), -np.sin(angle)],
            [np.sin(angle), np.cos(angle)],
        ])
        c_body = c0 * np.diag([1.0 + eps, 1.0 - eps])
        c_space = rot @ c_body @ rot.T
        scalar_k = np.array([[1.0, -1.0], [-1.0, 1.0]]) / h
        for a in range(2):
            for b in range(2):
                block = c_space * scalar_k[a, b]
                ia = slice(2 * (e + a), 2 * (e + a) + 2)
                ib = slice(2 * (e + b), 2 * (e + b) + 2)
                stiffness[ia, ib] += block
                mass[ia, ib] += np.eye(2) * local_mass[a, b]
    return stiffness, mass


def first_pair(length: float, c0: float, eps: float, x: float,
               elements: int) -> tuple[float, float]:
    stiffness, mass = assemble(length, c0, eps, x / length, elements)
    vals = eigh(stiffness, mass, eigvals_only=True, subset_by_index=[0, 7])
    vals[np.abs(vals) < 1e-10] = 0.0
    positive = vals[vals > 1e-8]
    return float(positive[0]), float(positive[1])


def main() -> None:
    length = 1.2
    c0 = 0.06
    eps = 0.02
    elements = 180
    n = 1
    q = n * np.pi / length
    baseline = c0 * q**2

    x_scan = np.linspace(0.0, 4.0 * np.pi, 81)
    pairs = np.array([
        first_pair(length, c0, eps, x, elements) for x in x_scan
    ])
    split_fem = (pairs[:, 1] - pairs[:, 0]) / (2.0 * baseline * eps)
    split_weak = coherence(n, x_scan)

    isotropic_checks = []
    for x in (0.0, 0.7 * np.pi, 2.0 * np.pi, 3.4 * np.pi):
        lo, hi = first_pair(length, c0, 0.0, x, elements)
        isotropic_checks.append(hi - lo)

    checkpoints = np.array([0.0, np.pi, 2.0 * np.pi, 3.0 * np.pi])
    checkpoint_rows = []
    for x in checkpoints:
        lo, hi = first_pair(length, c0, eps, x, elements)
        pred = float(coherence(n, np.array([x]))[0])
        measured = (hi - lo) / (2.0 * baseline * eps)
        checkpoint_rows.append({
            "twist_total_x": float(x),
            "x_over_pi": float(x / np.pi),
            "lambda_low": lo,
            "lambda_high": hi,
            "normalized_split_fem": measured,
            "normalized_split_first_order": pred,
        })

    # Verify the expected linear-in-epsilon remainder at the first magic twist.
    eps_scan = np.array([0.04, 0.02, 0.01, 0.005])
    magic_residual = []
    for e in eps_scan:
        lo, hi = first_pair(length, c0, e, 2.0 * np.pi, elements)
        magic_residual.append((hi - lo) / (2.0 * baseline * e))
    magic_residual = np.array(magic_residual)
    magic_residual_power = float(
        np.polyfit(np.log(eps_scan), np.log(magic_residual), 1)[0]
    )

    result = {
        "status": "GEN/CANDIDATE",
        "parameters": {
            "length": length,
            "c0": c0,
            "anisotropy_epsilon": eps,
            "elements": elements,
            "mode_n": n,
            "q_n": q,
            "isotropic_mode_stiffness": baseline,
        },
        "coherence_formula": "|n^2*pi^2*sin(x)/(x*(n^2*pi^2-x^2))| with limits F(0)=1 and F(n*pi)=1/2",
        "checkpoints": checkpoint_rows,
        "max_abs_normalized_error_scan": float(np.max(np.abs(split_fem - split_weak))),
        "max_isotropic_pair_split": float(np.max(np.abs(isotropic_checks))),
        "magic_twist_epsilon_scan": [
            {"epsilon": float(e), "normalized_residual": float(r)}
            for e, r in zip(eps_scan, magic_residual)
        ],
        "magic_twist_normalized_residual_power": magic_residual_power,
        "null_prediction": "isotropic constitutive tensor epsilon=0 makes uniform open-segment pre-twist gauge-removable",
        "anisotropic_prediction": "weak anisotropy exposes pre-twist through mode splitting weighted by the coherence factor",
    }
    OUT_JSON.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")

    fig, axes = plt.subplots(1, 2, figsize=(10.5, 4.2))
    axes[0].plot(x_scan / np.pi, split_weak, color="black", lw=2,
                 label="first-order coherence")
    axes[0].plot(x_scan / np.pi, split_fem, "o", ms=3.2, alpha=0.75,
                 label="finite elements")
    axes[0].set_xlabel(r"total pre-twist $x=\delta L$ (units of $\pi$)")
    axes[0].set_ylabel("normalized first-mode splitting")
    axes[0].set_title("Anisotropy exposes otherwise removable pre-twist")
    axes[0].grid(alpha=0.25)
    axes[0].legend(fontsize=8)

    axes[1].loglog(eps_scan, magic_residual, "o-", color="#3b73b9")
    axes[1].set_xlabel(r"anisotropy $\epsilon$")
    axes[1].set_ylabel(r"residual normalized split at $x=2\pi$")
    axes[1].set_title(
        rf"Magic-twist residue $\propto\epsilon^{{{magic_residual_power:.2f}}}$"
    )
    axes[1].grid(alpha=0.25, which="both")
    fig.tight_layout()
    fig.savefig(OUT_SVG)
    fig.savefig(OUT_PNG, dpi=170)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
