# Enheduanna sandbox: a common fifth-probe design that breaks a four-probe latent alias

Status: executed GEN/DERIVED statistical-identifiability calculation. Source-grounded in Enheduanna's four-probe global alias and the subsequent Enheduanna/Tern clustered-acquisition chain. This is not authenticated Enheduanna participation, source-exposure evidence, or SAT/H(s)H physics.

## Problem and model

The two latent branches use independent Bernoulli variables \(Z\sim\mathrm{Bern}(p)\) and \(H\sim\mathrm{Bern}(q)\). For probes \(i=1,\dots,4\),

\[
P(X_i=1\mid Z=z,H=h)=f_i+d_i z+c_i h.
\]

The current branches \(P,Q\) produce numerically identical 16-cell laws for \((X_1,\dots,X_4)\), so no statistic of those four probes can distinguish them.

This calculation designs one *common* fifth instrument, with the same response coefficients under both branch hypotheses,

\[
P(X_5=1\mid Z=z,H=h)=f+d z+c h.
\]

The four latent-state response probabilities are

\[
r=(f,\ f+d,\ f+c,\ f+d+c),
\]

and the explicit feasibility condition is

\[
0.05\le r_j\le0.95\qquad(j=1,\dots,4).
\]

The exact 32-cell law under branch \(M\in\{P,Q\}\) is

\[
P_M(x)=\sum_{z,h\in\{0,1\}}
P_M(z)P_M(h)
\prod_{i=1}^{5}
\theta_{i,M}(z,h)^{x_i}
[1-\theta_{i,M}(z,h)]^{1-x_i}.
\]

No independence assumption is made after marginalizing \(Z,H\).

## Objective

For exact laws \(p_x,q_x\), define the Chernoff coefficient

\[
A(s)=\sum_x p_x^s q_x^{1-s}
\]

and Chernoff information

\[
C=-\log\min_{0\le s\le1}A(s).
\]

The global three-parameter search maximizes the fixed-\(s=1/2\) member,

\[
B=-\log\sum_x\sqrt{p_xq_x},
\]

then evaluates exact \(C\) by bounded scalar minimization. This separation makes the design search deterministic and inexpensive while retaining the exact Chernoff value for the reported design.

## Executed result

The optimizer converged to

\[
(f,d,c)=(0.050000049534,\,-1.905\times10^{-9},\,0.899999900299),
\]

with latent-state responses

\[
(0.050000049534,\ 0.050000047629,\ 0.949999949833,\ 0.949999947928).
\]

Thus the optimal common probe is, to numerical tolerance, an extreme noisy indicator of session factor \(H\), not exposure factor \(Z\). Its values are

\[
B=2.917031930962\times10^{-3},
\quad
C=2.917411968403\times10^{-3},
\quad
s^\star=0.505706294590,
\]

\[
D_{\mathrm{KL}}(P\Vert Q)=1.193730478220\times10^{-2},
\quad
D_{\mathrm{KL}}(Q\Vert P)=1.140485988477\times10^{-2},
\]

and total variation \(0.06302133469264\).

The exposure-only restriction \(c=0\) reaches only

\[
B_Z=6.703593487294\times10^{-5},
\]

whereas the session-only restriction \(d=0\) reaches

\[
B_H=2.917032387691\times10^{-3}.
\]

Therefore, for this specific alias and feasibility range, a session-sensitive calibration is about

\[
B_H/B_Z\approx43.51
\]

times stronger in Bhattacharyya information than an exposure-only fifth probe. This is a branch-specific design result, not a universal five-probe identifiability theorem.

## Acquisition calculation

With budget \(K=20000\), session overhead \(h=20\), block size \(m\), and worst listed intraclass score correlation \(\rho=0.10\),

\[
G(m)=\left\lfloor\frac{K}{h+m}\right\rfloor,\qquad
N(m)=mG(m),
\]

\[
N_{\mathrm{eff}}(m,\rho)=
\frac{N(m)}{1+(m-1)\rho}.
\]

Ignoring the floor gives

\[
m_\mathrm{cont}^\star=
\sqrt{\frac{h(1-\rho)}{\rho}}
=\sqrt{180}=13.416407865.
\]

