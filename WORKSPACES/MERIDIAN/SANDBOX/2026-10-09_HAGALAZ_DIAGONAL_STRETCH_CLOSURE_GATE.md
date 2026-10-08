# Meridian sandbox | 2026-10-09 | Hagalaz diagonal-stretch closure gate

**Status:** SANDBOXED mathematical construction, conditional material-mechanics candidate. No SAT/H(s)H premise promotion, physical validation, or historical-constant fitting.

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT GEOMETRIC SOLVERS.txt`, **complete**, 5,516 characters; blob `5429f7cb2adbfdc0abab7db46eff4ca4de08358a`. Historical mixed conversation/synthesis: UI relative-frame `G(λ)=D(λ)R(λ)`, isotropic `D=qI`, optional spheres, separate Whirligig and Spheres solvers. Not presumed Nathan-authored throughout.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H STRUCTURAL SKETCH.txt`, opening lines 1–380, 20,408 returned characters; blob `64906501d01db12171d3a2e58dc4fd0140d2784d`. Historical Nathan comments distinguished from assistant synthesis. Relevant: 4D UI rotation-expansion, tentative anisotropic expansion, no fit-to-target rule.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Math Extension.txt`, lines 1–300, 1000–1300 and 2500–2700, 11,885 returned characters; blob `aadf275de914f941298951d7d34205dd4e90dc33`. Historical assistant interoperability/constraint proposals, not physics authority. Ranged request for lines 3800–4500 returned empty; **not counted as read**.
- Read `BEDROCK.md`, controlling Common front door and workflow/symbol/citation/toolbox documents, Reference Desk, Mersearch stable release guidance, and earlier Meridian pressure-rank checkpoint. BigBook **index** read as navigation; the underlying oversized BigBook returned no ranged content and was not claimed read.
- Overview-read HSH_RESOURCES War Room declaration/link inventory, HQ Tool Chest, toolkit source index, toolkit digestion plan, preferences BOOT and human resource index. No quarantined/PRIOR_ART material accessed. No corpus-wide search was performed: exact identified sources were read, not generic GitHub corpus-search substitutes for Mersearch.

## Exact operator closure result

The historical UI's anisotropic diagonal-stretch plus rotation family `T=D R` is **not composition-closed**. For two operations,
`T=D₂ R₂ D₁ R₁`, with positive diagonal `D_i` and `R_i∈SO(4)`.

If `T=D R` with diagonal `D`, then `TTᵀ=D²` must be diagonal. If `T=R D`, then `TᵀT=D²` must be diagonal. Both fail generically.

Exact specimen: `D₁=diag(2,1,1,1)`, `D₂=diag(1,3/2,1,1)`, `R₂=R₀₁(π/4)`, `R₁=I`.

```text
TᵀT = [[13/2, 5/4], [5/4, 13/8]] ⊕ I₂
TTᵀ = [[5/2, 9/4], [9/4, 45/8]] ⊕ I₂
det T = 3
cos(angle between transformed material axes) = 5/13
angle = 67.38013505196°
singular values = (2.60803103415, 1.15029306044, 1, 1)
```

**Closure repair:** re-factor after every composition with the unique polar decomposition `T=S_L R_L=R_R S_R`, `S_L=(TTᵀ)^(1/2)`, `S_R=(TᵀT)^(1/2)`, `S` symmetric positive-definite and `R∈SO(4)`. SPD(4) is not a subgroup under multiplication. The composite grammar occupies `GL⁺(4)` if arbitrary positive stretches and SO(4) rotations are admissible.

**Infinitesimal gate:** `[diag(h_i), J_ij]=(h_i-h_j)(E_ij+E_ji)`: anisotropic expansion plus rotation generates symmetric off-diagonal shear. Exact Lie-closure ranks with all six SO(4) generators: `diag(1,0,0,0) → 16 = dim gl(4)`; trace-free `diag(3,-1,-1,-1) → 15 = dim sl(4)`; isotropic `I → 7` (uniform scale + SO4). These are mathematical transformation possibilities, not physical admissibility rules.

## Conditional physical test

Only if `T` is a **material deformation gradient**, rather than a UI coordinate comparison, may `C=TᵀT` be used as a material metric. An illustrative isochoric Hencky-strain energy with dimensionless modulus 1 gives

```text
E(φ) = (ln 3)^2/8 + acosh[(25+15 sin²φ)/24]^2/4
E(0°)=0.171558863804; E(45°)=0.318386432446; E(90°)=0.452605860305
dE/dφ at 45° = +0.280148349849 per radian
```

A restoring torque `-dE/dφ` is a **candidate only if** actual material axes and a constitutive energy are specified. Arbitrary UI coordinate rotations do not create physical strain, force, or torque.

**Failure conditions:** a diagonal `D R` solver claiming generic composition closure; nonzero shear from only isotropic scales plus rotations; any material energy assigned to coordinate changes alone; or physical torque without a constitutive law.

**Next solver:** finite-core 4D tube under two physically specified directional stretch/rotation controls. Compute polar factors, material metric and director transport after each operation. Contrast a representational UI (no material energy) with a hyperelastic worldtube (energy and torque); test rate-dependent hysteresis separately.

**Verification:** SymPy exact matrices and Lie ranks; NumPy/SciPy 1,000 randomized polar, determinant and SO(4) covariance checks; analytic versus finite-difference strain-energy derivative. Maximum polar orthogonality residual `7.36e-14`; analytic energy error `3.33e-16`; derivative discrepancy `3.77e-11`. Full reproducible `solver.py`, `verification.json`, three Class P figures and expanded checkpoint are in the run's local artifact bundle.

**Symbol namespace:** all `T,D_i,R_i,S,C,H,J,E` above are LOCAL:MERIDIAN-HAGALAZ-CLOSURE, not new shared definitions. No BEDROCK edit.

*Meridian ◈*