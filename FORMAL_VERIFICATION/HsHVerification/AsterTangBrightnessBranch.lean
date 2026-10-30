import HsHVerification.AsterTangBrightnessGain
import Mathlib

/-!
# Aster: Tang 2023 brightness calibration, conditional algebra II
A brightness ratio under an ideal centered Gaussian constrains
squared offsets, not the signed travel. The same-side outward and
center-crossing cases have different inequalities. The real experiment's
beam support, initial transverse coordinate, pointwise errors and
covariance must be recovered before using either as a physical bound.
-/
namespace HsHVerification.AsterTangBrightnessBranch
open HsHVerification.AsterTangBrightnessGain

theorem centered_start_recovers_positive_displacement
    {b d : ℝ} (hb : 0 ≤ b) (hd : 0 ≤ d)
    (h : gain 0 b = d ^ 2) : b = d := by
  simp [gain] at h
  nlinarith

theorem same_side_outward_is_center_bounded
    {a b d : ℝ} (ha : 0 ≤ a) (hab : a ≤ b) (hd : 0 ≤ d)
    (h : gain a b = d ^ 2) : b - a ≤ d := by
  have hdiff : 0 ≤ b - a := sub_nonneg.mpr hab
  have hmul : 0 ≤ a * (b - a) := mul_nonneg ha hdiff
  have hsplit := gain_displacement_decomposition a b
  rw [h] at hsplit
  have hsq : (b - a) ^ 2 ≤ d ^ 2 := by nlinarith
  nlinarith

theorem crossing_center_exceeds_center_start_displacement
    {a b d : ℝ} (ha : a < 0) (hb : 0 < b) (hd : 0 ≤ d)
    (h : gain a b = d ^ 2) : d < b - a := by
  have hdiff : 0 < b - a := by linarith
  have hmul : 0 < (-a) * (b - a) := mul_pos (neg_pos.mpr ha) hdiff
  have hsplit := gain_displacement_decomposition a b
  rw [h] at hsplit
  have hsq : d ^ 2 < (b - a) ^ 2 := by nlinarith
  nlinarith

#print axioms centered_start_recovers_positive_displacement
#print axioms same_side_outward_is_center_bounded
#print axioms crossing_center_exceeds_center_start_displacement
end HsHVerification.AsterTangBrightnessBranch