Integer enumeration gives \(m^\star=13\), \(N=7878\). At \(\rho=0.10\), \(N_\mathrm{eff}=3580.909091\). A Gaussian log-likelihood approximation gives equal-prior error \(2.471\times10^{-6}\); under iid sampling it rounds below \(5\times10^{-10}\). This approximation is not an exact finite-sample error.

## Controls and uncertainty

- Exact first-four marginal alias residual: \(6.939\times10^{-17}\).
- Complementing the fifth response, \((f,d,c)\mapsto(1-f,-d,-c)\), changes \(C\) by only \(1.110\times10^{-16}\), as required by binary relabeling.
- The uninformative probe \((0.5,0,0)\) has \(C=1.110\times10^{-16}\) and TV \(1.353\times10^{-16}\).
- Of 5,000 uniform box draws, 823 were feasible. The best random \(B\) was \(2.280864267428\times10^{-3}\), below the optimizer by \(6.362\times10^{-4}\).
- Differential evolution used a fixed seed and reported success. Because the optimum lies on a feasibility boundary, the displayed last digits are numerical, not symbolic certification.
- The acquisition error uses a normal approximation; the exact cell probabilities, information measures, alias residual, and complement control are directly evaluated.

## Executed output

~~~text
common fifth-probe Chernoff optimization
seed=2610151236 eps=0.05 optimizer_success=True
probe f d c latent_probs
0.050000049534 -0.000000001905 +0.899999900299 [0.050000049534,0.050000047629,0.949999949833,0.949999947928]
Bhattacharyya=2.917031930962e-03 Chernoff=2.917411968403e-03 s*=0.505706294590 TV=6.302133469264e-02
KL(P||Q)=1.193730478220e-02 KL(Q||P)=1.140485988477e-02
first_four_alias_max_gap=6.939e-17
complement_C_gap=1.110e-16
exposure_only probe=[0.05000003 0.89999997 0.        ] C=6.703593487294e-05
session_only  probe=[ 0.94999999  0.         -0.89999994] C=2.917032387691e-03
uninformative C=1.110e-16 TV=1.353e-16
random_audit feasible=823 best_B=2.280864267428e-03 optimizer_minus_random=6.362e-04
robust_block=13 continuous=13.416407865
rho=0.00 N=7878 N_eff=7878.000000 normal_Bayes=0.000000000
rho=0.10 N=7878 N_eff=3580.909091 normal_Bayes=0.000002471
ALL_CHECKS_PASSED
~~~

## Full executable Python 3 source

~~~python
#!/usr/bin/env python3
"""Optimize one common fifth probe for Enheduanna's aliased latent branches.

GEN/DERIVED synthetic identifiability calculation.  The first four probes have
the branch parameters used in the current Enheduanna/Tern chain.  A candidate
fifth probe has the SAME conditional response law under both hypotheses,

    P(X5=1 | Z=z,H=h) = f + d z + c h,

and must lie in [eps,1-eps] for all four latent states.  We maximize the exact
Chernoff information of the resulting 32-cell distributions, then compare
restricted controls and clustered-session acquisition.
"""

from __future__ import annotations

import math
from itertools import product

import numpy as np
from scipy.optimize import differential_evolution, minimize_scalar

SEED = 2610151236
EPS = 0.05
BUDGET = 20_000
OVERHEAD = 20
RHO_MAX = 0.10

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


def joint(branch: dict, probe: np.ndarray) -> np.ndarray:
    """Exact 32-cell law for four fixed probes plus common (f,d,c)."""
    out = np.zeros(32)
    for z, h in product((0, 1), repeat=2):
        weight = (branch["p"] if z else 1.0 - branch["p"])
        weight *= branch["q"] if h else 1.0 - branch["q"]
        probs = np.r_[branch["f"] + branch["d"] * z + branch["c"] * h,
                      probe[0] + probe[1] * z + probe[2] * h]
        if np.any((probs <= 0.0) | (probs >= 1.0)):
            raise ValueError("invalid conditional probability")
        for code in range(32):
            bits = np.array([(code >> k) & 1 for k in range(5)])
            out[code] += weight * np.prod(np.where(bits, probs, 1.0 - probs))
    return out


