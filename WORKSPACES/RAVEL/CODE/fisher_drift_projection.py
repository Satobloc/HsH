"""Covariance-weighted projection of crossed channel drift onto the B,V basis.

The calculation is deliberately measurement-facing: the covariance is formed from
both crossed conditions.  This avoids pretending that a sparse calibration matrix
is an interior multinomial point.
"""
import json
import numpy as np
import matplotlib.pyplot as plt

ASSIGN = 1 - .025 ** (1 / 192)
Q_LOCAL = 0.00047514872444755717


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
    r = np.zeros((5, 5)); left = np.zeros((5, 5))
    for i in range(5):
        r[i, min(i + 1, 4)] = 1
        left[i, max(i - 1, 0)] = 1
    return r, left


K = nominal_k()
R, L = shifts()
B = -np.eye(5) + (R + L) / 2
V = (R - L) / 2
GB = K @ B
GV = K @ V
J = np.fliplr(np.eye(5))


def channel(b, v):
    return np.eye(5) + b * B + v * V


def local_leak(row, q):
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


def multinomial_cov(p):
    return np.diag(p) - np.outer(p, p)


def block_precision(p_cal, p_test, n_cal=1.0, n_test=1.0):
    """Precision of independent row-frequency differences, block by true row."""
    blocks = []
    ranks = []
    for pc, pt in zip(p_cal, p_test):
        sigma = multinomial_cov(pc) / n_cal + multinomial_cov(pt) / n_test
        blocks.append(np.linalg.pinv(sigma, rcond=1e-12))
        ranks.append(int(np.linalg.matrix_rank(sigma, tol=1e-12)))
    w = np.zeros((25, 25))
    for i, block in enumerate(blocks):
        w[5*i:5*(i+1), 5*i:5*(i+1)] = block
    return w, ranks


def project(p_cal, p_test):
    delta = p_test - p_cal
    w, row_ranks = block_precision(p_cal, p_test)
    g = np.column_stack((GB.ravel(), GV.ravel()))
    normal = g.T @ w @ g
    theta = np.linalg.pinv(normal, rcond=1e-12) @ g.T @ w @ delta.ravel()
    parallel = theta[0] * GB + theta[1] * GV
    residual = delta - parallel
    total = float(delta.ravel() @ w @ delta.ravel())
    remain = float(residual.ravel() @ w @ residual.ravel())
    basis_rank = int(np.linalg.matrix_rank(normal, tol=1e-10))
    observable_rank = int(sum(row_ranks))
    return {
        "theta_b_v": theta,
        "parallel": parallel,
        "residual": residual,
        "total_norm2": total,
        "residual_norm2": remain,
        "explained_fraction": float(1 - remain / total) if total > 0 else 1.0,
        "row_covariance_ranks": row_ranks,
        "observable_rank": observable_rank,
        "basis_rank": basis_rank,
        "residual_rank": observable_rank - basis_rank,
        "cone_admissible": bool(theta[0] >= abs(theta[1]) and theta[0] <= 1),
    }


def mirrored(a):
    return J @ a @ J


def slim(x):
    return {
        "theta_b_v": x["theta_b_v"].tolist(),
        "total_norm2": x["total_norm2"],
        "residual_norm2": x["residual_norm2"],
        "explained_fraction": x["explained_fraction"],
        "row_covariance_ranks": x["row_covariance_ranks"],
        "observable_rank": x["observable_rank"],
        "basis_rank": x["basis_rank"],
        "residual_rank": x["residual_rank"],
        "cone_admissible": x["cone_admissible"],
    }


def main():
    fixtures = {
        "common_bv": (K, K @ channel(0.001, 0.0003)),
        "terminal_row0_leak": (K, local_leak(0, Q_LOCAL)),
        "interior_row2_leak": (K, local_leak(2, Q_LOCAL)),
        "mixture": (K, local_leak(0, Q_LOCAL) @ channel(0.001, 0.0003)),
    }
    fits = {name: project(pc, pt) for name, (pc, pt) in fixtures.items()}

    mirror_checks = {}
    for name, (pc, pt) in fixtures.items():
        original = fits[name]
        reflected = project(mirrored(pc), mirrored(pt))
        mirror_checks[name] = {
            "b_difference": float(reflected["theta_b_v"][0] - original["theta_b_v"][0]),
            "v_sum_should_zero": float(reflected["theta_b_v"][1] + original["theta_b_v"][1]),
            "residual_norm2_difference": float(reflected["residual_norm2"] - original["residual_norm2"]),
        }

    result = {
        "status": "STD/DERIVED generalized least-squares operator; SAT/CANDIDATE readout discriminator",
        "operator": {
            "delta": "K_test-K_cal",
            "design_columns": ["vec(K_cal B)", "vec(K_cal V)"],
            "covariance_per_row": "C(p_cal)/n_cal + C(p_test)/n_test",
            "fit": "theta_hat=(G^T W G)^+ G^T W vec(delta)",
            "residual": "R_perp=delta-K_cal(theta_b B+theta_v V)",
            "statistic": "T_perp=vec(R_perp)^T W vec(R_perp)",
        },
        "fixtures": {name: slim(fit) for name, fit in fits.items()},
        "mirror_covariance_checks": mirror_checks,
        "failure": (
            "A fixed chi-square reference is not justified at structural-zero or cone boundaries; "
            "calibrate T_perp by a parametric bootstrap from the fitted common-channel model. "
            "Rank deficiency of G^T W G also makes b,v non-identifiable."
        ),
    }
    with open("fisher_drift_projection.json", "w") as f:
        json.dump(result, f, indent=2)

    focus = fits["terminal_row0_leak"]
    mats = [fixtures["terminal_row0_leak"][1] - K,
            focus["parallel"], focus["residual"]]
    titles = ["Measured local drift", "Best common B,V projection", "Orthogonal residual"]
    vmax = max(np.max(np.abs(x)) for x in mats)
    fig, ax = plt.subplots(1, 4, figsize=(14.6, 4.25), constrained_layout=True,
                           gridspec_kw={"width_ratios": [1, 1, 1, .9]})
    for a, mat, title in zip(ax[:3], mats, titles):
        im = a.imshow(mat * 1e4, cmap="RdBu_r", vmin=-vmax*1e4, vmax=vmax*1e4)
        a.set(title=title, xlabel="reported bin", ylabel="true row",
              xticks=range(5), yticks=range(5))
    labels = list(fits)
    ax[3].barh(np.arange(len(labels)), [fits[x]["explained_fraction"]*100 for x in labels],
               color=["#2f6690", "#d1495b", "#d1495b", "#6c5b7b"])
    ax[3].set(yticks=np.arange(len(labels)), yticklabels=labels,
              xlabel="Fisher-weighted drift explained (%)", xlim=(0, 105),
              title="Basis sufficiency")
    ax[3].grid(axis="x", alpha=.25)
    fig.colorbar(im, ax=ax[:3], label=r"probability drift ($\times10^{-4}$)", shrink=.86)
    fig.suptitle("Class P — common-channel projection preserves off-basis drift")
    fig.savefig("fisher_drift_projection.svg")
    fig.savefig("fisher_drift_projection.png", dpi=190)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
