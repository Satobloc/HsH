# Kestrel — finite-core constitutive contact energy for the torus meridian

**Status:** GEN/DERIVED and EXECUTED Euclidean geometry. This is a constitutive
toy built from Morrow's torus-meridian fixture, not an established H(s)H force
law or evidence that a modeled worldtube has this material response.

## Geometry and assumptions

Morrow's carrier has a normal-plane material disk of radius
(a=0.10\,\mathrm m). Its meridian centre follows a circle of radius
(e=0.30\,\mathrm m), translated by (eta) along one normal coordinate. The
distance between the carrier centre and the meridian centre at phase (phi) is

\[
d(\phi;\eta)=\sqrt{e^2+\eta^2-2e\eta\cos\phi}.
\]

Morrow's zero-width curve contacts the core when
(min_\phi d=|e-\eta|\le a), hence (eta\in[0.20,0.40]\,\mathrm m).
To define a genuinely finite-core contact quantity, give the probe a circular
cross-section of radius (b=0.05\,\mathrm m). Two cross-sections overlap iff
(d<a+b), broadening the contact interval to

\[
e-(a+b)<\eta<e+(a+b),qquad 0.15<\eta<0.45\ \mathrm m.
\]

For (|a-b|<d<a+b), the exact overlap area of the two disks is

\[
\begin{aligned}
A_\cap(d)={}&a^2\cos^{-1}\!\left(\frac{d^2+a^2-b^2}{2da}\right)
+b^2\cos^{-1}\!\left(\frac{d^2+b^2-a^2}{2db}\right)\\
&-\frac12\sqrt{(-d+a+b)(d+a-b)(d-a+b)(d+a+b)}.
\end{aligned}
\]

The remaining branches are

\[
A_\cap(d)=
\begin{cases}
\pi\min(a,b)^2,&d\le|a-b|,\\
0,&d\ge a+b.
\end{cases}
\]

Introduce an explicitly stipulated overlap-energy density
(gamma=1\,\mathrm{J,m^{-3}}). The finite-core contact energy is

\[
U(\eta)=\gamma e\int_0^{2\pi}A_\cap(d(\phi;\eta))\,d\phi.
\]

This has joule units because (A_\cap e,d\phi) is an overlap volume. It is
independent of the meridian winding number: winding tells whether the ideal
centre curve encloses the carrier centre, whereas (U) measures finite-core
material overlap.

In the partial-contact regime, overlap is supported on
(|\phi|<\phi_c), with

\[
\phi_c(\eta)=\cos^{-1}\!\left(
\frac{e^2+\eta^2-(a+b)^2}{2e\eta}\right),
\]

so the contacted centreline length is (2e\phi_c). Numerical integration uses
composite Simpson quadrature only over this support.

## Results

The maximum is

\[
\boxed{\eta_*=0.285134135145\ \mathrm m},\qquad
\boxed{U(\eta_*)=1.547672465034\times10^{-3}\ \mathrm J}.
\]

It lies slightly below (eta=e=0.30\,\mathrm m); the energy at (eta=e) is
(1.528125100251\times10^{-3}\,\mathrm J). Thus a closest-point penalty alone
would miss the integrated overlap optimum.

Near the lower tangency, with
(delta=\eta-[e-(a+b)]\downarrow0), the executed ratios approach

\[
\frac{U}{\delta^2}\to 0.314\ \mathrm{J,m^{-2}},
\]

consistent with quadratic onset: the disk-lens area scales as
(delta^{3/2}) while angular support scales as (delta^{1/2}). Hence the
contact force (-dU/d\eta) turns on continuously rather than jumping.

The thin-probe control gives (U(e)/b^2\to0.631\,\mathrm{J,m^{-2}}), so at
fixed (gamma), (U\to0) as (b\to0). The topological centre-curve contact
can remain well-defined in that limit, but a finite overlap-volume energy
cannot: the two objects answer different questions.

The quadrature difference between 8,192 and 16,384 Simpson panels at the
maximum was (7.16\times10^{-15}\,\mathrm J). This is a numerical convergence
indicator, not an uncertainty on the stipulated geometry or on (gamma).

## Executed output

