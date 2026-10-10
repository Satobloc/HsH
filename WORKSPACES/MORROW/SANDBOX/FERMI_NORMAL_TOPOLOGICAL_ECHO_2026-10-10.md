# Morrow + Kestrel | Lorentz-normal finite-core topological echo | 2026-10-10

**Status:** SANDBOXED; new mathematical fixture, not SAT/H(s)H canon, particle prediction, Kerr solution, or Pauli mechanism. **Namespace:** LOCAL:MK-FERMI-ECHO-20261010.

## Primary provenance, read this run
- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt`, blob `a13c67ff2b47cf178672804d91771e01d4c4a3e1`, contiguous lines 1–135: historical straight-vacuum, timesheet, sheaths, finite wavefront, corrections. Its black-hole/exclusion conjectures are not established results. ⟦PROV:SAT-ARCH-FILAMENT-ONTO·L1–135⟧
- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt`, blob `0323682e7a49278b5a76d0c6a5a7787a13eb17d6`, entire 10,597-character text: worldline/timesheet intersections and composite morphologies.
- Current HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`, blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`, entire 9,257-character text; `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SATv TIME_WAVEFRONT.txt`, blob `fe1a6f603798c31fa4e5bf704bb31cbcc5ec4ce9`, entire 3,306-character text. The former is not the separate Extended FIE PDF.
- Read controlling `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, Oct 9 Nathan Direct, Common symbol/citation controls, Reference Desk and War Room declaration; triaged Oct 5 HSH_RESOURCES packet and relevant index/tool/preference routes. No banned Hypothesis H/direct Schreiber content opened.
- Mersearch shared request slot occupied by Ravel (`2026-10-08-ravel-deformable-contact-backreaction-001`); no corpus-wide novelty claim. No outside theory was imported.

## New construction
Use Minkowski `(-+++)`, `w=ct`, a timelike SAT center-history
`X(u)=(u,R cos(qu),R sin(qu),0)`, `beta=Rq`, `gamma=(1-beta²)^(-1/2)`, `kappa=gamma² Rq²`. No external winding carrier. For an isotropic rest-normal radius-epsilon ball, take orthonormal normals `N_r=(0,e_r)`, `N_t=(beta gamma,gamma e_t)`, `N_z=(0,e_z)`.

At fixed lab time `w`, rest-normal coordinates `(p,t,z)`, `p²+t²+z²<=epsilon²`, map exactly to
```
u=w-beta*gamma*t
theta=q*w-q*beta*gamma*t
x_perp=(R+p)*e_r(theta)+gamma*t*e_t(theta)
x_z=z
```
with Jacobian `J=(1/gamma)(1-kappa*p)`. For local regularity `epsilon*kappa<1` and injectivity, instantaneous lab-spatial volume is **exactly** `4*pi*epsilon³/(3*gamma)`.

## The surprising invariant and its correction
For `R>epsilon` and regular tube, the full-turn **spatial support union** is **exactly**
`(sqrt(x²+y²)-R)²+z²<=epsilon²`: a solid torus, despite the deformed instantaneous Fermi footprint. This is a *time-accumulated spatial support*, NOT simultaneous toroidal matter or intrinsic 4D core topology.

For a **partial** active-wavefront turn, the angular halfwidth of the Fermi footprint is
`alpha_max=max_{0<=t<=epsilon}[-q*beta*gamma*t+atan2(gamma*t,R-sqrt(epsilon²-t²))]`.
The angular closure gate is `phi_hole=2*pi-2*alpha_max`; for the convex fixture, polygon topology confirms this is the hole-onset threshold. The earlier laboratory-ball fixture instead uses `asin(epsilon/R)`.

**Density does not inherit the support invariant.** For a uniformly lab-volume-weighted Fermi core, uniformly averaged over a full turn:
`F(k)=1/V0 integral_ball (1-kappa*p) J0(k sqrt((R+p)²+gamma²*t²)) dp dt dz`, `V0=4*pi*epsilon³/3`.
The previous `J0(kR)*F_ball(k epsilon)` factorization is **not exact** at nonzero beta. Exact second moment:
`<r_perp²>=R²+(3-gamma²)*epsilon²/5`.

## Independent numerical tests, no fitted constants
Fixture `R=.8,epsilon=.24,beta=.6,q=.75,gamma=1.25,kappa=.703125,epsilon*kappa=.16875`.
- Fermi angular halfwidth `0.248856570638428` vs laboratory ball `0.304692654015397`.
- Fermi hole gate `phi=5.78547216590273`, `Delta=7.71396288787031` (**92.07865% of turn**) vs laboratory-ball `phi=5.67379999914879`, `Delta=7.56506666553172` (**90.30133%**).
- Polygon union: 0 holes immediately below Fermi threshold, 1 above; full turn 1. High-resolution full-turn union vs exact annulus relative symmetric-difference area `5.48e-5`.
- Fermi radial second moment `0.65656` (exact and quadrature), laboratory-ball `0.66304`.
- First radial Fourier zero: Fermi `3.021465794394369`, lab ball `3.006031947119716`, a **+0.51343%** kinematic correction. Quadrature convergence max difference `2.89e-15` on k=0..6.
- Local complete solver, verification JSON, and five Class-P precision figures were generated in task runtime; no script is claimed committed here.

## Failure gates / next solver
The observation rule (support union or lab-volume temporal averaging) is hypothetical; actual wavefront transfer may differ. Real ER/Kerr core need not be a spherical normal ball. Curved/radial timesheets, global self-intersection, and a straight core with rotating shell excitation may break identifiability. Neither coiling dynamics nor Fermi exchange antisymmetry has been derived.

**Next:** compare a coiled Fermi core against a straight center plus rotating shell under one explicitly causal wavefront-response law, including weakly curved/radial timesheets and two-point correlations. Reject a core-vs-shell discriminator if a shell excitation reproduces all accessible observables. No historical particle constants as targets.
