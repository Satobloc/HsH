# SANDBOXED | Mercer: redshift-field finite-energy gate versus director-wave admissibility (2026-10-11 UTC)

**Status:** independently computed constitutive comparison, not theory authority. **Cross-formalism:** CF-008, CF-009, proposed CF-015. No particle constants were used as targets.

## Sources actually read
- SAT old archive `SAT ALL TOGETHER SYNTHESIS.txt`, blob `86cf006ca5ebf58263552c7515a9c9d575caae37`: substantial first ~18k/37k characters, Nathan's worldline/timesheet grammar, timesheet backreaction, primary Euclidean 4D proposal; remaining portion not claimed read.
- SAT old archive `RMS Spacetime Filaments.txt`, blob `0323682e7a49278b5a76d0c6a5a7787a13eb17d6`: complete 10,663-character historical filament/wavefront and multi-scale hierarchy text, including repeated version.
- SAT old archive `H(s)H MATH TO DO.txt`, blob `f827a01577d98ad1cb3ba3a75c5dd66e1bccc952`: substantial first 14k/46k characters, Python/SciPy/SymPy/PDE toolbox and invariant-curve methods; this is a tool plan, not a physical premise.
- HsH Sep 30 `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`, blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`: complete 9,258-character unextended compilation, particularly intuition 5/6, Proposition B and E. Compiled authorship not independently established at message granularity.
- HsH Sep 30 `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/10-20-25 FULL THEORY.txt`, blob `6956c011e1ab70b0e2cad9b2b8a99fa4915eb4da`: opening ~6k/127k characters, foundational premises and backreaction, not a full read.
- After independent construction, compared `WORKSPACES/MERCER/SANDBOX_2026-10-11_HOUSEHOLDER_SCHWARZSCHILD_ELASTIC_GATE.md`, blob `5c91ab82fab083e3b88fd8d935e2d296d11e366c`, full; `WORKSPACES/MERIDIAN/SANDBOX_2026-10-05_BASIS_FREE_LORENTZ_RECOVERY.md`, blob `e1e7c7590ad20bae1b75507f24887b67589dd9c6`, full; `WORKSPACES/RAVEL/SANDBOX_2026-10-09_STRAIGHT_VACUUM_COILING_GATE.md`, blob `8a8d88d1b536b844cdb0ea70ff33820310bd1bac`, full.
- Onboarding: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` and its materially relevant policies/registries, BEDROCK, cross-formalism index, reference desk and Mersearch guidance read. HSH_RESOURCES packet overview-read via toolkit index, digest, Tool Chest, BOOT, War Room declaration and safe directory inventories (H(s)H_Toolkit, HISTORICAL, KERR, tools, DATA, HQ, indexes, info, source inventory, historical Einstein/Minkowski references and War Room link routes). No restricted Hypothesis H/direct Schreiber materials opened; other PRIOR_ART/QUARANTINE paths excluded. BigBook HsH working index available; the two stated HSH_RESOURCES `.[⚙️_AI_FILES]/INDEXES/` paths returned 404. War Room links reviewed as routing, not all individual contents ingested.
- Shared Mersearch request `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` was occupied by Orson (`2026-10-10-orson-one-drop-universe-math-001`); it was not overwritten. Targeted known-source reads are not a corpus-wide Mersearch novelty audit.

## Historical idea versus new construction
Historical source proposal: worldline/finite-worldtube intersections act on the time wavefront, producing reciprocal backreaction and metric curvature; gravity is to retain standard GR as far as possible. The earlier Mercer checkpoint showed the Householder metric `g=δ−2u⊗u` can encode the exact Schwarzschild exterior if standard vacuum Einstein equations are supplied, but constant-stiffness director energy diverges logarithmically. **This pass does not derive gravity from SAT.** It compares alternative constitutive variables and checks whether a finite-energy repair is dynamically admissible.

## LOCAL namespace
All symbols in this note are `LOCAL:MER-REDGATE-20261011` except `c,G,M` (STD). `r_s=2GM/c²` [L], `r_0` [L] inner cutoff, `R` [L] outer cutoff, `a_m(r)=cos(2θ_d)` [1] metric coefficient, `θ_d` [rad] Euclidean director angle **not** the SAT particle angle `θ_4`, `κ_A` [J/m] scalar stiffness, `κ_u` [J/m] director stiffness. No claim of equal `κ_A` and `κ_u` physical meanings.

## Exact geometry and scalar constitutive alternative
Use Euclidean flat R4 with `u=cosθ_d e_0+sinθ_d e_r` and `g=δ−2u⊗u`. For spherical static vacuum GR input, `a_m(r)=1−r_s/r`, `sin²θ_d=r_s/(2r)` for `r≥r_s`. The director gradient norm is
`|∇u|²=(r_s/r³)[1+1/{8(1−r_s/(2r))}]`.
Consequently `E_u=(κ_u/2)∫|∇u|²d³x` grows as `(9π/4)κ_u r_s ln(R/r_s)`: not finite as R→∞.

