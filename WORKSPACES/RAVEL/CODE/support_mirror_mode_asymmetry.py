#!/usr/bin/env python3
"""Support-swap audit of omitted-mode sign asymmetry.

Sandbox-only.  Tests the exact mirror covariance expected from the two-ended
finite-core readout and separates it from intrinsic nonlinear sign response.
"""
from __future__ import annotations

import json
from dataclasses import dataclass

import matplotlib.pyplot as plt
import numpy as np
from numpy.polynomial.legendre import leggauss, legvander
from scipy.linalg import solve_triangular
from scipy.optimize import least_squares

SIGMA = 1e-4
AR_PHI = .60
CROSS = .25
SUPPORT_PRIOR = .01
NQ, N_FIT, N_TRUE = 600, 6, 10
N_NULL, N_MC = 96, 96
SEED = 202610060737
AMPS = np.array([.0005, .0010, .0015, .0020, .0025, .0030, .0035])
MC_AMP = .0025
HREF = 1.30

u, w = leggauss(NQ)
P = legvander(u, N_TRUE)[:, 1:]
un, wn = leggauss(128)
Pn = legvander(un, N_TRUE)[:, 1:]
CONTACT_ORDER = 16
_rule_cache = {q: leggauss(q) for q in (CONTACT_ORDER, 2*CONTACT_ORDER)}


def density(eta):
    q = P[:, :len(eta)] @ eta
    q -= np.max(q)
    raw = np.exp(q)
    return raw / np.dot(w, raw)


def moments(eta, n=N_TRUE):
    return P[:, :n].T @ (w*density(eta))


def eta_for_moments(target):
    n = len(target)
    x0 = (2*np.arange(1, n+1)+1)*target
    ans = least_squares(lambda x: moments(x, n)-target, x0,
                        xtol=2e-13, ftol=2e-13, gtol=2e-13,
                        max_nfev=4000)
    err = np.max(np.abs(moments(ans.x, n)-target))
    if not ans.success or err > 3e-10:
        raise RuntimeError(f"moment construction failed: {err}")
    return ans.x


def individual_truth(base_m, ell, delta):
    target = base_m[:ell].copy()
    target[ell-1] += delta
    return eta_for_moments(target)


def density_at(x, eta):
    qn = Pn[:, :len(eta)] @ eta
    shift = float(np.max(qn))
    norm = np.dot(wn, np.exp(qn-shift))
    px = legvander(x, N_TRUE)[:, 1:len(eta)+1]
    return np.exp(px@eta-shift)/norm


def composite_rule(hs, rp, rm, order):
    # Split at every square-root branch point for both orientations.  Fixed
    # Gauss-Legendre rules then see a smooth integrand on every subinterval.
    cuts = [-1., 0., 1.]
    for h in hs:
        for support in (rp, rm):
            x = float(h/support)
            if 0 < x < 1:
                cuts.extend([-x, x])
    cuts = np.unique(np.round(cuts, 15))
    qx, qw = _rule_cache[order]
    nodes, weights = [], []
    for a, b in zip(cuts[:-1], cuts[1:]):
        nodes.append((a+b)/2+(b-a)*qx/2)
        weights.append((b-a)*qw/2)
    return np.concatenate(nodes), np.concatenate(weights)


def kernel(hs, z, support):
    hh = hs[:, None]
    return (np.sqrt(np.maximum(hh-z[None, :], 0))
            - np.sqrt(np.maximum(-hh-z[None, :], 0))) / np.sqrt(hh+support)


def observe(hs, rp, rm, eta, qorder=CONTACT_ORDER):
    uq, wq = composite_rule(hs, rp, rm, qorder)
    p = density_at(uq, eta)
    z = np.where(uq >= 0, rp*uq, rm*uq)
    return np.r_[kernel(hs, z, rp) @ (wq*p),
                 kernel(hs, -z, rm) @ (wq*p)]


def covariance(n):
    idx = np.arange(n)
    ar = AR_PHI**np.abs(idx[:, None]-idx[None, :])
    return SIGMA**2*np.kron([[1, CROSS], [CROSS, 1]], ar)


@dataclass
class Fit:
    rp: float
    rm: float
    eta: np.ndarray
    retries: int


