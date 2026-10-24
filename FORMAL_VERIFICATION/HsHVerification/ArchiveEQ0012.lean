import Mathlib
namespace HsHVerification.ArchiveEQ0012
theorem fifth_power_monotone_direction (a b : ℝ) (ha : 0 < a) (h : a < b) :
    a^5 < b^5 := by nlinarith [sq_nonneg a, sq_nonneg b, mul_pos ha h]
theorem multiplicative_bridge_solution (m p : ℝ) (hp : p ≠ 0) :
    p * (1 + (m/p - 1)) = m := by field_simp
end HsHVerification.ArchiveEQ0012
