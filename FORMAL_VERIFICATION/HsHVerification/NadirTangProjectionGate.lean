import HsHVerification.NadirTangProjectionData
import Mathlib

/-!
Nadir Voss | observational projection/identifiability gate.
Source-conditioned input is Tang et al. (2023), DOI
10.1038/s41467-023-38787-w. Let p>=0 be mean projected centroid speed,
q>=0 the magnitude of mean transverse speed, with q <= (5/28)*p
under the paper's approximately straight-path, common-time assumption.
Then the squared full displacement/time speed is bounded by 809/784
times the squared projected displacement/time speed. A 2% inflation
would exceed this approximate optical projection bound.

This is an assistant reconstruction of observation geometry.
No statistical confidence claim, no inferred core trajectory, no H(s)H
constitutive law or physical equivalence. The sign of transverse motion
cannot be recovered from speed magnitudes alone.
-/

namespace HsHVerification.NadirTangProjectionGate
open HsHVerification.NadirTangProjectionData

theorem squared_speed_projection_bound
    (p q : ℚ) (hp : 0 ≤ p) (hq : 0 ≤ q)
    (hopt : q ≤ (5 / 28 : ℚ) * p) :
    p ^ 2 + q ^ 2 ≤ (809 / 784 : ℚ) * p ^ 2 := by
  have hmul : 0 ≤ ((5 / 28 : ℚ) * p - q) * ((5 / 28 : ℚ) * p + q) :=
    mul_nonneg (sub_nonneg.mpr hopt)
      (add_nonneg (mul_nonneg (by norm_num) hp) hq)
  nlinarith [hmul]

theorem measured_squared_speed_projection_bound
    (q : ℚ) (hq : 0 ≤ q)
    (hopt : q ≤ transverseSlopeLimit * projectedMeanSpeedMmS) :
    projectedMeanSpeedMmS ^ 2 + q ^ 2 ≤
      (809 / 784 : ℚ) * projectedMeanSpeedMmS ^ 2 := by
  apply squared_speed_projection_bound projectedMeanSpeedMmS q
    (le_of_lt projected_mean_speed_positive) hq
  simpa [printed_transverse_slope] using hopt

theorem squared_inflation_below_two_percent :
    (809 / 784 : ℚ) < (51 / 50 : ℚ) ^ 2 := by
  norm_num

theorem transverse_sign_not_identified (p q : ℚ) :
    p ^ 2 + q ^ 2 = p ^ 2 + (-q) ^ 2 := by
  ring

#print axioms squared_speed_projection_bound
#print axioms measured_squared_speed_projection_bound
#print axioms squared_inflation_below_two_percent
#print axioms transverse_sign_not_identified

end HsHVerification.NadirTangProjectionGate
