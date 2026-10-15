# Meridian sandbox: exact relative-angle kernel for finite-core carriers in R4

**Run key:** `REVROT3-19-20261015:09:s3`  
**Status:** GEN/DERIVED sandbox geometry; analytic derivation plus executed numerical checks  
**Boundary:** this is an isotropic tube-intersection calculation, not an H(s)H force law, constitutive law, or empirical claim.

## 1. Problem and relation to the current cursor

The preceding contact-energy work integrated equal-3-ball overlap at matched curve parameters. That is a legitimate candidate penalty once a material-station correspondence is stipulated, but it is not automatically the set-theoretic four-volume of two tubes after a relative SO(4) carrier rotation.

This calculation isolates the rotation variable exactly. Let carrier A be the line through the origin with unit tangent `e4`. Let carrier B be displaced by `D e2` and have unit tangent

\[
t_B=\sin\theta\,e_1+\cos\theta\,e_4,
\qquad 0<\theta<\pi.
\]

Each carrier is thickened by the isotropic normal 3-ball of radius `R`. In Hagalaz/UI language, `theta` is a conjugacy-invariant tangent angle extracted from the relative frame rotation `Q`; this does not identify the full Hagalaz operator with the present kernel.

## 2. Exact reduction

For `x=(x1,x2,x3,x4)`, the tube about A is

\[
x_1^2+x_2^2+x_3^2\le R^2.
\]

The squared distance to B is

\[
(\cos\theta\,x_1-\sin\theta\,x_4)^2
 +(x_2-D)^2+x_3^2,
\]

so the second tube obeys

\[
(\cos\theta\,x_1-\sin\theta\,x_4)^2
 +(x_2-D)^2+x_3^2\le R^2.
\]

Use

\[
u=x_1,
\qquad
v=\cos\theta\,x_1-\sin\theta\,x_4.
\]

The longitudinal Jacobian is

\[
dx_1\,dx_4=\frac{du\,dv}{|\sin\theta|}.
\]

At fixed `y=x2`, `z=x3`, define

\[
A=R^2-y^2-z^2,
\qquad
B=R^2-(y-D)^2-z^2.
\]

Where both are nonnegative, `u` and `v` independently occupy intervals of lengths `2 sqrt(A)` and `2 sqrt(B)`. Therefore the exact four-volume is

\[
\boxed{
V_4(D,R,\theta)
=\frac{I(D,R)}{|\sin\theta|}
},
\]

where

\[
I(D,R)=4\iint_{\mathcal L(D,R)}
\sqrt{R^2-y^2-z^2}
\sqrt{R^2-(y-D)^2-z^2}\,dy\,dz,
\]

and `L(D,R)` is the intersection lens of the two radius-R disks in the common two-dimensional normal plane.

Consequences:

1. `V4=0` exactly for `D>=2R`.
2. At `D=0`,

\[
\boxed{V_4(0,R,\theta)=\frac{2\pi R^4}{|\sin\theta|}}.
\]

3. If the candidate energy is `E=lambda V4`, then both energy and separation-force magnitude scale as `1/|sin(theta)|`.
4. A uniform similarity `R->sigma R`, `D->sigma D` gives `V4->sigma^4 V4`, consistent with four-volume dimensionality.
5. The divergence as `theta->0` is a warning that infinite parallel tubes have unbounded longitudinal overlap. A finite-length model must retain its endpoint cap and does not inherit this divergence.

For finite half-length `T`, the infinite-line result is unchanged whenever endpoints do not clip the intersection. A simple sufficient bound is

\[
T\ge \frac{R(1+|\cos\theta|)}{|\sin\theta|}.
\]

## 3. Near-contact asymptotic

Let

\[
p=2R-D\to0^+.
\]

Write

\[
y=R-\frac p2+\frac p2\xi,
\qquad
z=\sqrt{Rp}\,\eta.
\]

To leading order,

\[
A=Rp(1-\xi-\eta^2)+O(p^2),
\qquad
B=Rp(1+\xi-\eta^2)+O(p^2).
\]

The scaled domain is `|eta|<=1` and `|xi|<=1-eta^2`. Hence

\[
V_4
\sim\frac{2R^{3/2}p^{5/2}}{|\sin\theta|}
\int_{-1}^{1}\int_{-(1-\eta^2)}^{1-\eta^2}
\sqrt{(1-\eta^2)^2-\xi^2}\,d\xi\,d\eta.
\]

The inner integral is `pi(1-eta^2)^2/2`, and

\[
\int_{-1}^{1}(1-\eta^2)^2d\eta=\frac{16}{15}.
\]

Therefore

