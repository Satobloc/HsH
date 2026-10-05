"""Support-opening versus within-support drift in the five-bin channel."""
import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import binom

ASSIGN = 1 - .025 ** (1 / 192)
D_COH = 0.00047514872444755717
D_BLUR = 0.00113265
ALPHA = 0.05
POWER = 0.80


def critical_count(trials, floor):
    """Smallest k with P_floor[X >= k] <= alpha."""
    if floor == 0:
        return 1
    k = int(binom.ppf(1 - ALPHA, trials, floor)) + 1
    while k > 0 and binom.sf(k - 2, trials, floor) <= ALPHA:
        k -= 1
    while binom.sf(k - 1, trials, floor) > ALPHA:
        k += 1
    return k


def power_at(n_per_cell, cells, floor, signal):
    trials = int(n_per_cell * cells)
    k = critical_count(trials, floor)
    return float(binom.sf(k - 1, trials, floor + signal)), k


def min_n(cells, floor, signal):
    lo, hi = 0, 1
    while power_at(hi, cells, floor, signal)[0] < POWER:
        hi *= 2
        if hi > 10**11:
            raise RuntimeError("search exceeded 1e11 counts per affected row")
    while lo + 1 < hi:
        mid = (lo + hi) // 2
        if power_at(mid, cells, floor, signal)[0] >= POWER:
            hi = mid
        else:
            lo = mid
    pwr, k = power_at(hi, cells, floor, signal)
    return int(hi), int(k), pwr


def main():
    # Coherent b=|v| opens three second-neighbor cells, each at ASSIGN*b/2.
    # Symmetric blur opens six cells, each at ASSIGN*b/4.
    cases = {
        "coherent": {"cells": 3, "signal_per_open_cell": ASSIGN * D_COH / 2},
    }
    floors = [0.0, 1e-8, 1e-7, 1e-6, 1e-5, 1e-4]
    results = {}
    for name, spec in cases.items():
        rows = []
        for floor in floors:
            n, k, pwr = min_n(spec["cells"], floor, spec["signal_per_open_cell"])
            rows.append({"floor_probability_per_cell": floor,
                         "labels_per_affected_row": n,
                         "aggregate_critical_count": k,
                         "power": pwr})
        results[name] = {**spec, "rows": rows}

    # For exact-zero symmetric blur, four rows open one cell at probability p
    # and the center row opens two cells with total probability 2p.
    p_blur = ASSIGN * D_BLUR / 4
    n_blur = int(np.ceil(np.log(1 - POWER) /
                         (4 * np.log1p(-p_blur) + np.log1p(-2 * p_blur))))

    out = {
        "status": "STD/DERIVED nonregular support test; SAT/CANDIDATE readout discriminator",
        "nominal_adjacent_assignment": ASSIGN,
        "alpha": ALPHA,
        "target_power": POWER,
        "cases": results,
        "exact_zero_blur": {
            "signal_per_open_cell": p_blur,
            "opened_cells": 6,
            "labels_per_affected_row": n_blur,
            "power": float(1 - (1 - p_blur)**(4*n_blur) * (1 - 2*p_blur)**n_blur),
        },
        "scaling": {
            "exact_zero": "local opened-cell probability h/n gives O(1) Poisson counts; detection is O(1/n)",
            "positive_floor": "regular local change is O(1/sqrt(n)); burden depends on the measured floor"
        },
        "failure": "If nominal zeros are only unmeasured tails, treating them as structural makes the zero-false-positive gate anti-conservative. Measure or upper-bound every opened-cell floor before using this branch."
    }
    with open("support_opening_boundary.json", "w") as f:
        json.dump(out, f, indent=2)

    fig, ax = plt.subplots(1, 2, figsize=(12.2, 4.8), constrained_layout=True)
    for name, color, marker in [("coherent", "#355c7d", "o")]:
        x = np.array([r["floor_probability_per_cell"] for r in results[name]["rows"]])
        y = np.array([r["labels_per_affected_row"] for r in results[name]["rows"]])
        ax[0].plot(np.maximum(x, 3e-10), y, marker=marker, color=color, label=name)
    ax[0].axhline(160000, color="#c06c84", ls="--", lw=1.5,
                  label="prior full-score uniform design")
    ax[0].set(xscale="log", yscale="log", xlabel="baseline probability in each opened cell",
              ylabel="labels per affected row for >=80% power",
              title="A tiny detector floor changes the asymptotic regime")
    ax[0].grid(which="both", alpha=.25); ax[0].legend(frameon=False)

    k = np.zeros((5, 5))
    for i in range(5):
        k[i, i] = 1 - ASSIGN
        if i == 0:
            k[i, i] += ASSIGN/2; k[i, 1] += ASSIGN/2
        elif i == 4:
            k[i, i] += ASSIGN/2; k[i, 3] += ASSIGN/2
        else:
            k[i, i-1] += ASSIGN/2; k[i, i+1] += ASSIGN/2
    opened = np.zeros_like(k)
    for i, j in [(0,2),(1,3),(2,4)]: opened[i,j] = 1
    ax[1].imshow(np.where(k > 0, .35, opened), cmap="viridis", vmin=0, vmax=1)
    ax[1].set(xticks=range(5), yticks=range(5), xlabel="reported bin", ylabel="true row",
              title="Right-coherent drift: three support-opening cells")
    for i in range(5):
        for j in range(5):
            label = "open" if opened[i,j] else ("nominal" if k[i,j] > 0 else "")
            if label: ax[1].text(j, i, label, ha="center", va="center",
                                 color="white" if opened[i,j] else "black", fontsize=8)
    fig.suptitle("Class P — support-opening drift is a separate statistical branch")
    fig.savefig("support_opening_boundary.svg")
    fig.savefig("support_opening_boundary.png", dpi=190)
    print(json.dumps(out, indent=2))


if __name__ == "__main__":
    main()
