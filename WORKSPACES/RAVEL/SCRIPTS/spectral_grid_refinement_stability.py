"""Blind grid-refinement test for a positive relaxation spectrum.

The synthetic data and folds are fixed across all grids.  The nonparametric
roughness penalty approximates the continuum functional
    lambda * integral (d^2 u / d(log tau)^2)^2 d(log tau)
with lambda * ||D2 u||^2 / h^3 on a uniform log grid of spacing h.
Injected pole locations are used only after all summaries are computed.
"""

import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import lsq_linear

from repeated_covariance_spectrum_selection import (
    TRUE, conditional_nll, estimate_cov, fit as fit_discrete,
    pole_cov, roots_two, sample_repeats,
)

Q_GRID = np.linspace(1.8, 3.0, 13)
LAMBDA_GRID = np.array([0.0, 1e-4, 1e-2, 1.0, 1e2])
W_SCALE = 0.02


def d2_matrix(n):
    d = np.zeros((n - 2, n))
    for i in range(n - 2):
        d[i, i:i + 3] = [1.0, -2.0, 1.0]
    return d


def continuum_g_J(a, z, q, weights, tau):
    den = 1 - 1j * z[:, None] * tau[None, :]
    response = (weights[None, :] / den).sum(axis=1)
    F = z*z + 1j*z*a**q*response
    dresponse = (weights[None, :] * (1j*tau[None, :]) / den**2).sum(axis=1)
    dF = 2*z + 1j*a**q*response + 1j*z*a**q*dresponse
    n = len(z)
    J = np.zeros((n, 2*n))
    J[np.arange(n), np.arange(n)] = dF.imag
    J[np.arange(n), n + np.arange(n)] = dF.real
    return F.imag, J


def design(a, z, q, tau):
    b = (z*z).imag
    den = 1 - 1j*z[:, None]*tau[None, :]
    B = (1j*z[:, None]*a[:, None]**q/den).imag
    return b, B


def fit_continuum(a, z, cmean, train, lam, tau):
    h = float(np.log(tau[1] / tau[0]))
    d2 = d2_matrix(len(tau))
    best = None
    for q in Q_GRID:
        weights = np.zeros(len(tau))
        for _ in range(2):
            _, J = continuum_g_J(a, z, q, weights, tau)
            Cg = J @ cmean @ J.T
            Ct = Cg[np.ix_(train, train)] + np.eye(len(train))*1e-18
            L = np.linalg.cholesky(Ct)
            b, B = design(a, z, q, tau)
            Aw = np.linalg.solve(L, B[train]*W_SCALE)
            yw = -np.linalg.solve(L, b[train])
            if lam > 0:
                penalty = np.sqrt(lam / h**3) * d2
                Aaug = np.vstack([Aw, penalty])
                yaug = np.r_[yw, np.zeros(d2.shape[0])]
            else:
                Aaug, yaug = Aw, yw
            u = lsq_linear(Aaug, yaug, bounds=(0, np.inf),
                           tol=2e-9, max_iter=400).x
            weights = W_SCALE*u
        resid = Aw @ u - yw
        objective = float(resid @ resid + lam*np.sum((d2 @ u)**2)/h**3)
        if best is None or objective < best[0]:
            best = (objective, q, weights)
    return {"q": float(best[1]), "weights": best[2]}


def continuum_nll(a, z, cmean, model, train, test, tau):
    g, J = continuum_g_J(a, z, model["q"], model["weights"], tau)
    Cg = J @ cmean @ J.T
    CTT = Cg[np.ix_(train, train)] + np.eye(len(train))*1e-18
    Css = Cg[np.ix_(test, test)] + np.eye(len(test))*1e-18
    CsT = Cg[np.ix_(test, train)]
    mu = CsT @ np.linalg.solve(CTT, g[train])
    S = Css - CsT @ np.linalg.solve(CTT, CsT.T) + np.eye(len(test))*1e-18
    e = g[test] - mu
    return float(e @ np.linalg.solve(S, e) + np.linalg.slogdet(S)[1]
                 + len(test)*np.log(2*np.pi))


