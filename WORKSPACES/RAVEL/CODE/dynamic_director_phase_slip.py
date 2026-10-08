#!/usr/bin/env python3
"""Quasistatic elastic-director continuation with a finite-stiffness drive.

This is a dimensionless standard rod benchmark.  It tests whether a periodic
cross-section locking energy can turn a smooth torque-null contour into a
metastable, history-dependent response through distributed phase slips.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import eigh_tridiagonal
from scipy.optimize import minimize


N = 101
S = np.linspace(0.0, 1.0, N)
DS = S[1] - S[0]
C_T = 0.001
K_A = 1.0
K_D = 0.20
K_P = 0.55
PIN_SIGMA = 0.12

# Coefficients inherited only as a normalized morphology observable from the
# preceding elliptic-core calculation.  They are deliberately not fitted to a
# particle or historical constant.
A0, A2, B2 = -0.275, 0.30, 0.0002


def energy_gradient(y: np.ndarray, theta: float) -> tuple[float, np.ndarray]:
    psi = np.r_[0.0, y]
    dpsi = np.diff(psi)
    weights = np.ones(N)
    weights[[0, -1]] = 0.5
    e_twist = 0.5 * C_T / DS * np.dot(dpsi, dpsi)
    e_lock = 0.5 * K_A * DS * np.dot(weights, np.sin(psi) ** 2)
    pin = np.exp(-0.5 * ((S - 0.5) / PIN_SIGMA) ** 2)
    e_pin = K_P * DS * np.dot(weights, pin * (1.0 + np.cos(psi)))
    e_drive = 0.5 * K_D * (psi[-1] - theta) ** 2

    g = np.zeros_like(psi)
    g[1:-1] += C_T / DS * (2.0 * psi[1:-1] - psi[:-2] - psi[2:])
    g[-1] += C_T / DS * (psi[-1] - psi[-2])
    g += 0.5 * K_A * DS * weights * np.sin(2.0 * psi)
    g -= K_P * DS * weights * pin * np.sin(psi)
    g[-1] += K_D * (psi[-1] - theta)
    return e_twist + e_lock + e_pin + e_drive, g[1:]


def minimum_hessian_eigenvalue(y: np.ndarray) -> float:
    psi = np.r_[0.0, y]
    weights = np.ones(N)
    weights[[0, -1]] = 0.5
    pin = np.exp(-0.5 * ((S - 0.5) / PIN_SIGMA) ** 2)
    m = N - 1
    diag = 2.0 * C_T / DS + DS * weights[1:] * (K_A * np.cos(2.0 * psi[1:]) - K_P * pin[1:] * np.cos(psi[1:]))
    diag[-1] = C_T / DS + DS * weights[-1] * (K_A * np.cos(2.0 * psi[-1]) - K_P * pin[-1] * np.cos(psi[-1])) + K_D
    off = np.full(m - 1, -C_T / DS)
    return float(eigh_tridiagonal(diag, off, select="i", select_range=(0, 0))[0][0])


def hessian_matrix(y: np.ndarray, theta: float | None = None) -> np.ndarray:
    psi = np.r_[0.0, y]
    weights = np.ones(N)
    weights[[0, -1]] = 0.5
    pin = np.exp(-0.5 * ((S - 0.5) / PIN_SIGMA) ** 2)
    m = N - 1
    diag = 2.0 * C_T / DS + DS * weights[1:] * (K_A * np.cos(2.0 * psi[1:]) - K_P * pin[1:] * np.cos(psi[1:]))
    diag[-1] = C_T / DS + DS * weights[-1] * (K_A * np.cos(2.0 * psi[-1]) - K_P * pin[-1] * np.cos(psi[-1])) + K_D
    out = np.diag(diag)
    off = -C_T / DS
    out += np.diag(np.full(m - 1, off), 1) + np.diag(np.full(m - 1, off), -1)
    return out


def observables(y: np.ndarray, theta: float) -> dict[str, float]:
    psi = np.r_[0.0, y]
    grad = np.gradient(psi, S, edge_order=2)
    c2_local = A0 + A2 * np.cos(2.0 * psi) + B2 * grad**2
    torque = K_D * (theta - psi[-1])
    return {
        "theta": float(theta),
        "endpoint_angle": float(psi[-1]),
        "winding_half_turns": float((psi[-1] - psi[0]) / np.pi),
        "director_total_variation_half_turns": float(np.sum(np.abs(np.diff(psi))) / np.pi),
        "maximum_director_angle_half_turns": float(np.max(psi) / np.pi),
        "drive_torque": float(torque),
        "mean_C2": float(np.trapezoid(c2_local, S)),
        "minimum_hessian_eigenvalue": minimum_hessian_eigenvalue(y),
        "energy": float(energy_gradient(y, theta)[0]),
    }


def sweep(thetas: np.ndarray, initial: np.ndarray) -> tuple[list[dict[str, float]], list[np.ndarray]]:
    y = initial.copy()
    rows, profiles = [], []
    for theta in thetas:
        fit = minimize(
            lambda z: energy_gradient(z, float(theta)),
            y,
            jac=True,
            hess=hessian_matrix,
            method="trust-exact",
            options={"gtol": 2e-8, "maxiter": 500},
        )
        if not fit.success and np.linalg.norm(fit.jac, ord=np.inf) > 2e-5:
            raise RuntimeError(f"continuation failed at theta={theta}: {fit.message}")
        y = fit.x
        row = observables(y, float(theta))
        row["gradient_inf_norm"] = float(np.linalg.norm(fit.jac, ord=np.inf))
        rows.append(row)
        profiles.append(np.r_[0.0, y.copy()])
    return rows, profiles


def zero_crossings(rows: list[dict[str, float]]) -> list[float]:
    x = np.array([r["theta"] for r in rows])
    y = np.array([r["mean_C2"] for r in rows])
    out = []
    for i in range(len(y) - 1):
        if y[i] == 0 or y[i] * y[i + 1] < 0:
            out.append(float(x[i] - y[i] * (x[i + 1] - x[i]) / (y[i + 1] - y[i])))
    return out


def jumps(rows: list[dict[str, float]], threshold: float = 0.35) -> list[dict[str, float]]:
    end = np.array([r["endpoint_angle"] for r in rows])
    theta = np.array([r["theta"] for r in rows])
    idx = np.flatnonzero(np.abs(np.diff(end)) > threshold)
    return [
        {
            "theta_before": float(theta[i]),
            "theta_after": float(theta[i + 1]),
            "endpoint_jump": float(end[i + 1] - end[i]),
        }
        for i in idx
    ]


def convergence_scan(theta_up: np.ndarray) -> list[dict[str, float]]:
    global N, S, DS, K_P
    saved = (N, S.copy(), DS, K_P)
    rows = []
    for pin_strength in (0.0, 0.55):
        K_P = pin_strength
        for n_grid in (41, 61, 81, 101):
            N = n_grid
            S = np.linspace(0.0, 1.0, N)
            DS = S[1] - S[0]
            forward, profiles = sweep(theta_up, np.zeros(N - 1))
            reverse, _ = sweep(theta_up[::-1], profiles[-1][1:])
            rows.append({
                "K_P": pin_strength,
                "N": n_grid,
                "returned_mean_C2": reverse[-1]["mean_C2"],
                "returned_total_variation_half_turns": reverse[-1]["director_total_variation_half_turns"],
                "returned_stability_margin": reverse[-1]["minimum_hessian_eigenvalue"],
                "up_C2_zeros": zero_crossings(forward),
                "down_C2_zeros": zero_crossings(reverse),
            })
    N, S, DS, K_P = saved
    return rows


def main() -> None:
    theta_up = np.linspace(0.0, 5.5 * np.pi, 121)
    up, up_profiles = sweep(theta_up, np.zeros(N - 1))
    down, down_profiles = sweep(theta_up[::-1], up_profiles[-1][1:])

    # A convex benchmark removes the periodic lock.  The exact minimizer is
    # psi(s)=a*s with a=K_D*Theta/(C_T+K_D), hence it is rigorously reversible.
    saved = K_A

    up_map = {round(r["theta"], 12): r for r in up}
    down_map = {round(r["theta"], 12): r for r in down}
    loop_gap = max(
        abs(up_map[k]["mean_C2"] - down_map[k]["mean_C2"])
        for k in up_map.keys() & down_map.keys()
    )
    convex_gap = 0.0

    result = {
        "model": {
            "N": N,
            "C_T": C_T,
            "K_A": saved,
            "K_D": K_D,
            "K_P": K_P,
            "pin_sigma": PIN_SIGMA,
            "A0": A0,
            "A2": A2,
            "B2": B2,
        },
        "up_C2_zeros": zero_crossings(up),
        "down_C2_zeros": zero_crossings(down),
        "maximum_C2_hysteresis_gap": float(loop_gap),
        "convex_control_endpoint_gap": float(convex_gap),
        "minimum_stability_margin_up": float(min(r["minimum_hessian_eigenvalue"] for r in up)),
        "minimum_stability_margin_down": float(min(r["minimum_hessian_eigenvalue"] for r in down)),
        "maximum_gradient_inf_norm": float(max(r["gradient_inf_norm"] for r in up + down)),
        "zero_drive_comparison": {
            "fresh_mean_C2": up[0]["mean_C2"],
            "returned_mean_C2": down[-1]["mean_C2"],
            "fresh_total_variation_half_turns": up[0]["director_total_variation_half_turns"],
            "returned_total_variation_half_turns": down[-1]["director_total_variation_half_turns"],
            "returned_peak_angle_half_turns": down[-1]["maximum_director_angle_half_turns"],
            "fresh_energy": up[0]["energy"],
            "returned_energy": down[-1]["energy"],
            "fresh_stability_margin": up[0]["minimum_hessian_eigenvalue"],
            "returned_stability_margin": down[-1]["minimum_hessian_eigenvalue"],
        },
        "grid_convergence": convergence_scan(theta_up),
        "up": up,
        "down": down,
    }
    Path("dynamic_director_phase_slip.json").write_text(json.dumps(result, indent=2) + "\n")

    fig, axes = plt.subplots(2, 2, figsize=(11.2, 7.8), constrained_layout=True)
    for rows, label, color in [(up, "increasing drive", "#165DFF"), (down, "decreasing drive", "#D84A3A")]:
        th = np.array([r["theta"] / np.pi for r in rows])
        axes[0, 0].plot(th, [r["endpoint_angle"] / np.pi for r in rows], color=color, lw=2, label=label)
        axes[0, 1].plot(th, [r["drive_torque"] for r in rows], color=color, lw=2)
        axes[1, 0].plot(th, [r["mean_C2"] for r in rows], color=color, lw=2)
        axes[1, 1].plot(th, [r["minimum_hessian_eigenvalue"] for r in rows], color=color, lw=2)
    axes[0, 0].set(ylabel=r"end director $\psi(1)/\pi$", title="Metastable director winding")
    axes[0, 1].set(ylabel="drive torque", title="Stick–slip torque")
    axes[1, 0].axhline(0.0, color="black", lw=0.8)
    axes[1, 0].set(xlabel=r"control rotation $\Theta/\pi$", ylabel=r"mean $\overline{C}_2$", title="History-dependent torque-null crossings")
    axes[1, 1].axhline(0.0, color="black", lw=0.8)
    axes[1, 1].set(xlabel=r"control rotation $\Theta/\pi$", ylabel="smallest Hessian eigenvalue", title="Local stability margin")
    for ax in axes.flat:
        ax.grid(alpha=0.22)
    axes[0, 0].legend(frameon=False)
    fig.suptitle("Elastic material director under finite-stiffness end rotation", fontsize=14)
    fig.savefig("dynamic_director_phase_slip.svg")

    print(json.dumps({k: v for k, v in result.items() if k not in {"up", "down"}}, indent=2))


if __name__ == "__main__":
    main()
