#!/usr/bin/env python3
"""Blind finite-core profile recovery with a rotating resolving normal.

The carrier loop orientation is prescribed by a nominal tilt schedule.  The
resolving normal undergoes a sinusoidal angular transport.  A first slab fits
the shared carrier (r, alpha) and transport (amplitude, phase); a second slab
fits only its thickness from high-incidence observations and withholds contact.
"""
from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import least_squares
from scipy.special import betainc

SEED = 2026100702
R_LOOP = 1.0
N_PHI = 2048
PHI = (np.arange(N_PHI) + 0.5) * (2 * np.pi / N_PHI)
SIN_PHI = np.sin(PHI)


def cdf(z: np.ndarray, radius: float, alpha: float) -> np.ndarray:
    y = np.asarray(z) / radius
    out = np.empty_like(y, dtype=float)
    out[y <= -1] = 0.0
    out[y >= 1] = 1.0
    m = (y > -1) & (y < 1)
    ym = y[m]
    out[m] = 0.5 + 0.5 * np.sign(ym) * betainc(0.5, alpha + 1, ym * ym)
    return out


def weight(u: np.ndarray, d: float, r: float, alpha: float) -> np.ndarray:
    return cdf(d / 2 - u, r, alpha) - cdf(-d / 2 - u, r, alpha)


def transported_tilt(nominal_deg: np.ndarray, phase_coord: np.ndarray,
                     amplitude_deg: float, phase_rad: float) -> np.ndarray:
    psi = amplitude_deg * np.sin(2 * np.pi * phase_coord + phase_rad)
    return nominal_deg - psi


def signal(nominal_deg: np.ndarray, phase_coord: np.ndarray, d: float, r: float,
           alpha: float, amplitude_deg: float, phase_rad: float) -> np.ndarray:
    theta = transported_tilt(nominal_deg, phase_coord, amplitude_deg, phase_rad)
    return signal_eff(theta, d, r, alpha)


def signal_eff(theta_deg: np.ndarray, d: float, r: float, alpha: float) -> np.ndarray:
    theta = np.deg2rad(theta_deg)
    u = R_LOOP * np.sin(theta)[:, None] * SIN_PHI[None, :]
    return weight(u, d, r, alpha).mean(axis=1)


def support(nominal_deg: np.ndarray, phase_coord: np.ndarray, d: float, r: float,
            amplitude_deg: float, phase_rad: float) -> np.ndarray:
    theta = transported_tilt(nominal_deg, phase_coord, amplitude_deg, phase_rad)
    return support_eff(theta, d, r)


def support_eff(theta_deg: np.ndarray, d: float, r: float) -> np.ndarray:
    theta = np.deg2rad(theta_deg)
    amp = R_LOOP * np.abs(np.sin(theta))
    aeff = d / 2 + r
    out = np.ones_like(amp)
    m = amp > aeff
    out[m] = 2 / np.pi * np.arcsin(aeff / amp[m])
    return out


