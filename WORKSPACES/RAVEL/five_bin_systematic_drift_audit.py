"""Systematic calibration-to-test drift audit for the frozen five-bin GLRT.

The nominal calibration channel K0 and frozen threshold come from the preceding
joint nuisance packet.  Test-time drift is represented by a row-stochastic
post-readout channel D(d), so K_test = K0 @ D while the decoder continues to use
independent finite-m calibration estimates of K0.  This keeps physical geometry,
calibration noise, and systematic detector drift as separate typed objects.
"""
import json
import numpy as np
import matplotlib.pyplot as plt

N = 192
M = 2500
DELTA = 0.08
ETA = 0.016
S = np.sqrt(3 / 5)
ASSIGN = 1 - 0.025 ** (1 / 192)
ALPHA = 0.5
THRESHOLD = -0.7990585579482143
SEED = 202610040137
N_K = 200
REPS = 100
D_GRID = np.r_[np.arange(0, 0.00301, 0.00025), np.arange(0.004, 0.0201, 0.002)]
EDGES = np.array([-np.inf, -S-DELTA, -S+DELTA, S-DELTA, S+DELTA, np.inf])


def cdf_b3(x):
    x = np.asarray(x, float)
    y = np.clip(x, -1, 1)
    return np.where(x <= -1, 0, np.where(x >= 1, 1, .5 + .75*y - .25*y**3))


def cdf_s2(x):
    return np.clip((np.asarray(x, float) + S) / (2*S), 0, 1)


def latent(kind, u, rho):
    cdf = cdf_b3 if kind == "B3" else cdf_s2
    return np.diff(cdf(rho*EDGES-u))


def nominal_k():
    k = np.zeros((5, 5))
    for i in range(5):
        k[i, i] = 1-ASSIGN
        if i == 0:
            k[i, i] += ASSIGN/2; k[i, i+1] += ASSIGN/2
        elif i == 4:
            k[i, i] += ASSIGN/2; k[i, i-1] += ASSIGN/2
        else:
            k[i, i-1] += ASSIGN/2; k[i, i+1] += ASSIGN/2
    return k


K0 = nominal_k()
PROFILE = np.array([(u, r) for u in np.linspace(-DELTA, DELTA, 41)
                    for r in np.linspace(1-ETA, 1+ETA, 17)])
QB = np.array([latent("B3", *x) for x in PROFILE])
QS = np.array([latent("S2", *x) for x in PROFILE])


# The preceding dense-mesh audit and its independent confirmation locate these
# mirror-paired critical cells.  Mirroring is retained because coherent drift
# breaks left/right symmetry.
B_CELLS = np.array([[-DELTA/3, 1+ETA], [DELTA/3, 1+ETA]])
S_CELLS = np.array([[-DELTA, 1-ETA], [DELTA, 1-ETA]])
LB = np.array([latent("B3", *x) for x in B_CELLS])
LS = np.array([latent("S2", *x) for x in S_CELLS])


def drift_matrix(kind, d):
    D = np.eye(5)
    if kind == "diffuse":
        for i in range(1, 4):
            D[i] = 0; D[i, i] = 1-d; D[i, i-1] = d/2; D[i, i+1] = d/2
        D[0] = 0; D[0, 0] = 1-d/2; D[0, 1] = d/2
        D[4] = 0; D[4, 4] = 1-d/2; D[4, 3] = d/2
    elif kind == "plus":
        for i in range(4):
            D[i] = 0; D[i, i] = 1-d; D[i, i+1] = d
    elif kind == "minus":
        for i in range(1, 5):
            D[i] = 0; D[i, i] = 1-d; D[i, i-1] = d
    else:
        raise ValueError(kind)
    return D


def draw_khat(rng):
    c = np.array([rng.multinomial(M, row) for row in K0])
    return (c+ALPHA)/(M+5*ALPHA)


def scores(counts, khat):
    logb = np.log(np.clip(QB@khat, 1e-300, 1))
    logs = np.log(np.clip(QS@khat, 1e-300, 1))
    flat = counts.reshape(-1, 5)
    return (np.max(flat@logb.T, axis=1)-np.max(flat@logs.T, axis=1)).reshape(counts.shape[:-1])


def cluster_upper(x):
    return min(1.0, float(np.mean(x)+1.96*np.std(x, ddof=1)/np.sqrt(len(x))))


BASE = {"B3_mean": 0.04303, "B3_U95": 0.044299008413006276,
        "S2_mean": 0.04469, "S2_U95": 0.046129309948697995}


def coupled_counts(uniforms, probs):
    """Inverse-CDF categorical coupling for all cells and repeats."""
    cut = np.cumsum(probs, axis=1)[:, None, None, :]
    idx = np.sum(uniforms[..., None] > cut, axis=-1)
    return np.stack([np.sum(idx == j, axis=-1) for j in range(5)], axis=-1)