\[
\boxed{
V_4(2R-p,R,\theta)
\sim\frac{16\pi}{15}
\frac{R^{3/2}p^{5/2}}{|\sin\theta|}
}.
\]

This `p^(5/2)` onset differs from the `p^2` parallel matched-station penalty and the `p^(9/4)` curved matched-station onset. The three exponents describe different stipulated geometric functionals; they must not be silently interchanged.

## 4. Executed numerical results

The complete program in section 5 was executed with NumPy Gauss-Legendre quadrature.

```text
R=1.200000000000 D=2.300000000000 I(D,R)=1.353708976347313e-02
quadrature |I512-I256|=2.418e-11
angle_deg volume force_per_lambda volume*sin(theta)
    90.0 1.353708976347313e-02 3.345079155539556e-01 1.353708976347313e-02
    75.0 1.401462658419689e-02 3.463080771316563e-01 1.353708976347313e-02
    60.0 1.563128483797067e-02 3.862564701823517e-01 1.353708976347313e-02
    45.0 1.914433593856569e-02 4.730656308976014e-01 1.353708976347313e-02
    30.0 2.707417952694625e-02 6.690158311079257e-01 1.353708976347313e-02
    15.0 5.230329846132827e-02 1.292439338926888e+00 1.353708976347313e-02
D=0 numeric=1.302881305296667e+01 exact=1.302881305296759e+01 relative_error=7.017e-14
near-contact p volume asymptotic ratio
1.0e-02 5.072131236429061e-05 5.086509192087604e-05 0.997173315703
3.0e-03 2.505269588228589e-06 2.507396241117382e-06 0.999151848099
1.0e-03 1.608040666303707e-07 1.608495438637974e-07 0.999717268496
3.0e-04 7.928410564263804e-09 7.929083118475664e-09 0.999915178817
1.0e-04 5.086365375526739e-10 5.086509192087603e-10 0.999971725882
local log-slopes 2.498353638 2.499485041 2.499835589 2.499948526
D=2R volume=0.0
theta=0 rejected=parallel infinite carriers have no finite overlap kernel
ALL CHECKS PASSED
```

The exact angular invariant `V4 sin(theta)=I(D,R)` is reproduced throughout the table. The `D=0` result agrees with `2 pi R^4` to relative error `7.017e-14`. The local exponent converges to `2.5`, while the smallest-penetration asymptotic ratio is `0.999971725882`.

## 5. Full executable source

