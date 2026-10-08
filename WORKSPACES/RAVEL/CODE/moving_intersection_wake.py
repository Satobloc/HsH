#!/usr/bin/env python3
"""Blind test for a causal wake from a moving finite-core intersection.

Candidate: H(q,v)=alpha/[1+(ell*q)^2-i*q*v*tau].
Null: a symmetric static response shifted rigidly by beta*v.
"""
from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import least_squares

SEED = 20261007
OUT = Path(__file__).resolve().parent


def candidate(q, v, alpha, ell, tau):
    return alpha / (1.0 + (ell * q) ** 2 - 1j * q * v * tau)


def rigid_delay_null(q, v, alpha, ell, beta):
    return alpha * np.exp(1j * q * beta * v) / (1.0 + (ell * q) ** 2)


def stack(z):
    return np.r_[z.real, z.imag]


def wake_lengths(v, ell, tau):
    pe = v * tau / ell
    root = np.sqrt(pe**2 + 4.0)
    behind = 0.5 * ell * (root + pe)
    ahead = 0.5 * ell * (root - pe)
    return behind, ahead


def wake_profile(y, v, alpha, ell, tau):
    behind, ahead = wake_lengths(v, ell, tau)
    amp = alpha / np.sqrt((v * tau) ** 2 + 4.0 * ell**2)
    return np.where(y < 0.0, amp * np.exp(y / behind), amp * np.exp(-y / ahead))


def fit_candidate(q, v, z, sigma):
    def residual(p):
        return stack(candidate(q, v, *p) - z) / sigma

    return least_squares(residual, [0.08, 0.45, 0.7], bounds=([0, 0, 0], [1, 3, 5]))


def fit_null(q, v, z, sigma):
    def residual(p):
        return stack(rigid_delay_null(q, v, *p) - z) / sigma

    return least_squares(residual, [0.08, 0.45, 0.4], bounds=([0, 0, -5], [1, 3, 5]))


def aic(rss, nobs, npar):
    return nobs * np.log(rss / nobs) + 2 * npar


def main():
    rng = np.random.default_rng(SEED)
    truth = dict(alpha=0.083, ell=0.47, tau=0.76)
    sigma = 3.0e-4
    q_grid = np.linspace(0.35, 5.2, 24)
    train_v = np.array([-0.9, -0.35, 0.0, 0.35, 0.9])
    hold_v = 1.35
    q_train = np.tile(q_grid, train_v.size)
    v_train = np.repeat(train_v, q_grid.size)
    q_hold = q_grid.copy()
    v_hold = np.full_like(q_hold, hold_v)

    def noisy(q, v):
        z = candidate(q, v, **truth)
        return z + sigma * (rng.normal(size=z.size) + 1j * rng.normal(size=z.size))

    z_train = noisy(q_train, v_train)
    z_hold = noisy(q_hold, v_hold)
    fit = fit_candidate(q_train, v_train, z_train, sigma)
    null = fit_null(q_train, v_train, z_train, sigma)
    pred = candidate(q_hold, v_hold, *fit.x)
    pred0 = rigid_delay_null(q_hold, v_hold, *null.x)

    rss = float(np.sum(np.abs(candidate(q_train, v_train, *fit.x) - z_train) ** 2))
    rss0 = float(np.sum(np.abs(rigid_delay_null(q_train, v_train, *null.x) - z_train) ** 2))
    nobs = 2 * z_train.size
    delta_aic = float(aic(rss0, nobs, 3) - aic(rss, nobs, 3))
    rms = float(np.sqrt(np.mean(np.abs(pred - z_hold) ** 2)))
    rms0 = float(np.sqrt(np.mean(np.abs(pred0 - z_hold) ** 2)))

    checks = {}
    for v in [0.35, 0.9, hold_v]:
        behind, ahead = wake_lengths(v, fit.x[1], fit.x[2])
        checks[str(v)] = {
            "behind": float(behind),
            "ahead": float(ahead),
            "difference": float(behind - ahead),
            "v_tau": float(v * fit.x[2]),
            "product": float(behind * ahead),
            "ell_squared": float(fit.x[1] ** 2),
        }

    record = {
        "status": "GEN/CANDIDATE",
        "seed": SEED,
        "truth": truth,
        "fit": {"alpha": fit.x[0], "ell": fit.x[1], "tau": fit.x[2]},
        "rigid_delay_null_fit": {"alpha": null.x[0], "ell": null.x[1], "beta": null.x[2]},
        "delta_aic_candidate_over_null": delta_aic,
        "withheld_velocity": hold_v,
        "withheld_candidate_complex_rms": rms,
        "withheld_null_complex_rms": rms0,
        "withheld_error_ratio_null_over_candidate": rms0 / rms,
        "noise_sigma_per_quadrature": sigma,
        "training_velocities": train_v.tolist(),
        "q_grid": q_grid.tolist(),
        "wake_identity_checks": checks,
    }
    (OUT / "moving_intersection_wake.json").write_text(json.dumps(record, indent=2) + "\n")

    fig, ax = plt.subplots(1, 3, figsize=(13.6, 4.2))
    colors = {0.0: "#666666", 0.35: "#4477AA", 0.9: "#EE6677", 1.35: "#228833"}
    qf = np.linspace(q_grid.min(), q_grid.max(), 500)
    for v in [0.0, 0.35, 0.9, hold_v]:
        h = candidate(qf, v, *fit.x)
        ax[0].plot(qf, np.abs(h), color=colors[v], label=f"v={v:g}")
        ax[1].plot(qf, np.angle(h), color=colors[v])
    ax[0].set(xlabel="spatial mode q", ylabel=r"$|H(q,v)|$", title="Velocity-dependent attenuation")
    ax[1].set(xlabel="spatial mode q", ylabel=r"arg $H(q,v)$", title="Reversal-odd wake phase")
    ax[0].legend(frameon=False, fontsize=8)

    y = np.linspace(-3.2, 3.2, 700)
    for v in [0.0, 0.35, 0.9, hold_v]:
        ax[2].plot(y, wake_profile(y, v, *fit.x), color=colors[v], label=f"v={v:g}")
    ax[2].axvline(0, color="0.75", lw=1)
    ax[2].set(xlabel=r"comoving coordinate $y=\xi-vt$", ylabel="wake amplitude", title="Long tail behind moving intersection")
    ax[2].legend(frameon=False, fontsize=8)
    fig.suptitle("Moving finite-core intersection: causal wake identities")
    fig.tight_layout()
    fig.savefig(OUT / "moving_intersection_wake.svg")
    fig.savefig(OUT / "moving_intersection_wake.png", dpi=180)
    print(json.dumps(record, indent=2))


if __name__ == "__main__":
    main()
