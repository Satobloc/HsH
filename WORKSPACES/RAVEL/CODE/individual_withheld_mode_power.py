#!/usr/bin/env python3
"""Power boundary for individual positive-density worldtube modes.

Sandbox-only.  The fitted readout contains P1..P6 plus two endpoint supports.
For each ell=7..10, a positive exponential-Legendre truth is constructed that
holds every moment below ell at its baseline value and changes only m_ell by a
signed amount.  A blind, independently calibrated holdout chi-square tests
whether that omitted channel is detectable.
"""
from __future__ import annotations

import json
from dataclasses import dataclass

import matplotlib.pyplot as plt
import numpy as np
from numpy.polynomial.legendre import leggauss, legvander
from scipy.linalg import solve_triangular
from scipy.optimize import least_squares

RHO_P0, RHO_M0 = 0.70, 1.30
RMAX = max(RHO_P0, RHO_M0)
SIGMA = 1.0e-4
AR_PHI = 0.60
CROSS_ORIENTATION = 0.25
SUPPORT_PRIOR = 0.01
N_FIT, N_TRUE = 6, 10
NQ = 900
N_NULL = 120
N_MC = 48
SEED = 202610060635
AMPLITUDES = np.array([0.0015, 0.0020, 0.0025, 0.0030, 0.0035, 0.0040])

u, w = leggauss(NQ)
P = legvander(u, N_TRUE)[:, 1:]


def density(eta: np.ndarray) -> np.ndarray:
    q = P[:, :len(eta)] @ eta
    q -= np.max(q)
    raw = np.exp(q)
    return raw / np.dot(w, raw)


def moments(eta: np.ndarray, n: int = N_TRUE) -> np.ndarray:
    return P[:, :n].T @ (w * density(eta))


def eta_for_moments(target: np.ndarray) -> np.ndarray:
    n = len(target)
    x0 = (2*np.arange(1, n+1)+1)*target
    ans = least_squares(lambda x: moments(x, n)-target, x0=x0,
                        xtol=2e-13, ftol=2e-13, gtol=2e-13,
                        max_nfev=4000)
    err = np.max(np.abs(moments(ans.x, n)-target))
    if (not ans.success) or err > 3e-10:
        raise RuntimeError(f"moment construction failed: {ans.message}; {err=}")
    return ans.x


def individual_truth(base_moments: np.ndarray, ell: int, delta: float) -> np.ndarray:
    target = base_moments[:ell].copy()
    target[ell-1] += delta
    return eta_for_moments(target)


def zmap(rp: float, rm: float) -> np.ndarray:
    return np.where(u >= 0, rp*u, rm*u)


def kernel_matrix(hs: np.ndarray, z: np.ndarray, support: float) -> np.ndarray:
    hh = hs[:, None]
    return (np.sqrt(np.maximum(hh-z[None, :], 0.0))
            - np.sqrt(np.maximum(-hh-z[None, :], 0.0))) / np.sqrt(hh+support)


def observe(hs: np.ndarray, rp: float, rm: float, eta: np.ndarray) -> np.ndarray:
    p = density(eta)
    z = zmap(rp, rm)
    return np.r_[kernel_matrix(hs, z, rp) @ (w*p),
                 kernel_matrix(hs, -z, rm) @ (w*p)]


def covariance(n: int) -> np.ndarray:
    idx = np.arange(n)
    ar = AR_PHI ** np.abs(idx[:, None]-idx[None, :])
    orient = np.array([[1.0, CROSS_ORIENTATION],
                       [CROSS_ORIENTATION, 1.0]])
    return SIGMA**2*np.kron(orient, ar)


@dataclass
class FitResult:
    x: np.ndarray
    rp: float
    rm: float
    eta: np.ndarray
    cost: float
    retries: int


def fit_model(hs: np.ndarray, y: np.ndarray, chol: np.ndarray) -> FitResult:
    lo = np.r_[-.20, -.20, np.full(N_FIT, -1.0)]
    hi = np.r_[ .20,  .20, np.full(N_FIT,  1.0)]

    def unpack(x):
        return RHO_P0*np.exp(x[0]), RHO_M0*np.exp(x[1]), x[2:]

    def residual(x):
        rp, rm, eta = unpack(x)
        r = solve_triangular(chol, observe(hs, rp, rm, eta)-y,
                             lower=True, check_finite=False)
        return np.r_[r, x[0]/SUPPORT_PRIOR, x[1]/SUPPORT_PRIOR]

    # The first start is neutral.  Extra starts are fixed in advance and are
    # used only if needed; none contains the injected omitted-mode truth.
    starts = [np.zeros(2+N_FIT),
              np.r_[.01, -.01, [.03, -.03, .03, -.03, .03, -.03]],
              np.r_[-.01, .01, [-.03, .03, -.03, .03, -.03, .03]]]
    candidates = []
    for retry, start in enumerate(starts):
        ans = least_squares(residual, start, bounds=(lo, hi), x_scale="jac",
                            xtol=2e-8, ftol=2e-8, gtol=2e-8,
                            max_nfev=1800)
        if np.all(np.isfinite(ans.x)):
            candidates.append((bool(ans.success), float(ans.cost), retry, ans))
        if ans.success:
            break
    good = [z for z in candidates if z[0]]
    if not good:
        raise RuntimeError("all fixed multistarts failed")
    _, cost, retry, ans = min(good, key=lambda z: z[1])
    rp, rm, eta = unpack(ans.x)
    return FitResult(ans.x, rp, rm, eta, cost, retry)


