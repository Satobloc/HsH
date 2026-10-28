import Mathlib
import HsHVerification.MiraNeutronCalibrationGate

/-!
Mira 2026-10-28: observation-map distinction. Danner et al 2019
polarimetry measures relative spin-eigenstate phase. Danner et al 2020,
DOI 10.1038/s41534-020-0254-8, measures interferometer path phase.
Formalized arithmetic is conditional; neither experiment proves H(s)H.
-/

namespace HsHVerification.MiraNeutronObservationGate

open HsHVerification.MiraNeutronCalibrationGate

theorem eigenphase_difference (f t : ℝ) :
    (360 * 1000 * f * t) = 2 * (180 * 1000 * f * t) := by
  ring

theorem observed_single_eigenphase :
    measuredSlope / 2 = (347 : ℚ) / 100 := by
  norm_num [measuredSlope]

theorem linear_inverse (k L b : ℝ) (hk : k ≠ 0)
    (hb : b = k * L) : b / k = L := by
  rw [hb]
  field_simp
  ring

theorem same_coefficient_cannot_match_both
    (k L : ℝ) (hpred : k * L = (predictedSlope : ℝ))
    (hobs : k * L = (measuredSlope : ℝ)) : False := by
  have hneqR : (predictedSlope : ℝ) < (measuredSlope : ℝ) := by
    exact_mod_cast observed_exceeds_forward
  have heqR : (predictedSlope : ℝ) = (measuredSlope : ℝ) :=
    hpred.symm.trans hobs
  exact (ne_of_lt hneqR) heqR

#print axioms eigenphase_difference
#print axioms observed_single_eigenphase
#print axioms linear_inverse
#print axioms same_coefficient_cannot_match_both

end HsHVerification.MiraNeutronObservationGate
