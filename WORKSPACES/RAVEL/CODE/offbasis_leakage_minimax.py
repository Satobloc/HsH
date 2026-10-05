"""Minimax crossed calibration for common drift plus row-local leakage faults."""
import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import linprog

ASSIGN = 1 - .025 ** (1 / 192)
D_COH = 0.00047514872444755717
D_BLUR = 0.00113265
ALPHA = .05
SEED = 202610051437


def nominal_k():
    k = np.zeros((5, 5))
    for i in range(5):
        k[i, i] = 1 - ASSIGN
        if i == 0:
            k[i, i] += ASSIGN / 2
            k[i, i + 1] += ASSIGN / 2
        elif i == 4:
            k[i, i] += ASSIGN / 2
            k[i, i - 1] += ASSIGN / 2
        else:
            k[i, i - 1] += ASSIGN / 2
            k[i, i + 1] += ASSIGN / 2
    return k


def shifts():
    r = np.zeros((5, 5)); l = np.zeros((5, 5))
    for i in range(5):
        r[i, min(i + 1, 4)] = 1
        l[i, max(i - 1, 0)] = 1
    return r, l


K = nominal_k()
R, L = shifts()
B = -np.eye(5) + (R + L) / 2
V = (R - L) / 2


def channel(b, v):
    return np.eye(5) + b * B + v * V


def local_leak(row, q):
    """Transfer q from reported diagonal to its adjacent neighbor(s), in one true row."""
    out = K.copy()
    out[row, row] -= q
    if row == 0:
        out[row, 1] += q
    elif row == 4:
        out[row, 3] += q
    else:
        out[row, row - 1] += q / 2
        out[row, row + 1] += q / 2
    return out


ALTS = [
    ("coherent", K @ channel(D_COH, D_COH), K @ channel(D_COH, -D_COH)),
    ("blur", K @ channel(D_BLUR, 0), K.copy()),
]
ALTS += [(f"local_row_{i}", K.copy(), local_leak(i, D_COH)) for i in range(5)]


def covpinv(p):
    c = np.diag(p) - np.outer(p, p)
    return np.linalg.pinv(c, rcond=1e-12)


CP = [covpinv(p) for p in K]


def info_vector(p, q):
    d = p - q
    return np.array([.5 * d[i] @ CP[i] @ d[i] for i in range(5)])


INFOS = np.stack([info_vector(p, q) for _, p, q in ALTS])


def minimax_weights():
    # maximize t such that w dot I_a >= t for every declared alternative a
    c = np.r_[np.zeros(5), -1.]
    aub = np.c_[-INFOS, np.ones(len(ALTS))]
    res = linprog(c, A_ub=aub, b_ub=np.zeros(len(ALTS)),
                  A_eq=[np.r_[np.ones(5), 0]], b_eq=[1],
                  bounds=[(0, None)] * 5 + [(None, None)], method="highs")
    if not res.success:
        raise RuntimeError(res.message)
    return res.x[:5], res.x[5]


def allocations(total, w):
    m = np.floor(total * w).astype(int)
    order = np.argsort(-(total * w - m))
    for i in order[:total - int(m.sum())]:
        m[i] += 1
    return m


def direction_setup(mrows, p, q):
    d = p - q
    a = [CP[i] @ d[i] for i in range(5)]
    var = 2 * sum(mrows[i] * (d[i] @ CP[i] @ d[i]) for i in range(5))
    return a, var


def max_scores(x, y, setups):
    vals = []
    for a, var in setups:
        z = sum((x[:, i] - y[:, i]) @ a[i] for i in range(5)) / np.sqrt(var)
        vals.append(z * z)
    return np.max(np.stack(vals, axis=1), axis=1)


def draw_counts(rng, probs, mrows, nsim):
    return np.stack([rng.multinomial(int(m), probs[i], nsim)
                     for i, m in enumerate(mrows)], axis=1)


def bootstrap(total, w, nsim=50000):
    m = allocations(total, w)
    setups = [direction_setup(m, p, q) for _, p, q in ALTS]
    rng = np.random.default_rng(SEED + total)
    xn = draw_counts(rng, K, m, nsim)
    yn = draw_counts(rng, K, m, nsim)
    null = max_scores(xn, yn, setups)
    crit = float(np.quantile(null, 1 - ALPHA, method="higher"))
    powers = {}
    for name, p, q in ALTS:
        xa = draw_counts(rng, p, m, nsim)
        ya = draw_counts(rng, q, m, nsim)
        powers[name] = float(np.mean(max_scores(xa, ya, setups) > crit))
    return {"allocation_per_condition": m.tolist(),
            "total_labels_both_conditions": int(2 * total),
            "critical_max_score": crit,
            "null_rejection": float(np.mean(null > crit)),
            "power": powers,
            "min_power": float(min(powers.values()))}


def main():
    w, t = minimax_weights()
    # Pilot scale from Bonferroni chi-square threshold; bracket empirically.
    totals = [8000000, 8200000, 8400000]
    boots = {str(n): bootstrap(n, w) for n in totals}
    result = {
        "status": "STD/DERIVED design calculation; SAT/CANDIDATE metrology application",
        "declared_offbasis_fault": {
            "type": "one true row transfers q from diagonal report to adjacent report bins",
            "amplitude_q": D_COH,
            "reason_for_scale": "same per-event amplitude as the already consequential coherent drift crossing"
        },
        "alternatives": [x[0] for x in ALTS],
        "information_vectors": {ALTS[i][0]: INFOS[i].tolist() for i in range(len(ALTS))},
        "minimax_weights": w.tolist(),
        "min_information_per_label_condition": float(t),
        "bootstrap": boots,
        "scope_failure": "Does not cover non-adjacent, nonlinear, state-dependent, or multi-row coordinated faults."
    }
    with open("offbasis_leakage_minimax.json", "w") as f:
        json.dump(result, f, indent=2)

    fig, ax = plt.subplots(1, 2, figsize=(12.2, 5.1), constrained_layout=True)
    im = ax[0].imshow(INFOS * 1e5, aspect="auto", cmap="viridis")
    ax[0].set(yticks=np.arange(len(ALTS)), yticklabels=[x[0] for x in ALTS],
              xticks=np.arange(5), xlabel="labelled true row",
              title="Information support by fault direction")
    ax[0].set_ylabel("declared alternative")
    fig.colorbar(im, ax=ax[0], label=r"information/label ($\times10^{-5}$)")
    ax[1].bar(np.arange(5), w * 100, color="#7b5ea7")
    ax[1].set(xticks=np.arange(5), xlabel="labelled true row",
              ylabel="allocation per condition (%)",
              title="Minimax allocation with row-local sentinels")
    ax[1].grid(axis="y", alpha=.25)
    fig.suptitle("Class P — common drift plus equal-scale row-local leakage")
    fig.savefig("offbasis_leakage_minimax.svg")
    fig.savefig("offbasis_leakage_minimax.png", dpi=180)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
