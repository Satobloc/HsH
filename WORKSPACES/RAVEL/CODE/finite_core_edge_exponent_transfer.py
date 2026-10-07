#!/usr/bin/env python3
"""Sandbox inverse test for a continuous finite-core edge exponent.

The normalized transverse marginal is
    p_alpha(z) = C_alpha/r * (1-(z/r)^2)^alpha, |z|<r,
with alpha > -1.  The script:
1. recovers (d1, r, alpha) from one slab/tilt family;
2. estimates only d2 from high-tilt data in a second slab;
3. predicts a withheld contact sweep in that second slab;
4. compares fixed shell/disk/ball edge exponents.
"""
from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import least_squares
from scipy.special import betainc

SEED = 20261007
R_LOOP = 1.0
N_PHI = 2048
PHI = (np.arange(N_PHI) + 0.5) * (2.0 * np.pi / N_PHI)
SIN_PHI = np.sin(PHI)


def marginal_cdf(z: np.ndarray, radius: float, alpha: float) -> np.ndarray:
    y = np.asarray(z, dtype=float) / radius
    out = np.empty_like(y)
    out[y <= -1.0] = 0.0
    out[y >= 1.0] = 1.0
    mid = (y > -1.0) & (y < 1.0)
    ym = y[mid]
    inc = betainc(0.5, alpha + 1.0, ym * ym)
    out[mid] = 0.5 + 0.5 * np.sign(ym) * inc
    return out


def overlap_weight(u: np.ndarray, thickness: float, radius: float, alpha: float) -> np.ndarray:
    hi = thickness / 2.0 - u
    lo = -thickness / 2.0 - u
    return marginal_cdf(hi, radius, alpha) - marginal_cdf(lo, radius, alpha)


def signal(theta_deg: np.ndarray, thickness: float, radius: float, alpha: float) -> np.ndarray:
    theta = np.deg2rad(np.atleast_1d(theta_deg))
    u = R_LOOP * np.sin(theta)[:, None] * SIN_PHI[None, :]
    return overlap_weight(u, thickness, radius, alpha).mean(axis=1)


def support_fraction(theta_deg: np.ndarray, thickness: float, radius: float) -> np.ndarray:
    theta = np.deg2rad(np.atleast_1d(theta_deg))
    amp = R_LOOP * np.abs(np.sin(theta))
    aeff = thickness / 2.0 + radius
    out = np.ones_like(amp)
    m = amp > aeff
    out[m] = (2.0 / np.pi) * np.arcsin(aeff / amp[m])
    return out


def edge_exponent_fit(g: np.ndarray, w: np.ndarray) -> float:
    m = (g > 0) & (w > 0)
    x = np.log(g[m])
    y = np.log(w[m])
    return float(np.polyfit(x, y, 1)[0])


