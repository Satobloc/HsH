"""Validation-evidence averaging over a dense roughness path.

Fifty independent R=192 repeat ensembles are evaluated on 25/49/97-bin
log-tau grids over base and fourfold-expanded intervals. q=2.4 is conditioned
on the prior blinded stage (where all six full fits recovered q=2.4); no
injected relaxation time or amplitude enters fitting or clustering.
"""

import json
import os
from concurrent.futures import ProcessPoolExecutor, as_completed

import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import nnls

from repeated_covariance_spectrum_selection import (
    TRUE, estimate_cov, pole_cov, roots_two, sample_repeats,
)

Q_FIXED = 2.4
REPEATS = 192
SEEDS = list(range(740000, 740050))
LAMBDAS = np.r_[0.0, np.logspace(-8, 4, 13)]
W_SCALE = 0.02
CONFIGS = [(label, bins, interval)
           for label, interval in (("base", (0.04, 12.0)),
                                   ("wide", (0.01, 48.0)))
           for bins in (25, 49, 97)]


def d2_matrix(n):
    d = np.zeros((n - 2, n))
    for i in range(n - 2):
        d[i, i:i+3] = [1.0, -2.0, 1.0]
    return d


def g_and_j(a, z, weights, tau):
    den = 1 - 1j*z[:, None]*tau[None, :]
    response = (weights[None, :] / den).sum(axis=1)
    F = z*z + 1j*z*a**Q_FIXED*response
    dr = (weights[None, :] * (1j*tau[None, :]) / den**2).sum(axis=1)
    dF = 2*z + 1j*a**Q_FIXED*response + 1j*z*a**Q_FIXED*dr
    n = len(z)
    J = np.zeros((n, 2*n))
    J[np.arange(n), np.arange(n)] = dF.imag
    J[np.arange(n), n+np.arange(n)] = dF.real
    return F.imag, J


def design(a, z, tau):
    b = (z*z).imag
    den = 1 - 1j*z[:, None]*tau[None, :]
    B = (1j*z[:, None]*a[:, None]**Q_FIXED/den).imag
    return b, B


def fit_positive(a, z, cmean, train, lam, tau):
    h = float(np.log(tau[1]/tau[0]))
    d2 = d2_matrix(len(tau))
    b, B = design(a, z, tau)
    weights = np.zeros(len(tau))
    # Two feasible-GLS passes; each lambda retains its own propagated covariance.
    for _ in range(2):
        _, J = g_and_j(a, z, weights, tau)
        C = J @ cmean @ J.T
        Ct = C[np.ix_(train, train)] + np.eye(len(train))*1e-18
        L = np.linalg.cholesky(Ct)
        Aw = np.linalg.solve(L, B[train]*W_SCALE)
        yw = -np.linalg.solve(L, b[train])
        if lam > 0:
            Aaug = np.vstack([Aw, np.sqrt(lam/h**3)*d2])
            yaug = np.r_[yw, np.zeros(len(tau)-2)]
        else:
            Aaug, yaug = Aw, yw
        u = nnls(Aaug, yaug, maxiter=10*len(tau))[0]
        weights = W_SCALE*u
    return weights


def conditional_nll(a, z, cmean, weights, tau, train, test):
    g, J = g_and_j(a, z, weights, tau)
    C = J @ cmean @ J.T
    CTT = C[np.ix_(train, train)] + np.eye(len(train))*1e-18
    Css = C[np.ix_(test, test)] + np.eye(len(test))*1e-18
    CsT = C[np.ix_(test, train)]
    mu = CsT @ np.linalg.solve(CTT, g[train])
    S = Css - CsT @ np.linalg.solve(CTT, CsT.T) + np.eye(len(test))*1e-18
    e = g[test] - mu
    return float(e @ np.linalg.solve(S, e) + np.linalg.slogdet(S)[1]
                 + len(test)*np.log(2*np.pi))


def cluster_summary(tau, weights):
    x = np.log(tau)
    p = weights/weights.sum()
    c = np.quantile(x, [0.25, 0.75])
    for _ in range(100):
        lab = np.argmin((x[:, None]-c[None, :])**2, axis=1)
        new = np.array([(p[lab == k] @ x[lab == k])/p[lab == k].sum()
                        if p[lab == k].sum() > 0 else c[k] for k in range(2)])
        if np.max(np.abs(new-c)) < 1e-12:
            c = new
            break
        c = new
    out = []
    for k in np.argsort(c):
        m = lab == k
        mass = p[m].sum()
        cc = (p[m] @ x[m])/mass
        width = np.sqrt((p[m] @ (x[m]-cc)**2)/mass)
        out.append({"centroid": float(np.exp(cc)), "mass": float(mass),
                    "log_width": float(width)})
    span = x[-1]-x[0]
    edge = (x <= x[0]+0.05*span) | (x >= x[-1]-0.05*span)
    return out, float(p[edge].sum())


