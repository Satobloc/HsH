#!/usr/bin/env python3
"""Blind transverse-profile transfer test for finite-core/slab readout.

Three connected cores share the same support radius but differ in the
one-dimensional marginal seen by a flat resolving slab:

* B3 bulk ball: parabolic marginal;
* B2 material disk: semicircle marginal;
* S2 boundary shell: uniform marginal.

Widths are fitted only from a sparse high-tilt resolver.  Core type is then
selected on a withheld dense contact sweep.  This is a local synthetic
geometry test, not an empirical particle model.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import least_squares


OUT_JSON = Path("finite_core_profile_transfer.json")
OUT_SVG = Path("finite_core_profile_transfer.svg")
OUT_PNG = Path("finite_core_profile_transfer.png")

R_LOOP = 1.0
TRUE_D = 0.08
TRUE_RC = 0.06
SIGMA_F = 6.0e-4
SIGMA_S = 3.0e-4
SEED = 20261007
PROFILES = ("B3_bulk", "B2_disk", "S2_shell")
PHASE = np.linspace(0.0, 2.0 * np.pi, 32768, endpoint=False)


def marginal_cdf(x: np.ndarray, r: float, profile: str) -> np.ndarray:
    """CDF of the normal-coordinate marginal for a declared transverse core."""
    x = np.asarray(x, dtype=float)
    if r <= 0:
        return (x >= 0.0).astype(float)
    y = np.clip(x / r, -1.0, 1.0)
    if profile == "B3_bulk":
        inside = 0.5 + 0.75 * y - 0.25 * y**3
    elif profile == "B2_disk":
        inside = 0.5 + (y * np.sqrt(np.maximum(0.0, 1.0 - y**2)) + np.arcsin(y)) / np.pi
    elif profile == "S2_shell":
        inside = 0.5 + 0.5 * y
    else:
        raise ValueError(profile)
    return np.where(x <= -r, 0.0, np.where(x >= r, 1.0, inside))


def overlap_weight(u: np.ndarray, d_slab: float, r_core: float, profile: str) -> np.ndarray:
    """Fraction of core marginal inside the slab |z+u| <= d_slab/2."""
    lo = -0.5 * d_slab - u
    hi = +0.5 * d_slab - u
    return marginal_cdf(hi, r_core, profile) - marginal_cdf(lo, r_core, profile)


def incidence_fraction(theta: np.ndarray, d_slab: float, r_core: float) -> np.ndarray:
    theta = np.atleast_1d(theta)
    a_eff = 0.5 * d_slab + r_core
    amp = R_LOOP * np.abs(np.sin(theta))
    kappa = np.divide(a_eff, amp, out=np.full_like(amp, np.inf), where=amp > 0)
    return np.where(kappa >= 1.0, 1.0, 2.0 * np.arcsin(np.clip(kappa, 0.0, 1.0)) / np.pi)


def predict(theta: np.ndarray, d_slab: float, r_core: float, profile: str) -> tuple[np.ndarray, np.ndarray]:
    theta = np.atleast_1d(theta)
    f = incidence_fraction(theta, d_slab, r_core)
    u = R_LOOP * np.sin(theta[:, None]) * np.sin(PHASE[None, :])
    s = np.mean(overlap_weight(u, d_slab, r_core, profile), axis=1)
    return f, s


def fit_profile(theta: np.ndarray, f_obs: np.ndarray, s_obs: np.ndarray, profile: str) -> dict:
    def residual(logp: np.ndarray) -> np.ndarray:
        d_slab, r_core = np.exp(logp)
        f, s = predict(theta, d_slab, r_core, profile)
        return np.r_[(f - f_obs) / SIGMA_F, (s - s_obs) / SIGMA_S]

    starts = ((0.03, 0.03), (0.05, 0.09), (0.09, 0.05), (0.14, 0.10))
    sols = [
        least_squares(
            residual,
            np.log(start),
            bounds=(np.log([0.005, 0.005]), np.log([0.25, 0.20])),
            xtol=1e-12,
            ftol=1e-12,
            gtol=1e-12,
            max_nfev=800,
        )
        for start in starts
    ]
    best = min(sols, key=lambda sol: 2.0 * sol.cost)
    pars = np.exp(best.x)
    return {
        "profile": profile,
        "dSigma": float(pars[0]),
        "rCore": float(pars[1]),
        "chi2_train": float(2.0 * best.cost),
        "max_multistart_spread": float(np.max(np.ptp(np.array([np.exp(sol.x) for sol in sols]), axis=0))),
        "success_all_starts": bool(all(sol.success for sol in sols)),
    }


def main() -> None:
    rng = np.random.default_rng(SEED)
    hidden_profile = str(rng.choice(PROFILES))
    train_deg = np.array([20.0, 35.0, 55.0, 80.0])
    contact_deg = np.r_[np.linspace(5.76, 9.0, 28), np.linspace(9.5, 18.0, 18)]
    train_theta = np.deg2rad(train_deg)
    contact_theta = np.deg2rad(contact_deg)

    f_train_true, s_train_true = predict(train_theta, TRUE_D, TRUE_RC, hidden_profile)
    f_train_obs = f_train_true + rng.normal(0.0, SIGMA_F, size=train_deg.size)
    s_train_obs = s_train_true + rng.normal(0.0, SIGMA_S, size=train_deg.size)
    f_contact_true, s_contact_true = predict(contact_theta, TRUE_D, TRUE_RC, hidden_profile)

    fits = []
    for profile in PROFILES:
        fit = fit_profile(train_theta, f_train_obs, s_train_obs, profile)
        f_test, s_test = predict(contact_theta, fit["dSigma"], fit["rCore"], profile)
        zf = (f_test - f_contact_true) / SIGMA_F
        zs = (s_test - s_contact_true) / SIGMA_S
        fit.update(
            {
                "relative_d_error": float((fit["dSigma"] - TRUE_D) / TRUE_D),
                "relative_rc_error": float((fit["rCore"] - TRUE_RC) / TRUE_RC),
                "contact_rms_z": float(np.sqrt(np.mean(np.r_[zf, zs] ** 2))),
                "contact_signal_rms_z": float(np.sqrt(np.mean(zs**2))),
                "contact_max_abs_signal_z": float(np.max(np.abs(zs))),
            }
        )
        fits.append(fit)

    chosen_train = min(fits, key=lambda x: x["chi2_train"])["profile"]
    chosen_contact = min(fits, key=lambda x: x["contact_rms_z"])["profile"]

    # Verify the profile-independent high-tilt area law numerically.
    asym = TRUE_D / (np.pi * R_LOOP)
    asym_rows = {}
    for profile in PROFILES:
        _, s90 = predict(np.deg2rad([90.0]), TRUE_D, TRUE_RC, profile)
        asym_rows[profile] = {
            "S90": float(s90[0]),
            "d_over_pi_R": float(asym),
            "relative_difference": float((s90[0] - asym) / asym),
        }

    result = {
        "status": "GEN/CANDIDATE synthetic profile-transfer discriminator",
        "seed": SEED,
        "hidden_profile": hidden_profile,
        "true_widths": {"dSigma": TRUE_D, "rCore": TRUE_RC, "aEff": TRUE_D / 2.0 + TRUE_RC},
        "training_tilts_deg": train_deg.tolist(),
        "withheld_contact_tilts_deg": contact_deg.tolist(),
        "noise_scales": {"sigma_f": SIGMA_F, "sigma_S": SIGMA_S},
        "fits": fits,
        "selected_by_sparse_training": chosen_train,
        "selected_by_dense_contact_transfer": chosen_contact,
        "high_tilt_universal_area_law": asym_rows,
        "registered_gate": "profile passes only if width errors <10%, withheld contact-signal RMS <2 sigma, and all multistarts agree within 1e-5; binary support is reported but excluded because its square-root onset is ill-conditioned",
    }
    for fit in result["fits"]:
        fit["gate_passed"] = bool(
            abs(fit["relative_d_error"]) < 0.10
            and abs(fit["relative_rc_error"]) < 0.10
            and fit["contact_signal_rms_z"] < 2.0
            and fit["max_multistart_spread"] < 1e-5
        )

    OUT_JSON.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")

    dense_deg = np.linspace(5.74, 90.0, 500)
    dense_theta = np.deg2rad(dense_deg)
    fig, axes = plt.subplots(2, 2, figsize=(12.8, 8.8), constrained_layout=True)

    ax = axes[0, 0]
    for profile, color in zip(PROFILES, ("#1b9e77", "#7570b3", "#d95f02")):
        _, s = predict(dense_theta, TRUE_D, TRUE_RC, profile)
        ax.plot(dense_deg, s, lw=2.1, color=color, label=profile)
    ax.axvspan(contact_deg.min(), contact_deg.max(), color="0.92", label="withheld contact sweep")
    ax.scatter(train_deg, s_train_obs, color="black", zorder=5, label="sparse training")
    ax.set(title="Same widths, different transverse profiles", xlabel="tilt (degrees)", ylabel="weighted signal")
    ax.grid(alpha=0.2); ax.legend(frameon=False, fontsize=8)

    ax = axes[0, 1]
    x = np.arange(len(PROFILES)); width = 0.36
    ax.bar(x - width/2, [f["chi2_train"] for f in fits], width, color="#66c2a5", label="training chi-square")
    ax.bar(x + width/2, [f["contact_signal_rms_z"] for f in fits], width, color="#fc8d62", label="contact-signal RMS / sigma")
    ax.set_xticks(x, PROFILES, rotation=15)
    ax.set_yscale("log")
    ax.set(title="Sparse fit versus withheld transfer", ylabel="diagnostic value (log scale)")
    ax.grid(alpha=0.2, axis="y"); ax.legend(frameon=False, fontsize=8)

    ax = axes[1, 0]
    ax.axhspan(-2, 2, color="0.92", label="±2 sigma")
    for fit, color in zip(fits, ("#1b9e77", "#7570b3", "#d95f02")):
        _, s = predict(contact_theta, fit["dSigma"], fit["rCore"], fit["profile"])
        ax.plot(contact_deg, (s - s_contact_true) / SIGMA_S, lw=2.0, color=color, label=fit["profile"])
    ax.axhline(0, color="black", lw=1)
    ax.set(title=f"Withheld contact residuals (hidden: {hidden_profile})", xlabel="tilt (degrees)", ylabel="signal residual / sigma")
    ax.grid(alpha=0.2); ax.legend(frameon=False, fontsize=8)

    ax = axes[1, 1]
    for fit, color, marker in zip(fits, ("#1b9e77", "#7570b3", "#d95f02"), ("o", "s", "^")):
        ax.scatter(fit["dSigma"], fit["rCore"], s=110, color=color, marker=marker, label=fit["profile"])
    ax.scatter(TRUE_D, TRUE_RC, s=180, marker="*", color="black", label="hidden widths")
    ax.set(title="Widths inferred from sparse high-tilt data", xlabel=r"slab thickness $d_\Sigma$", ylabel=r"support radius $r_c$")
    ax.grid(alpha=0.2); ax.legend(frameon=False, fontsize=8)

    fig.suptitle("Finite-core profile transfer test (LOCAL:RAVEL sandbox)", fontsize=15)
    fig.savefig(OUT_SVG)
    fig.savefig(OUT_PNG, dpi=180)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
