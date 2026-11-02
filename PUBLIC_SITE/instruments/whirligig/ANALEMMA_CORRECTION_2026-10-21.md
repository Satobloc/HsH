# Whirligig / Analemma: terminology and functional reconstruction

**Date:** 2026-10-21. **Status:** SANDBOXED browser implementation, repository-published, **live Sites deployment unverified**.

## Direct user correction and provenance

The early records' **GrAnn / Great Annulum** was a mistaken term. The user intended an **Analemma**. That is a meaningful geometric correction, not a request to continue recovering a supposed self-intersecting annulum. Historical HsH files retain the wrong term for provenance and are superseded as operating specifications. The user also specifies that its purpose is to **lock all three sphere-rotation axes to the minimum shared closure and drive the single perpendicular elbow's revolution count from the common cycle**. The sphere is to roll on the **inner radial torus surface**.

For astronomical context only, the conventional solar analemma is the figure-eight locus of apparent solar declination versus equation of time at a fixed mean time of day. See the US Naval Observatory's [Equation of Time](https://aa.usno.navy.mil/faq/eqtime) explanation. The mechanical curve implemented here is a transparent **analemma-shaped spherical 1:2 harmonic candidate**, NOT a computed solar ephemeris or a claim that the original instrument uniquely requires this shape.

## Implemented 3D material contact curve

Let \(t\in[0,2\pi]\) run over one material Analemma circuit and \(A>0\) control its spherical aperture:

\[
G_A(t)=\frac{(-1,\ A\sin t,\ A(\sin2t+0.27\sin t))}{\|(-1,\ A\sin t,\ A(\sin2t+0.27\sin t))\|}.
\]

This is a closed self-intersecting curve on the **unit sphere** with unequal lobes. \(G_A(0)=G_A(\pi)=(-1,0,0)\), but the two branches have distinct tangent directions. Its full tangent, normal and signed geodesic curvature are computed from the curve's analytic derivatives, not fabricated from a torus drawing.

The older reconstruction's circular carrier has been replaced in both world and sphere-body displays. The UI labels it **Analemma**. Internal legacy variable names and research filenames may retain `grann` for implementation compatibility, but should not be mistaken for the user's corrected terminology.

## Inner-torus rolling and minimum return

Let the torus major radius be \(R\), both sphere radius and torus tube radius be \(b=a\), and \(\psi\) parameterize the torus-centerline orbit. Define unit radial \(e_r\), orbital tangent \(e_\phi\), vertical \(e_z\).

The selected point on the **inner** torus wall is \(Donomphulon=(R-b)e_r\). The separately named **outer** radial point remains \(P_{ivot}=(R+b)e_r\). Sphere center \(C=Re_r\). The selected contact offset is \(-b e_r\).

No-slip at this nominated inner contact:
\[
\dot C+\omega\times(-b e_r)=0.
\]

For the material Analemma, let \(s\) be **actual spherical arc length**, \(g=G_A(s)\), \(t=dg/ds\), \(h=g\times t\), and \(\kappa_g\) be signed geodesic curvature. The SO(3) lock is

\[
\mathcal Q(\psi)=[-e_r,\ e_\phi,\ -e_z]\,[g,t,h]^T,\qquad
\frac{ds}{d\psi}=\frac{R}{b}-1.
\]

This produces
\[
\boxed{\frac{\omega}{\dot\psi}=\frac{R}{b}e_z+
\left(\frac{R}{b}-1\right)\kappa_g(s)e_r}.
\]

The required \(+z\) rolling spin now has the **same sign as orbital travel**, unlike the earlier incorrect outer-wall model. The radial spin component rotates through **x and y** as the sphere goes around the torus, so all three spatial axes participate. This is mathematically an **inner selected-contact** constraint, not global no-slip over the nonisolated \(b=a\) contact locus.

Let \(L_G(A)\) be the true spherical arclength of one material Analemma. One torus orbit moves through \(2\pi(R/b-1)\) of material arc length. The model searches for the **smallest positive even** winding count \(n\), subject to its openly stated admissible aperture \(0<A\le2\), satisfying

\[
n L_G(A)=2\pi\left(\frac{R}{b}-1\right).
\]

