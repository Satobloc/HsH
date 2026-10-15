# Mercer sandbox: finite endpoints regularize the 4D angled-tube overlap

Status: executed GEN/DERIVED Euclidean geometry calculation. It extends the current Meridian-to-Mercer relative-angle overlap result and Mercer's finite-core lane. It is a set-theoretic overlap calculation for flat-ended tubes, not an H(s)H interaction law, force law, or physical validation.

## Geometry and assumptions

Use Euclidean coordinates \(x=(x_1,x_2,x_3,x_4)\). Tube \(A\) has carrier tangent \(e_4\), half-length \(L\), and radius \(R\):

\[
|x_4|\le L,\qquad x_1^2+x_2^2+x_3^2\le R^2.
\]

Tube \(B\) is displaced by \(D e_2\), has tangent

\[
t_B=\sin\theta\,e_1+\cos\theta\,e_4,
\]

the same half-length and radius, and constraints

\[
|x_1\sin\theta+x_4\cos\theta|\le L,
\]

\[
(x_1\cos\theta-x_4\sin\theta)^2+(x_2-D)^2+x_3^2\le R^2.
\]

These are flat-ended parameter tubes rather than capsules. All lengths use a common unit; the numerical fixture is

\[
R=1.2,\qquad D=2.3,\qquad L=10.
\]

## Exact reduced integral

For fixed \(x_1,x_4\), define

\[
r_A=\sqrt{R^2-x_1^2},
\qquad
r_B=\sqrt{R^2-(x_1\cos\theta-x_4\sin\theta)^2}.
\]

The allowed \((x_2,x_3)\) section is the intersection of disks of radii \(r_A,r_B\) with center separation \(D\). Let its exact elementary area be \(\mathcal A(r_A,r_B;D)\). Then

\[
\boxed{
V_{\rm finite}(\theta)=
\int_{-R}^{R}
\int_{\mathcal J(x_1,\theta)}
\mathcal A(r_A,r_B;D)\,dx_4\,dx_1
}
\]

where \(\mathcal J\) is the intersection of the three exact intervals imposed by

\[
-L\le x_4\le L,
\]

\[
-L\le x_1\sin\theta+x_4\cos\theta\le L,
\]

\[
-R\le x_1\cos\theta-x_4\sin\theta\le R.
\]

Thus the four-dimensional overlap reduces to an adaptive two-dimensional quadrature with an analytic inner disk-lens integrand.

For nonparallel infinite carriers, the previous result is

\[
V_\infty(\theta)=\frac{I(D,R)}{|\sin\theta|}.
\]

At \(\theta=0\), both finite carriers are parallel and share the same endpoint interval. Their overlap is

\[
V_\parallel=2L\,V_{3,\rm lens}(D,R),
\]

where the equal-radius 3-ball intersection volume is

\[
V_{3,\rm lens}(D,R)
=\frac{\pi(4R+D)(2R-D)^2}{12},
\qquad 0\le D<2R.
\]

This proves that the finite model has a regular parallel limit even though the infinite-carrier model diverges.

## Crossover scale

Equating the two limiting asymptotes gives

\[
\sin\theta_\times=\frac{I(D,R)}{V_\parallel}.
\]

For the fixture,

\[
I=0.01353708976768339,
\]

\[
V_\parallel=0.3717551306747928,
\]

and

\[
\theta_\times=2.086829630107^\circ.
\]

This is an asymptote-equality scale, not the exact finite-volume intersection of two piecewise formulas. At that angle the actual result is

\[
V_{\rm finite}=0.3070798148234171,
\]

only

\[
0.826027106246
\]

of either asymptote. Therefore the shortcut

\[
V_{\rm finite}\stackrel{\rm false}{=}
\min(V_\parallel,V_\infty)
\]

overestimates the transition-region volume by about \(21.1\%\) relative to the actual value, or equivalently the actual volume is \(17.4\%\) below the common asymptotic value. Endpoint clipping and angular clipping act simultaneously; they cannot be combined with a hard minimum.

By \(5^\circ\), the finite/infinite ratio is \(0.999999776343\). At \(0.1^\circ\), the finite/parallel ratio is \(0.999552324430\). Thus this fixture has clean numerical plateaus on both sides of a narrow transition.

## Executed numerical output

