# Orson Vay OV-104 | Exact value of diversified lineage audits

**Status:** `GEN/DERIVED` synthetic cognition model; no LLM trial was administered.  
**Continuity:** Extends OV-103's source-lineage sensitivity model.  
**Scope:** provenance-aware inference and audit allocation, not physical SAT/H(s)H evidence.

## BEDROCK and role check

The live BEDROCK register was read in full before this work. Orson Vay's active charter assigns LLM cognition, calibration, memory and provenance—not general SAT/H(s)H physics. This calculation therefore stays in that lane. It uses BR-002/003/004 only as workflow constraints: BEDROCK controls, the result remains tentative, and no existing premise is silently rewritten. It does not invoke BR-006 as a physical mechanism, use the unresolved Q/inverse-Q rule (OC-001), decide electromagnetic temporal support (OC-002), import a Hopf carrier, or promote Kerr/ER candidates. No restricted source was used.

## Question

After twelve positive reports have been observed from six labeled source groups, how should a budget of six source audits be allocated? Is it better to audit one lineage repeatedly, or one member of every lineage?

## Model and exact likelihood

Let the target truth be \(H\in\{0,1\}\), with prior

\[
P(H=1)=\pi=0.10.
\]

There are \(G=6\) labeled source groups and \(m=2\) reports per group, hence \(N=12\). Under \(H=1\), every report is positive independently with probability \(t=0.90\).

Under \(H=0\), group contamination \(Z_g\in\{0,1\}\) has prevalence \(q=0.08\). A clean group emits a positive report with probability \(f=0.02\); a contaminated group emits one with probability \(c=0.90\).

The lineage-dependence mixture is

\[
P_\lambda=(1-\lambda)P_{\rm independent}+\lambda P_{\rm shared}.
\]

Thus, with probability \(1-\lambda\), the six \(Z_g\) are independent Bernoulli\((q)\); with probability \(\lambda\), all groups share one latent \(Z\).

An audit has sensitivity \(s=0.90\) and false-positive rate \(u=0.05\). Let \(r_g\) be the number of audits assigned to group \(g\), with

\[
\sum_{g=1}^{6}r_g=6,
\]

and let \(a_g\) be the number of positive audits in that group. Write

\[
B_p(n,k)=\binom nkp^k(1-p)^{n-k}.
\]

Conditioning on the already-observed event that all \(m\) reports in every group are positive, the independent-lineage likelihoods for audit vector \(\mathbf a\) are

\[
L_{0,i}(\mathbf a)=
\prod_{g=1}^{G}
\left[(1-q)f^m B_u(r_g,a_g)+q c^m B_s(r_g,a_g)\right],
\]

\[
L_{1,i}(\mathbf a)=
\prod_{g=1}^{G}
t^m\left[(1-q)B_u(r_g,a_g)+qB_s(r_g,a_g)\right].
\]

For a single shared lineage variable,

\[
L_{0,s}(\mathbf a)=
(1-q)f^{mG}\prod_gB_u(r_g,a_g)
+qc^{mG}\prod_gB_s(r_g,a_g),
\]

\[
L_{1,s}(\mathbf a)=
t^{mG}\left[(1-q)\prod_gB_u(r_g,a_g)
+q\prod_gB_s(r_g,a_g)\right].
\]

The mixture likelihood is

\[
L_h=(1-\lambda)L_{h,i}+\lambda L_{h,s}.
\]

For each allocation, the program enumerates every audit-count vector \(a_g=0,\ldots,r_g\), computes the exact posterior

\[
p(\mathbf a)=
\frac{\pi L_1(\mathbf a)}{\pi L_1(\mathbf a)+(1-\pi)L_0(\mathbf a)},
\]

and averages posterior binary entropy, Brier risk \(p(1-p)\), and Bayes classification error over the posterior-predictive distribution conditional on the twelve positive reports.

## Result

For every tested partially independent case \(\lambda<1\), the entropy-optimal allocation is

