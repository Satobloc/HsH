import Mathlib

/-!
# Aster: Tang 2023 brightness calibration, conditional algebra I
Physical source: Tang et al. Nature Communications 14, 2941 (2023),
DOI 10.1038/s41467-023-38787-w, laser-sheet brightness profile.
This module proves only properties of squared-offset differences.
The Gaussian observation law, calibrated width and measured brightness
are NOT verified by these theorems. No arbitrary physical fixtures.
-/
namespace HsHVerification.AsterTangBrightnessGain

/-- Squared offset gain from the laser-sheet center, in source-derived units. -/
def gain (y0 y1 : ℝ) : ℝ := y1 ^ 2 - y0 ^ 2

theorem reflected_offsets_same_gain (a b : ℝ) :
    gain (-a) (-b) = gain a b := by
  unfold gain
  ring

theorem gain_scales_quadratically (a b scale : ℝ) :
    gain (scale * a) (scale * b) = scale ^ 2 * gain a b := by
  unfold gain
  ring

theorem gain_displacement_decomposition (a b : ℝ) :
    gain a b = (b - a) ^ 2 + 2 * a * (b - a) := by
  unfold gain
  ring

#print axioms reflected_offsets_same_gain
#print axioms gain_scales_quadratically
#print axioms gain_displacement_decomposition
end HsHVerification.AsterTangBrightnessGain
