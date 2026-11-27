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

end HsHVerification.RavelTwistModeCalibrationCancellation
