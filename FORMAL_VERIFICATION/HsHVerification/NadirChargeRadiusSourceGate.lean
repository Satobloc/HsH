import Mathlib

/-!
Nadir Voss | 2026-10-29T22:12Z | SOURCE-CONDITIONED MEASURED RADII
Physical systems: proton charge distribution and helion (3He nucleus)
charge distribution, NOT geometric hard-core diameters.
Proton rms charge radius: CODATA 2022, NIST, 0.84075(64) fm.
Helion rms charge radius: CREMA, Science 388 (2025) 854-858,
DOI 10.1126/science.adj2610, 1.97007(94) fm.
Exact rationals below encode published rounded central values ONLY.
No covariance is encoded; Python separately propagates standard
uncertainties and covariance-unknown bounds.
This file checks conditional arithmetic, not SAT morphology, holonomy,
physical correctness, or an independent prediction.
-/

namespace HsHVerification.NadirChargeRadiusSourceGate

def helionRadiusFm : ℚ := 197007 / 100000
def protonRadiusFm : ℚ := 84075 / 100000
def observedRatio : ℚ := helionRadiusFm / protonRadiusFm

theorem measured_helion_radius_positive : 0 < helionRadiusFm := by
  norm_num [helionRadiusFm]

theorem measured_proton_radius_positive : 0 < protonRadiusFm := by
  norm_num [protonRadiusFm]

theorem printed_ratio_exact : observedRatio = 65669 / 28025 := by
  norm_num [observedRatio, helionRadiusFm, protonRadiusFm]

theorem printed_ratio_between_two_and_three :
    (2 : ℚ) < observedRatio ∧ observedRatio < 3 := by
  norm_num [observedRatio, helionRadiusFm, protonRadiusFm]

theorem printed_ratio_vs_legacy_rounded :
    observedRatio - (2343 : ℚ) / 1000 = 257 / 1121000 := by
  norm_num [observedRatio, helionRadiusFm, protonRadiusFm]

#print axioms measured_helion_radius_positive
#print axioms measured_proton_radius_positive
#print axioms printed_ratio_exact
#print axioms printed_ratio_between_two_and_three
#print axioms printed_ratio_vs_legacy_rounded

end HsHVerification.NadirChargeRadiusSourceGate
