import Mathlib
namespace HsHVerification.ArchiveEQ0013
theorem semantic_nonidentity (x : ℝ) :
    x * (1 - x^2) = x - x^3 := by ring
theorem bridge_is_not_identity (x : ℝ) :
    x - x^3 = x ↔ x = 0 := by
  constructor
  · intro h
    have : x^3 = 0 := by linarith
    exact (pow_eq_zero this)
  · intro h; simp [h]
end HsHVerification.ArchiveEQ0013
