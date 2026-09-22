# SAT / H(s)H Shared Symbol Registry

**Control policy:** `WORKSPACES/COMMON/NONNEGOTIABLE_SYMBOL_MANAGEMENT.md`  
**Status:** live human-readable registry  
**Established:** 2026-09-21

This registry exists to prevent symbol collision while preserving historical notation and cross-field source fidelity.

A symbol appearing here is **not automatically canonical theory**. The entry records what the symbol means, where it belongs, and what status that meaning currently has.

## Registry rules

- Namespace is part of identity even when not printed in an equation.
- Historical meanings are preserved rather than silently rewritten.
- Aliases aid search; they do not by themselves prove semantic equivalence.
- If an entry is marked `UNRESOLVED`, `PROVISIONAL`, or `HISTORICAL`, do not promote it by repetition.
- Before adding a shared symbol, collision-check this file and use Mersearch for archive/source variants.
- When a collision is found, add it here even if the final replacement symbol has not yet been chosen.

---

## STD:α — fine-structure constant

- **canonical_symbol:** `α`
- **namespace:** `STD`
- **display_name:** fine-structure constant
- **aliases:** `alpha`, `\alpha`
- **meaning:** standard dimensionless electromagnetic coupling constant
- **mathematical_type:** dimensionless scalar
- **dimensions:** `1`
- **units:** dimensionless
- **domain_or_solver:** established physics
- **epistemic_status:** established empirical / standard physical constant
- **known_collisions:** generic angle notation using bare `α`; historical/project `α_sat` is a separate qualified quantity and must not be collapsed into `α`
- **does_not_imply:** any project-internal angle or aperture is the fine-structure constant merely because it uses alpha notation
- **control_note:** reserve bare `α` for the fine-structure constant in shared physics-facing work

---

## LOCAL:CIRCLE-PACKING:Δ_n — n-circle tangent-step angle

- **canonical_symbol:** `Δ_n`
- **namespace:** `LOCAL:CIRCLE-PACKING`
- **display_name:** n-circle oriented tangent-step angle
- **aliases:** `Delta_n`, `\Delta_n`
- **meaning:** oriented angular step between successive consistently oriented inner-aperture tangents in the regular n-circle construction
- **mathematical_type:** scalar angle
- **geometry_role:** tangent-angle step associated with cyclic n-fold equal-circle packing
- **dimensions:** `1`
- **units:** radians by default
- **angle_convention:** `Δ_n = 2π/n` for the undeformed planar regular construction
- **domain_or_solver:** current triswale / circle-packing exploration
- **equations_or_relations:** `Δ_n = 2π/n`; for `n=3`, `Δ_3 = 2π/3`
- **epistemic_status:** standard planar geometry under the stated construction
- **known_collisions:** earlier scratch use of `α_n` for this quantity; retired because bare alpha collides with `STD:α`
- **maps_to:** potential deformed/signed descendants require new qualified notation rather than silently changing `Δ_n`
- **does_not_imply:** the exact algebraic identity `1/(2Δ_3)=3/(4π)` establishes the historical or physical origin of SAT/H(s)H `B`

---

## SAT/HSH:B — candidate dimensionless B quantity

- **canonical_symbol:** `B`
- **namespace:** `SAT/HSH` pending genealogy split if needed
- **display_name:** historical SAT / current H(s)H B quantity
- **aliases:** `B`, `3/(4π)`, `3/4pi` where explicitly identified by source
- **meaning:** project quantity numerically/algebraically identified in many sources with `3/(4π)`; its exact geometric interpretation and historical derivation remain under provenance audit
- **mathematical_type:** dimensionless scalar
- **dimensions:** `1`
- **units:** dimensionless; do not call the value “radians” unless a particular angular construction explicitly supplies that interpretation
- **domain_or_solver:** SAT / H(s)H metrology and geometry
- **equations_or_relations:** commonly `B = 3/(4π)`; current local circle-packing observation gives exact algebraic identity `1/(2Δ_3)=3/(4π)`
- **epistemic_status:** numeric identity standard; project role/origin unresolved / provenance-controlled
- **known_collisions:** multiple historical descriptions such as projection constant, volume-normalization quantity, stability-related quantity; do not merge these descriptions without derivation
- **does_not_imply:** the circle-packing identity proves that the circle-packing construction is the source of historical `B`

---

## SAT:ℓ_f — historical filament/coil scale symbol

- **canonical_symbol:** `ℓ_f`
- **namespace:** `SAT`
- **display_name:** historical SAT filament/coil scale symbol
- **aliases:** `\ell_f`, `l_f`, `lf`, OCR/transcription variants
- **meaning:** historical symbol with semantic drift/collision in the archive; occurrences around `0.7937 fm` have been described as a resolved helical/coil/nuclear-scale radius rather than securely established as the microscopic filament-core radius
- **mathematical_type:** scalar length
- **dimensions:** `L`
- **units:** typically fm in the cited legacy scale family
- **domain_or_solver:** historical SAT metrology
- **epistemic_status:** HISTORICAL; SEMANTIC GENEALOGY UNRESOLVED
- **known_collisions:** microscopic filament thickness; coil radius; helical radius; current H(s)H Kerr-core or shell radius
- **historical_meanings:** preserve source-specific wording and dates; do not flatten to one retrospective definition
- **does_not_imply:** `ℓ_f` is the present triswale bounding-filament radius; `ℓ_f` is the Kerr-core radius; `ℓ_f` is the outer-shell radius
- **control_note:** do not reuse for a new active scale until the genealogy and mapping are explicitly resolved

