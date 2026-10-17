# MK161 | Four-dimensional braid escape (SANDBOXED)
2026-10-08 | Morrow / Kestrel | geometry + conditional toy mechanics. Not canonical theory.

## Source coverage / boundaries
- Old SAT primary: Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/GRAVITY TWIST.txt, lines 1–290 and 500–880; Nathan explicitly considers physically continuous 4D worldlines and possible cross-temporal tug. No gravity-aging mechanism adopted.
- Additional old archive: 2026/SAT THEORY — Worldlines.txt, lines 100–400; assistant-heavy historical three-filament language, not validated particle assignments.
- HsH September 30: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt, lines 1–290 and 600–1000; nested transport/memory exploration, mainly assistant commentary.
- Additional HsH September 30: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 PRE HsH/SAT 2026 PARTICLE TYPES — Worldlines.txt, lines 80–370. It overlaps older text and is not independent confirmation.
- Current front door NEW_INSTANCE_START_HERE.md, Reference Desk, control/notation/citation/tool/scheduler routing, War Room DECLARATION, HSH_RESOURCES Tool Chest/toolkit/index/BOOT reviewed. No PRIOR_ART exposure. Mersearch stable-1.0 documented but no local repo checkout or internet resolution to execute corpus-wide; targeted exact-path connector reads only. No corpus-wide absence claims.
- Comparison with MK155: its discriminant winding was explicitly planar and its result conditioned on transverse-plane restrictions. This work removes that restriction.

## Local notation
LOCAL:MK161 only. s=x^0=ct (length), t=s/L, h∈[0,1] is a mathematical deformation parameter, not a second physical time. R=triad radius; L=longitudinal length; r_core=trial Euclidean core radius. K and kappa are **new toy constitutive coefficients**, beta=kappa L²/K. Standard c remains light speed.

## Exact counterexample: a 4π braid becomes straight
Start with three distinguishable transverse points
p_j^0 = R(cos(2πj/3), sin(2πj/3), 0), j=0,1,2.
Let theta=πh/2, C=cos(theta), S=sin(theta), phi=2πt, and unit quaternion
q(t,h)=(S²+C² cos(phi), CS[1-cos(phi)], CS sin(phi), C² sin(phi)).
Then q(0,h)=q(1,h)=1. Define p_j(t,h)=q p_j^0 q^{-1} and four-dimensional worldlines X_j(s,h)=(s,p_j(s/L,h)).
At h=0, q=(cos 2πt,0,0,sin 2πt), producing 4π planar triad rotation (MK155 k=6, projected discriminant winding 12). At h=1, q=1 and all three strands are straight. Every strand's endpoints stay fixed. Every same-s pair stays exactly sqrt(3)R apart for all h: **no reconnection or collision**.

The speed bound |dp_j/ds| <= V=4πR/L makes every strand timelike in Minkowski geometry when L>4πR (x^0=ct units). Moreover the auxiliary Euclidean R4 centerline clearance obeys
d_min >= sqrt(3)R/sqrt(1+V²).
Thus disjoint Euclidean radius-r_core tubes are guaranteed when 2r_core is below that bound.

Fixture R=1,L=40,r_core=0.2: V<=0.3141593 c; rigorous d_min>=1.65242534 > 0.4. Direct numerical minimum centerline distances for h=0,.25,.5,.75,1: 1.70948725, 1.71569701, 1.72653218, 1.73158770, 1.73205081. At h=.25,t=.5, strands 1 and 2 have identical projected XY=(-.5,0), but Z=±sqrt(3)/2: their true 3D transverse separation is sqrt(3). The planar discriminant winding changes at **projected collisions only**, not physical collisions.

This explicit contraction is consistent with the 4π triviality in SO(3). It demonstrates that planar B3 braid winding need not survive as an invariant of three timelike filaments with all three transverse dimensions available. A k=3/2π rigid-triad loop remains nontrivial within SO(3), though a more general shape-changing configuration-space contraction is possible; not constructed here.

## Conditional material barrier
For a trial plane-confinement model define
E=(K/2)Σ_j∫|dp_j/ds|²ds+(kappa/2)Σ_j∫p_{jz}²ds.
Let A=sin²(2theta). Exact integrals:
Σ∫|dp_j/ds|²ds=(24π²R²/L)(C²+C⁴);
Σ∫p_{jz}²ds=3R²L(A-3A²/4).
Hence
E/(KR²/L)=12π²(C²+C⁴)+(3 beta/2)(A-3A²/4).
Near theta=0, ΔE/(KR²/L)=[-36π²+6 beta]theta²+O(theta⁴).
The original twisted state is locally uphill along this escape family if beta>6π²≈59.2176264. For beta=120, E(0)/(KR²/L)=236.8705, escape-family peak≈250.4957 near h=.183, finite barrier≈13.6251; E(1)=0. **Not a topological barrier or proof of stability against all perturbations.** Numerical quadrature independently reproduces the exact formula to ~5e-4 normalized units.

## Attack / discriminator
- h is a homotopy between *possible entire histories*, not an actual dynamical process rewriting an already-instantiated past.
- If a timesheet or other physical constraint enforces 2D transverse confinement, this escape route is disallowed and planar braid topology can matter.
- This exact route reduces each strand's contour length from 41.927477 to 40 (R=1,L=40); strict inextensibility needs compensating slack/deformation.
- True Lorentzian core definition and any material dynamics remain unspecified. Euclidean tube radius is an auxiliary fixture; same-time clearance and timelike speed are separately verified.
- Additional attached surfaces, frame twist, or global constraints may conserve information not captured by centerlines.
- Next solver: explicit finite-core/Cosserat rods, fixed labeled endpoints, causal velocities, sweep beta across 6π²; vary inextensibility and bending; minimize over unrestricted deformations, not only the hand-chosen path. Track true 3D core clearance, projected braid winding, strain, and saddle barriers. **Failure test:** does the purported protected braid survive when transverse-plane confinement is removed?

Reproducible script and 11 precision figures prepared in task-thread MK161 bundle; GitHub solver upload may require separate transport. No historical numerical constant or particle label was used as a target.
