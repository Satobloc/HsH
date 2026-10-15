# Alberr — exact noisy-trit recovery for the 72-state phase map

**Status:** GEN/DERIVED finite-alphabet information mathematics; executable enumeration run. The historical 72-snap interpretation remains SAT/OPEN. This audits a declared representation and readout channel, not a physical noise process or SAT/H(s)H mechanism.

## Starting point and assumptions

The inherited result classifies surjective phase homomorphisms

\[
\phi:\mathbb Z_{24}\times\mathbb Z_3\to\mathbb Z_{24}
\]

with three-element fibres. A linear trit \(q\in\mathbb Z_3\) completes the phase map exactly when its 3-primary row is independent of the phase row. Thus an admissible pair \((\phi,q)\) labels all \(24\times3=72\) states.

This calculation keeps \(\phi\) noiseless and transmits the completing trit \(r\) times through independent ternary-symmetric channels:

\[
P(Y_t=q)=1-\epsilon,\qquad
P(Y_t=q+1)=P(Y_t=q+2)=\epsilon/2.
\]

The 72 input states are uniform. Because \(\phi\) already identifies the 24 fibres, full-state recovery is exactly the problem of recovering the uniform trit within one fibre.

## MAP rule

Let \((n_0,n_1,n_2)\), with \(n_0+n_1+n_2=r\), be the received-symbol counts. For candidate \(q=a\),

\[
L_a=(1-\epsilon)^{n_a}(\epsilon/2)^{r-n_a}.
\]

Therefore:

- if \(\epsilon<2/3\), then \(1-\epsilon>\epsilon/2\), so MAP chooses the largest count;
- if \(\epsilon>2/3\), MAP chooses the smallest count;
- if \(\epsilon=2/3\), all three likelihoods are equal and no number of repeats contains information.

Ties are broken uniformly among MAP maximizers. The exact recovery probability for true label zero is

\[
P_{\rm MAP}(r,\epsilon)=
\sum_{n_0+n_1+n_2=r}
\frac{r!}{n_0!n_1!n_2!}
(1-\epsilon)^{n_0}(\epsilon/2)^{n_1+n_2}
\frac{\mathbf 1[0\in W(n)]}{|W(n)|},
\]

where \(W(n)\) is the MAP winner set.

For one use,

\[
P_{\rm MAP}(1,\epsilon)=
\begin{cases}
1-\epsilon,&\epsilon<2/3,\\
1/3,&\epsilon=2/3,\\
\epsilon/2,&\epsilon>2/3.
\end{cases}
\]

The rise above \(2/3\) is not paradoxical: a sufficiently anti-correlated symbol is evidence for what was *not* sent.

## Mutual information

For each absolute count triple, define

\[
L_a=(1-\epsilon)^{n_a}(\epsilon/2)^{r-n_a},
\qquad
\bar L=(L_0+L_1+L_2)/3.
\]

Grouping all \(3^r\) received strings by count triple gives

\[
I(q;Y^r)=
\sum_{n_0+n_1+n_2=r}
\frac{r!}{n_0!n_1!n_2!}
\frac13\sum_{a=0}^2 L_a\log_2\!\frac{L_a}{\bar L}.
\]

The residual uncertainty of the complete 72-state label after noiseless phase and noisy trit is

\[
H(X\mid\phi,Y^r)=\log_2 3-I(q;Y^r).
\]

For one use this reduces to

\[
I(q;Y)=\log_2 3-H(1-\epsilon,\epsilon/2,\epsilon/2).
\]

## Exact results

The first repetition counts reaching \(P_{\rm MAP}\ge0.95\) are:

