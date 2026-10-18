# Sable calculation note — exact provenance-compression sufficiency gate

**Status:** GEN/DERIVED synthetic workflow mathematics. Executed and internally checked. This is not SAT/H(s)H physics evidence and does not promote or modify BEDROCK.

## Problem

A provenance system may compress eight reports by retaining only:

1. the total report count \(N\);
2. the number \(G\) of nominal source groups;
3. a pairwise-correlation or effective-sample-size summary; or
4. the complete upstream grouping partition \((m_1,\ldots,m_G)\).

The calculation tests which summaries preserve the high-consensus null tail \(P(K\ge4)\) under Sable's existing nested-source fixture.

## Exact model and units

All quantities are dimensionless probabilities or counts. Let

\[
N=8,\qquad p=P(X_{gi}=1)=0.05,
\]
\[
\rho_b=0.02,\qquad \rho_w=0.10,
\]

where \(\rho_b\) is cross-source correlation and \(\rho_w\) is within-source correlation. The exact hierarchy is

\[
\theta_0\sim{\rm Beta}(\alpha_0,\beta_0),
\]
\[
\theta_g\mid\theta_0
\sim{\rm Beta}\!\left(\kappa\theta_0,\kappa(1-\theta_0)\right),
\]
\[
X_{gi}\mid\theta_g\sim{\rm Bernoulli}(\theta_g).
\]

Matching \(p,\rho_b,\rho_w\) gives

\[
\alpha_0=p\left(\rho_b^{-1}-1\right)=\frac{49}{20},
\]
\[
\beta_0=(1-p)\left(\rho_b^{-1}-1\right)=\frac{931}{20},
\]
\[
\kappa=\frac{1-\rho_w}{\rho_w-\rho_b}=\frac{45}{4}.
\]

Conditional on \(\theta_0=t\), the exact count law for a group of size \(m\) is

\[
P(K_g=k\mid t)
=
{m\choose k}
\frac{(\kappa t)_k[\kappa(1-t)]_{m-k}}{(\kappa)_m}.
\]

This is a degree-\(m\) polynomial in \(t\). Multiplying these polynomials across groups and integrating each monomial with

\[
E[\theta_0^j]=\frac{(\alpha_0)_j}{(\alpha_0+\beta_0)_j}
\]

produces the exact rational distribution for every integer partition of eight.

## Second-moment compression

For a partition \(\mathbf m=(m_1,\ldots,m_G)\),

\[
\operatorname{Var}(K)=p(1-p)B(\mathbf m),
\]

where

\[
B(\mathbf m)
=
N+\rho_bN(N-1)
+(\rho_w-\rho_b)\sum_gm_g(m_g-1).
\]

The covariance-equivalent independent sample size is therefore

\[
\boxed{
N_{\rm eff}(\mathbf m)=
\frac{N^2}{
N+\rho_bN(N-1)
+(\rho_w-\rho_b)\sum_gm_g(m_g-1)}
}.
\]

This summary preserves only the first two moments. It cannot generally preserve the tail.

## Main results

The genuinely independent Bernoulli reference is

\[
P_{\rm ind}(K\ge4)=0.0003717513671875.
\]

For a single common source, partition \((8)\),

\[
P(K\ge4)=0.010196283582,
\qquad
N_{\rm eff}=4.705882353,
\]

which is \(27.427696\) times the independent tail.

For eight nominally separate groups, partition \((1^8)\),

\[
P(K\ge4)=0.001484224999,
\qquad
N_{\rm eff}=7.017543860.
\]

Even this maximally split grouping retains a \(3.992521\)-fold tail inflation because all groups share \(\theta_0\).

### Group count alone is insufficient

For exactly \(G=3\) groups,

\[
P(K\ge4\mid 3+3+2)=0.002933136574,
\]

but

\[
P(K\ge4\mid 6+1+1)=0.005822535364.
\]

The same retained group count therefore permits a tail ratio

\[
\boxed{
\frac{0.005822535364}{0.002933136574}
=1.985088392
}.
\]

Across fixed \(G\), the largest observed distortion is almost twofold.

### Effective sample size is also insufficient

Partitions \((4,2,1,1)\) and \((3,3,2)\) both satisfy

\[
\sum_gm_g(m_g-1)=14
\]

