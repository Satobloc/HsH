import HsHVerification.MeridianS2FullOrbit
import Mathlib

/-!
Meridian S2 observation separation, 2026-10-28.
The observed Schwarzschild-precession fit factor fSP=1.10(19)
is a joint orbital-model fit, not an independent H(s)H prediction.
Euclidean marked-curve curvature can remain nonzero even when
an independently specified relativistic precession correction is zero.
This logical separation is NOT a physical proof that the two are
unrelated in an actual dynamical model.
-/

namespace HsHVerification.MeridianS2ObservationSeparation

open HsHVerification.MeridianS2FullOrbit

def precessionReadout (f baseline : ℝ) : ℝ := f * baseline

theorem null_precession (baseline : ℝ) :
    precessionReadout 0 baseline = 0 := by
  simp [precessionReadout]

theorem apsidal_curvature_positive (mu r c v : ℝ)
    (hmu : 0 < mu) (hr : 0 < r) (hcv : 0 < c ^ 2 + v ^ 2) :
    0 < apsisCurvature mu r c v := by
  unfold apsisCurvature
  exact div_pos hmu (mul_pos (pow_pos hr 2) hcv)

theorem positive_curve_with_null_precession (mu r c v baseline : ℝ)
    (hmu : 0 < mu) (hr : 0 < r) (hcv : 0 < c ^ 2 + v ^ 2) :
    0 < apsisCurvature mu r c v ∧ precessionReadout 0 baseline = 0 := by
  exact ⟨apsidal_curvature_positive mu r c v hmu hr hcv, null_precession baseline⟩

theorem fitted_factor_roundtrip (observed baseline : ℝ)
    (hb : baseline ≠ 0) :
    precessionReadout (observed / baseline) baseline = observed := by
  unfold precessionReadout
  field_simp [hb]

#print axioms null_precession
#print axioms apsidal_curvature_positive
#print axioms positive_curve_with_null_precession
#print axioms fitted_factor_roundtrip

end HsHVerification.MeridianS2ObservationSeparation
