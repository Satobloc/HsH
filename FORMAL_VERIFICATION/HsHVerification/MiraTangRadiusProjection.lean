import Mathlib

/-!
Mira source-conditional real-system projection arithmetic.
Tang et al., Nat Commun 14:2941 (2023), DOI 10.1038/s41467-023-38787-w.
Observed rounded half-separation dp(0)/2=140.6 um; model-optimized
initial radius R(0)=140.8 um. The latter is a FIT, not a prediction.
These exact rational decimals encode printed nominal values, not exact physical
measurements. No error bars, covariance, or H(s)H mechanism are proved.
-/
namespace HsHVerification

def tangHalfSeparationUm : ℚ := (1406 : ℚ) / 10
def tangFittedRadiusUm : ℚ := (1408 : ℚ) / 10
def tangProjectionC1 : ℚ := (703 : ℚ) / 704

theorem tang_projection_reconstructs_printed_half_separation :
    tangProjectionC1 * tangFittedRadiusUm = tangHalfSeparationUm := by
  norm_num [tangProjectionC1, tangFittedRadiusUm, tangHalfSeparationUm]

theorem tang_nominal_fit_gap_um :
    tangFittedRadiusUm - tangHalfSeparationUm = (1 : ℚ) / 5 := by
  norm_num [tangFittedRadiusUm, tangHalfSeparationUm]

theorem tang_nominal_projection_is_proper :
    0 < tangProjectionC1 ∧ tangProjectionC1 < 1 := by
  norm_num [tangProjectionC1]

end HsHVerification
