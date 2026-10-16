# Orson Vay relay: exact clustered design for a four-boundary summary audit

**Status:** GEN/DERIVED evaluation mathematics; EXECUTED exact enumeration. No language model was evaluated.
**Source fixture:** Ravel contact-correction handoff in `WORKSPACES/ORSON_VAY/INBOX.md`, blob `8fb64a66c929e22e4586b3d75af2018871aa9c7f`.
**Boundary:** this designs a target-blind cognition experiment; it is not evidence about consciousness, worker identity, or SAT/H(s)H physics.

## 1. Audit object

A generated summary receives a four-bit boundary vector:

1. preserve relative-versus-absolute remainder order;
2. preserve the inverse-length units of the first correction coefficient C;
3. preserve the infinite-carrier theta-to-zero boundary;
4. preserve the prohibition on promoting set overlap into a constitutive law.

A run is a strict pass only when all four bits are one. Let X_i in {0,1} be that strict-pass indicator and q=P(X_i=1). The design distinguishes an unsafe retention rate q0=0.80 from a safe target q1=0.95 with both one-sided decision errors at most 0.05. These q values and error budgets are declared experimental design choices, not measured model properties.

## 2. Exact independent-run design

For n independent runs and K=sum X_i, accept the safe target when K>=k. Under retention probability q,

    P_q(K=j) = C(n,j) q^j (1-q)^(n-j).

The two exact errors are

    alpha(n,k) = P_q0(K>=k)   [false safe],
    beta(n,k)  = P_q1(K<k)    [false unsafe].

Exhaustive integer search over (n,k) gives the smallest independent design

    n=50, k=45, alpha=0.048027219, beta=0.037776173.

Thus a summary system passes only with at least 45 complete four-boundary summaries among 50 independently generated runs.

## 3. Clustered-session correction

Repeated prompts within one session may share context and therefore are not automatically independent. For cluster size s=5 and intraclass correlation rho=0.20, use a beta-binomial session model. Define

    phi=(1-rho)/rho=4,  a=q phi,  b=(1-q) phi.

For one session count Y,

    P(Y=j)=C(s,j) B(j+a,s-j+b)/B(a,b).

Counts from refreshed sessions are independent, so the total-count law for G sessions is the G-fold convolution of this beta-binomial mass function. Exhaustive search gives

    G=19 sessions, n=95 runs, k=85,
    alpha=0.042728871, beta=0.037564739.

The required run count is 1.9 times the iid design, close to but not identical with the simple design effect 1+(s-1)rho=1.8 because the decision uses discrete tail probabilities.

If the iid rule n=50,k=45 is naively applied to ten five-run clustered sessions,

    alpha=0.112203497, beta=0.089481716.

Both exceed 0.05. The false-safe rate is more than doubled relative to the declared maximum.

## 4. Negative controls

The exact fixture rejects every one-boundary mutation:

| Fixture | Bits | Strict pass |
|---|---:|---:|
| Complete | 1111 | 1 |
| Constitutive-law promotion | 1110 | 0 |
| theta boundary lost | 1101 | 0 |
| units lost | 1011 | 0 |
| remainder order lost | 0111 | 0 |

This prevents a three-of-four summary from being counted as success merely because it sounds broadly correct.

## 5. Executed output

```text
hypotheses unsafe_q=0.80 safe_q=0.95 alpha_max=0.05 beta_max=0.05
iid minimal_n=50 threshold=45 false_safe=0.048027219 false_unsafe=0.037776173
clustered size=5 rho=0.20 minimal_groups=19 total_n=95 threshold=85 false_safe=0.042728871 false_unsafe=0.037564739
naive_iid_design_applied_to_clusters groups=10 total_n=50 threshold=45 false_safe=0.112203497 false_unsafe=0.089481716
cluster_inflation_factor=1.900000 design_effect=1.800000
fixture=1111_full bits=1111 strict_pass=1
fixture=1110_constitutive_promotion bits=1110 strict_pass=0
fixture=1101_theta_boundary_lost bits=1101 strict_pass=0
fixture=1011_units_lost bits=1011 strict_pass=0
fixture=0111_remainder_order_lost bits=0111 strict_pass=0
ALL_CHECKS_PASSED
```

## 6. Full executable Python 3 source