With \(R=1.65\), \(b=0.55\), the minimum is \(n=2\), numerical \(A\approx0.935206924\), and \(L_G\approx2\pi\). This is *minimal within this declared family and bounded aperture*, not a universal minimum across all possible analemmas.

The R/Q moving sweep plane still intersects each source curve separately. The one and only perpendicular elbow is phase-locked to \(\operatorname{lcm}(n,m)\), where \(m\) is the chosen integer R/Q sweep count per torus orbit. No extra projector and no independent elbow-turn slider.

### Numerical transport detail

The current browser integrates Analemma arclength with composite Simpson quadrature, inverts its monotone \(s(t)\) table with a bracket and a local Newton/Simpson refinement, and advances the material track by actual arc length. This avoids piecewise-linear angular-velocity kinks in the first implementation.

Executed independent tests at finite-difference steps \(0.012, 0.006, 0.003, 0.0015, 0.00075\) orbital radians gave maximum selected-contact slip discrepancies approximately \(0.03109, 0.00843, 0.00215, 0.000542, 0.000136\), respectively. These converge close to the expected \(O(h^2)\), rather than only repeating the analytic identity used in the constructor. Full orientation closure residual about \(1.1\times10^{-15}\), and length/cycle return residual about \(4.6\times10^{-13}\).

## Equation-to-curve issue and remedy

The previous source mapping squeezed both R and Q into narrow hemisphere bands:

```text
old polar aperture: 0.48 + 0.20 tanh(display_gain * f(lambda))
current aperture:   0.78 + 0.58 tanh(display_gain * f(lambda))
```

These are explicit geometric *representation choices*, not newly derived equation identities. Angles remain between \(0.20\) and \(1.36\) radians, keeping the chosen half-sphere assignment. The more expressive mapping allows changing source equations to produce visibly different connector and torus-wall traces.

A fourth browser panel now compares **the previous and current actual torus-wall intersection curves at the same orbital parameters**, and displays RMS and maximum world-distance change in model units and tube-radius percentage. The previous trace appears dimly behind the current trace, both in the same torus coordinate system. Nothing is auto-reselected for visual beauty.

**Expected exact duplicates:** distinct underlying equations can define the same sampled scalar representative (e.g. \(\cos\lambda\) for both an ideal spin-precession expectation and a selected circular-orbit coordinate). If selected in the same input port under identical settings, they should produce the same mapped trace. The comparison panel explicitly calls out zero difference. **The instrument still does not establish physical equivalence** of two theories.

## Output continuity, no curation

The torus trace is defined by the first forward intersection of the **single elbow ray** with the implicit torus surface. Geometrically valid wall intersections do not imply continuity of the selected-first-hit branch. The application now reports counts of adjacent-step displacements greater than \(0.20b\) and the largest step, without smoothing or deleting events. In one default 1,401-point run, 30 adjacent steps exceeded \(0.11\) model units and the largest step was about \(0.347\). These are *discontinuity candidates*; determining whether they are true root-branch transitions or very rapid continuous motion requires an additional adaptive-step/root-continuation audit.

**Unresolved:** a mathematical derivative mapping \(Q\text{ wrt }R\), complete arbitrary-field invertibility, real-browser visual acceptance, live-site deployment, and global no-slip at \(b=a\). The spherical analemma is one explicit model of the user-intended track, not a claim of recovered solar-ephemeris mechanics.

## Implementation

- [Canonical Whirligig application](index.html)
- [Website integration instructions](SITES_INTEGRATION.md)
- [Previous equation catalog and revisions](EQUATION_LIBRARY.md)
- [Older GrAnn functional investigations (historical, not controlling)](../../../tools/whirligig_rq/GRANN_FUNCTIONAL_RECONSTRUCTION_2026-10-18.md)



## 2026-11-02 CURRENT: equal-area Analemma, equatorial E/W contacts, polar N/S inputs

This section supersedes the 2026-10-21 material-curve formula above and the earlier 2026-10-17 east/west R/Q placement. The canonical browser file remains [index.html](index.html).

### Confirmed geometry and terminology

