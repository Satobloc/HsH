"""Offset-robust finite-aperture design for covariance-matched B3 versus S2.

The resolver is a slab |z-c| <= h.  The unknown carrier-center error u=c0/R
is bounded independently by |u| <= delta.  Empty and full-capture controls
each have 192 repeats and zero observed errors.  No physical particle label is
assigned; this is a typed readout discriminator between two declared measures.
"""

import json

import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import binom

N_CONTROL = 192
ALPHA = 0.05
S = np.sqrt(3.0 / 5.0)
CONTROL_U95 = 1.0 - (ALPHA / 2.0) ** (1.0 / N_CONTROL)


def cdf_b3(x):
    """CDF of z/R for uniform volume measure on the unit B3."""
    x = np.asarray(x, float)
    return np.where(x <= -1, 0.0,
                    np.where(x >= 1, 1.0, 0.5 + 0.75*x - 0.25*x**3))


def occupancy_b3(t, u):
    return cdf_b3(np.asarray(u) + t) - cdf_b3(np.asarray(u) - t)


def occupancy_s2(t, u):
    """Uniform area measure on covariance-matched sphere of radius S."""
    u = np.asarray(u, float)
    overlap = np.maximum(0.0, np.minimum(S, u+t) - np.maximum(-S, u-t))
    return overlap / (2.0*S)


def observed(m):
    e = CONTROL_U95
    return e + (1.0 - 2.0*e)*np.asarray(m)


def threshold_minimax(p_b_max, p_s_min, n):
    """Exact robust threshold when every S2 probability exceeds every B3."""
    best = None
    for k in range(n+2):
        eb = float(binom.sf(k-1, n, p_b_max)) if k <= n else 0.0
        es = float(binom.cdf(k-1, n, p_s_min)) if k > 0 else 0.0
        item = (max(eb, es), k, eb, es)
        if best is None or item < best:
            best = item
    return {"max_error": best[0], "threshold": best[1],
            "error_if_b3": best[2], "error_if_s2": best[3]}


def robust_single(delta, n=192):
    """Geometry-forced robust setting t=S+delta; S2 is fully captured."""
    t = S + delta
    us = np.linspace(-delta, delta, 2001)
    pb = observed(occupancy_b3(t, us))
    ps = observed(occupancy_s2(t, us))
    test = threshold_minimax(float(pb.max()), float(ps.min()), n)
    return {"delta": float(delta), "t": float(t),
            "p_b_range": [float(pb.min()), float(pb.max())],
            "p_s_range": [float(ps.min()), float(ps.max())], **test}


def robust_single_at(delta, t, n=192):
    """Exact nuisance-envelope test for a specified one-view setting."""
    us = np.linspace(-delta, delta, 4001)
    pb = observed(occupancy_b3(t, us))
    ps = observed(occupancy_s2(t, us))
    test = threshold_minimax(float(pb.max()), float(ps.min()), n)
    return {"delta": float(delta), "t": float(t),
            "p_b_range": [float(pb.min()), float(pb.max())],
            "p_s_range": [float(ps.min()), float(ps.max())], **test}


def profile_minimax_two(delta, t, d, n_each, nuisance_points=801):
    """Exact count-grid minimax test for commanded centers +/-d.

    The two candidate families are profiled over the same declared nuisance
    interval, then the likelihood-score threshold is shifted to minimize the
    larger worst-case error.  Discreteness is exact; nuisance maximization is a
    dense deterministic grid.
    """
    u = np.linspace(-delta, delta, nuisance_points)
    pb = np.column_stack([observed(occupancy_b3(t, u-d)),
                          observed(occupancy_b3(t, u+d))])
    ps = np.column_stack([observed(occupancy_s2(t, u-d)),
                          observed(occupancy_s2(t, u+d))])
    k = np.arange(n_each+1)
    lb = np.full((n_each+1, n_each+1), -np.inf)
    ls = np.full_like(lb, -np.inf)
    for p in pb:
        lb = np.maximum(lb, binom.logpmf(k, n_each, p[0])[:, None]
                        + binom.logpmf(k, n_each, p[1])[None, :])
    for p in ps:
        ls = np.maximum(ls, binom.logpmf(k, n_each, p[0])[:, None]
                        + binom.logpmf(k, n_each, p[1])[None, :])

    score = (ls-lb).ravel()
    order = np.argsort(score)
    pmb = np.array([(binom.pmf(k, n_each, p[0])[:, None]
                     * binom.pmf(k, n_each, p[1])[None, :]).ravel()[order]
                    for p in pb])
    pms = np.array([(binom.pmf(k, n_each, p[0])[:, None]
                     * binom.pmf(k, n_each, p[1])[None, :]).ravel()[order]
                    for p in ps])
    # Decide B3 below the score threshold, S2 above it.
    eb = 1.0 - np.cumsum(pmb, axis=1).min(axis=0)
    es = np.cumsum(pms, axis=1).max(axis=0)
    risk = np.maximum(eb, es)
    j = int(np.argmin(risk))
    return {"delta": float(delta), "t": float(t), "command_offset": float(d),
            "repeats_each_setting": int(n_each),
            "max_error": float(risk[j]), "error_if_b3": float(eb[j]),
            "error_if_s2": float(es[j]), "profile_score_threshold": float(score[order[j]])}


def find_single_delta_boundary():
    lo, hi = 0.0, 0.08
    for _ in range(45):
        mid = (lo+hi)/2.0
        if robust_single(mid)["max_error"] <= ALPHA:
            lo = mid
        else:
            hi = mid
    return lo, robust_single(lo), robust_single(hi)


