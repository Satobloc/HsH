# Aster sandbox: exact 2t-moment theorem for t-sparse semantic edits

**Status:** executed `GEN/DERIVED` workflow mathematics. This generalizes Aster's four-moment/two-edit result. It concerns lossless checksums over stable labeled axes; it does not establish source truth, authorship, SAT/H(s)H physics, or the correctness of any semantic labeling scheme.

## Statement

Let \(d=(d_1,\ldots,d_n)\in\mathbb R^n\) be an arbitrary signed edit vector supported on at most \(t\) known, distinct axes. Define consecutive power moments

\[
s_k(d)=\sum_{i=1}^n i^k d_i,
\qquad k=0,1,\ldots,m-1.
\]

For \(n\ge 2t\), the minimum number of consecutive moments required for universal recovery of every such \(t\)-sparse edit is exactly

\[
\boxed{m_{\min}=2t}.
\]

The conclusion permits arbitrary real signed amplitudes. The lower-bound collision already exists using nonnegative integer amplitudes.

## Sufficiency of 2t moments

Suppose \(d\) and \(d'\) are each supported on at most \(t\) axes and

\[
s_k(d)=s_k(d'),\qquad k=0,\ldots,2t-1.
\]

Their difference \(v=d-d'\) has support size \(r\le 2t\). Write its distinct support axes as \(a_1,\ldots,a_r\) and its nonzero amplitudes as \(v_1,\ldots,v_r\). The first \(r\) zero-moment equations are

\[
\begin{pmatrix}
1&1&\cdots&1\\
a_1&a_2&\cdots&a_r\\
\vdots&\vdots&&\vdots\\
a_1^{r-1}&a_2^{r-1}&\cdots&a_r^{r-1}
\end{pmatrix}
\begin{pmatrix}v_1\\v_2\\\vdots\\v_r\end{pmatrix}=0.
\]

The determinant is the Vandermonde product

\[
\det V=\prod_{1\le i<j\le r}(a_j-a_i)\ne0,
\]

because the axes are distinct. Hence \(v=0\), so \(d=d'\). Therefore \(2t\) moments suffice.

## Necessity: an explicit collision for 2t-1 moments

Put \(M=2t\) and use axes \(j=1,\ldots,M\). Define alternating binomial weights

\[
w_j=(-1)^{M-j}\binom{M-1}{j-1}.
\]

These are the order-\((M-1)\) finite-difference coefficients, so

\[
\sum_{j=1}^{M}w_jj^k=0,
\qquad 0\le k\le M-2,
\]

while

\[
\sum_{j=1}^{M}w_jj^{M-1}=(M-1)!.
\]

Because \(M\) is even, exactly \(t\) weights are positive and \(t\) are negative. Split

\[
x_j=\max(w_j,0),\qquad y_j=\max(-w_j,0).
\]

Both \(x\) and \(y\) are legal nonnegative \(t\)-sparse edits, and

\[
s_k(x)=s_k(y),\qquad k=0,\ldots,2t-2.
\]

Thus no checksum containing only \(2t-1\) consecutive moments can guarantee universal recovery. Their next moments differ by \((2t-1)!\), completing the necessity proof.

For \(t=3\),

\[
w=(-1,5,-10,10,-5,1),
\]

so the legal three-edit vectors

\[
x=(0,5,0,10,0,1),\qquad
y=(1,0,10,0,5,0)
\]

share

\[
(s_0,s_1,s_2,s_3,s_4)=(16,56,216,896,3936),
\]

but

\[
s_5(x)=18176,\qquad s_5(y)=18056.
\]

Hence six moments—not five—are minimally sufficient for universal three-edit recovery.

## Edit-budget boundary

The theorem is conditional on the declared support bound. With \(t=3\), six moments can collide once a four-edit vector is admitted. The seven-node finite-difference weights split into

\[
(1,0,15,0,15,0,1)
\]

and

\[
(0,6,0,20,0,6,0),
\]

which have support sizes four and three but identical moments \(s_0,\ldots,s_5\). A deployed token therefore requires an explicit edit-budget declaration and a full-state fallback when the budget is exceeded.

## Executed exact-arithmetic output

```text
2t-moment sparse-edit minimality: exact integer controls
t support_each collision_degree_range separating_moment difference
1            1 0..0                  1 +1
2            2 0..2                  3 +6
3            3 0..4                  5 +120
4            4 0..6                  7 +5040
5            5 0..8                  9 +362880
6            6 0..10                11 +39916800
7            7 0..12                13 +6227020800
8            8 0..14                15 +1307674368000
t3_weights=(-1, 5, -10, 10, -5, 1)
t3_x=(0, 5, 0, 10, 0, 1) t3_y=(1, 0, 10, 0, 5, 0)
t3_first5=(16, 56, 216, 896, 3936)
t3_sixth_x=18176 t3_sixth_y=18056
vandermonde_submatrices_checked=246 max_size=6 axes=1..8
budget_violation_4v3_left=(1, 0, 15, 0, 15, 0, 1) right=(0, 6, 0, 20, 0, 6, 0)
budget_violation_shared6=(32, 128, 560, 2624, 12992, 67328)
ALL_CHECKS_PASSED
```

The program checked the constructive collision identities for \(t=1,\ldots,8\), including the exact factorial separation at the next moment. It also checked all 246 Vandermonde submatrices of sizes one through six drawn from axes 1 through 8 against their exact product-of-differences determinants. No floating-point arithmetic or randomness was used.

## Full executable Python 3 source

```python
#!/usr/bin/env python3
"""Exact tests for the 2t-moment sparse-edit checksum theorem.

GEN/DERIVED workflow mathematics.  Integer arithmetic only; no randomness.
"""

from __future__ import annotations

from itertools import combinations
from math import comb, factorial


def moments(v: tuple[int, ...], count: int) -> tuple[int, ...]:
    """Power moments sum_i (i+1)^k v_i for k=0,...,count-1."""
    return tuple(sum((i + 1) ** k * value for i, value in enumerate(v))
                 for k in range(count))


def finite_difference_weights(m: int) -> tuple[int, ...]:
    """Weights annihilating every polynomial of degree below m-1."""
    return tuple((-1) ** (m - j) * comb(m - 1, j - 1)
                 for j in range(1, m + 1))


def split_collision(weights: tuple[int, ...]) -> tuple[tuple[int, ...], tuple[int, ...]]:
    """Split an alternating null vector into two nonnegative sparse vectors."""
    left = tuple(max(w, 0) for w in weights)
    right = tuple(max(-w, 0) for w in weights)
    return left, right


def bareiss_det(a: list[list[int]]) -> int:
    """Fraction-free exact determinant."""
    n = len(a)
    if n == 0:
        return 1
    b = [row[:] for row in a]
    sign = 1
    prev = 1
    for k in range(n - 1):
        pivot = next((r for r in range(k, n) if b[r][k] != 0), None)
        if pivot is None:
            return 0
        if pivot != k:
            b[k], b[pivot] = b[pivot], b[k]
            sign *= -1
        p = b[k][k]
        for i in range(k + 1, n):
            for j in range(k + 1, n):
                b[i][j] = (b[i][j] * p - b[i][k] * b[k][j]) // prev
        prev = p
        for i in range(k + 1, n):
            b[i][k] = 0
    return sign * b[-1][-1]


def run() -> None:
    print("2t-moment sparse-edit minimality: exact integer controls")
    print("t support_each collision_degree_range separating_moment difference")
    for t in range(1, 9):
        m = 2 * t
        weights = finite_difference_weights(m)
        left, right = split_collision(weights)
        assert sum(x != 0 for x in left) == t
        assert sum(x != 0 for x in right) == t
        assert moments(left, m - 1) == moments(right, m - 1)
        difference = moments(left, m)[-1] - moments(right, m)[-1]
        assert abs(difference) == factorial(m - 1)
        print(f"{t:1d} {t:12d} 0..{m-2:<2d} {m-1:17d} {difference:+d}")

    t = 3
    w6 = finite_difference_weights(2 * t)
    x, y = split_collision(w6)
    print(f"t3_weights={w6}")
    print(f"t3_x={x} t3_y={y}")
    print(f"t3_first5={moments(x, 5)}")
    print(f"t3_sixth_x={moments(x, 6)[-1]} t3_sixth_y={moments(y, 6)[-1]}")

    checked = 0
    for size in range(1, 7):
        for axes in combinations(range(1, 9), size):
            matrix = [[axis ** k for axis in axes] for k in range(size)]
            det = bareiss_det(matrix)
            expected = 1
            for i in range(size):
                for j in range(i + 1, size):
                    expected *= axes[j] - axes[i]
            assert det == expected
            checked += 1
    print(f"vandermonde_submatrices_checked={checked} max_size=6 axes=1..8")

    w7 = finite_difference_weights(7)
    over, within = split_collision(w7)
    assert sum(x != 0 for x in over) == 4
    assert sum(x != 0 for x in within) == 3
    assert moments(over, 6) == moments(within, 6)
    print(f"budget_violation_4v3_left={over} right={within}")
    print(f"budget_violation_shared6={moments(over, 6)}")
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    run()
```

## Bounded conclusion

For stable labeled axes and arbitrary signed amplitudes, \(2t\) consecutive power moments are an exact minimal checksum for a declared \(t\)-edit budget. This is an injectivity theorem, not an error-correction guarantee under noisy moments, axis relabeling, integer overflow, adversarial hash substitution, or support-budget violation. Those conditions need separate controls.
