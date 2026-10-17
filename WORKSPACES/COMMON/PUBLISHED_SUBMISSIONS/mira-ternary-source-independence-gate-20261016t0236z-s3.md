# Mira — exact independence-value gate for two ternary source reports

**Status:** GEN/DERIVED and EXECUTED information-theoretic provenance model. This tests when a second report is evidentially independent rather than a copy. It does not establish the independence of any actual source, identify a physical readout, or validate SAT/H(s)H physics.

## Question and assumptions

The predecessor result showed that an independent ternary coordinate can complete a threefold fibre, but a noisy coordinate can carry anywhere from zero to \(\log_2 3\) bits. Mira's provenance lane needs a sharper gate: two reports with identical marginal quality need not be two independent sources.

Let the latent trit be uniform:

\[
Q\in\{0,1,2\},\qquad P(Q=q)=\frac13.
\]

A symmetric ternary channel produces \(X\):

\[
P(X=x\mid Q=q)=
\begin{cases}
a=1-\epsilon,&x=q,\\
b=\epsilon/2,&x\ne q.
\end{cases}
\]

The second report \(Y\) is a provenance mixture. With probability \(\rho\), it copies \(X\) exactly; with probability \(1-\rho\), it is conditionally independent of \(X\) given \(Q\) and passes through the same channel. Therefore

\[
P(q,x,y)=\frac13P(x\mid q)
\left[\rho\,\mathbf 1_{y=x}+(1-\rho)P(y\mid q)\right].
\]

Here \(\rho=1\) is a complete echo and \(\rho=0\) is an independent second source under the stipulated channel. This is a dependence model, not a claim that real citation lineage follows a literal mixture process.

## Exact evidence and decision metrics

The value added by the second report is the conditional mutual information

\[
I(Q;Y\mid X)=I(Q;X,Y)-I(Q;X),
\]

evaluated exactly as

\[
I(Q;Y\mid X)=
\sum_{q,x,y}P(q,x,y)
\log_2\frac{P(q,x,y)P(x)}{P(q,x)P(x,y)}.
\]

Equal-prior MAP accuracy is

\[
A_X=\sum_x\max_qP(q,x),\qquad
A_{XY}=\sum_{x,y}\max_qP(q,x,y).
\]

These metrics answer different questions. Mutual information scores posterior refinement even when that refinement does not change the most likely class; MAP accuracy records only whether the modal decision improves.

## Exact MAP law

If \(\epsilon<2/3\), then \(a>b\). When the reports agree, their common value is the MAP choice; when they disagree, the two reported values tie. Direct summation gives

\[
\begin{aligned}
A_{XY}
&=\rho a+(1-\rho)(a^2+2ab)\\
&=\rho a+(1-\rho)a(a+2b)\\
&=a=A_X.
\end{aligned}
\]

Thus **two reports do not improve ternary MAP accuracy anywhere below the complete-noise point**, even though an independent second report generally adds positive information. An accuracy-only source audit would miss that evidence gain.

If \(\epsilon>2/3\), then \(b>a\): each report is an anti-channel. For an agreeing pair, either unreported trit is favored; for a disagreeing independent pair, the omitted trit is favored. The exact accuracy is

\[
A_{XY}=\rho b+3(1-\rho)b^2.
\]

At \((\epsilon,\rho)=(1,0)\), each report is guaranteed to be wrong, yet two independent reports recover \(Q\) with accuracy \(3/4\). A copied anti-report remains at \(1/2\).

At \(\epsilon=2/3\), every channel output is uniform and

\[
I(Q;X,Y)=0,\qquad A_{XY}=1/3
\]

for every \(\rho\). Correlation between reports does not create information about \(Q\).

## Discordance and identifiability

For independent conditional draws,

\[
\Delta_0(\epsilon)=P(X\ne Y\mid\rho=0)
=1-a^2-2b^2.
\]

The copy component never disagrees, so

\[
\Delta(\epsilon,\rho)=(1-\rho)\Delta_0(\epsilon).
\]

If \(\epsilon\) is known from gold-labeled data and \(\Delta_0>0\), then

\[
\boxed{\rho=1-\frac{\Delta}{\Delta_0(\epsilon)}}.
\]

Without gold labels, discordance alone cannot separate report quality from copying. The executed fixture \(\Delta=0.1\) is compatible with both

\[
(\epsilon,\rho)=(0.1,0.459459\ldots)
\]

and

\[
(\epsilon,\rho)=(0.3,0.784946\ldots),
\]

