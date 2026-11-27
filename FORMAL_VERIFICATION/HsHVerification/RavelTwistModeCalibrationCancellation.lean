import Mathlib

/-!
Conditional algebraic gate for the Ravel GEN/CANDIDATE internal-twist
mode-tomography sandbox.

If every mode is multiplied by the same nonzero complex calibration factor
(anisotropy amplitude times detector-frame phase), the ratio of two nonzero
mode responses cancels that common factor. This is an algebraic nuisance
cancellation only. It does not establish that a physical detector has a
mode-independent calibration factor, that the sandbox response integral is
a valid physical readout, or that an H(s)H twist field exists.
-/

namespace HsHVerification.RavelTwistModeCalibrationCancellation

variable {K : Type*} [Field K]

def calibratedMode (c g : K) : K := c * g

theorem relative_mode_ratio_cancels_common_calibration
    (c g₁ g₂ : K) (hc : c ≠ 0) (hg₂ : g₂ ≠ 0) :
    calibratedMode c g₁ / calibratedMode c g₂ = g₁ / g₂ := by
  unfold calibratedMode
  field_simp

theorem cross_product_form_cancels_common_calibration
    (c g₁ g₂ : K) :
    calibratedMode c g₁ * g₂ = calibratedMode c g₂ * g₁ := by
  unfold calibratedMode
  ring

#eval ((2 : ℚ) * 3) / ((2 : ℚ) * 5)

#print axioms relative_mode_ratio_cancels_common_calibration
#print axioms cross_product_form_cancels_common_calibration

/--
With mode-dependent multiplicative calibration, the observed relative
response factors into the calibration ratio and the candidate response
ratio. The common-calibration cancellation above is the special case
where the calibration ratio is one.
-/
theorem relative_mode_ratio_factors_mode_dependent_calibration
    (c₁ c₂ g₁ g₂ : K) (hc₂ : c₂ ≠ 0) (hg₂ : g₂ ≠ 0) :
    calibratedMode c₁ g₁ / calibratedMode c₂ g₂ =
      (c₁ / c₂) * (g₁ / g₂) := by
  unfold calibratedMode
  field_simp [hc₂, hg₂]
  ring

/--
If the two mode calibrations are unconstrained independently, any pair of
nonzero candidate responses can reproduce any observed pair. Thus the
observed pair alone cannot identify the candidate response ratio. This is
a field-algebra statement, not a claim that an actual detector has
independent arbitrary calibration factors.
-/
theorem independent_mode_calibrations_absorb_any_observed_pair
    (z₁ z₂ g₁ g₂ : K) (hg₁ : g₁ ≠ 0) (hg₂ : g₂ ≠ 0) :
    ∃ c₁ c₂ : K,
      calibratedMode c₁ g₁ = z₁ ∧
      calibratedMode c₂ g₂ = z₂ := by
  refine ⟨z₁ / g₁, z₂ / g₂, ?_, ?_⟩
  · unfold calibratedMode
    field_simp [hg₁] <;> ring
  · unfold calibratedMode
    field_simp [hg₂] <;> ring

/--
A concrete rational witness: two different candidate response ratios
produce the same observed pair when their mode calibrations are allowed
to differ. These are algebraic values only, not physical measurements
or a synthetic physical fixture.
-/
theorem two_distinct_model_ratios_can_share_observed_pair :
    ∃ c₁ c₂ d₁ d₂ : ℚ,
      calibratedMode c₁ (2 : ℚ) = 6 ∧
      calibratedMode c₂ (5 : ℚ) = 10 ∧
      calibratedMode d₁ (3 : ℚ) = 6 ∧
      calibratedMode d₂ (5 : ℚ) = 10 ∧
      (2 : ℚ) / 5 ≠ (3 : ℚ) / 5 := by
  refine ⟨3, 2, 2, 2, ?_, ?_, ?_, ?_, ?_⟩
  all_goals norm_num [calibratedMode]

#eval (calibratedMode (3 : ℚ) 2, calibratedMode (2 : ℚ) 5)
#eval (calibratedMode (2 : ℚ) 3, calibratedMode (2 : ℚ) 5)
#eval ((2 : ℚ) / 5, (3 : ℚ) / 5)

#print axioms relative_mode_ratio_factors_mode_dependent_calibration
#print axioms independent_mode_calibrations_absorb_any_observed_pair
#print axioms two_distinct_model_ratios_can_share_observed_pair

end HsHVerification.RavelTwistModeCalibrationCancellation
