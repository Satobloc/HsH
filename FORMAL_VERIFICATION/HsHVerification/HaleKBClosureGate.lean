import HsHVerification.HaleKBParameterBounds
import Mathlib

/-!
# Hale / instantaneous eddy-adaptation consistency gate

The PNAS 2026 Supporting Information, §D, states that instantaneous
eddy adaptation ell = alpha*h is self-inconsistent for the large-blob
experiment: the measured parameter box gives an upper ratio bound near
10, whereas the numerical shooting map for the observed exponent gives
a ratio range [40, 122].

This module proves only that those two source-reported rational intervals
do not overlap. The [40, 122] interval is a model-dependent numerical
inference, not a direct measurement. The proof does not validate either
source interval or the shooting calculation.
-/

namespace HsHVerification.HaleKBClosureGate

open HsHVerification.HaleKBParameterBounds

def shootingRatioLower : ℚ := 40
def shootingRatioUpper : ℚ := 122

/-- The source-parameter box and the instantaneous-adaptation shooting interval are disjoint. -/
theorem instantaneousAdaptationIntervals_disjoint :
    ratioUpper < shootingRatioLower := by
  norm_num [ratioUpper, shootingRatioLower]

/-- No rational ratio can satisfy both source-reported interval constraints. -/
theorem no_ratio_satisfies_both
    (r : ℚ)
    (hMeasuredBox : ratioLower ≤ r ∧ r ≤ ratioUpper)
    (hShooting : shootingRatioLower ≤ r ∧ r ≤ shootingRatioUpper) :
    False := by
  have h : shootingRatioLower ≤ ratioUpper :=
    le_trans hShooting.1 hMeasuredBox.2
  norm_num [shootingRatioLower, ratioUpper] at h

/- The model-inferred lower endpoint is a factor of 981/245 above the empirical-box upper endpoint. -/
#eval shootingRatioLower / ratioUpper

#print axioms instantaneousAdaptationIntervals_disjoint
#print axioms no_ratio_satisfies_both

end HsHVerification.HaleKBClosureGate
