# Alberr calculation: exact finite-core clearance for a 4D unlinking comparator

**Status:** GEN/DERIVED mathematical geometry; executed Python and dense-grid checks. This is not a promoted H(s)H result, not a physical annihilation model, and not evidence that an extra Euclidean bypass coordinate exists.

## Continuity and BEDROCK comparison

Alberr's latest checkpoint solved a nonlocal reach-branch switch for a torus curve and explicitly separated reach geometry from SAT/H(s)H physical claims. This calculation keeps that method: exact centerline separation, tube reach, limiting cases, and numerical controls.

The comparator is compatible with BR-006 only in the limited sense that it supplies one continuous, nonintersecting geometric history rather than erasing braid history. It does **not** supply the interaction mechanism, outgoing photon-like geometry, energy accounting, spin accounting, or an OC-001/OC-002 decision. The circles are test geometry, not imported Hopf carriers or H(s)H ontology. Identifying the auxiliary coordinate below with a physical H(s)H direction would be unsupported; identifying it with `theta4` would specifically conflict with BR-005, where `theta4` is a scalar tilt derived from the FIE time normal, not a freely translatable Cartesian coordinate. Hence the result remains tentative GEN/DERIVED geometry under BR-003 and does not amend BEDROCK.

## Exact construction

Let `L>0`. In Euclidean `R^4` define

\[
C_1(u)=L(\cos u,\sin u,0,0),
\]

\[
C_{2,a,h}(v)=L(a+\cos v,0,\sin v,h),
\qquad u,v\in[0,2\pi).
\]

At `(a,h)=(1,0)`, the three-dimensional projection is the linked pair used in the preceding Morrow negative control. At `(3,0)` it is unlinked. We seek the exact centerline clearance during a lift-translate-lower path.

Put `x=cos u` and `y=cos v`. The squared distance is

\[
\frac{d^2}{L^2}
=(x-a-y)^2+(1-x^2)+(1-y^2)+h^2
=a^2+2+h^2-2xy-2ax+2ay.
\]

For `a>=1`, the coefficient of `x` is `-2(a+y)<=0`, so the minimum over `x in [-1,1]` occurs at `x=1`. Substitution gives

\[
\frac{d^2}{L^2}=a^2-2a+2+h^2+2(a-1)y.
\]

The coefficient of `y` is nonnegative, so the minimum occurs at `y=-1`. Therefore

\[
\boxed{\delta(a,h)=\min_{u,v}\|C_1(u)-C_{2,a,h}(v)\|
=L\sqrt{(a-2)^2+h^2}.}
\]

Equality is attained at `u=0, v=pi`. This extends the preceding three-dimensional result `delta(a,0)=L|a-2|`.

Define `q(t)=3t^2-2t^3`, whose endpoint derivatives vanish, and let `s in [0,1]`:

\[
(a(s),h(s))=
\begin{cases}
(1,Hq(3s)),&0\le s\le1/3,\\
(1+2q(3s-1),H),&1/3<s\le2/3,\\
(3,H[1-q(3s-2)]),&2/3<s\le1.
\end{cases}
\]

This path is `C^1`. On the first and third legs, `|a-2|=1`, hence `delta>=L`. On the middle leg,

\[
\delta=L\sqrt{(a-2)^2+H^2}\ge LH,
\]

with equality at `a=2`. Thus, for `0<=H<=1`,

\[
\boxed{\min_s\delta(s)=LH.}
\]

Each component circle has reach `L`. For their disjoint union at a fixed `s`, the mutual medial-axis obstruction is half their separation, so

\[
\operatorname{reach}(C_1\cup C_2)=\min\{L,\delta(s)/2\},
\]

and the minimum union reach along the path is `L min(1,H/2)`. Equal-radius closed cores of radius `r_c` are strictly disjoint only if

\[
\delta(s)>2r_c\quad\text{for all }s,
\]

which here is exactly

\[
\boxed{H>2r_c/L.}
\]