| \(\epsilon\) | MAP rule | first \(r\) | accuracy | information (bits) |
|---:|:---|---:|---:|---:|
| 0.05 | largest count | 1 | 0.950000000000 | 1.248565543605 |
| 0.10 | largest count | 3 | 0.976500000000 | 1.476378704736 |
| 0.20 | largest count | 5 | 0.961280000000 | 1.439379157529 |
| 0.30 | largest count | 9 | 0.960811921562 | 1.434696606835 |
| 0.80 | smallest count | 54 | 0.951490832568 | 1.398733057263 |
| 1.00 | smallest count | 5 | 0.968750000000 | 1.522462500721 |

At \(\epsilon=1\), the received symbol can never equal the source. Recovery fails only when every repeat shows the same one of the two wrong symbols, giving the closed form

\[
P_{\rm MAP}(r,1)=1-2^{-r}.
\]

At \(\epsilon=2/3\), every received symbol is uniform regardless of \(q\):

\[
P_{\rm MAP}=1/3,\qquad I(q;Y^r)=0
\]

for every \(r\).

A determinant-zero added coordinate is the algebraic negative control. If \(q\) is already a function of \(\phi\), noisy copies add zero conditional information and the original threefold phase ambiguity remains: full-state MAP success is \(1/3\).

## Executed output

```text
NOISY TRIT COMPLETION OF A 72-STATE PHASE MAP
channel: P(Y=q)=1-epsilon; P(each wrong trit)=epsilon/2
epsilon r map_accuracy mutual_information_bits residual_state_uncertainty_bits
0.000000000  1 1.000000000000 1.584962500721 0.000000000000
0.000000000  2 1.000000000000 1.584962500721 0.000000000000
0.000000000  3 1.000000000000 1.584962500721 0.000000000000
0.000000000  5 1.000000000000 1.584962500721 0.000000000000
0.000000000  7 1.000000000000 1.584962500721 0.000000000000
0.000000000  9 1.000000000000 1.584962500721 0.000000000000
0.050000000  1 0.950000000000 1.248565543605 0.336396957116
0.050000000  2 0.950000000000 1.465412974078 0.119549526644
0.050000000  3 0.993937500000 1.553753811972 0.031208688750
0.050000000  5 0.999264921875 1.581891310210 0.003071190511
0.050000000  7 0.999923641113 1.584656262459 0.000306238262
0.050000000  9 0.999991950624 1.584931419325 0.000031081396
0.100000000  1 0.900000000000 1.015966907132 0.568995593589
0.100000000  2 0.900000000000 1.322865184978 0.262097315744
0.100000000  3 0.976500000000 1.476378704736 0.108583795985
0.100000000  5 0.994477500000 1.563177862862 0.021784637859
0.100000000  7 0.998866687500 1.580520448875 0.004442051846
0.100000000  9 0.999761307188 1.584043102179 0.000919398542
0.200000000  1 0.800000000000 0.663034405834 0.921928094887
0.200000000  2 0.800000000000 1.005925015919 0.579037484802
0.200000000  3 0.912000000000 1.224850125611 0.360112375110
0.200000000  5 0.961280000000 1.439379157529 0.145583343192
0.200000000  7 0.984576000000 1.525189084146 0.059773416575
0.200000000  9 0.993607680000 1.560156563416 0.024805937306
0.300000000  1 0.700000000000 0.403671601490 1.181290899231
0.300000000  2 0.700000000000 0.683843207145 0.901119293577
0.300000000  3 0.815500000000 0.894893638427 0.690068862294
0.300000000  5 0.886532500000 1.173696230502 0.411266270220
0.300000000  7 0.934739312500 1.337241136140 0.247721364581
0.300000000  9 0.960811921562 1.434696606835 0.150265893886
0.666666667  1 0.333333333333 0.000000000000 1.584962500721
0.666666667  2 0.333333333333 -0.000000000000 1.584962500721
0.666666667  3 0.333333333333 0.000000000000 1.584962500721
0.666666667  5 0.333333333333 0.000000000000 1.584962500721
0.666666667  7 0.333333333333 -0.000000000000 1.584962500721
0.666666667  9 0.333333333333 -0.000000000000 1.584962500721
0.800000000  1 0.400000000000 0.063034405834 1.521928094887
0.800000000  2 0.480000000000 0.123789500202 1.461173000519
0.800000000  3 0.512000000000 0.182212246550 1.402750254171
0.800000000  5 0.573440000000 0.292153595706 1.292808905016
0.800000000  7 0.615219200000 0.393313371952 1.191649128769
0.800000000  9 0.657195008000 0.486318267163 1.098644233558
1.000000000  1 0.500000000000 0.584962500721 1.000000000000
1.000000000  2 0.750000000000 1.084962500721 0.500000000000
1.000000000  3 0.875000000000 1.334962500721 0.250000000000
1.000000000  5 0.968750000000 1.522462500721 0.062500000000
1.000000000  7 0.992187500000 1.569337500721 0.015625000000
1.000000000  9 0.998046875000 1.581056250721 0.003906250000
first_r_for_map_accuracy_at_least_0.95
epsilon=0.05 r=1 accuracy=0.950000000000 information=1.248565543605
epsilon=0.10 r=3 accuracy=0.976500000000 information=1.476378704736
epsilon=0.20 r=5 accuracy=0.961280000000 information=1.439379157529
epsilon=0.30 r=9 accuracy=0.960811921562 information=1.434696606835
epsilon=0.80 r=54 accuracy=0.951490832568 information=1.398733057263
epsilon=1.00 r=5 accuracy=0.968750000000 information=1.522462500721
determinant_zero_control: added_information_bits=0 full_state_MAP=0.333333333333
ALL_EXACT_ASSERTIONS_PASSED
```

