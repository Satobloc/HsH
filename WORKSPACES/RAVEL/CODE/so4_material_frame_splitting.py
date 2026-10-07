#!/usr/bin/env python3
"""Sandbox test of SO(4) material-frame mode splitting.

The script constructs the adjoint action of a constant pre-twist
A0 = a J12 + b J34 on so(4), verifies the expected root shifts, and
generates the periodic-loop resonance families.  It also performs a
small Monte Carlo inversion of the two conjugacy-class rates from the
paired resonance splittings.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


plt.rcParams["svg.fonttype"] = "none"


OUT_JSON = Path("so4_material_frame_splitting.json")
OUT_SVG = Path("so4_material_frame_splitting.svg")
OUT_PNG = Path("so4_material_frame_splitting.png")


def j(p: int, q: int) -> np.ndarray:
    m = np.zeros((4, 4))
    m[p, q] = 1.0
    m[q, p] = -1.0
    return m


BASIS = [j(0, 1), j(0, 2), j(0, 3), j(1, 2), j(1, 3), j(2, 3)]


def coords(x: np.ndarray) -> np.ndarray:
    # <A,B> = -Tr(AB)/2 makes the chosen generators orthonormal.
    return np.array([-0.5 * np.trace(b @ x) for b in BASIS])


def adjoint_matrix(a0: np.ndarray) -> np.ndarray:
    return np.column_stack([coords(a0 @ b - b @ a0) for b in BASIS])


def omega2(q: np.ndarray, shift: float, inertia: float, damping: float,
           stiffness: float, pinning: float) -> np.ndarray:
    return (
        pinning / inertia
        + stiffness / inertia * (q + shift) ** 2
        - damping**2 / (2.0 * inertia**2)
    )


def main() -> None:
    inertia = 0.1
    damping = 0.2
    stiffness = 0.06
    pinning = 0.25
    length = 1.2
    a = 0.85
    b = 0.30

    a0 = a * BASIS[0] + b * BASIS[5]
    ad = adjoint_matrix(a0)
    eig = np.linalg.eigvals(ad)
    adjoint_shifts = np.sort(np.round(np.imag(eig), 12))
    expected_shifts = np.sort(np.array([0.0, 0.0, -(a + b), a + b, -(a - b), a - b]))

    n = np.arange(0, 5)
    q = 2.0 * np.pi * n / length
    shifts = np.array([0.0, -(a - b), a - b, -(a + b), a + b])
    labels = ["Cartan (x2)", "-(a-b)", "+(a-b)", "-(a+b)", "+(a+b)"]
    families = {label: omega2(q, s, inertia, damping, stiffness, pinning)
                for label, s in zip(labels, shifts)}

    q1 = q[1]
    dminus = a - b
    dplus = a + b
    pair_data = {}
    for name, delta in [("difference_root", dminus), ("sum_root", dplus)]:
        lo = float(omega2(np.array([q1]), -delta, inertia, damping, stiffness, pinning)[0])
        hi = float(omega2(np.array([q1]), +delta, inertia, damping, stiffness, pinning)[0])
        recovered = inertia * (hi - lo) / (4.0 * stiffness * q1)
        pair_data[name] = {
            "delta_true": delta,
            "omega2_minus": lo,
            "omega2_plus": hi,
            "delta_recovered": recovered,
        }

    # Noise test: 0.2% independent Gaussian noise on each measured omega^2.
    rng = np.random.default_rng(20261007)
    draws = 5000
    recovered_ab = np.empty((draws, 2))
    rel_sigma = 0.002
    for i in range(draws):
        deltas = []
        for key in ("difference_root", "sum_root"):
            lo = pair_data[key]["omega2_minus"]
            hi = pair_data[key]["omega2_plus"]
            lo_n = lo + rng.normal(scale=rel_sigma * lo)
            hi_n = hi + rng.normal(scale=rel_sigma * hi)
            deltas.append(inertia * (hi_n - lo_n) / (4.0 * stiffness * q1))
        dm, dp = deltas
        recovered_ab[i] = ((dp + dm) / 2.0, (dp - dm) / 2.0)

    result = {
        "status": "GEN/CANDIDATE",
        "parameters": {
            "inertia": inertia,
            "damping": damping,
            "stiffness": stiffness,
            "pinning": pinning,
            "length": length,
            "a": a,
            "b": b,
            "relative_omega2_noise": rel_sigma,
            "monte_carlo_draws": draws,
        },
        "adjoint_shifts_numeric": adjoint_shifts.tolist(),
        "adjoint_shifts_expected": expected_shifts.tolist(),
        "adjoint_max_abs_error": float(np.max(np.abs(adjoint_shifts - expected_shifts))),
        "n1_q": q1,
        "paired_splittings": pair_data,
        "recovered_a_mean_std": [float(recovered_ab[:, 0].mean()), float(recovered_ab[:, 0].std(ddof=1))],
        "recovered_b_mean_std": [float(recovered_ab[:, 1].mean()), float(recovered_ab[:, 1].std(ddof=1))],
        "open_covariant_segment_prediction": "no pre-twist pole splitting for isotropic coefficients; D_s is gauge-equivalent to partial_s",
        "closed_loop_prediction": "holonomy-twisted boundary conditions split roots by 0, ±(a-b), ±(a+b), modulo 2π/L relabeling",
    }
    OUT_JSON.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")

    fig, axes = plt.subplots(1, 2, figsize=(10.5, 4.3))
    ax = axes[0]
    for label, s in zip(labels, shifts):
        ax.plot(q**2, families[label], marker="o", label=label)
    ax.set_xlabel(r"$q_n^2=(2\pi n/L)^2$")
    ax.set_ylabel(r"$\omega_{\mathrm{peak}}^2$")
    ax.set_title("Closed loop: holonomy-split families")
    ax.legend(fontsize=8, ncol=2)
    ax.grid(alpha=0.25)

    ax = axes[1]
    # Plot a deterministic 500-point subset so the SVG stays lightweight;
    # the statistics above still use all 5000 Monte Carlo draws.
    ax.scatter(recovered_ab[::10, 0], recovered_ab[::10, 1], s=5, alpha=0.18, color="#3b73b9")
    ax.axvline(a, color="black", lw=1)
    ax.axhline(b, color="black", lw=1)
    ax.set_xlabel("recovered a")
    ax.set_ylabel("recovered b")
    ax.set_title("0.2% noise inversion")
    ax.grid(alpha=0.25)
    fig.tight_layout()
    fig.savefig(OUT_SVG)
    fig.savefig(OUT_PNG, dpi=170)

    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
