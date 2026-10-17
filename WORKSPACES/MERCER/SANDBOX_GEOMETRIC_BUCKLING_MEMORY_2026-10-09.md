# Mercer sandbox | Geometric memory from precompressed timesheet strip (2026-10-09)

**Status:** SILOED / provisional calculation, NOT canonical SAT/H(s)H. No historical constants fitted.

## Question
Can retained deformation emerge from the *positive* tension and bending terms of the candidate H(s)H timesheet, without adding an independent bistable constitutive variable?

## Construction
Take a finite strip of the 3D timesheet with normal displacement `h(x)`, positive bending rigidity `B_b`, tension `T_b`, axial constraint stiffness `K_a`, and **persistently imposed end-shortening** `d_0`. Small-slope energy:

```text
E[h] = (B_b/2)∫(h'')²dx + (T_b/2)∫(h')²dx
       + (K_a/2)[d_0 - (1/2)∫(h')²dx]².
```

The last term comes from arclength geometry plus a constrained end separation; it is a NEW sandbox hypothesis about filament/medium boundary conditions, not a recovered H(s)H law. With pinned ends and `h=q sin(πx/L)`:

```text
d_cr,n = [T_b + B_b(nπ/L)²]/K_a
d = d_0 - d_cr,1
q_± = ±(2/π) sqrt(L d)                (d>0)
ΔU = K_a d²/2
κ = K_a π⁴/(8L²)
U(q)-U(q_±) = κ(q²-q_±²)²/4
f_fold = 2κ|q_±|³/(3√3).
```

Thus **geometric buckling creates the double well**, without writing a double well into the local material energy. If `d≤0`, the straight state is the only stable state in this approximation. For `d_cr,1<d_0<d_cr,2`, the first mode is the sole unstable mode of the straight strip. For `K_a=EA/L`, the critical strain is `ε_cr,n=T_b/EA+n²π²B_b/(EA L²)`, separating bending-dominated short strips from tension-dominated long strips.

## Executed calculation
Prescribed flyby generalized force `f(t)=f_peak/[1+(t/τ)²]^(3/2)`, with `τ=b/v`. Integrated `M q¨ + Γ q˙ + κq(q²-q_±²)=f(t)` by DOP853, starting at the negative well.

Toy SI fixture: `L=1m, B_b=.005 N m², T_b=.02N, K_a=1 N/m, d_0=.12m, M=.1kg, Γ=.08kg/s`. Derived `d_cr,1=.0693480m`, `d_cr,2=.2173921m`, `q_±=±.143278m`, `ΔU=.00128281J`, `f_fold=.01378455N`. First retained-state switching peak forces for `τ=.2,.5,1,3,8s` are respectively `.0657384,.0325605,.0222801,.0162387,.0146488N`. Energy balance residual ~`5.7e-13 J`.

**Approximation check:** maximum slope ~.450. Using exact arclength rather than quadratic shortening shifts the equilibrium amplitude by −3.17% and barrier by −9.36% in this fixture. These are leading-order Galerkin results, not exact elastica.

## Failure / physical discriminator
Memory requires a persistent compressive constraint. Release the end-shortening or allow unconstrained lateral relaxation and the double well may disappear. A real 3D timesheet may redistribute compression, so a full finite-core hypersurface calculation is necessary. No gravity, particle-state, or cosmological prediction is established.

**Next solver test:** finite 3D sheet patch with explicit finite-radius filament contact; compare pinned versus free boundary conditions and track lowest Hessian eigenvalue, barrier and retained configuration. Reject this mechanism if all physically permitted relaxed configurations are convex.

## Provenance and source coverage
- Historical Nathan material: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt`, opening ~23,000 characters / lines 1–358 (flexible time surface and hysteresis conjecture; not validated physics).
- Historical mixed compilation: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H FIRST BUILD.txt`, opening ~23,000 characters / lines 1–441; compilation status not elevated.
- Current HsH worker specification: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt`, **entire 956 lines**, especially §8 lines 449–605 (sheet tension/bending).
- Common onboarding, symbol registry, citation policy, current workflow, October 5 HSH_RESOURCES reference desk and War Room declaration reviewed. 41 declaration routes triaged. No quarantined PRIOR_ART entered. Known primary files read directly; no corpus-wide Mersearch run and no novelty claim.
- All new variables are `LOCAL:MERCER-GEOMETRIC-BUCKLING-20261009`; `B_b` is **not** SAT's historical `B` projection quantity.

**Reproducibility:** solver, CSV, energy audit, and five Class-P figures packaged in the conversation artifact `MERCER_GEOMETRIC_BUCKLING_MEMORY_2026-10-09.zip` (not committed to this repo).