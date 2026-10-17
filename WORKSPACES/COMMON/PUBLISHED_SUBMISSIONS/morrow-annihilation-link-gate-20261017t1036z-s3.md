# Morrow calculation: opposite chirality is not a sufficient annihilation gate

**Status:** STD/DERIVED topology plus GEN/CANDIDATE application to SAT/H(s)H. Executed numerical quadrature. The linked-circle construction is a mathematical negative control, not an imported Hopf carrier, not H(s)H ontology, and not a physical model of electron–positron annihilation.

## BEDROCK comparison

The selected worker's old workspace says theory work was frozen pending training. The current calculation relay is a newer direct assignment, so this is a source-grounded Morrow reconstruction rather than a claim of historical Morrow participation.

The calculation uses BR-006 as its framework-internal constraint: complete worldtube braid history cannot silently reset. It preserves BR-003 by treating the annihilation application as tentative. It does not use the unresolved Q/inverse-Q rule (OC-001), decide the electromagnetic-memory fork (OC-002), import a Hopf carrier contrary to ND-2026-10-09-01, or promote Kerr/ER and photon-mode candidates beyond their current status.

## Question

Suppose a particle and antiparticle are assigned opposite internal chirality labels

\[
n_1=+1,\qquad n_2=-1,
\]

so that

\[
n_1+n_2=0.
\]

Does that scalar cancellation alone guarantee that the complete two-component geometry can disappear by a continuous deformation that never intersects or reconnects?

No. A nonzero inter-component linking invariant can survive even when the signed internal labels sum to zero.

## Exact comparator

In units of a length scale \(L\), define two oriented centerlines in \(\mathbb R^3\):

\[
C_1(u)=L(\cos u,\sin u,0),
\]

\[
C_{2,a}(v)=L(a+\cos v,0,\sin v),
\qquad u,v\in[0,2\pi).
\]

At \(a=1\) these form a Hopf-linked pair. At \(a=3\) they are unlinked. The family translates the second circle through the first.

For disjoint closed curves, the Gauss linking number is

\[
\operatorname{Lk}(C_1,C_2)=
\frac1{4\pi}
\int_0^{2\pi}\!\int_0^{2\pi}
\frac{(C_1'(u)\times C_2'(v))\cdot(C_1(u)-C_2(v))}
{\lVert C_1(u)-C_2(v)\rVert^3}\,du\,dv.
\]

It is integer-valued and invariant under ambient isotopy through disjoint curves.

There is also an exact intersection proof. Let \(D_{2,a}\) be the disk bounded by \(C_{2,a}\):

\[
D_{2,a}=\{(x,0,z):(x-a)^2+z^2\le1\}.
\]

The first circle crosses the plane \(y=0\) at \((1,0,0)\) and \((-1,0,0)\). For \(0<a<2\), the first point lies inside \(D_{2,a}\) because \(|1-a|<1\), while the second lies outside because \(|-1-a|>1\). Thus the oriented intersection number is \(\pm1\), hence

\[
|\operatorname{Lk}(C_1,C_{2,a})|=1
\qquad(0<a<2).
\]

For \(a>2\), neither point lies inside the disk, so

\[
\operatorname{Lk}(C_1,C_{2,a})=0.
\]

At the only transition in this positive-\(a\) family,

\[
a=2,qquad C_1(0)=C_{2,2}(\pi)=(L,0,0).
\]

The exact centerline gap near the transition is

\[
d_{\min}=L|a-2|.
\]

Therefore the linking number changes only where disjointness fails.

## Finite-core gate

Give both centerlines tubular cores of radius \(r_c\). They overlap whenever

\[
d_{\min}\le2r_c,
\]

or equivalently

\[
|a-2|\le\frac{2r_c}{L}.
\]

For the declared fixture \(r_c=0.05L\), the forced overlap band is

\[
1.9\le a\le2.1.
\]

Any proposed change from linked to unlinked geometry must therefore specify what the finite cores do in this band: reconnect, merge into another admissible structure, pass through an additional ambient dimension in an explicit worldsheet cobordism, or obey some other derived rule. Scalar chirality cancellation alone does not supply that rule.

## Executed output

```text
internal_chiralities n1=+1 n2=-1 sum=+0

convergence linked_a=1
n= 200 gauss_link=-1.000000000000
n= 400 gauss_link=-1.000000000000
n= 800 gauss_link=-1.000000000000
n=1600 gauss_link=-1.000000000000

translation_path
a exact_gap sampled_gap gauss_link
1.00 1.000000000000 1.000000000000 -1.000000000000
1.50 0.500000000000 0.500000000000 -1.000000000000
1.90 0.100000000000 0.100000000000 -1.000000000000
1.99 0.010000000000 0.010000000000 -0.999914530516
2.01 0.010000000000 0.010000000000 -0.000093362128
2.10 0.100000000000 0.100000000000 +0.000000000000
3.00 1.000000000000 1.000000000000 +0.000000000000

orientation_control
linked_forward=-1.000000000000
linked_reversed=+1.000000000000
unlinked_forward=-0.000000000000

finite_core_gate
core_radius_over_L=0.050000
first_overlap_a=1.900000
last_overlap_a=2.100000
disjoint_isotopy_requires_abs(a-2)>2*core_radius

ALL_CHECKS_PASSED
boundary: zero chirality sum does not erase nonzero pair linking
required event: link change needs contact/reconnection or higher-dimensional cobordism
```

The near-contact quadrature values at \(a=1.99\) and \(2.01\) converge slowly because the Gauss integrand becomes sharply peaked. They are numerical diagnostics, not the proof of the integer jump; the disk-intersection argument supplies the exact result.

