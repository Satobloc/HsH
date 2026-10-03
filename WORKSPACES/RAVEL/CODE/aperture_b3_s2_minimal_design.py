"""Exact finite-sample design for covariance-matched B3 versus S2 carriers.

The readout is centered top-hat slab occupancy.  Each repeat returns a binary
hit.  A matched empty tare estimates false-positive probability beta; a full
capture control estimates false-negative probability eta.  The discriminating
half-thickness is selected from geometry before sampling.
"""

import json

import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import binom

R = 192
ALPHA = 0.05
ALPHA_CONTROL_EACH = ALPHA / 2.0  # Bonferroni joint 95% for beta and eta
S = np.sqrt(3.0 / 5.0)  # covariance-matched S2 radius / B3 radius


def m_b3(t):
    t = np.asarray(t, float)
    return np.where(t <= 0, 0.0,
                    np.where(t < 1, 1.5 * t - 0.5 * t**3, 1.0))


def m_s2(t):
    t = np.asarray(t, float)
    return np.clip(t / S, 0.0, 1.0)


def observed_probability(m, beta, eta):
    return beta + (1.0 - beta - eta) * m


def minimax_threshold(p_b, p_s, n=R):
    """Best count threshold and maximum of the two exact errors."""
    # Here p_s >= p_b in the design region: decide S2 for k >= threshold.
    best = None
    for k in range(n + 2):
        err_b = float(binom.sf(k - 1, n, p_b)) if k <= n else 0.0
        err_s = float(binom.cdf(k - 1, n, p_s)) if k > 0 else 0.0
        risk = max(err_b, err_s)
        item = (risk, k, err_b, err_s)
        if best is None or item < best:
            best = item
    return {"max_error": best[0], "threshold_count": best[1],
            "error_if_b3": best[2], "error_if_s2": best[3]}


