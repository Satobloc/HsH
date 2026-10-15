# Two resolving slabs on a 4D ring: exact joint accessibility and a product-rule counterexample

**Run:** `REVROT3-19-20261015:10:s3`  
**Lane:** source-grounded Loom reconstruction; no authenticated participation by Loom is claimed.  
**Status:** calculation executed. The geometry is a `GEN/ACTIVE` readout-scaffold audit, not a physical interaction law or a promoted SAT primitive.

## Question

Loom's preceding run carefully separated projection, hyperplane intersection, and finite-slab accessibility. The next compression hazard is to store two marginal accessibility fractions and multiply them as though the resolving operations were independent. This calculation asks whether that is valid for two centered slabs cutting the same circular centerline in four dimensions.

## Model and assumptions

Let \(u,v\in\mathbb R^4\) be orthonormal and let the centerline be

\[
X(\phi)=R\bigl(u\cos\phi+v\sin\phi\bigr),\qquad 0\leq\phi<2\pi.
\]

This curve is only a parametrized centerline/readout scaffold. It is not identified with a finite-core worldtube or with H(s)H as a whole.

Resolving slab \(i\) has a unit normal \(n_i\), center offset zero, and half-thickness \(\delta_i\). A ball of isotropic support radius \(\rho\) around \(X(\phi)\) touches the slab exactly when

\[
|n_i\cdot X(\phi)|\leq \delta_i+\rho.
\]

Writing

\[
A_i=R\sqrt{(n_i\cdot u)^2+(n_i\cdot v)^2},\qquad
\theta_i=\operatorname{atan2}(n_i\cdot v,n_i\cdot u),
\]

gives

\[
n_i\cdot X(\phi)=A_i\cos(\phi-\theta_i).
\]

For \(A_i>0\), define the dimensionless accessibility ratio

\[
q_i=\frac{\delta_i+\rho}{A_i}.
\]

The calculation below uses equal \(q_1=q_2=q\) and relative projected-normal phase
\(\Delta=(\theta_2-\theta_1)\bmod\pi\). All lengths use one common arbitrary unit. The numerical fixture is

\[
R=1,qquad \delta_1=\delta_2=0.20,qquad \rho=0.05,qquad A_1=A_2=R,qquad q=0.25.
\]

This is an existence/accessibility test. It does **not** calculate overlap volume, coupling strength, detection probability, or particle identity.

## Exact derivation

For one slab, after shifting phase, accessibility is

\[
|\cos\phi|\leq q.
\]

For \(0<q<1\), put \(\alpha=\arcsin q\). In each period of length \(\pi\), the allowed set is the arc

\[
I=[\pi/2-\alpha,\,\pi/2+\alpha],
\]

whose length is \(2\alpha\). Therefore the marginal phase duty is

\[
p(q)=\frac{2\arcsin q}{\pi}.
\]

The second slab produces the same arc translated by \(\Delta\) on the circle \(\mathbb R/(\pi\mathbb Z)\). Hence the exact joint duty is

\[
J(q,\Delta)=\frac{\mu\bigl(I\cap(I+\Delta)\bigr)}{\pi},
\]

where \(\mu\) is circular arc length. Let

\[
d(\Delta)=\min(\Delta\bmod\pi,\,\pi-(\Delta\bmod\pi))\in[0,\pi/2].
\]

For this fixture \(q=0.25<1/\sqrt2\), so \(2\alpha<\pi/2\) and no wraparound overlap can coexist with the direct overlap. The formula reduces to

\[
\boxed{J(q,\Delta)=\frac{\max(0,,2\arcsin q-d(\Delta))}{\pi}}.
\]

Consequences:

1. Coincident projected normals, \(\Delta=0\): \(J=p\), not \(p^2\).
2. Once \(d(\Delta)\geq2\arcsin q\): \(J=0\), even though both marginals remain positive.
3. Averaging over a uniformly random relative phase does recover the product:

\[
\frac1\pi\int_0^\pi J(q,\Delta)\,d\Delta=p(q)^2.
\]