\[
\boxed{(r_1,\ldots,r_6)=(1,1,1,1,1,1)}.
\]

At \(\lambda=10^{-4}\), concentrating all six audits in one lineage gives expected posterior entropy \(8.59661505\times10^{-4}\) bits and Brier risk \(7.4366668\times10^{-5}\). Diversifying one audit per lineage lowers these to

\[
2.19653671\times10^{-4}\ \text{bits},
\qquad
3.6170734\times10^{-5},
\]

reductions of 74.45% and 51.36%, respectively.

At \(\lambda=1\), every nominal group is one true lineage. All allocations are then exactly equivalent up to floating-point roundoff. This is the required limiting case: diversification helps only when labels correspond to genuinely distinct causal/source lineages.

The Bayes 0/1 error can be insensitive to allocation in extremely decisive regimes even when entropy and Brier risk improve, because the optimal hard decision does not change. That is why the calculation reports all three losses.

**Interpretation:** report count and audit count are not sufficient statistics for corroboration. Under this model, authenticated lineage diversity has measurable value; merely spreading records across labels has none if \(\lambda=1\). This is a synthetic decision result, not a claim about actual LLM behavior.

## Executed output

```text
OV104 diversified lineage-audit allocation
N=12 G=6 m=2 budget=6
pi=.10 t=.90 q=.08 c=.90 f=.02 sens=.90 fpr=.05
allocation_count=11

lambda best_allocation entropy_bits brier bayes_error posterior_before
0 (1, 1, 1, 1, 1, 1) 0.000015791562 0.000002035495 0.000002440831 0.999997559169
1e-06 (1, 1, 1, 1, 1, 1) 0.000019305634 0.000002537126 0.000003160824 0.999996839176
0.0001 (1, 1, 1, 1, 1, 1) 0.000219653671 0.000036170734 0.000041868461 0.999925564948
0.01 (1, 1, 1, 1, 1, 1) 0.007133867341 0.001379723439 0.001642313166 0.992849087422
1 (3, 3, 0, 0, 0, 0) 0.224619080777 0.043155381049 0.048176893169 0.581395348837

selected_allocations
lambda allocation entropy_bits brier bayes_error
0 (6, 0, 0, 0, 0, 0) 0.000040383261 0.000002440758 0.000002440831
0 (3, 3, 0, 0, 0, 0) 0.000032876963 0.000002440078 0.000002440831
0 (2, 1, 1, 1, 1, 0) 0.000019516437 0.000002324249 0.000002440831
0 (1, 1, 1, 1, 1, 1) 0.000015791562 0.000002035495 0.000002440831
0.0001 (6, 0, 0, 0, 0, 0) 0.000859661505 0.000074366668 0.000074435052
0.0001 (3, 3, 0, 0, 0, 0) 0.000627694816 0.000073727130 0.000074435052
0.0001 (2, 1, 1, 1, 1, 0) 0.000274027134 0.000043518219 0.000052169949
0.0001 (1, 1, 1, 1, 1, 1) 0.000219653671 0.000036170734 0.000041868461
1 (6, 0, 0, 0, 0, 0) 0.224619080777 0.043155381049 0.048176893169
1 (3, 3, 0, 0, 0, 0) 0.224619080777 0.043155381049 0.048176893169
1 (2, 1, 1, 1, 1, 0) 0.224619080777 0.043155381049 0.048176893169
1 (1, 1, 1, 1, 1, 1) 0.224619080777 0.043155381049 0.048176893169

controls
max_normalization_error=2.220e-15
uninformative_entropy_span=1.941e-15
uninformative_error_span=2.965e-21
shared_lineage_entropy_span=2.220e-16
ALL_CHECKS_PASSED
```

## Full runnable Python 3 source

