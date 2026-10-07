# Mercer sandbox — director rotation gives inverse-square static force

**Date:** 2026-10-07  
**Status:** LOCAL sandbox conjecture; not canonical theory.  
**Namespace:** LOCAL:MERCER-DIRECTOR-GRAVITY-20261007

## Sources actually read
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026 discussions/SAT THEORY — PROPER DIMENSIONALITY.txt`, lines 1–1500. Used only as historical quarry: torsion/curvature, filament interactions, and the warning-by-example that later imported machinery often outran derivation. No historical constants/particle targets used.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/BOSONIC TIME AND TWO GRAVITIES.txt`, full 1204 lines. Recovered Nathan's distinction between propagating ripples and quasi-static large-scale morphology/tension, plus the two coupled media: resolving timesheet and filament network.

## Independent construction
Take the local unit time-normal/director `n(x)` in Euclidean 4-space. Near a uniform vacuum orientation `n0`, write a small matter-induced rotation by a local angle field `vartheta(x)`. The minimal isotropic static energy in the three resolved spatial directions is

`E = (K_n/2) ∫ |grad vartheta|^2 d^3x - ∫ rho_q vartheta d^3x.`

Variation gives

`K_n Laplacian(vartheta) = -rho_q.`

For a localized source `rho_q = q delta^3(x)`,

`vartheta(r) = q/(4 pi K_n r)`.

A second source with coupling `q_2` has interaction energy and force

`U_12(r) = q_1 q_2/(4 pi K_n r)`,
`|F_12| = |q_1 q_2|/(4 pi K_n r^2)`.

Thus an inverse-square static interaction follows from ordinary gradient elasticity of a matter-rotated time normal, without inserting a 1/r potential.

For a finite core of radius `a` held at rotation `vartheta_a`, the exterior solution is `vartheta= vartheta_a a/r` and exterior elastic energy is `E_out = 2 pi K_n vartheta_a^2 a`.

## Long-range discriminator
If a local orientation-locking term is present,

`E_lock=(mu_n^2 K_n/2)∫vartheta^2 d^3x`,

then

`(Laplacian-mu_n^2) vartheta = -rho_q/K_n`

and the field is Yukawa-screened:

`vartheta(r)=q exp(-r/xi_n)/(4 pi K_n r)`, with `xi_n=1/mu_n`.

Hence truly long-range gravity in this mechanism requires either no local director-locking gap or a screening length far beyond the tested scale. This is a sharp failure condition.

## Interpretation boundary
Recovered source idea: matter drags/distorts the resolving time structure; gravity has both quasi-static morphology/tension and propagating ripple sectors, reinforced by the filament network.

Derived here: if that distortion is specifically an angular rotation of the local time normal and its leading static cost is gradient-elastic, the Green function is 1/r and the force is inverse-square.

New conjecture: the Newtonian sector may be the Goldstone-like, gapless orientation response of the time-normal/director field; gravitational waves would be dynamical excitations of the same field, while filament-network coupling renormalizes the constitutive coefficients/source coupling rather than defining a second ad hoc force.

## Next solver
1. Build a unit-vector director field with constraint `n·n=1`.
2. Couple a finite worldtube core to local director rotation without prescribing a 1/r exterior.
3. Minimize the full energy numerically.
4. Measure `vartheta(r)`, `r^2 |grad vartheta|`, and any anisotropic multipoles.
5. Add a controlled local locking term and verify the transition from inverse-square to Yukawa screening.
6. Then couple the filament-network graph elasticity and test whether it changes only effective `K_n,q` or changes the radial exponent.

**Kill condition:** if the explicit worldtube/director mechanics do not produce a gapless gradient sector, or if the exterior field does not approach `vartheta ∝ 1/r` under isotropic weak-field conditions, this mechanism is rejected.
