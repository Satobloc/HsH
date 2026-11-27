import Mathlib

/-!
# Unit-normal derivative is tangent to the unit sphere

This module proves a conditional kinematic identity for a differentiable
curve in a real positive-definite inner-product space.

It does not define a connection, affine torsion tensor, matter coupling,
physical time-normal field, or H(s)H readout map.
-/

namespace HsHVerification.AldusTimeNormalTangent

/-- A differentiable curve with constant squared norm has derivative
orthogonal to its current value. -/
theorem inner_eq_zero_of_constant_norm_sq
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {f : ℝ → E} {f' : E} {x c : ℝ}
    (hf : HasDerivAt f f' x)
    (hnorm : ∀ t, ‖f t‖ ^ 2 = c) :
    inner (f x) f' = 0 := by
  have hconst : HasDerivAt (fun t : ℝ => ‖f t‖ ^ 2) 0 x := by
    have hEq : (fun t : ℝ => ‖f t‖ ^ 2) = fun _ : ℝ => c := by
      funext t
      exact hnorm t
    rw [hEq]
    exact hasDerivAt_const
  have hderiv := hf.norm_sq.unique hconst
  linarith

/-- Unit-normal specialization: the derivative of a unit director is
orthogonal to that director in the declared positive-definite inner product. -/
theorem unit_normal_derivative_is_tangent
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {n : ℝ → E} {n' : E} {x : ℝ}
    (hn : ∀ t, ‖n t‖ ^ 2 = 1)
    (hderiv : HasDerivAt n n' x) :
    inner (n x) n' = 0 :=
  inner_eq_zero_of_constant_norm_sq hderiv hn

#print axioms inner_eq_zero_of_constant_norm_sq
#print axioms unit_normal_derivative_is_tangent

end HsHVerification.AldusTimeNormalTangent