~~~text
R=1.200000000000 D=2.300000000000 L=10.000000000000
I=1.353708976768339e-02 quadrature_error=8.736e-12
parallel_volume=3.717551306747928e-01
equality_crossover_deg=2.086829630107
angle_deg finite_V infinite_V finite/parallel finite/infinite quad_error
   0.000000000 3.717551306747928e-01 inf 1.000000000000 0.000000000000 0.000e+00
   0.100000000 3.715887049846266e-01 7.756185043561098e+00 0.999552324430 0.047908695177 6.135e-10
   0.250000000 3.707302953964469e-01 3.102482286783311e+00 0.997243251824 0.119494733935 6.900e-10
   0.500000000 3.676905018057807e-01 1.551255910229877e+00 0.989066381245 0.237027623477 5.317e-10
   1.000000000 3.557835972815873e-01 7.756574897754019e-01 0.957037490339 0.458686471763 2.793e-10
   2.000000000 3.118837679038760e-01 3.878878220817809e-01 0.838949464767 0.804056611600 5.943e-10
   2.086829630 3.070798148234171e-01 3.717551306747928e-01 0.826027106246 0.826027106246 4.893e-10
   3.000000000 2.516800136925268e-01 2.586575413821454e-01 0.677004815605 0.973024070157 4.773e-10
   5.000000000 1.553206514367534e-01 1.553206861752909e-01 0.417803652514 0.999999776343 2.890e-10
  10.000000000 7.795699298169706e-02 7.795699298180085e-02 0.209699844196 0.999999999999 5.039e-11
  30.000000000 2.707417953531743e-02 2.707417953536679e-02 0.072827991603 0.999999999998 1.747e-11
  90.000000000 1.353708976768339e-02 1.353708976768339e-02 0.036413995802 1.000000000000 8.736e-12
tight_tolerance_max_abs_delta=4.496e-10
ALL_CHECKS_PASSED
~~~

The largest change under tightened nested-quadrature tolerances was \(4.496\times10^{-10}\). At \(90^\circ\), where \(L>R\) makes the endpoint caps inactive, the finite result equals \(I(D,R)\) to the displayed precision. The exact \(\theta=0\) branch equals the analytic 3-ball-lens result. Every nonzero-angle finite volume was below its infinite-carrier counterpart, as required by set inclusion.

## Limiting cases and negative controls

- \(\theta\to0\): \(V_{\rm finite}\to V_\parallel\); the \(1/\sin\theta\) divergence disappears.
- \(L\to\infty\) at fixed \(\theta>0\): endpoint inequalities become inactive and \(V_{\rm finite}\to I/|\sin\theta|\).
- \(D\to2R\): both the parallel 3-ball lens and every angled overlap vanish.
- \(\theta=\pi/2\) with \(L>R\): the finite and infinite volumes coincide exactly.
- The finite tubes are subsets of the infinite tubes, so \(V_{\rm finite}\le V_\infty\); this was checked at every tabulated nonzero angle.
- This result applies to flat-ended tubes. Capsule endcaps define a different functional.

## Full executable Python 3 source

~~~python
#!/usr/bin/env python3
"""Finite-length regularization of two angled radius-R tubes in Euclidean R4.

GEN/DERIVED sandbox geometry.  Carriers are flat-ended line segments of
half-length L, not capsules.  This computes set-theoretic four-volume only.
"""

from __future__ import annotations

import math
from scipy.integrate import quad

R = 1.2
D = 2.3
L = 10.0
ATOL = 2.0e-11
RTOL = 2.0e-9


def disk_lens_area(r1: float, r2: float, d: float) -> float:
    """Intersection area of two disks, robust at containment/disjoint limits."""
    if r1 <= 0.0 or r2 <= 0.0 or d >= r1 + r2:
        return 0.0
    if d <= abs(r1 - r2):
        return math.pi * min(r1, r2) ** 2
    if d == 0.0:
        return math.pi * min(r1, r2) ** 2
    a = (d*d + r1*r1 - r2*r2) / (2.0*d*r1)
    b = (d*d + r2*r2 - r1*r1) / (2.0*d*r2)
    a = max(-1.0, min(1.0, a))
    b = max(-1.0, min(1.0, b))
    rad = (-d+r1+r2)*(d+r1-r2)*(d-r1+r2)*(d+r1+r2)
    return (r1*r1*math.acos(a) + r2*r2*math.acos(b)
            - 0.5*math.sqrt(max(0.0, rad)))


def interval_for_x4(x1: float, theta: float) -> tuple[float, float] | None:
    """Allowed x4 interval from both endpoint and B-normal constraints."""
    s, c = math.sin(theta), math.cos(theta)
    lo, hi = -L, L
    # B longitudinal coordinate t_B=x1 sin(theta)+x4 cos(theta).
    if abs(c) > 1.0e-14:
        a, b = (-L-x1*s)/c, (L-x1*s)/c
        lo, hi = max(lo, min(a, b)), min(hi, max(a, b))
    elif abs(x1*s) > L:
        return None
    # B perpendicular coordinate r_B=x1 cos(theta)-x4 sin(theta).
    if abs(s) > 1.0e-14:
        a, b = (x1*c-R)/s, (x1*c+R)/s
        lo, hi = max(lo, min(a, b)), min(hi, max(a, b))
    elif abs(x1*c) > R:
        return None
    return None if hi <= lo else (lo, hi)


