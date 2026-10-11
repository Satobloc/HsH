#!/usr/bin/env python3
"""Boundary-condition and unloading gate for a fourth-order contact field.

Namespace: LOCAL:RAVEL-BCNL
Status: GEN/CANDIDATE synthetic mechanics; not SAT/H(s)H evidence.

The linearized field is

    eta h_tau = -D4 h_ssss - A0 h + f,

on a unit interval or unit circle.  Exact Euler-Bernoulli spectra are used
to test whether one slow contact coordinate is separated from the rest by
a predeclared factor of ten.  A one-mode unloading minimal pair then shows
that spectral closure and persistent memory are distinct requirements.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.integrate import solve_ivp
from scipy.optimize import brentq


NS = "LOCAL:RAVEL-BCNL"
A0 = 1.0
ETA = 1.0
GAP_GATE = 10.0


def roots_characteristic(sign: int, count: int) -> np.ndarray:
    """Roots of cos(beta) cosh(beta) = sign, excluding beta=0."""
    f = lambda x: np.cos(x) * np.cosh(x) - sign
    roots = []
    grid = np.linspace(1.0e-6, (count + 3) * np.pi, 20000)
    vals = f(grid)
    for left, right, vl, vr in zip(grid[:-1], grid[1:], vals[:-1], vals[1:]):
        if vl * vr < 0:
            root = brentq(f, left, right)
            if not roots or abs(root - roots[-1]) > 1.0e-6:
                roots.append(root)
                if len(roots) == count:
                    break
    return np.array(roots)


BETAS = {
    "periodic_closed_rim": np.array([0.0, 2.0 * np.pi]),
    "hinged_open_patch": np.array([np.pi, 2.0 * np.pi]),
    "clamped_open_patch": roots_characteristic(+1, 2),
    "cantilever_patch": roots_characteristic(-1, 2),
    # Free-free has two affine zero-curvature modes before its first flexural mode.
    "free_open_patch": np.array([0.0, 0.0]),
}


def gap_ratio(name: str, d4: np.ndarray | float) -> np.ndarray:
    b1, b2 = BETAS[name]
    return (A0 + np.asarray(d4) * b2**4) / (A0 + np.asarray(d4) * b1**4)


def threshold(name: str) -> float | None:
    b1, b2 = BETAS[name]
    denom = b2**4 - GAP_GATE * b1**4
    if denom <= 0:
        return None
    return (GAP_GATE - 1.0) * A0 / denom


def convex_rhs(t: float, y: np.ndarray) -> np.ndarray:
    # Hinged first-mode fixture at d4=0.02.  phi=sqrt(2)sin(pi s), int phi^4=3/2.
    d4 = 0.02
    lam1 = A0 + d4 * np.pi**4
    quartic = 2.0 * 1.5
    force = 5.0 if 1.0 <= t <= 4.0 else 0.0
    return np.array([force - lam1 * y[0] - quartic * y[0] ** 3])


def bistable_rhs(t: float, y: np.ndarray) -> np.ndarray:
    # Comparison architecture: explicit non-convex local storage.
    g = 4.0
    a0 = 1.0
    force = 2.0 if 1.0 <= t <= 4.0 else 0.0
    return np.array([force - g * y[0] * (y[0] ** 2 - a0**2)])


def integrate(rhs, y0: float):
    t_eval = np.linspace(0.0, 15.0, 3001)
    sol = solve_ivp(rhs, (0.0, 15.0), [y0], t_eval=t_eval,
                    method="DOP853", rtol=1.0e-11, atol=1.0e-13,
                    max_step=0.01)
    if not sol.success:
        raise RuntimeError(sol.message)
    return sol.t, sol.y[0]


def main() -> None:
    outdir = Path(__file__).resolve().parent
    dvals = np.logspace(-4, 1, 600)

    table = []
    for name, beta in BETAS.items():
        lim = np.inf if beta[0] == 0 and beta[1] > 0 else (
            1.0 if beta[0] == beta[1] == 0 else (beta[1] / beta[0]) ** 4
        )
        table.append({
            "boundary_morphology": name,
            "beta_first_two": beta.tolist(),
            "gap_ceiling_D4_over_A0_to_infinity": (
                "unbounded" if np.isinf(lim) else float(lim)
            ),
            "D4_over_A0_for_10x_gap": threshold(name),
            "gap_at_D4_over_A0_0p02": float(gap_ratio(name, 0.02)),
        })

    t_c, a_c = integrate(convex_rhs, 0.0)
    t_b, a_b = integrate(bistable_rhs, -1.0)
    spinodal = 2.0 * 4.0 / (3.0 * np.sqrt(3.0))

    result = {
        "namespace": NS,
        "status": "GEN/CANDIDATE synthetic mechanics; not SAT/H(s)H evidence",
        "linear_operator": "eta h_tau = -D4 h_ssss - A0 h + f on L=1",
        "gap_gate": GAP_GATE,
        "boundary_results": table,
        "hinged_fixture": {
            "D4_over_A0": 0.02,
            "r1_over_A0": float(1.0 + 0.02 * np.pi**4),
            "r2_over_A0": float(1.0 + 0.02 * (2.0 * np.pi) ** 4),
            "r2_over_r1": float(gap_ratio("hinged_open_patch", 0.02)),
        },
        "nonlinear_unloading": {
            "convex_quartic_final_amplitude": float(a_c[-1]),
            "convex_quartic_max_amplitude": float(np.max(a_c)),
            "bistable_initial_amplitude": -1.0,
            "bistable_final_amplitude": float(a_b[-1]),
            "bistable_max_amplitude": float(np.max(a_b)),
            "bistable_positive_force": 2.0,
            "bistable_spinodal_force": float(spinodal),
            "interpretation": "fourth-order isolation can make a reduced coordinate valid, but retention after unloading still requires non-convexity, pinning, topology, or a conservation law",
        },
    }

    with (outdir / "fourth_order_boundary_memory_gate.json").open("w", encoding="utf-8") as f:
        json.dump(result, f, indent=2)

    colors = {
        "periodic_closed_rim": "#2f6f9f",
        "hinged_open_patch": "#7a5195",
        "clamped_open_patch": "#ef5675",
        "cantilever_patch": "#ffa600",
        "free_open_patch": "#666666",
    }
    labels = {
        "periodic_closed_rim": "periodic closed rim",
        "hinged_open_patch": "hinged open patch",
        "clamped_open_patch": "clamped open patch",
        "cantilever_patch": "cantilever patch",
        "free_open_patch": "free open patch",
    }
    fig, axes = plt.subplots(1, 2, figsize=(12.4, 4.9), constrained_layout=True)
    ax = axes[0]
    for name in BETAS:
        ax.loglog(dvals, gap_ratio(name, dvals), lw=2.2,
                  color=colors[name], label=labels[name])
        th = threshold(name)
        if th is not None and dvals[0] <= th <= dvals[-1]:
            ax.scatter([th], [GAP_GATE], s=34, color=colors[name], zorder=5)
    ax.axhline(GAP_GATE, color="black", ls="--", lw=1.2, label="10× closure gate")
    ax.set_xlabel(r"dimensionless bending $d_4=D_4/(A_0L^4)$")
    ax.set_ylabel(r"spectral gap $r_2/r_1$")
    ax.set_title("Boundary morphology controls scalar closure")
    ax.set_ylim(0.9, 300)
    ax.grid(True, which="both", alpha=0.22)
    ax.legend(fontsize=8, loc="upper left")

    ax = axes[1]
    ax.plot(t_c, a_c, color="#2f6f9f", lw=2.3, label="convex bending + quartic")
    ax.plot(t_b, a_b, color="#ef5675", lw=2.3, label="explicit double well")
    ax.axvspan(1.0, 4.0, color="#e9c46a", alpha=0.22, label="positive load")
    ax.axhline(0.0, color="black", lw=0.8)
    ax.set_xlabel(r"relaxation parameter $\tau$")
    ax.set_ylabel("retained modal amplitude")
    ax.set_title("Mode isolation is not persistent memory")
    ax.grid(True, alpha=0.22)
    ax.legend(fontsize=8, loc="best")

    fig.suptitle("LOCAL:RAVEL-BCNL — fourth-order contact gate", fontsize=13)
    fig.savefig(outdir / "fourth_order_boundary_memory_gate.svg")
    fig.savefig(outdir / "fourth_order_boundary_memory_gate.png", dpi=180)

    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