def fit_model(hs, y, chol, rp0, rm0, eta0, strict_multistart=False,
              qorder=CONTACT_ORDER):
    lo = np.r_[-.2, -.2, np.full(N_FIT, -1.)]
    hi = np.r_[ .2,  .2, np.full(N_FIT,  1.)]

    def unpack(x):
        return rp0*np.exp(x[0]), rm0*np.exp(x[1]), x[2:]

    def residual(x):
        rp, rm, eta = unpack(x)
        r = solve_triangular(chol, observe(hs, rp, rm, eta, qorder)-y,
                             lower=True, check_finite=False)
        return np.r_[r, x[0]/SUPPORT_PRIOR, x[1]/SUPPORT_PRIOR]

    # Null-family continuation is the primary start.  It contains no omitted
    # mode information and transforms covariantly under mirror reversal.
    starts = [np.r_[0., 0., eta0], np.zeros(2+N_FIT),
              np.r_[.01, -.01, [.03, -.03, .03, -.03, .03, -.03]],
              np.r_[-.01, .01, [-.03, .03, -.03, .03, -.03, .03]]]
    good = []
    for retry, start in enumerate(starts):
        ans = least_squares(residual, start, bounds=(lo, hi), x_scale="jac",
                            xtol=2e-8, ftol=2e-8, gtol=2e-8,
                            max_nfev=1800)
        if ans.success:
            good.append((ans.cost, retry, ans.x))
            if not strict_multistart:
                break
    if not good:
        raise RuntimeError("all fixed starts failed")
    _, retry, x = min(good)
    rp, rm, eta = unpack(x)
    return Fit(rp, rm, eta, retry)


def swap_orient(v):
    n = len(v)//2
    return np.r_[v[n:], v[:n]]


def wilson(k, n, z=1.959964):
    p = k/n; den = 1+z*z/n
    center = (p+z*z/(2*n))/den
    half = z*np.sqrt(p*(1-p)/n+z*z/(4*n*n))/den
    return [center-half, center+half]