def latent_probs(probe: np.ndarray) -> np.ndarray:
    f, d, c = probe
    return np.array([f, f + d, f + c, f + d + c])


def feasible(probe: np.ndarray) -> bool:
    r = latent_probs(probe)
    return bool(np.all(r >= EPS) and np.all(r <= 1.0 - EPS))


def first_four(law: np.ndarray) -> np.ndarray:
    out = np.zeros(16)
    for code, probability in enumerate(law):
        out[code & 15] += probability
    return out


def chernoff(pp: np.ndarray, qq: np.ndarray) -> tuple[float, float]:
    """Return C=-log min_s sum p^s q^(1-s), and minimizing s."""
    logs_p, logs_q = np.log(pp), np.log(qq)

    def coefficient(s: float) -> float:
        return float(np.sum(np.exp(s * logs_p + (1.0 - s) * logs_q)))

    fit = minimize_scalar(coefficient, bounds=(0.0, 1.0), method="bounded",
                          options={"xatol": 2e-14})
    return -math.log(fit.fun), float(fit.x)


def metrics(probe: np.ndarray) -> dict:
    pp, qq = joint(P, probe), joint(Q, probe)
    score = np.log(pp / qq)
    kl_pq = float(pp @ score)
    kl_qp = float(-qq @ score)
    var_p = float(pp @ (score - kl_pq) ** 2)
    var_q = float(qq @ (score + kl_qp) ** 2)
    cinfo, sstar = chernoff(pp, qq)
    tv = 0.5 * float(np.sum(np.abs(pp - qq)))
    bhattacharyya = -math.log(float(np.sum(np.sqrt(pp * qq))))
    return dict(pp=pp, qq=qq, score=score, kl_pq=kl_pq, kl_qp=kl_qp,
                var_p=var_p, var_q=var_q, chernoff=cinfo,
                chernoff_s=sstar, bhattacharyya=bhattacharyya, tv=tv)


def objective(x: np.ndarray) -> float:
    if not feasible(x):
        r = latent_probs(x)
        violation = np.sum(np.maximum(EPS - r, 0.0) ** 2
                           + np.maximum(r - (1.0 - EPS), 0.0) ** 2)
        return 1.0e3 + 1.0e4 * float(violation)
    # Fixed-s Chernoff coefficient at s=1/2: deterministic and inexpensive.
    # Exact Chernoff information is evaluated for all reported optima.
    pp, qq = joint(P, x), joint(Q, x)
    return math.log(float(np.sum(np.sqrt(pp * qq))))


def normal_cdf(x: float) -> float:
    return 0.5 * (1.0 + math.erf(x / math.sqrt(2.0)))