```text
FINITE-CORE DISK-OVERLAP CONTACT ENERGY
e=0.300000m a=0.100000m b=0.050000m gamma=1.000000J/m^3
contact_band_eta=(0.150000000000,0.450000000000)m
eta_m half_angle_rad support_length_m energy_J
0.000000 0.000000000000 0.000000000000 0.000000000000e+00
0.100000 0.000000000000 0.000000000000 0.000000000000e+00
0.140000 0.000000000000 0.000000000000 0.000000000000e+00
0.150000 0.000000000000 0.000000000000 0.000000000000e+00
0.160000 0.246421026294 0.147852615777 2.930629871152e-05
0.200000 0.460493425059 0.276296055035 5.493659898433e-04
0.250000 0.522314821806 0.313388893084 1.399324193411e-03
0.300000 0.505360510284 0.303216306170 1.528125100251e-03
0.350000 0.439975954791 0.263985572875 1.180838943743e-03
0.400000 0.324166105716 0.194499663430 3.876367065218e-04
0.440000 0.148357802319 0.089014681392 1.765824952100e-05
0.450000 0.000000000000 0.000000000000 0.000000000000e+00
0.460000 0.000000000000 0.000000000000 0.000000000000e+00
0.500000 0.000000000000 0.000000000000 0.000000000000e+00
maximum_eta_m=0.285134135145
maximum_energy_J=1.547672465034e-03
quadrature_delta_J=7.156168019273e-15
lower_onset_delta_m energy_J energy_over_delta2_J_per_m2
1.0e-03 3.119851700967e-07 3.119851700967e-01
5.0e-04 7.826758285538e-08 3.130703314215e-01
2.0e-04 1.254892948228e-08 3.137232370570e-01
1.0e-04 3.139411752765e-09 3.139411752765e-01
thin_probe_b_m energy_at_eta_e_J energy_over_b2_J_per_m2
0.05000 1.528125100093e-03 6.112500400372e-01
0.02500 3.914931241000e-04 6.263889985600e-01
0.01250 9.844577138313e-05 6.300529368520e-01
0.00625 2.464695226340e-05 6.309619779431e-01
controls=PASS
```

The last printed digits of (U(e)) differ between the fixture table and the
thin-probe table because those calls use 8,192 and 16,384 panels; their absolute
difference is (1.58\times10^{-13}\,\mathrm J).

## Full executable Python