def main():
    rng = np.random.default_rng(SEED)
    train_h = HREF*np.geomspace(.14, 1.55, 16)
    hold_h = HREF*np.geomspace(.055, 3.20, 24)
    L = np.linalg.cholesky(covariance(len(train_h)))
    Lh = np.linalg.cholesky(covariance(len(hold_h)))
    Chi = np.linalg.inv(covariance(len(hold_h)))

    low = np.array([.01, -.01, .01, -.01, .01, -.01])
    parity6 = (-1.)**np.arange(1, 7)
    configs = [
        ("asymmetric", .70, 1.30, low),
        ("mirrored", 1.30, .70, parity6*low),
        ("equal_symmetric", 1., 1., np.where(np.arange(1, 7)%2, 0., low)),
        ("equal_asymmetric_baseline", 1., 1., low),
    ]

    # Reusable standard-normal draws keep acquisition noise comparable.
    znull_t = rng.standard_normal((N_NULL, 2*len(train_h)))
    znull_h = rng.standard_normal((N_NULL, 2*len(hold_h)))
    zmc_t = rng.standard_normal((N_MC, 2*len(train_h)))
    zmc_h = rng.standard_normal((N_MC, 2*len(hold_h)))

    results = {}; total_retries = 0; unresolved = 0
    for name, rp0, rm0, low_target in configs:
        eta_low = eta_for_moments(low_target)
        eta_base = np.r_[eta_low, np.zeros(N_TRUE-N_FIT)]
        base_m = moments(eta_base)
        y0 = observe(train_h, rp0, rm0, eta_base)
        yh0 = observe(hold_h, rp0, rm0, eta_base)

        null_chi = []
        for zt0, zh0 in zip(znull_t, znull_h):
            nt, nh = L@zt0, Lh@zh0
            if name == "mirrored":
                nt, nh = swap_orient(nt), swap_orient(nh)
            try:
                f = fit_model(train_h, y0+nt, L, rp0, rm0, eta_low)
            except RuntimeError:
                unresolved += 1; continue
            total_retries += f.retries
            r = yh0+nh-observe(hold_h, f.rp, f.rm, f.eta)
            null_chi.append(float(r@Chi@r))
        if len(null_chi) != N_NULL:
            raise RuntimeError(f"null optimizer failure in {name}")
        threshold = float(np.quantile(null_chi, .95))

        deterministic = []; mc = []
        for ell in (8, 9):
            for sign in (-1, 1):
                for amp in AMPS:
                    et = individual_truth(base_m, ell, sign*amp)
                    yt = observe(train_h, rp0, rm0, et)
                    yht = observe(hold_h, rp0, rm0, et)
                    f = fit_model(train_h, yt, L, rp0, rm0, eta_low)
                    total_retries += f.retries
                    r = yht-observe(hold_h, f.rp, f.rm, f.eta)
                    deterministic.append({"mode": ell, "sign": sign,
                                          "amplitude": float(amp),
                                          "noncentrality": float(r@Chi@r),
                                          "lower_moment_drift": float(np.max(
                                              np.abs(moments(et)[:ell-1]-base_m[:ell-1])))})
                et = individual_truth(base_m, ell, sign*MC_AMP)
                yt = observe(train_h, rp0, rm0, et)
                yht = observe(hold_h, rp0, rm0, et)
                chis = []
                for zt0, zh0 in zip(zmc_t, zmc_h):
                    nt, nh = L@zt0, Lh@zh0
                    if name == "mirrored":
                        nt, nh = swap_orient(nt), swap_orient(nh)
                    # For the equal-support/mirror-symmetric fixture, +/- P9
                    # are exact mirror partners. Pair their noise accordingly.
                    if name == "equal_symmetric" and ell == 9 and sign < 0:
                        nt, nh = swap_orient(L@zt0), swap_orient(Lh@zh0)
                    try:
                        f = fit_model(train_h, yt+nt, L, rp0, rm0, eta_low)
                    except RuntimeError:
                        unresolved += 1; continue
                    total_retries += f.retries
                    r = yht+nh-observe(hold_h, f.rp, f.rm, f.eta)
                    chis.append(float(r@Chi@r))
                if len(chis) != N_MC:
                    raise RuntimeError(f"alternative optimizer failure in {name}")
                k = int(np.sum(np.asarray(chis)>threshold))
                mc.append({"mode": ell, "sign": sign, "amplitude": MC_AMP,
                           "reject_count": k, "n": N_MC, "power": k/N_MC,
                           "wilson95": wilson(k, N_MC),
                           "median_chisq": float(np.median(chis))})

        # Signed cubic response: lambda(x)=A x^2+B x^3+C x^4, x=delta/.0025.
        cubic = []
        for ell in (8, 9):
            rows = [r for r in deterministic if r["mode"] == ell]
            x = np.array([r["sign"]*r["amplitude"]/MC_AMP for r in rows])
            y = np.array([r["noncentrality"] for r in rows])
            X = np.c_[x*x, x*x*x, x**4]
            coef, *_ = np.linalg.lstsq(X, y, rcond=None)
            cubic.append({"mode": ell, "A_even_quadratic": float(coef[0]),
                          "B_odd_cubic": float(coef[1]),
                          "C_even_quartic": float(coef[2]),
                          "relative_cubic_B_over_A": float(coef[1]/coef[0])})

        results[name] = {"rho_plus": rp0, "rho_minus": rm0,
                         "baseline_moments": base_m.tolist(),
                         "threshold": threshold,
                         "false_alarm": float(np.mean(np.asarray(null_chi)>threshold)),
                         "deterministic": deterministic, "monte_carlo": mc,
                         "signed_response_fit": cubic}
        print(name, [(r["mode"],r["sign"],round(r["power"],3)) for r in mc], flush=True)

    # Exact mirror audit on forward maps and deterministic noncentralities.
    mirror_errors = []
    ca, cm = results["asymmetric"], results["mirrored"]
    base_a = np.asarray(ca["baseline_moments"])
    base_mi = np.asarray(cm["baseline_moments"])
    for ell in (8, 9):
        for sign in (-1, 1):
            eta_a = individual_truth(base_a, ell, sign*MC_AMP)
            eta_m = individual_truth(base_mi, ell, ((-1)**ell)*sign*MC_AMP)
            fa = observe(hold_h, .70, 1.30, eta_a)
            fm = observe(hold_h, 1.30, .70, eta_m)
            mirror_errors.append({"mode": ell, "sign_asymmetric": sign,
                                  "sign_mirrored": int(((-1)**ell)*sign),
                                  "max_forward_swap_error_sigma": float(
                                      np.max(np.abs(fm-swap_orient(fa)))/SIGMA)})

    # Deterministic lambda covariance, compared by interpolation-free grid key.
    lambda_mirror_err = []
    for ell in (8, 9):
        for sign in (-1, 1):
            for amp in AMPS:
                a = next(r["noncentrality"] for r in ca["deterministic"]
                         if r["mode"]==ell and r["sign"]==sign and r["amplitude"]==float(amp))
                sm = int(((-1)**ell)*sign)
                b = next(r["noncentrality"] for r in cm["deterministic"]
                         if r["mode"]==ell and r["sign"]==sm and r["amplitude"]==float(amp))
                lambda_mirror_err.append(abs(a-b))

    # Recompute the central deterministic point at doubled per-segment order.
    # Branch points remain explicit in both rules; this does not tune results.
    quad = []
    for name, rp0, rm0, low_target in configs:
        eta_low = eta_for_moments(low_target)
        base_m = moments(np.r_[eta_low, np.zeros(N_TRUE-N_FIT)])
        for ell in (8, 9):
            for sign in (-1, 1):
                et = individual_truth(base_m, ell, sign*MC_AMP)
                yt = observe(train_h, rp0, rm0, et, 2*CONTACT_ORDER)
                yht = observe(hold_h, rp0, rm0, et, 2*CONTACT_ORDER)
                f = fit_model(train_h, yt, L, rp0, rm0, eta_low,
                              qorder=2*CONTACT_ORDER)
                r = yht-observe(hold_h, f.rp, f.rm, f.eta, 2*CONTACT_ORDER)
                refined = float(r@Chi@r)
                coarse = next(q["noncentrality"] for q in results[name]["deterministic"]
                              if q["mode"]==ell and q["sign"]==sign
                              and q["amplitude"]==MC_AMP)
                quad.append({"config":name,"mode":ell,"sign":sign,
                             "coarse_noncentrality":coarse,
                             "refined_noncentrality":refined,
                             "absolute_difference":abs(refined-coarse),
                             "relative_difference":abs(refined-coarse)/max(refined,1e-30)})
    out = {"status":"sandbox candidate; not canonical theory",
           "fixture":{"sigma":SIGMA,"ar1_phi":AR_PHI,"cross_orientation":CROSS,
                      "support_prior_fractional_std":SUPPORT_PRIOR,
                      "moment_quadrature_nodes":NQ,
                      "contact_composite_gauss_order_per_segment":CONTACT_ORDER,
                      "null_trials_per_config":N_NULL,
                      "mc_trials_per_mode_sign":N_MC,"mc_amplitude":MC_AMP,
                      "deterministic_amplitudes":AMPS.tolist(),
                      "train_h":train_h.tolist(),"holdout_h":hold_h.tolist()},
           "mirror_law":"Power(rp,rm,ell,delta)=Power(rm,rp,ell,(-1)^ell delta) when baseline is mirrored",
           "configs":results,"mirror_forward_audit":mirror_errors,
           "max_deterministic_lambda_mirror_error":float(max(lambda_mirror_err)),
           "contact_quadrature_16_to_32_central_check":quad,
           "optimizer":{"unresolved_failures":unresolved,"retries_used":total_retries}}
    with open("support_mirror_mode_asymmetry.json","w",encoding="utf-8") as f:
        json.dump(out,f,indent=2)

    fig, axes = plt.subplots(2, 2, figsize=(10, 7.5))
    colors={"asymmetric":"#3b6fb6","mirrored":"#d27a1f",
            "equal_symmetric":"#2b9b69","equal_asymmetric_baseline":"#8a55a6"}
    for col, ell in enumerate((8,9)):
        ax=axes[0,col]
        for name in results:
            for sign,ls in [(-1,"--"),(1,"-")]:
                rs=[r for r in results[name]["deterministic"] if r["mode"]==ell and r["sign"]==sign]
                ax.plot(100*AMPS,[r["noncentrality"] for r in rs],ls,color=colors[name],
                        marker="o",ms=3,label=f"{name}, {'+' if sign>0 else '-'}")
        ax.set_title(f"P{ell}: deterministic omitted-mode mismatch")
        ax.set_xlabel("|injected moment| (%)"); ax.set_ylabel("holdout noncentrality")
        ax.grid(alpha=.25); ax.legend(fontsize=6.5,ncol=2)
    for col, ell in enumerate((8,9)):
        ax=axes[1,col]; names=list(results); x=np.arange(len(names)); width=.34
        for j,sign in enumerate((-1,1)):
            vals=[]; lo=[]; hi=[]
            for name in names:
                r=next(q for q in results[name]["monte_carlo"] if q["mode"]==ell and q["sign"]==sign)
                vals.append(r["power"]);lo.append(r["wilson95"][0]);hi.append(r["wilson95"][1])
            vals=np.array(vals);lo=np.array(lo);hi=np.array(hi)
            ax.bar(x+(j-.5)*width,vals,width,yerr=[vals-lo,hi-vals],capsize=3,
                   label=f"{'+' if sign>0 else '-'}P{ell}")
        ax.set_xticks(x,names,rotation=18,ha="right",fontsize=8)
        ax.set_ylim(0,1.08);ax.set_ylabel("rejection probability at 0.25%")
        ax.set_title(f"P{ell}: blind holdout power");ax.grid(axis="y",alpha=.25);ax.legend(fontsize=8)
    fig.suptitle("Support-swap and baseline-symmetry audit of mode-sign response")
    fig.tight_layout()
    fig.savefig("support_mirror_mode_asymmetry.svg")
    fig.savefig("support_mirror_mode_asymmetry.png",dpi=180)

    print("mirror forward max sigma",max(r["max_forward_swap_error_sigma"] for r in mirror_errors))
    print("lambda mirror max",max(lambda_mirror_err))
    print("quadrature max relative",max(q["relative_difference"] for q in quad))
    print("optimizer",out["optimizer"])


if __name__=="__main__":
    main()
