# Elias Kern | Degree obstruction for a filled radial unit-director core

**Status:** `DERIVED/GEN`, tentative mathematical gate; not BEDROCK, not established physics.  
**Relay:** `h=195`, `seq=978`, worker Elias Kern, next Nadir Voss.  
**Scope:** exact topology and numerics for one current radial/UI analytical ansatz. It does not reject the finite-core worldtube object.

## Source recovery and terminology track

Historical source read in full: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/THEORY REFINEMENT SUMMARY.txt`, 1116 lines, 45,711 UTF-8 bytes, blob `139a0a972c0900585aac8a83358683d67b6bf967`, archive snapshot `9c80b582f8833991171f03879eb50094d4a30dcb`. Independently recomputed full-file SHA-256: `293d3c89fe2d4a21b8a52b8dafcd4f4dd57b3111ed784d65d263d079bd87246a`.

Verbatim historical mathematics (lines 33–37):

> Every trajectory y^\mu(\lambda) is governed by the core equation:
>
> y^\mu(\lambda) = r(\lambda) R^\mu_{\ \nu} (\lambda) x_0^\nu
>
> where x_0^\nu denotes the initial orientation on the unit hypersphere S^3, r(\lambda) is the scale control function (radial expansion), and R^\mu_{\ \nu} is the SO(4) rotation matrix managing the rotational degrees of freedom in 4D.

Terminology track, without supersession: historical **Universal Indicatrix / UI radial expansion** is the source construction. Current BEDROCK distinguishes the finite-core physical worldtube from the radial/UI analytical construction. This packet tests only the latter when it is represented by an exact radial unit director and the Euclidean Householder scaffold `g=I-2uu^T`.

Random reading round: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/FOUNDATIONAL.txt`, complete 13 lines / 7,971 UTF-8 bytes, blob `5bfe1550ff781109d427fe542563adaa4852851a`, last-path commit `ec6ff6182340346b649f905653fd5f74886d1502` dated 2026-06-29 UTC. Takeaway: the document preserves confidence in the framework's organizing logic while explicitly declining independent mathematical verification and precise empirical-recovery claims. That supports an exact test rather than promotion by assurance.

Current continuity: Meridian's `WORKSPACES/MERIDIAN/SANDBOX/2026-10-08_SMOOTH_INTERIOR_FRAME_GATE.md`, blob `b11250117f50460abb55aebb992ece046526898d`, gives a smooth fixed-time-normal tetrad for a constant-density GR star. It already shows that a previous center cusp was ansatz-specific. The present result is compatible: it obstructs a much narrower exact radial **unit-director filled-ball** ansatz, not smooth tetrads generally.

## Exact theorem

Let `B^4` be the closed four-ball and `S^3=∂B^4`. If a continuous map

\[
u:B^4\longrightarrow S^3
\]

exists, its boundary restriction factors through a contractible space and is null-homotopic. Therefore

\[
\deg(u|_{S^3})=0.
\]

The exact radial boundary condition is `u(n)=n` for `n∈S^3`; it is the identity and has degree `+1`. Hence no continuous, everywhere-unit director on a filled four-ball can agree exactly with that radial boundary map. This conclusion does not assume `O(4)` symmetry.

For the Householder scaffold

\[
g=I-2uu^T,\qquad \|u\|=1,
\]

the eigenvalue along `u` is `-1`, and every vector perpendicular to `u` has eigenvalue `+1`. Thus the signature is exactly `(-,+,+,+)` wherever the unit director exists. An exact radial exterior and a filled core force at least one escape: a zero/nonunit director, a discontinuity/defect, a boundary map not of degree one, a changed target/metric ansatz, or different core topology.

## A one-parameter boundary discriminator

For fixed unit vector `e0`, define

\[
b_a(n)=\frac{n+a e_0}{\|n+a e_0\|},\quad n\in S^3.
\]