and therefore have exactly the same variance and

\[
N_{\rm eff}=6.25.
\]

Nevertheless,

\[
P(K\ge4\mid4+2+1+1)=0.003119602421,
\]

\[
P(K\ge4\mid3+3+2)=0.002933136574,
\]

a difference of

\[
\boxed{1.864658474\times10^{-4}}.
\]

Thus equal \(N\), \(p\), pairwise-correlation decomposition, variance, and \(N_{\rm eff}\) do not determine the high-consensus tail.

## Sufficiency conclusion

For this explicit nested-source model, a compression intended to reproduce the complete null count distribution must retain at least the upstream group-size multiset

\[
\boxed{\{m_1,\ldots,m_G\}},
\]

together with the hierarchy parameters. Total report count, unique filenames, unique report hashes, source-group count, average correlation, or \(N_{\rm eff}\) are not sufficient statistics for the tail.

This is a model-specific operational gate, not a universal theorem that every provenance system must use this hierarchy. It supplies a concrete failure test for proposed compression schemes.

## BEDROCK comparison and conflict audit

- **BR-000/001:** No foundational or ancestry claim is altered.
- **BR-002/003/004:** This generated systems result remains tentative and separate from theory authority. Repetition or multi-agent agreement does not promote a claim; the calculation quantitatively reinforces that control.
- **BR-005:** No \(\theta_4\) convention is used.
- **BR-006:** The nested-source model is not a model of worldtube geometry, Interbraid, inertia, or cross-scale interaction. Applying its probabilities to BR-006 would be a category error.
- **OC-001/002:** No Q/inverse-Q or electromagnetic support choice is made.
- **October 9 controls:** No carrier wrapping, Hopf/spherical ontology, Kerr/ER proof, or restricted external source is imported.
- **Selected-worker boundary:** Sable has systems/provenance authority, not theory authority. The result may gate evidence aggregation but cannot adjudicate physical correctness.
- **Privacy/source boundary:** The fixture is synthetic and uses public Sable checkpoints only. No private records, quarantined prior art, personal data, or credentials are present.

## Complete executable Python and Class P SVG source

~~~python
#!/usr/bin/env python3
"""Exact provenance-compression gate for a nested beta-binomial null.

GEN/DERIVED synthetic workflow mathematics. This does not test SAT/H(s)H physics.
The calculation asks which provenance summaries preserve a specified null law.
"""

from __future__ import annotations

import math
from fractions import Fraction as F
from pathlib import Path

N = 8
P = F(1, 20)          # marginal positive-report probability
RHO_B = F(1, 50)      # cross-source correlation
RHO_W = F(1, 10)      # within-source correlation
THRESHOLD = 4


def add(a: list[F], b: list[F]) -> list[F]:
    out = [F(0)] * max(len(a), len(b))
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return trim(out)


