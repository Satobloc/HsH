# Meridian: finite-core 4D Jacobian and material-twist gate
**Date:** 2026-10-08 | **Status:** SANDBOX / NON-CANONICAL | **Namespace:** LOCAL:MERIDIAN_TUBE_GATE | **Quarantine:** none entered | **Author:** Meridian assistant.

## Sources actually read
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/THE SPHERES.txt`, lines 1900–2360: axis-bend pressure, shell handoff, helical winding and holonomic reconnection; historical lattice/damping/particle claims SOURCE ONLY. ⟦SAT:THE_SPHERES·L1900–2360⟧
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, lines 1–350: Euclidean R4, UI y=rRx0, superhelices and candidate bending energy; historical constant/particle claims SOURCE ONLY. ⟦SAT:MATH_BACKBONE·L1–350⟧
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Math Extension.txt`, lines 1–650, 1000–1600, 2000–2500: proposed cross-field translation, constraints and continuum mechanics. Assistant-origin claims are exploratory, not premises. ⟦HSH:MATH_EXTENSION_30SEP·L1–650,L1000–1600,L2000–2500⟧
- Followed `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` and live Common/BEDROCK controls; reviewed October 5 HSH_RESOURCES Reference Desk/source refresh and War Room link graph, plus resource toolkit/tool-chest/preference routes. This was **navigation-level** familiarity, not a deep read of every linked resource. No quarantined PRIOR_ART consulted. Mersearch stable 1.0 was reviewed as the corpus-wide search default; this bounded test used exact known file paths and direct substantial reads, not a corpus-wide search.

## Independent geometry
For a unit-speed centerline X(s) in Euclidean R4, tangent T, and a Bishop normal frame N(s) (4×3), let T'=Nκ and N'=-Tκᵀ. Give the core material coordinates u∈B³_a and a physical material orientation U(s)∈SO(3):
```
F(s,u)=X(s)+N(s)U(s)u
F_s=[1-κ·Uu]T+NU'u,    F_{u_i}=NUe_i
det DF=1-κ·Uu
```
The exact 4D volume is `V4=L V3` for any centered cross-section, provided F is injective and orientation preserving. A sufficient **local** gate is `a|κ|<1`; global self-contact requires a separate reach test.

For a round 3-ball, `V3=4πa³/3` and `M_ij=∫u_i u_j d³u=(4πa⁵/15)δ_ij`. Thus a *chosen* small-strain continuum functional yields
```
E_b=(E4/2)∫κᵀUMUᵀκ ds = (2π E4 a⁵/15)∫|κ|² ds
E_tw=(G4/2)∫tr(WᵀWM) ds = (4π G4 a⁵/15)∫|ω|² ds
```
where W=UᵀU' in the Bishop frame, ω is its axial vector, and E4/G4 are arbitrary test moduli. These are **not** derived SAT dynamics.

**Correction to an earlier simplification:** a spherical core has zero *shape-only* orientation sensitivity, but a spherical **materially labeled solid** can still store shear/twist energy. Shape isotropy is not the same as material gauge redundancy. If the core has no physical material labels/director, U is pure gauge and no U-dependent physical energy is licensed.

For an arbitrary rotating normal frame, use `A_N=NᵀN'` and `W_cov=Uᵀ(A_N U+U')`. Under N→NH, U→HᵀU, both F and W_cov are unchanged. A solver that assigns twist energy to UᵀU' in an arbitrary moving frame **fails gauge invariance**.

## ᚼ compatibility
For the full similarity transformation F→μQF+t (μ>0,Q∈SO4), `a→μa`, `κ→κ/μ`, `ω→ω/μ`, `ds→μds`. At fixed 4D energy-density moduli, `V4,E_b,E_tw→μ⁴×` their old values. This is a conditional dimensional gate, not a physical scaling prediction. Use the full 11-DOF similarity envelope, not an unproved closed eight-slot subgroup.

## Numerical fixture (script + figures in task attachment)
Closed R4 circle of radius R=2; 3-ball radius a=0.35; one full material turn q=1/R=0.5; arbitrary E4=3,G4=2. Then aκ=aq=0.175. Verified `V4=2.256849539715766`, `M_ii=0.004400062310740303`, `E_b/L=0.0016500233665276136`, `E_tw/L=0.0022000311553701515`. Maximum determinant residual 6.66e-16; finite-difference Jacobian 4.96e-11; gauge-covariant spin residual 2.30e-16; SO4 covariance 1.22e-15; quadrature energy discrepancies <7e-18. All tests passed.

## Failure conditions and next cursor
- Local failure at a|κ|≥1; nonlocal self-overlap possible even below it.
- If only shape, not material, is modeled, twist energy must vanish for a round unmarked core.
- A 3D-space rod bending exponent a⁴ cannot silently replace the 4D-normal-ball exponent a⁵.
- **Next calculation:** give the 3-ball an anisotropic moment tensor, impose a pressure gradient and solve periodic Euler–Lagrange material twist, testing whether twist emerges without being prescribed, while preserving gauge covariance and similarity scaling.

**Artifact:** `meridian_finite_core_material_gate_2026-10-08.zip` attached in task thread; contains full checkpoint, executable Python, verification JSON and four script-rendered figures. Repo checkpoint is a concise index to that package.
