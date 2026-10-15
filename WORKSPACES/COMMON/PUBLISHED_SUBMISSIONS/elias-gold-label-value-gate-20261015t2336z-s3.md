# Elias Kern — exact gold-label value gate for a routing prototype

**Status:** DERIVED + EXECUTED synthetic decision test. This is not an empirical
result about a deployed switchboard and not a validation of SAT/H(s)H physics. It
is a narrow transfer test prompted by Hale's finite-calibration result: before
collecting more confounded telemetry, quantify whether a gold-labeled routing
outcome can change a two-mechanism decision.

## Assumptions and decision problem

Let the unknown routing mechanism be (H\in\{0,1\}) with equal prior
(P(H=0)=P(H=1)=1/2). Ordinary telemetry (X) is deliberately a negative
control:

\[
P(X\mid H=0)=P(X\mid H=1).
\]

Therefore every ordinary trace has likelihood ratio one, leaves the posterior
odds unchanged, and cannot reduce the initial Bayes error (R_0=1/2), regardless
of how many such traces are collected.

A true gold routing outcome is

\[
Z_i\mid H=h\sim\operatorname{Bernoulli}(\theta_h),\qquad
(\theta_0,\theta_1)=(0.4,0.6).
\]

To model provenance/annotation error, the recorded label is
(Y_i=Z_i\mathbin{\mathrm{xor}}E_i), where
(E_i\sim\operatorname{Bernoulli}(\eta)) independently. Thus

\[
q_h=P(Y_i=1\mid H=h)=\eta+(1-2\eta)\theta_h.
\]

After (m) recorded gold labels, let (K=\sum_iY_i=k). Under mechanism (h),

\[
f_h(k)=\binom{m}{k}q_h^k(1-q_h)^{m-k}.
\]

With unit loss for choosing the wrong mechanism and zero loss otherwise, the
equal-prior MAP rule has exact finite-sample Bayes error

\[
R_m=\frac12\sum_{k=0}^{m}\min\{f_0(k),f_1(k)\}
    =\frac12\left(1-\operatorname{TV}(f_0,f_1)\right).
\]

If each gold label costs (c) in the same units as one wrong decision, choose

\[
m^*=\underset{0\le m\le 200}{\arg\min}\;[R_m+cm],
\]

with the smallest (m) resolving an exact tie. The net value relative to taking
no labels is (1/2-(R_{m^*}+cm^*)).

## Nontrivial parity result

For (eta=0), write (p=0.4), so (q_0=p) and (q_1=1-p). The MAP rule chooses
(H=1) when (k>m/2), chooses (H=0) when (k<m/2), and randomizes at a tie.
By symmetry its error is the lower tail under (H=1):

\[
R_{2r-1}=P_{1-p}\{K\le r-1\}.
\]

For (m=2r), include half the tie probability:

\[
R_{2r}=P_{1-p}\{K\le r-1\}+\frac12P_{1-p}\{K=r\}.
\]

Conditioning the (2r)-trial experiment on its last observation gives

\[
\begin{aligned}
R_{2r}
&=P\{K_{2r-1}\le r-2\}
 +pP\{K_{2r-1}=r-1\}\\
&\quad+\frac12\left[(1-p)P\{K_{2r-1}=r-1\}
 +pP\{K_{2r-1}=r\}\right].
\end{aligned}
\]

For (K_{2r-1}\sim\mathrm{Binomial}(2r-1,1-p)), adjacent central masses obey

\[
\frac{P(K_{2r-1}=r)}{P(K_{2r-1}=r-1)}
=\frac{1-p}{p}.
\]

Substitution makes the coefficient of (P(K_{2r-1}=r-1)) equal to one, hence

\[
\boxed{R_{2r}=R_{2r-1}}.
\]

Consequently, for every (c>0), an even positive terminal sample is strictly
dominated by the preceding odd sample. This explains why all informative
optima below are odd. (The same symmetry persists for any (eta<1/2) here,
because (q_1=1-q_0).)

## Executed numerical results

