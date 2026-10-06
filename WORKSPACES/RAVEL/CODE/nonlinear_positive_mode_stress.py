#!/usr/bin/env python3
"""Adversarial nonlinear audit of finite-core intersection tomography.

Sandbox-only.  The material density is an exponential Legendre family, hence
positive by construction.  We fit P1..P6 plus two endpoint supports under
correlated two-orientation noise, then test deliberately withheld P7..P10 on
independent thicknesses.
"""
from __future__ import annotations

import json
from dataclasses import dataclass

import numpy as np
from numpy.polynomial.legendre import leggauss, legvander
from scipy.linalg import solve_triangular
from scipy.optimize import least_squares
import matplotlib.pyplot as plt

RHO_P0 = 0.70
RHO_M0 = 1.30
RMAX = max(RHO_P0, RHO_M0)
SIGMA = 1.0e-4
AR_PHI = 0.60
CROSS_ORIENTATION = 0.25
NQ = 1400
N_FIT = 6
N_TRUE = 10
SUPPORT_PRIOR = 0.01
N_MC = 80
SEED = 202610060331

u, w = leggauss(NQ)
P = legvander(u, N_TRUE)[:, 1:]


def density(eta: np.ndarray) -> np.ndarray:
    q = P[:, : len(eta)] @ eta
    q -= np.max(q)
    raw = np.exp(q)
    return raw / np.dot(w, raw)


def moments(eta: np.ndarray, n: int = N_TRUE) -> np.ndarray:
    p = density(eta)
    return P[:, :n].T @ (w * p)


def eta_for_moments(target: np.ndarray) -> np.ndarray:
    n = len(target)
    # First-order exponential-family relation: eta_l ~ (2l+1)<P_l>.
    x0 = (2 * np.arange(1, n + 1) + 1) * target
    fit = least_squares(lambda x: moments(x, n) - target, x0=x0,
                        xtol=1e-13, ftol=1e-13, gtol=1e-13,
                        max_nfev=3000)
    if not fit.success or np.max(np.abs(moments(fit.x, n) - target)) > 2e-10:
        raise RuntimeError("failed to construct target positive density")
    return fit.x


def zmap(rp: float, rm: float) -> np.ndarray:
    return np.where(u >= 0.0, rp * u, rm * u)


def kernel_matrix(hs: np.ndarray, z: np.ndarray, support: float) -> np.ndarray:
    hh = hs[:, None]
    a = np.sqrt(np.maximum(hh - z[None, :], 0.0))
    b = np.sqrt(np.maximum(-hh - z[None, :], 0.0))
    return (a - b) / np.sqrt(hh + support)


def observe(hs: np.ndarray, rp: float, rm: float, eta: np.ndarray) -> np.ndarray:
    p = density(eta)
    z = zmap(rp, rm)
    plus = kernel_matrix(hs, z, rp) @ (w * p)
    minus = kernel_matrix(hs, -z, rm) @ (w * p)
    return np.r_[plus, minus]


def covariance(n: int) -> np.ndarray:
    idx = np.arange(n)
    ar = AR_PHI ** np.abs(idx[:, None] - idx[None, :])
    orient = np.array([[1.0, CROSS_ORIENTATION],
                       [CROSS_ORIENTATION, 1.0]])
    return SIGMA**2 * np.kron(orient, ar)


@dataclass
class FitResult:
    rp: float
    rm: float
    eta: np.ndarray
    pred_train: np.ndarray


def fit_model(hs: np.ndarray, y: np.ndarray, chol: np.ndarray) -> FitResult:
    def unpack(x: np.ndarray):
        return RHO_P0 * np.exp(x[0]), RHO_M0 * np.exp(x[1]), x[2:]

    def resid(x: np.ndarray) -> np.ndarray:
        rp, rm, eta = unpack(x)
        r = solve_triangular(chol, observe(hs, rp, rm, eta) - y,
                             lower=True, check_finite=False)
        return np.r_[r, x[0] / SUPPORT_PRIOR, x[1] / SUPPORT_PRIOR]

    ans = least_squares(resid, np.zeros(2 + N_FIT),
                        bounds=(np.r_[-0.20, -0.20, np.full(N_FIT, -1.0)],
                                np.r_[0.20, 0.20, np.full(N_FIT, 1.0)]),
                        xtol=1e-8, ftol=1e-8, gtol=1e-8,
                        max_nfev=1000)
    if not ans.success:
        raise RuntimeError(ans.message)
    rp, rm, eta = unpack(ans.x)
    return FitResult(rp, rm, eta, observe(hs, rp, rm, eta))