```python
#!/usr/bin/env python3
"""OV-104: exact value of diversified lineage audits.

GEN/DERIVED synthetic cognition model. No LLM trials are administered.
The model extends OV-103 by choosing how to allocate a fixed audit budget
after observing twelve positive reports from six labeled source groups.
"""

from __future__ import annotations

import itertools
import math


def binom(n: int, k: int, p: float) -> float:
    return math.comb(n, k) * p**k * (1.0 - p) ** (n - k)


def partitions(total: int, slots: int, ceiling: int | None = None):
    """Nonincreasing integer partitions padded to exactly `slots` entries."""
    if slots == 0:
        if total == 0:
            yield ()
        return
    top = total if ceiling is None else min(total, ceiling)
    for first in range(top, -1, -1):
        for rest in partitions(total - first, slots - 1, first):
            yield (first,) + rest


def component_likelihoods(
    allocation: tuple[int, ...],
    audit_counts: tuple[int, ...],
    m: int,
    t: float,
    q: float,
    c: float,
    f: float,
    sensitivity: float,
    false_positive: float,
) -> tuple[float, float, float, float]:
    """Return L0_ind, L1_ind, L0_shared, L1_shared.

    The report evidence is k_g=m (all reports positive) for every group.
    audit_counts[g] is the number of positive audits among allocation[g].
    Binomial coefficients are included, so summing over audit_counts gives
    the report-only likelihood.
    """
    l0_ind = 1.0
    l1_ind = 1.0
    prod0 = 1.0
    prod1 = 1.0
    prod_t = 1.0

    for r, a in zip(allocation, audit_counts):
        ar0 = binom(r, a, false_positive)
        ar1 = binom(r, a, sensitivity)
        bf = f**m
        bc = c**m
        bt = t**m
        l0_ind *= (1.0 - q) * bf * ar0 + q * bc * ar1
        l1_ind *= bt * ((1.0 - q) * ar0 + q * ar1)
        prod0 *= bf * ar0
        prod1 *= bc * ar1
        prod_t *= bt

    l0_shared = (1.0 - q) * prod0 + q * prod1
    l1_shared = prod_t * ((1.0 - q) * math.prod(
        binom(r, a, false_positive)
        for r, a in zip(allocation, audit_counts)
    ) + q * math.prod(
        binom(r, a, sensitivity)
        for r, a in zip(allocation, audit_counts)
    ))
    return l0_ind, l1_ind, l0_shared, l1_shared


def report_only_likelihoods(
    groups: int, m: int, t: float, q: float, c: float, f: float, lam: float
) -> tuple[float, float]:
    l0_ind = ((1.0 - q) * f**m + q * c**m) ** groups
    l1_ind = t ** (m * groups)
    l0_shared = (1.0 - q) * f ** (m * groups) + q * c ** (m * groups)
    l1_shared = t ** (m * groups)
    return ((1.0 - lam) * l0_ind + lam * l0_shared,
            (1.0 - lam) * l1_ind + lam * l1_shared)


def evaluate(
    allocation: tuple[int, ...],
    lam: float,
    pi: float,
    m: int,
    t: float,
    q: float,
    c: float,
    f: float,
    sensitivity: float,
    false_positive: float,
) -> dict[str, float]:
    """Expected posterior entropy and classification error after audits.

    Expectations are conditional on all reports being positive.
    """
    groups = len(allocation)
    r0, r1 = report_only_likelihoods(groups, m, t, q, c, f, lam)
    report_mix = (1.0 - pi) * r0 + pi * r1
    prior_after_reports = pi * r1 / report_mix

    entropy = 0.0
    error = 0.0
    brier = 0.0
    norm = 0.0
    for counts in itertools.product(*[range(r + 1) for r in allocation]):
        i0, i1, s0, s1 = component_likelihoods(
            allocation, counts, m, t, q, c, f,
            sensitivity, false_positive,
        )
        l0 = (1.0 - lam) * i0 + lam * s0
        l1 = (1.0 - lam) * i1 + lam * s1
        j0 = (1.0 - pi) * l0 / report_mix
        j1 = pi * l1 / report_mix
        w = j0 + j1
        norm += w
        error += min(j0, j1)
        if w > 0.0:
            p = j1 / w
            brier += w * p * (1.0 - p)
            if 0.0 < p < 1.0:
                entropy += w * (-p * math.log2(p) - (1.0 - p) * math.log2(1.0 - p))

    return {
        "posterior_before_audits": prior_after_reports,
        "expected_entropy_bits": entropy,
        "expected_bayes_error": error,
        "expected_brier_score": brier,
        "normalization_error": abs(norm - 1.0),
    }


def main() -> None:
    # OV-103 fixture.
    pi, t, q, c, f = 0.10, 0.90, 0.08, 0.90, 0.02
    sensitivity, false_positive = 0.90, 0.05
    groups, m, budget = 6, 2, 6
    allocations = list(partitions(budget, groups))
    lambdas = (0.0, 1e-6, 1e-4, 1e-2, 1.0)

    print("OV104 diversified lineage-audit allocation")
    print(f"N={groups*m} G={groups} m={m} budget={budget}")
    print("pi=.10 t=.90 q=.08 c=.90 f=.02 sens=.90 fpr=.05")
    print(f"allocation_count={len(allocations)}")
    print("\nlambda best_allocation entropy_bits brier bayes_error posterior_before")

    for lam in lambdas:
        scored = [(evaluate(a, lam, pi, m, t, q, c, f,
                            sensitivity, false_positive), a)
                  for a in allocations]
        best, alloc = min(scored, key=lambda x: (x[0]["expected_entropy_bits"], x[1]))
        print(f"{lam:.6g} {alloc} {best['expected_entropy_bits']:.12f} "
              f"{best['expected_brier_score']:.12f} "
              f"{best['expected_bayes_error']:.12f} "
              f"{best['posterior_before_audits']:.12f}")

    print("\nselected_allocations")
    print("lambda allocation entropy_bits brier bayes_error")
    selected = ((6, 0, 0, 0, 0, 0), (3, 3, 0, 0, 0, 0),
                (2, 1, 1, 1, 1, 0), (1, 1, 1, 1, 1, 1))
    for lam in (0.0, 1e-4, 1.0):
        for a in selected:
            x = evaluate(a, lam, pi, m, t, q, c, f,
                         sensitivity, false_positive)
            print(f"{lam:.6g} {a} {x['expected_entropy_bits']:.12f} "
                  f"{x['expected_brier_score']:.12f} "
                  f"{x['expected_bayes_error']:.12f}")

    # Negative control: uninformative audits must leave every allocation equal.
    controls = [evaluate(a, 0.0, pi, m, t, q, c, f, 0.5, 0.5)
                for a in allocations]
    span_h = max(x["expected_entropy_bits"] for x in controls) - min(
        x["expected_entropy_bits"] for x in controls)
    span_e = max(x["expected_bayes_error"] for x in controls) - min(
        x["expected_bayes_error"] for x in controls)
    max_norm = max(
        evaluate(a, lam, pi, m, t, q, c, f,
                 sensitivity, false_positive)["normalization_error"]
        for a in allocations for lam in lambdas
    )
    # Shared-lineage limit: allocation labels cannot matter when lambda=1.
    shared = [evaluate(a, 1.0, pi, m, t, q, c, f,
                       sensitivity, false_positive)
              for a in allocations]
    shared_span = max(x["expected_entropy_bits"] for x in shared) - min(
        x["expected_entropy_bits"] for x in shared)

    assert max_norm < 2e-12
    assert span_h < 2e-12 and span_e < 2e-12
    assert shared_span < 2e-12
    best0 = min(allocations, key=lambda a: evaluate(
        a, 0.0, pi, m, t, q, c, f, sensitivity, false_positive
    )["expected_entropy_bits"])
    assert best0 == (1, 1, 1, 1, 1, 1)

    print("\ncontrols")
    print(f"max_normalization_error={max_norm:.3e}")
    print(f"uninformative_entropy_span={span_h:.3e}")
    print(f"uninformative_error_span={span_e:.3e}")
    print(f"shared_lineage_entropy_span={shared_span:.3e}")
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```