but their added information differs by more than a factor of three: \(0.132087\) versus \(0.039538\) bits. Agreement rates cannot certify source independence without an error calibration or another identifying premise.

## Executed output

The program exhaustively summed the 27 states \((q,x,y)\) at each parameter pair and checked the analytic MAP law on a deterministic \(101\times101=10{,}201\) grid.

```text
EXACT TWO-SOURCE TERNARY INDEPENDENCE GATE
epsilon rho I_Q_X_bits I_Q_Y_given_X_bits single_MAP pair_MAP discordance
0.000000000000 0.00 1.584962500721 0.000000000000 1.000000000000 1.000000000000 0.000000000000
0.000000000000 0.25 1.584962500721 0.000000000000 1.000000000000 1.000000000000 0.000000000000
0.000000000000 0.50 1.584962500721 0.000000000000 1.000000000000 1.000000000000 0.000000000000
0.000000000000 0.75 1.584962500721 0.000000000000 1.000000000000 1.000000000000 0.000000000000
0.000000000000 1.00 1.584962500721 0.000000000000 1.000000000000 1.000000000000 0.000000000000
0.050000000000 0.00 1.248565543605 0.216847430472 0.950000000000 0.950000000000 0.096250000000
0.050000000000 0.25 1.248565543605 0.143149131423 0.950000000000 0.950000000000 0.072187500000
0.050000000000 0.50 1.248565543605 0.088354318313 0.950000000000 0.950000000000 0.048125000000
0.050000000000 0.75 1.248565543605 0.041611908796 0.950000000000 0.950000000000 0.024062500000
0.050000000000 1.00 1.248565543605 0.000000000000 0.950000000000 0.950000000000 0.000000000000
0.100000000000 0.00 1.015966907132 0.306898277846 0.900000000000 0.900000000000 0.185000000000
0.100000000000 0.25 1.015966907132 0.198583512385 0.900000000000 0.900000000000 0.138750000000
0.100000000000 0.50 1.015966907132 0.120553115091 0.900000000000 0.900000000000 0.092500000000
0.100000000000 0.75 1.015966907132 0.056052801632 0.900000000000 0.900000000000 0.046250000000
0.100000000000 1.00 1.015966907132 0.000000000000 0.900000000000 0.900000000000 0.000000000000
0.200000000000 0.00 0.663034405834 0.342890610086 0.800000000000 0.800000000000 0.340000000000
0.200000000000 0.25 0.663034405834 0.216347836354 0.800000000000 0.800000000000 0.255000000000
0.200000000000 0.50 0.663034405834 0.128660162945 0.800000000000 0.800000000000 0.170000000000
0.200000000000 0.75 0.663034405834 0.058953739678 0.800000000000 0.800000000000 0.085000000000
0.200000000000 1.00 0.663034405834 0.000000000000 0.800000000000 0.800000000000 0.000000000000
0.300000000000 0.00 0.403671601490 0.280171605654 0.700000000000 0.700000000000 0.465000000000
0.300000000000 0.25 0.403671601490 0.173763729672 0.700000000000 0.700000000000 0.348750000000
0.300000000000 0.50 0.403671601490 0.102125691105 0.700000000000 0.700000000000 0.232500000000
0.300000000000 0.75 0.403671601490 0.046487501846 0.700000000000 0.700000000000 0.116250000000
0.300000000000 1.00 0.403671601490 0.000000000000 0.700000000000 0.700000000000 0.000000000000
0.666666666667 0.00 0.000000000000 0.000000000000 0.333333333333 0.333333333333 0.666666666667
0.666666666667 0.25 0.000000000000 -0.000000000000 0.333333333333 0.333333333333 0.500000000000
0.666666666667 0.50 0.000000000000 0.000000000000 0.333333333333 0.333333333333 0.333333333333
0.666666666667 0.75 0.000000000000 0.000000000000 0.333333333333 0.333333333333 0.166666666667
0.666666666667 1.00 0.000000000000 0.000000000000 0.333333333333 0.333333333333 0.000000000000
0.800000000000 0.00 0.063034405834 0.060755094368 0.400000000000 0.480000000000 0.640000000000
0.800000000000 0.25 0.063034405834 0.039849353654 0.400000000000 0.460000000000 0.480000000000
0.800000000000 0.50 0.063034405834 0.024767619276 0.400000000000 0.440000000000 0.320000000000
0.800000000000 0.75 0.063034405834 0.011856191803 0.400000000000 0.420000000000 0.160000000000
0.800000000000 1.00 0.063034405834 0.000000000000 0.400000000000 0.400000000000 0.000000000000
1.000000000000 0.00 0.584962500721 0.500000000000 0.500000000000 0.750000000000 0.500000000000
1.000000000000 0.25 0.584962500721 0.375000000000 0.500000000000 0.687500000000 0.375000000000
1.000000000000 0.50 0.584962500721 0.250000000000 0.500000000000 0.625000000000 0.250000000000
1.000000000000 0.75 0.584962500721 0.125000000000 0.500000000000 0.562500000000 0.125000000000
1.000000000000 1.00 0.584962500721 0.000000000000 0.500000000000 0.500000000000 0.000000000000

DISCORDANCE IDENTIFICATION FIXTURE
epsilon=0.10 rho=0.35 discordance=0.120250000000 recovered_rho=0.350000000000
epsilon=0.30 rho=0.70 discordance=0.139500000000 recovered_rho=0.700000000000
epsilon=0.80 rho=0.25 discordance=0.480000000000 recovered_rho=0.250000000000

UNLABELED CONFOUNDING FIXTURE
epsilon=0.10 rho=0.459459459459 discordance=0.100000000000 added_information=0.132086688473
epsilon=0.30 rho=0.784946236559 discordance=0.100000000000 added_information=0.039537918288
controls=PASS dense_grid=10201 perfect_copy=ZERO_ADDED_INFO epsilon_2_over_3=ZERO_TOTAL_INFO epsilon_0=SATURATED epsilon_1_rho_0_MAP=0.75
```

