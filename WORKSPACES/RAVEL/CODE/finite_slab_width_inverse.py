#!/usr/bin/env python3
"""Blind inverse test for slab thickness and finite-core radius.

Uses only the two observables derived from the rotated-loop geometry:
nonempty incidence fraction and cross-section-weighted signal.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import least_squares

from finite_slab_rotated_loop import cross_section_weight, incidence_fraction_analytic


OUT_JSON = Path("finite_slab_width_inverse.json")
OUT_SVG = Path("finite_slab_width_inverse.svg")
OUT_PNG = Path("finite_slab_width_inverse.png")


RADIUS = 1.0
TRUE_D = 0.08
TRUE_RC = 0.06
SIGMA_F = 6.0e-4
SIGMA_S = 3.0e-4
SEED = 20261007
PHASE = np.linspace(0.0, 2.0 * np.pi, 8192, endpoint=False)


def predict(theta: np.ndarray, d_slab: float, r_core: float) -> tuple[np.ndarray, np.ndarray]:
    theta = np.atleast_1d(theta)
    f = incidence_fraction_analytic(theta, RADIUS, d_slab, r_core)
    q = RADIUS * np.sin(theta[:, None]) * np.sin(PHASE[None, :])
    s = np.mean(cross_section_weight(q, d_slab, r_core), axis=1)
    return f, s


def fit_two_widths(theta: np.ndarray, f_obs: np.ndarray, s_obs: np.ndarray, starts: list[tuple[float, float]]) -> dict:
    def residual(logp: np.ndarray) -> np.ndarray:
        d_slab, r_core = np.exp(logp)
        f, s = predict(theta, d_slab, r_core)
        return np.r_[(f - f_obs) / SIGMA_F, (s - s_obs) / SIGMA_S]

    fits = []
    for d0, r0 in starts:
        sol = least_squares(
            residual,
            np.log([d0, r0]),
            bounds=(np.log([0.005, 0.005]), np.log([0.25, 0.20])),
            xtol=1e-12,
            ftol=1e-12,
            gtol=1e-12,
            max_nfev=1000,
        )
        fits.append(sol)
    best = min(fits, key=lambda x: 2.0 * x.cost)
    singular = np.linalg.svd(best.jac, compute_uv=False)
    return {
        "d": float(np.exp(best.x[0])),
        "rc": float(np.exp(best.x[1])),
        "chi2": float(2.0 * best.cost),
        "max_start_parameter_spread": float(
            np.max(np.ptp(np.asarray([np.exp(sol.x) for sol in fits]), axis=0))
        ),
        "jacobian_singular_values": singular.tolist(),
        "jacobian_condition_number": float(singular[0] / singular[-1]),
        "success_all_starts": bool(all(sol.success for sol in fits)),
    }


def fit_zero_core_null(theta: np.ndarray, f_obs: np.ndarray, s_obs: np.ndarray) -> dict:
    def residual(logd: np.ndarray) -> np.ndarray:
        d_slab = float(np.exp(logd[0]))
        f, s = predict(theta, d_slab, 0.0)
        return np.r_[(f - f_obs) / SIGMA_F, (s - s_obs) / SIGMA_S]

    sol = least_squares(
        residual, np.log([0.12]), bounds=(np.log([0.005]), np.log([0.4])),
        xtol=1e-12, ftol=1e-12, gtol=1e-12,
    )
    return {"d": float(np.exp(sol.x[0])), "rc": 0.0, "chi2": float(2.0 * sol.cost)}


def main() -> None:
    rng = np.random.default_rng(SEED)
    train_deg = np.asarray([8.0, 12.0, 20.0, 35.0, 55.0, 80.0])
    test_deg = np.asarray([6.0, 10.0, 15.0, 27.0, 45.0, 65.0, 90.0])
    train_theta = np.deg2rad(train_deg)
    test_theta = np.deg2rad(test_deg)

    f_true, s_true = predict(train_theta, TRUE_D, TRUE_RC)
    f_obs = f_true + rng.normal(0.0, SIGMA_F, size=f_true.size)
    s_obs = s_true + rng.normal(0.0, SIGMA_S, size=s_true.size)

    starts = [(0.02, 0.02), (0.04, 0.10), (0.08, 0.04), (0.12, 0.08), (0.20, 0.15)]
    fit = fit_two_widths(train_theta, f_obs, s_obs, starts)
    null_fit = fit_zero_core_null(train_theta, f_obs, s_obs)

    f_test_true, s_test_true = predict(test_theta, TRUE_D, TRUE_RC)
    f_test_fit, s_test_fit = predict(test_theta, fit["d"], fit["rc"])
    held_f_z = (f_test_fit - f_test_true) / SIGMA_F
    held_s_z = (s_test_fit - s_test_true) / SIGMA_S
    held_rms_z = float(np.sqrt(np.mean(np.r_[held_f_z, held_s_z] ** 2)))
    theta_c_true = float(np.rad2deg(np.arcsin((TRUE_D / 2.0 + TRUE_RC) / RADIUS)))
    theta_c_fit = float(np.rad2deg(np.arcsin((fit["d"] / 2.0 + fit["rc"]) / RADIUS)))

    # Monte Carlo recovery under the declared noise model.
    mc = []
    for _ in range(160):
        fm = f_true + rng.normal(0.0, SIGMA_F, size=f_true.size)
        sm = s_true + rng.normal(0.0, SIGMA_S, size=s_true.size)
        one = fit_two_widths(train_theta, fm, sm, [(0.04, 0.04), (0.12, 0.10)])
        mc.append([one["d"], one["rc"]])
    mc = np.asarray(mc)

    dense_deg = np.linspace(5.8, 90.0, 350)
    dense_theta = np.deg2rad(dense_deg)
    f_dense_true, s_dense_true = predict(dense_theta, TRUE_D, TRUE_RC)
    f_dense_fit, s_dense_fit = predict(dense_theta, fit["d"], fit["rc"])
    f_dense_null, s_dense_null = predict(dense_theta, null_fit["d"], 0.0)

    result = {
        "status": "GEN/CANDIDATE blind synthetic inverse test",
        "seed": SEED,
        "true_hidden_parameters": {"dSigma": TRUE_D, "rCore": TRUE_RC, "aEff": TRUE_D / 2.0 + TRUE_RC},
        "noise": {"sigma_incidence_fraction": SIGMA_F, "sigma_weighted_signal": SIGMA_S},
        "training_tilts_deg": train_deg.tolist(),
        "withheld_tilts_deg": test_deg.tolist(),
        "fit": fit,
        "relative_parameter_errors": {
            "dSigma": float((fit["d"] - TRUE_D) / TRUE_D),
            "rCore": float((fit["rc"] - TRUE_RC) / TRUE_RC),
        },
        "withheld": {
            "rms_normalized_error": held_rms_z,
            "max_abs_incidence_z": float(np.max(np.abs(held_f_z))),
            "max_abs_signal_z": float(np.max(np.abs(held_s_z))),
            "largest_pointwise_residual_tilt_deg": float(test_deg[np.argmax(np.abs(held_f_z))]),
        },
        "critical_tilt": {
            "true_deg": theta_c_true,
            "fit_deg": theta_c_fit,
            "shift_deg": theta_c_fit - theta_c_true,
        },
        "zero_core_null": null_fit,
        "delta_chi2_null_minus_two_width": float(null_fit["chi2"] - fit["chi2"]),
        "monte_carlo_160": {
            "median": {"dSigma": float(np.median(mc[:, 0])), "rCore": float(np.median(mc[:, 1]))},
            "p16": {"dSigma": float(np.quantile(mc[:, 0], 0.16)), "rCore": float(np.quantile(mc[:, 1], 0.16))},
            "p84": {"dSigma": float(np.quantile(mc[:, 0], 0.84)), "rCore": float(np.quantile(mc[:, 1], 0.84))},
            "correlation": float(np.corrcoef(mc.T)[0, 1]),
        },
        "failure_gate": "fail if either width error exceeds 10%, withheld RMS exceeds 2 noise sigma, or multistart solutions disagree by >1e-5",
        "failure_gate_passed": bool(
            abs((fit["d"] - TRUE_D) / TRUE_D) <= 0.10
            and abs((fit["rc"] - TRUE_RC) / TRUE_RC) <= 0.10
            and held_rms_z <= 2.0
            and fit["max_start_parameter_spread"] <= 1.0e-5
        ),
        "posthoc_pointwise_warning": "The 6-degree support prediction is 3.92 sigma off despite aggregate transfer passing; topology classification is ill-conditioned near theta_c.",
    }
    OUT_JSON.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")

    fig, axes = plt.subplots(2, 2, figsize=(12.8, 8.8), constrained_layout=True)
    ax = axes[0, 0]
    ax.plot(dense_deg, f_dense_true, color="black", lw=2.4, label="hidden truth")
    ax.plot(dense_deg, f_dense_fit, color="#1b9e77", ls="--", lw=2.2, label="two-width fit")
    ax.plot(dense_deg, f_dense_null, color="#d95f02", ls=":", lw=2.2, label="zero-core null")
    ax.errorbar(train_deg, f_obs, yerr=SIGMA_F, fmt="o", color="#7570b3", ms=5, label="training data")
    ax.scatter(test_deg, f_test_true, facecolors="none", edgecolors="#e7298a", s=48, label="withheld truth")
    ax.set(title="Nonempty intersection support", ylabel="phase fraction", xlabel="tilt (degrees)")
    ax.grid(alpha=0.2); ax.legend(frameon=False, fontsize=8)

    ax = axes[0, 1]
    ax.plot(dense_deg, s_dense_true, color="black", lw=2.4, label="hidden truth")
    ax.plot(dense_deg, s_dense_fit, color="#1b9e77", ls="--", lw=2.2, label="two-width fit")
    ax.plot(dense_deg, s_dense_null, color="#d95f02", ls=":", lw=2.2, label="zero-core null")
    ax.errorbar(train_deg, s_obs, yerr=SIGMA_S, fmt="o", color="#7570b3", ms=5, label="training data")
    ax.scatter(test_deg, s_test_true, facecolors="none", edgecolors="#e7298a", s=48, label="withheld truth")
    ax.set(title="Cross-section-weighted readout", ylabel="normalized signal", xlabel="tilt (degrees)")
    ax.grid(alpha=0.2); ax.legend(frameon=False, fontsize=8)

    ax = axes[1, 0]
    ax.scatter(mc[:, 0], mc[:, 1], s=15, alpha=0.45, color="#377eb8", label="160 noise realizations")
    ax.scatter([TRUE_D], [TRUE_RC], marker="*", s=180, color="black", label="hidden truth")
    ax.scatter([fit["d"]], [fit["rc"]], marker="X", s=90, color="#e41a1c", label="reported blind fit")
    ax.set(title="Joint recovery breaks the width degeneracy", xlabel=r"slab thickness $d_\Sigma$", ylabel=r"core radius $r_c$")
    ax.grid(alpha=0.2); ax.legend(frameon=False, fontsize=8)

    ax = axes[1, 1]
    xx = np.arange(test_deg.size)
    ax.axhspan(-2, 2, color="0.92", label="±2 noise σ")
    ax.plot(xx, held_f_z, "o-", color="#984ea3", label="support residual")
    ax.plot(xx, held_s_z, "s-", color="#4daf4a", label="signal residual")
    ax.axhline(0, color="black", lw=1)
    ax.set_xticks(xx, [f"{x:g}°" for x in test_deg])
    ax.set(title=f"Withheld transfer: RMS = {held_rms_z:.2f} σ", xlabel="withheld tilt", ylabel="prediction residual / noise σ")
    ax.grid(alpha=0.2); ax.legend(frameon=False, fontsize=8)

    fig.suptitle("Finite-slab inverse test (LOCAL:RAVEL sandbox)", fontsize=15)
    fig.savefig(OUT_SVG)
    fig.savefig(OUT_PNG, dpi=180)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