def finite_volume(theta: float, atol: float = ATOL,
                  rtol: float = RTOL) -> tuple[float, float]:
    """Exact reduced quadrature for the finite flat-ended tube intersection."""
    if abs(theta) < 1.0e-14:
        return parallel_volume(), 0.0
    s, c = math.sin(theta), math.cos(theta)

    def outer(x1: float) -> float:
        interval = interval_for_x4(x1, theta)
        if interval is None:
            return 0.0
        r1 = math.sqrt(max(0.0, R*R-x1*x1))

        def inner(x4: float) -> float:
            rb = x1*c-x4*s
            r2 = math.sqrt(max(0.0, R*R-rb*rb))
            return disk_lens_area(r1, r2, D)

        value, _ = quad(inner, interval[0], interval[1], epsabs=atol,
                        epsrel=rtol, limit=250, points=[interval[0], interval[1]])
        return value

    value, error = quad(outer, -R, R, epsabs=atol, epsrel=rtol,
                        limit=250, points=[-R, R])
    return value, error


def sphere_lens_volume_equal(d: float, r: float) -> float:
    """Intersection volume of equal 3-balls."""
    if d >= 2.0*r:
        return 0.0
    if d <= 0.0:
        return 4.0*math.pi*r**3/3.0
    return math.pi*(4.0*r+d)*(2.0*r-d)**2/12.0


def parallel_volume() -> float:
    return 2.0*L*sphere_lens_volume_equal(D, R)


def infinite_kernel() -> tuple[float, float]:
    """I(D,R) such that infinite nonparallel overlap is I/|sin theta|."""
    def outer(x1: float) -> float:
        r1 = math.sqrt(max(0.0, R*R-x1*x1))

        def inner(rb: float) -> float:
            r2 = math.sqrt(max(0.0, R*R-rb*rb))
            return disk_lens_area(r1, r2, D)

        value, _ = quad(inner, -R, R, epsabs=ATOL, epsrel=RTOL, limit=200)
        return value

    return quad(outer, -R, R, epsabs=ATOL, epsrel=RTOL, limit=200)


def main() -> None:
    kernel, kernel_error = infinite_kernel()
    vparallel = parallel_volume()
    theta_cross = math.asin(kernel/vparallel)
    print(f"R={R:.12f} D={D:.12f} L={L:.12f}")
    print(f"I={kernel:.15e} quadrature_error={kernel_error:.3e}")
    print(f"parallel_volume={vparallel:.15e}")
    print(f"equality_crossover_deg={math.degrees(theta_cross):.12f}")
    print("angle_deg finite_V infinite_V finite/parallel finite/infinite quad_error")
    records = []
    for deg in (0.0, .10, .25, .50, 1.0, 2.0,
                math.degrees(theta_cross), 3.0, 5.0, 10.0, 30.0, 90.0):
        theta = math.radians(deg)
        finite, error = finite_volume(theta)
        infinite = math.inf if deg == 0.0 else kernel/abs(math.sin(theta))
        ratio_inf = 0.0 if not math.isfinite(infinite) else finite/infinite
        records.append((deg, finite, infinite, error))
        print(f"{deg:14.9f} {finite:.15e} {infinite:.15e} "
              f"{finite/vparallel:.12f} {ratio_inf:.12f} {error:.3e}")

    # Independent 90-degree identity: endpoint caps are inactive because L>R;
    # therefore finite and infinite results must coincide exactly by geometry.
    v90 = records[-1][1]
    # Small-angle convergence to parallel overlap.
    v01 = records[1][1]
    # Set inclusion: finite tubes are subsets of both infinite tubes.
    for deg, finite, infinite, _ in records[1:]:
        assert finite <= infinite*(1.0+3e-8), (deg, finite, infinite)
    assert abs(v90/kernel-1.0) < 2e-8
    assert abs(v01/vparallel-1.0) < 2e-3
    assert abs(finite_volume(0.0)[0]/vparallel-1.0) < 1e-15
    assert sphere_lens_volume_equal(2.0*R, R) == 0.0
    assert disk_lens_area(1.0, 1.0, 2.0) == 0.0
    convergence_deltas = []
    for deg, coarse in ((.1, records[1][1]),
                        (math.degrees(theta_cross), records[6][1]),
                        (3.0, records[7][1]), (5.0, records[8][1]),
                        (90.0, records[-1][1])):
        tight, _ = finite_volume(math.radians(deg), 5e-12, 5e-10)
        convergence_deltas.append(abs(coarse-tight))
    print(f"tight_tolerance_max_abs_delta={max(convergence_deltas):.3e}")
    assert max(convergence_deltas) < 8e-10
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
~~~

## Bounded conclusion

Finite endpoints replace the singular infinite-carrier \(1/|\sin\theta|\) law with a regular parallel plateau \(2L V_{3,\rm lens}\). For this near-contact fixture the transition scale is about \(2.09^\circ\), but neither asymptote alone describes the crossover: their hard minimum is materially too large. A finite-core interaction model using angled-carrier overlap must therefore retain endpoint geometry whenever \(L|\sin\theta|\) is comparable to the transverse overlap scale.

