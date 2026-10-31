import Mathlib

/-!
Ravel :24 (2026-10-29), source-anchored arithmetic ONLY.
The central values are the 2025 CREMA muonic-3He charge radius
1.97007(94) fm and the NIST CODATA 2022 adjusted proton radius
0.84075(64) fm. Each rational is a published rounded measurement,
NOT a geometric braid radius or a new SAT/H(s)H prediction.
-/

namespace HsHVerification.RavelHelionRadius

def helionFm : ℚ := 197007 / 100000
def protonFm : ℚ := 84075 / 100000
def helionSigmaFm : ℚ := 94 / 100000
def protonSigmaFm : ℚ := 64 / 100000

theorem measured_centers_positive :
    0 < helionFm ∧ 0 < protonFm := by
  norm_num [helionFm, protonFm]

theorem measured_charge_radius_gap :
    helionFm ^ 2 - protonFm ^ 2 = (31743152424 : ℚ) / 10000000000 := by
  norm_num [helionFm, protonFm]

theorem measured_radius_ratio_gt_two :
    (2 : ℚ) < helionFm / protonFm := by
  norm_num [helionFm, protonFm]

theorem measured_radius_ratio_lt_three :
    helionFm / protonFm < (3 : ℚ) := by
  norm_num [helionFm, protonFm]

#print axioms HsHVerification.RavelHelionRadius.measured_centers_positive
#print axioms HsHVerification.RavelHelionRadius.measured_charge_radius_gap
#print axioms HsHVerification.RavelHelionRadius.measured_radius_ratio_gt_two
#print axioms HsHVerification.RavelHelionRadius.measured_radius_ratio_lt_three
end HsHVerification.RavelHelionRadius
