import HsHVerification.MercerTangGaussianGeometry
import Mathlib

/-!
Mercer, Workshop Relay :24, 2026-10-29 04:24 UTC.
Source-conditional projection gate for the Tang et al. (2023) helium-II
two-tracer vortex-ring experiment. The paper's brightness-to-depth
inference uses a measured laser profile, not direct transverse tracking.
The calibration constant K stands for the inferred squared-offset
difference; this module does not infer K from absent raw intensity data.
-/ 

namespace HsHVerification.MercerTangGaussianGate

open HsHVerification.MercerTangGaussianGeometry

/-- Calibration plus the outward-motion branch yields a displacement bound. -/
theorem calibrated_gain_bounds_transverse_displacement
    (y0 d K : ℝ) (hy : 0 ≤ y0) (hd : 0 ≤ d)
    (hcal : (y0 + d) ^ 2 - y0 ^ 2 = K) :
    d ^ 2 ≤ K := by
  calc
    d ^ 2 ≤ (y0 + d) ^ 2 - y0 ^ 2 :=
      outward_square_gain_bounds_displacement y0 d hy hd
    _ = K := hcal

/-- A geometric speed-squared comparator, conditional on calibration. -/
theorem calibrated_gain_bounds_path_square
    (y0 d K L : ℝ) (hy : 0 ≤ y0) (hd : 0 ≤ d)
    (hcal : (y0 + d) ^ 2 - y0 ^ 2 = K) :
    L ^ 2 + d ^ 2 ≤ L ^ 2 + K := by
  have h := calibrated_gain_bounds_transverse_displacement
    y0 d K hy hd hcal
  linarith

/-- Source-rounded 0.20 mm / 1.12 mm equals 5/28, not an independent
observation of the transverse displacement. -/
theorem paper_rounded_tangent_ratio :
    ((1 / 5 : ℚ) / (28 / 25)) = 5 / 28 := by
  norm_num

/-- Without branch data, opposite-sign trajectories are
brightness-indistinguishable in the symmetric squared-offset model. -/
theorem mirrored_paths_share_calibration (y0 y1 : ℝ) :
    y1 ^ 2 - y0 ^ 2 = (-y1) ^ 2 - (-y0) ^ 2 := by
  ring

#print axioms calibrated_gain_bounds_transverse_displacement
#print axioms calibrated_gain_bounds_path_square
#print axioms paper_rounded_tangent_ratio
#print axioms mirrored_paths_share_calibration

end HsHVerification.MercerTangGaussianGate
