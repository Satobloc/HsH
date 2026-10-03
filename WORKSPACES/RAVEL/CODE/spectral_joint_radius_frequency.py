"""Blind joint radius-frequency identifiability test for a positive spectrum.

The constitutive spectrum and q=2.4 are inherited only as the previously
conditioned synthetic fixture.  The new information is three known carrier
frequency multipliers at every radius.  Fifty seeds, repeat count, six grids,
roughness path, and evidence averaging are unchanged from the radius-only run.
"""

import json
import os
from concurrent.futures import ProcessPoolExecutor, as_completed

import matplotlib.pyplot as plt
import numpy as np

from repeated_covariance_spectrum_selection import TRUE, estimate_cov, pole_cov, sample_repeats
from spectral_lambda_path_ensemble import (
    CONFIGS, LAMBDAS, Q_FIXED, REPEATS, SEEDS, W_SCALE,
    cluster_summary, d2_matrix, design, g_and_j, quantiles,
)
from scipy.optimize import nnls

NU = np.array([0.65, 1.0, 1.55])
RHO_A = 0.75
RHO_NU = 0.30
ETA_RI = 0.35
SIGMA = 3e-4


def roots_joint(a, nu, p=TRUE):
    """Positive-frequency damped pole for each (known carrier, radius) pair."""
    out = []
    for f in nu:
        for x in a:
            w = f/x
            z = np.poly1d([1, 0])
            d1 = np.poly1d([-1j*p["t1"], 1])
            d2 = np.poly1d([-1j*p["t2"], 1])
            poly = (np.poly1d([-1, 0, w*w])*d1*d2
                    - 1j*p["A1"]*x**p["q"]*z*d2
                    - 1j*p["A2"]*x**p["q"]*z*d1)
            rr = np.roots(poly)
            cc = [u for u in rr if u.real > 0 and u.imag < 0]
            out.append(min(cc, key=lambda u: abs(u-w)))
    return np.asarray(out)


def fit_positive_blocks(a, z_blocks, c_blocks, train, lam, tau):
    h = float(np.log(tau[1]/tau[0])); d2 = d2_matrix(len(tau))
    weights = np.zeros(len(tau))
    for _ in range(2):
        As, ys = [], []
        for z, cmean in zip(z_blocks, c_blocks):
            b, B = design(a, z, tau)
            _, J = g_and_j(a, z, weights, tau)
            C = J @ cmean @ J.T
            L = np.linalg.cholesky(C[np.ix_(train, train)] + np.eye(len(train))*1e-18)
            As.append(np.linalg.solve(L, B[train]*W_SCALE))
            ys.append(-np.linalg.solve(L, b[train]))
        Aw = np.vstack(As); yw = np.concatenate(ys)
        if lam > 0:
            Aw = np.vstack([Aw, np.sqrt(lam/h**3)*d2])
            yw = np.r_[yw, np.zeros(len(tau)-2)]
        weights = W_SCALE*nnls(Aw, yw, maxiter=10*len(tau))[0]
    return weights


def conditional_nll_blocks(a, z_blocks, c_blocks, weights, tau, train, test):
    total = 0.0
    for z, cmean in zip(z_blocks, c_blocks):
        g, J = g_and_j(a, z, weights, tau)
        C = J @ cmean @ J.T
        CTT = C[np.ix_(train, train)] + np.eye(len(train))*1e-18
        Css = C[np.ix_(test, test)] + np.eye(len(test))*1e-18
        CsT = C[np.ix_(test, train)]
        mu = CsT @ np.linalg.solve(CTT, g[train])
        S = Css - CsT @ np.linalg.solve(CTT, CsT.T) + np.eye(len(test))*1e-18
        e = g[test]-mu
        total += float(e @ np.linalg.solve(S,e) + np.linalg.slogdet(S)[1]
                       + len(test)*np.log(2*np.pi))
    return total


def blind_design_metrics(a_flat, z, interval=(0.01, 48.0), bins=97):
    """Pre-reveal kernel rank metrics; no true tau or amplitude is used."""
    tau = np.geomspace(*interval, bins)
    den = 1 - 1j*z[:, None]*tau[None, :]
    B = (1j*z[:, None]*a_flat[:, None]**Q_FIXED/den).imag
    B /= np.linalg.norm(B, axis=0, keepdims=True) + 1e-300
    s = np.linalg.svd(B, compute_uv=False)
    return {"stable_rank": float(np.sum(s*s)/(s[0]*s[0])),
            "numerical_rank_1e-3": int(np.sum(s/s[0] > 1e-3)),
            "singular_value_ratio_min_max": float(s[-1]/s[0])}