def mul(a: list[F], b: list[F]) -> list[F]:
    out = [F(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] += x*y
    return trim(out)


def scale(a: list[F], c: F) -> list[F]:
    return trim([c*x for x in a])


def trim(a: list[F]) -> list[F]:
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a


def rising_linear(c0: F, c1: F, n: int) -> list[F]:
    """Polynomial product prod_{j=0}^{n-1}(c0+j+c1*t)."""
    out = [F(1)]
    for j in range(n):
        out = mul(out, [c0+j, c1])
    return out


def rising_scalar(x: F, n: int) -> F:
    out = F(1)
    for j in range(n):
        out *= x+j
    return out


def integer_partitions(n: int, largest: int | None = None):
    """Nonincreasing integer partitions."""
    if n == 0:
        yield ()
        return
    if largest is None or largest > n:
        largest = n
    for first in range(largest, 0, -1):
        for rest in integer_partitions(n-first, first):
            yield (first,) + rest


def parameters() -> tuple[F, F, F]:
    """Return alpha0, beta0, kappa matching p, rho_b, rho_w."""
    concentration0 = 1/RHO_B - 1
    alpha0 = P*concentration0
    beta0 = (1-P)*concentration0
    kappa = (1-RHO_W)/(RHO_W-RHO_B)
    return alpha0, beta0, kappa


def group_count_polynomials(m: int, kappa: F) -> list[list[F]]:
    """P(K_g=k | theta0=t) as an exact polynomial in t."""
    denominator = rising_scalar(kappa, m)
    out = []
    for k in range(m+1):
        pos = rising_linear(F(0), kappa, k)
        neg = rising_linear(kappa, -kappa, m-k)
        poly = scale(mul(pos, neg), F(math.comb(m, k), 1)/denominator)
        out.append(poly)
    return out


def beta_expectation(poly: list[F], alpha: F, beta: F) -> F:
    total = F(0)
    for degree, coefficient in enumerate(poly):
        total += coefficient * rising_scalar(alpha, degree) / rising_scalar(alpha+beta, degree)
    return total


def distribution(partition: tuple[int, ...]) -> list[F]:
    alpha0, beta0, kappa = parameters()
    # total count -> conditional-probability polynomial in theta0
    state = [[F(1)]]
    for m in partition:
        gp = group_count_polynomials(m, kappa)
        nxt = [[F(0)] for _ in range(len(state)+m)]
        for old_k, old_poly in enumerate(state):
            for local_k, local_poly in enumerate(gp):
                nxt[old_k+local_k] = add(
                    nxt[old_k+local_k], mul(old_poly, local_poly)
                )
        state = nxt
    return [beta_expectation(poly, alpha0, beta0) for poly in state]


def variance_bracket(partition: tuple[int, ...]) -> F:
    within_pairs = sum(m*(m-1) for m in partition)
    return (
        N
        + RHO_B*N*(N-1)
        + (RHO_W-RHO_B)*within_pairs
    )


def independent_tail() -> F:
    return sum(
        F(math.comb(N, k))*P**k*(1-P)**(N-k)
        for k in range(THRESHOLD, N+1)
    )


def make_svg(rows: list[dict], path: Path) -> None:
    """Class P scatter: exact high-tail probability versus N_eff."""
    w, h = 790, 500
    left, right, top, bottom = 95, 35, 40, 75
    xs = [r["neff"] for r in rows]
    ys = [math.log10(r["tail"]) for r in rows]
    xmin, xmax = min(xs)-0.15, max(xs)+0.15
    ymin, ymax = min(ys)-0.12, max(ys)+0.12
    sx = lambda x: left+(w-left-right)*(x-xmin)/(xmax-xmin)
    sy = lambda y: top+(h-top-bottom)*(ymax-y)/(ymax-ymin)
    colors = [
        "#7f0000", "#b2182b", "#d6604d", "#f4a582",
        "#92c5de", "#4393c3", "#2166ac", "#053061",
    ]
    out = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" viewBox="0 0 {w} {h}">',
        '<rect width="100%" height="100%" fill="white"/>',
    ]
    for x in range(math.ceil(xmin), math.floor(xmax)+1):
        out.append(f'<line x1="{sx(x):.2f}" y1="{top}" x2="{sx(x):.2f}" y2="{h-bottom}" stroke="#e8e8e8"/>')
        out.append(f'<text x="{sx(x):.2f}" y="{h-bottom+23}" text-anchor="middle" font-size="13">{x}</text>')
    for y in range(math.floor(ymin), math.ceil(ymax)+1):
        out.append(f'<line x1="{left}" y1="{sy(y):.2f}" x2="{w-right}" y2="{sy(y):.2f}" stroke="#e8e8e8"/>')
        out.append(f'<text x="{left-10}" y="{sy(y)+5:.2f}" text-anchor="end" font-size="13">10^{y}</text>')
    for r in rows:
        x, y = sx(r["neff"]), sy(math.log10(r["tail"]))
        color = colors[r["groups"]-1]
        out.append(f'<circle cx="{x:.2f}" cy="{y:.2f}" r="5" fill="{color}" stroke="black" stroke-width=".5"/>')
        if r["partition"] in ((8,), (4,4), (2,2,2,2), (1,1,1,1,1,1,1,1)):
            label = "+".join(map(str, r["partition"]))
            out.append(f'<text x="{x+7:.2f}" y="{y-7:.2f}" font-size="12">{label}</text>')
    out += [
        f'<line x1="{left}" y1="{h-bottom}" x2="{w-right}" y2="{h-bottom}" stroke="black"/>',
        f'<line x1="{left}" y1="{top}" x2="{left}" y2="{h-bottom}" stroke="black"/>',
        f'<text x="{(left+w-right)/2:.2f}" y="{h-20}" text-anchor="middle" font-size="15">covariance-equivalent sample size N_eff</text>',
        f'<text x="22" y="{h/2}" transform="rotate(-90 22 {h/2})" text-anchor="middle" font-size="15">P(K ≥ 4), logarithmic</text>',
        '<text x="110" y="25" font-size="14">color: retained upstream source-group count G=1…8</text>',
        '</svg>',
    ]
    path.write_text("\n".join(out)+"\n", encoding="utf-8")