def choose_lambda(a, z, cmean, outer_train, tau):
    inner = [outer_train[k::2] for k in range(2)]
    scores = []
    for lam in LAMBDA_GRID:
        total = 0.0
        for val in inner:
            tr = np.setdiff1d(outer_train, val)
            model = fit_continuum(a, z, cmean, tr, lam, tau)
            total += continuum_nll(a, z, cmean, model, tr, val, tau)
        scores.append(total)
    j = int(np.argmin(scores))
    return float(LAMBDA_GRID[j]), np.asarray(scores)


def weighted_two_cluster(tau, weights):
    """Blind deterministic 1-D weighted k-means in log tau."""
    x = np.log(tau)
    p = weights / weights.sum()
    c = np.array([np.quantile(x, 0.25), np.quantile(x, 0.75)])
    for _ in range(100):
        lab = np.argmin((x[:, None] - c[None, :])**2, axis=1)
        new = np.array([(p[lab == k] @ x[lab == k]) / p[lab == k].sum()
                        if np.any(lab == k) and p[lab == k].sum() > 0 else c[k]
                        for k in range(2)])
        if np.max(np.abs(new - c)) < 1e-12:
            c = new
            break
        c = new
    order = np.argsort(c)
    out = []
    for k in order:
        m = lab == k
        mass = float(p[m].sum())
        centroid_log = float((p[m] @ x[m]) / mass)
        width = float(np.sqrt((p[m] @ (x[m] - centroid_log)**2) / mass))
        out.append({"centroid_tau": float(np.exp(centroid_log)),
                    "mass": mass, "log_width": width})
    span = x[-1] - x[0]
    edge = (x <= x[0] + 0.05*span) | (x >= x[-1] - 0.05*span)
    return out, float(p[edge].sum()), float(1.0 / np.sum(p*p))


def run_config(a, z, cmean, folds, baseline_nll, nbin, interval):
    tau = np.geomspace(interval[0], interval[1], nbin)
    fold_rows = []
    for fold, test in enumerate(folds):
        train = np.setdiff1d(np.arange(len(a)), test)
        lam, scores = choose_lambda(a, z, cmean, train, tau)
        model = fit_continuum(a, z, cmean, train, lam, tau)
        nll = continuum_nll(a, z, cmean, model, train, test, tau)
        fold_rows.append({"fold": fold, "lambda": lam, "q": model["q"],
                          "continuum_nll": nll,
                          "two_pole_nll": baseline_nll[fold],
                          "delta_nll": nll - baseline_nll[fold],
                          "inner_scores": scores.tolist()})
    allidx = np.arange(len(a))
    lam, scores = choose_lambda(a, z, cmean, allidx, tau)
    full = fit_continuum(a, z, cmean, allidx, lam, tau)
    clusters, endpoint, neff = weighted_two_cluster(tau, full["weights"])
    return {"bins": nbin, "interval": list(interval),
            "log_spacing": float(np.log(tau[1]/tau[0])),
            "selected_lambda": lam, "q": full["q"],
            "delta_nll_folds": [r["delta_nll"] for r in fold_rows],
            "delta_nll_sum": float(sum(r["delta_nll"] for r in fold_rows)),
            "clusters_blind": clusters, "endpoint_mass": endpoint,
            "effective_bins": neff, "tau": tau.tolist(),
            "weights": full["weights"].tolist(), "folds": fold_rows,
            "full_inner_scores": scores.tolist()}


