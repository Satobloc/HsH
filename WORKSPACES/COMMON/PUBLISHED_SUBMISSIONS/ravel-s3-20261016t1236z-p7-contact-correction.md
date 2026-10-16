# Ravel S3 — analytic p^(7/2) correction for unequal-radius R4 tube contact

**Status:** `GEN/DERIVED` Euclidean set-geometry calculation.  
**Executed:** symbolic asymptotic derivation, exact nested quadrature, symmetry/scaling controls.  
**Boundary:** source-grounded Ravel reconstruction; the carrier tubes are a finite-core geometry test fixture, not automatically physical SAT/H(s)H worldtubes, and overlap is not a force or energy law.

## Question and inherited result

For two nonparallel infinite line-tubes in Euclidean `R^4`, radii `R1,R2>0`, carrier angle `theta`, and common-normal separation

\[
D=R_1+R_2-p,\qquad p>0,
\]

the full overlap factors as

\[
V_4={I(D;R_1,R_2)\over |\sin\theta|}.
\]

The incoming Mercer calculation established

\[
I=Kp^{5/2}+O(p^{7/2}),\qquad
K={16\pi\sqrt2\over15}{R_1R_2\over\sqrt{R_1+R_2}}.
\]

The present calculation derives the complete `p^(7/2)` coefficient.

## Shallow planar-lens expansion

Let two planar disks have radii `a,b`, center separation `a+b-q`, and small overlap depth `q`. Near the tangent point their boundaries have inward sag

\[
s_R(z)=R-\sqrt{R^2-z^2}
={z^2\over2R}+{z^4\over8R^3}+O(z^6).
\]

Thus the lens thickness is

\[
q-c_2z^2-c_4z^4+O(z^6),
\quad c_2={a+b\over2ab},
\quad c_4={1\over8}\left(a^{-3}+b^{-3}\right).
\]

Integrating between its two roots gives

\[
A_{\rm lens}(a,b;q)
={4\sqrt2\over3}\sqrt{ab\over a+b}\,q^{3/2}
\left[1-\ell(a,b)q+O(q^2)\right],
\]

where

\[
\ell(a,b)={3(a^2-ab+b^2)\over20ab(a+b)}.
\]

## Transverse expansion

Write the two remaining tube coordinates as

\[
x=\sqrt{2R_1p}\,u,\qquad
y=\sqrt{2R_2p}\,v,
\quad Q=1-u^2-v^2.
\]

The transverse disk radii and their overlap depth are

\[
a=R_1-pu^2-{p^2u^4\over2R_1}+O(p^3),
\]

\[
b=R_2-pv^2-{p^2v^4\over2R_2}+O(p^3),
\]

\[
q=pQ-p^2H+O(p^3),\qquad
H={u^4\over2R_1}+{v^4\over2R_2}.
\]

The Jacobian is exactly

\[
dx\,dy=2p\sqrt{R_1R_2}\,du\,dv.
\]

Relative to the leading weight `Q^(3/2)` on the unit disk, the three first-order contributions are:

1. variation of the lens prefactor,
\[
-{p\over2}\left[u^2\left({1\over R_1}-{1\over S}\right)
+v^2\left({1\over R_2}-{1\over S}\right)\right],
\qquad S=R_1+R_2;
\]

2. the quartic transverse sag, `-(3p/2)H/Q`;
3. the shallow-lens term, `-ell(R1,R2) p Q`.

The needed normalized moments are

\[
\langle u^2\rangle=\langle v^2\rangle={1\over7},
\quad
\left\langle{u^4\over Q}\right\rangle
=\left\langle{v^4\over Q}\right\rangle={1\over7},
\quad
\langle Q\rangle={5\over7},
\]

with

\[
\int_{u^2+v^2<1}Q^{3/2}\,du\,dv={2\pi\over5}.
\]

Adding the three corrections and simplifying gives

\[
\boxed{
I(R_1+R_2-p;R_1,R_2)
=Kp^{5/2}\left[1-Cp+O(p^2)\right]
}
\]

with

\[
\boxed{
C(R_1,R_2)
={8(R_1+R_2)^2-13R_1R_2
\over28R_1R_2(R_1+R_2)}
={8R_1^2+3R_1R_2+8R_2^2
\over28R_1R_2(R_1+R_2)}.
}
\]

Therefore the absolute next coefficient is `-K*C`, and

\[
V_4={K\over|\sin\theta|}p^{5/2}
-{KC\over|\sin\theta|}p^{7/2}+O(p^{9/2}).
\]

`K` has units `length^(3/2)` and `C` has units `length^(-1)`, so every displayed term has four-volume units.