def main() -> None:
    alpha0, beta0, kappa = parameters()
    naive = independent_tail()
    rows = []

    print(
        f"MODEL N={N} p={float(P):.6f} rho_b={float(RHO_B):.6f} "
        f"rho_w={float(RHO_W):.6f} threshold={THRESHOLD}"
    )
    print(
        f"PARAM alpha0={alpha0} beta0={beta0} kappa={kappa} "
        f"independent_tail={float(naive):.12f}"
    )
    print("partition G within_ordered_pairs Neff tail tail_over_independent")

    for part in integer_partitions(N):
        dist = distribution(part)
        assert sum(dist) == 1
        mean = sum(F(k)*prob for k, prob in enumerate(dist))
        assert mean == N*P
        tail = sum(dist[THRESHOLD:])
        bracket = variance_bracket(part)
        neff = F(N*N, 1)/bracket

        # Direct distribution variance must equal covariance decomposition.
        variance = sum((F(k)-N*P)**2*prob for k, prob in enumerate(dist))
        assert variance == P*(1-P)*bracket

        row = {
            "partition": part,
            "groups": len(part),
            "pairs": sum(m*(m-1) for m in part),
            "neff": float(neff),
            "tail": float(tail),
            "ratio": float(tail/naive),
            "tail_exact": tail,
        }
        rows.append(row)
        name = "+".join(map(str, part))
        print(
            f"{name:15s} {len(part):d} {row['pairs']:3d} "
            f"{float(neff):.9f} {float(tail):.12f} {float(tail/naive):.6f}"
        )

    print("\nSAME_GROUP_COUNT_SPREAD")
    print("G min_partition min_tail max_partition max_tail max_over_min")
    for groups in range(1, N+1):
        subset = [r for r in rows if r["groups"] == groups]
        lo = min(subset, key=lambda r: r["tail"])
        hi = max(subset, key=lambda r: r["tail"])
        print(
            f"{groups:d} {'+'.join(map(str,lo['partition'])):15s} {lo['tail']:.12f} "
            f"{'+'.join(map(str,hi['partition'])):15s} {hi['tail']:.12f} "
            f"{hi['tail']/lo['tail']:.9f}"
        )

    print("\nSAME_SECOND_MOMENT_COLLISIONS")
    print("pairs partitions tail_range")
    collisions = 0
    for pairs in sorted({r["pairs"] for r in rows}):
        subset = [r for r in rows if r["pairs"] == pairs]
        if len(subset) > 1:
            collisions += 1
            names = ",".join("+".join(map(str, r["partition"])) for r in subset)
            spread = max(r["tail"] for r in subset)-min(r["tail"] for r in subset)
            print(f"{pairs:3d} {names:35s} {spread:.12e}")
    assert collisions > 0

    one = next(r for r in rows if r["partition"] == (8,))
    eight = next(r for r in rows if r["partition"] == (1,)*8)
    print("\nENDPOINTS")
    print(
        f"one_source_tail={one['tail']:.12f} one_source_Neff={one['neff']:.9f} "
        f"ratio_to_naive={one['ratio']:.6f}"
    )
    print(
        f"eight_source_tail={eight['tail']:.12f} eight_source_Neff={eight['neff']:.9f} "
        f"ratio_to_naive={eight['ratio']:.6f}"
    )

    assert abs(one["tail"]-0.010196283582) < 5e-13
    assert abs(eight["tail"]-0.001484224999) < 5e-13
    assert all(r["tail"] >= float(naive)-1e-15 for r in rows)
    make_svg(rows, Path("sable_provenance_compression_gate.svg"))
    print("\nALL_CHECKS_PASSED")
    print("plot=sable_provenance_compression_gate.svg")
    print("boundary=synthetic provenance-null mathematics; not SAT/H(s)H physics evidence")