```python
#!/usr/bin/env python3
"""Relative-angle overlap kernel for equal-radius tubes about lines in R^4.

GEN/DERIVED sandbox geometry.  This is not an H(s)H interaction law.

Line A is span(e4).  Line B has tangent sin(theta)e1+cos(theta)e4 and
is displaced by D e2, where e2 lies in the common two-dimensional normal
space.  Each infinite carrier is thickened by a normal 3-ball of radius R.

For 0 < theta < pi, the exact four-volume is

    V4(D,theta) = I(D,R)/abs(sin(theta)),

where I is a bounded two-dimensional quadrature over the intersection of two
radius-R disks.  The theta -> 0 divergence is the correct infinite-line
parallel-limit warning, not a finite-volume prediction.
"""

from __future__ import annotations

import math
import numpy as np
from numpy.polynomial.legendre import leggauss


def cross_section_kernel(D: float, R: float, order: int = 384) -> float:
    """Return I(D,R), with exact zero for disjoint normal disks."""
    if R <= 0.0:
        raise ValueError("R must be positive")
    if D < 0.0:
        raise ValueError("D must be nonnegative")
    if D >= 2.0 * R:
        return 0.0

    z, w = leggauss(order)
    x_lo = D - R
    x_hi = R
    x = 0.5 * (x_hi + x_lo) + 0.5 * (x_hi - x_lo) * z
    wx = 0.5 * (x_hi - x_lo) * w

    A = np.maximum(R * R - x * x, 0.0)
    B = np.maximum(R * R - (x - D) ** 2, 0.0)
    y_max = np.sqrt(np.minimum(A, B))
    y = y_max[:, None] * z[None, :]
    wy = y_max[:, None] * w[None, :]
    integrand = np.sqrt(np.maximum(A[:, None] - y * y, 0.0))
    integrand *= np.sqrt(np.maximum(B[:, None] - y * y, 0.0))

    # The two independent longitudinal interval lengths are 2*sqrt(A-y^2)
    # and 2*sqrt(B-y^2), hence the factor four.
    return 4.0 * float(np.sum(wx[:, None] * wy * integrand))


def overlap_volume(D: float, R: float, theta: float,
                   order: int = 384) -> float:
    s = abs(math.sin(theta))
    if s < 1.0e-12:
        raise ValueError("parallel infinite carriers have no finite overlap kernel")
    return cross_section_kernel(D, R, order) / s


def force_per_lambda(D: float, R: float, theta: float,
                     order: int = 384, h: float = 2.0e-5) -> float:
    """Five-point value of -dV4/dD for E=lambda*V4."""
    vm2 = overlap_volume(D - 2.0 * h, R, theta, order)
    vm1 = overlap_volume(D - h, R, theta, order)
    vp1 = overlap_volume(D + h, R, theta, order)
    vp2 = overlap_volume(D + 2.0 * h, R, theta, order)
    derivative = (vm2 - 8.0 * vm1 + 8.0 * vp1 - vp2) / (12.0 * h)
    return -derivative


def near_contact_asymptotic(p: float, R: float, theta: float) -> float:
    """Leading V4 for p=2R-D -> 0+."""
    return ((16.0 * math.pi / 15.0) * R**1.5 * p**2.5
            / abs(math.sin(theta)))


def main() -> None:
    R = 1.2
    D = 2.3
    base = cross_section_kernel(D, R, order=512)
    base256 = cross_section_kernel(D, R, order=256)
    print(f"R={R:.12f} D={D:.12f} I(D,R)={base:.15e}")
    print(f"quadrature |I512-I256|={abs(base-base256):.3e}")
    print("angle_deg volume force_per_lambda volume*sin(theta)")
    for degrees in (90.0, 75.0, 60.0, 45.0, 30.0, 15.0):
        theta = math.radians(degrees)
        volume = overlap_volume(D, R, theta, order=512)
        force = force_per_lambda(D, R, theta, order=384)
        invariant = volume * math.sin(theta)
        print(f"{degrees:8.1f} {volume:.15e} {force:.15e} {invariant:.15e}")
        assert abs(invariant - base) < 3.0e-15

    # Exact coincident-axis-crossing fixture at D=0 and theta=pi/2.
    exact0 = 2.0 * math.pi * R**4
    numeric0 = overlap_volume(0.0, R, math.pi / 2.0, order=512)
    print(f"D=0 numeric={numeric0:.15e} exact={exact0:.15e} "
          f"relative_error={abs(numeric0/exact0-1.0):.3e}")

    # Near first contact: V4 ~ (16*pi/15)R^(3/2)p^(5/2)/sin(theta).
    theta = math.radians(60.0)
    ps = np.array([1.0e-2, 3.0e-3, 1.0e-3, 3.0e-4, 1.0e-4])
    values = np.array([
        overlap_volume(2.0 * R - p, R, theta, order=512) for p in ps
    ])
    approximations = np.array([
        near_contact_asymptotic(p, R, theta) for p in ps
    ])
    slopes = np.diff(np.log(values)) / np.diff(np.log(ps))
    print("near-contact p volume asymptotic ratio")
    for p, value, approx in zip(ps, values, approximations):
        print(f"{p:.1e} {value:.15e} {approx:.15e} {value/approx:.12f}")
    print("local log-slopes", " ".join(f"{s:.9f}" for s in slopes))

    # Disjoint and singular negative controls.
    print(f"D=2R volume={overlap_volume(2.0*R, R, math.pi/3):.1f}")
    try:
        overlap_volume(D, R, 0.0)
    except ValueError as exc:
        print(f"theta=0 rejected={exc}")
    else:
        raise AssertionError("parallel infinite-line singularity was not rejected")

    assert abs(base - base256) < 3.0e-10
    assert abs(numeric0 / exact0 - 1.0) < 2.0e-12
    assert np.max(np.abs(slopes - 2.5)) < 0.003
    assert abs(values[-1] / approximations[-1] - 1.0) < 5.0e-5
    assert overlap_volume(2.0 * R, R, math.pi / 3.0) == 0.0
    print("ALL CHECKS PASSED")


if __name__ == "__main__":
    main()
```

## 6. Bounded conclusion

For isotropic equal-radius tubes about nonparallel lines in Euclidean R4, the entire relative-frame dependence collapses exactly to `1/|sin(theta)|`. Translation enters only through the common-normal disk-lens kernel `I(D,R)`. This gives a precise way to test a Hagalaz/UI relative rotation against finite-core contact geometry without treating `Q` as a scalar angle or inventing a force law.

The key methodological result is negative as well as constructive: matched-parameter 3-ball overlap, actual four-dimensional tube intersection, and finite-segment contact are distinct functionals. Relative rotation forces that distinction into the open, and the parallel limit proves that endpoint data cannot be discarded.
