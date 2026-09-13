> **QUARANTINED — 2026-09-13:** Nathan halted this integration lane after identifying a category failure in its assessment process. This generated artifact is preserved only as history and must not control theory, predictions, papers, or future work. See [quarantine manifest](../../../QUARANTINE/2026-09-13_INTEGRATION_HALT/README.md).

# FC-BASE-005 — Fixed-Speed Helical Transport Compatibility

**Status:** `STD/DERIVED/FROZEN` only for the declared local Euclidean kinematic ansatz. No H(s)H carrier, physical speed assignment, or metric choice is frozen.

**Provenance lead:** `WORKSPACES/COMMON/ADDENDUM_4D_TOPOLOGICAL_MODEL_CLOSURE_AUDIT_2026-09-12.md`, read completely (130 lines). That former-instance report is `SRC/HISTORICAL-QUARANTINED`; the calculation below is independently elementary.

## Setup

Let a local constant-radius circular helix have axial coordinate `w`, radius `R`, angular rate `omega`, and orthogonal axial/transverse unit directions. Its tangent velocity is

`U = wdot e_w + R omega e_perp`.

Orthogonality gives

`||U||^2 = wdot^2 + (R omega)^2`.

If the model imposes fixed total speed `||U||=c`, admissibility requires

`(R omega)^2 + wdot^2 = c^2`

and hence

`v_perp = R omega = sqrt(c^2 - wdot^2)`.

Therefore the simultaneous assignments `||U||=c` and `wdot=c` force `R omega=0`. Nonzero transverse helical motion cannot coexist with both assignments in this ansatz.

## Interpretation boundary

This is a compatibility condition, not a particle prediction. A nontrivial H(s)H helix must declare which quantity `c` constrains:

1. total Euclidean parameter speed;
2. axial/resolver-relative propagation;
3. a Lorentzian null or timelike condition;
4. phase speed rather than material/transport speed; or
5. merely a curve parameter with no direct velocity meaning.

For variable radius, nonorthogonal frames, nested motion, or curved ambient geometry, the norm acquires additional terms and must be recomputed. Lorentzian signature changes the norm relation and is outside this local lemma.

## Consequence for finite-core candidates

The carrier choice `B^3/B^2/S^2` is unaffected, but every candidate transport law must pass this compatibility check before pitch, circulation, `ᚼ`, `ᚼᚼ`, circuit time, or centerline-limit claims can be promoted. Axial propagation and transverse winding are not independent degrees of freedom once a total-speed constraint is fixed.

## Failure/freeze boundary

The lemma fails as written if the decomposition is nonorthogonal, `R` varies without its radial term being included, `w` is not a physical coordinate, or the relevant metric is Lorentzian. Freeze only the algebraic statement inside the setup above.