def run_config(a, z, cmean, label, bins, interval):
    tau = np.geomspace(interval[0], interval[1], bins)
    interior = np.arange(1, len(a)-1)
    folds = [interior[k::3] for k in range(3)]
    scores = np.zeros(len(LAMBDAS))
    for test in folds:
        train = np.setdiff1d(np.arange(len(a)), test)
        for j, lam in enumerate(LAMBDAS):
            w = fit_positive(a, z, cmean, train, lam, tau)
            scores[j] += conditional_nll(a, z, cmean, w, tau, train, test)

    # Pseudo-BMA weights from held-out predictive evidence on the lambda path.
    rel = np.exp(-0.5*(scores-scores.min()))
    alpha = rel/rel.sum()
    full = np.array([fit_positive(a, z, cmean, np.arange(len(a)), lam, tau)
                     for lam in LAMBDAS])
    avg = alpha @ full
    clusters, endpoint = cluster_summary(tau, avg)
    return {"interval_label": label, "bins": bins, "interval": list(interval),
            "h": float(np.log(tau[1]/tau[0])), "lambda_weights": alpha.tolist(),
            "lambda_cv_nll": scores.tolist(),
            "effective_lambdas": float(1/np.sum(alpha*alpha)),
            "clusters": clusters, "endpoint_mass": endpoint,
            "tau": tau.tolist(), "spectrum": (avg/avg.sum()).tolist()}


def run_seed(seed):
    rng = np.random.default_rng(seed)
    a = np.logspace(-1, np.log10(3), 41)
    z0 = roots_two(a)
    reps = sample_repeats(z0, pole_cov(z0), REPEATS, rng)
    z = reps.mean(axis=0)
    chat, shrink = estimate_cov(reps)
    cmean = chat/REPEATS
    rows = [run_config(a, z, cmean, *cfg) for cfg in CONFIGS]
    return {"seed": seed, "shrinkage": float(shrink), "configs": rows}


def quantiles(vals):
    return {"median": float(np.median(vals)), "q025": float(np.quantile(vals, .025)),
            "q975": float(np.quantile(vals, .975))}


def summarize(seed_rows):
    out = []
    for label, bins, interval in CONFIGS:
        rr = [next(c for c in s["configs"]
                   if c["interval_label"] == label and c["bins"] == bins)
              for s in seed_rows]
        out.append({"interval_label": label, "bins": bins, "interval": list(interval),
                    "h": rr[0]["h"],
                    "fast_centroid": quantiles([r["clusters"][0]["centroid"] for r in rr]),
                    "slow_centroid": quantiles([r["clusters"][1]["centroid"] for r in rr]),
                    "fast_mass": quantiles([r["clusters"][0]["mass"] for r in rr]),
                    "slow_mass": quantiles([r["clusters"][1]["mass"] for r in rr]),
                    "fast_width": quantiles([r["clusters"][0]["log_width"] for r in rr]),
                    "slow_width": quantiles([r["clusters"][1]["log_width"] for r in rr]),
                    "endpoint_mass": quantiles([r["endpoint_mass"] for r in rr]),
                    "effective_lambdas": quantiles([r["effective_lambdas"] for r in rr]),
                    "median_spectrum": np.median([r["spectrum"] for r in rr], axis=0).tolist(),
                    "tau": rr[0]["tau"]})
    return out


