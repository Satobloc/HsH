import Mathlib

/-!
Mercer, Workshop Relay :24, 2026-10-29 04:24 UTC.
Tang et al., Nature Communications 14, 2941 (2023), DOI
10.1038/s41467-023-38787-w, Methods: laser-sheet profile.
The reported fitted y-width is 0.69 mm at 1/e^2 intensity.
The reported corrected brightness falls by about 20% and the
reported in-plane displacement is 1.12 mm.

This module proves conditional geometric facts for a Gaussian profile
when the particle moves monotonically away from the beam centre.
It does NOT assert that the paper's empirical 0.2 mm transverse bound
is false, or that these assumptions are measured with exact precision.
-/ 

namespace HsHVerification.MercerTangGaussianGeometry

/-- If initial distance from the beam centre and outward travel are
nonnegative, the increase of squared radial offset bounds travel squared.
The physical orientation branch is an explicit hypothesis. -/
theorem outward_square_gain_bounds_displacement
    (y0 d : ℝ) (hy : 0 ≤ y0) (hd : 0 ≤ d) :
    d ^ 2 ≤ (y0 + d) ^ 2 - y0 ^ 2 := by
  have hprod : 0 ≤ y0 * d := mul_nonneg hy hd
  nlinarith

/-- A centred symmetric Gaussian does not distinguish +y from -y
by brightness alone. -/
theorem reflected_position_has_same_square (y : ℝ) :
    (-y) ^ 2 = y ^ 2 := by
  ring

/-- Squared displacement gains also have a simultaneous sign ambiguity. -/
theorem reflected_trajectory_same_square_gain (y0 y1 : ℝ) :
    (-y1) ^ 2 - (-y0) ^ 2 = y1 ^ 2 - y0 ^ 2 := by
  ring

#print axioms outward_square_gain_bounds_displacement
#print axioms reflected_position_has_same_square
#print axioms reflected_trajectory_same_square_gain

end HsHVerification.MercerTangGaussianGeometry