def wilson(k: int, n: int, z: float = 1.959964) -> tuple[float, float]:
    p = k/n
    den = 1+z*z/n
    center = (p+z*z/(2*n))/den
    half = z*np.sqrt(p*(1-p)/n+z*z/(4*n*n))/den
    return center-half, center+half


def boundary(amplitudes: np.ndarray, powers: np.ndarray, target=.80):
    # Monotone envelope avoids claiming a reversed boundary from MC jitter.
    mono = np.maximum.accumulate(powers)
    hit = np.flatnonzero(mono >= target)
    if not len(hit):
        return None, mono
    j = int(hit[0])
    if j == 0:
        return float(amplitudes[0]), mono
    x0, x1 = amplitudes[j-1:j+1]
    y0, y1 = mono[j-1:j+1]
    if y1 == y0:
        return float(x1), mono
    return float(x0+(target-y0)*(x1-x0)/(y1-y0)), mono


def main() -> None:
    global u, w, P
    rng = np.random.default_rng(SEED)
    train_h = RMAX*np.geomspace(.14, 1.55, 16)
    hold_h = RMAX*np.geomspace(.055, 3.20, 24)
    L = np.linalg.cholesky(covariance(len(train_h)))
    Lh = np.linalg.cholesky(covariance(len(hold_h)))
    Ch_inv = np.linalg.inv(covariance(len(hold_h)))

    low_target = np.array([.01, -.01, .01, -.01, .01, -.01])
    eta_low = eta_for_moments(low_target)
    eta_base = np.r_[eta_low, np.zeros(N_TRUE-N_FIT)]
    base_m = moments(eta_base, N_TRUE)
    y0 = observe(train_h, RHO_P0, RHO_M0, eta_base)
    yh0 = observe(hold_h, RHO_P0, RHO_M0, eta_base)

    null_chi, null_retries, null_fail = [], 0, 0
    for _ in range(N_NULL):
        try:
            f = fit_model(train_h, y0+L@rng.standard_normal(2*len(train_h)), L)
        except RuntimeError:
            null_fail += 1
            continue
        null_retries += f.retries
        rh = yh0+Lh@rng.standard_normal(2*len(hold_h)) \
             - observe(hold_h, f.rp, f.rm, f.eta)
        null_chi.append(float(rh@Ch_inv@rh))
    if null_fail:
        raise RuntimeError(f"unresolved null optimizer failures: {null_fail}")
    threshold = float(np.quantile(null_chi, .95))

    rows = []
    truth_meta = {}
    unresolved = 0
    total_retries = null_retries
    # Common random numbers across amplitudes within each ell/sign block.
    for ell in range(7, 11):
        for sign in (-1, 1):
            train_noise = [L@rng.standard_normal(2*len(train_h)) for _ in range(N_MC)]
            hold_noise = [Lh@rng.standard_normal(2*len(hold_h)) for _ in range(N_MC)]
            for amp in AMPLITUDES:
                eta_t = individual_truth(base_m, ell, sign*amp)
                mt = moments(eta_t, N_TRUE)
                key = f"P{ell}_{'plus' if sign > 0 else 'minus'}_{amp:.4f}"
                truth_meta[key] = {
                    "eta": eta_t.tolist(),
                    "moments": mt.tolist(),
                    "max_abs_drift_below_injected_mode": float(
                        np.max(np.abs(mt[:ell-1]-base_m[:ell-1]))),
                    "actual_injected_delta": float(mt[ell-1]-base_m[ell-1]),
                }
                yt = observe(train_h, RHO_P0, RHO_M0, eta_t)
                yht = observe(hold_h, RHO_P0, RHO_M0, eta_t)
                rejects, chis, retries = 0, [], 0
                for nt, nh in zip(train_noise, hold_noise):
                    try:
                        f = fit_model(train_h, yt+nt, L)
                    except RuntimeError:
                        unresolved += 1
                        continue
                    retries += f.retries
                    rh = yht+nh-observe(hold_h, f.rp, f.rm, f.eta)
                    chi = float(rh@Ch_inv@rh)
                    chis.append(chi)
                    rejects += chi > threshold
                if len(chis) != N_MC:
                    raise RuntimeError("unresolved alternative optimizer failure")
                total_retries += retries
                lo, hi = wilson(rejects, N_MC)
                rows.append({
                    "mode": ell, "sign": sign, "amplitude": float(amp),
                    "reject_count": int(rejects), "n": N_MC,
                    "power": rejects/N_MC, "wilson95": [lo, hi],
                    "median_holdout_chisq": float(np.median(chis)),
                    "mean_holdout_chisq": float(np.mean(chis)),
                    "optimizer_retries": int(retries),
                })
                print(f"P{ell} {sign:+d} {amp:.4f} power={rejects/N_MC:.3f}", flush=True)

    bounds = []
    for ell in range(7, 11):
        for sign in (-1, 1):
            sel = [r for r in rows if r["mode"] == ell and r["sign"] == sign]
            powers = np.array([r["power"] for r in sel])
            b, mono = boundary(AMPLITUDES, powers)
            bounds.append({"mode": ell, "sign": sign,
                           "interpolated_80pct_amplitude": b,
                           "monotone_power_envelope": mono.tolist()})

    # A forward-only quadrature check at the strongest injection.  This tests
    # integration error without refitting or changing the reported boundary.
    coarse = {"u": u, "w": w, "P": P}
    predictions_900 = {}
    for ell in range(7, 11):
        for sign in (-1, 1):
            et = individual_truth(base_m, ell, sign*AMPLITUDES[-1])
            predictions_900[(ell, sign)] = observe(hold_h, RHO_P0, RHO_M0, et)
    u, w = leggauss(1800)
    P = legvander(u, N_TRUE)[:, 1:]
    quad = []
    for ell in range(7, 11):
        for sign in (-1, 1):
            # Reconstruct the same target moments under refined quadrature.
            base_ref = moments(np.r_[eta_low, np.zeros(4)], N_TRUE)
            et = individual_truth(base_ref, ell, sign*AMPLITUDES[-1])
            refined = observe(hold_h, RHO_P0, RHO_M0, et)
            d = (refined-predictions_900[(ell, sign)])/SIGMA
            quad.append({"mode": ell, "sign": sign,
                         "rms_forward_difference_sigma": float(np.sqrt(np.mean(d*d))),
                         "max_forward_difference_sigma": float(np.max(np.abs(d)))})
    u, w, P = coarse["u"], coarse["w"], coarse["P"]

    out = {
        "status": "sandbox candidate; not canonical theory",
        "construction": "hold moments below ell fixed; inject only signed delta m_ell",
        "fixture": {"rho_plus": RHO_P0, "rho_minus": RHO_M0,
                    "sigma": SIGMA, "ar1_phi": AR_PHI,
                    "cross_orientation_correlation": CROSS_ORIENTATION,
                    "support_prior_fractional_std": SUPPORT_PRIOR,
                    "fit_modes": "P1..P6", "tested_modes": "P7..P10",
                    "quadrature_nodes": NQ, "null_trials": N_NULL,
                    "trials_per_mode_sign_amplitude": N_MC,
                    "amplitudes": AMPLITUDES.tolist(),
                    "train_h_over_rmax": (train_h/RMAX).tolist(),
                    "holdout_h_over_rmax": (hold_h/RMAX).tolist()},
        "baseline_moments": base_m.tolist(),
        "calibration": {"holdout_chisq_95pct_threshold": threshold,
                        "null_chisq": null_chi,
                        "empirical_false_alarm": float(np.mean(np.array(null_chi)>threshold))},
        "rows": rows, "boundaries": bounds,
        "truth_construction_audit": truth_meta,
        "optimizer": {"unresolved_failures": unresolved,
                      "fixed_multistart_retries_used": int(total_retries)},
        "quadrature_900_to_1800_forward_check": quad,
    }
    with open("individual_withheld_mode_power.json", "w", encoding="utf-8") as f:
        json.dump(out, f, indent=2)

    fig, axes = plt.subplots(2, 2, figsize=(9.4, 7.2), sharex=True, sharey=True)
    for ax, ell in zip(axes.flat, range(7, 11)):
        for sign, marker in [(-1, "o"), (1, "s")]:
            sel = [r for r in rows if r["mode"] == ell and r["sign"] == sign]
            y = np.array([r["power"] for r in sel])
            lo = np.array([r["wilson95"][0] for r in sel])
            hi = np.array([r["wilson95"][1] for r in sel])
            ax.errorbar(100*AMPLITUDES, y, yerr=[y-lo, hi-y], marker=marker,
                        capsize=2.5, label=f"{'+' if sign > 0 else '-'}P{ell}")
        ax.axhline(.8, color="k", lw=1, ls="--")
        ax.set_title(f"Withheld mode P{ell}")
        ax.grid(alpha=.25); ax.legend(fontsize=8)
    for ax in axes[-1]: ax.set_xlabel("injected moment amplitude (%)")
    for ax in axes[:, 0]: ax.set_ylabel("holdout rejection probability")
    fig.suptitle("Individual omitted-mode detection (95% Wilson intervals)")
    fig.tight_layout()
    fig.savefig("individual_withheld_mode_power.svg")
    fig.savefig("individual_withheld_mode_power.png", dpi=180)

    print("threshold", threshold)
    print("boundaries", [(b["mode"], b["sign"], b["interpolated_80pct_amplitude"])
                         for b in bounds])
    print("optimizer", out["optimizer"])
    print("quadrature max sigma", max(q["max_forward_difference_sigma"] for q in quad))


if __name__ == "__main__":
    main()