def make_plot(summary):
    fig, ax = plt.subplots(2, 2, figsize=(12.5, 9), constrained_layout=True)
    colors = {25: "#2166ac", 49: "#7b3294", 97: "#d73027"}
    for r in [x for x in summary if x["interval_label"] == "wide"]:
        ax[0, 0].plot(r["tau"], r["median_spectrum"], "o-", ms=2.5,
                      color=colors[r["bins"]], label=f"{r['bins']} bins")
    ax[0, 0].set_xscale("log")
    ax[0, 0].set(xlabel="relaxation time τ", ylabel="median normalized weight",
                 title="Wide interval: ensemble-median spectra")
    ax[0, 0].legend(frameon=False)

    for label, marker in (("base", "o"), ("wide", "s")):
        rr = [x for x in summary if x["interval_label"] == label]
        for k, key, ls in ((0, "fast_centroid", "-"), (1, "slow_centroid", "--")):
            x = np.array([r["h"] for r in rr]); y = np.array([r[key]["median"] for r in rr])
            lo = y-np.array([r[key]["q025"] for r in rr]); hi = np.array([r[key]["q975"] for r in rr])-y
            ax[0, 1].errorbar(x, y, yerr=[lo, hi], marker=marker, ls=ls,
                              label=f"{label}, {'fast' if k==0 else 'slow'}")
    ax[0, 1].set_yscale("log"); ax[0, 1].invert_xaxis()
    ax[0, 1].set(xlabel="log-grid spacing h", ylabel="blind centroid τ",
                 title="Centroid stability (95% seed intervals)")
    ax[0, 1].legend(fontsize=8, frameon=False)

    for label, marker in (("base", "o"), ("wide", "s")):
        rr = [x for x in summary if x["interval_label"] == label]
        x = np.array([r["h"] for r in rr])
        for key, ls in (("fast_width", "-"), ("slow_width", "--")):
            med = [r[key]["median"] for r in rr]
            upper = [r[key]["q975"] for r in rr]
            ax[1, 0].plot(x, med, marker=marker, ls=ls,
                          label=f"{label}, {key.split('_')[0]} median")
            ax[1, 0].plot(x, upper, color=ax[1, 0].lines[-1].get_color(), ls=":")
    ax[1, 0].invert_xaxis()
    ax[1, 0].set(xlabel="log-grid spacing h", ylabel="physical log-width",
                 title="Width contraction test (dotted = 97.5% bound)")
    ax[1, 0].legend(fontsize=8, frameon=False)

    leak_ax = ax[1, 1]
    lambda_ax = leak_ax.twinx()
    for label, marker in (("base", "o"), ("wide", "s")):
        rr = [x for x in summary if x["interval_label"] == label]
        bins = [r["bins"] for r in rr]
        leak_ax.plot(bins, [r["endpoint_mass"]["q975"] for r in rr],
                     marker=marker, label=f"endpoint U95, {label}")
        lambda_ax.plot(bins, [r["effective_lambdas"]["median"] for r in rr],
                       marker=marker, ls="--", label=f"effective λ, {label}")
    leak_ax.set(xlabel="spectral bins", ylabel="endpoint mass U95",
                title="Leakage and regularization uncertainty")
    lambda_ax.set_ylabel("median effective λ count")
    h1, l1 = leak_ax.get_legend_handles_labels()
    h2, l2 = lambda_ax.get_legend_handles_labels()
    leak_ax.legend(h1+h2, l1+l2, fontsize=8, frameon=False)
    fig.suptitle("Class P diagnostic: λ-path ensemble identifiability", fontsize=15)
    fig.savefig("spectral_lambda_path_ensemble.png", dpi=180)
    fig.savefig("spectral_lambda_path_ensemble.svg")


def main():
    workers = min(6, os.cpu_count() or 1)
    rows = []
    with ProcessPoolExecutor(max_workers=workers) as pool:
        futs = {pool.submit(run_seed, s): s for s in SEEDS}
        for i, fut in enumerate(as_completed(futs), 1):
            rows.append(fut.result())
            print(f"completed {i}/{len(SEEDS)}", flush=True)
    rows.sort(key=lambda x: x["seed"])
    summary = summarize(rows)
    # Truth is attached only after blind summaries have been constructed.
    payload = {"status": "GEN/CANDIDATE", "repeats": REPEATS,
               "conditioned_q_from_prior_blind_stage": Q_FIXED,
               "lambda_grid": LAMBDAS.tolist(), "seeds": SEEDS,
               "summary_blind": summary, "seed_results": rows,
               "posthoc_truth_reveal": {"tau_1": float(TRUE["t1"]),
                                         "tau_2": float(TRUE["t2"]),
                                         "amplitude_mass_split": [0.6, 0.4]}}
    with open("spectral_lambda_path_ensemble.json", "w") as f:
        json.dump(payload, f, indent=2)
    make_plot(summary)
    print(json.dumps(summary, indent=2), flush=True)


if __name__ == "__main__":
    main()