def audit_family(kind):
    # Shared Khat and uniforms make the calculation a paired drift penalty.
    rng = np.random.default_rng(SEED)
    khats = [draw_khat(rng) for _ in range(N_K)]
    ubank = rng.random((N_K, len(B_CELLS), REPS, N))
    sbank = rng.random((N_K, len(S_CELLS), REPS, N))
    p0b, p0s = LB@K0, LS@K0
    base_ib, base_is = [], []
    for j, kh in enumerate(khats):
        base_ib.append(scores(coupled_counts(ubank[j], p0b), kh) <= THRESHOLD)
        base_is.append(scores(coupled_counts(sbank[j], p0s), kh) > THRESHOLD)
    base_ib, base_is = np.asarray(base_ib), np.asarray(base_is)
    rows = []
    for d in D_GRID:
        kt = K0 @ drift_matrix(kind, float(d))
        pb = LB @ kt
        ps = LS @ kt
        db, ds = [], []
        for j, kh in enumerate(khats):
            ib = scores(coupled_counts(ubank[j], pb), kh) <= THRESHOLD
            is_ = scores(coupled_counts(sbank[j], ps), kh) > THRESHOLD
            db.append(np.mean(ib.astype(int)-base_ib[j].astype(int), axis=1))
            ds.append(np.mean(is_.astype(int)-base_is[j].astype(int), axis=1))
        db, ds = np.asarray(db), np.asarray(ds)
        mb = BASE["B3_mean"] + db.mean(0)
        ms = BASE["S2_mean"] + ds.mean(0)
        ub = np.array([BASE["B3_U95"]+cluster_upper(db[:, i]) for i in range(len(B_CELLS))])
        us = np.array([BASE["S2_U95"]+cluster_upper(ds[:, i]) for i in range(len(S_CELLS))])
        ib, is_ = int(np.argmax(ub)), int(np.argmax(us))
        rows.append({"d": float(d), "B3_mean_max": float(mb.max()),
                     "S2_mean_max": float(ms.max()), "B3_U95_max": float(ub[ib]),
                     "S2_U95_max": float(us[is_]), "B3_U95_cell": B_CELLS[ib].tolist(),
                     "S2_U95_cell": S_CELLS[is_].tolist(),
                     "envelope_U95": float(max(ub[ib], us[is_]))})
    return rows


def crossing(rows, level=.05):
    ys = np.array([r["envelope_U95"] for r in rows])
    ix = np.where(ys >= level)[0]
    if len(ix) == 0: return None
    i = int(ix[0])
    if i == 0: return float(D_GRID[0])
    x0, x1 = D_GRID[i-1], D_GRID[i]; y0, y1 = ys[i-1], ys[i]
    return float(x0+(level-y0)*(x1-x0)/(y1-y0))


def main():
    fams = {k: audit_family(k) for k in ("diffuse", "plus", "minus")}
    result = {
        "status": "STD/DERIVED conditional critical-cell systematic-drift audit; sandbox only",
        "question": "How much post-calibration detector drift can the frozen five-bin GLRT tolerate before its clustered 95% risk envelope reaches 5%?",
        "design": {"N": N, "m_per_true_bin": M, "threshold": THRESHOLD,
                   "offset_bound": DELTA, "scale_half_width": ETA,
                   "critical_cells": {"B3": B_CELLS.tolist(), "S2": S_CELLS.tolist()},
                   "confirmed_nominal_anchor": BASE,
                   "calibration_matrices": N_K, "repeats_per_cell_matrix": REPS,
                   "drift_grid": D_GRID.tolist(),
                   "typing": "K_test=K0 D(d); decoder uses finite-m Khat calibrated to K0; paired drift increment is added conservatively to the confirmed nominal U95"},
        "families": {k: {"interpolated_5pct_crossing": crossing(v), "rows": v}
                     for k, v in fams.items()},
        "failure_condition": "Any selected family has envelope_U95 >= 0.05; result is only for the stated structured drift families and frozen critical cells."
    }
    with open("five_bin_systematic_drift_audit.json", "w") as f:
        json.dump(result, f, indent=2)
    fig, ax = plt.subplots(figsize=(9.4, 5.8), constrained_layout=True)
    labels = {"diffuse": "symmetric adjacent blur", "plus": "coherent +bin drift", "minus": "coherent -bin drift"}
    colors = {"diffuse": "#277da1", "plus": "#f94144", "minus": "#43aa8b"}
    for k, rows in fams.items():
        ax.plot(100*D_GRID, 100*np.array([r["envelope_U95"] for r in rows]), "o-",
                ms=3.5, lw=1.8, label=labels[k], color=colors[k])
        c = crossing(rows)
        if c is not None:
            ax.axvline(100*c, color=colors[k], alpha=.25, lw=1)
    ax.axhline(5, color="black", ls="--", lw=1.5, label="5% failure boundary")
    ax.set(xlabel="post-calibration one-step drift probability d (%)",
           ylabel="worst selected-cell clustered 95% risk (%)",
           title="Class P diagnostic — systematic calibration-to-test drift envelope")
    ax.set_xlim(-0.005, 0.35)
    ax.set_ylim(4.5, 6.7)
    ax.grid(alpha=.25); ax.legend(frameon=False)
    fig.savefig("five_bin_systematic_drift_audit.svg")
    fig.savefig("five_bin_systematic_drift_audit.png", dpi=180)
    print(json.dumps({k: crossing(v) for k, v in fams.items()}, indent=2))


if __name__ == "__main__":
    main()
