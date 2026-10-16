# Loom sparse semantic checksum gate

Status: **GEN/DERIVED workflow mathematics; executed**. This is a calculation about compact change records. It is not SAT/H(s)H theory authority, an ontological claim, or evidence that any source is correct.

## Problem and assumptions

Let a baseline control record be an integer vector

\[
x=(x_1,\ldots,x_n),\qquad x_i\in\{0,\ldots,L\},
\]

and let a later record be \(y\). Define the signed semantic edit

\[
d_i=y_i-x_i.
\]

Axis labels \(i=1,\ldots,n\) and the baseline are assumed known. Values and labels are dimensionless. Store four integer moment checksums

\[
s_k=\sum_{i=1}^n i^k d_i,\qquad k=0,1,2,3.
\]

The promise is that at most two axes changed. This is a sparse-change token, not a lossless encoding of arbitrary records.

## Exact recovery theorem

For one edit of amplitude \(a\ne0\) at axis \(i\),

\[
s_k=a i^k.
\]

Hence

\[
a=s_0,\qquad i=\frac{s_1}{s_0},
\]

with \(s_2=s_0i^2\) and \(s_3=s_0i^3\) as exact consistency checks.

For two edits \(a,b\ne0\) at distinct axes \(i,j\),

\[
s_k=a i^k+b j^k.
\]

Let \(e_1=i+j\) and \(e_2=ij\). Because each node obeys \(z^2-e_1z+e_2=0\), the moments obey

\[
s_{k+2}=e_1s_{k+1}-e_2s_k.
\]

The first two recurrences give

\[
\begin{bmatrix}s_1&-s_0\\s_2&-s_1\end{bmatrix}
\begin{bmatrix}e_1\\e_2\end{bmatrix}
=
\begin{bmatrix}s_2\\s_3\end{bmatrix}.
\]

Its determinant is

\[
D=s_0s_2-s_1^2=ab(i-j)^2\ne0.
\]

Therefore \(e_1,e_2\) are unique. The integer roots of

\[
z^2-e_1z+e_2=0
\]

recover \(i,j\), after which

\[
a+b=s_0,\qquad ia+jb=s_1
\]

uniquely recover the signed strengths. This remains valid when edits cancel in the zeroth moment. For example,

\[
d=(0,3,0,-3,0)
\]

has \(s_0=0\), but its full token is

\[
(s_0,s_1,s_2,s_3)=(0,-6,-36,-168),
\]

which decodes exactly.

## Sharp negative control

The fourth finite-difference stencil

\[
v=(1,-4,6,-4,1)
\]

annihilates every polynomial of degree below four, so

\[
\sum_{i=1}^5 i^k v_i=0,\qquad k=0,1,2,3.
\]

Thus the distinct legal level vectors

\[
x=(0,4,0,4,0),\qquad y=(1,0,6,0,1)
\]

have exactly the same four stored moments. Four checksums are sufficient under the two-edit promise but are not a general provenance encoding.

## Storage and validation fixture

For \(n=5\), \(L=6\),

\[
|s_k|\le L\sum_{i=1}^5 i^k=(30,90,330,1350).
\]

Unrestricted signed storage therefore needs respectively \((6,8,10,12)\) bits, or 36 bits total. A decoded edit must still be applied to the known baseline and checked against \(0\le y_i\le L\); syndrome consistency alone does not make the resulting state legal.

## Executed output

The program used exact `Fraction` arithmetic and exhaustively decoded all 60 one-axis and 1,440 two-axis signed patterns with nonzero amplitudes in \([-6,6]\).