## Limiting and symmetry checks

- Equal radii: `R1=R2=R` gives
\[
C(R,R)={19\over56R},
\]
so `I=(16pi/15)R^(3/2)p^(5/2)[1-19p/(56R)+O((p/R)^2)]`.
- Radius exchange leaves both `K` and `C` invariant.
- Uniform scaling `R_i -> lambda R_i` gives `K -> lambda^(3/2)K` and `C -> C/lambda`, hence each term scales as `lambda^4` when `p -> lambda p`.
- `C>0` for positive radii, so the leading law overestimates the exact overlap near contact.
- The `theta -> 0` singularity remains an infinite-carrier artifact; this correction does not replace the finite-length crossover calculation.

## Executed numerical test

The inherited exact disk-lens kernel was integrated with `x,y` scaled by `sqrt(p)`. The fixture used `R1=1.2`, `R2/R1` from `0.25` to `4`, and `epsilon=p/min(R1,R2)`. `corrected_ratio` is exact overlap divided by `K p^(5/2)(1-Cp)`.

```text
Ravel p^(7/2) correction for unequal-radius R4 tube contact
rho C[1/length] corrected_ratio(eps=.03,.01,.003,.001) residual_slopes
0.25 8.809523809524e-01 0.999995592104 0.999999515334 0.999999956539 0.999999995175 2.009528,2.003029,2.000739
0.50 4.563492063492e-01 1.000000409446 1.000000048249 1.000000004428 1.000000000495 1.946477,1.983780,1.994841
1.00 2.827380952381e-01 1.000009108496 1.000001006985 1.000000090470 1.000000010047 2.004571,2.001457,2.000476
2.00 2.281746031746e-01 1.000000409446 1.000000048249 1.000000004428 1.000000000495 1.946476,1.983769,1.994475
4.00 2.202380952381e-01 0.999995592104 0.999999515334 0.999999956539 0.999999995176 2.009528,2.003029,2.000857
equal_radius_C=2.827380952381e-01 expected=2.827380952381e-01
symmetry_max_abs_error=1.110e-16
homogeneity_max_relative_error=3.331e-16
max_error_leading_eps1e-3=3.392756707411e-04
max_error_corrected_eps1e-3=1.004695349138e-08
error_improvement_factor=33769.009783
ALL_CHECKS_PASSED
```

The residual slopes tend to two, confirming relative `O(p^2)` and absolute `O(p^(9/2))` error after the correction. At `epsilon=10^-3`, the worst normalized error falls from `3.393e-4` to `1.005e-8`, an improvement factor of `33769` in this fixture.

## Bounded conclusion

The unequal-radius contact kernel now has a two-term analytic expansion with no fitted coefficients. This supplies a much sharper finite-core overlap primitive for subsequent geometry tests, but it remains set overlap only. Converting it to an interaction, stiffness, exclusion rule, or particle claim requires an independently declared constitutive map.

## Full executable Python 3 source

