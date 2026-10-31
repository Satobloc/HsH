import Mathlib.Analysis.Calculus.FDeriv.Symmetric

namespace HsHVerification

/--
A twice continuously differentiable scalar field on a real normed space has
symmetric second Fréchet derivative.  This is a local-coordinate calculus
result; it is not by itself a theorem about any physical model.
-/
theorem scalar_second_derivative_is_symmetric
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (theta : E → ℝ) (x : E)
    (hTheta : ContDiffAt ℝ 2 theta x) :
    IsSymmSndFDerivAt ℝ theta x := by
  exact hTheta.isSymmSndFDerivAt (by simp)

/--
Local-coordinate covariant Hessian for a scalar field, with connection
coefficients Gamma.  The sign convention is fixed by this definition.
-/
noncomputable def coordinateCovariantHessian
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (theta : E → ℝ) (x : E) (Gamma : E → E → E)
    (v w : E) : ℝ :=
  fderiv ℝ (fderiv ℝ theta) x v w - fderiv ℝ theta x (Gamma v w)

/--
If the scalar is C^2 and the coordinate connection coefficients are symmetric
(the torsion-free coordinate condition), then the scalar covariant Hessian is
symmetric.  This is a conditional local-coordinate result, not a global
manifold formalization.
-/
theorem coordinate_covariant_hessian_is_symmetric
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (theta : E → ℝ) (x : E) (Gamma : E → E → E)
    (hTheta : ContDiffAt ℝ 2 theta x)
    (hGamma : ∀ v w, Gamma v w = Gamma w v)
    (v w : E) :
    coordinateCovariantHessian theta x Gamma v w =
      coordinateCovariantHessian theta x Gamma w v := by
  have hSecond := hTheta.isSymmSndFDerivAt (by simp)
  unfold coordinateCovariantHessian
  rw [hSecond v w, hGamma v w]

/--
Consequently, the antisymmetric part corresponding to
nabla_[mu nabla_nu] theta vanishes under the stated smoothness and
torsion-free coordinate assumptions.
-/
theorem coordinate_covariant_hessian_antisymmetrization_zero
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (theta : E → ℝ) (x : E) (Gamma : E → E → E)
    (hTheta : ContDiffAt ℝ 2 theta x)
    (hGamma : ∀ v w, Gamma v w = Gamma w v)
    (v w : E) :
    coordinateCovariantHessian theta x Gamma v w -
      coordinateCovariantHessian theta x Gamma w v = 0 := by
  exact sub_eq_zero.mpr
    (coordinate_covariant_hessian_is_symmetric theta x Gamma hTheta hGamma v w)


/--
Degree bookkeeping only: in an n-dimensional oriented metric space, the
Hodge star sends a p-form to degree n-p.  This arithmetic definition does not
construct a Hodge-star operator.
-/
def hodgeDegree (ambientDim formDegree : Nat) : Nat :=
  ambientDim - formDegree

/--
Degree bookkeeping only: the Poincare-dual current of a k-dimensional
embedded support in an n-dimensional ambient space has form degree n-k.
This does not construct a distributional current.
-/
def poincareDualDegree (ambientDim supportDim : Nat) : Nat :=
  ambientDim - supportDim

/--
Expected dimension of a transverse intersection of submanifolds with the
given dimensions.  This records the dimension count, not transversality.
-/
def transverseIntersectionDimension
    (supportDim hypersurfaceDim ambientDim : Nat) : Nat :=
  supportDim + hypersurfaceDim - ambientDim

theorem hodge_degree_three_form_in_four_dimensions :
    hodgeDegree 4 3 = 1 := by decide

theorem hodge_degree_two_form_in_four_dimensions :
    hodgeDegree 4 2 = 2 := by decide

theorem three_form_hodge_degree_is_not_two :
    hodgeDegree 4 3 ≠ 2 := by decide

theorem worldline_poincare_dual_degree_in_four_dimensions :
    poincareDualDegree 4 1 = 3 := by decide

theorem worldsheet_poincare_dual_degree_in_four_dimensions :
    poincareDualDegree 4 2 = 2 := by decide

theorem finite_core_region_poincare_dual_degree_in_four_dimensions :
    poincareDualDegree 4 4 = 0 := by decide

theorem worldline_timesheet_transverse_intersection_dimension :
    transverseIntersectionDimension 1 3 4 = 0 := by decide

theorem worldsheet_timesheet_transverse_intersection_dimension :
    transverseIntersectionDimension 2 3 4 = 1 := by decide

theorem finite_core_timesheet_transverse_intersection_dimension :
    transverseIntersectionDimension 4 3 4 = 3 := by decide

#print axioms hodge_degree_three_form_in_four_dimensions
#print axioms three_form_hodge_degree_is_not_two
#print axioms worldline_poincare_dual_degree_in_four_dimensions
#print axioms worldsheet_poincare_dual_degree_in_four_dimensions
#print axioms finite_core_region_poincare_dual_degree_in_four_dimensions

#print axioms scalar_second_derivative_is_symmetric
#print axioms coordinate_covariant_hessian_is_symmetric
#print axioms coordinate_covariant_hessian_antisymmetrization_zero

end HsHVerification