def main():
    # One-sided Clopper-Pearson upper bound after zero errors in R controls.
    control_error_u95 = float(1.0 - ALPHA_CONTROL_EACH ** (1.0 / R))

    grid = np.linspace(0.02, 0.999, 1960)
    rows = []
    for t in grid:
        mb, ms = float(m_b3(t)), float(m_s2(t))
        # Restrict to the branch on which S2 occupancy exceeds B3 occupancy;
        # this contains the forced support-edge setting.
        if ms < mb:
            continue
        ideal = minimax_threshold(mb, ms)
        pb_g = observed_probability(mb, control_error_u95, control_error_u95)
        ps_g = observed_probability(ms, control_error_u95, control_error_u95)
        guarded = minimax_threshold(pb_g, ps_g)
        rows.append({"t": float(t), "m_b3": mb, "m_s2": ms,
                     "gap": ms-mb, "ideal": ideal, "guarded": guarded,
                     "p_b3_guarded": pb_g, "p_s2_guarded": ps_g})

    # Geometry chooses t=S exactly: it uniquely maximizes the occupancy gap.
    t_star = float(S)
    mb_star, ms_star = float(m_b3(t_star)), float(m_s2(t_star))
    ideal_star = minimax_threshold(mb_star, ms_star)
    pb_star = observed_probability(mb_star, control_error_u95, control_error_u95)
    ps_star = observed_probability(ms_star, control_error_u95, control_error_u95)
    guarded_star = minimax_threshold(pb_star, ps_star)

    best_ideal = min(rows, key=lambda x: x["ideal"]["max_error"])
    best_guarded = min(rows, key=lambda x: x["guarded"]["max_error"])
    passing = [x["t"] for x in rows if x["guarded"]["max_error"] <= ALPHA]

    result = {
        "status": "STD/DERIVED for declared uniform measures and binary top-hat readout; SAT/CANDIDATE as finite-core discriminator",
        "question": "What is the smallest preregistered resolver-thickness set that discriminates covariance-matched B3 and S2 carriers at 95% with 192 repeats?",
        "b3_radius": 1.0,
        "s2_covariance_matched_radius": t_star,
        "covariance_identity": "R_B3^2/5 = r_S2^2/3",
        "occupancy_b3": "M_B3(t)=3t/2-t^3/2 for 0<=t<=1",
        "occupancy_s2": "M_S2(t)=min(1,t/sqrt(3/5))",
        "forced_single_thickness": "t=h/(|a|R_B3)=sqrt(3/5)",
        "sampling_budget": {
            "specimen_at_forced_thickness": R,
            "empty_tare": R,
            "full_capture_control": R,
        },
        "alpha_each_hypothesis": ALPHA,
        "zero_error_control_bonferroni_joint_u95": control_error_u95,
        "control_guard_model": "p_obs=beta+(1-beta-eta)M with beta=eta=zero-error U95",
        "at_forced_thickness": {
            "t": t_star,
            "m_b3": mb_star,
            "m_s2": ms_star,
            "occupancy_gap": ms_star-mb_star,
            "ideal": ideal_star,
            "p_b3_guarded": pb_star,
            "p_s2_guarded": ps_star,
            "guarded": guarded_star,
        },
        "grid_best_ideal": best_ideal,
        "grid_best_guarded": best_guarded,
        "guarded_passing_interval": [min(passing), max(passing)] if passing else None,
        "minimum_discriminating_thickness_count": 1 if guarded_star["max_error"] <= ALPHA else None,
        "failure_condition": "the preregistered single setting fails if either exact error exceeds 0.05 after control-calibrated beta/eta are inserted, or if the resolver is not a centered linear top-hat",
    }
    with open("aperture_b3_s2_minimal_design.json", "w") as f:
        json.dump(result, f, indent=2)

    # Class P visual: actual rotational cross-section, analytic occupancies,
    # exact finite-sample risk, and count distributions at the forced setting.
    fig, ax = plt.subplots(2, 2, figsize=(12.8, 9.2), constrained_layout=True)
    th = np.linspace(0, 2*np.pi, 800)
    ax[0, 0].fill_between([-1.08, 1.08], -S, S, color="#d9f0d3", alpha=.8,
                          label="resolver slab |z| <= sqrt(3/5) R")
    ax[0, 0].plot(np.cos(th), np.sin(th), color="black", lw=1.8, label="B3 cross-section, R")
    ax[0, 0].plot(S*np.cos(th), S*np.sin(th), color="#762a83", lw=2.2,
                  label="S2 cross-section, sqrt(3/5) R")
    ax[0, 0].axhline(S, color="#1b7837", ls="--"); ax[0, 0].axhline(-S, color="#1b7837", ls="--")
    ax[0, 0].set(aspect="equal", xlim=(-1.08,1.08), ylim=(-1.08,1.08),
                 xlabel="transverse coordinate / R", ylabel="resolver-normal coordinate / R",
                 title="One slab captures all S2 but excludes B3 caps")
    ax[0, 0].legend(frameon=False, fontsize=8, loc="lower left")

    tt = np.linspace(0, 1.05, 600)
    ax[0, 1].plot(tt, m_b3(tt), color="black", label="filled B3")
    ax[0, 1].plot(tt, m_s2(tt), color="#762a83", label="boundary S2")
    ax[0, 1].axvline(S, color="#1b7837", ls="--", label="forced h/R=sqrt(3/5)")
    ax[0, 1].fill_between(tt, m_b3(tt), m_s2(tt), where=m_s2(tt)>=m_b3(tt),
                          color="#92c5de", alpha=.4)
    ax[0, 1].set(xlabel="normalized half-thickness h/(|a|R)", ylabel="occupancy",
                 title="Covariance-matched carriers have different clipping curves")
    ax[0, 1].legend(frameon=False, fontsize=8)

    gx=np.array([r["t"] for r in rows]); ei=np.array([r["ideal"]["max_error"] for r in rows]); eg=np.array([r["guarded"]["max_error"] for r in rows])
    ax[1, 0].semilogy(gx, ei, label="ideal controls", color="#2166ac")
    ax[1, 0].semilogy(gx, eg, label="95% zero-error control guard", color="#b2182b")
    ax[1, 0].axhline(ALPHA, color="black", ls=":", label="5% per-hypothesis ceiling")
    ax[1, 0].axvline(S, color="#1b7837", ls="--")
    ax[1, 0].set(xlabel="normalized half-thickness", ylabel="minimax exact error",
                 title="One preregistered thickness suffices")
    ax[1, 0].legend(frameon=False, fontsize=8)

    k=np.arange(R+1)
    ax[1, 1].plot(k, binom.pmf(k,R,pb_star), color="black", label="B3, guarded")
    ax[1, 1].plot(k, binom.pmf(k,R,ps_star), color="#762a83", label="S2, guarded")
    ax[1, 1].axvline(guarded_star["threshold_count"]-.5, color="#1b7837", ls="--",
                     label=f"decision threshold k={guarded_star['threshold_count']}")
    ax[1, 1].set_xlim(max(0, guarded_star["threshold_count"]-25), R+.5)
    ax[1, 1].set(xlabel="slab hits among 192 repeats", ylabel="probability",
                 title="Exact guarded count distributions")
    ax[1, 1].legend(frameon=False, fontsize=8)

    fig.suptitle("Class P diagnostic: minimal aperture test for B3 versus S2", fontsize=15)
    fig.savefig("aperture_b3_s2_minimal_design.png", dpi=180)
    fig.savefig("aperture_b3_s2_minimal_design.svg")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
