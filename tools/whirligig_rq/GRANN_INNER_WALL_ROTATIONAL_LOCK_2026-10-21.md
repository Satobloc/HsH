# GrAnn / R–Q Whirligig: inner-wall rolling and minimum shared rotational lock

**Date:** 2026-10-21  
**Status:** SANDBOXED browser engineering reconstruction, repository-published, real-browser/Sites deployment not independently verified.  
**Source:** `PUBLIC_SITE/instruments/whirligig/index.html` in `Satobloc/HsH`.  
**User correction:** GrAnn is fundamentally rotational locking through **all three spatial axes**, with the **minimum shared return** determining the number of rotations of the single perpendicular gimbal elbow. The sphere rolls on the **inner radial surface of the torus**, not the outer one. The previously visible outward-contact spin looked backward because it was actually the wrong contact branch.

## Selected contact and direction

Let torus major radius be `R`, tube radius and sphere radius both `b=a`, orbital position `C(ψ)=R(cosψ,sinψ,0)=R e_r`, and orbit tangent `e_φ`. The two torus radial equator points are:

```text
Donomphulon = P_inner = (R-b)e_r
P_ivot      = P_outer = (R+b)e_r
r_inner     = P_inner-C = -b e_r
C'          = R e_φ
```

Nominated inner-wall no-slip requires `C' + ω × (-b e_r) = 0` per unit `ψ`, hence the **z component** of angular velocity is `ω_z=+R/b`, in the SAME physical sign as torus progression. For the old **outer** contact `r=+b e_r`, the required sign was `ω_z=-R/b`. Reversing playback alone is not an acceptable fix: switch the selected wall, contact offset, and the resulting orientation/velocity constraint together.

The earlier browser version accidentally labeled its single inner contact as both P_ivot and Donomphulon. This is corrected: P_ivot remains the **outer** circumferential point per the historical source, while Donomphulon is the **inner** selected rolling point; the diameter `2b` separates them. The material GrAnn track passes through both contact and antipode.

## Minimum even three-axis rotational lock

Write `r=R/b`, `δ=r−1`. In this deliberately defined SO(3) locking ansatz, take

```text
n = smallest positive EVEN integer strictly larger than |δ|
σ = sqrt(n²−δ²)                              (nonzero transverse spin)
u = (σ,0,δ)/n                               (unit body axis)
Q(ψ) = Rot_z(ψ) Rot_u(n ψ)
```

Then the world angular velocity per `ψ` is

```text
ω = σ cosψ e_x + σ sinψ e_y + r e_z.
```

The sphere therefore rotates through **x and y over the orbit** as well as the **positive z rolling direction**, without violating the nominated inner-wall slip constraint. Because `n` is an integer and the orbital angle makes a full turn, the complete orientation `Q(2π)=Q(0)`; the **smallest even** `n>|δ|` makes the x/y component strictly nonzero. This is a minimality statement only **within this specified constant-oblique-axis ansatz**, not proof of a globally unique minimal mechanism.

The sphere's body material contact is

```text
g_body(ψ)=Q(ψ)⁻¹(−e_r(ψ))
```

and the torus wall determines `C = P_inner - b Q g_body`. The resulting body track is a generally non-great circular GrAnn contact locus. Its historical self-intersection `GrAnn_Omph`, special antipodal self-tangency `GrAnn_t_ipode` and original R-anchor crossover **have not been reconstructed**. This lock is functional, not a claim to have recovered the exact source-described shape.

## Crossbar and elbow timing

R and Q remain independent E/W **sphere curves**. A common meridional sweep intersects both curves separately, yielding two moving body points `R(ψ)` and `Q(ψ)`. Their freely varying connector has midpoint W_obble; its one and only projecting gimbal elbow is constrained exactly perpendicular to the connector.

The current browser maps each selected input to one closed 2π sphere curve, so one full normalized sweep lap returns both source curves to their represented starting parameters. Let `m` be the selectable **integer** number of complete sweeps per torus orbit. Define

```text
elbow_turns = lcm(n,m)
theta_elbow(ψ) = elbow_turns * ψ
```

