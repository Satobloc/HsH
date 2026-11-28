import Mathlib

/-!
A source-linked algebraic check of the historical SAT.O13 displayed ansatz

  M_l = m0 * U_T^k

where the source describes U_T as a unitary representation matrix.

This module proves only the conditional norm consequence of a
norm-preserving operator followed by scalar multiplication. It does not prove
that the historical representation is correctly constructed, that the
separate loop-dressing proposal is valid, or that any physical mass follows.
-/

namespace HsHVerification.AsterO13UnitaryMassGate

/-- A scalar multiple of a norm-preserving map scales every vector norm by
the same scalar norm. A unitary linear map on a complex inner-product space
is a special case of the hypothesis. -/
theorem scalar_isometry_preserves_norm
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    (U : E → E) (hU : ∀ x : E, ‖U x‖ = ‖x‖)
    (m₀ : ℂ) (x : E) :
    ‖m₀ • U x‖ = ‖m₀‖ * ‖x‖ := by
  rw [norm_smul, hU x]

/-- The scalar-isometry ansatz alone cannot split two directions by norm:
both receive the same multiplicative norm factor. -/
theorem scalar_isometry_no_directional_norm_split
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    (U : E → E) (hU : ∀ x : E, ‖U x‖ = ‖x‖)
    (m₀ : ℂ) (x y : E) :
    ‖m₀ • U x‖ * ‖y‖ = ‖m₀ • U y‖ * ‖x‖ := by
  rw [scalar_isometry_preserves_norm U hU m₀ x,
      scalar_isometry_preserves_norm U hU m₀ y]
  ring

#print axioms HsHVerification.AsterO13UnitaryMassGate.scalar_isometry_preserves_norm
#print axioms HsHVerification.AsterO13UnitaryMassGate.scalar_isometry_no_directional_norm_split

end HsHVerification.AsterO13UnitaryMassGate