```python
#!/usr/bin/env python3
"""Finite-core contact energy for a displaced torus meridian.

GEN/DERIVED Euclidean constitutive toy.  It is not a force law for H(s)H.
Python 3 standard library only.
"""

from math import acos, cos, pi, sqrt

E = 0.30       # meridian centre radius, m
A = 0.10       # carrier-core cross-section radius, m
B = 0.05       # probe-tube cross-section radius, m
GAMMA = 1.0    # overlap energy density, J/m^3


def disk_overlap(d: float, a: float = A, b: float = B) -> float:
    """Exact area of overlap of disks of radii a,b at centre distance d."""
    if d >= a + b:
        return 0.0
    if d <= abs(a - b):
        return pi * min(a, b) ** 2
    x = (d*d + a*a - b*b) / (2.0*d*a)
    y = (d*d + b*b - a*a) / (2.0*d*b)
    # Clamp only roundoff at the analytic domain boundary.
    x = max(-1.0, min(1.0, x))
    y = max(-1.0, min(1.0, y))
    rad = (-d+a+b)*(d+a-b)*(d-a+b)*(d+a+b)
    return a*a*acos(x) + b*b*acos(y) - 0.5*sqrt(max(0.0, rad))


def centre_distance(phi: float, eta: float, e: float = E) -> float:
    """Distance from core centre to translated meridian centre at angle phi."""
    return sqrt(e*e + eta*eta - 2.0*e*eta*cos(phi))


def simpson(f, lo: float, hi: float, n: int) -> float:
    assert n > 0 and n % 2 == 0
    h = (hi - lo) / n
    return h / 3.0 * (
        f(lo) + f(hi)
        + 4.0 * sum(f(lo + j*h) for j in range(1, n, 2))
        + 2.0 * sum(f(lo + j*h) for j in range(2, n, 2))
    )


def contact_half_angle(eta: float, e: float = E,
                       reach: float = A+B) -> float:
    """Half angular support where d(phi)<reach, in radians."""
    if eta == 0.0:
        return pi if e < reach else 0.0
    if e + eta <= reach:
        return pi
    if abs(e - eta) >= reach - 1e-15:
        return 0.0
    c = (e*e + eta*eta - reach*reach) / (2.0*e*eta)
    return acos(max(-1.0, min(1.0, c)))


def energy(eta: float, n: int = 8192, a: float = A, b: float = B,
           gamma: float = GAMMA) -> float:
    """U=gamma integral overlap_area[d(phi)] e dphi, in joules."""
    half = contact_half_angle(eta, reach=a+b)
    if half == 0.0:
        return 0.0
    integrand = lambda phi: disk_overlap(centre_distance(phi, eta), a, b)
    return gamma * E * 2.0 * simpson(integrand, 0.0, half, n)


def golden_max(lo: float, hi: float, iterations: int = 90):
    ratio = (sqrt(5.0) - 1.0) / 2.0
    x1, x2 = hi-ratio*(hi-lo), lo+ratio*(hi-lo)
    f1, f2 = energy(x1, 4096), energy(x2, 4096)
    for _ in range(iterations):
        if f1 < f2:
            lo, x1, f1 = x1, x2, f2
            x2 = lo + ratio*(hi-lo)
            f2 = energy(x2, 4096)
        else:
            hi, x2, f2 = x2, x1, f1
            x1 = hi - ratio*(hi-lo)
            f1 = energy(x1, 4096)
    eta = (lo + hi) / 2.0
    return eta, energy(eta, 16384)


def main() -> None:
    onset_lo, onset_hi = E-(A+B), E+(A+B)
    print("FINITE-CORE DISK-OVERLAP CONTACT ENERGY")
    print(f"e={E:.6f}m a={A:.6f}m b={B:.6f}m gamma={GAMMA:.6f}J/m^3")
    print(f"contact_band_eta=({onset_lo:.12f},{onset_hi:.12f})m")
    print("eta_m half_angle_rad support_length_m energy_J")
    fixtures = (0.0, 0.10, 0.14, 0.15, 0.16, 0.20, 0.25,
                0.30, 0.35, 0.40, 0.44, 0.45, 0.46, 0.50)
    for eta in fixtures:
        half = contact_half_angle(eta)
        print(f"{eta:.6f} {half:.12f} {2*E*half:.12f} {energy(eta):.12e}")

    eta_star, u_star = golden_max(onset_lo, onset_hi)
    print(f"maximum_eta_m={eta_star:.12f}")
    print(f"maximum_energy_J={u_star:.12e}")

    # Quadrature uncertainty estimate from n versus 2n Simpson grids.
    u8 = energy(eta_star, 8192)
    u16 = energy(eta_star, 16384)
    print(f"quadrature_delta_J={abs(u16-u8):.12e}")

    # Onset scaling U ~ C delta^2 at the lower tangency.
    print("lower_onset_delta_m energy_J energy_over_delta2_J_per_m2")
    for delta in (1e-3, 5e-4, 2e-4, 1e-4):
        u = energy(onset_lo + delta, 16384)
        print(f"{delta:.1e} {u:.12e} {u/delta**2:.12e}")

    # Thin-probe control: fixed gamma makes the energy vanish as b -> 0.
    print("thin_probe_b_m energy_at_eta_e_J energy_over_b2_J_per_m2")
    for b in (0.05, 0.025, 0.0125, 0.00625):
        u = energy(E, 16384, b=b)
        print(f"{b:.5f} {u:.12e} {u/b**2:.12e}")

    # Negative controls and numerical consistency.
    assert energy(onset_lo) < 1e-20
    assert energy(onset_hi) < 1e-20
    assert energy(0.0) == 0.0
    assert energy(0.50) == 0.0
    assert u_star > energy(E)
    assert abs(u16-u8) < 2e-13
    assert abs(disk_overlap(0.0) - pi*B*B) < 1e-15
    assert disk_overlap(A+B) == 0.0
    print("controls=PASS")


if __name__ == "__main__":
    main()
```

## Bounded conclusion

The contact penalty supplies a continuous, finite-core constitutive observable
where the winding index supplies only topological classification. It does not
stabilize a codimension-two carrier by itself: with positive (gamma), it merely
penalizes overlap and favors separation. Stabilization would still require a
competing term—tension, bending, confinement, or an imposed boundary—and that
next term must be independently specified rather than inferred from winding.