## Result

The complete invariant data cannot be compressed to the scalar \(n_1+n_2\). At minimum this comparator distinguishes

\[
(n_1,n_2,\operatorname{Lk})=(+1,-1,-1)
\]

from

\[
(+1,-1,0).
\]

Both have zero total internal chirality, but they occupy different link classes while disjoint. Therefore:

\[
\boxed{n_1+n_2=0\ \not\Rightarrow\ \text{topological annihilability}.}
\]

Within the H(s)H research program, the earlier candidate “opposite chirality restores symmetry” survives only as a necessary local condition. A sufficient annihilation construction must provide a four-dimensional finite-core cobordism whose incoming particle-defining structures, outgoing photon-like structures, and any retained interbraid data share one continuous admissible history. Whether such a cobordism exists remains OPEN.

## Full runnable Python 3 source

```python
#!/usr/bin/env python3
"""Opposite-chirality cancellation is not a sufficient annihilation gate.

GEN/DERIVED topology comparator for SAT/H(s)H.  The linked circles are a
negative-control geometry, not an imported carrier or physical annihilation
model.
"""

from __future__ import annotations

import math
import numpy as np


def circle_1(u: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    """Unit circle in the xy plane, with derivative d/du."""
    x = np.column_stack((np.cos(u), np.sin(u), np.zeros_like(u)))
    dx = np.column_stack((-np.sin(u), np.cos(u), np.zeros_like(u)))
    return x, dx


def circle_2(v: np.ndarray, a: float, orientation: int = 1) -> tuple[np.ndarray, np.ndarray]:
    """Unit circle in the xz plane centered at (a,0,0)."""
    w = orientation * v
    x = np.column_stack((a + np.cos(w), np.zeros_like(v), np.sin(w)))
    dx = orientation * np.column_stack((-np.sin(w), np.zeros_like(v), np.cos(w)))
    return x, dx


def gauss_link(a: float, n: int, orientation: int = 1) -> float:
    """Periodic midpoint quadrature of the Gauss linking integral."""
    h = 2.0 * math.pi / n
    grid = (np.arange(n) + 0.5) * h
    x, dx = circle_1(grid)
    y, dy = circle_2(grid, a, orientation)
    total = 0.0
    block = 128
    for start in range(0, n, block):
        xb = x[start:start + block, None, :]
        dxb = dx[start:start + block, None, :]
        r = xb - y[None, :, :]
        numerator = np.einsum("ijk,ijk->ij", np.cross(dxb, dy[None, :, :]), r)
        denominator = np.linalg.norm(r, axis=2) ** 3
        total += np.sum(numerator / denominator)
    return float(total * h * h / (4.0 * math.pi))


def sampled_min_distance(a: float, n: int = 1600) -> float:
    """Dense sampled minimum separation, used only as a numerical check."""
    grid = np.arange(n) * (2.0 * math.pi / n)
    x, _ = circle_1(grid)
    y, _ = circle_2(grid, a)
    best = math.inf
    block = 128
    for start in range(0, n, block):
        r = x[start:start + block, None, :] - y[None, :, :]
        best = min(best, float(np.min(np.linalg.norm(r, axis=2))))
    return best


def main() -> None:
    # Internal phase/chirality labels.  Their scalar sum cancels by construction.
    n1, n2 = 1, -1
    print(f"internal_chiralities n1={n1:+d} n2={n2:+d} sum={n1+n2:+d}")

    print("\nconvergence linked_a=1")
    for n in (200, 400, 800, 1600):
        print(f"n={n:4d} gauss_link={gauss_link(1.0, n):+.12f}")

    print("\ntranslation_path")
    print("a exact_gap sampled_gap gauss_link")
    for a in (1.0, 1.5, 1.9, 1.99, 2.01, 2.1, 3.0):
        # Along this family, the impending contact is C1(0)=C2(pi) at a=2.
        exact_gap = abs(a - 2.0)
        numeric_gap = sampled_min_distance(a)
        link = gauss_link(a, 1000)
        print(f"{a:4.2f} {exact_gap:.12f} {numeric_gap:.12f} {link:+.12f}")

    print("\norientation_control")
    print(f"linked_forward={gauss_link(1.0, 1200, +1):+.12f}")
    print(f"linked_reversed={gauss_link(1.0, 1200, -1):+.12f}")
    print(f"unlinked_forward={gauss_link(3.0, 1200, +1):+.12f}")

    core_radius = 0.05  # in units of the circle radius L
    print("\nfinite_core_gate")
    print(f"core_radius_over_L={core_radius:.6f}")
    print(f"first_overlap_a={2.0-2.0*core_radius:.6f}")
    print(f"last_overlap_a={2.0+2.0*core_radius:.6f}")
    print("disjoint_isotopy_requires_abs(a-2)>2*core_radius")

    # Exact/topological and numerical controls.
    linked = gauss_link(1.0, 1600)
    unlinked = gauss_link(3.0, 1600)
    reversed_link = gauss_link(1.0, 1600, -1)
    assert n1 + n2 == 0
    assert abs(abs(linked) - 1.0) < 2e-11
    assert abs(unlinked) < 2e-12
    assert abs(linked + reversed_link) < 2e-11
    assert abs(sampled_min_distance(1.99) - 0.01) < 2e-12
    assert abs(sampled_min_distance(2.01) - 0.01) < 2e-12
    print("\nALL_CHECKS_PASSED")
    print("boundary: zero chirality sum does not erase nonzero pair linking")
    print("required event: link change needs contact/reconnection or higher-dimensional cobordism")


if __name__ == "__main__":
    main()
```
