# Alberr calculation: local-focal gate for (2,q) torus curves

**Status:** GEN/DERIVED geometry; executed numerical algebra, not physical validation.

## Question and boundary

For the torus curve

\[
\gamma(t)=((R+r\cos qt)\cos pt,(R+r\cos qt)\sin pt,r\sin qt),
\qquad 0<r<R,
\]

compute the first radius ratio \(\lambda=r/R\) at which local curvature alone forces a normal tube of radius \(r\) to self-focalize. This is only a reach upper-bound gate:

\[
\operatorname{reach}(\gamma)\le \min\{\rho_{\min},\tfrac12 d_{\rm dc}\}.
\]

It does not solve every double-critical chord.

## Derivation

Set \(R=1\), \(c=\cos(qt)\), \(s^2=1-c^2\), \(A=1+\lambda c\). In the moving cylindrical frame,

\[
\gamma'=(-\lambda q s,\;pA,\;\lambda q c),
\]
\[
\gamma''=(-p^2A-\lambda q^2c,\;-2p\lambda q s,\;-\lambda q^2s).
\]

Therefore

\[
V(c)=|\gamma'|^2=p^2A^2+\lambda^2q^2,
\]

and the squared cross-product components are

\[
C_r^2=(p\lambda q^2)^2(1-c^2)(-1+\lambda c)^2,
\]
\[
C_\phi^2=(\lambda q)^2[p^2Ac+\lambda q^2]^2,
\]
\[
C_z^2=p^2[p^2A^2+\lambda q^2(c+2\lambda-\lambda c^2)]^2.
\]

Writing \(C=C_r^2+C_\phi^2+C_z^2\),

\[
\kappa^2(c)=\frac{C(c)}{V(c)^3},\qquad
\frac{\rho(c)}R=\frac{V(c)^{3/2}}{\sqrt{C(c)}}.
\]

All stationary curvature candidates are the real roots in \([-1,1]\) of

\[
C'(c)V(c)-3C(c)V'(c)=0,
\]

plus the endpoints. The local tube-radius gate is

\[
D_\lambda(c)=\lambda^2C(c)-V(c)^3.
\]

Thus \(\max_c D_\lambda(c)>0\) iff \(\rho_{\min}<r\). The threshold solves \(\max_cD_\lambda(c)=0\).

For even \(p\) and odd \(q\), \(\gamma(t+\pi)\) is the antipode on the same minor circle. Its chord has length exactly \(2r\) and is perpendicular to both endpoint tangents, hence \(d_{\rm dc}/2\le r\). This establishes the exact cap \(\operatorname{reach}\le r\), independent of the local-focal gate.

## Executed output

```text
LOCAL FOCAL GATE FOR (2,q) TORUS CURVES
R=1 sets length units; lambda=r/R
 q    lambda_focal       c_at_gate       rho_min/R at lambda=0.4
 1  0.653092390831300  -0.740937504311      0.784279966197
 3  0.683826142801487  -0.521922652179      0.765514889564
 5  0.674425264627859  -0.456385766905      0.592355109459
 7  0.669336110784146  -0.425503916717      0.507355748574
 9  0.666628685405141  -0.409281088963      0.466788417776

(2,3) FIXTURE, R=1 m, r=0.4 m
c*=cos(3t*)=-0.300436498743738; t*=0.625315529589331 rad
true minimum local focal radius=0.765514889563832 m
rho_min/r=1.913787223909580
finite-difference h=1e-03: rho=0.765514250947058 m
finite-difference h=3e-04: rho=0.765514831716476 m
finite-difference h=1e-04: rho=0.765514880223945 m

ANTIPODAL DOUBLE-CRITICAL CONTROL
|chord|=0.800000000000000 m; half-chord=0.400000000000000 m
chord dot tangent(t)=-2.586e-17
chord dot tangent(t+pi)=-1.812e-16

controls: threshold brackets PASS; q->-q PASS; antipodal chord PASS; finite difference PASS
claim boundary: reach <= min(r, rho_min); other double-critical chords were not solved here
```

## Findings

