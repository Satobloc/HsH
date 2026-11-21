import Mathlib

/-!
Archive recovery EQ-0010: D7 scalar-gamma obstruction.
Source: SAT O Derivations/CODE-LOCKED DERIVS.txt, D7.
Blob: 783b05d39d59bf854b92090e15d205e6823b51c8

D7 writes gamma candidates as real tangent-frame contractions.  Real scalars
cannot satisfy a spatial Clifford relation gamma_i^2=-1 for signature (+---).
This proves a type/algebra obstruction only; it does not reject a later
matrix-, bundle-, or geometric-algebra construction.
-/

namespace HsHVerification.ArchiveEQ0010

theorem real_scalar_cannot_square_neg_one (x : ℝ) :
    x ^ 2 ≠ -1 := by
  nlinarith [sq_nonneg x]

theorem scalar_spatial_clifford_impossible (x : ℝ) :
    2 * x * x ≠ -2 := by
  nlinarith [sq_nonneg x]

theorem scalar_anticommutator (x y : ℝ) :
    x * y + y * x = 2 * x * y := by
  ring

theorem normalized_scalar_residual_lower_bound
    (v0 v1 v2 v3 : ℝ)
    (hnorm : v0^2 + v1^2 + v2^2 + v3^2 = 1) :
    12 ≤ 4 * (5 - 2 * (v0^2 - v1^2 - v2^2 - v3^2)) := by
  nlinarith [sq_nonneg v1, sq_nonneg v2, sq_nonneg v3]

end HsHVerification.ArchiveEQ0010
