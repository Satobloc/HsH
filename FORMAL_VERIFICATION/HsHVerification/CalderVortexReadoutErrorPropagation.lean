import Mathlib
import HsHVerification.NadirVortexTwoChannelReadout

/-!
# Exact error transformation for the published two-contour vortex readout

Source: Barckicke, Falcon and Gissinger, Nature Physics (2026), Methods,
DOI 10.1038/s41567-026-03175-w. The paper defines displacement and core
radius from opposing contour radii by

  eta = (r0 - rpi) / 2
  a   = (r0 + rpi) / 2.

The theorems below establish an exact algebraic identity for paired errors
under that source-defined linear readout and its inverse. They do not infer
independent channel errors, a covariance matrix, a standard error, or a
physical prediction. The paper's reported approximately 0.1 mm typical
uncertainty for core radius and position is not revised or decomposed here.
-/

namespace HsHVerification.CalderVortexReadoutErrorPropagation

open HsHVerification.NadirVortexTwoChannelReadout

/--
For any two pairs of opposing contour radii, the sum of squared Euclidean
errors in displacement and core radius is exactly one half the sum of
squared errors in the original paired radii.
-/
theorem observe_error_squared
    (r0 rpi s0 spi : ℝ) :
    ((observe r0 rpi).1 - (observe s0 spi).1) ^ 2 +
      ((observe r0 rpi).2 - (observe s0 spi).2) ^ 2 =
      ((r0 - s0) ^ 2 + (rpi - spi) ^ 2) / 2 := by
  simp [observe, displacement, coreRadius]
  ring

/--
The inverse reconstruction from displacement/radius to the two opposing
contour radii has the reciprocal squared-error factor of two.
-/
theorem reconstruct_error_squared
    (eta a xi b : ℝ) :
    ((reconstruct eta a).1 - (reconstruct xi b).1) ^ 2 +
      ((reconstruct eta a).2 - (reconstruct xi b).2) ^ 2 =
      2 * ((eta - xi) ^ 2 + (a - b) ^ 2) := by
  simp [reconstruct]
  ring

#print axioms observe_error_squared
#print axioms reconstruct_error_squared

end HsHVerification.CalderVortexReadoutErrorPropagation
