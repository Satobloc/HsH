"""Joint-covariance closure test for terminal occupancy and pole/residue data.

Two acquisition types are kept separate:
1. SAME-DATA endpoint: q^T mu is reconstructed from the same whitened
   pole/residue repeats.  Its covariance with the pole/residue matched score
   is computed analytically from the retained SVD.
2. DIRECT endpoint: a new terminal measurement with independent repeat noise.
   This is shown both naively and after removing the endpoint kernel component
   already represented by the retained pole/residue row space.
"""

import json

import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import chi2

from spectral_causal_zero_nullspace import calibrated_repeats, whitened_jacobian

TAU = np.geomspace(0.01, 48.0, 97)
T_END = 192.0
Q = 1.0 - np.exp(-T_END / TAU)
R = 192
EPS_REFERENCE = 3e-4
DF_VARIANCE = 2 * (R - 1)
STD_GUARD_95 = float(np.sqrt(chi2.ppf(.975, DF_VARIANCE) / DF_VARIANCE))
RANK_FLOOR = 1.0


def boundary_12_of_13(values):
    return float(np.sort(values)[1])


def main():
    frozen = json.load(open("spectral_causal_zero_nullspace.json"))
    rows = []
    for rec in frozen["seed_results"]:
        seed = int(rec["seed"])
        delta = np.asarray(rec["delta"], float)
        _, stats = calibrated_repeats(seed, TAU)
        J, _ = whitened_jacobian(stats)
        u, s, vt = np.linalg.svd(J, full_matrices=False)
        rank = int(np.sum(s >= RANK_FLOOR))
        ur, sr, vr = u[:, :rank], s[:rank], vt[:rank].T

        # Existing effective experiment and its delta-matched scalar score.
        d = vr.T @ delta
        old_mean = float(np.linalg.norm(sr * d))

        # Minimum-variance linear estimator of q^T P_row mu from the same data.
        c = vr.T @ Q
        endpoint_sd_same = float(np.sqrt(np.sum((c / sr) ** 2)))
        endpoint_mean_same = float(c @ d / endpoint_sd_same)
        rho = float((c @ d) / (old_mean * endpoint_sd_same))
        covariance = np.array([[1.0, rho], [rho, 1.0]])
        means = np.array([old_mean, endpoint_mean_same])
        joint_same = float(np.sqrt(means @ np.linalg.pinv(covariance) @ means))

        # Algebraic identity: the endpoint's signal along this exact contrast
        # is rho times the old matched-score signal, so joint_same == old_mean.
        identity_error = float(abs(endpoint_mean_same - rho * old_mean))

        # A genuinely new direct terminal acquisition is a different object.
        sigma_direct = np.sqrt(2.0 / R) * EPS_REFERENCE
        endpoint_signal = float(Q @ delta)
        direct_z = abs(endpoint_signal) / sigma_direct
        joint_direct = float(np.hypot(old_mean, direct_z))

        # Structural-innovation diagnostic: count only the component outside
        # the retained row space.  This is not a noise-covariance substitute;
        # it is the most conservative typed novelty test for a new readout.
        q_parallel = vr @ (vr.T @ Q)
        q_perp = Q - q_parallel
        novelty = float(np.linalg.norm(q_perp) / np.linalg.norm(Q))
        innovative_signal = float(q_perp @ delta)
        innovative_z = abs(innovative_signal) / sigma_direct
        joint_innovation = float(np.hypot(old_mean, innovative_z))

        def guarded_epsilon(response):
            return float(EPS_REFERENCE * response / STD_GUARD_95)

        rows.append({
            "seed": seed,
            "effective_rank": rank,
            "old_pole_residue_response_sigma": old_mean,
            "same_data_endpoint_standardized_mean": endpoint_mean_same,
            "same_data_score_correlation": rho,
            "same_data_joint_response_sigma": joint_same,
            "same_data_identity_error": identity_error,
            "same_data_guarded_epsilon_max": guarded_epsilon(joint_same),
            "direct_endpoint_signal": endpoint_signal,
            "direct_endpoint_response_sigma": direct_z,
            "independent_direct_joint_response_sigma": joint_direct,
            "independent_direct_guarded_epsilon_max": guarded_epsilon(joint_direct),
            "terminal_kernel_novelty_sine": novelty,
            "innovation_only_signal": innovative_signal,
            "innovation_only_response_sigma": innovative_z,
            "innovation_only_joint_response_sigma": joint_innovation,
            "innovation_only_guarded_epsilon_max": guarded_epsilon(joint_innovation),
        })

    same = [r["same_data_guarded_epsilon_max"] for r in rows]
    direct = [r["independent_direct_guarded_epsilon_max"] for r in rows]
    innov = [r["innovation_only_guarded_epsilon_max"] for r in rows]
    result = {
        "status": "GEN/DERIVED within frozen linear-Gaussian fixture",
        "question": "Does terminal occupancy add information when computed from the same calibrated pole/residue repeats?",
        "object": "joint standardized readout of one frozen wide-minus-restricted spectral displacement",
        "same_data_covariance": "Cov[(z_old,z_q)]=[[1,rho],[rho,1]] from the retained SVD; z_q is a deterministic linear functional of the same whitened repeat vector",
        "same_data_identity": "mu_q=rho*mu_old, hence mu^T Cov^+ mu = mu_old^2 and no rank or SNR is added",
        "direct_measurement_warning": "A separately acquired terminal sample is not the same-data endpoint and needs its own measured cross-covariance model",
        "reference_noise": EPS_REFERENCE,
        "repeats_per_arm": R,
        "std_guard_factor_95pct": STD_GUARD_95,
        "same_data_resolved_at_reference": int(sum(x >= EPS_REFERENCE for x in same)),
        "independent_direct_resolved_at_reference": int(sum(x >= EPS_REFERENCE for x in direct)),
        "innovation_only_resolved_at_reference": int(sum(x >= EPS_REFERENCE for x in innov)),
        "same_data_guarded_boundary_12_of_13": boundary_12_of_13(same),
        "independent_direct_guarded_boundary_12_of_13": boundary_12_of_13(direct),
        "innovation_only_guarded_boundary_12_of_13": boundary_12_of_13(innov),
        "max_same_data_identity_error": max(r["same_data_identity_error"] for r in rows),
        "terminal_novelty_range": [min(r["terminal_kernel_novelty_sine"] for r in rows),
                                   max(r["terminal_kernel_novelty_sine"] for r in rows)],
        "failure_condition": "same-data joint guarded 12/13 boundary remains below epsilon=3e-4",
        "seed_results": rows,
    }
    with open("joint_terminal_pole_covariance.json", "w") as f:
        json.dump(result, f, indent=2)

    x = np.arange(len(rows))
    fig, ax = plt.subplots(2, 2, figsize=(12.8, 9.2), constrained_layout=True)
    rho = np.array([r["same_data_score_correlation"] for r in rows])
    old = np.array([r["old_pole_residue_response_sigma"] for r in rows])
    ep = np.array([r["same_data_endpoint_standardized_mean"] for r in rows])
    ax[0, 0].scatter(rho * old, ep, c=rho, cmap="coolwarm", s=50)
    lim = max(np.max(np.abs(rho * old)), np.max(np.abs(ep))) * 1.08
    ax[0, 0].plot([-lim, lim], [-lim, lim], "k--", lw=1)
    ax[0, 0].set(xlabel=r"$\rho\,\mu_{old}$", ylabel=r"$\mu_q$",
                 title="Same-data covariance identity")

    ax[0, 1].bar(x-.2, old, width=.4, label="old pole/residue")
    ax[0, 1].bar(x+.2, [r["same_data_joint_response_sigma"] for r in rows],
                 width=.4, label="old + same-data endpoint")
    ax[0, 1].axhline(1, color="#b2182b", ls="--")
    ax[0, 1].set(xlabel="fixed tail seed index", ylabel="joint response [sigma]",
                 title="No SNR increment after full covariance")
    ax[0, 1].legend(frameon=False, fontsize=8)

    ax[1, 0].plot(TAU, Q / np.linalg.norm(Q), color="black", label="terminal kernel")
    seed0 = rows[0]["seed"]
    _, stats0 = calibrated_repeats(seed0, TAU)
    J0, _ = whitened_jacobian(stats0)
    _, s0, vt0 = np.linalg.svd(J0, full_matrices=False)
    v0 = vt0[:np.sum(s0 >= RANK_FLOOR)].T
    qp0 = Q - v0 @ (v0.T @ Q)
    ax[1, 0].plot(TAU, qp0 / np.linalg.norm(Q), color="#2166ac",
                  label="outside old row space")
    ax[1, 0].set_xscale("log")
    ax[1, 0].set(xlabel="relaxation time tau", ylabel="normalized kernel",
                 title="Terminal kernel and structural innovation")
    ax[1, 0].legend(frameon=False, fontsize=8)

    ax[1, 1].scatter(x, same, label="same-data joint", color="#762a83")
    ax[1, 1].scatter(x, direct, label="independent direct (optimistic)", color="#1a9850")
    ax[1, 1].scatter(x, innov, label="innovation-only", color="#2166ac")
    ax[1, 1].axhline(EPS_REFERENCE, color="#b2182b", ls="--", label="current noise")
    ax[1, 1].set_yscale("log")
    ax[1, 1].set(xlabel="fixed tail seed index", ylabel="guarded max epsilon",
                 title="12/13 closure remains below current precision")
    ax[1, 1].legend(frameon=False, fontsize=8)

    fig.suptitle("Class P diagnostic: terminal occupancy covariance closure", fontsize=15)
    fig.savefig("joint_terminal_pole_covariance.png", dpi=180)
    fig.savefig("joint_terminal_pole_covariance.svg")
    print(json.dumps({k: v for k, v in result.items() if k != "seed_results"}, indent=2))


if __name__ == "__main__":
    main()
