# Mercer sandbox: unequal-radius contact law for nonparallel 4D tubes

Status: **executed GEN/DERIVED Euclidean geometry calculation**. This extends the equal-radius finite-core overlap kernel. It is a set-theoretic overlap result for modeled infinite line-tubes, not an H(s)H interaction law, constitutive law, or physical validation.

## Geometry and exact reduction

Let two carrier lines in Euclidean \(\mathbb R^4\) have nonzero angle \(\theta\), common-normal separation \(D\), and isotropic tube radii \(R_1,R_2>0\). For the nonparallel infinite-carrier model, the four-volume factors as

\[
V_4(D,R_1,R_2,\theta)=\frac{I(D;R_1,R_2)}{|\sin\theta|}.
\]

Choose one transverse coordinate from each carrier plane as \(x,y\). The remaining two coordinates form disks whose radii are

\[
a(x)=\sqrt{R_1^2-x^2},\qquad b(y)=\sqrt{R_2^2-y^2}.
\]

If \(A_{\rm lens}(a,b;D)\) is the exact intersection area of two disks of radii \(a,b\) at separation \(D\), then

\[
I(D;R_1,R_2)=\int_{-R_1}^{R_1}\int_{-R_2}^{R_2}
A_{\rm lens}(a(x),b(y);D)\,dy\,dx.
\]

Define penetration from first contact by

\[
p=R_1+R_2-D>0.
\]

## Contact asymptotic

For two planar disks with small overlap depth \(q\), the lens area is

\[
A_{\rm lens}=\frac{4\sqrt2}{3}
\sqrt{\frac{R_1R_2}{R_1+R_2}}\,q^{3/2}+O(q^{5/2}).
\]

Near the unique contact point, expansion of the transverse radii gives

\[
q=p-\frac{x^2}{2R_1}-\frac{y^2}{2R_2}+O(p^2),
\]

with support \(q>0\). Set

\[
x=\sqrt{2R_1p}\,u,\qquad y=\sqrt{2R_2p}\,v.
\]

The Jacobian is \(2p\sqrt{R_1R_2}\), and

\[
\int_{u^2+v^2<1}(1-u^2-v^2)^{3/2}\,du\,dv
=2\pi\int_0^1 r(1-r^2)^{3/2}dr=\frac{2\pi}{5}.
\]

Therefore

\[
\boxed{
I(R_1+R_2-p;R_1,R_2)
=K(R_1,R_2)p^{5/2}+O(p^{7/2})
}
\]

with the symmetric coefficient

\[
\boxed{
K(R_1,R_2)=\frac{16\pi\sqrt2}{15}
\frac{R_1R_2}{\sqrt{R_1+R_2}}
}.
\]

Thus

\[
V_4\sim \frac{16\pi\sqrt2}{15|\sin\theta|}
\frac{R_1R_2}{\sqrt{R_1+R_2}}p^{5/2}.
\]

Checks follow immediately: \(K(R_1,R_2)=K(R_2,R_1)\), \(K(\lambda R_1,\lambda R_2)=\lambda^{3/2}K(R_1,R_2)\), and at \(R_1=R_2=R\),

\[
K(R,R)=\frac{16\pi}{15}R^{3/2},
\]

recovering the previous equal-radius coefficient exactly.

## Executed numerical test

The exact disk-lens kernel was integrated after scaling \(x,y\propto\sqrt p\), which keeps the shrinking contact patch at order-one numerical size. The fixture used \(R_1=1.2\), radius ratios \(R_2/R_1\in\{0.25,0.5,1,2,4\}\), and \(\epsilon=p/\min(R_1,R_2)\). Reported ratios are \(I/(Kp^{5/2})\).

