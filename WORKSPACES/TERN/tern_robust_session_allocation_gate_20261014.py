#!/usr/bin/env python3
"""Tern robust session-allocation gate for the fifth-probe discriminator.

GEN/DERIVED statistical design calculation extending Enheduanna's clustered
fifth-probe model.  If every observation costs one unit and opening a session
costs h units, a budget B allocated in blocks of m observations gives

    G(m) = floor[B/(h+m)] sessions,
    N(m) = m G(m) observations,
    N_eff(m,rho) = N(m) / [1+(m-1)rho].

Ignoring the integer floor, maximizing N_eff yields

    m*(rho) = sqrt[h(1-rho)/rho]              (0<rho<1).

Thus iid optimization (rho=0) pushes toward one large session, while robust
optimization at rho_max uses finite blocks.  Under Enheduanna's stipulated
common-copy mixture, rho is the ICC of every nonconstant score, so clustering
multiplies all candidate-probe variances by the same design effect: it cannot
re-rank probe coefficients, but it can radically change session allocation.

All quantities are synthetic and dimensionless.  This is not evidence about
source exposure, worker independence, or SAT/H(s)H physics.
"""

from __future__ import annotations

import json
import math
from itertools import product

import numpy as np


SEED = 2026101421
BUDGET = 20_000
SESSION_OVERHEAD = 20
MAX_BLOCK = 200
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
    out = np.zeros(32)
    for z, h in product((0, 1), repeat=2):
        weight = (branch["p"] if z else 1 - branch["p"])
        weight *= branch["q"] if h else 1 - branch["q"]
        probs = np.r_[branch["f"] + branch["d"] * z + branch["c"] * h,
                      v5[0] + v5[1] * z + v5[2] * h]
        if np.any((probs <= 0.0) | (probs >= 1.0)):
            raise ValueError("conditional response probability outside (0,1)")
        for code in range(32):
            bits = np.array([(code >> k) & 1 for k in range(5)])
            out[code] += weight * np.prod(np.where(bits, probs, 1 - probs))
    return out


def observations(block: int, overhead: int = SESSION_OVERHEAD) -> tuple[int, int]:
    sessions = BUDGET // (overhead + block)
    return sessions, sessions * block


def effective_n(block: int, rho: float, overhead: int = SESSION_OVERHEAD) -> float:
    _, n = observations(block, overhead)
    return n / (1.0 + (block - 1) * rho)


def continuous_optimum(rho: float, overhead: float = SESSION_OVERHEAD) -> float:
    if rho == 0.0:
        return math.inf
    return math.sqrt(overhead * (1.0 - rho) / rho)


def normal_cdf(x: float) -> float:
    return 0.5 * (1.0 + math.erf(x / math.sqrt(2.0)))


def llr_moments(pp: np.ndarray, qq: np.ndarray) -> dict:
    score = np.log(pp / qq)
    kl_pq = float(pp @ score)
    kl_qp = float(-qq @ score)
    var_p = float(pp @ (score - kl_pq) ** 2)
    var_q = float(qq @ (score + kl_qp) ** 2)
    return {"score": score, "kl_pq": kl_pq, "kl_qp": kl_qp,
            "var_p": var_p, "var_q": var_q}


def normal_bayes_error(block: int, rho: float, moments: dict) -> float:
    _, n = observations(block)
    deff = 1.0 + (block - 1) * rho
    p_miss = normal_cdf(-n * moments["kl_pq"] / math.sqrt(n * moments["var_p"] * deff))
    q_false = 1.0 - normal_cdf(n * moments["kl_qp"] / math.sqrt(n * moments["var_q"] * deff))
    return 0.5 * (p_miss + q_false)


def optimize_blocks(rhos: tuple[float, ...], moments: dict) -> dict:
    blocks = range(1, MAX_BLOCK + 1)
    table = {(m, rho): normal_bayes_error(m, rho, moments) for m in blocks for rho in rhos}
    best_by_rho = {rho: min(blocks, key=lambda m: table[m, rho]) for rho in rhos}
    worst_opt = min(blocks, key=lambda m: max(table[m, rho] for rho in rhos))
    regret_opt = min(
        blocks,
        key=lambda m: max(
            table[m, rho] - table[best_by_rho[rho], rho] for rho in rhos
        ),
    )
    return {"table": table, "best_by_rho": best_by_rho,
            "minimax_error_block": worst_opt, "minimax_regret_block": regret_opt}


def clustered_llr(prob: np.ndarray, score: np.ndarray, block: int, rho: float,
                  rng: np.random.Generator) -> np.ndarray:
    sessions, n = observations(block)
    shared_sessions = rng.binomial(sessions, rho, size=REPS)
    llr = np.empty(REPS)
    for shared in np.unique(shared_sessions):
        rows = np.flatnonzero(shared_sessions == shared)
        common = rng.multinomial(int(shared), prob, size=len(rows)) @ score * block
        iid = rng.multinomial(int((sessions - shared) * block), prob,
                              size=len(rows)) @ score
        llr[rows] = common + iid
    return llr