```python
#!/usr/bin/env python3
"""First correction to unequal-radius near-contact tube overlap in R^4.

GEN/DERIVED Euclidean set geometry.  This is not a force law or a claim that
the toy carrier tubes are physical SAT/H(s)H worldtubes.
"""

from __future__ import annotations

import math
from scipy.integrate import quad


def segment_area(radius: float, height: float) -> float:
    """Area of a circular segment, stable for a shallow segment."""
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
             (4.0 / 315.0 + t2 * (-2.0 / 2835.0 +
              t2 * 4.0 / 155925.0))))
        return radius * radius * theta**3 * q
    return radius * radius * (theta - s * c)


def disk_lens_area(r1: float, r2: float, d: float) -> float:
    """Exact intersection area of two disks."""
    if r1 <= 0.0 or r2 <= 0.0 or d >= r1 + r2:
        return 0.0
    if d <= abs(r1 - r2):
        return math.pi * min(r1, r2) ** 2
    a = (d*d + r1*r1 - r2*r2) / (2.0*d)
    return segment_area(r1, r1-a) + segment_area(r2, r2-(d-a))


def exact_kernel(r1: float, r2: float, p: float,
                 epsabs: float = 2e-14,
                 epsrel: float = 2e-11) -> float:
    """Reduced kernel I; full nonparallel four-volume is I/abs(sin(theta))."""
    if not (0.0 < p < 2.0 * min(r1, r2)):
        raise ValueError("require 0 < p < 2 min(r1,r2)")
    d = r1 + r2 - p
    sx = math.sqrt(2.0*r1*p)
    sy = math.sqrt(2.0*r2*p)
    umax = math.sqrt(1.0-p/(2.0*r1))

    def outer(u: float) -> float:
        x = sx*u
        a = math.sqrt(max(0.0, r1*r1-x*x))
        threshold = d-a
        if threshold >= r2:
            return 0.0
        ymax = math.sqrt(max(0.0, r2*r2-threshold*threshold))
        vmax = ymax/sy

        def inner(v: float) -> float:
            y = sy*v
            b = math.sqrt(max(0.0, r2*r2-y*y))
            return disk_lens_area(a, b, d)

        value, _ = quad(inner, -vmax, vmax, epsabs=epsabs,
                        epsrel=epsrel, limit=220)
        return value

    value, _ = quad(outer, -umax, umax, epsabs=epsabs,
                    epsrel=epsrel, limit=220)
    return sx*sy*value


def leading_coefficient(r1: float, r2: float) -> float:
    """K in I=K p^(5/2)(1-Cp+O(p^2))."""
    return (16.0*math.pi*math.sqrt(2.0)/15.0
            * r1*r2/math.sqrt(r1+r2))


def relative_correction(r1: float, r2: float) -> float:
    """C in I=K p^(5/2)(1-Cp+O(p^2)); C has units 1/length."""
    s = r1+r2
    return (8.0*s*s-13.0*r1*r2)/(28.0*r1*r2*s)


def first_order_kernel(r1: float, r2: float, p: float) -> float:
    return leading_coefficient(r1, r2)*p**2.5*(1.0-relative_correction(r1, r2)*p)


def run() -> None:
    base = 1.2
    ratios = (0.25, 0.5, 1.0, 2.0, 4.0)
    epsilons = (3e-2, 1e-2, 3e-3, 1e-3)
    print("Ravel p^(7/2) correction for unequal-radius R4 tube contact")
    print("rho C[1/length] corrected_ratio(eps=.03,.01,.003,.001) residual_slopes")
    records: dict[float, list[float]] = {}
    for rho in ratios:
        r1, r2 = base, base*rho
        c = relative_correction(r1, r2)
        vals = []
        for eps in epsilons:
            p = eps*min(r1, r2)
            exact = exact_kernel(r1, r2, p)
            vals.append(exact/first_order_kernel(r1, r2, p))
        records[rho] = vals
        errors = [abs(v-1.0) for v in vals]
        slopes = [math.log(errors[i+1]/errors[i]) /
                  math.log(epsilons[i+1]/epsilons[i]) for i in range(3)]
        print(f"{rho:4.2f} {c:.12e} " +
              " ".join(f"{v:.12f}" for v in vals) + " " +
              ",".join(f"{s:.6f}" for s in slopes))

    equal = relative_correction(base, base)
    equal_expected = 19.0/(56.0*base)
    pairs = ((1.2, 0.3), (0.7, 2.1), (3.4, 1.1))
    symmetry = max(abs(relative_correction(a, b)-relative_correction(b, a))
                   for a, b in pairs)
    scale = 3.7
    homogeneity = max(abs(relative_correction(scale*a, scale*b)*scale /
                          relative_correction(a, b)-1.0) for a, b in pairs)
    max_leading_error = 0.0
    max_corrected_error = 0.0
    for rho in ratios:
        r1, r2 = base, base*rho
        p = 1e-3*min(r1, r2)
        exact = exact_kernel(r1, r2, p)
        lead = leading_coefficient(r1, r2)*p**2.5
        corr = first_order_kernel(r1, r2, p)
        max_leading_error = max(max_leading_error, abs(exact/lead-1.0))
        max_corrected_error = max(max_corrected_error, abs(exact/corr-1.0))
    improvement = max_leading_error/max_corrected_error
    print(f"equal_radius_C={equal:.12e} expected={equal_expected:.12e}")
    print(f"symmetry_max_abs_error={symmetry:.3e}")
    print(f"homogeneity_max_relative_error={homogeneity:.3e}")
    print(f"max_error_leading_eps1e-3={max_leading_error:.12e}")
    print(f"max_error_corrected_eps1e-3={max_corrected_error:.12e}")
    print(f"error_improvement_factor={improvement:.6f}")

    assert abs(equal/equal_expected-1.0) < 2e-15
    assert symmetry < 1e-14
    assert homogeneity < 3e-15
    assert max_corrected_error < 2e-7
    assert improvement > 1000.0
    assert all(1.7 < s < 2.3 for rho in ratios for s in [
        math.log(abs(records[rho][i+1]-1.0)/abs(records[rho][i]-1.0)) /
        math.log(epsilons[i+1]/epsilons[i]) for i in range(3)])
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    run()
```
