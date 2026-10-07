#!/usr/bin/env python3
"""Signed material-frame twist inverse test using complex mode coherence."""

from __future__ import annotations

import csv
import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import least_squares


OUT = Path(__file__).resolve().parent
CSV_PATH = OUT / "WORKSPACES_RAVEL_SIGNED_TWIST_PHASE_DATA.csv"
JSON_PATH = OUT / "WORKSPACES_RAVEL_SIGNED_TWIST_PHASE_DATA.json"
FIG_PATH = OUT / "WORKSPACES_RAVEL_SIGNED_TWIST_PHASE_FIGURE.svg"


def coherence(n: int, x: np.ndarray) -> np.ndarray:
    """G_n(x)=2∫_0^1 sin²(nπu) exp(i2xu) du, in stable closed form."""
    a = n * np.pi
    A = lambda t: np.exp(1j * t) * np.sinc(t / np.pi)
    return A(x) - 0.5 * (A(x + a) + A(x - a))


def model(theta: np.ndarray, lengths: np.ndarray, modes: np.ndarray) -> np.ndarray:
    delta, log_eps, psi0 = theta
    eps = np.exp(log_eps)
    return np.array([
        eps * np.exp(2j * psi0) * coherence(int(n), np.array([delta * L]))[0]
        for L, n in zip(lengths, modes)
    ])


def residual(theta: np.ndarray, lengths: np.ndarray, modes: np.ndarray, z: np.ndarray) -> np.ndarray:
    d = model(theta, lengths, modes) - z
    return np.r_[d.real, d.imag]


def fit_complex(lengths: np.ndarray, modes: np.ndarray, z: np.ndarray):
    fits = []
    for delta0 in np.linspace(-4.0, 4.0, 17):
        r = least_squares(
            residual,
            x0=np.array([delta0, np.log(0.05), 0.0]),
            bounds=([-8.0, np.log(1e-5), -np.pi], [8.0, np.log(1.0), np.pi]),
            args=(lengths, modes, z),
            xtol=1e-13,
            ftol=1e-13,
            gtol=1e-13,
            max_nfev=4000,
        )
        fits.append(r)
    return min(fits, key=lambda r: np.sum(r.fun**2))


def fit_magnitude(lengths: np.ndarray, modes: np.ndarray, amps: np.ndarray, sign: int):
    def fun(p):
        delta, log_eps = p
        pred = np.array([
            np.exp(log_eps) * abs(coherence(int(n), np.array([delta * L]))[0])
            for L, n in zip(lengths, modes)
        ])
        return pred - amps

    return least_squares(
        fun,
        x0=[sign * 1.0, np.log(0.05)],
        bounds=([0.0 if sign > 0 else -8.0, np.log(1e-5)], [8.0 if sign > 0 else 0.0, np.log(1.0)]),
        xtol=1e-13,
        ftol=1e-13,
        gtol=1e-13,
    )


def aic(rss: float, n_real: int, k: int) -> float:
    return n_real * np.log(rss / n_real) + 2 * k


