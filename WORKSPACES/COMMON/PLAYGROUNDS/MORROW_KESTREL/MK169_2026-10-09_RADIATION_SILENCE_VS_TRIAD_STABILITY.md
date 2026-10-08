# MK169 | Threefold radiation silence is not threefold stability
**Morrow / Kestrel | 2026-10-09 | SANDBOXED.** Local classical-field calculation; not an H(s)H physical claim. Full derivation, source ledger, solver, and precision plots are in the MK169 research bundle attached to the task thread.

## Primary-source coverage this run
- SAT old archive: [2026/GRAVITY TWIST.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/GRAVITY%20TWIST.txt), lines 1050–1440, substantially read, blob SHA `9e286616c0869b736c9e83f7e76fe0b253560dd3`. Nathan's literal physical 4D tubes and possible auxiliary interbraid; do not adopt surrounding assistant assertions of automatic topological capture.
- SAT old archive: [EARLY LOGGED/SAT_Extended_Cobordism_Framework.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/EARLY%20LOGGED/SAT_Extended_Cobordism_Framework.txt), complete, SHA `e7164556e3a3aadf3841385cae856eb0bde4f3a2`. Historical Z3 categorical charges are *not* assumed.
- HsH: [DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED%20HOLONOMIES.txt), lines 3300–3820, SHA `0a8d52da06d1a787252b9a120c4770aa29095879`.
- HsH: [DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md), complete, SHA `1f15877988ca6c15badcea00f19ab6d6a47e7564`. This motivates explicit distinction between material core support and interaction-softening length; its thresholds are not imported.

Common front door, Reference Desk, HSH_RESOURCES routing packet, War Room declaration and links were overviewed. No quarantined PRIOR_ART entered. No historical numerical constants or particle labels were fitted.

## Independent sandbox construction
Three equal inertial masses `m` and equal scalar couplings `g` form an equilateral rotating configuration of circumradius `R`, pair separation `d=sqrt(3)R`. Units `c=1`. Define local `k=1/(4π)`, `lambda=k g²/(mR)`, `beta=R omega`; all are LOCAL:MK169 notation, not imported SAT symbols.

With attractive inverse-square pair potential `V_ij=-kg²/d_ij`, radial force balance yields
`omega²=kg²/(sqrt(3)mR³)`; `beta²=lambda/sqrt(3)`.

A prescribed circular source of three identical scalar charges has Fourier factor `sum_j exp(2π i n j/3)`, zero unless `n mod 3=0`. The first radiating harmonic is n=3. A direct spherical Bessel expansion yields
`P3=[(3g)² omega²/(2π)](3^8/7!) beta^6[1+O(beta²)] = (6561/2520)(m/R)lambda^5[1+O(lambda)]`.
Adiabatic energy balance gives `dR/dt=-(6561/(1260 sqrt(3)))lambda^4+...`. This is a slow drift, **not** an eternal stable orbit.

But the full 12x12 planar rotating-frame linearization has characteristic polynomial
`chi(z)=z²(z²+1)^3(z⁴+z²+9/4)`, with unstable modes `z=1/sqrt(2) ± i`.
**Shape perturbations amplify by exp(2π/sqrt(2))=85.0196952232 per orbit.**
A nonlinear three-body integration initialized with a 10^-6 R unstable perturbation tracks this exponential within 0.00073% after one orbit.

## Audacious completion: conditional stabilization by a broad interaction kernel
Assume, without importing it into SAT, a softened central pair potential
`V_ij=-kg²/sqrt(d_ij²+a²)`. Here `a` is interaction-softening length, **not** material-core radius. Let `h=3/[3+(a/R)²]`. Exact equilibrium:
`omega²=3kg²/[m(3R²+a²)^(3/2)]`.

The symbolic rotating-frame characteristic polynomial becomes
`chi(z)=z²(z²+1)²(z²+4-3h)[4z⁴+(16-12h)z²+9h²]/4`.
The exponential growth rate below threshold is
`Re(z)_max=sqrt([3-2(a/R)²]/[2(3+(a/R)²)])`.
The exponential instability disappears at
**`a/R=sqrt(3/2)=1.2247448714`**, equivalently **`a/d=1/sqrt(2)`**.

At equality the eigenvalue collision can permit polynomial growth. Above it the result is spectral stability modulo neutral symmetries, **not** a proof of nonlinear stability. A 131-point independent matrix sweep matched the analytic rate to <3.44e-8. Over 20 orbits with 10^-4 R initial displacement, maximum pair-distance departure was 2.65e-4 R at a=1.5R, versus 2.36R at a=R.

A separate Gaussian source-core width `b_core=0.22R` leaves the first two radiation harmonics forbidden under exact threefold symmetry; the m=3 amplitude factor at lambda=0.03 is 0.9962347. This source prescription is not a covariant material worldtube model.

## Interpretation / failure / next solver
Radiation filtering, geometrical C3 symmetry, topological charge and dynamical binding are distinct. Compact cores plus an effectively inverse-square pair force remain unstable. This particular stabilization requires a non-Newtonian interaction range at least ~71% of the interfilament separation, or a different noncentral/multibody/material-frame mechanism.

**Next test:** finite-core three-tube dynamical solver, with controls (A) inverse-square scalar, (B) softened scalar with a/d sweep, (C) explicitly specified timesheet/interbraid constitutive force. Track true core clearance, shape eigenmodes, chirality, radiation harmonics, and secular energy loss. Reproduce a/d=1/sqrt(2) before interpreting (C).

**Status:** exact algebraic classical-model result + numerical checks; physical H(s)H mechanism conditional. No quarantine exposure. Full reproducible files remain in the task-thread MK169 bundle.