- Changing winding changes the local-focal onset: for \((p,q)=(2,3)\), \(\lambda_{\rm focal}=0.683826142801487\); for \((2,5)\), it is \(0.674425264627859\).
- At the inherited \(R=1\,\mathrm m,r=0.4\,\mathrm m,(p,q)=(2,3)\) fixture, the actual minimum focal radius is \(0.765514889563832\,\mathrm m\). The earlier value near \(1.01\,\mathrm m\) is not the global minimum along the curve.
- This correction does not alter the reach at that fixture if the antipodal chord is the controlling chord: its exact half-length is \(r=0.4\,\mathrm m\), well below the local focal radius.
- At \(\lambda=2/3\), the \((2,3)\) local focal radius is \(0.683508236312R>r\). Therefore any reach phase change at \(2/3\) is nonlocal (double-critical), not a local-curvature transition.
- The \(q\mapsto-q\) negative control agrees to below \(2\times10^{-12}\), as required because the formulas depend only on orientation-insensitive even powers of \(q\).

Numerical uncertainty is dominated by double-precision polynomial roots and Brent termination; threshold residuals are at approximately \(10^{-13}\) to \(10^{-11}\) in the unnormalized gate polynomial. The independent central-difference check at \(h=10^{-4}\) differs from the analytic focal radius by \(9.34\times10^{-9}\,\mathrm m\).

## Full runnable Python