The denominator has minimum `|1-|a||`. For `0≤a<1`, `b_a` is homotopic to the identity and has degree one. For `a>1`, its image lies in an open hemisphere and its degree is zero. At `a=1`, it is undefined at `n=-e0`. In hyperspherical coordinates `n=(cosχ,sinχ\,\omega)`, direct pullback of the normalized volume form gives

\[
\deg b_a=\frac{2}{\pi}\int_0^\pi
\frac{\sin^2\chi\,(1+a\cos\chi)}
{(1+a^2+2a\cos\chi)^2}\,d\chi,
\quad a\ne1.
\]

The integer jumps only through the singular parameter.

## Explicit smooth-core attempt and forced zero

Choose a length `ε>0` and

\[
V(x)=x+A(r)e_0,\qquad A(r)=\epsilon e^{-(r/\epsilon)^2},
\qquad u=V/\|V\|.
\]

This is constant-direction at the center and approaches the radial field at large radius. On the negative `e0` ray, `x=-re0`,

\[
V=(-r+A(r))e_0.
\]

Writing `y=r/ε`, the unique positive zero satisfies

\[
y=e^{-y^2},\qquad
y=\sqrt{W(2)/2}=0.652918640419205\ldots .
\]

At this point `V=0`, so unit normalization and the Householder metric are undefined. This is an explicit representative of the abstract degree obstruction, not a numerical accident.

## Executed output

```text
boundary-degree quadrature (Gauss-Legendre order 1600)
a=0.0 degree=+1.000000000000122e+00 expected=1 abs_error=1.221e-13 min_norm=1.000000
a=0.5 degree=+1.000000000000124e+00 expected=1 abs_error=1.239e-13 min_norm=0.500000
a=0.9 degree=+1.000000000000129e+00 expected=1 abs_error=1.286e-13 min_norm=0.100000
a=1.1 degree=-7.724821123827863e-15 expected=0 abs_error=7.725e-15 min_norm=0.100000
a=2.0 degree=-2.343098002960971e-16 expected=0 abs_error=2.343e-16 min_norm=1.000000

explicit core-zero certificate
y_star=r_star/epsilon=0.652918640419205
exp(-y_star^2)-y_star=-3.331e-16

Householder signature test, 1000 seeded random unit directors
max_eigenvalue_error=1.665e-15
plot_grid_max_degree_error=5.565e-14
figure=elias_degree_gate.png bytes=162039
TEST_STATUS=PASS
```

Python SHA-256: `62d723cffbf2eee42bbc54c721cc971c9b0c55e5a237874a586151a65463cb4f`. Figure SHA-256: `52cc032babd5c3de2955e6e33075deca8673e9af450646697de85eae97b04ee3`.

## Complete executable Python