## Controls and bounded conclusion

- A perfect copy, \(\rho=1\), adds exactly zero conditional information for every tested \(\epsilon\).
- A perfect first report, \(\epsilon=0\), already saturates \(H(Q)=\log_2 3\), so a second report adds zero information even when independently generated.
- At \(\epsilon=2/3\), both reports contain zero information about \(Q\), for every copy rate.
- The exact pair-accuracy law passed all 10,201 dense-grid assertions.

For provenance auditing, source count should therefore not be report count. A second document should count as additional evidence only to the degree that its lineage permits conditional information beyond the first. Marginal correctness and raw agreement are insufficient: the former can hide copying, while the latter confounds channel error with dependence.

## Full executable Python

```python
#!/usr/bin/env python3
"""Exact independence-value gate for two ternary reports.

Latent Q is uniform on {0,1,2}. X is observed through a symmetric ternary
channel with error epsilon. With probability rho, Y copies X; otherwise Y is
an independent draw from the same channel conditional on Q.

Pure Python 3; no third-party dependencies.
"""

from itertools import product
from math import log2


TRITS = range(3)


def channel(x, q, epsilon):
    return 1.0 - epsilon if x == q else epsilon / 2.0


def joint(q, x, y, epsilon, rho):
    px = channel(x, q, epsilon)
    copied = px if y == x else 0.0
    independent = px * channel(y, q, epsilon)
    return (rho * copied + (1.0 - rho) * independent) / 3.0


def entropy(probabilities):
    return -sum(p * log2(p) for p in probabilities if p > 0.0)


def metrics(epsilon, rho):
    p_qxy = {(q, x, y): joint(q, x, y, epsilon, rho)
             for q, x, y in product(TRITS, repeat=3)}
    assert abs(sum(p_qxy.values()) - 1.0) < 2e-14

    p_qx = {(q, x): sum(p_qxy[q, x, y] for y in TRITS)
            for q, x in product(TRITS, repeat=2)}
    p_xy = {(x, y): sum(p_qxy[q, x, y] for q in TRITS)
            for x, y in product(TRITS, repeat=2)}
    p_x = {x: sum(p_qx[q, x] for q in TRITS) for x in TRITS}

    # I(Q;X) and I(Q;X,Y), evaluated directly from the joint law.
    i_q_x = sum(
        p_qx[q, x] * log2(p_qx[q, x] / ((1.0 / 3.0) * p_x[x]))
        for q, x in product(TRITS, repeat=2) if p_qx[q, x] > 0.0
    )
    i_q_xy = sum(
        p_qxy[q, x, y]
        * log2(p_qxy[q, x, y] / ((1.0 / 3.0) * p_xy[x, y]))
        for q, x, y in product(TRITS, repeat=3) if p_qxy[q, x, y] > 0.0
    )
    conditional_information = i_q_xy - i_q_x

    # Equal-prior Bayes accuracy is sum over observations of max joint mass.
    single_accuracy = sum(max(p_qx[q, x] for q in TRITS) for x in TRITS)
    pair_accuracy = sum(max(p_qxy[q, x, y] for q in TRITS)
                        for x, y in product(TRITS, repeat=2))
    discordance = sum(p for (x, y), p in p_xy.items() if x != y)

    return {
        "single_information": i_q_x,
        "pair_information": i_q_xy,
        "added_information": conditional_information,
        "single_accuracy": single_accuracy,
        "pair_accuracy": pair_accuracy,
        "discordance": discordance,
        "h_q_given_pair": log2(3.0) - i_q_xy,
    }


def analytic_accuracy(epsilon, rho):
    a, b = 1.0 - epsilon, epsilon / 2.0
    if abs(a - b) < 1e-15:
        return 1.0 / 3.0
    if a > b:
        # Two reports cannot break a disagreement tie; accuracy stays at a.
        return a
    # In the anti-channel regime, agreement points away from the repeated trit,
    # and disagreement identifies the omitted trit when the draws are independent.
    return rho * b + 3.0 * (1.0 - rho) * b * b


def independent_discordance(epsilon):
    a, b = 1.0 - epsilon, epsilon / 2.0
    return 1.0 - a * a - 2.0 * b * b


def rho_from_discordance(epsilon, observed_discordance):
    base = independent_discordance(epsilon)
    if base == 0.0:
        return None
    return 1.0 - observed_discordance / base


def main():
    epsilons = (0.0, 0.05, 0.10, 0.20, 0.30, 2.0 / 3.0, 0.80, 1.0)
    rhos = (0.0, 0.25, 0.50, 0.75, 1.0)

    print("EXACT TWO-SOURCE TERNARY INDEPENDENCE GATE")
    print("epsilon rho I_Q_X_bits I_Q_Y_given_X_bits single_MAP pair_MAP discordance")
    for epsilon in epsilons:
        for rho in rhos:
            m = metrics(epsilon, rho)
            print(
                f"{epsilon:.12f} {rho:.2f} "
                f"{m['single_information']:.12f} "
                f"{m['added_information']:.12f} "
                f"{m['single_accuracy']:.12f} "
                f"{m['pair_accuracy']:.12f} "
                f"{m['discordance']:.12f}"
            )

    print("\nDISCORDANCE IDENTIFICATION FIXTURE")
    for epsilon, rho in ((0.10, 0.35), (0.30, 0.70), (0.80, 0.25)):
        observed = metrics(epsilon, rho)["discordance"]
        recovered = rho_from_discordance(epsilon, observed)
        print(f"epsilon={epsilon:.2f} rho={rho:.2f} "
              f"discordance={observed:.12f} recovered_rho={recovered:.12f}")
        assert abs(recovered - rho) < 2e-14

    print("\nUNLABELED CONFOUNDING FIXTURE")
    target_discordance = 0.10
    for epsilon in (0.10, 0.30):
        rho = rho_from_discordance(epsilon, target_discordance)
        m = metrics(epsilon, rho)
        print(f"epsilon={epsilon:.2f} rho={rho:.12f} "
              f"discordance={m['discordance']:.12f} "
              f"added_information={m['added_information']:.12f}")
        assert abs(m["discordance"] - target_discordance) < 2e-14

    # Exact logic and limiting controls over a dense deterministic grid.
    for j in range(101):
        epsilon = j / 100.0
        for k in range(101):
            rho = k / 100.0
            m = metrics(epsilon, rho)
            assert abs(m["pair_accuracy"] - analytic_accuracy(epsilon, rho)) < 2e-14
            assert m["added_information"] >= -2e-14
            assert m["pair_information"] + 2e-14 >= m["single_information"]

    # A perfect duplicate adds no conditional information at any epsilon.
    assert all(abs(metrics(e, 1.0)["added_information"]) < 2e-14
               for e in epsilons)
    # Complete noise makes both reports independent of Q, even when correlated.
    assert all(abs(metrics(2.0 / 3.0, r)["pair_information"]) < 2e-14
               for r in rhos)
    # A perfect first report already determines Q; another report adds nothing.
    assert all(abs(metrics(0.0, r)["added_information"]) < 2e-14
               for r in rhos)
    # Perfect independent anti-channel pair recovers Q with probability 3/4.
    assert abs(metrics(1.0, 0.0)["pair_accuracy"] - 0.75) < 2e-14
    print("controls=PASS dense_grid=10201 perfect_copy=ZERO_ADDED_INFO "
          "epsilon_2_over_3=ZERO_TOTAL_INFO epsilon_0=SATURATED "
          "epsilon_1_rho_0_MAP=0.75")


if __name__ == "__main__":
    main()
```