def ladder_metrics(name: str, hs: np.ndarray, eta_true: np.ndarray,
                   eta_withheld: np.ndarray, rng: np.random.Generator,
                   holdout_hs: np.ndarray) -> dict:
    n = len(hs)
    C = covariance(n)
    L = np.linalg.cholesky(C)
    C_hold = covariance(len(holdout_hs))
    L_hold = np.linalg.cholesky(C_hold)
    C_hold_inv = np.linalg.inv(C_hold)

    scenarios = {}
    raw = {}
    for label, eta_gen in (("in_model", eta_true),
                           ("withheld_P7_P10", eta_withheld)):
        y0 = observe(hs, RHO_P0, RHO_M0, eta_gen)
        yh0 = observe(holdout_hs, RHO_P0, RHO_M0, eta_gen)
        rec_m, rec_support, chisq = [], [], []
        convergence_failures = 0
        for _ in range(N_MC):
            y = y0 + L @ rng.standard_normal(2 * n)
            yh = yh0 + L_hold @ rng.standard_normal(2 * len(holdout_hs))
            try:
                fit = fit_model(hs, y, L)
            except RuntimeError:
                convergence_failures += 1
                continue
            # Fit family has only six modes; pad zeros for the common evaluator.
            eta_pad = np.r_[fit.eta, np.zeros(N_TRUE - N_FIT)]
            rec_m.append(moments(eta_pad, N_FIT))
            rec_support.append([fit.rp, fit.rm])
            rh = yh - observe(holdout_hs, fit.rp, fit.rm, fit.eta)
            chisq.append(float(rh @ C_hold_inv @ rh))
        rec_m = np.asarray(rec_m)
        rec_support = np.asarray(rec_support)
        chisq = np.asarray(chisq)
        truth_m = moments(eta_gen, N_FIT)
        mode_bias = rec_m.mean(axis=0) - truth_m
        mode_sd = rec_m.std(axis=0, ddof=1)
        support_frac_bias = rec_support.mean(axis=0) / np.array([RHO_P0, RHO_M0]) - 1
        scenarios[label] = {
            "n_success": int(len(chisq)),
            "convergence_failures": int(convergence_failures),
            "mode_truth_P1_P6": truth_m.tolist(),
            "mode_mean": rec_m.mean(axis=0).tolist(),
            "mode_bias": mode_bias.tolist(),
            "mode_empirical_sd": mode_sd.tolist(),
            "mode_empirical_snr": (np.abs(truth_m) / mode_sd).tolist(),
            "support_mean": rec_support.mean(axis=0).tolist(),
            "support_fractional_bias": support_frac_bias.tolist(),
            "holdout_chisq_mean": float(chisq.mean()),
            "holdout_chisq_median": float(np.median(chisq)),
        }
        raw[label] = chisq

    # A blind lack-of-fit gate: calibrate 95% threshold on the in-model trials,
    # then apply it unchanged to the withheld-mode trials.
    threshold = float(np.quantile(raw["in_model"], 0.95))
    scenarios["in_model"]["holdout_reject_rate_at_calibrated_5pct"] = float(
        np.mean(raw["in_model"] > threshold))
    scenarios["withheld_P7_P10"]["holdout_reject_rate_at_calibrated_5pct"] = float(
        np.mean(raw["withheld_P7_P10"] > threshold))
    scenarios["calibrated_holdout_chisq_threshold"] = threshold
    return {"name": name, "h_over_rho_max": (hs / RMAX).tolist(),
            "min_adjacent_ratio": float(np.min(hs[1:] / hs[:-1])),
            "scenarios": scenarios,
            "raw_holdout_chisq": {k: v.tolist() for k, v in raw.items()}}


