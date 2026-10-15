# Tern Rook controller: robust session-block acquisition under asymmetric branch ICC

Status: **executed GEN/DERIVED statistical-design calculation**. This source-grounded continuation uses the Enheduanna/Tern latent-alias and common fifth-probe fixture. It is not authenticated historical Tern participation, an empirical confidence analysis, source-exposure evidence, or a SAT/H(s)H physical claim.

## Model and derivation

The fixed branches \(P,Q\) use independent \(Z\sim\mathrm{Bern}(p)\), \(H\sim\mathrm{Bern}(q)\) and
\[
P(X_i=1\mid Z=z,H=h)=f_i+d_i z+c_i h.
\]
All branch constants are in the executable source. The common fifth probe is
\[
(f_5,d_5,c_5)=(0.050000049534,-1.905\times10^{-9},0.899999900299).
\]
For each 5-bit outcome \(x\),
\[
P_M(x)=\sum_{z,h\in\{0,1\}}P_M(z)P_M(h)
\prod_{i=1}^{5}\theta_{i,M}(z,h)^{x_i}[1-\theta_{i,M}(z,h)]^{1-x_i}.
\]
Let \(L(x)=\log[P(x)/Q(x)]\). Exact 32-cell enumeration gives
\[
D_{PQ}=E_PL=1.193730478219\times10^{-2},\quad
D_{QP}=-E_QL=1.140485988475\times10^{-2},
\]
\[
V_P=\operatorname{Var}_PL=2.496192789564\times10^{-2},\quad
V_Q=\operatorname{Var}_QL=2.176952366650\times10^{-2}.
\]

Choose integer observations/session \(m\in\{1,\dots,200\}\) under budget \(K=20000\) before knowing the stress scenario
\[
h\in\{10,\dots,40\},\quad \rho_P\in\{.02,\dots,.12\},\quad
\rho_Q\in\{.03,\dots,.15\}.
\]
These 4,433 scenarios are declared design fixtures, not confidence limits. With
\[
G=\left\lfloor\frac{K}{h+m}\right\rfloor,\quad N=mG,
\]
independent sessions and exchangeable within-session score ICC imply
\[
\operatorname{Var}_P\!\left(\sum L\right)=NV_P[1+(m-1)\rho_P],
\quad
\operatorname{Var}_Q\!\left(\sum L\right)=NV_Q[1+(m-1)\rho_Q].
\]
At zero log-likelihood threshold and equal priors, the Gaussian error is
\[
E_s(m)=\frac12\left[
\Phi\!\left(-\frac{\sqrt N D_{PQ}}{\sqrt{V_P[1+(m-1)\rho_P]}}\right)+
\Phi\!\left(-\frac{\sqrt N D_{QP}}{\sqrt{V_Q[1+(m-1)\rho_Q]}}\right)
\right].
\]
The enumerated controllers are
\[
m_{\rm mm}=\arg\min_m\max_sE_s(m),\qquad
m_{\rm reg}=\arg\min_m\max_s\left[E_s(m)-\min_jE_s(j)\right].
\]

## Executed result

Both select \(\boxed{m_{\rm mm}=m_{\rm reg}=16}\). The maximizing corner is
\(h=40,\rho_P=.12,\rho_Q=.15\). There \(G=357\), \(N=5712\),
\[
N_{{\rm eff},P}=2040.000000,\qquad N_{{\rm eff},Q}=1757.538462,
\]
\[
E_{\max}(16)=4.591348295862\times10^{-4},\qquad
R_{\max}(16)=6.731764047835\times10^{-6}.
\]
The prior \(m=13\) has
\[
E_{\max}(13)=4.824216330911\times10^{-4},\qquad
R_{\max}(13)=3.013254969905\times10^{-5}.
\]
Thus \(m=16\) lowers worst error by \(4.8271\%\) and maximum additive regret by a factor \(4.4762\). The worst-corner integer oracle also selects 16. The floor-free equal-\(\rho_Q\) check
\[
\sqrt{h(1-\rho_Q)/\rho_Q}=15.055453054
\]
is nearby, but the controller uses both branch moments, asymmetric ICCs, the floor, and full integer enumeration.