---

## SAT:ε — historical microscopic-thickness candidate

- **canonical_symbol:** `ε`
- **namespace:** `SAT`
- **display_name:** historical string/filament thickness candidate
- **aliases:** `epsilon`, `\epsilon`
- **meaning:** older SAT material contains a candidate intrinsic thickness near `2×10^-21 m`; exact origin and modern interpretation require provenance audit
- **mathematical_type:** scalar length
- **dimensions:** `L`
- **units:** metres in the recovered legacy statement
- **epistemic_status:** HISTORICAL / UNRESOLVED
- **known_collisions:** epsilon is heavily overloaded in mathematics and physics; never use bare `ε` across namespaces without local definition
- **does_not_imply:** current H(s)H filament core or shell thickness

---

## LOCAL:TRISWALE:r_f — triswale bounding-filament radius

- **canonical_symbol:** `r_f`
- **namespace:** `LOCAL:TRISWALE` pending promotion if adopted project-wide
- **display_name:** bounding-filament radius in the three-circle/triswale construction
- **aliases:** `r_f`, `r_{f}`
- **meaning:** radius of each of the three equal bounding filament circles/cross-sections used to construct the central aperture/triswale
- **mathematical_type:** scalar length
- **geometry_role:** radius of bounding circles, NOT radius of the inscribed central twisted surface
- **dimensions:** `L`
- **units:** scale-dependent / symbolic unless an external scale is supplied
- **domain_or_solver:** triswale local geometry
- **epistemic_status:** PROVISIONAL WORKING DEFINITION
- **known_collisions:** historical `ℓ_f`; generic filament-radius notation elsewhere; possible Kerr-core/shell radii
- **does_not_imply:** identity with historical `SAT:ℓ_f` or any Kerr radius

---

## LOCAL:TRISWALE:θ_4 — inverse plane-tilt / helix-angle coordinate

- **canonical_symbol:** `θ_4`
- **namespace:** `LOCAL:TRISWALE` until the active H(s)H convention is reconciled project-wide
- **display_name:** theta-four angle in the current twisting-circle/helix correspondence
- **aliases:** `theta_4`, `\theta_4`, `θ4`
- **meaning:** in the current construction, complementary angle to the equatorial-plane tilt relative to the common coplane; measured from the common coplane normal under Nathan's stated convention
- **mathematical_type:** scalar angle
- **dimensions:** `1`
- **units:** radians symbolically; degrees may be shown numerically when useful
- **angle_convention:** if ordinary plane tilt is `δ = angle(Π_i, Π_0)`, current convention is `θ_4 = π/2 - δ`; any helix-pitch mapping must state which pitch-angle convention is being used
- **domain_or_solver:** triswale / helix correspondence
- **epistemic_status:** PROVISIONAL ACTIVE CONVENTION; requires reconciliation against historical SAT/H(s)H `θ_4` usages before promotion
- **known_collisions:** historical theta-four conventions may differ; angle-from-axis versus angle-from-plane complements are a known hazard
- **control_note:** do not quote a historical `θ_4` value into this convention without checking whether the source measures from the axis/normal or from the plane

---

## LOCAL:TRISWALE:A_3 — signed threefold triswale deformation amplitude

- **canonical_symbol:** `A_3`
- **namespace:** `LOCAL:TRISWALE`
- **display_name:** signed threefold triswale deformation amplitude
- **aliases:** `A3`, `A_3`
- **meaning:** proposed coefficient for the leading threefold nonplanar deformation mode, e.g. a local form proportional to `ρ^3 cos(3φ)` after normalization/convention is specified
- **mathematical_type:** scalar coefficient
- **geometry_role:** signed deformation/order-parameter candidate; not an ordinary point curvature at the saddle center
- **dimensions:** depends on chosen normalization; MUST be declared in any concrete use
- **sign_or_chirality_convention:** not yet globally fixed; every artifact using sign must state which handedness is positive
- **epistemic_status:** PROVISIONAL / TO BE DERIVED
- **does_not_imply:** established de Sitter/anti-de Sitter curvature, cosmological constant, or physical baryon asymmetry

---

## Entry template

Copy this block for additions:

```text
## <NAMESPACE>:<SYMBOL> — <display name>

- canonical_symbol:
- namespace:
- display_name:
- aliases:
- meaning:
- mathematical_type:
- geometry_role:
- dimensions:
- units:
- angle_convention:
- sign_or_chirality_convention:
- domain_or_solver:
- equations_or_relations:
- provenance:
- epistemic_status:
- first_known_use:
- current_source:
- known_collisions:
- historical_meanings:
- maps_to:
- does_not_imply:
- notes:
```

Fields that do not apply may be marked `N/A`; they should not simply disappear when their absence could hide ambiguity.
