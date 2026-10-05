"""Two-parameter local drift basis and sentinel-protected minimax calibration."""
import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import chi2, ncx2
from scipy.optimize import brentq, linprog

ASSIGN = 1 - .025 ** (1 / 192)
D_COH = 0.00047514872444755717
D_BLUR = 0.00113265
ALPHA = .05
POWER = .80
SEED = 202610040531


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


def shift_matrices():
    r = np.zeros((5, 5))
    l = np.zeros((5, 5))
    for i in range(5):
        r[i, min(i + 1, 4)] = 1
        l[i, max(i - 1, 0)] = 1
    return r, l


K = nominal_k()
R, L = shift_matrices()
B = -np.eye(5) + (R + L) / 2
V = (R - L) / 2


def channel(b, v):
    if b < abs(v) or b > 1:
        raise ValueError("row-stochastic local channel requires |v| <= b <= 1")
    return np.eye(5) + b * B + v * V


def row_information(p, q):
    bar = (p + q) / 2
    return .5 * np.sum(np.divide((p - q) ** 2, bar,
                                 out=np.zeros_like(bar), where=bar > 0), axis=1)


P_COH, Q_COH = K @ channel(D_COH, D_COH), K @ channel(D_COH, -D_COH)
P_BLUR, Q_BLUR = K @ channel(D_BLUR, 0), K.copy()
I_COH = row_information(P_COH, Q_COH)
I_BLUR = row_information(P_BLUR, Q_BLUR)


def minimax_weights(epsilon):
    # maximize t subject to each risk-boundary direction having information >= t
    c = np.r_[np.zeros(5), -1.]
    aub = np.vstack([np.r_[-I_COH, 1.], np.r_[-I_BLUR, 1.]])
    aeq = np.array([[1, 1, 1, 1, 1, 0.]])
    res = linprog(c, A_ub=aub, b_ub=np.zeros(2), A_eq=aeq, b_eq=[1.],
                  bounds=[(epsilon, None)] * 5 + [(None, None)],
                  method="highs")
    if not res.success:
        raise RuntimeError(res.message)
    return res.x[:5], res.x[5]


def lambda80(df=2):
    crit = chi2.ppf(1 - ALPHA, df)
    return brentq(lambda lam: 1 - ncx2.cdf(crit, df, lam) - POWER, 0, 100)


def score_setup(mrows, pnull):
    # Difference parameter theta=(Delta b, Delta v).
    f = np.zeros((2, 2))
    pieces = []
    for i, m in enumerate(mrows):
        c = np.diag(pnull[i]) - np.outer(pnull[i], pnull[i])
        cp = np.linalg.pinv(c, rcond=1e-12)
        j = np.column_stack((K[i] @ B, K[i] @ V))
        a = .5 * j.T @ cp
        f += (m / 2) * (j.T @ cp @ j)
        pieces.append(a)
    return pieces, np.linalg.pinv(f, rcond=1e-12)


def score_stats(x, y, pieces, finv):
    u = np.zeros((len(x), 2))
    for i, a in enumerate(pieces):
        u += (x[:, i, :] - y[:, i, :]) @ a.T
    return np.einsum("ni,ij,nj->n", u, finv, u)


def simulate(mrows, p, q, nsim, seed, null_probs):
    rng = np.random.default_rng(seed)
    pieces, finv = score_setup(mrows, null_probs)
    xn = np.stack([rng.multinomial(int(m), null_probs[i], nsim)
                   for i, m in enumerate(mrows)], axis=1)
    yn = np.stack([rng.multinomial(int(m), null_probs[i], nsim)
                   for i, m in enumerate(mrows)], axis=1)
    null = score_stats(xn, yn, pieces, finv)
    xa = np.stack([rng.multinomial(int(m), p[i], nsim)
                   for i, m in enumerate(mrows)], axis=1)
    ya = np.stack([rng.multinomial(int(m), q[i], nsim)
                   for i, m in enumerate(mrows)], axis=1)
    alt = score_stats(xa, ya, pieces, finv)
    crit = float(np.quantile(null, 1 - ALPHA, method="higher"))
    return crit, null, alt