```text
EXACT SPARSE SEMANTIC CHECKSUM GATE
n=5 levels=0..6 signed_edit_amplitudes=-6..6
tested_nonzero_patterns=1500 class_counts={0: 1, 1: 60, 2: 1440} status=PASS
mixed_sign_delta=(0, 3, 0, -3, 0)
mixed_sign_syndrome=(0, -6, -36, -168) recovered=(0, 3, 0, -3, 0)
collision_x=(0, 4, 0, 4, 0) collision_y=(1, 0, 6, 0, 1)
collision_delta=(1, -4, 6, -4, 1) collision_syndrome=(0, 0, 0, 0)
legal_state=(1, 3, 2, 4, 0) legal=True
illegal_state=(1, 7, 2, 3, 0) legal=False
moment_abs_bounds=[30, 90, 330, 1350] unrestricted_storage_bits=[6, 8, 10, 12] total_bits=36
controls=PASS zero_edit mixed_sign boundary_rejection finite_difference_collision
```

## Full executed Python

```python
#!/usr/bin/env python3
"""Loom sandbox: exact sparse semantic-edit recovery from four moments.

Let a baseline control vector x and a later vector y have n integer-valued
semantic axes.  Write d_i=y_i-x_i and store four signed syndromes

    s_k = sum_{i=1}^n i^k d_i,  k=0,1,2,3.

Over exact rational arithmetic these four moments recover every change having
at most two nonzero coordinates.  A five-coordinate finite-difference vector
is an exact zero-syndrome collision, proving that the same token is not a
general lossless encoding.

This is GEN/DERIVED workflow mathematics.  It says nothing about SAT/H(s)H
ontology or the truth of the underlying controls.
"""

from fractions import Fraction
from itertools import combinations, product
from math import isqrt


def moments(delta):
    """Return exact integer moments s_0,...,s_3 for 1-based axis labels."""
    return tuple(sum((i ** k) * value for i, value in enumerate(delta, 1))
                 for k in range(4))


def decode_two_sparse(syndrome, n):
    """Recover an integer delta vector promised to have Hamming weight <= 2."""
    s0, s1, s2, s3 = map(Fraction, syndrome)
    zero = (0,) * n
    if (s0, s1, s2, s3) == (0, 0, 0, 0):
        return zero

    determinant = s0 * s2 - s1 * s1
    if determinant == 0:
        if s0 == 0:
            raise ValueError("not a nonzero <=2-sparse syndrome")
        node = s1 / s0
        if node.denominator != 1 or not 1 <= node <= n:
            raise ValueError("single-edit node is not an axis")
        if s2 != s0 * node**2 or s3 != s0 * node**3:
            raise ValueError("moments are inconsistent with one edit")
        out = [0] * n
        out[int(node) - 1] = int(s0)
        return tuple(out)

    # For two edits at nodes i,j, the moments obey
    # s_{k+2}=(i+j)s_{k+1}-(ij)s_k.  Solve for e1=i+j,e2=ij.
    e1 = (s0 * s3 - s1 * s2) / determinant
    e2 = (s1 * s3 - s2 * s2) / determinant
    if e1.denominator != 1 or e2.denominator != 1:
        raise ValueError("recovered node polynomial is not integral")
    e1, e2 = int(e1), int(e2)
    discriminant = e1 * e1 - 4 * e2
    root = isqrt(discriminant) if discriminant >= 0 else -1
    if root < 0 or root * root != discriminant:
        raise ValueError("node polynomial has no integer roots")
    if (e1 - root) % 2:
        raise ValueError("node roots are half-integral")
    i, j = (e1 - root) // 2, (e1 + root) // 2
    if not (1 <= i < j <= n):
        raise ValueError("recovered nodes are not distinct valid axes")

    # a+b=s0, ia+jb=s1.
    a = (j * s0 - s1) / (j - i)
    b = (s1 - i * s0) / (j - i)
    if a.denominator != 1 or b.denominator != 1 or a == 0 or b == 0:
        raise ValueError("recovered amplitudes are not nonzero integers")
    out = [0] * n
    out[i - 1], out[j - 1] = int(a), int(b)
    if moments(out) != tuple(map(int, syndrome)):
        raise AssertionError("decoder failed its moment readback")
    return tuple(out)


def add(x, delta):
    return tuple(a + b for a, b in zip(x, delta))


def main():
    n = 5
    max_level = 6
    amplitudes = tuple(i for i in range(-max_level, max_level + 1) if i)

    # Exhaust all promised one- and two-axis signed edit patterns.
    tested = 0
    class_counts = {0: 1, 1: 0, 2: 0}
    assert decode_two_sparse((0, 0, 0, 0), n) == (0,) * n
    for weight in (1, 2):
        for axes in combinations(range(n), weight):
            for values in product(amplitudes, repeat=weight):
                delta = [0] * n
                for axis, value in zip(axes, values):
                    delta[axis] = value
                recovered = decode_two_sparse(moments(delta), n)
                assert recovered == tuple(delta)
                tested += 1
                class_counts[weight] += 1

    # A mixed-sign fixture checks the cancellation-sensitive case s0=0.
    fixture_delta = (0, 3, 0, -3, 0)
    fixture_syndrome = moments(fixture_delta)
    fixture_recovered = decode_two_sparse(fixture_syndrome, n)

    # Exact collision beyond the two-edit promise.  This is the fourth finite
    # difference stencil: it annihilates every polynomial of degree < 4.
    x = (0, 4, 0, 4, 0)
    y = (1, 0, 6, 0, 1)
    collision_delta = tuple(b - a for a, b in zip(x, y))
    assert collision_delta == (1, -4, 6, -4, 1)
    assert moments(collision_delta) == (0, 0, 0, 0)
    assert moments(x) == moments(y)

    # Boundary checks: decoded edits can be validated against the declared
    # level alphabet; a correct syndrome does not by itself make a state legal.
    baseline = (1, 5, 2, 3, 0)
    legal_delta = (0, -2, 0, 1, 0)
    illegal_delta = (0, 2, 0, 0, 0)
    legal_state = add(baseline, decode_two_sparse(moments(legal_delta), n))
    illegal_state = add(baseline, decode_two_sparse(moments(illegal_delta), n))
    legal_ok = all(0 <= value <= max_level for value in legal_state)
    illegal_ok = all(0 <= value <= max_level for value in illegal_state)
    assert legal_ok and not illegal_ok

    # Exact bit lower bounds for storing unrestricted moment ranges.
    # |s_k| <= max_level * sum_i i^k, so signed range needs
    # ceil(log2(2B_k+1)) bits.  Use integer bit_length exactly.
    bounds = [max_level * sum(i**k for i in range(1, n + 1)) for k in range(4)]
    bits = [(2 * bound).bit_length() for bound in bounds]

    print("EXACT SPARSE SEMANTIC CHECKSUM GATE")
    print(f"n={n} levels=0..{max_level} signed_edit_amplitudes={amplitudes[0]}..{amplitudes[-1]}")
    print(f"tested_nonzero_patterns={tested} class_counts={class_counts} status=PASS")
    print(f"mixed_sign_delta={fixture_delta}")
    print(f"mixed_sign_syndrome={fixture_syndrome} recovered={fixture_recovered}")
    print(f"collision_x={x} collision_y={y}")
    print(f"collision_delta={collision_delta} collision_syndrome={moments(collision_delta)}")
    print(f"legal_state={legal_state} legal={legal_ok}")
    print(f"illegal_state={illegal_state} legal={illegal_ok}")
    print(f"moment_abs_bounds={bounds} unrestricted_storage_bits={bits} total_bits={sum(bits)}")
    print("controls=PASS zero_edit mixed_sign boundary_rejection finite_difference_collision")


if __name__ == "__main__":
    main()
```

## Bounded conclusion

With a known baseline and stable axis labels, four integer moments preserve both axis identity and signed edit strength for every change touching at most two axes. The sparsity promise is essential: a five-axis legal collision is invisible to the same token. Therefore a compact relay token using these checksums must carry its declared edit budget and must retain a full-state fallback for larger changes.
