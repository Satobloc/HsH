import Mathlib

/-!
Supplementary SATx variational-source audit.

The source action contains the scalar potential term
  L_pot(theta) = - μ^2 * cos (3 * theta).

This module proves exact first-derivative identities for that printed
term. It does not assume that SATx is the current H(s)H action, derive a full
Euler-Lagrange equation, choose a spacetime metric, or infer a physical vacuum.
The scalar residual candidate is only a definition under the declared
one-dimensional convention L = (1/2) (theta')^2 - V(theta).
-/

namespace HsHVerification.RavelSATxEulerLagrangeAudit

/-- The potential inferred from L = kinetic - V. -/
noncomputable def potential (μ θ : ℝ) : ℝ := μ ^ 2 * Real.cos (3 * θ)

/-- The derivative of the inferred potential. -/
theorem potential_hasDerivAt (μ θ : ℝ) :
    HasDerivAt (fun x : ℝ => potential μ x)
      (-3 * μ ^ 2 * Real.sin (3 * θ)) θ := by
  have hcos := (Real.hasDerivAt_cos (3 * θ)).comp θ (by
    convert ((hasDerivAt_id θ).const_mul (3 : ℝ)) using 1 <;> ext x <;> ring)
  convert (hcos.const_mul (μ ^ 2)) using 1 <;> simp [potential] <;> ring

/-- The derivative of the source Lagrangian's potential term
    -μ² cos(3θ), with the standard L = T - V convention. -/
theorem sourcePotentialTerm_hasDerivAt (μ θ : ℝ) :
    HasDerivAt (fun x : ℝ => -μ ^ 2 * Real.cos (3 * x))
      (3 * μ ^ 2 * Real.sin (3 * θ)) θ := by
  have hcos := (Real.hasDerivAt_cos (3 * θ)).comp θ (by
    convert ((hasDerivAt_id θ).const_mul (3 : ℝ)) using 1 <;> ext x <;> ring)
  convert hcos.const_mul (-(μ ^ 2)) using 1 <;> simp <;> ring

/-- Candidate residual expression under the declared one-dimensional
    convention. This is a definition only; no variational derivation is
    formalized here. -/
def scalarResidualCandidate (μ θdd θ : ℝ) : ℝ :=
  θdd - 3 * μ ^ 2 * Real.sin (3 * θ)

/-- The sine factor in the derivative formula vanishes at theta=0.
    Together with `potential_hasDerivAt`, this gives a stationary point. -/
theorem aligned_derivative_factor_zero (μ : ℝ) :
    3 * μ ^ 2 * Real.sin (3 * (0 : ℝ)) = 0 := by
  simp

/-- The coefficient -9 μ² is negative for μ ≠ 0. This is not a proof
    that it equals the second derivative of `potential`. -/
theorem aligned_curvature_coefficient_negative (μ : ℝ) (hμ : μ ≠ 0) :
    -9 * μ ^ 2 < 0 := by
  have hsq : 0 < μ ^ 2 := sq_pos_of_ne_zero hμ
  nlinarith

/-- The sine factor in the derivative formula vanishes at theta=pi/3.
    Together with `potential_hasDerivAt`, this gives a stationary point. -/
theorem shifted_derivative_factor_zero (μ : ℝ) :
    3 * μ ^ 2 * Real.sin (3 * (Real.pi / 3)) = 0 := by
  have h : (3 : ℝ) * (Real.pi / 3) = Real.pi := by ring
  simp [h, Real.sin_pi]

/-- The coefficient 9 μ² is positive for μ ≠ 0. This is not a proof
    that it equals the second derivative of `potential`. -/
theorem shifted_curvature_coefficient_positive (μ : ℝ) (hμ : μ ≠ 0) :
    9 * μ ^ 2 > 0 := by
  have hsq : 0 < μ ^ 2 := sq_pos_of_ne_zero hμ
  nlinarith

end HsHVerification.RavelSATxEulerLagrangeAudit