## Controls and uncertainty

- iid control at \(h=40,\rho_P=\rho_Q=0\): maximum information on the declared grid occurs at \(m=198,N=16632\); the robust finite block is therefore correlation-driven.
- Uninformative fifth probe \((.5,0,0)\): \(D_{KL}^{(4)}=D_{KL}^{(5)}=-1.791232837167\times10^{-16}\), displayed gap zero. The negative value is floating-point cancellation around exact zero.
- Assertions for scenario count, bounds, null-probe equality, and dominance over \(m=13\) passed.
- Exact laws and one-observation moments are numerical enumerations. Finite-budget error is Gaussian, not an exact clustered finite-sample probability. ICC exchangeability, cross-session independence, and the uncertainty box are assumptions. Empirical ICC fitting, nonexchangeable sessions, law-parameter uncertainty, and misspecification remain open.

## Exact executed output

\`\`\`text
robust session-block controller
budget=20000 m_range=1..200 scenarios=4433
overhead=10..40 rho_P=0.02..0.12 rho_Q=0.03..0.15
KL_PQ=1.193730478219e-02 KL_QP=1.140485988475e-02 Var_P=2.496192789564e-02 Var_Q=2.176952366650e-02
minimax_error: m=16 worst_error=4.591348295862e-04 max_additive_regret=6.731764047835e-06 worst=(h=40,rho_P=0.12,rho_Q=0.15) sessions=357 N=5712 N_eff_P=2040.000000 N_eff_Q=1757.538462
minimax_regret: m=16 worst_error=4.591348295862e-04 max_additive_regret=6.731764047835e-06 worst=(h=40,rho_P=0.12,rho_Q=0.15) sessions=357 N=5712 N_eff_P=2040.000000 N_eff_Q=1757.538462
legacy_m13: m=13 worst_error=4.824216330911e-04 max_additive_regret=3.013254969905e-05 worst=(h=40,rho_P=0.12,rho_Q=0.15) sessions=377 N=4901 N_eff_P=2008.606557 N_eff_Q=1750.357143
worst_corner_oracle: m=16 error=4.591348295862e-04 equal_rho_Q_continuous=15.055453054
iid_control: h=40 max_information_m=198 N=16632 error=0.000000000000e+00
uninformative_probe_control: KL4=-1.791232837167e-16 KL5=-1.791232837167e-16 gap=0.000e+00
ALL_CHECKS_PASSED
\`\`\`

## Full executed Python 3 source

\`\`\`python
#!/usr/bin/env python3
"""Robust session-block controller for the current five-probe latent alias.

GEN/DERIVED statistical design calculation.  The P/Q four-probe branches and
the common fifth probe are frozen from the current Enheduanna/Tern chain.
For a total acquisition budget K, session overhead h, and branch-specific
score ICCs rho_P and rho_Q, choose integer observations per session m.

The reported finite-budget errors use a Gaussian approximation to the summed
log-likelihood ratio.  Exact 32-cell laws and exact one-observation score
moments feed that approximation.  The uncertainty box is a declared design
stress test, not an empirical confidence region.
"""

from __future__ import annotations

import math
from itertools import product

import numpy as np

BUDGET = 20_000
M_MAX = 200
OVERHEADS = tuple(range(10, 41))
RHO_P_GRID = tuple(round(x, 2) for x in np.arange(0.02, 0.121, 0.01))
RHO_Q_GRID = tuple(round(x, 2) for x in np.arange(0.03, 0.151, 0.01))

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

# The implemented common fifth probe from the published design.  The tiny d
# is retained instead of rounded to zero so that this script reproduces its
# actual 32-cell law.
PROBE = np.array([0.050000049534, -0.000000001905, 0.899999900299])


def joint(branch: dict, probe: np.ndarray) -> np.ndarray:
    """Return the exact 32-cell law for four fixed probes plus common probe."""
    out = np.zeros(32)
    for z, h in product((0, 1), repeat=2):
        weight = (branch["p"] if z else 1.0 - branch["p"])
        weight *= branch["q"] if h else 1.0 - branch["q"]
        probs = np.r_[branch["f"] + branch["d"] * z + branch["c"] * h,
                      probe[0] + probe[1] * z + probe[2] * h]
        if np.any((probs <= 0.0) | (probs >= 1.0)):
            raise ValueError("conditional probability outside (0,1)")
        for code in range(32):
            bits = np.array([(code >> k) & 1 for k in range(5)])
            out[code] += weight * np.prod(np.where(bits, probs, 1.0 - probs))
    return out


def score_moments(probe: np.ndarray) -> tuple[float, float, float, float]:
    """Return KL(P||Q), KL(Q||P), Var_P L, Var_Q L for L=log(P/Q)."""
    pp, qq = joint(P, probe), joint(Q, probe)
    llr = np.log(pp / qq)
    kp = float(pp @ llr)
    kq = float(-qq @ llr)
    vp = float(pp @ (llr - kp) ** 2)
    vq = float(qq @ (llr + kq) ** 2)
    return kp, kq, vp, vq


def normal_cdf(x: float) -> float:
    return 0.5 * (1.0 + math.erf(x / math.sqrt(2.0)))


def acquisition(m: int, overhead: int) -> tuple[int, int]:
    """Return session count and acquired observations under the hard budget."""
    sessions = BUDGET // (overhead + m)
    return sessions, sessions * m


def bayes_error(m: int, overhead: int, rho_p: float, rho_q: float,
                moments: tuple[float, float, float, float]) -> float:
    """Equal-prior Gaussian error with asymmetric branch-specific score ICC."""
    kp, kq, vp, vq = moments
    _, n = acquisition(m, overhead)
    dp = 1.0 + (m - 1) * rho_p
    dq = 1.0 + (m - 1) * rho_q
    miss = normal_cdf(-math.sqrt(n) * kp / math.sqrt(vp * dp))
    false = normal_cdf(-math.sqrt(n) * kq / math.sqrt(vq * dq))
    return 0.5 * (miss + false)


def scenarios() -> list[tuple[int, float, float]]:
    return [(h, rp, rq)
            for h in OVERHEADS for rp in RHO_P_GRID for rq in RHO_Q_GRID]


def controller(moments: tuple[float, float, float, float]) -> dict:
    """Compute minimax-error and minimax-additive-regret block choices."""
    ms = np.arange(1, M_MAX + 1)
    sc = scenarios()
    errors = np.empty((len(sc), len(ms)))
    for i, (h, rp, rq) in enumerate(sc):
        errors[i] = [bayes_error(int(m), h, rp, rq, moments) for m in ms]

    oracle = errors.min(axis=1)
    worst_error = errors.max(axis=0)
    worst_regret = (errors - oracle[:, None]).max(axis=0)
    m_mm = int(ms[np.argmin(worst_error)])
    m_rg = int(ms[np.argmin(worst_regret)])

    return dict(
        scenarios=sc,
        errors=errors,
        oracle=oracle,
        minimax_m=m_mm,
        minimax_error=float(worst_error[m_mm - 1]),
        regret_m=m_rg,
        regret=float(worst_regret[m_rg - 1]),
        regret_m_error=float(worst_error[m_rg - 1]),
    )


def summarize_choice(m: int, result: dict) -> tuple[float, float, tuple]:
    """Return worst error, worst regret, and a maximizing scenario for m."""
    col = result["errors"][:, m - 1]
    regret = col - result["oracle"]
    i = int(np.argmax(col))
    return float(col[i]), float(np.max(regret)), result["scenarios"][i]


def main() -> None:
    moments = score_moments(PROBE)
    result = controller(moments)
    m_mm, m_rg = result["minimax_m"], result["regret_m"]

    print("robust session-block controller")
    print(f"budget={BUDGET} m_range=1..{M_MAX} scenarios={len(result['scenarios'])}")
    print(f"overhead={OVERHEADS[0]}..{OVERHEADS[-1]} "
          f"rho_P={RHO_P_GRID[0]:.2f}..{RHO_P_GRID[-1]:.2f} "
          f"rho_Q={RHO_Q_GRID[0]:.2f}..{RHO_Q_GRID[-1]:.2f}")
    print("KL_PQ={:.12e} KL_QP={:.12e} Var_P={:.12e} Var_Q={:.12e}".format(*moments))

    for label, m in (("minimax_error", m_mm), ("minimax_regret", m_rg),
                     ("legacy_m13", 13)):
        worst, regret, arg = summarize_choice(m, result)
        sessions, n = acquisition(m, arg[0])
        neff_p = n / (1.0 + (m - 1) * arg[1])
        neff_q = n / (1.0 + (m - 1) * arg[2])
        print(f"{label}: m={m} worst_error={worst:.12e} "
              f"max_additive_regret={regret:.12e} "
              f"worst=(h={arg[0]},rho_P={arg[1]:.2f},rho_Q={arg[2]:.2f}) "
              f"sessions={sessions} N={n} N_eff_P={neff_p:.6f} N_eff_Q={neff_q:.6f}")

    # Worst-corner oracle and equal-ICC continuous benchmark.
    corner = (OVERHEADS[-1], RHO_P_GRID[-1], RHO_Q_GRID[-1])
    corner_errors = [bayes_error(m, *corner, moments) for m in range(1, M_MAX + 1)]
    corner_m = 1 + int(np.argmin(corner_errors))
    benchmark = math.sqrt(OVERHEADS[-1] * (1.0 - RHO_Q_GRID[-1]) /
                          RHO_Q_GRID[-1])
    print(f"worst_corner_oracle: m={corner_m} error={min(corner_errors):.12e} "
          f"equal_rho_Q_continuous={benchmark:.9f}")

    # Negative control: with no within-session correlation, larger blocks keep
    # amortizing overhead throughout the declared search interval.
    iid_n = [acquisition(m, 40)[1] for m in range(1, M_MAX + 1)]
    iid_m = 1 + int(np.argmax(iid_n))
    iid_error = bayes_error(iid_m, 40, 0.0, 0.0, moments)
    print(f"iid_control: h=40 max_information_m={iid_m} "
          f"N={max(iid_n)} error={iid_error:.12e}")

    # Uninformative-probe control.  Exact P/Q distinction remains in the first
    # four probes if branches are not perfectly equal at floating precision;
    # check that adding X5=(fair coin) contributes no score information by
    # comparing four-probe marginal moments.
    null = np.array([0.5, 0.0, 0.0])
    pp5, qq5 = joint(P, null), joint(Q, null)
    pp4 = np.array([pp5[2*r] + pp5[2*r+1] for r in range(16)])
    qq4 = np.array([qq5[2*r] + qq5[2*r+1] for r in range(16)])
    # Bits are little-endian; X5 is bit 4, hence direct marginalization by mask.
    pp4 = np.zeros(16)
    qq4 = np.zeros(16)
    for code in range(32):
        pp4[code & 15] += pp5[code]
        qq4[code & 15] += qq5[code]
    kl4 = float(pp4 @ np.log(pp4 / qq4))
    kl5 = float(pp5 @ np.log(pp5 / qq5))
    print(f"uninformative_probe_control: KL4={kl4:.12e} KL5={kl5:.12e} "
          f"gap={abs(kl5-kl4):.3e}")

    assert len(result["scenarios"]) == 31 * 11 * 13
    assert 1 <= m_mm <= M_MAX and 1 <= m_rg <= M_MAX
    assert max(iid_n) >= acquisition(13, 40)[1]
    assert abs(kl5 - kl4) < 2e-15
    assert result["minimax_error"] <= summarize_choice(13, result)[0] + 1e-15
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
\`\`\`

## Bounded conclusion

For the declared overhead and asymmetric branch-ICC box, \(m=13\) is not robust-optimal. A 16-observation session block minimizes both worst approximate error and maximum additive regret. This is a controller result for one frozen latent-alias fixture and synthetic uncertainty box, not universal acquisition optimality or physical validation.