```text
Unequal-radius R4 nonparallel-tube contact kernel
R1=1.2; R2/R1 in (0.25, 0.5, 1.0, 2.0, 4.0)
epsilon=p/min(R1,R2); ratio=I/(K*p^(5/2))
rho       K                  ratio(eps=.1,.03,.01,.003,.001)
0.25  1.392997911731879e+00  0.973521952801 0.992067055624 0.997356659471 0.999207099426 0.999735709428
0.50  2.543254596043802e+00  0.972622483810 0.991786120369 0.997261952879 0.999178575853 0.999726190964
1.00  4.405046176930925e+00  0.966170943821 0.989830444356 0.996608146426 0.998982233235 0.999660724329
2.00  7.193410284585704e+00  0.972622483810 0.991786120369 0.997261952879 0.999178575853 0.999726190970
4.00  1.114398329385503e+01  0.973521952801 0.992067055624 0.997356659472 0.999207099430 0.999735709462
equal_radius_legacy_relative_error=2.220e-16
coefficient_symmetry_max_abs_error=0.000e+00
coefficient_homogeneity_max_relative_error=2.220e-16
tight_repeat_relative_delta=9.399e-13
equal_radius_correction_slopes=0.999828039,0.999946118
ALL_CHECKS_PASSED
```

At the smallest tested penetration, every exact/asymptotic ratio lies within \(3.40\times10^{-4}\) of unity. For equal radii, the residual \(1-I/(Kp^{5/2})\) has log-slopes \(0.999828\) and \(0.999946\), confirming the predicted relative \(O(p)\), hence absolute \(O(p^{7/2})\), correction. Tightening both nested quadrature tolerances changed the selected unequal-radius fixture by \(9.40\times10^{-13}\) relatively.

## Limits and negative controls

- \(p\downarrow0\): the overlap vanishes as \(p^{5/2}\).
- \(p\le0\): the exact overlap is zero; the positive-power asymptotic is not continued to negative \(p\).
- \(R_1=R_2\): the prior coefficient \((16\pi/15)R^{3/2}\) is recovered to floating-point precision.
- Swapping \(R_1,R_2\) leaves the coefficient and normalized exact data invariant.
- Uniform length scaling produces the required \(\lambda^{3/2}\) coefficient scaling and \(\lambda^4\) four-volume scaling after multiplication by \(p^{5/2}\).
- \(\theta\to0\) remains singular for infinite carriers; finite endpoint geometry is required there. This calculation does not overwrite the earlier finite-length crossover result.
- The exponent and amplitude characterize set overlap only. A penalty energy, hard constraint, or force requires an additional explicitly declared model.

## Full executable Python 3 source