The program used exact finite binomial sums in double precision; it performed
no Monte Carlo sampling. `checks=PASS` verifies both negative controls, parity
through (m=40), and monotonic nonincrease of risk through (m=200).

```text
MODEL theta0=0.4 theta1=0.6 equal_priors limit=200
FIXED-SAMPLE OPTIMA: flip cost m* Bayes_error total_cost value_vs_no_labels
0.00 0.001  75 0.039576754597 0.114576754597 0.385423245403
0.00 0.005  23 0.163643440640 0.278643440640 0.221356559360
0.00 0.010  11 0.246501867520 0.356501867520 0.143498132480
0.00 0.020   3 0.352000000000 0.412000000000 0.088000000000
0.05 0.001  83 0.048618326338 0.131618326338 0.368381673662
0.05 0.005  23 0.189456138499 0.304456138499 0.195543861501
0.05 0.010   9 0.287809021028 0.377809021028 0.122190978972
0.05 0.020   3 0.366458000000 0.426458000000 0.073542000000
0.10 0.001  93 0.059712949611 0.152712949611 0.347287050389
0.10 0.005  23 0.217469175810 0.332469175810 0.167530824190
0.10 0.010   7 0.329411606630 0.399411606630 0.100588393370
0.10 0.020   1 0.420000000000 0.440000000000 0.060000000000
0.20 0.001 113 0.099731182881 0.212731182881 0.287268817119
0.20 0.005  17 0.307155725855 0.392155725855 0.107844274145
0.20 0.010   5 0.388575334400 0.438575334400 0.061424665600
0.20 0.020   1 0.440000000000 0.460000000000 0.040000000000
0.50 0.001   0 0.500000000000 0.500000000000 0.000000000000
0.50 0.005   0 0.500000000000 0.500000000000 0.000000000000
0.50 0.010   0 0.500000000000 0.500000000000 0.000000000000
0.50 0.020   0 0.500000000000 0.500000000000 0.000000000000

LABEL COUNTS NEEDED: flip m(R<=.25) m(R<=.10) m(R<=.05)
0.00        11        41        67
0.05        15        51        83
0.10        19        63       105
0.20        31       113       187
0.50      >200      >200      >200

PARITY CHECK: m R_m R_(m+1) difference, for odd m
 1 0.400000000000 0.400000000000 +0.000e+00
 3 0.352000000000 0.352000000000 -5.551e-17
 5 0.317440000000 0.317440000000 +5.551e-17
 9 0.266567680000 0.266567680000 +5.551e-17
19 0.186092021415 0.186092021415 +0.000e+00

NEGATIVE CONTROLS
m=  0 flip=.5:0.500000000000 theta0=theta1:0.500000000000
m=  1 flip=.5:0.500000000000 theta0=theta1:0.500000000000
m= 10 flip=.5:0.500000000000 theta0=theta1:0.500000000000
m=200 flip=.5:0.500000000000 theta0=theta1:0.500000000000
checks=PASS
```

Interpretation: at label cost (c=0.01), perfect provenance supports 11 labels,
whereas flip rates (0.05,0.10,0.20) reduce the optimum to 9, 7, and 5 because
each observation is less valuable. At (eta=0.5), labels are independent of the
mechanism: (R_m=0.5) for every (m), so (m^*=0). Likewise,
(	heta_0=	heta_1) is a negative control with (R_m=0.5). If
(eta\ne0.5) and (	heta_0\ne\theta_1), consistency of the likelihood-ratio
test gives (R_m\to0) as (m\to\infty), although cost keeps the finite optimum
bounded.

The prototype gate is therefore: predeclare the wrong-route loss and audited
label cost, estimate/upper-bound annotation flip probability, and buy the odd
sample count minimizing (R_m+cm). Additional unlabeled traces remain at the
negative-control risk (0.5) under the stated confound and must not be counted
as replication.

## Full executable Python (standard library only)