def main() -> None:
    rng = np.random.default_rng(SEED)
    truth = {"d1": 0.080, "d2": 0.140, "radius": 0.060, "alpha": 0.650}
    train1 = np.array([3.8, 4.6, 5.2, 5.7, 6.0, 6.5, 7.2, 8.5, 12.0, 20.0, 35.0, 55.0, 80.0])
    high2 = np.array([25.0, 30.0, 36.0, 43.0, 51.0, 60.0, 70.0, 80.0, 86.0])
    hold2 = np.linspace(5.0, 14.0, 55)
    sigma_s = 2.0e-4
    sigma_f = 8.0e-4

    y1s = signal(train1, truth["d1"], truth["radius"], truth["alpha"])
    y1f = support_fraction(train1, truth["d1"], truth["radius"])
    obs1s = y1s + rng.normal(0.0, sigma_s, train1.size)
    obs1f = y1f + rng.normal(0.0, sigma_f, train1.size)

    def residual1(x: np.ndarray, fixed_alpha: float | None = None) -> np.ndarray:
        d, r = x[:2]
        a = fixed_alpha if fixed_alpha is not None else x[2]
        return np.r_[
            (signal(train1, d, r, a) - obs1s) / sigma_s,
            (support_fraction(train1, d, r) - obs1f) / sigma_f,
        ]

    starts = [
        [0.06, 0.04, 0.2],
        [0.09, 0.05, 0.6],
        [0.12, 0.08, 1.2],
        [0.07, 0.10, 0.9],
        [0.10, 0.03, -0.2],
    ]
    fits = [
        least_squares(residual1, s, bounds=([0.02, 0.015, -0.45], [0.20, 0.16, 2.5]),
                      xtol=1e-12, ftol=1e-12, gtol=1e-12, max_nfev=3000)
        for s in starts
    ]
    best = min(fits, key=lambda z: float(np.dot(z.fun, z.fun)))
    d1_hat, r_hat, alpha_hat = map(float, best.x)
    multistart_spread = np.ptp(np.array([z.x for z in fits]), axis=0)

    y2h = signal(high2, truth["d2"], truth["radius"], truth["alpha"])
    obs2h = y2h + rng.normal(0.0, sigma_s, high2.size)

    def fit_d2(r_use: float, a_use: float) -> tuple[float, float]:
        def res(x: np.ndarray) -> np.ndarray:
            return (signal(high2, float(x[0]), r_use, a_use) - obs2h) / sigma_s
        z = least_squares(res, [0.12], bounds=([0.03], [0.25]), xtol=1e-13, ftol=1e-13, gtol=1e-13)
        return float(z.x[0]), float(np.dot(z.fun, z.fun))

    d2_hat, chi2_high2 = fit_d2(r_hat, alpha_hat)
    truth_hold = signal(hold2, truth["d2"], truth["radius"], truth["alpha"])
    obs_hold = truth_hold + rng.normal(0.0, sigma_s, hold2.size)
    pred_hold = signal(hold2, d2_hat, r_hat, alpha_hat)
    rms_hold = float(np.sqrt(np.mean(((pred_hold - obs_hold) / sigma_s) ** 2)))

    fixed = {}
    fixed_predictions = {}
    for label, aval in [("S2_shell", 0.0), ("B2_disk", 0.5), ("B3_ball", 1.0)]:
        z = least_squares(lambda x: residual1(x, aval), [0.08, 0.06],
                          bounds=([0.02, 0.015], [0.20, 0.16]),
                          xtol=1e-12, ftol=1e-12, gtol=1e-12, max_nfev=3000)
        d1m, rm = map(float, z.x)
        d2m, c2 = fit_d2(rm, aval)
        ph = signal(hold2, d2m, rm, aval)
        fixed_predictions[label] = ph
        fixed[label] = {
            "alpha": aval, "d1": d1m, "radius": rm, "d2": d2m,
            "train1_chi2": float(np.dot(z.fun, z.fun)),
            "high2_chi2": c2,
            "hold2_rms_sigma": float(np.sqrt(np.mean(((ph - obs_hold) / sigma_s) ** 2))),
        }

    # Direct near-edge law at a fixed slab boundary: W ~ g^(alpha+1).
    g = np.geomspace(2e-6, 5e-4, 30)
    u = truth["d1"] / 2.0 + truth["radius"] - g
    w = overlap_weight(u, truth["d1"], truth["radius"], truth["alpha"])
    edge_power = edge_exponent_fit(g[:18], w[:18])

    jac_cond = float(np.linalg.cond(best.jac))
    jac_cond_scaled = float(np.linalg.cond(best.jac @ np.diag(np.abs(best.x))))
    result = {
        "status": "GEN/CANDIDATE",
        "seed": SEED,
        "truth": truth,
        "recovered": {"d1": d1_hat, "radius": r_hat, "alpha": alpha_hat, "d2": d2_hat},
        "relative_errors": {
            "d1": (d1_hat / truth["d1"] - 1.0),
            "radius": (r_hat / truth["radius"] - 1.0),
            "alpha": (alpha_hat / truth["alpha"] - 1.0),
            "d2": (d2_hat / truth["d2"] - 1.0),
        },
        "fit_controls": {
            "train1_chi2": float(np.dot(best.fun, best.fun)),
            "high2_chi2": chi2_high2,
            "hold2_rms_sigma": rms_hold,
            "jacobian_condition": jac_cond,
            "dimensionless_jacobian_condition": jac_cond_scaled,
            "multistart_peak_to_peak": multistart_spread.tolist(),
            "derived_edge_power": edge_power,
            "predicted_edge_power": truth["alpha"] + 1.0,
        },
        "fixed_profile_nulls": fixed,
        "angles_deg": {"train1": train1.tolist(), "high2": high2.tolist(), "hold2": hold2.tolist()},
        "hold2": {"observed": obs_hold.tolist(), "predicted": pred_hold.tolist(), "truth": truth_hold.tolist()},
    }
    out = Path("finite_core_edge_exponent_transfer.json")
    out.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")

    fig, axes = plt.subplots(1, 2, figsize=(10.5, 4.0))
    ax = axes[0]
    ax.errorbar(hold2, obs_hold, yerr=sigma_s, fmt=".", ms=3, color="black", alpha=0.65,
                label="withheld observations")
    ax.plot(hold2, pred_hold, lw=2.2, label=f"continuous α={alpha_hat:.3f}")
    for label, pred in fixed_predictions.items():
        ax.plot(hold2, pred, lw=1.15, ls="--", label=label.replace("_", " "))
    ax.axvline(np.rad2deg(np.arcsin((truth["d2"]/2+truth["radius"])/R_LOOP)),
               color="0.5", ls=":", lw=1.2, label="contact angle")
    ax.set(xlabel="tilt angle (deg)", ylabel="normalized overlap signal",
           title="Second-slab withheld transfer")
    ax.legend(fontsize=7)

    ax = axes[1]
    ax.loglog(g, w, "o", ms=3, label="exact overlap")
    ref = w[4] * (g / g[4]) ** (truth["alpha"] + 1.0)
    ax.loglog(g, ref, lw=1.8, label=r"$g^{\alpha+1}$ prediction")
    ax.set(xlabel="penetration depth g", ylabel="local overlap W",
           title=f"Edge power {edge_power:.4f} (expected 1.6500)")
    ax.legend(fontsize=8)
    fig.tight_layout()
    fig.savefig("finite_core_edge_exponent_transfer.svg")
    fig.savefig("finite_core_edge_exponent_transfer.png", dpi=180)
    plt.close(fig)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