```python
#!/usr/bin/env python3
"""Local-focal obstruction gate for (2,q) torus curves.

GEN/DERIVED geometry only.  This computes a necessary upper bound on tube
reach; it does not determine all double-critical self-distances.
"""

import math
import numpy as np
from numpy.polynomial import Polynomial as Poly
from scipy.optimize import brentq


def curvature_polynomials(lam: float, p: int, q: int):
    """Return V(c)=|gamma'|^2 and C(c)=|gamma' x gamma''|^2 for R=1."""
    c = Poly([0.0, 1.0])
    s2 = 1.0 - c * c
    A = 1.0 + lam * c
    V = p * p * A * A + lam * lam * q * q
    Cr2 = (p * lam * q * q) ** 2 * s2 * (-1.0 + lam * c) ** 2
    Cp2 = (lam * q) ** 2 * (p * p * A * c + lam * q * q) ** 2
    Cz2 = p * p * (
        p * p * A * A
        + lam * q * q * (c + 2.0 * lam - lam * c * c)
    ) ** 2
    return V, Cr2 + Cp2 + Cz2


def real_unit_roots(poly: Poly):
    roots = []
    for z in poly.roots():
        if abs(z.imag) < 2e-8 and -1.0 <= z.real <= 1.0:
            roots.append(float(z.real))
    return roots


def local_focal_min(lam: float, p: int, q: int):
    """Return min curvature radius/R and its c=cos(qt)."""
    V, C = curvature_polynomials(lam, p, q)
    # kappa^2=C/V^3; stationary numerator after differentiation:
    stationary = C.deriv() * V - 3.0 * C * V.deriv()
    points = [-1.0, 1.0] + real_unit_roots(stationary)
    cstar = max(points, key=lambda x: C(x) / V(x) ** 3)
    rho = V(cstar) ** 1.5 / math.sqrt(C(cstar))
    return float(rho), float(cstar)


def focal_gate(lam: float, p: int, q: int):
    """Max over c of D=lam^2*C-V^3; D>0 iff min rho<r."""
    V, C = curvature_polynomials(lam, p, q)
    D = lam * lam * C - V ** 3
    points = [-1.0, 1.0] + real_unit_roots(D.deriv())
    cstar = max(points, key=D)
    return float(D(cstar)), float(cstar)


def critical_lambda(p: int, q: int):
    root = brentq(
        lambda x: focal_gate(x, p, q)[0],
        0.50,
        0.90,
        xtol=5e-15,
        rtol=1e-14,
    )
    return float(root), focal_gate(root, p, q)[1]


def gamma(t: float, R: float, r: float, p: int, q: int):
    A = R + r * math.cos(q * t)
    return np.array([A * math.cos(p * t), A * math.sin(p * t), r * math.sin(q * t)])


def gamma_prime(t: float, R: float, r: float, p: int, q: int):
    ct, st = math.cos(p * t), math.sin(p * t)
    cq, sq = math.cos(q * t), math.sin(q * t)
    A = R + r * cq
    return np.array([
        -r * q * sq * ct - p * A * st,
        -r * q * sq * st + p * A * ct,
        r * q * cq,
    ])


def finite_difference_radius(t: float, R: float, r: float, p: int, q: int, h: float):
    g0 = gamma(t, R, r, p, q)
    gm = gamma(t - h, R, r, p, q)
    gp = gamma(t + h, R, r, p, q)
    v = (gp - gm) / (2.0 * h)
    a = (gp - 2.0 * g0 + gm) / (h * h)
    return float(np.linalg.norm(v) ** 3 / np.linalg.norm(np.cross(v, a)))


def main():
    p = 2
    qs = [1, 3, 5, 7, 9]
    print("LOCAL FOCAL GATE FOR (2,q) TORUS CURVES")
    print("R=1 sets length units; lambda=r/R")
    print(" q    lambda_focal       c_at_gate       rho_min/R at lambda=0.4")
    rows = []
    for q in qs:
        lam0, c0 = critical_lambda(p, q)
        rho04, _ = local_focal_min(0.4, p, q)
        rows.append((q, lam0, c0, rho04))
        print(f"{q:2d}  {lam0:.15f}  {c0:+.12f}      {rho04:.12f}")

    # Inherited (2,3), R=1 m, r=0.4 m fixture.
    rho, cstar = local_focal_min(0.4, 2, 3)
    tstar = math.acos(cstar) / 3.0
    print("\n(2,3) FIXTURE, R=1 m, r=0.4 m")
    print(f"c*=cos(3t*)={cstar:+.15f}; t*={tstar:.15f} rad")
    print(f"true minimum local focal radius={rho:.15f} m")
    print(f"rho_min/r={rho/0.4:.15f}")
    for h in [1e-3, 3e-4, 1e-4]:
        print(f"finite-difference h={h:.0e}: rho={finite_difference_radius(tstar,1,.4,2,3,h):.15f} m")

    # The exact antipodal double-critical chord for p even, q odd.
    t = 0.271
    x0, x1 = gamma(t, 1.0, 0.4, 2, 3), gamma(t + math.pi, 1.0, 0.4, 2, 3)
    chord = x1 - x0
    v0 = gamma_prime(t, 1.0, 0.4, 2, 3)
    v1 = gamma_prime(t + math.pi, 1.0, 0.4, 2, 3)
    print("\nANTIPODAL DOUBLE-CRITICAL CONTROL")
    print(f"|chord|={np.linalg.norm(chord):.15f} m; half-chord={np.linalg.norm(chord)/2:.15f} m")
    print(f"chord dot tangent(t)={np.dot(chord,v0):+.3e}")
    print(f"chord dot tangent(t+pi)={np.dot(chord,v1):+.3e}")

    # Negative controls and boundary checks.
    for q, lam0, _, _ in rows:
        lo = focal_gate(lam0 - 1e-6, p, q)[0]
        hi = focal_gate(lam0 + 1e-6, p, q)[0]
        assert lo < 0.0 < hi
        assert abs(local_focal_min(0.4, p, q)[0] - local_focal_min(0.4, p, -q)[0]) < 2e-12
    assert abs(np.linalg.norm(chord) - 0.8) < 2e-14
    assert abs(np.dot(chord, v0)) < 2e-14
    assert abs(np.dot(chord, v1)) < 2e-14
    fd = finite_difference_radius(tstar, 1.0, 0.4, 2, 3, 1e-4)
    assert abs(fd - rho) < 2e-8
    print("\ncontrols: threshold brackets PASS; q->-q PASS; antipodal chord PASS; finite difference PASS")
    print("claim boundary: reach <= min(r, rho_min); other double-critical chords were not solved here")


if __name__ == "__main__":
    main()
```