def main():
    rng = np.random.default_rng(731192)
    a = np.logspace(-1, np.log10(3), 41)
    z0 = roots_two(a)
    reps = sample_repeats(z0, pole_cov(z0), 192, rng)
    z = reps.mean(axis=0)
    chat, shrink = estimate_cov(reps)
    cmean = chat / 192
    interior = np.arange(1, len(a)-1)
    folds = [interior[k::3] for k in range(3)]
    baseline = []
    for test in folds:
        train = np.setdiff1d(np.arange(len(a)), test)
        x2 = fit_discrete(a, z, cmean, train, "two")
        baseline.append(float(conditional_nll(a, z, cmean, x2, "two", train, test)))

    results = []
    for label, interval in [("base", (0.04, 12.0)), ("wide", (0.01, 48.0))]:
        for nbin in (25, 49, 97):
            print(f"running {label} {nbin}", flush=True)
            row = run_config(a, z, cmean, folds, baseline, nbin, interval)
            row["interval_label"] = label
            results.append(row)

    # Reveal injected values only after the blind summaries exist.
    payload = {"repeats": 192, "seed": 731192, "shrinkage": float(shrink),
               "roughness_discretization": "lambda * ||D2 u||^2 / h^3",
               "baseline_two_pole_nll": baseline,
               "blind_results": results,
               "posthoc_truth_reveal": {"tau_1": float(TRUE["t1"]),
                                         "tau_2": float(TRUE["t2"]),
                                         "q": float(TRUE["q"])}}
    with open("spectral_grid_refinement_stability.json", "w") as f:
        json.dump(payload, f, indent=2)

    fig, ax = plt.subplots(2, 2, figsize=(12.5, 9), constrained_layout=True)
    colors = {25: "#2166ac", 49: "#7b3294", 97: "#d73027"}
    for j, label in enumerate(("base", "wide")):
        aa = ax[0, j]
        for r in [x for x in results if x["interval_label"] == label]:
            tau = np.asarray(r["tau"]); w = np.asarray(r["weights"]); p = w/w.sum()
            aa.plot(tau, p, "o-", ms=2.5, lw=1.25, color=colors[r["bins"]],
                    label=f"{r['bins']} bins")
        aa.set_xscale("log")
        aa.set(xlabel="relaxation time τ", ylabel="normalized positive weight",
               title=f"{label} interval: blind recovered spectrum")
        aa.legend(frameon=False)

    aa = ax[1, 0]
    for label, marker in [("base", "o"), ("wide", "s")]:
        rr = [x for x in results if x["interval_label"] == label]
        h = np.array([x["log_spacing"] for x in rr])
        for k, ls in [(0, "-"), (1, "--")]:
            c = np.array([x["clusters_blind"][k]["centroid_tau"] for x in rr])
            width = np.array([x["clusters_blind"][k]["log_width"] for x in rr])
            aa.errorbar(h, c, yerr=c*width, marker=marker, ls=ls,
                        label=f"{label}, cluster {k+1}")
    aa.set(xlabel="log-grid spacing h", ylabel="blind centroid τ (error bar = τ·log-width)",
           title="Centroid and physical width under refinement")
    aa.set_yscale("log"); aa.invert_xaxis(); aa.legend(fontsize=8, frameon=False)

    aa = ax[1, 1]
    ee = aa.twinx()
    for label, marker in [("base", "o"), ("wide", "s")]:
        rr = [x for x in results if x["interval_label"] == label]
        bins = np.array([x["bins"] for x in rr])
        dnll = np.array([x["delta_nll_sum"] for x in rr])
        edge = np.array([x["endpoint_mass"] for x in rr])
        aa.plot(bins, dnll, marker=marker, label=f"ΔNLL, {label}")
        ee.plot(bins, edge, marker=marker, ls="--", label=f"endpoint mass, {label}")
    aa.axhline(0, color="0.3", lw=1)
    aa.set(xlabel="spectral bins", ylabel="summed ΔNLL",
           title="Held-out penalty and endpoint leakage")
    ee.set_ylabel("endpoint mass fraction")
    h1, l1 = aa.get_legend_handles_labels()
    h2, l2 = ee.get_legend_handles_labels()
    aa.legend(h1+h2, l1+l2, fontsize=8, frameon=False)
    fig.suptitle("Class P diagnostic: positive-spectrum grid-refinement stability", fontsize=15)
    fig.savefig("spectral_grid_refinement_stability.png", dpi=180)
    fig.savefig("spectral_grid_refinement_stability.svg")

    for r in results:
        print(json.dumps({k: v for k, v in r.items()
                          if k not in ("tau", "weights", "folds", "full_inner_scores")},
                         indent=2), flush=True)


if __name__ == "__main__":
    main()
