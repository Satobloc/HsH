import Mathlib

namespace HsHVerification.ArchiveEQ0019

theorem shifted_s3_spectrum (n : ℝ) :
    (n - 1) * ((n - 1) + 2) = n^2 - 1 := by
  ring

theorem inverse_shift_identity (n : ℝ) (hn : n ≠ 0) :
    1 / (1 + (n - 1) * ((n - 1) + 2)) = 1 / n^2 := by
  rw [shifted_s3_spectrum]
  field_simp

theorem archived_ratio_is_below_0_21_percent :
    (2045991352330 : ℝ) / 1000000000000000 < 21 / 10000 := by
  norm_num

theorem archived_ratio_is_not_a_match :
    (2045991352330 : ℝ) / 1000000000000000 ≠ 1 := by
  norm_num

theorem multiplying_by_subunit_coupling_decreases
    (raw alpha : ℝ) (hraw : 0 < raw) (ha0 : 0 < alpha) (ha1 : alpha < 1) :
    raw * alpha < raw := by
  nlinarith [mul_pos hraw ha0, mul_lt_mul_of_pos_left ha1 hraw]

theorem filament_to_bohr_ratio_below_alpha :
    (1499875626133007 : ℝ) / 100000000000000000000 <
      72973525643 / 10000000000000 := by
  norm_num

end HsHVerification.ArchiveEQ0019
