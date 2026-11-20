import Mathlib

/-!
Archive recovery EQ-0016: Ag-107/Ag-109 affine spacing construction.
Source: `GNEW 2.txt`, blob 2588c591264b6c6cfd7846cac7fc3e46b05e4de8,
lines 294--412 at archive snapshot 8d49183464ad8fb2411d5b8e13c6408eecd39e18.

These theorems check algebra and the two archived tolerance regimes only.
They do not establish a precipitation model, empirical target, topology, or
physical applicability.
-/

namespace HsHVerification.ArchiveEQ0016

def affineSpacing (B k R : ℝ) : ℝ := 1 + k * B * (R - 1)

theorem equal_masses_limit (B k : ℝ) : affineSpacing B k 1 = 1 := by
  simp [affineSpacing]

theorem positive_shift
    (B k R : ℝ) (hB : 0 < B) (hk : 0 < k) (hR : 1 < R) :
    1 < affineSpacing B k R := by
  dsimp [affineSpacing]
  have hDelta : 0 < R - 1 := sub_pos.mpr hR
  have hProduct : 0 < k * B * (R - 1) := mul_pos (mul_pos hk hB) hDelta
  exact lt_add_of_pos_right 1 hProduct

theorem fitted_multiplier_reproduces_target
    (B R target : ℝ) (hB : B ≠ 0) (hR : R ≠ 1) :
    affineSpacing B ((target - 1) / (B * (R - 1))) R = target := by
  dsimp [affineSpacing]
  field_simp [hB, hR]
  ring

theorem later_broad_tolerance_accepts :
    |(1013396136432 : ℝ) / 1000000000000 - 101376 / 100000| ≤
      11 / 10000 := by
  norm_num [abs_of_nonpos]

theorem earlier_tight_tolerance_rejects :
    1 / 100000 <
      |(1013396136432 : ℝ) / 1000000000000 - 101376 / 100000| := by
  norm_num [abs_of_nonpos]

end HsHVerification.ArchiveEQ0016