- **R** is a closed equation curve around the **north pole**, wholly in the northern hemisphere.
- **Q** is a closed equation curve around the **south pole**, wholly in the southern hemisphere.
- The Analemma is a separate closed spherical figure-eight. Its transverse self-crossing is at the **east equatorial pole** E=(1,0,0); its distinct self-tangential kiss is at the antipodal **west equatorial pole** W=(-1,0,0).
- The northern lobe winds around the north pole; the southern lobe winds around the south pole.
- One Analemma circuit means the complete two-lobed closed curve. The inner torus circumference is an even multiple of that complete length.
- Sphere radius equals torus tube minor radius: b=a, so the sphere great-circle circumference equals the tube cross-section circumference.

The historical source gives the self-crossing and antipodal self-tangency relationship; the E/W versus N/S placement and the equal-area condition above are the user's later explicit geometric refinements.

### Equal-area curve family and solved shape

On the unit sphere, define

[
eta(t)=ksin tcos^2t,qquad phi(t)=2t,
]

[
G(t)=igl(cosetacosphi,;cosetasinphi,;sinetaigr),quad 0le t<2pi.
]

The northern lobe is 0<t<pi; the southern lobe is pi<t<2pi. The equal-area interpretation used here is that the **combined two-lobe area** equals the remaining equatorial area. Thus each lobe encloses pi b^2, both lobes enclose 2 pi b^2, and the complement also has area 2 pi b^2.

The area equation is

[
2int_0^pi[1-sin(ksin tcos^2t)],dt=pi.
]

Its first regular root is

[
oxed{k=2.63499709629253}.
]

The maximum lobe latitude is 58.11000154 degrees. At E, the two branch tangent vectors in local azimuth/latitude components are proportional to (2,k) and (2,-k), so the crossing is transverse. At W, both tangent vectors are proportional to (2,0), while their second-order latitude curvature has opposite sign, giving the intended tangential kiss. The curve is regular; its minimum parameter speed on the unit sphere is greater than 1.

### Length and gearing

The full material length is

[
L_A=bint_0^{2pi}sqrt{eta'(t)^2+4cos^2eta(t)},dt
=13.26913503960638,b.
]

For the minimum positive even multiple, the inner torus circumference contains two full Analemma circuits:

[
2pi(R-b)=2L_A,qquad
oxed{R/b=5.22369686421446}.
]

The browser therefore derives the major radius from the tube/sphere radius. At the retained reference scale b=a=0.55:

| Quantity | Value |
|---|---:|
| Sphere and tube radius | 0.55 |
| Sphere great-circle / tube cross-section circumference | 3.45575191895 |
| Full physical Analemma length | 7.29802427178 |
| Torus major radius R | 2.87303327532 |
| Inner torus circumference | 14.59604854357 |
| Inner circumference / full Analemma length | 2 exactly, within numerical tolerance |

Changing the scale control changes a=b and derives R proportionally, preserving the equal circumferences and two-circuit gear ratio. The old independent major-radius slider is removed because it allowed the gear constraint to be broken.

### R/Q aperture and W_obble centering

The R/Q polar aperture adapter is a_RQ=0.78+0.20 tanh(f) radians. R is placed around +z and Q around -z, with opposite azimuths at a common meridional sweep. The aperture gain bounds the normalized crossbar-midpoint offset by sin(0.20)=0.19866933; the default harmonic pair's sampled maximum is about 0.0931 sphere radii. The azimuth/equation mapping remains an explicit representation choice, not a derived field equation.

### Rotational and epistemic limits

The browser computes the Analemma tangent, normal, and signed geodesic curvature analytically, transports its material point by numerical arc-length inversion, and keeps the existing inner selected-contact no-slip relation. The minimum even winding is now fixed at two full Analemma circuits per torus orbit; the elbow turns remain the LCM of that count and the R/Q sweep count.

Equal area is the chosen geometric balance condition. It has **not** been proven to globally minimize angular acceleration or jerk over all possible spherical figure-eight curves. A separate constrained smoothness optimization would be needed to establish that stronger claim. Equal-radius contact remains nonisolated, so the model still certifies only the nominated contact, not global no-slip across the full contact locus.

### Reproducible calculation

Run python tools/whirligig_rq/validate_equal_area_analemma.py for an independent standard-library calculation of the equal-area root, spherical length, E/W contact types, radius equality, and two-circuit gearing. This is numerical verification of the declared curve family, not proof that the family is uniquely implied by the historical prose.