The last identity follows from translation invariance/Fubini: for any measurable set \(I\) on a circle of circumference \(\pi\), the mean intersection length of \(I\) and a uniformly translated copy is \(\mu(I)^2/\pi\). Thus the product rule is valid only after adding and justifying a uniform relative-phase ensemble. It is not valid for a fixed two-slab geometry.

For the fixture,

\[
\alpha=\arcsin(0.25)=0.252680255142\ \text{rad},
\]

\[
p=0.160861246510,\qquad p^2=0.025876340629.
\]

At \(\Delta=0\), the product underestimates the exact joint duty by

\[
0.160861246510-0.025876340629=0.134984905881,
\]

a factor \(J/p^2=1/p\approx6.216\). At \(\Delta=\pi/2\), the product instead predicts \(0.025876340629\) while the exact joint duty is zero.

## Executed numerical output

The exact circular-interval algorithm was checked against a deterministic midpoint count using \(N=1{,}000{,}003\) phases. With at most four relevant interval boundaries, a conservative duty-fraction discretization bound is \(4/N=4.000\times10^{-6}\). The independently integrated orientation average used 200,000 midpoint values of \(\Delta\).

```text
R=1.000000 delta=0.200000 rho=0.050000 q=0.250000000000
marginal=0.160861246510 product=0.025876340629
delta/pi,exact_joint,midpoint_joint,exact_minus_product
0.000000000000,0.160861246510,0.160861517415,+0.134984905881
0.100000000000,0.060861246510,0.060861817415,+0.034984905881
0.150000000000,0.010861246510,0.010860967417,-0.015015094119
0.160861246510,0.000000000000,0.000000000000,-0.025876340629
0.200000000000,0.000000000000,0.000000000000,-0.025876340629
0.250000000000,0.000000000000,0.000000000000,-0.025876340629
0.500000000000,0.000000000000,0.000000000000,-0.025876340629
orientation_average=0.025876340627
average_minus_product=-1.554e-12
midpoint_boundary_bound=4.000e-06
controls=PASS
```

The largest displayed exact-versus-midpoint difference is \(5.71\times10^{-7}\), within the stated deterministic bound. The orientation-averaged result differs from \(p^2\) by \(1.554\times10^{-12}\).

## Limiting cases and negative controls

- \(q\to0\): marginal and joint duties tend to zero.
- \(q\geq1\): the corresponding slab is accessible at every phase; if only slab 1 saturates, \(J=p(q_2)\).
- \(\Delta=0\): identical accessibility sets give \(J=p\), checking idempotence.
- \(q=0.25,\Delta=\pi/2\): two individually nonempty accessibility sets have empty joint support. This is the product-rule negative control.
- Scaling \((R,\delta,\rho)\mapsto\lambda(R,\delta,\rho)\) with fixed projected-normal amplitude ratio leaves \(q\) and every duty unchanged; the code checks \(\lambda=7.3\).
- Uniformly averaging the relative phase recovers \(p^2\), isolating the additional assumption needed for independence.

## Result and tagging consequence

The fixed-geometry product rule is rigorously false. A compact record containing only the two marginal duties is insufficient to recover joint accessibility; it must also preserve relative projected-normal phase (or the full circular accessibility sets). Recommended relation:

`TWO-SLAB-JOINT-ACCESSIBILITY -> REQUIRES(INDIVIDUAL q_i, RELATIVE PROJECTED-NORMAL PHASE, OFFSET DATA)`.

`PRODUCT OF MARGINAL DUTIES -> VALID ONLY FOR AN EXPLICIT UNIFORM RELATIVE-PHASE ENSEMBLE`.

Within the SAT/H(s)H hierarchy this remains a calculation on a resolving/readout scaffold. It supplies no physical interaction, probability, or ontology by itself.

## Full runnable Python 3 source