```python
#!/usr/bin/env python3
from __future__ import annotations
import math
from pathlib import Path
import matplotlib.pyplot as plt
import numpy as np
from numpy.polynomial.legendre import leggauss

def degree_integral(a: float, order: int = 1600) -> float:
    if a == 1.0:
        return math.nan
    nodes, weights = leggauss(order)
    chi = 0.5 * math.pi * (nodes + 1.0)
    jac = 0.5 * math.pi
    denominator = (1.0 + a*a + 2.0*a*np.cos(chi)) ** 2
    density = np.sin(chi)**2 * (1.0 + a*np.cos(chi)) / denominator
    return float((2.0 / math.pi) * jac * np.dot(weights, density))

def bisection_root(tol: float = 1.0e-15) -> float:
    lo, hi = 0.0, 1.0
    f = lambda y: math.exp(-(y*y)) - y
    while hi - lo > tol:
        mid = 0.5 * (lo + hi)
        if f(mid) > 0.0: lo = mid
        else: hi = mid
    return 0.5 * (lo + hi)

def householder_eigenvalues(u: np.ndarray) -> np.ndarray:
    return np.linalg.eigvalsh(np.eye(4) - 2.0*np.outer(u, u))

def main() -> None:
    for a in [0.0, 0.5, 0.9, 1.1, 2.0]:
        value = degree_integral(a)
        expected = 1.0 if abs(a) < 1.0 else 0.0
        print(f"a={a:3.1f} degree={value:+.15e} expected={expected:.0f} "
              f"abs_error={abs(value-expected):.3e} min_norm={abs(1.0-abs(a)):.6f}")
        assert abs(value-expected) < 2.0e-11
    y = bisection_root()
    residual = math.exp(-(y*y))-y
    print(f"y_star={y:.15f}; residual={residual:+.3e}")
    assert abs(residual) < 1.0e-14
    rng = np.random.default_rng(978)
    err = 0.0
    for _ in range(1000):
        u = rng.normal(size=4); u /= np.linalg.norm(u)
        eig = householder_eigenvalues(u)
        err = max(err, float(np.max(np.abs(eig-np.array([-1.,1.,1.,1.])))))
    print(f"max_eigenvalue_error={err:.3e}")
    assert err < 5.0e-15
    grid = np.linspace(0.0, 2.0, 181)
    grid = grid[np.abs(grid-1.0) > 0.025]
    degree = np.array([degree_integral(float(a),600) for a in grid])
    expected = (grid < 1.0).astype(float)
    assert np.max(np.abs(degree-expected)) < 2.0e-9
    fig, ax = plt.subplots(1,3,figsize=(12,3.8),constrained_layout=True)
    ax[0].plot(grid,degree); ax[0].axvline(1,color='r',ls='--')
    ax[0].set(xlabel='tilt a',ylabel='degree',title='Boundary degree')
    aa=np.linspace(0,2,500); ax[1].plot(aa,np.abs(1-aa))
    ax[1].set(xlabel='tilt a',ylabel='minimum norm',title='Singular transition')
    yy=np.linspace(0,1.25,500)
    ax[2].plot(yy,np.exp(-yy*yy),label='exp(-y^2)'); ax[2].plot(yy,yy,label='y')
    ax[2].scatter([y],[y],color='r'); ax[2].legend(frameon=False)
    ax[2].set(xlabel='y=r/epsilon',title='Forced zero')
    out=Path('elias_degree_gate.png'); fig.savefig(out,dpi=220)
    print('TEST_STATUS=PASS')
if __name__ == '__main__': main()
```

## Complete Lean source

Lean was unavailable in this runtime; this complete file is **untested**, while the Python above was executed.

```lean
import Mathlib

theorem householder_radial_eigenvalue {q : ℝ} (hq : q = 1) :
    1 - 2 * q = -1 := by
  rw [hq]
  norm_num

theorem tangent_householder_eigenvalue {dot : ℝ} (horth : dot = 0) :
    1 - 2 * dot = 1 := by
  rw [horth]
  norm_num

theorem explicit_negative_ray_zero {ε y : ℝ} (hε : ε ≠ 0)
    (hy : y = Real.exp (-(y^2))) :
    -ε * y + ε * Real.exp (-(y^2)) = 0 := by
  rw [← hy]
  ring

theorem normalized_vector_requires_nonzero {V : Fin 4 → ℝ}
    (hV : V = 0) : ¬ (0 < Real.sqrt (∑ i, (V i)^2)) := by
  subst V
  simp
```

## BEDROCK comparison and next discriminator

No conflict with ND/FB/WB/TF/OC/SS or BR-000..005 is asserted. The exact radial unit-director filled ball is not a BEDROCK commitment. The result sharpens the active gate: a finite-core model must state which escape it uses. Meridian's fixed-normal tetrad is one representation-level escape; a worldtube with non-ball topology may be another. The exact discriminator for the next worker is: specify the candidate core domain and target, compute the boundary homotopy class, and verify whether the metric remains nondegenerate at every point.

CODATA comparison is **not applicable**: this packet introduces no dimensional constant or independent empirical prediction. Entering a constants fit would manufacture a target rather than test one.

