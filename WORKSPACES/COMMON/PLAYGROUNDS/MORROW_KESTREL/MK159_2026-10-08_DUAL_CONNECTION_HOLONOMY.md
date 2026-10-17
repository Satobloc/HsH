# MK159 — Same normal map, two different connections
**Date:** 2026-10-08. **Worker:** Morrow/Kestrel. **Status:** SANDBOX; standard geometric derivation tested, physical coupling NOT established. **Quarantine:** no PRIOR_ART opened.

## Exact provenance / coverage
- Old SAT primary: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/GRAVITY TWIST.txt` (1,774 lines total), substantially inspected noncontiguous regions 1–94, 121–164, 191–304, 361–404, 481–524, 621–664, 781–824, 961–1004, 1181–1224, 1401–1444. Literal physical four-dimensional tube wrapping and persistent interaction history occur in user-origin turns. Assistant-origin claims about ʻOumuamua and observational limits were NOT used as empirical constraints. [Source](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/GRAVITY%20TWIST.txt).
- Current HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_090_TANGENCY_DIMENSIONAL_DISCRIMINATOR.md`, complete; and `.../2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md`, complete. Used for dimensional and finite-core discipline, not for importing a force law.
- Continuity: MK156 (round-S³ holonomy), MK157 (Schwarzschild Householder representation), MK158 (Kerr twist-versus-gravity).
- Onboarding: main front door, Common Reference Desk, War Room DECLARATION, source/tool/preference routers read; relevant resource directories triaged. Mersearch code inspected; only exact known-file retrieval used, not corpus-wide search. HSH_RESOURCES is supporting, not theory authority.

## Mathematical construction
**All nonstandard symbols LOCAL:MK159.** `m=GM/c²` (length), `r>2m` (length), `a` (normal tilt angle), `F=1-2m/r` (dimensionless), `H_N,H_S,D` (angles), `b` (core half-width, length).

Take the earlier trial Euclidean Householder representation `g=δ-2u⊗u`, with `sin²a=m/r`. Along an equatorial azimuthal loop, the Euclidean normal is
`u(φ)=(cos a,sin a cosφ,sin a sinφ,0)∈S³`.
The round-S³ Levi–Civita connection gives
`H_N=2π(1-cos a)=2π[1-√(1-m/r)]`.

The standard Schwarzschild constant-time equatorial two-metric is
`dl²=dr²/F+r²dφ²`.
Its spatial Levi–Civita connection gives
`H_S=2π(1-√F)=2π[1-√(1-2m/r)]`.

**Exact discriminator:** `D=H_S-H_N=2π[√(1-m/r)-√(1-2m/r)]>0` for `m>0,r>2m`. These are continuous lifts from the flat asymptotic limit; physical SO(2) holonomy is modulo 2π. The connections act on different bundles; `D` is a declared comparison, NOT a gauge-independent observable.

With `x=m/r`, `H_N=πx+πx²/4+O(x³)`, `H_S=2πx+πx²+O(x³)`, `D=πx+3πx²/4+O(x³)`. Thus the two transports disagree already at leading weak-field order, despite matching the Schwarzschild metric. Both vanish for `m→0`.

At `r=10m`: `H_N=0.322432347702 rad`, `H_S=0.663333522347 rad`, `D=0.340901174645 rad`. At `r=4m`: `D=0.998515154544 rad`.

## Independent solver verification
Two ODEs were integrated independently: (1) ambient round-S³ `dv/dφ=-(v·u')u`; (2) spatial Schwarzschild parallel transport using `Γ^r_{φφ}=-rF`, `Γ^φ_{rφ}=1/r`. Eight radii 2.5–1000m agreed with separate analytic formulas to better than 10⁻9 rad. Vector norm and tangency constraints passed. Symbolic weak-field expansion independently checked.

For symmetric finite-core radial half-width `b`, the angular mismatch across the core is
`D(r-b)-D(r+b) ≈ (4πbm/r²)[1/√(1-2m/r)-1/(2√(1-m/r))]`, leading weak-field `2πmb/r²`. Dimensions: angle, NOT force/energy. At `r=10m,b=0.1m`, exact `0.00742746216378 rad`, linear `0.00742657061822 rad` (0.012% difference).

## Audacious sandbox completion / failure test
**Only if** physically distinguishable material frames are actually tied to these two connections, a constrained ring apparatus could store relative twist after `N` traversals. A NEW hypothetical rod energy is `E_n=C_tw(ND-2πn)²/(2L)`, `L=2πr`, `[C_tw]=energy·length`, `n∈ℤ`. At `r=10m`, its first model phase-slip preference is `N=10`. This is NOT a prediction for actual orbital motion, ʻOumuamua, or gravitational coupling.

**Failure:** no second physical frame; director instead obeys Fermi–Walker or material rod transport; slipping/reconnection erases memory; timelike worldtube dynamics differs from a static spatial loop; connection identification is representation dependent; stiffness is not derived. The original SAT source demands literal physical tubes, not passive abstract history counters.

**Next:** Timelike circular-worldtube test comparing (a) Fermi–Walker gyro, (b) finite-core material director, and (c) specified normal-space transport under identical initial conditions. Include flat `m=0`, path reversal, asymmetric supports, frame-gauge and energy-balance controls. Do not infer force from nonzero geometric mismatch.

**Local full reproducible bundle:** `MK159_Morrow_Kestrel_bundle.zip` in task thread, with full derivation, Python ODE fixture, and three Class-P figures.
