import Mathlib

namespace HsHVerification.ArchiveEQ0024

def massRatio (B : ℝ) : ℝ := 3 / (2 * B^5)

theorem dimensionless_ledger :
    (0 : ℤ) - 5 * 0 = 0 := by norm_num

theorem positive_for_positive_B (B : ℝ) (hB : 0 < B) :
    0 < massRatio B := by
  positivity

theorem inverse_fit_if_fifth_power_fixed (B μ : ℝ)
    (hB : B ≠ 0) (h : 2 * μ * B^5 = 3) :
    massRatio B = μ := by
  field_simp [massRatio, hB]
  nlinarith

theorem bridge_is_explicit_fit (B μ : ℝ) (hB : B ≠ 0) :
    massRatio B * (1 + (μ / massRatio B - 1)) = μ := by
  have hm : massRatio B ≠ 0 := by
    simp [massRatio, hB]
  field_simp [hm]

theorem source_B_stable_not_exact_CODATA :
    massRatio (24177/100000 : ℚ) ≠
      1836152673426/1000000000 := by
  norm_num [massRatio]

end HsHVerification.ArchiveEQ0024
