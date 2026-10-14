#!/usr/bin/env python3
"""Session-clustering penalty for a fifth-probe latent-alias discriminator.

GEN/DERIVED mathematical sandbox.  The two latent branches and optimized
fifth probe are from the current Enheduanna -> Tern calculation chain.  This
does not establish source exposure, worker participation, or SAT/H(s)H physics.
All variables are dimensionless except sample and cluster counts.
"""

from itertools import product
from math import erf, sqrt
import numpy as np

SEED = 2026101417
N = 20_000
REPS = 20_000

P = dict(
    p=.30, q=.38,
    f=np.array([.08, .22, .10, .22]),
    d=np.array([.61, .54, .50, .44]),
    c=np.array([.21, -.16, .20, -.15]),
)
Q = dict(
    p=.3008346088957815, q=.3099762870306029,
    f=np.array([.09568308033929572, .22110373961332974,
                .11695145558424894, .22147857463067344]),
    d=np.array([.6214935693489264, .5291392879816462,
                .5081189867595319, .43231304686574357]),
    c=np.array([.19404756851106586, -.19061829190452592,
                .18126795536420864, -.1823794379454958]),
)
V_P = np.array([.1824543303, -.1321570913, .5147178870])
V_Q = np.array([.2037633066, -.1107053759, .5412946779])


def joint(branch: dict, v5: np.ndarray) -> np.ndarray:
    """Exact 32-cell distribution of five conditionally independent probes."""
    out = np.zeros(32)
    for z, h in product((0, 1), repeat=2):
        w = (branch["p"] if z else 1 - branch["p"])
        w *= branch["q"] if h else 1 - branch["q"]
        probs = np.r_[branch["f"] + branch["d"] * z + branch["c"] * h,
                      v5[0] + v5[1] * z + v5[2] * h]
        if np.any((probs <= 0) | (probs >= 1)):
            raise ValueError("invalid conditional probability")
        for code in range(32):
            bits = np.array([(code >> k) & 1 for k in range(5)])
            out[code] += w * np.prod(np.where(bits, probs, 1 - probs))
    return out


def first_four(p5: np.ndarray) -> np.ndarray:
    out = np.zeros(16)
    for code5, value in enumerate(p5):
        out[code5 & 15] += value
    return out


def cdf_normal(x: float) -> float:
    return .5 * (1 + erf(x / sqrt(2)))


def clustered_llr(prob: np.ndarray, score: np.ndarray, m: int, rho: float,
                  rng: np.random.Generator) -> np.ndarray:
    """Exact simulation for a common-copy/independent session mixture.

    Each session selects common-copy mode with probability rho.  In that mode
    all m responses share one categorical draw; otherwise its m draws are iid.
    Every single-response marginal is prob and Corr[g(X_i),g(X_j)]=rho for any
    nonconstant scalar score g, including the log likelihood ratio.
    """
    if N % m:
        raise ValueError("m must divide N")
    groups = N // m
    shared_groups = rng.binomial(groups, rho, size=REPS)
    llr = np.empty(REPS)
    for s in np.unique(shared_groups):
        idx = np.flatnonzero(shared_groups == s)
        shared = rng.multinomial(int(s), prob, size=len(idx)) @ score * m
        independent = rng.multinomial(int((groups - s) * m), prob,
                                      size=len(idx)) @ score
        llr[idx] = shared + independent
    return llr


def main() -> None:
    rng = np.random.default_rng(SEED)
    pp = joint(P, V_P)
    qq = joint(Q, V_Q)
    assert abs(pp.sum() - 1) < 2e-15 and abs(qq.sum() - 1) < 2e-15
    four_alias = np.max(np.abs(first_four(pp) - first_four(qq)))
    assert four_alias < 2e-10

    score = np.log(pp / qq)
    kl_pq = float(pp @ score)
    kl_qp = float(-qq @ score)
    var_p = float(pp @ (score - kl_pq) ** 2)
    var_q = float(qq @ (score + kl_qp) ** 2)

    print("clustered fifth-probe discrimination gate")
    print(f"seed={SEED}; N={N}; replicates/hypothesis={REPS}")
    print(f"first-four max alias residual={four_alias:.3e}")
    print(f"KL(P||Q)={kl_pq:.12g}; KL(Q||P)={kl_qp:.12g}")
    print("m rho design_effect N_eff P_miss Q_false Bayes_error MC95half normal_Bayes")
    for m, rho in ((1, 0.0), (5, .02), (20, .02), (20, .05),
                   (20, .10), (100, .02), (100, .05), (100, .10)):
        lp = clustered_llr(pp, score, m, rho, rng)
        lq = clustered_llr(qq, score, m, rho, rng)
        p_miss = float(np.mean(lp < 0))
        q_false = float(np.mean(lq >= 0))
        bayes = .5 * (p_miss + q_false)
        se = .5 * sqrt((p_miss * (1 - p_miss) + q_false * (1 - q_false)) / REPS)
        deff = 1 + (m - 1) * rho
        neff = N / deff
        sd_p = sqrt(N * var_p * deff)
        sd_q = sqrt(N * var_q * deff)
        normal = .5 * (cdf_normal(-N * kl_pq / sd_p)
                       + 1 - cdf_normal(N * kl_qp / sd_q))
        print(f"{m:3d} {rho:4.2f} {deff:13.6f} {neff:8.1f} "
              f"{p_miss:7.5f} {q_false:7.5f} {bayes:11.6f} "
              f"{1.96*se:10.6f} {normal:12.6f}")

    # Negative control: a latent-independent fifth probe preserves the alias.
    v0 = np.array([.27, 0., 0.])
    p0, q0 = joint(P, v0), joint(Q, v0)
    null_gap = float(np.max(np.abs(p0 - q0)))
    assert null_gap < 2e-10
    print(f"uninformative-probe max 32-cell gap={null_gap:.3e}; Bayes error=0.5")

    # Exact variance identity checked by Monte Carlo in one nontrivial cell.
    m, rho = 20, .05
    empirical = clustered_llr(pp, score, m, rho, rng)
    predicted_var = N * var_p * (1 + (m - 1) * rho)
    rel_var_error = abs(empirical.var(ddof=1) / predicted_var - 1)
    print(f"variance-control m=20 rho=.05 relative error={rel_var_error:.6f}")
    assert rel_var_error < .04


if __name__ == "__main__":
    main()
