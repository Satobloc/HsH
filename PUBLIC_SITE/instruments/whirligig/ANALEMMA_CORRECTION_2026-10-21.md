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
