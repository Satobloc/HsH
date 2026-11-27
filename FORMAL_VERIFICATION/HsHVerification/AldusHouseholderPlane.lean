import Mathlib

/-!
# Householder reflection and induced Lorentzian metric candidate

Assistant reconstruction only. The source-level metric-induction proposal in
HAGALAZ_DEF+ gives g = δ - 2 u⊗u for a Euclidean background δ and a unit
normal u. In an orthonormal 2D basis with n(θ) = (sin θ, cos θ), its matrix is

  [[cos(2θ), -sin(2θ)],
   [-sin(2θ), -cos(2θ)]].

The same component matrix has two distinct roles:
* as a linear endomorphism it is the Householder reflection R = I - 2 n nᵀ;
* as a bilinear-form matrix it represents the Lorentz-signature form
  g(v,w) = δ(v,w) - 2 δ(v,n) δ(n,w).

The first role is an orthogonal involution; the second is an indefinite
symmetric form with one negative normal direction and a positive orthogonal
direction in this 2D restriction. Neither role supplies a map to Nathan
Direct's still-undefined ᚼ metric/normalizer, nor a physical matter coupling.
-/

namespace HsHVerification.AldusHouseholderPlane

/-- The 2D component matrix for the assistant-reconstructed time-normal form. -/
noncomputable def timeNormalPlaneMetric (θ : ℝ) :
    Matrix (Fin 2) (Fin 2) ℝ :=
  !![Real.cos (2 * θ), -Real.sin (2 * θ);
     -Real.sin (2 * θ), -Real.cos (2 * θ)]

/-- The matrix is symmetric entry by entry. -/
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

/-- As a linear operator, the matrix is an involution (a reflection). -/
theorem timeNormalPlaneMetric_involutive (θ : ℝ) :
    timeNormalPlaneMetric θ * timeNormalPlaneMetric θ = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [timeNormalPlaneMetric, Matrix.mul_apply, Fin.sum_univ_succ] <;>
    nlinarith [Real.sin_sq_add_cos_sq (2 * θ)]

/-- General metric-induction form g(v,w)=⟪v,w⟫-2⟪v,u⟫⟪u,w⟫. -/
def timeNormalInducedForm {E : Type*} [InnerProductSpace ℝ E]
    (u v w : E) : ℝ :=
  inner ℝ v w - 2 * inner ℝ v u * inner ℝ u w

/-- The induced form is symmetric. -/
theorem timeNormalInducedForm_symmetric
    {E : Type*} [InnerProductSpace ℝ E] (u v w : E) :
    timeNormalInducedForm u v w = timeNormalInducedForm u w v := by
  simp [timeNormalInducedForm, real_inner_comm, mul_comm, mul_left_comm, mul_assoc]

/-- A unit normal is the negative direction of the induced form. -/
theorem timeNormalInducedForm_normal_negative
    {E : Type*} [InnerProductSpace ℝ E] {u : E}
    (hu : inner ℝ u u = 1) :
    timeNormalInducedForm u u u = -1 := by
  simp [timeNormalInducedForm, hu]

/-- Directions orthogonal to the unit normal retain the positive background form. -/
theorem timeNormalInducedForm_spatial_positive
    {E : Type*} [InnerProductSpace ℝ E] {u v : E}
    (hu : inner ℝ u u = 1) (hv : inner ℝ v u = 0) :
    timeNormalInducedForm u v v = inner ℝ v v := by
  simp [timeNormalInducedForm, hv, real_inner_comm]

#print axioms timeNormalPlaneMetric_symmetric
#print axioms timeNormalPlaneMetric_det
#print axioms timeNormalPlaneMetric_involutive
#print axioms timeNormalInducedForm_symmetric
#print axioms timeNormalInducedForm_normal_negative
#print axioms timeNormalInducedForm_spatial_positive

end HsHVerification.AldusHouseholderPlane