def main() -> None:
    rng = np.random.default_rng(SEED)
    low_target = np.array([0.01, -0.01, 0.01, -0.01, 0.01, -0.01])
    eta_low = eta_for_moments(low_target)
    full_target = np.r_[low_target, [0.003, -0.003, 0.003, -0.003]]
    eta_full = eta_for_moments(full_target)

    clustered = RMAX * np.array([
        0.1838, 0.1923, 0.2012, 0.2106, 0.3795, 0.3971, 0.4155, 0.4761,
        0.4981, 0.5212, 0.5971, 0.7158, 0.7490, 0.9394, 0.9830, 1.029,
    ])
    # Same count and crossover emphasis, but a mechanically enforceable >15%
    # log-spacing rule.  This is not reoptimized to the injected truth.
    spaced = RMAX * np.geomspace(0.14, 1.55, 16)
    holdout = RMAX * np.geomspace(0.055, 3.2, 24)

    results = {
        "status": "sandbox candidate; not canonical theory",
        "fixture": {
            "rho_plus": RHO_P0, "rho_minus": RHO_M0,
            "sigma": SIGMA, "ar1_phi": AR_PHI,
            "cross_orientation_correlation": CROSS_ORIENTATION,
            "support_prior_fractional_std": SUPPORT_PRIOR,
            "quadrature_nodes": NQ, "mc_trials_per_scenario": N_MC,
            "fitted_family": "positive exponential Legendre P1..P6",
            "withheld_truth": "positive exponential Legendre P7..P10",
            "holdout_count_per_orientation": len(holdout),
        },
        "target_moments": {
            "in_model": moments(eta_low, N_TRUE).tolist(),
            "withheld": moments(eta_full, N_TRUE).tolist(),
        },
        "ladders": {},
    }
    for name, hs in (("clustered_prior_D_opt", clustered),
                     ("spaced_crossover", spaced)):
        block = ladder_metrics(name, hs, eta_low, eta_full, rng, holdout)
        results["ladders"][name] = block

    # Remove raw arrays from JSON summary after using them in the plot.
    fig, axes = plt.subplots(1, 2, figsize=(10.2, 4.2))
    for name, block in results["ladders"].items():
        raw = block["raw_holdout_chisq"]
        axes[0].hist(raw["in_model"], bins=18, alpha=.45,
                     label=name.replace("_", " ") + " / in-model")
        axes[0].hist(raw["withheld_P7_P10"], bins=18, histtype="step", lw=2,
                     label=name.replace("_", " ") + " / withheld")
        sc = block["scenarios"]
        axes[1].plot(np.arange(1, 7),
                     sc["in_model"]["mode_empirical_snr"], "o-",
                     label=name.replace("_", " "))
        del block["raw_holdout_chisq"]
    axes[0].set(xlabel="holdout generalized chi-square", ylabel="Monte Carlo count",
                title="Withheld modes produce lack-of-fit")
    axes[0].legend(fontsize=7)
    axes[1].axhline(5, color="k", ls="--", lw=1, label="5 sigma gate")
    axes[1].set(xlabel="fitted Legendre moment", ylabel="empirical recovery SNR",
                title="Joint 1% mode recovery")
    axes[1].grid(alpha=.25); axes[1].legend(fontsize=8)
    fig.tight_layout()
    fig.savefig("nonlinear_positive_mode_stress.svg")
    fig.savefig("nonlinear_positive_mode_stress.png", dpi=180)

    with open("nonlinear_positive_mode_stress.json", "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2)

    for name, block in results["ladders"].items():
        a = block["scenarios"]["in_model"]
        b = block["scenarios"]["withheld_P7_P10"]
        print(name)
        print("  min ratio", f'{block["min_adjacent_ratio"]:.4f}')
        print("  in-model SNR", " ".join(f"{x:.2f}" for x in a["mode_empirical_snr"]))
        print("  in-model support bias %", " ".join(f"{100*x:.3f}" for x in a["support_fractional_bias"]))
        print("  withheld support bias %", " ".join(f"{100*x:.3f}" for x in b["support_fractional_bias"]))
        print("  withheld holdout reject power", f'{b["holdout_reject_rate_at_calibrated_5pct"]:.3f}')


if __name__ == "__main__":
    main()
