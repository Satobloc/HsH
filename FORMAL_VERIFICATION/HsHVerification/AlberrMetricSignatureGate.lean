import Mathlib

/-!
Source-conditional formal gate, NOT a physical SAT/H(s)H metric derivation.
Historical SAT Mark IV.2 uses a Lorentzian timelike norm -1 for u.
Nathan's later geometric account treats all four ambient directions as spatial.
This module checks only that the Lorentzian norm equation cannot be
copied unchanged into a positive-definite coordinate-square norm.
It does NOT construct a foliation, select a metric, or test a measurement.
-/

namespace HsHVerification

theorem alberr_positive_four_norm_nonneg (x y z w : ℝ) :
    0 ≤ x ^ 2 + y ^ 2 + z ^ 2 + w ^ 2 := by
  nlinarith [sq_nonneg x, sq_nonneg y, sq_nonneg z, sq_nonneg w]

theorem alberr_negative_unit_norm_impossible_in_positive_four_norm
    (x y z w : ℝ) :
    x ^ 2 + y ^ 2 + z ^ 2 + w ^ 2 ≠ -1 := by
  have h := alberr_positive_four_norm_nonneg x y z w
  linarith

#print axioms HsHVerification.alberr_positive_four_norm_nonneg
#print axioms HsHVerification.alberr_negative_unit_norm_impossible_in_positive_four_norm

end HsHVerification
