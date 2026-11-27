import Mathlib

/-!
# Two-dimensional Householder time-normal metric candidate

This is an assistant-reconstructed mathematical candidate from the
October 7 Meridian Free Build discussion. It is not a Nathan Direct
equation, a defined matter coupling, or an H(s)H physical metric.

For a unit director n(θ) = (sin θ, cos θ), the proposed reflection
matrix has determinant -1 for every θ. This checks only the stated
2D algebraic identity.
-/

namespace HsHVerification.AldusHouseholderPlane

/-- The 2D restriction of the assistant-reconstructed Householder metric. -/
noncomputable def timeNormalPlaneMetric (θ : ℝ) :
    Matrix (Fin 2) (Fin 2) ℝ :=
  !![Real.cos (2 * θ), -Real.sin (2 * θ);
     -Real.sin (2 * θ), -Real.cos (2 * θ)]

/-- The candidate matrix is symmetric entry by entry. -/
theorem timeNormalPlaneMetric_symmetric (θ : ℝ) :
    ∀ i j, timeNormalPlaneMetric θ i j = timeNormalPlaneMetric θ j i := by
  intro i j
  fin_cases i <;> fin_cases j <;> simp [timeNormalPlaneMetric]

/-- Its determinant is -1, independently of the director angle. -/
theorem timeNormalPlaneMetric_det (θ : ℝ) :
    Matrix.det (timeNormalPlaneMetric θ) = -1 := by
  rw [Matrix.det_fin_two]
  simp [timeNormalPlaneMetric]
  nlinarith [Real.sin_sq_add_cos_sq (2 * θ)]

#print axioms timeNormalPlaneMetric_symmetric
#print axioms timeNormalPlaneMetric_det

end HsHVerification.AldusHouseholderPlane
