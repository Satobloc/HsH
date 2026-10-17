# MK152 — Time-normal escape / projective half-defect
**Status:** SILOED SANDBOX; Morrow–Kestrel, 2026-10-08. Not canonical. No physical claim.

## Source ledger (exact paths and coverage)
- Historical SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, fetched 1563 lines/233643 characters, substantially examined F1–F4 (~first 30000 characters), with lines 85–175 rechecked. Historical SO(4) Universal Indicatrix, unit time-flow vector, and separate compact phase are **source statements**, not verified derivations.
- Current HsH: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md`, read complete (153 lines); local one-sided support geometry, not a time-normal topology claim.
- Current control: `Satobloc/HsH/🔑/🔑.md`, `🔑/O_EFF_IS_THE_REPRESENTATIONAL_DEFAULT.md`, `🔑/H0_TO_C_IS_THE_UNIVERSAL_METRIC_GRADIENT.md`, read complete. WWRD / one twisting normal until mathematics requires more.
- Project front door `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` and its controlling Common onboarding pointers reviewed. HSH_RESOURCES reference desk/War Room declaration, indexes, Tool Chest, source inventory, tool folders and BigBook index triaged. Stable Mersearch 1.0 guidance read. PRIOR_ART was not opened. External source index browsed **after** independent construction; no outside theory imported.

## Construction, all notation LOCAL:MK152
Take an oriented 4D Euclidean unit time-normal `u∈S³`. Its apparent planar vortex can unwind without a zero of its norm:
```
u_t(φ) = (cos(t) cosφ, cos(t) sinφ, sin(t), 0), 0≤t≤π/2.
∮ (u1 du2 − u2 du1) = 2π cos²(t).
```
All loops are closed and unit length; the first winds once in a chosen plane, the last is constant. Thus `π1(S³)=0`: winding of a **single unrestricted time normal** is not an integer topological charge.

A smooth finite-core escape on a transverse disk of radius `R` is
```
u(r,φ)=(sin f(r) cosφ, sin f(r) sinφ, cos f(r), 0),
f(r)=πr/(2R).
```
With **assumed toy** energy `E=(K/2)∫|∇u|² d²x`, adaptive quadrature and analytic evaluation agree:
```
E_escape/(πK) = π²/8 + (EulerGamma+lnπ−Ci(π))/2 = 2.057839369488.
E_planar/(πK) = ln(R/a)    [punctured planar core; unknown core energy excluded].
R/a crossover at μ=0: exp(2.057839369488)=7.829035869.
```
For optional easy-plane cost `(μ/2)u3²`, the escape trial adds `π μ R²(1/4−1/π²)`, coefficient 0.148678816358. This comparison is constitutive, not a physical prediction.

## Audacious alternative: metric-only Z2
If the proposed Householder metric is `g=I−2uuᵀ`, it is insensitive to `u→−u`. For **metric-only** identification the order parameter is `RP³`, with `π1(RP³)=Z2`, not Z. The half-turn
```
u_half(φ)=(cos(φ/2),sin(φ/2),0,0)
```
does not close as an oriented normal but its `g(φ)` does. Numerically `max|g(2π)−g(0)|=2.45e−16` and `|u(2π)−u(0)|=2`. Two such projective half-turns fuse to the trivial class. If the future-time arrow is part of the physical specification, the quotient is forbidden and the Z2 protection disappears.

## Attack and failure conditions
1. The historical compact scalar phase `θ∈S¹` and the unit normal `u∈S³` are **different fields**. The former can carry Z winding; the latter cannot unless constrained.
2. The Z2 option applies only to a metric/director, not an oriented time normal. Its defect core may require a breakdown of the metric-only family.
3. K, μ, a, R are LOCAL test parameters; no particle constant or historical target imported.
4. This does **not** derive Schwarzschild, electromagnetic force, or the dynamical law of a worldtube.

## Numerical checks / next test
Python fixture and three Class-P figures are preserved in the task-thread MK152 bundle. Analytic/numerical energy agreement <1e−11; anisotropy coefficient <1e−12; projected circulation checked at 21 homotopy steps (<1e−5); projective metric closure at machine precision.

**Next discriminator:** Determine from the O_eff/GR mapping whether the normal is oriented, a director, or constrained to an easy plane. Relax a finite-core 2D field under each choice; check escape and distinguish a genuine independent S¹ phase defect. Preserve source/inference/new-conjecture separation.
