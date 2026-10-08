#!/usr/bin/env python3
"""Blind discriminator for a causal finite-core intersection scar.

The candidate response is H(q,w)=alpha/[1+(ell*q)^2-i*w*tau].
It is compared with a q-independent lumped-relaxation null.
"""
from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import least_squares

SEED = 20261007
OUT = Path(__file__).resolve().parent


def response(q, omega, alpha, ell, tau):
    return alpha / (1.0 + (ell * q) ** 2 - 1j * omega * tau)


def null_response(q, omega, alpha, tau):
    del q
    return alpha / (1.0 - 1j * omega * tau)


def stack(z):
    return np.r_[z.real, z.imag]


def fit_model(q, w, z, sigma):
    def resid(p):
        return stack(response(q, w, *p) - z) / sigma

    return least_squares(resid, x0=[0.06, 0.25, 0.65], bounds=([0, 0, 0], [1, 3, 5]))


def fit_null(q, w, z, sigma):
    def resid(p):
        return stack(null_response(q, w, *p) - z) / sigma

    return least_squares(resid, x0=[0.06, 0.65], bounds=([0, 0], [1, 5]))


def aic(rss, nobs, npar):
    return nobs * np.log(rss / nobs) + 2 * npar


def main():
    rng = np.random.default_rng(SEED)
    truth = dict(alpha=0.075, ell=0.34, tau=0.82)
    sigma = 2.0e-4
    freqs = np.geomspace(0.09, 12.0, 18)
    q_train = np.repeat([1.0, 2.0], len(freqs))
    w_train = np.tile(freqs, 2)
    q_hold = np.full_like(freqs, 3.0)
    w_hold = freqs.copy()

    def noisy(q, w):
        z = response(q, w, **truth)
        return z + sigma * (rng.normal(size=z.size) + 1j * rng.normal(size=z.size))

    z_train = noisy(q_train, w_train)
    z_hold = noisy(q_hold, w_hold)
    fit = fit_model(q_train, w_train, z_train, sigma)
    null = fit_null(q_train, w_train, z_train, sigma)

    pred = response(q_hold, w_hold, *fit.x)
    pred0 = null_response(q_hold, w_hold, *null.x)
    rms = float(np.sqrt(np.mean(np.abs(pred - z_hold) ** 2)))
    rms0 = float(np.sqrt(np.mean(np.abs(pred0 - z_hold) ** 2)))
    rss = float(np.sum(np.abs(response(q_train, w_train, *fit.x) - z_train) ** 2))
    rss0 = float(np.sum(np.abs(null_response(q_train, w_train, *null.x) - z_train) ** 2))
    nobs = 2 * z_train.size
    delta_aic = float(aic(rss0, nobs, 2) - aic(rss, nobs, 3))

    poles_true = {str(int(q)): -(1 + (truth["ell"] * q) ** 2) / truth["tau"] for q in [1, 2, 3]}
    poles_fit = {str(int(q)): -(1 + (fit.x[1] * q) ** 2) / fit.x[2] for q in [1, 2, 3]}

    record = {
        "status": "GEN/CANDIDATE",
        "seed": SEED,
        "truth": truth,
        "fit": {"alpha": fit.x[0], "ell": fit.x[1], "tau": fit.x[2]},
        "null_fit": {"alpha": null.x[0], "tau": null.x[1]},
        "delta_aic_candidate_over_null": delta_aic,
        "withheld_q3_complex_rms": rms,
        "withheld_q3_null_rms": rms0,
        "withheld_error_ratio_null_over_candidate": rms0 / rms,
        "decay_poles_truth": poles_true,
        "decay_poles_fit": poles_fit,
        "noise_sigma_per_quadrature": sigma,
        "training_modes": [1, 2],
        "withheld_mode": 3,
        "frequencies": freqs.tolist(),
    }
    (OUT / "timesheet_scar_dispersion.json").write_text(json.dumps(record, indent=2) + "\n")

    fig, ax = plt.subplots(1, 3, figsize=(13.5, 4.2))
    colors = {1: "#4477AA", 2: "#EE6677", 3: "#228833"}
    wf = np.geomspace(freqs.min(), freqs.max(), 400)
    for q in [1, 2, 3]:
        h = response(np.full_like(wf, q), wf, *fit.x)
        ax[0].plot(wf, np.abs(h), color=colors[q], label=f"q={q}")
        ax[1].plot(wf, np.angle(h), color=colors[q])
    ax[0].set(xscale="log", xlabel=r"drive $\omega$", ylabel=r"$|H_q|$", title="Mode-dependent amplitude")
    ax[1].set(xscale="log", xlabel=r"drive $\omega$", ylabel=r"arg $H_q$", title="Causal phase lag")
    ax[0].legend(frameon=False)
    ax[2].scatter(freqs, np.abs(z_hold - pred), color="#228833", label="finite-core pole")
    ax[2].scatter(freqs, np.abs(z_hold - pred0), color="#AA3377", marker="x", label="lumped null")
    ax[2].axhline(sigma * np.sqrt(2), color="0.4", ls="--", lw=1, label="noise scale")
    ax[2].set(xscale="log", yscale="log", xlabel=r"drive $\omega$", ylabel="withheld q=3 error", title="Preregistered-mode discriminator")
    ax[2].legend(frameon=False, fontsize=8)
    fig.suptitle("Causal finite-core intersection scar: dispersive relaxation")
    fig.tight_layout()
    fig.savefig(OUT / "timesheet_scar_dispersion.svg")
    fig.savefig(OUT / "timesheet_scar_dispersion.png", dpi=180)
    print(json.dumps(record, indent=2))


if __name__ == "__main__":
    main()