def monte_carlo_cell(pp: np.ndarray, qq: np.ndarray, score: np.ndarray,
                     block: int, rho: float, seed: int) -> dict:
    rng = np.random.default_rng(seed)
    lp = clustered_llr(pp, score, block, rho, rng)
    lq = clustered_llr(qq, score, block, rho, rng)
    p_miss = float(np.mean(lp < 0.0))
    q_false = float(np.mean(lq >= 0.0))
    error = 0.5 * (p_miss + q_false)
    se = 0.5 * math.sqrt(
        (p_miss * (1 - p_miss) + q_false * (1 - q_false)) / REPS
    )
    sessions, n = observations(block)
    return {"block": block, "rho": rho, "sessions": sessions,
            "observations": n, "N_eff": effective_n(block, rho),
            "p_miss": p_miss, "q_false": q_false,
            "bayes_error": error, "MC95_half_width": 1.96 * se}


def main() -> None:
    pp, qq = joint(P, V_P), joint(Q, V_Q)
    moments = llr_moments(pp, qq)
    rhos = (0.0, 0.02, 0.05, 0.10)
    opt = optimize_blocks(rhos, moments)
    iid_block = opt["best_by_rho"][0.0]
    robust_block = opt["minimax_error_block"]
    regret_block = opt["minimax_regret_block"]

    comparison_blocks = sorted({1, 20, 100, iid_block, robust_block, regret_block})
    table = []
    for block in comparison_blocks:
        sessions, n = observations(block)
        table.append({
            "block": block,
            "sessions": sessions,
            "observations": n,
            "errors": {str(rho): opt["table"][block, rho] for rho in rhos},
            "N_eff": {str(rho): effective_n(block, rho) for rho in rhos},
        })

    # Direct simulations at the two decisions under iid and worst-case rho.
    mc = []
    for j, (block, rho) in enumerate(((iid_block, 0.0), (iid_block, 0.10),
                                      (robust_block, 0.0), (robust_block, 0.10))):
        mc.append(monte_carlo_cell(pp, qq, moments["score"], block, rho, SEED + j))
    worst_case_mc_comparison = {
        "iid_optimal_error": mc[1]["bayes_error"],
        "robust_error": mc[3]["bayes_error"],
        "absolute_error_reduction": mc[1]["bayes_error"] - mc[3]["bayes_error"],
        "effective_sample_size_ratio": mc[3]["N_eff"] / mc[1]["N_eff"],
    }

    # Negative controls and limiting cases.
    no_overhead_opt = max(range(1, MAX_BLOCK + 1),
                          key=lambda m: effective_n(m, 0.10, overhead=0))
    v0 = np.array([.27, 0.0, 0.0])
    null_gap = float(np.max(np.abs(joint(P, v0) - joint(Q, v0))))

    # Enumerated robust optimum must bracket the closed-form continuous one;
    # floor(B/(h+m)) can move the discrete choice by a few integers.
    continuous = continuous_optimum(max(rhos))
    # Integer budget packing places the iid optimum near, not necessarily at,
    # the imposed upper boundary.
    assert iid_block >= 0.9 * MAX_BLOCK
    assert abs(robust_block - continuous) <= 3.0
    assert no_overhead_opt == 1
    assert null_gap < 2e-10
    assert effective_n(robust_block, 0.10) > 3.0 * effective_n(iid_block, 0.10)
    assert worst_case_mc_comparison["absolute_error_reduction"] > 0.10

    out = {
        "budget_model": {"budget": BUDGET, "per_observation_cost": 1,
                         "session_overhead": SESSION_OVERHEAD,
                         "maximum_tested_block": MAX_BLOCK},
        "llr_moments": {k: v for k, v in moments.items() if k != "score"},
        "closed_form_continuous_block_at_rho_max": continuous,
        "best_block_by_rho": {str(rho): m for rho, m in opt["best_by_rho"].items()},
        "iid_optimal_block": iid_block,
        "minimax_error_block": robust_block,
        "minimax_regret_block": regret_block,
        "comparison_table": table,
        "monte_carlo": mc,
        "worst_case_monte_carlo_comparison": worst_case_mc_comparison,
        "negative_controls": {
            "zero_overhead_rho_0p1_optimum": no_overhead_opt,
            "uninformative_probe_max_32cell_gap": null_gap,
            "uninformative_probe_bayes_error": 0.5,
        },
        "status": "GEN/DERIVED robust acquisition-design calculation",
        "boundary": "stipulated budget, overhead, equicorrelated common-copy sessions; no empirical or physics claim",
    }
    print(json.dumps(out, indent=2, sort_keys=True))
    print("PASS: iid-optimal batching is not robust; finite session blocks maximize worst-case information")


if __name__ == "__main__":
    main()