def main():
    eps_grid = [0, .001, .005, .01, .02, .05, .10]
    curves = []
    lam = lambda80(2)
    for eps in eps_grid:
        w, t = minimax_weights(eps)
        curves.append({"sentinel_fraction_each_noncenter_row": eps,
                       "weights": w.tolist(),
                       "min_information_per_label_condition": float(t),
                       "asymptotic_total_per_condition_80pct": float(lam / t)})

    # Declared engineering convention: 1% to each non-center row.
    w, t = minimax_weights(.01)
    total = int(np.ceil(lam / t))
    candidates = [int(round(total * z)) for z in (.95, 1.0, 1.05)]
    boots = {}
    for jj, mtot in enumerate(candidates):
        m = np.floor(mtot * w).astype(int)
        m[2] += mtot - int(m.sum())
        entries = {}
        for kk, (name, p, q) in enumerate([
                ("coherent", P_COH, Q_COH), ("blur", P_BLUR, Q_BLUR)]):
            nullp = (p + q) / 2
            crit, null, alt = simulate(m, p, q, 50000,
                                       SEED + 1000 * jj + kk, nullp)
            entries[name] = {"critical_score": crit,
                             "null_rejection": float(np.mean(null > crit)),
                             "power": float(np.mean(alt > crit))}
        boots[str(mtot)] = {"allocation_per_condition": m.tolist(),
                            "total_labels_both_conditions": int(2 * m.sum()),
                            "directions": entries}

    result = {
        "status": "STD/DERIVED local-channel basis; SAT/CANDIDATE metrology application",
        "basis": {
            "formula": "D(b,v)=I+b[-I+(R+L)/2]+v(R-L)/2",
            "constraints": "0<=|v|<=b<=1",
            "interpretation": {"b": "parity-even adjacent blur",
                               "v": "parity-odd signed drift"},
            "minimality_scope": "smallest first-order family under one-step locality, interior translation homogeneity, and mirror covariance"
        },
        "risk_boundary": {"coherent_d": D_COH, "diffuse_d": D_BLUR},
        "row_information": {"coherent": I_COH.tolist(),
                            "diffuse": I_BLUR.tolist()},
        "sentinel_tradeoff": curves,
        "declared_one_percent_design": {
            "weights": w.tolist(),
            "asymptotic_total_per_condition": float(lam / t),
            "bootstrap": boots,
        },
        "failure": "No unique minimax allocation exists under the open constraint w_i>0 alone; a quantitative sentinel floor or an omnibus alternative class must be declared before optimization."
    }
    with open("local_drift_basis_minimax.json", "w") as f:
        json.dump(result, f, indent=2)

    fig, ax = plt.subplots(1, 2, figsize=(12.2, 5.2), constrained_layout=True)
    b = np.linspace(0, 1.2 * D_BLUR, 300)
    ax[0].fill_between(b * 100, -b * 100, b * 100, color="#d9eaf7",
                       label=r"stochastic cone $|v|\leq b$")
    ax[0].plot([D_BLUR * 100], [0], "o", ms=8, label="risk blur")
    ax[0].plot([D_COH * 100] * 2, [-D_COH * 100, D_COH * 100],
               "s", ms=7, label="risk coherent drifts")
    ax[0].set(xlabel="blur coordinate b (%)", ylabel="signed drift v (%)",
              title="Local mirror-covariant channel basis")
    ax[0].grid(alpha=.25); ax[0].legend(frameon=False)
    x = np.arange(5)
    width = .36
    ax[1].bar(x - width / 2, I_COH * 1e5, width, label="coherent boundary")
    ax[1].bar(x + width / 2, I_BLUR * 1e5, width, label="blur boundary")
    ax[1].set(xticks=x, xlabel="labelled true row",
              ylabel=r"information per label ($\times10^{-5}$)",
              title="Why the minimax design concentrates centrally")
    ax[1].grid(axis="y", alpha=.25); ax[1].legend(frameon=False)
    fig.suptitle("Class P — two-parameter detector-drift geometry and row information")
    fig.savefig("local_drift_basis_minimax.svg")
    fig.savefig("local_drift_basis_minimax.png", dpi=180)
    print(json.dumps(result["declared_one_percent_design"], indent=2))


if __name__ == "__main__":
    main()