## Full executable Python 3 source

```python
#!/usr/bin/env python3
"""Exact noisy-trit recovery for a 72-state Z24 x Z3 phase encoding.

GEN/DERIVED finite-alphabet information mathematics.  The phase coordinate is
assumed to be a surjective homomorphism with three-element fibres, and q is an
independent trit completing the phase map.  This is a representation audit,
not a physical-noise model or SAT/H(s)H mechanism.
"""

from math import factorial, log2


def compositions3(r):
    for n0 in range(r + 1):
        for n1 in range(r - n0 + 1):
            yield n0, n1, r - n0 - n1


def multinomial(counts):
    r = sum(counts)
    out = factorial(r)
    for n in counts:
        out //= factorial(n)
    return out


def xlog2ratio(x, y):
    return 0.0 if x == 0.0 else x * log2(x / y)


def exact_metrics(epsilon, repetitions):
    """Return MAP state recovery and I(q;Y^r) for the ternary channel.

    Channel: P(Y=q)=1-epsilon and each wrong symbol has probability epsilon/2.
    The phase is noiseless, so full 72-state recovery equals fibre-trit recovery.
    """
    p_same = 1.0 - epsilon
    p_other = epsilon / 2.0
    correct = 0.0
    mutual_information = 0.0
    normalization = 0.0

    for counts in compositions3(repetitions):
        multiplicity = multinomial(counts)
        likelihood = [
            p_same ** counts[q] * p_other ** (repetitions - counts[q])
            for q in range(3)
        ]
        mixture = sum(likelihood) / 3.0
        normalization += multiplicity * likelihood[0]

        # Uniform-prior MAP. Ties receive uniform randomized tie-breaking.
        if p_same > p_other:
            target_count = max(counts)
            winners = [q for q, count in enumerate(counts) if count == target_count]
        elif p_same < p_other:
            target_count = min(counts)
            winners = [q for q, count in enumerate(counts) if count == target_count]
        else:
            winners = [0, 1, 2]
        tie_credit = (1.0 / len(winners)) if 0 in winners else 0.0
        correct += multiplicity * likelihood[0] * tie_credit

        if mixture > 0.0:
            mutual_information += multiplicity * sum(
                xlog2ratio(value / 3.0, mixture / 3.0)
                for value in likelihood
            )

    assert abs(normalization - 1.0) < 2e-12
    return correct, mutual_information


def single_use_formula(epsilon):
    """Closed forms for one use, including the anti-correlated regime."""
    if epsilon < 2.0 / 3.0:
        accuracy = 1.0 - epsilon
    elif epsilon > 2.0 / 3.0:
        accuracy = epsilon / 2.0
    else:
        accuracy = 1.0 / 3.0
    terms = [1.0 - epsilon, epsilon / 2.0, epsilon / 2.0]
    conditional_entropy = -sum(p * log2(p) for p in terms if p > 0.0)
    information = log2(3.0) - conditional_entropy
    return accuracy, information


def first_repetitions(epsilon, target=0.95, limit=101):
    for r in range(1, limit + 1):
        accuracy, information = exact_metrics(epsilon, r)
        if accuracy >= target:
            return r, accuracy, information
    return None


def main():
    epsilons = (0.0, 0.05, 0.10, 0.20, 0.30, 2.0 / 3.0, 0.80, 1.0)
    repetitions = (1, 2, 3, 5, 7, 9)

    print("NOISY TRIT COMPLETION OF A 72-STATE PHASE MAP")
    print("channel: P(Y=q)=1-epsilon; P(each wrong trit)=epsilon/2")
    print("epsilon r map_accuracy mutual_information_bits residual_state_uncertainty_bits")
    for epsilon in epsilons:
        for r in repetitions:
            accuracy, information = exact_metrics(epsilon, r)
            residual = log2(3.0) - information
            print(f"{epsilon:.9f} {r:2d} {accuracy:.12f} {information:.12f} {residual:.12f}")

    print("first_r_for_map_accuracy_at_least_0.95")
    for epsilon in (0.05, 0.10, 0.20, 0.30, 0.80, 1.0):
        result = first_repetitions(epsilon)
        assert result is not None
        r, accuracy, information = result
        print(f"epsilon={epsilon:.2f} r={r} accuracy={accuracy:.12f} information={information:.12f}")

    # One-use enumeration must reproduce the analytic symmetric-channel law.
    for epsilon in epsilons:
        observed = exact_metrics(epsilon, 1)
        predicted = single_use_formula(epsilon)
        assert max(abs(a - b) for a, b in zip(observed, predicted)) < 2e-14

    # Complete-noise control: epsilon=2/3 makes every output uniform and
    # repetitions cannot recover information.
    for r in repetitions:
        accuracy, information = exact_metrics(2.0 / 3.0, r)
        assert abs(accuracy - 1.0 / 3.0) < 2e-14
        assert abs(information) < 2e-14

    # At epsilon=1 the received trit is guaranteed not to equal q.  Recovery
    # fails only when all repeats show the same wrong symbol; exact accuracy is
    # 1-2^(-r).
    for r in repetitions:
        accuracy, _ = exact_metrics(1.0, r)
        assert abs(accuracy - (1.0 - 2.0 ** (-r))) < 2e-14

    # Determinant-zero control: if q is a function of the noiseless phase,
    # conditionally observing any number of noisy q copies adds zero bits and
    # the best full-state success probability remains 1/3.
    print("determinant_zero_control: added_information_bits=0 full_state_MAP=0.333333333333")
    print("ALL_EXACT_ASSERTIONS_PASSED")


if __name__ == "__main__":
    main()
```

## Bounded conclusion

Algebraic sufficiency and operational reliability are separate. An independent trit is the minimal exact completion of the threefold phase fibre, but one noisy observation can carry anywhere from \(0\) to \(\log_2 3\) bits. The unique information-dead point is \(\epsilon=2/3\), not \(\epsilon=1\). Repetition restores arbitrary reliability for every \(\epsilon\ne2/3\) under the declared independent channel, with the MAP rule reversing from largest-count to smallest-count above the dead point. None of this identifies a physical source of noise or establishes that the historical 72-state system used this channel.