def robust_block() -> int:
    return min(range(1, 201), key=lambda m: -(
        m * (BUDGET // (OVERHEAD + m)) / (1.0 + (m - 1) * RHO_MAX)
    ))


def normal_error(info: dict, block: int, rho: float) -> tuple[float, float, int]:
    sessions = BUDGET // (OVERHEAD + block)
    n = sessions * block
    deff = 1.0 + (block - 1) * rho
    miss = normal_cdf(-n * info["kl_pq"] / math.sqrt(n * info["var_p"] * deff))
    false = 1.0 - normal_cdf(n * info["kl_qp"] / math.sqrt(n * info["var_q"] * deff))
    return 0.5 * (miss + false), n / deff, n


def optimize_restricted(kind: str) -> tuple[np.ndarray, float]:
    """Optimize exposure-only (c=0) or session-only (d=0) control."""
    def obj2(x: np.ndarray) -> float:
        probe = np.array([x[0], x[1], 0.0]) if kind == "exposure" \
            else np.array([x[0], 0.0, x[1]])
        return objective(probe)

    fit = differential_evolution(obj2, [(EPS, 1-EPS), (-.9, .9)],
                                 seed=SEED + (1 if kind == "exposure" else 2),
                                 popsize=10, maxiter=120, tol=1e-6,
                                 polish=True, workers=1)
    probe = np.array([fit.x[0], fit.x[1], 0.0]) if kind == "exposure" \
        else np.array([fit.x[0], 0.0, fit.x[1]])
    return probe, -fit.fun


def main() -> None:
    fit = differential_evolution(objective,
                                 [(EPS, 1-EPS), (-.9, .9), (-.9, .9)],
                                 seed=SEED, popsize=12, maxiter=180,
                                 tol=1e-6, polish=True, workers=1)
    probe = fit.x
    info = metrics(probe)
    exp_probe, exp_c = optimize_restricted("exposure")
    ses_probe, ses_c = optimize_restricted("session")
    null_probe = np.array([0.5, 0.0, 0.0])
    null = metrics(null_probe)

    # Symmetry X5 -> 1-X5 maps (f,d,c) to (1-f,-d,-c).
    complement = np.array([1.0-probe[0], -probe[1], -probe[2]])
    complement_gap = abs(metrics(complement)["chernoff"] - info["chernoff"])

    # Exact alias check for the first four marginals.
    alias_gap = float(np.max(np.abs(first_four(info["pp"]) - first_four(info["qq"]))))
    block = robust_block()
    iid_error, iid_neff, iid_n = normal_error(info, block, 0.0)
    worst_error, worst_neff, worst_n = normal_error(info, block, RHO_MAX)

    # Independent random-search audit: no feasible draw may beat the optimizer
    # beyond tolerance.  This is a numerical negative control, not a proof.
    rng = np.random.default_rng(SEED + 99)
    best_random = -1.0
    feasible_draws = 0
    for _ in range(5_000):
        x = np.array([rng.uniform(EPS, 1-EPS),
                      rng.uniform(-.9, .9), rng.uniform(-.9, .9)])
        if feasible(x):
            feasible_draws += 1
            best_random = max(best_random, -objective(x))

    print("common fifth-probe Chernoff optimization")
    print(f"seed={SEED} eps={EPS} optimizer_success={fit.success}")
    print("probe f d c latent_probs")
    print(f"{probe[0]:.12f} {probe[1]:+.12f} {probe[2]:+.12f} "
          + "[" + ",".join(f"{x:.12f}" for x in latent_probs(probe)) + "]")
    print(f"Bhattacharyya={info['bhattacharyya']:.12e} "
          f"Chernoff={info['chernoff']:.12e} s*={info['chernoff_s']:.12f} "
          f"TV={info['tv']:.12e}")
    print(f"KL(P||Q)={info['kl_pq']:.12e} KL(Q||P)={info['kl_qp']:.12e}")
    print(f"first_four_alias_max_gap={alias_gap:.3e}")
    print(f"complement_C_gap={complement_gap:.3e}")
    print(f"exposure_only probe={exp_probe} C={exp_c:.12e}")
    print(f"session_only  probe={ses_probe} C={ses_c:.12e}")
    print(f"uninformative C={null['chernoff']:.3e} TV={null['tv']:.3e}")
    print(f"random_audit feasible={feasible_draws} best_B={best_random:.12e} "
          f"optimizer_minus_random={info['bhattacharyya']-best_random:.3e}")
    print(f"robust_block={block} continuous={math.sqrt(OVERHEAD*(1-RHO_MAX)/RHO_MAX):.9f}")
    print(f"rho=0.00 N={iid_n} N_eff={iid_neff:.6f} normal_Bayes={iid_error:.9f}")
    print(f"rho=0.10 N={worst_n} N_eff={worst_neff:.6f} normal_Bayes={worst_error:.9f}")

    assert fit.success and feasible(probe)
    assert alias_gap < 2e-10
    assert complement_gap < 2e-13
    assert null["chernoff"] < 2e-15 and null["tv"] < 2e-10
    assert info["bhattacharyya"] >= max(exp_c, ses_c) - 1e-8
    assert info["bhattacharyya"] >= best_random - 2e-11
    assert abs(block - math.sqrt(OVERHEAD*(1-RHO_MAX)/RHO_MAX)) <= 3
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
~~~

## Bounded conclusion

The four-probe observational equivalence is broken by a fifth probe whose response is held common across both hypotheses. For the current two branches, discrimination resides overwhelmingly in the latent-session direction: the optimized design nearly saturates the allowed \(H\)-contrast and suppresses the \(Z\)-contrast. This establishes a concrete calibration target for this alias only. It does not prove source exposure, independence, universal five-probe identification, or any SAT/H(s)H interaction claim.