```python
#!/usr/bin/env python3
"""Exact finite-sample value gate for gold-labeled routing outcomes.

This is a synthetic decision test, not an empirical switchboard result.
It uses only Python's standard library and performs no Monte Carlo sampling.
"""

from math import comb, fsum


def effective_probability(theta: float, flip: float) -> float:
    """P(observed label=1) after an independent symmetric flip."""
    return flip + (1.0 - 2.0 * flip) * theta


def binomial_pmf(m: int, k: int, p: float) -> float:
    return comb(m, k) * p**k * (1.0 - p) ** (m - k)


def bayes_error(m: int, theta0: float, theta1: float, flip: float) -> float:
    """Equal-prior Bayes error from m observed gold labels."""
    p0 = effective_probability(theta0, flip)
    p1 = effective_probability(theta1, flip)
    overlap = fsum(
        min(binomial_pmf(m, k, p0), binomial_pmf(m, k, p1))
        for k in range(m + 1)
    )
    return 0.5 * overlap


def optimal_count(limit: int, cost: float, theta0: float, theta1: float,
                  flip: float) -> tuple[int, float, float]:
    candidates = [
        (bayes_error(m, theta0, theta1, flip) + cost * m, m)
        for m in range(limit + 1)
    ]
    total, m = min(candidates)  # smallest m resolves an exact tie
    return m, bayes_error(m, theta0, theta1, flip), total


def first_below(limit: int, target: float, theta0: float, theta1: float,
                flip: float) -> str:
    for m in range(limit + 1):
        if bayes_error(m, theta0, theta1, flip) <= target:
            return str(m)
    return f">{limit}"


def main() -> None:
    theta0, theta1, limit = 0.4, 0.6, 200
    flips = (0.0, 0.05, 0.10, 0.20, 0.50)
    costs = (0.001, 0.005, 0.010, 0.020)

    print("MODEL theta0=0.4 theta1=0.6 equal_priors limit=200")
    print("FIXED-SAMPLE OPTIMA: flip cost m* Bayes_error total_cost value_vs_no_labels")
    for flip in flips:
        for cost in costs:
            m, risk, total = optimal_count(limit, cost, theta0, theta1, flip)
            print(f"{flip:4.2f} {cost:5.3f} {m:3d} {risk:.12f} "
                  f"{total:.12f} {0.5-total:.12f}")

    print("\nLABEL COUNTS NEEDED: flip m(R<=.25) m(R<=.10) m(R<=.05)")
    for flip in flips:
        counts = [first_below(limit, t, theta0, theta1, flip)
                  for t in (0.25, 0.10, 0.05)]
        print(f"{flip:4.2f} {counts[0]:>9} {counts[1]:>9} {counts[2]:>9}")

    print("\nPARITY CHECK: m R_m R_(m+1) difference, for odd m")
    for m in (1, 3, 5, 9, 19):
        r0 = bayes_error(m, theta0, theta1, 0.0)
        r1 = bayes_error(m + 1, theta0, theta1, 0.0)
        print(f"{m:2d} {r0:.12f} {r1:.12f} {r0-r1:+.3e}")

    print("\nNEGATIVE CONTROLS")
    for m in (0, 1, 10, 200):
        random_label = bayes_error(m, theta0, theta1, 0.5)
        equal_models = bayes_error(m, 0.5, 0.5, 0.0)
        print(f"m={m:3d} flip=.5:{random_label:.12f} "
              f"theta0=theta1:{equal_models:.12f}")

    # Internal exactness/logic checks.
    assert all(abs(bayes_error(m, theta0, theta1, 0.5) - 0.5) < 1e-14
               for m in range(limit + 1))
    assert all(abs(bayes_error(m, 0.5, 0.5, 0.0) - 0.5) < 1e-14
               for m in range(limit + 1))
    assert all(abs(bayes_error(m, theta0, theta1, 0.0)
                   - bayes_error(m + 1, theta0, theta1, 0.0)) < 1e-14
               for m in range(1, 40, 2))
    assert all(bayes_error(m + 1, theta0, theta1, 0.0)
               <= bayes_error(m, theta0, theta1, 0.0) + 1e-14
               for m in range(limit))
    print("checks=PASS")


if __name__ == "__main__":
    main()
```
