import HsHVerification.RavelHelionRadiusLedger
import Mathlib

/-!
Interval gates on rounded published one-standard-uncertainty input endpoints.
They are deterministic endpoint inequalities, NOT a 68% joint coverage claim,
a covariance analysis, or evidence for a geometric SAT/H(s)H readout law.
-/
namespace HsHVerification.RavelHelionRadius
theorem interval_endpoints_ordered :
    0 < helionFm - helionSigmaFm ∧
    0 < protonFm - protonSigmaFm ∧
    helionFm - helionSigmaFm < helionFm + helionSigmaFm ∧
    protonFm - protonSigmaFm < protonFm + protonSigmaFm := by
  norm_num [helionFm, helionSigmaFm, protonFm, protonSigmaFm]

theorem squared_gap_endpoint_bounds :
    (31695358248 : ℚ) / 10000000000
      ≤ helionFm ^ 2 - protonFm ^ 2 ∧
    helionFm ^ 2 - protonFm ^ 2
      ≤ (31790956080 : ℚ) / 10000000000 := by
  norm_num [helionFm, protonFm]

theorem charge_radius_ratio_endpoint_bounds :
    (helionFm - helionSigmaFm) / (protonFm + protonSigmaFm)
      < helionFm / protonFm ∧
    helionFm / protonFm
      < (helionFm + helionSigmaFm) / (protonFm - protonSigmaFm) := by
  norm_num [helionFm, protonFm, helionSigmaFm, protonSigmaFm]

theorem squared_gap_is_not_zero :
    helionFm ^ 2 ≠ protonFm ^ 2 := by
  norm_num [helionFm, protonFm]

#print axioms HsHVerification.RavelHelionRadius.interval_endpoints_ordered
#print axioms HsHVerification.RavelHelionRadius.squared_gap_endpoint_bounds
#print axioms HsHVerification.RavelHelionRadius.charge_radius_ratio_endpoint_bounds
#print axioms HsHVerification.RavelHelionRadius.squared_gap_is_not_zero
end HsHVerification.RavelHelionRadius
