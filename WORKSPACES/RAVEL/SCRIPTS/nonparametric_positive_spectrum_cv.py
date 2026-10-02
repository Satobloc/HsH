"""Nested-CV positive relaxation spectrum versus a discrete two-pole model.

Synthetic metrology only.  The continuum has nonnegative weights on a fixed
log-tau grid.  Its second-difference penalty is selected inside each outer
training fold; outer test radii are never used to select regularization.
"""

import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import lsq_linear

from repeated_covariance_spectrum_selection import (
    TRUE, conditional_nll, estimate_cov, fit as fit_discrete, g_J,
    pole_cov, roots_two, sample_repeats,
)


TAU_GRID = np.geomspace(0.04, 12.0, 25)
Q_GRID = np.linspace(1.8, 3.0, 13)
LAMBDA_GRID = np.array([0.0, 1e-2, 1.0, 1e2, 1e4])
W_SCALE = 0.02


def continuum_g_J(a, z, q, weights):
    den = 1 - 1j * z[:, None] * TAU_GRID[None, :]
    response = (weights[None, :] / den).sum(axis=1)
    F = z*z + 1j*z*a**q*response
    dresponse = (weights[None, :] * (1j*TAU_GRID[None, :]) / den**2).sum(axis=1)
    dF = 2*z + 1j*a**q*response + 1j*z*a**q*dresponse
    n = len(z)
    J = np.zeros((n, 2*n))
    J[np.arange(n), np.arange(n)] = dF.imag
    J[np.arange(n), n+np.arange(n)] = dF.real
    return F.imag, J


def design(a, z, q):
    b = (z*z).imag
    den = 1 - 1j*z[:, None]*TAU_GRID[None, :]
    B = (1j*z[:, None]*a[:, None]**q/den).imag
    return b, B


def d2_matrix(n):
    D = np.zeros((n-2, n))
    for i in range(n-2):
        D[i, i:i+3] = [1, -2, 1]
    return D


D2 = d2_matrix(len(TAU_GRID))


def fit_continuum(a, z, cmean, train, lam):
    best = None
    for q in Q_GRID:
        weights = np.zeros(len(TAU_GRID))
        for _ in range(2):
            _, J = continuum_g_J(a, z, q, weights)
            Cg = J@cmean@J.T
            Ct = Cg[np.ix_(train, train)] + np.eye(len(train))*1e-18
            L = np.linalg.cholesky(Ct)
            b, B = design(a, z, q)
            Aw = np.linalg.solve(L, B[train]*W_SCALE)
            yw = -np.linalg.solve(L, b[train])
            if lam > 0:
                Aaug = np.vstack([Aw, np.sqrt(lam)*D2])
                yaug = np.r_[yw, np.zeros(D2.shape[0])]
            else:
                Aaug, yaug = Aw, yw
            u = lsq_linear(Aaug, yaug, bounds=(0, np.inf),
                           tol=1e-10, max_iter=500).x
            weights = W_SCALE*u
        resid = Aw@u-yw
        objective = float(resid@resid + lam*np.sum((D2@u)**2))
        if best is None or objective < best[0]:
            best = objective, q, weights
    return dict(q=float(best[1]), weights=best[2])


def continuum_nll(a, z, cmean, model, train, test):
    g, J = continuum_g_J(a, z, model["q"], model["weights"])
    Cg = J@cmean@J.T
    CTT = Cg[np.ix_(train, train)] + np.eye(len(train))*1e-18
    Css = Cg[np.ix_(test, test)] + np.eye(len(test))*1e-18
    CsT = Cg[np.ix_(test, train)]
    mu = CsT@np.linalg.solve(CTT, g[train])
    S = Css-CsT@np.linalg.solve(CTT, CsT.T)+np.eye(len(test))*1e-18
    e = g[test]-mu
    return float(e@np.linalg.solve(S, e)+np.linalg.slogdet(S)[1]+len(test)*np.log(2*np.pi))


def choose_lambda(a, z, cmean, outer_train):
    inner_folds = [outer_train[k::2] for k in range(2)]
    scores = []
    for lam in LAMBDA_GRID:
        total = 0.0
        for val in inner_folds:
            tr = np.setdiff1d(outer_train, val)
            model = fit_continuum(a, z, cmean, tr, lam)
            total += continuum_nll(a, z, cmean, model, tr, val)
        scores.append(total)
    j = int(np.argmin(scores))
    return float(LAMBDA_GRID[j]), np.asarray(scores)