For `r_c=0.05L` and `H=0.20`, the minimum centerline clearance is `0.20L`, minimum union reach is `0.10L`, and minimum surface-to-surface gap is `0.10L`. The no-lift control `H=0` collides at `a=2`; the boundary control `H=0.10=2r_c/L` makes the closed cores tangent and therefore is not strictly disjoint.

## Executed output

```text
4D_FINITE_CORE_CLEARANCE (L=1)
core_radius rc/L=0.050000000000; required centerline gap > 0.100000000000
H/L exact_min sampled_mid_min surface_gap s_at_min
0.0 0.000000000000 0.000000000000 -0.100000000000 0.500000000000
0.1 0.100000000000 0.100000000000 +0.000000000000 0.500000000000
0.2 0.200000000000 0.200000000000 +0.100000000000 0.500000000000

selected_fixtures: a h exact_delta sampled_delta absolute_error
1.0 0.0 1.000000000000 1.000000000000 2.220e-16
1.5 0.2 0.538516480713 0.538516480713 0.000e+00
2.0 0.2 0.200000000000 0.200000000000 0.000e+00
2.5 0.2 0.538516480713 0.538516480713 0.000e+00
3.0 0.0 1.000000000000 1.000000000000 0.000e+00

ALL_CHECKS_PASSED
negative_control H=0: centerlines intersect
boundary_control H=2rc: finite cores are tangent, not strictly disjoint
safe_fixture H=0.2L: minimum surface gap=0.1L
plot=alberr_4d_clearance.png
```

The dense-grid checks used 1000 samples per circle (one million pair distances per fixture); their maximum observed absolute discrepancy from the exact formula was `2.22e-16 L`. This is a floating-point check, not the proof; the bilinear minimization above is exact.

## Result and boundary

The Morrow obstruction was exact in three-dimensional ambient space: changing the projected linking number forced centerline contact. The present comparator proves a narrower complementary statement:

\[
\boxed{\text{an auxiliary Euclidean coordinate with lift }H>2r_c/L
\text{ is sufficient for a finite-core disjoint bypass}.}
\]

This does not establish an H(s)H annihilation route. The homotopy parameter and auxiliary coordinate have not been mapped to FIE/SAT time, timesheets, resolving sheets, or `theta4`; no admissible outgoing structure was constructed. A physical use would require a BEDROCK-compatible worldtube/worldsheet map and conservation checks. The calculation only supplies an exact clearance benchmark that such a proposed map must meet or replace.

## Complete runnable Python 3 and plotting source