def main():
    delta1, one_pass, one_fail = find_single_delta_boundary()
    # Dense (delta,t) grid audit permits slight S2 clipping and extends the
    # one-view boundary beyond the analytic full-capture rule.  This is a
    # numerical design result, not a closed-form global optimum theorem.
    one_grid = robust_single_at(0.03891441226005554, 0.8105)

    # Frozen two-view design found without using outcome labels: common
    # half-thickness and symmetric commanded centers.  Compare unchanged total
    # specimen budget (96+96) with expanded budget (192+192).
    delta2 = 0.08
    t2, d2 = 0.8025, 0.0525
    two_fixed = profile_minimax_two(delta2, t2, d2, 96)
    two_expanded = profile_minimax_two(delta2, t2, d2, 192)

    one_curve_delta = np.linspace(0, 0.08, 81)
    one_curve = np.array([robust_single(x)["max_error"] for x in one_curve_delta])
    two_grid_delta = np.linspace(0, 0.10, 21)
    two_fixed_curve = np.array([profile_minimax_two(x, t2, d2, 96, 301)["max_error"]
                                for x in two_grid_delta])
    two_exp_curve = np.array([profile_minimax_two(x, t2, d2, 192, 301)["max_error"]
                              for x in two_grid_delta])

    result = {
        "status": "STD/DERIVED for declared measures and top-hat readout; SAT/CANDIDATE as finite-core discriminator",
        "question": "How much independent centering error can the covariance-matched B3/S2 aperture test tolerate, and when do two displaced views help?",
        "covariance_matched_s2_radius_over_b3_radius": float(S),
        "control_zero_error_joint_u95": float(CONTROL_U95),
        "single_setting_robust_rule": "t=h/R=sqrt(3/5)+delta makes S2 occupancy one for every |u|<=delta",
        "single_192_delta_boundary": float(delta1),
        "single_boundary_kind": "analytic full-S2-capture rule",
        "single_boundary_pass": one_pass,
        "single_boundary_fail": one_fail,
        "single_dense_grid_candidate": one_grid,
        "two_view_frozen_design": {"delta": delta2, "t": t2, "centers": [-d2, d2]},
        "two_view_same_total_192": two_fixed,
        "two_view_expanded_total_384": two_expanded,
        "failure_condition": "No guarantee if the independently certified centering bound is exceeded, the response is not a linear top-hat, or measured control errors exceed the inserted guard.",
    }
    with open("offset_robust_aperture_design.json", "w") as f:
        json.dump(result, f, indent=2)

    fig, ax = plt.subplots(2, 2, figsize=(12.8, 9.2), constrained_layout=True)
    th = np.linspace(0, 2*np.pi, 700)
    ax[0, 0].plot(np.cos(th), np.sin(th), color="black", lw=1.8, label="filled B3 boundary, R")
    ax[0, 0].plot(S*np.cos(th), S*np.sin(th), color="#762a83", lw=2.2,
                  label="covariance-matched S2")
    for c, col in [(-d2, "#2166ac"), (d2, "#b2182b")]:
        ax[0, 0].axhspan(c-t2, c+t2, color=col, alpha=.13)
        ax[0, 0].axhline(c, color=col, ls="--", lw=1)
    ax[0, 0].set(aspect="equal", xlim=(-1.08,1.08), ylim=(-1.08,1.08),
                 xlabel="transverse coordinate / R", ylabel="resolver-normal coordinate / R",
                 title="Two commanded views are readout placements, not new cores")
    ax[0, 0].legend(frameon=False, fontsize=8, loc="lower left")

    u = np.linspace(-.1, .1, 600)
    t_boundary = one_pass["t"]
    ax[0, 1].plot(u, occupancy_b3(t_boundary, u), color="black", label="B3 occupancy")
    ax[0, 1].plot(u, occupancy_s2(t_boundary, u), color="#762a83", label="S2 occupancy")
    ax[0, 1].axvspan(-delta1, delta1, color="#d9f0d3", alpha=.6,
                     label=f"one-view 5% bound +/-{delta1:.4f} R")
    ax[0, 1].set(xlabel="unknown center error u=c/R", ylabel="slab occupancy",
                 title="Robust one-view setting: h/R=sqrt(3/5)+delta")
    ax[0, 1].legend(frameon=False, fontsize=8)

    ax[1, 0].semilogy(one_curve_delta, one_curve, color="black", label="one view, 192")
    ax[1, 0].plot(two_grid_delta, two_fixed_curve, "o-", color="#2166ac",
                  label="two views, 96+96")
    ax[1, 0].plot(two_grid_delta, two_exp_curve, "o-", color="#b2182b",
                  label="two views, 192+192")
    ax[1, 0].axhline(.05, color="#1b7837", ls="--", label="5% ceiling")
    ax[1, 0].set(xlabel="certified centering bound delta/R", ylabel="worst exact error",
                 title="A second view helps only with added specimen information")
    ax[1, 0].legend(frameon=False, fontsize=8)

    labels = ["1 view\n192\nat boundary", "2 views\n96+96\nat delta=.08", "2 views\n192+192\nat delta=.08"]
    vals = [one_pass["max_error"], two_fixed["max_error"], two_expanded["max_error"]]
    colors = ["#4d4d4d", "#2166ac", "#b2182b"]
    ax[1, 1].bar(labels, vals, color=colors)
    ax[1, 1].axhline(.05, color="#1b7837", ls="--")
    for i,v in enumerate(vals): ax[1, 1].text(i, v+.004, f"{v:.3f}", ha="center")
    ax[1, 1].set(ylabel="worst exact error", ylim=(0, max(vals)*1.25),
                 title="Intervention-budget comparison")

    fig.suptitle("Class P diagnostic: nuisance-offset robustness of finite-aperture readout", fontsize=15)
    fig.savefig("offset_robust_aperture_design.png", dpi=180)
    fig.savefig("offset_robust_aperture_design.svg")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
