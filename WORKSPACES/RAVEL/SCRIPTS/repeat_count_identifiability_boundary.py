"""Repeat-count phase diagram for covariance-aware two-memory recovery.

This is a synthetic metrology test, not a physical prediction.  It asks how
many independent repeats are needed before a two-pole relaxation spectrum is
recoverable when the full complex-pole covariance must be estimated from the
same repeats.
"""

import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import least_squares

from repeated_covariance_spectrum_selection import (
    TRUE, conditional_nll, estimate_cov, g_J, pole_cov, roots_two,
    sample_repeats, unpack,
)


R_COUNTS = np.array([8, 16, 32, 64, 96, 192])
N_SEEDS = 40


def compact_starts(kind):
    """Small, fixed, target-blind start bank for the Monte Carlo ladder."""
    if kind == "one":
        starts = [
            [np.log(.2), 1.5, np.log(.015)],
            [np.log(.8), 2.5, np.log(.025)],
            [np.log(2.5), 3.5, np.log(.02)],
        ]
        return starts, [-5, -2, -12], [4, 7, 1]
    starts = [
        [np.log(.08), np.log(.7), 1.5, np.log(.006), np.log(.016)],
        [np.log(.35), np.log(1.4), 2.5, np.log(.012), np.log(.008)],
        [np.log(.9), np.log(3.0), 3.5, np.log(.018), np.log(.004)],
    ]
    return starts, [-5, -5, -2, -12, -12], [3, 4, 7, 1, 1]


def fast_fit(a, z, cmean, train, kind):
    starts, lo, hi = compact_starts(kind)
    best = None
    for x0 in starts:
        x = np.asarray(x0, float)
        # Two feasible-GLS iterations are enough for this bounded phase test.
        for _ in range(2):
            g, J = g_J(a, z, x, kind)
            cr = J @ cmean @ J.T
            ct = cr[np.ix_(train, train)] + np.eye(len(train)) * 1e-18
            L = np.linalg.cholesky(ct)

            def fun(y):
                return np.linalg.solve(L, g_J(a, z, y, kind)[0][train])

            x = least_squares(
                fun, x, bounds=(lo, hi), max_nfev=500,
                xtol=2e-8, ftol=2e-8, gtol=2e-8,
            ).x
        score = float(np.sum(fun(x) ** 2))
        if best is None or score < best[0]:
            best = score, x
    return best[1]


def recovered(p):
    """Predeclared recovery event; uses injected truth only for validation."""
    t = np.asarray(p["taus"])
    log_tau_err = np.max(np.abs(np.log(t / [TRUE["t1"], TRUE["t2"]])))
    q_err = abs(p["q"] - TRUE["q"])
    return bool((t[1] / t[0] > 3.0) and (log_tau_err < .25) and (q_err < .20))


def wilson(k, n, z=1.96):
    p = k / n
    den = 1 + z*z/n
    ctr = (p + z*z/(2*n)) / den
    half = z*np.sqrt(p*(1-p)/n + z*z/(4*n*n)) / den
    return ctr-half, ctr+half


