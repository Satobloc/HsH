import Mathlib

namespace HsHVerification.ArchiveEQ0020

def massSq (k β a : ℝ) (N Q : ℝ) : ℝ := k * (N + β * Q^2 - a)

theorem ground_reparametrization
    (k β a t Q : ℝ) (ht : t ≠ 0) :
    massSq (t*k) (β/t) (a/t) 0 Q = massSq k β a 0 Q := by
  field_simp [massSq, ht]
  <;> ring

theorem excited_spacing (k β a N Q : ℝ) :
    massSq k β a (N+1) Q - massSq k β a N Q = k := by
  ring

theorem source_electron_is_negative :
    massSq 581025 (1852/10000) (2469/10000) 0 1 < 0 := by
  norm_num [massSq]

theorem three_anchor_slopes_disagree :
    (((13957039/100000 : ℚ)^2 - (51099895069/100000000000 : ℚ)^2) / 3)
      ≠
    (((93827208943/100000000 : ℚ)^2 - (13957039/100000 : ℚ)^2) / 5) := by
  norm_num

theorem multiplying_k_changes_excited_spacing
    (k t : ℝ) (ht : t ≠ 1) : t*k - k = (t-1)*k := by
  ring

end HsHVerification.ArchiveEQ0020
