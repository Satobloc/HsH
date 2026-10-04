"""Finite-sample crossed-calibration design for the five-bin opposed-drift fixture.

The calculation is deliberately conditional: it optimizes power for the
pre-registered opposed coherent +/- bin drift.  It does not certify arbitrary
carrier-dependent changes in untested latent rows.
"""
import json
import numpy as np
from scipy.stats import chi2, ncx2
from scipy.optimize import brentq

ASSIGN = 1 - (.025) ** (1 / 192)
ALPHA = 0.05
TARGET_D = 0.00047514872444755717
RNG_SEED = 2601004


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


def drift(sign, d):
    out = np.eye(5)
    if sign == 1:
        for i in range(4):
            out[i] = 0
            out[i, i] = 1 - d
            out[i, i + 1] = d
    elif sign == -1:
        for i in range(1, 5):
            out[i] = 0
            out[i, i] = 1 - d
            out[i, i - 1] = d
    return out


def row_information(p, q):
    bar = (p + q) / 2
    with np.errstate(divide="ignore", invalid="ignore"):
        z = np.where(bar > 0, 0.5 * (p - q) ** 2 / bar, 0)
    return z.sum(axis=1)


def asymptotic_m_for_power(info, df, power=0.8):
    crit = chi2.ppf(1 - ALPHA, df)
    f = lambda m: 1 - ncx2.cdf(crit, df, m * info) - power
    hi = 1.0
    while f(hi) < 0:
        hi *= 2
    return brentq(f, 0, hi)


def g2_stat(a, b):
    pooled = a + b
    ea = pooled / 2
    with np.errstate(divide="ignore", invalid="ignore"):
        ta = np.where(a > 0, a * np.log(a / ea), 0)
        tb = np.where(b > 0, b * np.log(b / ea), 0)
    return 2 * (ta + tb).sum(axis=(-1, -2))


def simulate_design(p, q, m_rows, nsim=40000, seed=RNG_SEED):
    rng = np.random.default_rng(seed)
    active = np.flatnonzero(np.asarray(m_rows) > 0)
    null_stats = np.zeros(nsim)
    alt_stats = np.zeros(nsim)
    for i in active:
        m = int(m_rows[i])
        bar = (p[i] + q[i]) / 2
        n1 = rng.multinomial(m, bar, nsim)
        n2 = rng.multinomial(m, bar, nsim)
        null_stats += g2_stat(n1[:, None, :], n2[:, None, :])
        a1 = rng.multinomial(m, p[i], nsim)
        a2 = rng.multinomial(m, q[i], nsim)
        alt_stats += g2_stat(a1[:, None, :], a2[:, None, :])
    crit = float(np.quantile(null_stats, 1 - ALPHA, method="higher"))
    power = float(np.mean(alt_stats > crit))
    null_reject = float(np.mean(null_stats > crit))
    return {"critical_g2": crit, "null_rejection": null_reject,
            "power": power, "nsim": nsim}


def main():
    k = nominal_k()
    p = k @ drift(1, TARGET_D)
    q = k @ drift(-1, TARGET_D)
    info = row_information(p, q)
    order = np.argsort(info)[::-1]

    row_asym = []
    for i in range(5):
        row_asym.append({
            "row": int(i),
            "information_per_label_per_condition": float(info[i]),
            "m_per_condition_for_80pct": float(
                asymptotic_m_for_power(info[i], 4)),
        })

    uniform_m = asymptotic_m_for_power(float(info.sum()), 20)
    best = int(order[0])
    best_m = asymptotic_m_for_power(float(info[best]), 4)

    # Finite bootstrap close to asymptotic targets and at the existing m=2500.
    designs = {
        "uniform_current": np.full(5, 2500, dtype=int),
        "uniform_asymptotic": np.full(5, int(round(uniform_m)), dtype=int),
        "best_row_asymptotic": np.eye(5, dtype=int)[best] * int(round(best_m)),
    }
    # Add a 20% guard above the asymptotic row-targeted size.
    designs["best_row_guarded"] = (
        np.eye(5, dtype=int)[best] * int(np.ceil(1.2 * best_m))
    )
    boot = {}
    for j, (name, alloc) in enumerate(designs.items()):
        boot[name] = {
            "allocation_per_condition": alloc.tolist(),
            "total_labels_both_conditions": int(2 * alloc.sum()),
            **simulate_design(p, q, alloc, nsim=50000,
                              seed=RNG_SEED + 101 * j),
        }

    power_brackets = {}
    bracket_designs = {
        "uniform_150000": np.full(5, 150000, dtype=int),
        "uniform_160000": np.full(5, 160000, dtype=int),
        "row2_360000": np.array([0, 0, 360000, 0, 0]),
        "row2_380000": np.array([0, 0, 380000, 0, 0]),
    }
    for j, (name, alloc) in enumerate(bracket_designs.items()):
        power_brackets[name] = {
            "allocation_per_condition": alloc.tolist(),
            "total_labels_both_conditions": int(2 * alloc.sum()),
            **simulate_design(p, q, alloc, nsim=40000,
                              seed=7000 + 101 * j),
        }

    result = {
        "status": "STD/DERIVED finite-multinomial design; SAT/CANDIDATE application",
        "target_opposed_drift": TARGET_D,
        "row_information": row_asym,
        "information_order": [int(x) for x in order],
        "uniform_asymptotic": {
            "m_per_row_per_condition": float(uniform_m),
            "total_labels_both_conditions": float(10 * uniform_m),
        },
        "targeted_asymptotic": {
            "row": best,
            "m_per_condition": float(best_m),
            "total_labels_both_conditions": float(2 * best_m),
        },
        "bootstrap": boot,
        "finite_bootstrap_power_brackets": power_brackets,
        "scope_failure": (
            "Row-targeted allocation has power only for the preregistered opposed "
            "coherent-drift family; it cannot certify shared-channel stationarity "
            "against carrier dependence confined to an unmeasured true row."
        ),
    }
    with open("crossed_calibration_allocation_bootstrap.json", "w") as f:
        json.dump(result, f, indent=2)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
