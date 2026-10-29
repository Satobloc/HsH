import HsHVerification.MiraTangRadiusProjection
import Mathlib

/-!
Tang et al. 2023 DOI 10.1038/s41467-023-38787-w, Methods:
brightness-calibrated out-of-plane displacement <=0.2 mm, measured
in-plane centroid displacement 1.12 mm. tan(theta) <= 0.2/1.12.
The bound is conditional on the authors' optical calibration and path model.
No uncertainty distribution or unique 3D inverse geometry is established.
-/
namespace HsHVerification

def tangTransverseBoundMm : ℚ := (1 : ℚ) / 5
def tangInPlaneTravelMm : ℚ := (28 : ℚ) / 25
def tangTanThetaUpper : ℚ := tangTransverseBoundMm / tangInPlaneTravelMm

theorem tang_optical_bound_exact_ratio :
    tangTanThetaUpper = (5 : ℚ) / 28 := by
  norm_num [tangTanThetaUpper, tangTransverseBoundMm, tangInPlaneTravelMm]

theorem tang_optical_bound_below_published_rounded_018 :
    tangTanThetaUpper < (9 : ℚ) / 50 := by
  norm_num [tangTanThetaUpper, tangTransverseBoundMm, tangInPlaneTravelMm]

theorem tang_both_projections_are_proper :
    tangProjectionC1 < 1 ∧ tangTanThetaUpper < (9 : ℚ) / 50 := by
  exact ⟨tang_nominal_projection_is_proper.2,
    tang_optical_bound_below_published_rounded_018⟩

end HsHVerification
