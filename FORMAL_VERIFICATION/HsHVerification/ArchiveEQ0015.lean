import Mathlib

/-!
EQ-0015: archived electron-anomaly skid construction.
Source: `GNEW 2.txt`, lines 441-518, blob
`2588c591264b6c6cfd7846cac7fc3e46b05e4de8`.

Theorems below certify only the algebraic/dimensional audit edges.  They do not
promote the historical trace into an H(s)H object or physical prediction.
-/

namespace HsHVerification.ArchiveEQ0015

theorem reciprocal_frequency_lock (B : ℝ) (hB : B ≠ 0) :
    B * (1 / B) = 1 := by
  field_simp

theorem endpoint_gap_factorization
    (B cT sT : ℝ) :
    (B * cT - B)^2 + (-B * sT)^2 =
      B^2 * ((cT - 1)^2 + sT^2) := by
  ring

theorem comparator_exceeds_unit_circle
    (B : ℝ) (hB : 0 < B) :
    2 * Real.pi < 2 * Real.pi * (1 + B) := by
  have hp : 0 < 2 * Real.pi := mul_pos (by norm_num) Real.pi_pos
  nlinarith

theorem source_code_far_above_codata :
    (0.0074194179753359684 : ℝ) > 6 * 0.00115965218046 := by
  norm_num

theorem source_code_positive_residual :
    (0 : ℝ) < 0.0074194179753359684 - 0.00115965218046 := by
  norm_num

end HsHVerification.ArchiveEQ0015
