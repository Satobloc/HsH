import Mathlib

namespace HsHVerification.ArchiveEQ0028

def totalPhase (count phase : ℝ) : ℝ := count * phase

theorem dimensionless_ledger :
    (0 : ℤ) + 0 = 0 := by
  norm_num

theorem total_positive {count phase : ℝ}
    (hc : 0 < count) (hp : 0 < phase) :
    0 < totalPhase count phase := by
  exact mul_pos hc hp

theorem zero_count (phase : ℝ) : totalPhase 0 phase = 0 := by
  simp [totalPhase]

theorem zero_phase (count : ℝ) : totalPhase count 0 = 0 := by
  simp [totalPhase]

theorem seventy_two_printed_snaps :
    totalPhase 72 ((123 : ℝ) / 500) = (2214 : ℝ) / 125 := by
  norm_num [totalPhase]

theorem printed_total_not_six_pi :
    totalPhase 72 ((123 : ℝ) / 500) ≠ 6 * Real.pi := by
  intro h
  have hp : (3 : ℝ) < Real.pi := Real.pi_gt_three
  norm_num [totalPhase] at h
  nlinarith

theorem phase_required_if_seventy_two_close
    (phase : ℝ) (h : totalPhase 72 phase = 6 * Real.pi) :
    phase = Real.pi / 12 := by
  unfold totalPhase at h
  linarith

theorem homecoming_mod_turn_not_cp_lock :
    (1080 % 360 : Nat) ≠ 270 := by
  norm_num

theorem nufit61_normal_residual :
    (270 : ℤ) - 212 = 58 := by
  norm_num

theorem nufit61_inverted_residual :
    (270 : ℤ) - 274 = -4 := by
  norm_num

theorem predicted_inside_reported_three_sigma_ranges :
    ((125 : ℤ) ≤ 270 ∧ 270 ≤ 365) ∧
    ((203 : ℤ) ≤ 270 ∧ 270 ≤ 335) := by
  norm_num

end HsHVerification.ArchiveEQ0028