```python
#!/usr/bin/env python3
"""Exact finite-core clearance for a 4D unlinking comparator.

GEN/DERIVED mathematical geometry only. This is not an H(s)H annihilation
mechanism and does not model outgoing radiation, energy, or spin.
"""

from __future__ import annotations

import math
import numpy as np


def smoothstep(t: np.ndarray | float) -> np.ndarray | float:
    return 3.0 * t * t - 2.0 * t * t * t


def schedule(s: np.ndarray | float, H: float) -> tuple[np.ndarray, np.ndarray]:
    """C1 piecewise path: lift, translate, lower."""
    s = np.asarray(s, dtype=float)
    a = np.empty_like(s)
    h = np.empty_like(s)
    q1 = s <= 1.0 / 3.0
    q2 = (s > 1.0 / 3.0) & (s <= 2.0 / 3.0)
    q3 = s > 2.0 / 3.0
    a[q1] = 1.0
    h[q1] = H * smoothstep(3.0 * s[q1])
    a[q2] = 1.0 + 2.0 * smoothstep(3.0 * s[q2] - 1.0)
    h[q2] = H
    a[q3] = 3.0
    h[q3] = H * (1.0 - smoothstep(3.0 * s[q3] - 2.0))
    return a, h


def exact_clearance(a: np.ndarray | float, h: np.ndarray | float, L: float = 1.0):
    """Minimum centerline distance between the two circles."""
    return L * np.sqrt((np.asarray(a) - 2.0) ** 2 + np.asarray(h) ** 2)


def circle1(u: np.ndarray, L: float = 1.0) -> np.ndarray:
    return L * np.column_stack((np.cos(u), np.sin(u), np.zeros_like(u), np.zeros_like(u)))


def circle2(v: np.ndarray, a: float, h: float, L: float = 1.0) -> np.ndarray:
    return L * np.column_stack((a + np.cos(v), np.zeros_like(v), np.sin(v), h * np.ones_like(v)))


def sampled_clearance(a: float, h: float, n: int = 1000) -> float:
    """Independent dense-grid check of the exact formula."""
    grid = 2.0 * math.pi * np.arange(n) / n
    x = circle1(grid)
    y = circle2(grid, a, h)
    best = math.inf
    for start in range(0, n, 100):
        d = x[start:start + 100, None, :] - y[None, :, :]
        best = min(best, float(np.min(np.linalg.norm(d, axis=2))))
    return best


def run_case(H: float, rc: float) -> tuple[float, float, float]:
    s = np.linspace(0.0, 1.0, 30001)
    a, h = schedule(s, H)
    delta = exact_clearance(a, h)
    k = int(np.argmin(delta))
    return float(delta[k]), float(delta[k] - 2.0 * rc), float(s[k])


def make_plot(rc: float = 0.05) -> None:
    import matplotlib.pyplot as plt

    s = np.linspace(0.0, 1.0, 2001)
    fig, ax = plt.subplots(figsize=(7.2, 4.2))
    for H, style in ((0.0, "--"), (0.1, ":"), (0.2, "-")):
        a, h = schedule(s, H)
        ax.plot(s, exact_clearance(a, h), style, lw=2, label=f"H/L={H:.1f}")
    ax.axhline(2.0 * rc, color="black", lw=1.2, label="2 r_c/L")
    ax.set(xlabel="path parameter s", ylabel="centerline clearance delta/L",
           title="4D lift-translate-lower clearance")
    ax.set_xlim(0.0, 1.0)
    ax.set_ylim(-0.01, 1.06)
    ax.grid(alpha=0.25)
    ax.legend()
    fig.tight_layout()
    fig.savefig("alberr_4d_clearance.png", dpi=180)


def main() -> None:
    rc = 0.05
    print("4D_FINITE_CORE_CLEARANCE (L=1)")
    print(f"core_radius rc/L={rc:.12f}; required centerline gap > {2*rc:.12f}")
    print("H/L exact_min sampled_mid_min surface_gap s_at_min")
    for H in (0.0, 0.1, 0.2):
        dmin, gap, smin = run_case(H, rc)
        sampled = sampled_clearance(2.0, H)
        print(f"{H:.1f} {dmin:.12f} {sampled:.12f} {gap:+.12f} {smin:.12f}")

    print("\nselected_fixtures: a h exact_delta sampled_delta absolute_error")
    fixtures = ((1.0, 0.0), (1.5, 0.2), (2.0, 0.2),
                (2.5, 0.2), (3.0, 0.0))
    for a, h in fixtures:
        ex = float(exact_clearance(a, h))
        nu = sampled_clearance(a, h)
        print(f"{a:.1f} {h:.1f} {ex:.12f} {nu:.12f} {abs(ex-nu):.3e}")

    # Negative controls and exact-condition checks.
    d0, g0, _ = run_case(0.0, rc)
    dt, gt, _ = run_case(2.0 * rc, rc)
    ds, gs, _ = run_case(0.2, rc)
    assert abs(d0) < 1e-15 and g0 < 0.0
    assert abs(dt - 2.0 * rc) < 2e-15 and abs(gt) < 2e-15
    assert abs(ds - 0.2) < 2e-15 and abs(gs - 0.1) < 2e-15
    for a, h in fixtures:
        assert abs(float(exact_clearance(a, h)) - sampled_clearance(a, h)) < 2e-12
    make_plot(rc)
    print("\nALL_CHECKS_PASSED")
    print("negative_control H=0: centerlines intersect")
    print("boundary_control H=2rc: finite cores are tangent, not strictly disjoint")
    print("safe_fixture H=0.2L: minimum surface gap=0.1L")
    print("plot=alberr_4d_clearance.png")


if __name__ == "__main__":
    main()
```
