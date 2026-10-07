#!/usr/bin/env python3
"""Blind recovery of a nonuniform material-frame twist profile from complex modes."""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.optimize import least_squares


ROOT = Path(__file__).resolve().parent
DATA = ROOT / "ravel_twist_profile_tomography.json"
FIG = ROOT / "ravel_twist_profile_tomography.svg"
U0, W0 = leggauss(240)
U = 0.5 * (U0 + 1.0)
W = 0.5 * W0


def coherence(mode: int, length: float, delta: float, eta: float) -> complex:
    """Weighted director coherence for theta(s)=delta*s+eta*(L*s-s^2)."""
    phase = delta * length * U + eta * length**2 * U * (1.0 - U)
    weight = 2.0 * np.sin(mode * np.pi * U) ** 2
    return np.sum(W * weight * np.exp(2j * phase))


def model(p: np.ndarray, lengths: np.ndarray, modes: np.ndarray) -> np.ndarray:
    delta, eta, log_eps, detector_axis = p
    eps = np.exp(log_eps)
    return np.array([
        eps * np.exp(2j * detector_axis) * coherence(int(n), float(L), delta, eta)
        for L, n in zip(lengths, modes)
    ])


def residual(p: np.ndarray, lengths: np.ndarray, modes: np.ndarray, obs: np.ndarray) -> np.ndarray:
    d = model(p, lengths, modes) - obs
    return np.r_[d.real, d.imag]


def fit_profile(lengths: np.ndarray, modes: np.ndarray, obs: np.ndarray, uniform: bool = False):
    fits = []
    if uniform:
        def fun(q):
            p = np.array([q[0], 0.0, q[1], q[2]])
            return residual(p, lengths, modes, obs)
        for d0 in np.linspace(-3.0, 3.0, 13):
            fits.append(least_squares(
                fun, [d0, np.log(0.05), 0.0],
                bounds=([-6.0, np.log(1e-5), -np.pi], [6.0, np.log(1.0), np.pi]),
                max_nfev=5000, xtol=1e-13, ftol=1e-13, gtol=1e-13,
            ))
    else:
        def fun(p):
            return residual(p, lengths, modes, obs)
        for d0 in np.linspace(-3.0, 3.0, 9):
            for e0 in (-0.4, 0.0, 0.4):
                fits.append(least_squares(
                    fun, [d0, e0, np.log(0.05), 0.0],
                    bounds=([-6.0, -2.0, np.log(1e-5), -np.pi], [6.0, 2.0, np.log(1.0), np.pi]),
                    max_nfev=5000, xtol=1e-13, ftol=1e-13, gtol=1e-13,
                ))
    return min(fits, key=lambda r: float(np.sum(r.fun**2)))


def aic(rss: float, n: int, k: int) -> float:
    return n * np.log(rss / n) + 2 * k