def main():
    a = np.logspace(-1, np.log10(3), 41)
    z0 = roots_two(a)
    ctrue = pole_cov(z0)
    n = len(a)
    p_dim = 2*n
    test = np.arange(2, n-2, 5)
    train = np.setdiff1d(np.arange(n), test)
    records = []

    for R in R_COUNTS:
        for seed in range(N_SEEDS):
            rng = np.random.default_rng(910_000 + 1000*R + seed)
            reps = sample_repeats(z0, ctrue, int(R), rng)
            z = reps.mean(axis=0)
            chat, shrink = estimate_cov(reps)
            cmean = chat/R
            x1 = fast_fit(a, z, cmean, train, "one")
            x2 = fast_fit(a, z, cmean, train, "two")
            nll1 = conditional_nll(a, z, cmean, x1, "one", train, test)
            nll2 = conditional_nll(a, z, cmean, x2, "two", train, test)
            p2 = unpack(x2, "two")
            rec = recovered(p2)
            records.append(dict(
                repeats=int(R), seed=seed, shrinkage=float(shrink),
                covariance_rank=min(int(R)-1, p_dim),
                delta_nll=float(nll1-nll2), recovered=rec,
                selected_and_recovered=bool((nll1 > nll2) and rec),
                q=float(p2["q"]), tau1=float(p2["taus"][0]),
                tau2=float(p2["taus"][1]),
            ))

    summary = []
    for R in R_COUNTS:
        rr = [x for x in records if x["repeats"] == R]
        k = sum(x["selected_and_recovered"] for x in rr)
        lo, hi = wilson(k, len(rr))
        summary.append(dict(
            repeats=int(R), successes=k, trials=len(rr), rate=k/len(rr),
            wilson95=[lo, hi], median_delta_nll=float(np.median([x["delta_nll"] for x in rr])),
            median_shrinkage=float(np.median([x["shrinkage"] for x in rr])),
            sample_covariance_rank=min(int(R)-1, p_dim),
        ))

    threshold = next((x["repeats"] for x in summary if x["rate"] >= .95), None)
    payload = dict(
        vector_dimension=p_dim,
        exact_full_rank_boundary=p_dim+1,
        success_rule="delta_nll>0; tau2/tau1>3; max |log(tau/tau*)|<0.25; |q-q*|<0.20",
        empirical_point_threshold_95=threshold,
        summary=summary,
        records=records,
    )
    with open("repeat_count_identifiability_boundary.json", "w") as f:
        json.dump(payload, f, indent=2)

    rates = np.array([x["rate"] for x in summary])
    lows = np.array([x["wilson95"][0] for x in summary])
    highs = np.array([x["wilson95"][1] for x in summary])
    dnll = np.array([x["median_delta_nll"] for x in summary])
    shrink = np.array([x["median_shrinkage"] for x in summary])

    fig, ax = plt.subplots(1, 3, figsize=(14, 4.5), constrained_layout=True)
    ax[0].errorbar(R_COUNTS, rates, yerr=[rates-lows, highs-rates], fmt="o-", capsize=4)
    ax[0].axhline(.95, color="tab:red", ls="--", label="95% point criterion")
    ax[0].axvline(p_dim+1, color="k", ls=":", label="raw covariance full-rank boundary")
    ax[0].set(xscale="log", ylim=(-.03, 1.04), xlabel="independent repeats R",
              ylabel="selection + parameter recovery rate", title="Empirical identifiability")
    ax[0].legend(fontsize=8)

    ax[1].semilogx(R_COUNTS, dnll, "o-")
    ax[1].axhline(0, color="k", lw=1)
    ax[1].set(xlabel="independent repeats R", ylabel="median held-out ΔNLL (one − two)",
              title="Discrete two-pole discrimination")

    ax[2].semilogx(R_COUNTS, shrink, "o-", color="tab:purple", label="Ledoit–Wolf shrinkage")
    ax[2].plot(R_COUNTS, np.minimum(R_COUNTS-1, p_dim)/p_dim, "s--", color="tab:green",
               label="raw rank / 82")
    ax[2].axvline(p_dim+1, color="k", ls=":")
    ax[2].set(xlabel="independent repeats R", ylabel="fraction", ylim=(-.03, 1.05),
              title="Covariance support vs regularization")
    ax[2].legend(fontsize=8)

    fig.suptitle("Repeat-count boundary for covariance-aware two-memory recovery", fontsize=14)
    fig.savefig("repeat_count_identifiability_boundary.png", dpi=180)
    fig.savefig("repeat_count_identifiability_boundary.svg")

    print(json.dumps({k: payload[k] for k in payload if k != "records"}, indent=2))


if __name__ == "__main__":
    main()