def run_config_joint(a, z_blocks, c_blocks, label, bins, interval):
    tau = np.geomspace(interval[0], interval[1], bins)
    interior = np.arange(1, len(a)-1)
    radius_folds = [interior[k::3] for k in range(3)]
    scores = np.zeros(len(LAMBDAS))
    all_idx = np.arange(len(a))
    for rf in radius_folds:
        test = rf
        train = np.setdiff1d(all_idx, test)
        for j, lam in enumerate(LAMBDAS):
            w = fit_positive_blocks(a, z_blocks, c_blocks, train, lam, tau)
            scores[j] += conditional_nll_blocks(a, z_blocks, c_blocks, w, tau, train, test)
    rel = np.exp(-0.5*(scores-scores.min()))
    alpha = rel/rel.sum()
    full = np.array([fit_positive_blocks(a, z_blocks, c_blocks, all_idx, lam, tau)
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
    z0 = roots_joint(a, NU)
    z0_blocks = np.split(z0, len(NU))
    z_blocks, c_blocks, shrink = [], [], []
    for zb in z0_blocks:
        reps = sample_repeats(zb, pole_cov(zb, sigma=SIGMA, rho=RHO_A, eta=ETA_RI),
                              REPEATS, rng)
        z_blocks.append(reps.mean(axis=0))
        chat, sh = estimate_cov(reps)
        c_blocks.append(chat/REPEATS); shrink.append(float(sh))
    rows = [run_config_joint(a, z_blocks, c_blocks, *cfg) for cfg in CONFIGS]
    return {"seed": seed, "shrinkage_by_frequency": shrink, "configs": rows}


def summarize(rows):
    out = []
    for label, bins, interval in CONFIGS:
        rr = [next(c for c in s["configs"]
                   if c["interval_label"] == label and c["bins"] == bins)
              for s in rows]
        out.append({"interval_label": label, "bins": bins,
                    "interval": list(interval), "h": rr[0]["h"],
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


def load_baseline():
    with open("spectral_lambda_path_ensemble_summary.json") as f:
        return json.load(f)["summary_blind"]


def make_plot(summary, baseline):
    fig, ax = plt.subplots(2, 2, figsize=(12.5, 9), constrained_layout=True)
    colors = {25: "#2166ac", 49: "#7b3294", 97: "#d73027"}
    for r in [x for x in summary if x["interval_label"] == "wide"]:
        ax[0,0].plot(r["tau"], r["median_spectrum"], "o-", ms=2.5,
                     color=colors[r["bins"]], label=f"joint {r['bins']} bins")
    ax[0,0].set_xscale("log"); ax[0,0].legend(frameon=False)
    ax[0,0].set(xlabel="relaxation time τ", ylabel="median normalized weight",
                title="Joint radius–frequency spectra (wide interval)")
    for source, rows, marker in (("radius only", baseline, "o"),
                                  ("joint", summary, "s")):
        rr = [x for x in rows if x["interval_label"] == "wide"]
        x = [r["h"] for r in rr]
        ax[0,1].plot(x, [r["fast_width"]["q975"] for r in rr], marker=marker,
                     label=f"{source}: fast U95")
        ax[0,1].plot(x, [r["fast_width"]["median"] for r in rr], marker=marker,
                     ls="--", label=f"{source}: fast median")
        ax[1,0].plot(x, [r["endpoint_mass"]["q975"] for r in rr], marker=marker,
                     label=source)
        ax[1,1].plot(x, [r["effective_lambdas"]["median"] for r in rr], marker=marker,
                     label=source)
    for a0 in (ax[0,1], ax[1,0], ax[1,1]):
        a0.invert_xaxis(); a0.legend(fontsize=8, frameon=False)
    ax[0,1].set(xlabel="log-grid spacing h", ylabel="fast-sector log-width",
                title="Does the fast width contract?")
    ax[1,0].set(xlabel="log-grid spacing h", ylabel="endpoint mass U95",
                title="Boundary leakage")
    ax[1,1].set(xlabel="log-grid spacing h", ylabel="effective λ count",
                title="Roughness-path uncertainty")
    fig.suptitle("Class P diagnostic: orthogonal frequency augmentation", fontsize=15)
    fig.savefig("spectral_joint_radius_frequency.png", dpi=180)
    fig.savefig("spectral_joint_radius_frequency.svg")


def main():
    workers = min(6, os.cpu_count() or 1)
    rows = []
    with ProcessPoolExecutor(max_workers=workers) as pool:
        futs = {pool.submit(run_seed, s): s for s in SEEDS}
        for i, fut in enumerate(as_completed(futs), 1):
            rows.append(fut.result()); print(f"completed {i}/{len(SEEDS)}", flush=True)
    rows.sort(key=lambda x: x["seed"])
    summary = summarize(rows)
    a = np.logspace(-1, np.log10(3), 41)
    z_joint = roots_joint(a, NU)
    z_radial = roots_joint(a, np.array([1.0]))
    metrics = {"radius_only": blind_design_metrics(a, z_radial),
               "joint_radius_frequency": blind_design_metrics(np.tile(a, len(NU)), z_joint)}
    baseline = load_baseline()
    payload = {"status":"GEN/CANDIDATE", "repeats":REPEATS, "seeds":SEEDS,
               "frequency_multipliers":NU.tolist(), "frequency_channels_independent":True,
               "q_conditioned":Q_FIXED,
               "configs":CONFIGS, "lambda_grid":LAMBDAS.tolist(),
               "blind_design_metrics":metrics, "summary_blind":summary,
               "radius_only_baseline":baseline, "seed_results":rows,
               "posthoc_truth_reveal":{"tau_1":float(TRUE["t1"]),
                                          "tau_2":float(TRUE["t2"]),
                                          "amplitude_mass_split":[0.6,0.4]}}
    with open("spectral_joint_radius_frequency.json","w") as f:
        json.dump(payload,f,indent=2)
    compact = {k:v for k,v in payload.items() if k != "seed_results"}
    with open("spectral_joint_radius_frequency_summary.json","w") as f:
        json.dump(compact,f,indent=2)
    make_plot(summary, baseline)
    print(json.dumps({"blind_design_metrics":metrics,"summary_blind":summary},indent=2))


if __name__ == "__main__":
    main()