Instead make the **metric coefficient**, not the unit director, the local scalar constitutive variable:
`E_A=(κ_A/2)∫_{r≥r_0}|∇a_m|²d³x`.
Its exterior Euler–Lagrange equation is `∇²a_m=0`; for `a_m(∞)=1` and boundary flux `4πr² a_m'=4πr_s`, the unique spherical solution is `a_m=1−r_s/r`. The energy is **finite**:
`E_A(R)=2πκ_A r_s²(1/r_0−1/R)`,
`E_A(∞)=2πκ_A r_s²/r_0`.
This is a candidate scalar constitutive *representation*, not the Einstein–Hilbert action. Harmonicity of `a_m` matches Schwarzschild in this spherical exterior ansatz but does not establish arbitrary vacuum GR, a covariant field law, source coupling or positivity of gravitational binding energy.

## Two scale / stiffness regimes
For weighted director energy `E_p=(κ_u/2)∫sin^p(θ_d)|∇u|²d³x`, asymptotic `θ_d~r^{-1/2}` implies integrand `dE_p/dr~r^{-1-p/2}`. Thus `p=0` logarithmically diverges; any `p>0` converges. At `r_0=r_s=κ_u=κ_A=1` numerical values:
| R | director p=0 | director p=1 | director p=2 | scalar A |
|---:|---:|---:|---:|---:|
| 10 | 16.780126 | 7.103021 | 3.331544 | 5.654867 |
| 100 | 33.092490 | 9.270390 | 3.650636 | 6.220353 |
| 1000 | 49.372049 | 9.954102 | 3.682455 | 6.276902 |
| ∞ | diverges | 10.270224 | 3.685989 | 6.283185 |

If `r_0` is fixed across source masses, `E_A∝M²`; if `r_0∝r_s∝M`, `E_A∝M`. This scaling is an internal model discriminator, **not** a derivation of `Mc²` or a particle/core radius.

## New obstruction: finite energy trades against regular director dynamics
In director coordinates `a_m=cos2θ_d`, the scalar energy becomes `E_A=2κ_A∫sin²(2θ_d)|∇θ_d|²d³x`. Its effective angular stiffness vanishes at the aligned vacuum `θ_d=0`. With an analogous kinetic term, there is no ordinary nondegenerate quadratic linearized wave action for `θ_d`. Keeping a nonzero angular kinetic term instead makes the characteristic speed vanish in the vacuum for this scalar-gradient choice.

An even sharper test: an **unconstrained** scalar wave `∂_t²a_m=c²∇²a_m` need not preserve the Householder representability bound `|a_m|≤1`. Choose smooth, admissible initial data
`a_m(r,0)=1−ε(r/a)² exp[−(r/a)²]`, `∂_t a_m(r,0)=0`, with `0<ε<1`. The corresponding initial director is smooth at the origin: `sinθ_d=√(ε/2)(r/a)exp[−r²/(2a²)]` and `u_i∝x_i exp[−r²/(2a²)]`. The exact 3D radial wave solution at the origin is
`a_m(0,t)=1−ε(ct/a)² exp[−(ct/a)²](3−2(ct/a)²)`.
For `ct/a>√(3/2)`, `a_m(0,t)>1`, **so no real Euclidean unit director can generate it**. At `ε=0.1`, `ct/a=1.5`, exact `a_m(0,t)=1.0355722383`. Independent conservative radial finite-difference wave evolution gives `1.0355715508` at `dr/a=.01, cdt/a=.004`, and `1.0355720669` at twice the spatial/time resolution. This is an explicit counterexample to the *unconstrained scalar wave* completion, not to all constrained or tensorial H(s)H dynamics.

## Reproducibility and numerical gates
Executed SciPy quadrature for all energy values and finite-volume radial harmonic equation on [1,20]. Max absolute `a_m` errors for N=64,128,256,512,1024 cells: `2.562e-3,6.601e-4,1.663e-4,4.164e-5,1.042e-5` (second-order). Radial numerical flux is spatially constant to <3e-11 relative spread, although its discrete value converges to analytic flux under refinement. Radial wave finite-difference max errors: `7.68e-6` (coarse) and `1.92e-6` (refined). Full executed script and JSON/figures are attached in the conversation sandbox; this GitHub note does not claim those binary figures are committed.

## Failure gates and next calculation
1. A positive nondegenerate local first-gradient director stiffness `κ_u(0)>0` cannot have finite total energy for this exact asymptotic Schwarzschild director. This statement is restricted to the specified director/gradient functional.
2. A scalar `a_m` with finite energy must preserve `|a_m|≤1` dynamically if it is to remain a real Householder unit-director parameter; the free scalar wave fails that requirement.
3. Test a **constraint-preserving finite-core hyperbolic sigma-model** for `u∈S³` with covariant principal symbol and a metric-derived energy/flux law. Check whether it retains finite far-field energy without loss of linear vacuum waves or superluminal modes. Also test non-spherical vacuum Einstein residuals and whether `r_s` arises from source/boundary stress instead of being imposed.

**Nothing here is a physical claim.** Mercer Calder | 2026-10-11 | SANDBOXED