```python
#!/usr/bin/env python3
"""Unequal-radius near-contact kernel for two nonparallel line tubes in R^4.

GEN/DERIVED Euclidean geometry only.  This computes set-theoretic overlap;
it is not an H(s)H interaction or constitutive law.
"""

from __future__ import annotations

import math
from scipy.integrate import quad


def segment_area(radius: float, height: float) -> float:
    """Area of a circular segment, stabilized for a shallow segment."""
    if height <= 0.0:
        return 0.0
    if height >= 2.0 * radius:
        return math.pi * radius * radius
    c = 1.0 - height / radius
    s = math.sqrt(max(0.0, 1.0 - c * c))
    theta = math.atan2(s, c)
    if theta < 0.08:
        t2 = theta * theta
        q = (2.0 / 3.0 + t2 * (-2.0 / 15.0 + t2 *
             (4.0 / 315.0 + t2 * (-2.0 / 2835.0 + t2 * 4.0 / 155925.0))))
        return radius * radius * theta**3 * q
    return radius * radius * (theta - s * c)


def disk_lens_area(r1: float, r2: float, d: float) -> float:
    """Exact intersection area of two disks, stable near external tangency."""
    if r1 <= 0.0 or r2 <= 0.0 or d >= r1 + r2:
        return 0.0
    if d <= abs(r1 - r2):
        return math.pi * min(r1, r2) ** 2
    a = (d*d + r1*r1 - r2*r2) / (2.0*d)
    return segment_area(r1, r1 - a) + segment_area(r2, r2 - (d - a))


def exact_kernel(r1: float, r2: float, p: float,
                 epsabs: float = 2e-13, epsrel: float = 2e-10) -> tuple[float, float]:
    """I(D;r1,r2), where D=r1+r2-p and V4=I/|sin(theta)|.

    The integration variables are scaled by sqrt(p), keeping the shrinking
    contact patch O(1) as p tends to zero.
    """
    if not (0.0 < p < 2.0 * min(r1, r2)):
        raise ValueError("require 0 < p < 2 min(r1,r2)")
    d = r1 + r2 - p
    sx = math.sqrt(2.0 * r1 * p)
    sy = math.sqrt(2.0 * r2 * p)
    umax = math.sqrt(1.0 - p / (2.0 * r1))

    def outer(u: float) -> float:
        x = sx * u
        a = math.sqrt(max(0.0, r1*r1 - x*x))
        threshold = d - a
        if threshold >= r2:
            return 0.0
        ymax = math.sqrt(max(0.0, r2*r2 - threshold*threshold))
        vmax = ymax / sy

        def inner(v: float) -> float:
            y = sy * v
            b = math.sqrt(max(0.0, r2*r2 - y*y))
            return disk_lens_area(a, b, d)

        val, _ = quad(inner, -vmax, vmax, epsabs=epsabs,
                      epsrel=epsrel, limit=180)
        return val

    val, err = quad(outer, -umax, umax, epsabs=epsabs,
                    epsrel=epsrel, limit=180)
    return sx * sy * val, sx * sy * err


def contact_coefficient(r1: float, r2: float) -> float:
    """K such that I(R1+R2-p)=K p^(5/2)+O(p^(7/2))."""
    return (16.0 * math.pi * math.sqrt(2.0) / 15.0
            * r1 * r2 / math.sqrt(r1 + r2))


def run() -> None:
    base = 1.2
    ratios = (0.25, 0.5, 1.0, 2.0, 4.0)
    epsilons = (1e-1, 3e-2, 1e-2, 3e-3, 1e-3)
    print("Unequal-radius R4 nonparallel-tube contact kernel")
    print("R1=1.2; R2/R1 in", ratios)
    print("epsilon=p/min(R1,R2); ratio=I/(K*p^(5/2))")
    print("rho       K                  ratio(eps=.1,.03,.01,.003,.001)")
    records = {}
    for rho in ratios:
        r1, r2 = base, base * rho
        k = contact_coefficient(r1, r2)
        vals = []
        for eps in epsilons:
            p = eps * min(r1, r2)
            exact, _ = exact_kernel(r1, r2, p)
            vals.append(exact / (k * p**2.5))
        records[rho] = vals
        print(f"{rho:4.2f}  {k:.15e}  " + " ".join(f"{x:.12f}" for x in vals))

    pairs = ((1.2, 0.7), (0.4, 2.1), (3.0, 1.1))
    symerr = max(abs(contact_coefficient(a, b)-contact_coefficient(b, a))
                 for a, b in pairs)
    scale = 3.7
    homerr = max(abs(contact_coefficient(scale*a, scale*b) /
                     (scale**1.5 * contact_coefficient(a, b)) - 1.0)
                 for a, b in pairs)

    legacy = 16.0 * math.pi / 15.0 * base**1.5
    equal_rel = abs(contact_coefficient(base, base) / legacy - 1.0)
    p = 1e-3 * base
    loose, _ = exact_kernel(base, 0.5*base, p, 2e-13, 2e-10)
    tight, _ = exact_kernel(base, 0.5*base, p, 2e-14, 2e-11)
    repeat_rel = abs(tight / loose - 1.0)

    ys = records[1.0][-3:]
    es = epsilons[-3:]
    slopes = [math.log((1.0-ys[i+1])/(1.0-ys[i])) /
              math.log(es[i+1]/es[i]) for i in range(2)]
    print(f"equal_radius_legacy_relative_error={equal_rel:.3e}")
    print(f"coefficient_symmetry_max_abs_error={symerr:.3e}")
    print(f"coefficient_homogeneity_max_relative_error={homerr:.3e}")
    print(f"tight_repeat_relative_delta={repeat_rel:.3e}")
    print("equal_radius_correction_slopes=" + ",".join(f"{x:.9f}" for x in slopes))

    assert equal_rel < 3e-15
    assert symerr < 1e-14
    assert homerr < 3e-15
    assert repeat_rel < 2e-8
    assert all(abs(records[r][-1] - 1.0) < 8e-4 for r in ratios)
    assert all(0.0 < x < 1.0 for vals in records.values() for x in vals)
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    run()
```
