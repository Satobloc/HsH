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
  exact hTheta.isSymmSndFDerivAt (by simp [minSmoothness])

/--
Local-coordinate covariant Hessian for a scalar field, with connection
coefficients Gamma.  The sign convention is fixed by this definition.
-/
def coordinateCovariantHessian
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
  have hSecond := hTheta.isSymmSndFDerivAt (by simp [minSmoothness])
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

#print axioms scalar_second_derivative_is_symmetric
#print axioms coordinate_covariant_hessian_is_symmetric
#print axioms coordinate_covariant_hessian_antisymmetrization_zero

end HsHVerification