This replaces the former separate arbitrary elbow-turn slider and the ad hoc `curvature_gain*(curvature_R−curvature_Q)` phase. The single gimbal elbow intersects the actual torus wall to make Curvy Lisa. The R/Q representation may have shorter scalar periods but a complete spatial curve still carries its azimuth winding; use full curve/orientation closure, not merely scalar equality, to test return.

For `R=1.65,b=.55`: `r=3,δ=2,n=4,σ=sqrt(12)`; default m=1 gives elbow=4, while m=3 gives elbow=12. Other radii choose their own minimal-even n with a floating-point guard at integer boundaries. General source-specific fractional windings, quaternion signs, nonperiodic solutions, nontrivial holonomy and independently varying follower phases would require a more general common-return solver; these are not silently presumed solved.

## Unfiltered comparator series

The browser retains its original **14** equation adapters and adds **28** explicit scalar representatives. They are organized as:
- **11 best-known examples:** harmonic oscillator, Kepler ellipse, Maxwell plane wave, Fourier heat equation, Laplace harmonic, Schrödinger box eigenfunction, standing wave, Lorentz gamma scan, Planck spectrum, Maxwell–Boltzmann speed distribution, Fermi–Dirac occupation.
- **17 often overlooked examples:** Jacobi theta, Legendre, Chebyshev, Bessel J0 (40-point quadrature), Clausen Cl2 (truncated), Re Li2 (truncated), Berry curvature in a two-band Dirac model, Mathieu coefficient, KdV one-soliton profile, sine–Gordon kink, viscous Burgers shock, Morse and Lennard–Jones potentials, Kitaev chain spectrum, Pöschl–Teller potential, Fresnel C (Simpson quadrature), U(1) Wilson phase.

These category labels are **editorial** and not an objective ranking of physical importance or novelty. Every profile remains selectable independently as R or Q, with a displayed formula, chosen representative and limitations. A deterministic no-ranking pair iterator traverses every unordered pair in the selected series: 55 best-known pairs, 136 overlooked pairs, or **861 combinations across all 42**. No automated beauty/tuning selection is applied to Curvy Lisa. Some source mathematical objects are nonperiodic; **the prescribed sample parameter is periodic**, not the original soliton, kink or trajectory.

## Executed test record

All executed checks use the browser's JavaScript with a **stub DOM/canvas**, not a real graphical browser.
- Default `R=1.65,b=.55,m=1`: `n=4,` `elbow_turns=4`, nonzero `σ=3.4641`, inner contact slip residual under `3.9e−16`, full SO(3) orientation return residual under `5.3e−15`, 1,401/1,401 first-forward elbow/torus ray intersections.
- `m=3` changes the locked elbow turns automatically to 12, with no independent elbow motor field.
- All 42 profiles generated finite, matching samples at 0 and 2π. The unfiltered series controls advanced through the ordered pairs.
- Full regression with all 42 profiles in the R selector and all 42 in the Q selector: **84 configurations, 117,684 evaluated apparatus samples**, zero missing torus wall hits or E/W violations, max bar/elbow unit-dot residual `4.45e−16`, max selected inner-contact slip residual `3.85e−16`.
- The P_ivot (outer) / Donomphulon (inner) radial distance was tested as `2b=1.1` in the default reference.

**Not verified:** actual published Sites page, real browser rendering/performance, dynamic no-slip at all points in the degenerate `a=b` full contact set, complete historical GrAnn topology, general equivalence of arbitrary physics equations, or a proof that Curvy Lisa equals a derivative.

## Supersession

This replaces the earlier default **outer-wall** rolling sign, its great-circle-only GrAnn geometry, the formerly user-adjustable elbow turns/curvature-gain, and the old shortcut that identified the radius gear `(R+b)/b` as the complete GrAnn/R/Q common return. Those prior research files remain in the archive as historical records, not the current design.

Live deployment requires the site builder to replace the existing `/laboratory/whirligig/` implementation from the current HsH source and verify the new inner contact, three-axis motion, unique outer and inner markers, automatic elbow count, and entire comparator series.