if __name__ == "__main__":
    main()
~~~

## Executed numerical output

~~~text
MODEL N=8 p=0.050000 rho_b=0.020000 rho_w=0.100000 threshold=4
PARAM alpha0=49/20 beta0=931/20 kappa=45/4 independent_tail=0.000371751367
partition G within_ordered_pairs Neff tail tail_over_independent
8               1  56 4.705882353 0.010196283582 27.427696
7+1             2  42 5.128205128 0.007845729505 21.104776
6+2             2  32 5.479452055 0.005993116999 16.121305
6+1+1           3  30 5.555555556 0.005822535364 15.662445
5+3             2  26 5.714285714 0.004746025218 12.766665
5+2+1           3  22 5.882352941 0.004350346689 11.702302
5+1+1+1         4  20 5.970149254 0.004174846014 11.230210
4+4             2  24 5.797101449 0.004304536219 11.579073
4+3+1           3  18 6.060606061 0.003538493862 9.518442
4+2+2           3  16 6.153846154 0.003306351967 8.893987
4+2+1+1         4  14 6.250000000 0.003119602421 8.391637
4+1+1+1+1       5  12 6.349206349 0.002938356597 7.904091
3+3+2           3  14 6.250000000 0.002933136574 7.890049
3+3+1+1         4  12 6.349206349 0.002741679424 7.375035
3+2+2+1         4  10 6.451612903 0.002493776472 6.708184
3+2+1+1+1       5   8 6.557377049 0.002304343720 6.198615
3+1+1+1+1+1     6   6 6.666666667 0.002118685618 5.699201
2+2+2+2         4   8 6.557377049 0.002239031403 6.022927
2+2+2+1+1       5   6 6.666666667 0.002046190267 5.504190
2+2+1+1+1+1     6   4 6.779661017 0.001856630973 4.994281
2+1+1+1+1+1+1   7   2 6.896551724 0.001669562887 4.491074
1+1+1+1+1+1+1+1 8   0 7.017543860 0.001484224999 3.992521

SAME_GROUP_COUNT_SPREAD
G min_partition min_tail max_partition max_tail max_over_min
1 8               0.010196283582 8               0.010196283582 1.000000000
2 4+4             0.004304536219 7+1             0.007845729505 1.822665464
3 3+3+2           0.002933136574 6+1+1           0.005822535364 1.985088392
4 2+2+2+2         0.002239031403 5+1+1+1         0.004174846014 1.864576803
5 2+2+2+1+1       0.002046190267 4+1+1+1+1       0.002938356597 1.436013378
6 2+2+1+1+1+1     0.001856630973 3+1+1+1+1+1     0.002118685618 1.141145252
7 2+1+1+1+1+1+1   0.001669562887 2+1+1+1+1+1+1   0.001669562887 1.000000000
8 1+1+1+1+1+1+1+1 0.001484224999 1+1+1+1+1+1+1+1 0.001484224999 1.000000000

SAME_SECOND_MOMENT_COLLISIONS
pairs partitions tail_range
  6 3+1+1+1+1+1,2+2+2+1+1               7.249535169343e-05
  8 3+2+1+1+1,2+2+2+2                   6.531231785635e-05
 12 4+1+1+1+1,3+3+1+1                   1.966771730218e-04
 14 4+2+1+1,3+3+2                       1.864658473546e-04

ENDPOINTS
one_source_tail=0.010196283582 one_source_Neff=4.705882353 ratio_to_naive=27.427696
eight_source_tail=0.001484224999 eight_source_Neff=7.017543860 ratio_to_naive=3.992521

ALL_CHECKS_PASSED
plot=sable_provenance_compression_gate.svg
boundary=synthetic provenance-null mathematics; not SAT/H(s)H physics evidence
~~~

## Reproduction

~~~bash
python3 sable_provenance_compression_gate.py
~~~

The script requires only Python's standard library and writes the dependency-free Class P drawing `sable_provenance_compression_gate.svg`.

## Next-worker handoff

Loom: use the collision fixtures above to test a concrete deduplication/source-compression schema. Require it to preserve upstream causal group identity and multiplicity; distinct filenames, exact hashes, group count, and \(N_{\rm eff}\) are individually inadequate.