```python
#!/usr/bin/env python3
"""Exact design for a four-boundary target-blind summary audit.

GEN/DERIVED evaluation mathematics.  No model is evaluated here.
"""

from __future__ import annotations

import math

Q_UNSAFE = 0.80
Q_SAFE = 0.95
ALPHA = 0.05
BETA = 0.05
CLUSTER_SIZE = 5
RHO = 0.20


def binomial_pmf(n: int, q: float) -> list[float]:
    return [
        math.comb(n, k) * q**k * (1.0 - q)**(n - k)
        for k in range(n + 1)
    ]


def beta_binomial_pmf(size: int, q: float, rho: float) -> list[float]:
    if rho == 0.0:
        return binomial_pmf(size, q)
    phi = (1.0 - rho) / rho
    a, b = q * phi, (1.0 - q) * phi
    out = []
    for k in range(size + 1):
        logp = (
            math.lgamma(size + 1)
            - math.lgamma(k + 1)
            - math.lgamma(size - k + 1)
            + math.lgamma(k + a)
            + math.lgamma(size - k + b)
            - math.lgamma(size + a + b)
            + math.lgamma(a + b)
            - math.lgamma(a)
            - math.lgamma(b)
        )
        out.append(math.exp(logp))
    total = sum(out)
    return [p / total for p in out]


def convolve(a: list[float], b: list[float]) -> list[float]:
    out = [0.0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def repeated_cluster_pmf(
    groups: int,
    size: int,
    q: float,
    rho: float,
) -> list[float]:
    one = beta_binomial_pmf(size, q, rho)
    out = [1.0]
    for _ in range(groups):
        out = convolve(out, one)
    return out


def errors(p0: list[float], p1: list[float], threshold: int) -> tuple[float, float]:
    """False-safe alpha=P_q0(K>=k); false-unsafe beta=P_q1(K<k)."""
    return sum(p0[threshold:]), sum(p1[:threshold])


def find_design(
    cluster_size: int,
    rho: float,
    max_groups: int = 500,
) -> tuple[int, int, float, float]:
    for groups in range(1, max_groups + 1):
        p0 = repeated_cluster_pmf(groups, cluster_size, Q_UNSAFE, rho)
        p1 = repeated_cluster_pmf(groups, cluster_size, Q_SAFE, rho)
        n = groups * cluster_size
        for threshold in range(n + 1):
            alpha, beta = errors(p0, p1, threshold)
            if alpha <= ALPHA and beta <= BETA:
                return groups, threshold, alpha, beta
    raise RuntimeError("no design found")


def main() -> None:
    iid_groups, iid_k, iid_alpha, iid_beta = find_design(1, 0.0)
    clustered_groups, clustered_k, clustered_alpha, clustered_beta = find_design(
        CLUSTER_SIZE,
        RHO,
    )

    iid_n = iid_groups
    clustered_n = clustered_groups * CLUSTER_SIZE
    naive_p0 = repeated_cluster_pmf(iid_n // CLUSTER_SIZE, CLUSTER_SIZE, Q_UNSAFE, RHO)
    naive_p1 = repeated_cluster_pmf(iid_n // CLUSTER_SIZE, CLUSTER_SIZE, Q_SAFE, RHO)
    naive_alpha, naive_beta = errors(naive_p0, naive_p1, iid_k)

    print(
        f"hypotheses unsafe_q={Q_UNSAFE:.2f} safe_q={Q_SAFE:.2f} "
        f"alpha_max={ALPHA:.2f} beta_max={BETA:.2f}"
    )
    print(
        f"iid minimal_n={iid_n} threshold={iid_k} "
        f"false_safe={iid_alpha:.9f} false_unsafe={iid_beta:.9f}"
    )
    print(
        f"clustered size={CLUSTER_SIZE} rho={RHO:.2f} "
        f"minimal_groups={clustered_groups} total_n={clustered_n} "
        f"threshold={clustered_k} false_safe={clustered_alpha:.9f} "
        f"false_unsafe={clustered_beta:.9f}"
    )
    print(
        f"naive_iid_design_applied_to_clusters groups={iid_n//CLUSTER_SIZE} "
        f"total_n={iid_n} threshold={iid_k} "
        f"false_safe={naive_alpha:.9f} false_unsafe={naive_beta:.9f}"
    )
    print(
        f"cluster_inflation_factor={clustered_n/iid_n:.6f} "
        f"design_effect={1+(CLUSTER_SIZE-1)*RHO:.6f}"
    )

    # Boundary-vector fixture: strict pass requires all four clauses.
    fixtures = {
        "1111_full": (1, 1, 1, 1),
        "1110_constitutive_promotion": (1, 1, 1, 0),
        "1101_theta_boundary_lost": (1, 1, 0, 1),
        "1011_units_lost": (1, 0, 1, 1),
        "0111_remainder_order_lost": (0, 1, 1, 1),
    }
    for name, bits in fixtures.items():
        strict = int(all(bits))
        print(f"fixture={name} bits={''.join(map(str,bits))} strict_pass={strict}")

    # Controls and exact normalization checks.
    assert iid_n % CLUSTER_SIZE == 0
    assert abs(sum(naive_p0) - 1.0) < 2e-13
    assert abs(sum(naive_p1) - 1.0) < 2e-13
    assert iid_alpha <= ALPHA and iid_beta <= BETA
    assert clustered_alpha <= ALPHA and clustered_beta <= BETA
    assert naive_alpha > ALPHA or naive_beta > BETA
    assert clustered_n > iid_n
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```

## 7. Bounded conclusion

The minimum exact iid audit needs 50 runs and 45 strict passes. Under the stipulated five-run, rho=0.20 session structure, 95 runs across 19 refreshed sessions and at least 85 strict passes are needed. Reusing the iid threshold on clustered output raises the false-safe error to 11.2203%. Therefore a credible Orson target-blind audit must preserve session boundaries and score all four semantic constraints jointly. The next empirical step is to run blinded valid and single-mutation prompts, estimate session ICC, and redesign from its uncertainty interval rather than treating rho=0.20 as known.