def spectrum_summary(weights):
    total = weights.sum()
    p = weights/total if total > 0 else weights
    neff = float(1/np.sum(p*p)) if total > 0 else 0.0
    peaks = []
    for i in range(1, len(weights)-1):
        if weights[i] > weights[i-1] and weights[i] >= weights[i+1] and p[i] > .03:
            peaks.append((float(TAU_GRID[i]), float(p[i])))
    order = np.argsort(weights)[::-1][:5]
    return dict(total_amplitude=float(total), effective_bins=neff,
                local_peaks=peaks,
                top_bins=[(float(TAU_GRID[i]), float(p[i])) for i in order])


def run_one(repeats_count, seed):
    rng = np.random.default_rng(seed)
    a = np.logspace(-1, np.log10(3), 41)
    z0 = roots_two(a)
    reps = sample_repeats(z0, pole_cov(z0), repeats_count, rng)
    z = reps.mean(axis=0)
    chat, shrink = estimate_cov(reps)
    cmean = chat/repeats_count
    interior = np.arange(1, len(a)-1)
    folds = [interior[k::3] for k in range(3)]
    rows = []
    spectra = []
    for fold, test in enumerate(folds):
        train = np.setdiff1d(np.arange(len(a)), test)
        lam, inner_scores = choose_lambda(a, z, cmean, train)
        cont = fit_continuum(a, z, cmean, train, lam)
        x2 = fit_discrete(a, z, cmean, train, "two")
        nll_cont = continuum_nll(a, z, cmean, cont, train, test)
        nll_two = conditional_nll(a, z, cmean, x2, "two", train, test)
        rows.append(dict(fold=fold, selected_lambda=lam,
                         continuum_q=cont["q"], continuum_nll=nll_cont,
                         two_pole_nll=float(nll_two),
                         delta_continuum_minus_two=float(nll_cont-nll_two),
                         inner_scores=inner_scores.tolist()))
        spectra.append(cont["weights"])

    allidx = np.arange(len(a))
    full_lam, full_inner = choose_lambda(a, z, cmean, allidx)
    full = fit_continuum(a, z, cmean, allidx, full_lam)
    return dict(repeats=repeats_count, seed=seed, shrinkage=float(shrink),
                folds=rows, selected_lambda_full=full_lam,
                q_full=full["q"], weights_full=full["weights"],
                spectrum=spectrum_summary(full["weights"]),
                full_inner_scores=full_inner.tolist(),
                fold_spectra=np.asarray(spectra))


def main():
    results = [run_one(96, 731096), run_one(192, 731192)]
    serial = []
    for r in results:
        serial.append({k: (v.tolist() if isinstance(v, np.ndarray) else v)
                       for k, v in r.items()})
    with open("nonparametric_positive_spectrum_cv.json", "w") as f:
        json.dump(serial, f, indent=2)

    fig, ax = plt.subplots(2, 2, figsize=(12, 8), constrained_layout=True)
    for col, r in enumerate(results):
        deltas = [x["delta_continuum_minus_two"] for x in r["folds"]]
        ax[0, col].bar(np.arange(len(deltas)), deltas, color=["tab:blue" if x >= 0 else "tab:red" for x in deltas])
        ax[0, col].axhline(0, color="k", lw=1)
        ax[0, col].set(xlabel="outer held-out fold", ylabel="ΔNLL (continuum − two-pole)",
                       title=f"R={r['repeats']}: predictive comparison")

        W = r["fold_spectra"]
        for w in W:
            ax[1, col].semilogx(TAU_GRID, w/w.sum(), color="0.72", lw=1)
        wf = r["weights_full"]
        ax[1, col].semilogx(TAU_GRID, wf/wf.sum(), "o-", color="tab:purple", lw=2,
                            ms=3, label="full-data selected spectrum")
        for t in (TRUE["t1"], TRUE["t2"]):
            ax[1, col].axvline(t, color="tab:green", ls="--", lw=1.5)
        ax[1, col].set(xlabel="relaxation time τ", ylabel="normalized nonnegative weight",
                       title=(f"λ={r['selected_lambda_full']:.3g}, q={r['q_full']:.2f}, "
                              f"N_eff={r['spectrum']['effective_bins']:.2f}"))
        ax[1, col].legend(fontsize=8)
    fig.suptitle("Nested-CV positive spectrum versus discrete two-channel memory", fontsize=14)
    fig.savefig("nonparametric_positive_spectrum_cv.png", dpi=180)
    fig.savefig("nonparametric_positive_spectrum_cv.svg")

    for r in serial:
        print(json.dumps({k: v for k, v in r.items()
                          if k not in ("weights_full", "fold_spectra", "full_inner_scores")}, indent=2))


if __name__ == "__main__":
    main()