def main() -> None:
    rng = np.random.default_rng(SEED)
    truth = {
        "d1": 0.080, "d2": 0.140, "radius": 0.060, "alpha": 0.650,
        "normal_amplitude_deg": 2.400, "normal_phase_rad": 0.700,
    }
    n = 42
    tau = np.linspace(0, 1, n, endpoint=False)
    nominal = 5.0 + 14.0 * tau
    sigma_s, sigma_f = 2e-4, 8e-4

    def noisy(d: float) -> tuple[np.ndarray, np.ndarray]:
        s = signal(nominal, tau, d, truth["radius"], truth["alpha"],
                   truth["normal_amplitude_deg"], truth["normal_phase_rad"])
        f = support(nominal, tau, d, truth["radius"],
                    truth["normal_amplitude_deg"], truth["normal_phase_rad"])
        return s + rng.normal(0, sigma_s, n), f + rng.normal(0, sigma_f, n)

    obs1s, obs1f = noisy(truth["d1"])
    obs2s, obs2f = noisy(truth["d2"])

    def res_dynamic(x: np.ndarray) -> np.ndarray:
        d, r, alpha, ampdeg, phase = x
        return np.r_[
            (signal(nominal, tau, d, r, alpha, ampdeg, phase) - obs1s) / sigma_s,
            (support(nominal, tau, d, r, ampdeg, phase) - obs1f) / sigma_f,
        ]

    starts = [
        [0.07, .05, .3, 1.0, 0.0],
        [0.09, .06, .7, 2.0, .5],
        [0.11, .08, 1.2, 3.5, 1.5],
        [0.08, .04, -.1, 4.5, -1.0],
        [0.10, .10, 1.8, .3, 2.5],
    ]
    fits = [least_squares(
        res_dynamic, x,
        bounds=([.02, .015, -.45, 0, -np.pi], [.20, .16, 2.5, 6.0, np.pi]),
        xtol=1e-12, ftol=1e-12, gtol=1e-12, max_nfev=4000,
    ) for x in starts]
    dyn = min(fits, key=lambda z: np.dot(z.fun, z.fun))
    d1h, rh, ah, amph, phaseh = map(float, dyn.x)

    # Static-normal null can vary carrier parameters but has no normal transport.
    def res_static(x: np.ndarray) -> np.ndarray:
        d, r, alpha = x
        return np.r_[
            (signal(nominal, tau, d, r, alpha, 0.0, 0.0) - obs1s) / sigma_s,
            (support(nominal, tau, d, r, 0.0, 0.0) - obs1f) / sigma_f,
        ]
    sta = least_squares(res_static, [.08, .06, .6],
                        bounds=([.02, .015, -.45], [.20, .16, 2.5]),
                        xtol=1e-12, ftol=1e-12, gtol=1e-12, max_nfev=4000)
    d1s, rs, als = map(float, sta.x)

    # Stronger null: absorb calibration with one affine angle map, but no periodic
    # transported-normal history.
    def res_affine(x: np.ndarray) -> np.ndarray:
        d, r, alpha, offset, scale = x
        theta = offset + scale * nominal
        return np.r_[
            (signal_eff(theta, d, r, alpha) - obs1s) / sigma_s,
            (support_eff(theta, d, r) - obs1f) / sigma_f,
        ]
    aff = least_squares(
        res_affine, [.08, .06, .6, 0.0, 1.0],
        bounds=([.02, .015, -.45, -8.0, .5], [.20, .16, 2.5, 8.0, 1.5]),
        xtol=1e-12, ftol=1e-12, gtol=1e-12, max_nfev=4000)
    d1a, ra, ala, offa, scalea = map(float, aff.x)

    effective_truth = transported_tilt(nominal, tau, truth["normal_amplitude_deg"],
                                       truth["normal_phase_rad"])
    high = effective_truth > 13.5
    hold = ~high

    def fit_d2(r: float, alpha: float, ampdeg: float, phase: float) -> tuple[float, float]:
        def rr(x: np.ndarray) -> np.ndarray:
            d = float(x[0])
            return np.r_[
                (signal(nominal[high], tau[high], d, r, alpha, ampdeg, phase) - obs2s[high]) / sigma_s,
                (support(nominal[high], tau[high], d, r, ampdeg, phase) - obs2f[high]) / sigma_f,
            ]
        z = least_squares(rr, [.13], bounds=([.03], [.25]),
                          xtol=1e-13, ftol=1e-13, gtol=1e-13)
        return float(z.x[0]), float(np.dot(z.fun, z.fun))

    d2h, high_chi2 = fit_d2(rh, ah, amph, phaseh)
    d2s, static_high_chi2 = fit_d2(rs, als, 0.0, 0.0)
    def fit_d2_affine() -> tuple[float, float]:
        theta = offa + scalea * nominal[high]
        def rr(x: np.ndarray) -> np.ndarray:
            d = float(x[0])
            return np.r_[
                (signal_eff(theta, d, ra, ala) - obs2s[high]) / sigma_s,
                (support_eff(theta, d, ra) - obs2f[high]) / sigma_f,
            ]
        z = least_squares(rr, [.13], bounds=([.03], [.25]),
                          xtol=1e-13, ftol=1e-13, gtol=1e-13)
        return float(z.x[0]), float(np.dot(z.fun, z.fun))
    d2a, affine_high_chi2 = fit_d2_affine()
    pred2 = signal(nominal, tau, d2h, rh, ah, amph, phaseh)
    pred2f = support(nominal, tau, d2h, rh, amph, phaseh)
    stat2 = signal(nominal, tau, d2s, rs, als, 0.0, 0.0)
    stat2f = support(nominal, tau, d2s, rs, 0.0, 0.0)
    affine_theta = offa + scalea * nominal
    aff2 = signal_eff(affine_theta, d2a, ra, ala)
    aff2f = support_eff(affine_theta, d2a, ra)

    def rms(pred: np.ndarray, obs: np.ndarray, sig: float, mask: np.ndarray) -> float:
        return float(np.sqrt(np.mean(((pred[mask] - obs[mask]) / sig) ** 2)))

    result = {
        "status": "GEN/CANDIDATE",
        "seed": SEED,
        "truth": truth,
        "recovered_dynamic": {
            "d1": d1h, "d2": d2h, "radius": rh, "alpha": ah,
            "normal_amplitude_deg": amph, "normal_phase_rad": phaseh,
        },
        "static_null": {"d1": d1s, "d2": d2s, "radius": rs, "alpha": als},
        "affine_angle_null": {
            "d1": d1a, "d2": d2a, "radius": ra, "alpha": ala,
            "angle_offset_deg": offa, "angle_scale": scalea,
        },
        "controls": {
            "dynamic_train_chi2": float(np.dot(dyn.fun, dyn.fun)),
            "static_train_chi2": float(np.dot(sta.fun, sta.fun)),
            "affine_train_chi2": float(np.dot(aff.fun, aff.fun)),
            "delta_chi2_static_minus_dynamic": float(np.dot(sta.fun, sta.fun) - np.dot(dyn.fun, dyn.fun)),
            "dynamic_high2_chi2": high_chi2,
            "static_high2_chi2": static_high_chi2,
            "affine_high2_chi2": affine_high_chi2,
            "dynamic_holdout_signal_rms_sigma": rms(pred2, obs2s, sigma_s, hold),
            "static_holdout_signal_rms_sigma": rms(stat2, obs2s, sigma_s, hold),
            "affine_holdout_signal_rms_sigma": rms(aff2, obs2s, sigma_s, hold),
            "dynamic_holdout_support_rms_sigma": rms(pred2f, obs2f, sigma_f, hold),
            "static_holdout_support_rms_sigma": rms(stat2f, obs2f, sigma_f, hold),
            "affine_holdout_support_rms_sigma": rms(aff2f, obs2f, sigma_f, hold),
            "dynamic_dimensionless_jacobian_condition":
                float(np.linalg.cond(dyn.jac @ np.diag(np.maximum(np.abs(dyn.x), 1e-6)))),
            "multistart_peak_to_peak": np.ptp(np.array([z.x for z in fits]), axis=0).tolist(),
            "high_count": int(high.sum()), "holdout_count": int(hold.sum()),
        },
        "series": {
            "tau": tau.tolist(), "nominal_tilt_deg": nominal.tolist(),
            "truth_effective_tilt_deg": effective_truth.tolist(),
            "high_mask": high.tolist(), "observed_signal2": obs2s.tolist(),
            "dynamic_prediction2": pred2.tolist(), "static_prediction2": stat2.tolist(),
        },
    }
    Path("transported_normal_profile_transfer.json").write_text(
        json.dumps(result, indent=2) + "\n", encoding="utf-8")

    fig, ax = plt.subplots(1, 2, figsize=(10.8, 4.0))
    ax[0].plot(tau, nominal, color="0.5", ls=":", label="nominal carrier tilt")
    ax[0].plot(tau, effective_truth, lw=2, label="effective tilt after normal transport")
    ax[0].plot(tau, nominal - transported_tilt(nominal, tau, amph, phaseh),
               lw=1.4, label="recovered normal rotation")
    ax[0].set(xlabel="path parameter", ylabel="angle (deg)",
              title="Carrier/resolver relative geometry")
    ax[0].legend(fontsize=7)

    ax[1].errorbar(tau[hold], obs2s[hold], yerr=sigma_s, fmt=".", ms=4,
                   color="black", alpha=.6, label="withheld slab-2 signal")
    ax[1].plot(tau, pred2, lw=2.2, label="transported-normal model")
    ax[1].plot(tau, stat2, "--", lw=1.6, label="static-normal null")
    ax[1].plot(tau, aff2, "-.", lw=1.4, label="affine-angle null")
    ax[1].scatter(tau[high], obs2s[high], s=18, facecolors="none", edgecolors="tab:green",
                  label="slab-2 thickness calibration")
    ax[1].set(xlabel="path parameter", ylabel="normalized overlap",
              title="Second-slab transfer")
    ax[1].legend(fontsize=7)
    fig.tight_layout()
    fig.savefig("transported_normal_profile_transfer.svg")
    fig.savefig("transported_normal_profile_transfer.png", dpi=180)
    plt.close(fig)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
