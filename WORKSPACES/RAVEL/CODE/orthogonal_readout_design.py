"""Blind readout design after the calibrated spectral quotient result.

Compare two candidate operators against the 22-dimensional identifiable row
space of the existing pole-location/residue measurement:

1. a third-order pole-shape (K3) kernel;
2. finite late-time gates of the causal relaxation impulse response.

Selection uses row-space novelty only.  No recovered tail, injected atom, or
particle label enters gate selection.
"""

import json

import matplotlib.pyplot as plt
import numpy as np

from spectral_causal_zero_nullspace import calibrated_repeats, whitened_jacobian
from spectral_joint_radius_frequency import NU, roots_joint

SEED = 740024
TAU = np.geomspace(0.01, 48.0, 97)
SV_FLOOR = 1.0
N_GATES = 6
MIN_GATE_RATIO = 1.8


def row_basis(A, rtol=1e-10):
    """Orthonormal parameter-space basis for the row space of A."""
    _, s, vt = np.linalg.svd(A, full_matrices=False)
    if len(s) == 0 or s[0] == 0:
        return np.zeros((A.shape[1], 0)), s
    rank = int(np.sum(s > rtol * s[0]))
    return vt[:rank].T, s


def k3_design(a, zblocks, tau):
    rows = []
    for z in zblocks:
        den = 1 - 1j * z[:, None] * tau[None, :]
        # The irrelevant global scalar is omitted; row-space geometry is scale invariant.
        K = a[:, None] ** 2.4 / den**3
        rows.extend([K.real, K.imag])
    return np.vstack(rows)


def gate_row(T, tau):
    """Impulse-response mass integrated over [T,2T]."""
    return np.exp(-T/tau) - np.exp(-2*T/tau)


def greedy_gates(Vold, tau, n=N_GATES):
    candidate_t = np.geomspace(0.015, 96.0, 80)
    chosen, rows = [], []
    P = Vold @ Vold.T
    for _ in range(n):
        best = None
        for T in candidate_t:
            # Prevent a formally high-rank but experimentally redundant bank of
            # nearly coincident windows.  This is fixed before tail inspection.
            if any(max(T/x, x/T) < MIN_GATE_RATIO for x in chosen):
                continue
            trial = np.vstack(rows + [gate_row(T, tau)])
            Q, _ = row_basis(trial)
            residual = (np.eye(len(tau)) - P) @ Q
            sv = np.linalg.svd(residual, compute_uv=False)
            # Lexicographic: add rank, maximize weakest novelty, then total novelty.
            score = (int(np.sum(sv > 1e-8)), float(sv[-1]), float(np.sum(sv**2)))
            if best is None or score > best[0]:
                best = (score, float(T), trial)
        chosen.append(best[1])
        rows = [r for r in best[2]]
    return np.asarray(chosen), np.vstack(rows)


def novelty(Vold, A):
    Q, raw_s = row_basis(A)
    R = (np.eye(Vold.shape[0]) - Vold @ Vold.T) @ Q
    s = np.linalg.svd(R, compute_uv=False)
    return Q, raw_s, s


def leverage(Q):
    if Q.shape[1] == 0:
        return np.zeros(Q.shape[0])
    return np.sum(Q**2, axis=1) / Q.shape[1]