```python
#!/usr/bin/env python3
"""Exact two-slab accessibility on a 4D circular centerline.

Model layer: a parametrized centerline X(phi)=R(u cos phi+v sin phi).
Readout scaffold: a finite-core ball of radius rho is accessible to centered
slab i when |n_i dot X(phi)| <= delta_i+rho.  This computes phase measure,
not interaction strength, probability, or a full worldtube cross-section.
"""

from math import acos, asin, pi


def circular_arc_segments(center, halfwidth, period=pi):
    """Return non-wrapping segments for a closed arc on a periodic circle."""
    if halfwidth <= 0.0:
        return []
    if 2.0 * halfwidth >= period:
        return [(0.0, period)]
    left = (center - halfwidth) % period
    right = (center + halfwidth) % period
    if left <= right:
        return [(left, right)]
    return [(0.0, right), (left, period)]


def intersection_length(segments_a, segments_b):
    total = 0.0
    for a0, a1 in segments_a:
        for b0, b1 in segments_b:
            total += max(0.0, min(a1, b1) - max(a0, b0))
    return total


def marginal_duty(q):
    """Fraction of phase satisfying |cos(phi)| <= q."""
    if q <= 0.0:
        return 0.0
    if q >= 1.0:
        return 1.0
    return 2.0 * asin(q) / pi


def joint_duty(q1, q2, delta_phase):
    """Exact joint fraction for |cos phi|<=q1 and |cos(phi-delta)|<=q2."""
    if q1 <= 0.0 or q2 <= 0.0:
        return 0.0
    if q1 >= 1.0:
        return marginal_duty(q2)
    if q2 >= 1.0:
        return marginal_duty(q1)
    a1, a2 = asin(q1), asin(q2)
    s1 = circular_arc_segments(pi / 2.0, a1)
    s2 = circular_arc_segments(pi / 2.0 + delta_phase, a2)
    return intersection_length(s1, s2) / pi


def midpoint_joint(q1, q2, delta_phase, samples=1_000_003):
    count = 0
    for k in range(samples):
        phi = 2.0 * pi * (k + 0.5) / samples
        from math import cos
        if abs(cos(phi)) <= q1 and abs(cos(phi - delta_phase)) <= q2:
            count += 1
    return count / samples


def orientation_average(q1, q2, steps=200_000):
    # Midpoint integration over one relative-phase period [0, pi).
    return sum(joint_duty(q1, q2, pi * (k + 0.5) / steps)
               for k in range(steps)) / steps


def main():
    # Length units are arbitrary but common: R=1, slab half-thickness 0.20,
    # finite-core support radius 0.05, so q=(delta+rho)/R=0.25.
    R, slab_halfwidth, rho = 1.0, 0.20, 0.05
    q = (slab_halfwidth + rho) / R
    p = marginal_duty(q)
    print(f"R={R:.6f} delta={slab_halfwidth:.6f} rho={rho:.6f} q={q:.12f}")
    print(f"marginal={p:.12f} product={p*p:.12f}")
    print("delta/pi,exact_joint,midpoint_joint,exact_minus_product")
    samples = 1_000_003
    for frac in (0.0, 0.10, 0.15, 0.160861246510, 0.20, 0.25, 0.50):
        d = frac * pi
        exact = joint_duty(q, q, d)
        numeric = midpoint_joint(q, q, d, samples)
        print(f"{frac:.12f},{exact:.12f},{numeric:.12f},{exact-p*p:+.12f}")

    avg = orientation_average(q, q)
    print(f"orientation_average={avg:.12f}")
    print(f"average_minus_product={avg-p*p:+.3e}")
    print(f"midpoint_boundary_bound={4/samples:.3e}")

    # Limiting cases and negative controls.
    assert abs(joint_duty(q, q, 0.0) - p) < 1e-15
    assert abs(joint_duty(q, q, pi / 2.0)) < 1e-15
    assert joint_duty(0.0, q, 0.0) == 0.0
    assert abs(joint_duty(1.0, q, 0.37) - p) < 1e-15
    scale = 7.3
    q_scaled = (scale * slab_halfwidth + scale * rho) / (scale * R)
    assert abs(q_scaled - q) < 1e-15
    assert abs(avg - p * p) < 2e-10
    print("controls=PASS")


if __name__ == "__main__":
    main()
```
