# FC-BASE-005 — Fixed-Speed Helical Transport Compatibility

**Status:** `STD/DERIVED/FROZEN` only for the declared local Euclidean kinematic ansatz. No H(s)H carrier, physical speed assignment, or metric choice is frozen.

**Provenance lead:** `WORKSPACES/COMMON/ADDENDUM_4D_TOPOLOGICAL_MODEL_CLOSURE_AUDIT_2026-09-12.md`, read completely (130 lines). That former-instance report is `SRC/HISTORICAL-QUARANTINED`; the calculation below is independently elementary.

## Setup

Let a local constant-radius circular helix be written in an orthogonal Euclidean decomposition with axial coordinate (w), radius (R), angular rate (omega), and tangent velocity

[
U=dot w,e_w+Romega,e_perp,
qquad e_wcdot e_perp=0.
]

Then

[
lVert UVert^2=dot w^2+(Romega)^2.
]

If the model imposes the fixed total speed (lVert UVert=c), admissibility requires

[
(Romega)^2+dot w^2=c^2,
qquad
v_perp=Romega=sqrt{c^2-dot w^2}.
]

Therefore the simultaneous assignments (lVert UVert=c) and (dot w=c) imply

[
Romega=0.
]

A nonzero transverse helical motion cannot coexist with both assignments in this ansatz.

## Interpretation boundary

This is a compatibility condition, not a particle prediction. A nontrivial H(s)H helix must declare which quantity (c) constrains:

1. total Euclidean parameter speed;
2. axial/resolver-relative propagation;
3. a Lorentzian null or timelike condition;
4. phase speed rather than material/transport speed; or
5. merely a curve parameter with no direct velocity meaning.

For variable radius, nonorthogonal frames, nested motion, or curved ambient geometry, the norm acquires additional terms and must be recomputed. Lorentzian signature changes the norm relation and is outside this local lemma.

## Consequence for finite-core candidates

The carrier choice (B^3/B^2/S^2) is unaffected, but every candidate transport law must pass this compatibility check before pitch, circulation, `ᚼ`, `ᚼᚼ`, circuit time, or centerline-limit claims can be promoted. Axial propagation and transverse winding are not independent degrees of freedom once a total-speed constraint is fixed.

## Failure/freeze boundary

The lemma fails as written if the decomposition is nonorthogonal, (R) varies without its radial term being included, (w) is not a physical coordinate, or the relevant metric is Lorentzian. Freeze only the algebraic statement inside the setup above.