def main():
    a, stats = calibrated_repeats(SEED, TAU)
    J, shrinkage = whitened_jacobian(stats)
    _, s, vt = np.linalg.svd(J, full_matrices=False)
    rank = int(np.sum(s >= SV_FLOOR))
    Vold = vt[:rank].T

    zblocks = np.split(roots_joint(a, NU), len(NU))
    K3 = k3_design(a, zblocks, TAU)
    Q3, s3raw, s3nov = novelty(Vold, K3)

    gate_t, G = greedy_gates(Vold, TAU)
    Qg, sgraw, sgnov = novelty(Vold, G)
    late = gate_row(float(gate_t[0]), TAU)
    late_unit = late / np.linalg.norm(late)
    late_novelty = float(np.linalg.norm((np.eye(len(TAU)) - Vold @ Vold.T) @ late_unit))

    tail = TAU > 12.0
    old_lev, k3_lev, gate_lev = leverage(Vold), leverage(Q3), leverage(Qg)
    result = {
        "status": "GEN/CANDIDATE",
        "question": "Which preregisterable readout adds high-tau directions outside the calibrated pole/residue row space?",
        "selection_rule": "maximize projected row-space novelty before examining recovered tails",
        "representative_covariance_seed": SEED,
        "existing_effective_rank": rank,
        "existing_singular_values": s.tolist(),
        "calibration_covariance_shrinkage": shrinkage,
        "candidate_k3": {
            "raw_row_rank": int(Q3.shape[1]),
            "novel_rank": int(np.sum(s3nov > 1e-8)),
            "novelty_singular_values": s3nov.tolist(),
            "strong_novel_modes_sine_ge_0p5": int(np.sum(s3nov >= .5)),
            "minimum_novelty_sine": float(s3nov[-1]),
            "tail_leverage_fraction": float(k3_lev[tail].sum()/k3_lev.sum()),
            "calibration_burden": "requires a stable second local pole-shape/Laurent coefficient",
        },
        "candidate_time_gates": {
            "kernel": "exp(-T/tau)-exp(-2T/tau)",
            "minimum_gate_time_ratio": MIN_GATE_RATIO,
            "selected_T": gate_t.tolist(),
            "raw_row_rank": int(Qg.shape[1]),
            "novel_rank": int(np.sum(sgnov > 1e-8)),
            "novelty_singular_values": sgnov.tolist(),
            "strong_novel_modes_sine_ge_0p5": int(np.sum(sgnov >= .5)),
            "minimum_novelty_sine": float(sgnov[-1]),
            "tail_leverage_fraction": float(gate_lev[tail].sum()/gate_lev.sum()),
            "single_latest_gate": {
                "T": float(gate_t[0]),
                "novelty_sine": late_novelty,
                "tail_leverage_fraction": float(np.sum(late_unit[tail]**2)),
                "maximum_kernel_amplitude": float(np.max(late)),
            },
            "calibration_burden": "unit-impulse tare plus six fixed integration windows",
        },
        "existing_tail_leverage_fraction": float(old_lev[tail].sum()/old_lev.sum()),
        "tau": TAU.tolist(),
        "leverage": {"existing": old_lev.tolist(), "k3": k3_lev.tolist(), "gates": gate_lev.tolist()},
    }
    json.dump(result, open("orthogonal_readout_design.json", "w"), indent=2)

    fig, ax = plt.subplots(2, 2, figsize=(12.8, 9.2), constrained_layout=True)
    ax[0, 0].semilogy(np.arange(1, len(s)+1), s, "o-", ms=2.6, color="#2166ac")
    ax[0, 0].axhline(1, color="#b2182b", ls="--", label="effective floor")
    ax[0, 0].set(xlabel="singular mode", ylabel="whitened singular value",
                 title=f"Existing calibrated operator: rank {rank}/97")
    ax[0, 0].legend(frameon=False)

    m = max(len(s3nov), len(sgnov))
    x = np.arange(1, m+1)
    ax[0, 1].plot(x[:len(s3nov)], np.sort(s3nov)[::-1], "o-", label="K3 pole shape")
    ax[0, 1].plot(x[:len(sgnov)], np.sort(sgnov)[::-1], "s-", label="late-time gates")
    ax[0, 1].set(xlabel="candidate row-space mode", ylabel="novelty sine",
                 title="Principal-angle novelty vs existing row space", ylim=(-.03, 1.03))
    ax[0, 1].legend(frameon=False)

    for T in gate_t:
        ax[1, 0].plot(TAU, gate_row(T, TAU), label=f"T={T:.3g}")
    ax[1, 0].set_xscale("log")
    ax[1, 0].set(xlabel="relaxation time tau", ylabel="gate kernel",
                 title="Blindly selected impulse-response windows")
    ax[1, 0].legend(frameon=False, fontsize=7, ncol=2)

    ax[1, 1].plot(TAU, old_lev, label="existing pole + residue", color="#2166ac")
    ax[1, 1].plot(TAU, k3_lev, label="K3 pole shape", color="#d73027")
    ax[1, 1].plot(TAU, gate_lev, label="late-time gates", color="#1a9850")
    ax[1, 1].axvline(12, color="black", ls=":", lw=1)
    ax[1, 1].set_xscale("log")
    ax[1, 1].set(xlabel="relaxation time tau", ylabel="mean row-space leverage",
                 title="Where each readout spends identifiability")
    ax[1, 1].legend(frameon=False, fontsize=8)
    fig.suptitle("Class P diagnostic: orthogonal readout design", fontsize=15)
    fig.savefig("orthogonal_readout_design.png", dpi=180)
    fig.savefig("orthogonal_readout_design.svg")
    print(json.dumps({k: v for k, v in result.items() if k not in ("tau", "leverage", "existing_singular_values")}, indent=2))


if __name__ == "__main__":
    main()