def main() -> None:
    rng = np.random.default_rng(2026100716)
    hidden = np.array([-1.18, 0.245, np.log(0.068), 0.27])
    train_L = np.array([0.55, 0.78, 1.02, 1.31, 1.67, 2.05, 2.48])
    hold_L = 2.27
    mode_set = np.array([1, 2, 3])
    lengths = np.repeat(train_L, len(mode_set))
    modes = np.tile(mode_set, len(train_L))
    clean = model(hidden, lengths, modes)
    sigma = 6.0e-4
    obs = clean + sigma * (rng.normal(size=clean.size) + 1j * rng.normal(size=clean.size))

    full = fit_profile(lengths, modes, obs, uniform=False)
    null = fit_profile(lengths, modes, obs, uniform=True)
    p_hat = full.x
    p_null = np.array([null.x[0], 0.0, null.x[1], null.x[2]])
    rss_full = float(np.sum(full.fun**2))
    rss_null = float(np.sum(null.fun**2))
    delta_aic = aic(rss_null, 2 * obs.size, 3) - aic(rss_full, 2 * obs.size, 4)

    hold_lengths = np.repeat(np.array([hold_L]), len(mode_set))
    hold_modes = mode_set.copy()
    hold_true = model(hidden, hold_lengths, hold_modes)
    hold_full = model(p_hat, hold_lengths, hold_modes)
    hold_null = model(p_null, hold_lengths, hold_modes)
    err_full = float(np.linalg.norm(hold_full - hold_true) / np.linalg.norm(hold_true))
    err_null = float(np.linalg.norm(hold_null - hold_true) / np.linalg.norm(hold_true))

    # First-order check at delta=0: eta changes phase but not magnitude.
    h = 1e-5
    g0 = coherence(1, 1.3, 0.0, 0.0)
    gp = coherence(1, 1.3, 0.0, h)
    gm = coherence(1, 1.3, 0.0, -h)
    dmag = (abs(gp) - abs(gm)) / (2 * h)
    dphase = (np.angle(gp) - np.angle(gm)) / (2 * h)

    # Local conditioning from the fitted Jacobian.
    svals = np.linalg.svd(full.jac, compute_uv=False)
    jac_condition = float(svals[0] / svals[-1])

    payload = {
        "status": "GEN/CANDIDATE",
        "seed": 2026100716,
        "profile": "theta(s)=delta_mat*s+eta_mat*(L*s-s^2)",
        "hidden": {"delta_mat": hidden[0], "eta_mat": hidden[1], "epsilon_C": float(np.exp(hidden[2])), "detector_axis": hidden[3]},
        "recovered": {"delta_mat": float(p_hat[0]), "eta_mat": float(p_hat[1]), "epsilon_C": float(np.exp(p_hat[2])), "detector_axis": float(p_hat[3])},
        "uniform_null": {"delta_mat": float(p_null[0]), "eta_mat": 0.0, "epsilon_C": float(np.exp(p_null[2])), "detector_axis": float(p_null[3])},
        "delta_AIC_uniform_minus_profile": float(delta_aic),
        "withheld_length": hold_L,
        "withheld_relative_error_profile": err_full,
        "withheld_relative_error_uniform": err_null,
        "jacobian_condition_number": jac_condition,
        "zero_background_first_order": {"d_absG_d_eta": float(dmag), "d_argG_d_eta": float(dphase)},
        "noise_sigma_per_component": sigma,
    }
    DATA.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    fig, axes = plt.subplots(1, 2, figsize=(11.5, 4.6), constrained_layout=True)
    colors = {1: "#1464b4", 2: "#c23b22", 3: "#4b8b3b"}
    for n in mode_set:
        sel = modes == n
        order = np.argsort(lengths[sel])
        ls = lengths[sel][order]
        os = obs[sel][order]
        fs = model(p_hat, ls, modes[sel][order])
        ns = model(p_null, ls, modes[sel][order])
        axes[0].plot(ls, np.abs(os), "o", color=colors[int(n)], label=f"mode {n}")
        axes[0].plot(ls, np.abs(fs), "-", color=colors[int(n)])
        axes[0].plot(ls, np.abs(ns), "--", color=colors[int(n)], alpha=0.55)
        axes[1].plot(ls, 0.5*np.unwrap(2*np.angle(os)/2), "o", color=colors[int(n)])
        axes[1].plot(ls, 0.5*np.unwrap(np.angle(fs)), "-", color=colors[int(n)])
        axes[1].plot(ls, 0.5*np.unwrap(np.angle(ns)), "--", color=colors[int(n)], alpha=0.55)
    axes[0].set(xlabel="segment length L", ylabel="|Zₙ|", title="Split magnitude")
    axes[1].set(xlabel="segment length L", ylabel="polarization axis ψₙ (rad)", title="Phase reveals internal twist distribution")
    axes[0].legend(frameon=False)
    for ax in axes:
        ax.grid(alpha=0.25)
    fig.suptitle(f"solid: profile fit; dashed: uniform null | ΔAIC={delta_aic:.1f}, holdout {err_full:.2%} vs {err_null:.2%}")
    fig.savefig(FIG, format="svg")

    print(json.dumps(payload, indent=2))


if __name__ == "__main__":
    main()