def main() -> None:
    rng = np.random.default_rng(20261007)
    delta_true, eps_true, psi0_true = -1.37, 0.075, 0.31
    train_lengths = np.array([0.55, 0.80, 1.05, 1.35, 1.70, 2.10, 2.60, 3.15])
    hold_length = 2.35
    modes0 = np.array([1, 2])
    lengths = np.repeat(train_lengths, 2)
    modes = np.tile(modes0, len(train_lengths))
    z_clean = model(np.array([delta_true, np.log(eps_true), psi0_true]), lengths, modes)
    sigma = 8e-4
    z_obs = z_clean + sigma * (rng.normal(size=z_clean.size) + 1j * rng.normal(size=z_clean.size))

    fit = fit_complex(lengths, modes, z_obs)
    delta_hat, log_eps_hat, psi0_hat = fit.x
    eps_hat = np.exp(log_eps_hat)
    rss_carrier = np.sum(fit.fun**2)

    # Detector-fixed null: one complex constant per mode, independent of length.
    z_null = np.empty_like(z_obs)
    for n in modes0:
        z_null[modes == n] = np.mean(z_obs[modes == n])
    null_res = z_null - z_obs
    rss_null = np.sum(null_res.real**2 + null_res.imag**2)
    delta_aic = aic(rss_null, 2 * z_obs.size, 4) - aic(rss_carrier, 2 * z_obs.size, 3)

    mag_pos = fit_magnitude(lengths, modes, np.abs(z_obs), +1)
    mag_neg = fit_magnitude(lengths, modes, np.abs(z_obs), -1)

    hold_lengths = np.repeat(np.array([hold_length]), 2)
    hold_modes = modes0.copy()
    hold_true = model(np.array([delta_true, np.log(eps_true), psi0_true]), hold_lengths, hold_modes)
    hold_pred = model(fit.x, hold_lengths, hold_modes)
    hold_rel = np.linalg.norm(hold_pred - hold_true) / np.linalg.norm(hold_true)

    with CSV_PATH.open("w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow(["length", "mode", "z_real", "z_imag", "amplitude", "axis_rad", "fit_real", "fit_imag"])
        z_fit = model(fit.x, lengths, modes)
        for L, n, zo, zf in zip(lengths, modes, z_obs, z_fit):
            w.writerow([f"{L:.8f}", int(n), f"{zo.real:.10f}", f"{zo.imag:.10f}",
                        f"{abs(zo):.10f}", f"{0.5*np.angle(zo):.10f}",
                        f"{zf.real:.10f}", f"{zf.imag:.10f}"])
        w.writerow([])
        w.writerow(["parameter", "true", "recovered"])
        w.writerow(["delta", delta_true, f"{delta_hat:.12f}"])
        w.writerow(["epsilon", eps_true, f"{eps_hat:.12f}"])
        w.writerow(["detector_axis_offset_rad", psi0_true, f"{psi0_hat:.12f}"])
        w.writerow(["magnitude_only_positive_delta", "ambiguous", f"{mag_pos.x[0]:.12f}"])
        w.writerow(["magnitude_only_negative_delta", "ambiguous", f"{mag_neg.x[0]:.12f}"])
        w.writerow(["delta_AIC_null_minus_carrier", "", f"{delta_aic:.6f}"])
        w.writerow(["withheld_complex_relative_error", "", f"{hold_rel:.8e}"])

    payload = {
        "status": "GEN/CANDIDATE",
        "seed": 20261007,
        "hidden": {"delta": delta_true, "epsilon": eps_true, "detector_axis_offset_rad": psi0_true},
        "recovered": {"delta": delta_hat, "epsilon": eps_hat, "detector_axis_offset_rad": psi0_hat},
        "magnitude_only_delta_roots": [float(mag_neg.x[0]), float(mag_pos.x[0])],
        "delta_AIC_detector_fixed_null_minus_carrier": float(delta_aic),
        "withheld_length": hold_length,
        "withheld_complex_relative_error": float(hold_rel),
        "noise_sigma_per_complex_component": sigma,
        "observations": [
            {"length": float(L), "mode": int(n), "z_real": float(zo.real), "z_imag": float(zo.imag)}
            for L, n, zo in zip(lengths, modes, z_obs)
        ],
    }
    JSON_PATH.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    fig, axes = plt.subplots(1, 2, figsize=(11.5, 4.5), constrained_layout=True)
    colors = {1: "#1967d2", 2: "#c23b22"}
    for n in modes0:
        sel = modes == n
        order = np.argsort(lengths[sel])
        axes[0].plot(lengths[sel][order], np.abs(z_obs[sel][order]), "o", color=colors[n], label=f"mode {n}")
        axes[0].plot(lengths[sel][order], np.abs(model(fit.x, lengths[sel][order], modes[sel][order])), "-", color=colors[n])
        axes[1].plot(lengths[sel][order], 0.5*np.unwrap(np.angle(z_obs[sel][order])*2)/2, "o", color=colors[n])
        axes[1].plot(lengths[sel][order], 0.5*np.unwrap(np.angle(model(fit.x, lengths[sel][order], modes[sel][order]))*2)/2, "-", color=colors[n])
    axes[0].set(xlabel="worldtube segment length L", ylabel="normalized split |Zₙ|", title="Magnitude loses handedness")
    axes[1].set(xlabel="worldtube segment length L", ylabel="polarization axis ψₙ (rad)", title="Axis phase restores signed twist")
    axes[0].legend(frameon=False)
    for ax in axes:
        ax.grid(alpha=0.25)
    fig.suptitle(f"Recovered δ={delta_hat:.4f} (true {delta_true}); ΔAIC={delta_aic:.1f}; holdout error={hold_rel:.2%}")
    fig.savefig(FIG_PATH, dpi=190)

    print(f"delta={delta_hat:.12f}, epsilon={eps_hat:.12f}, psi0={psi0_hat:.12f}")
    print(f"magnitude roots: {mag_neg.x[0]:.12f}, {mag_pos.x[0]:.12f}")
    print(f"delta_AIC={delta_aic:.6f}, holdout_relative_error={hold_rel:.8e}")


if __name__ == "__main__":
    main()
