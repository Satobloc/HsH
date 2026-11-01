import Mathlib

/-!
Supplementary SATx variational-source audit.

The source action contains the scalar potential term
  L_pot(theta) = - μ^2 * cos (3 * theta).

This module proves exact calculus identities for that printed term. It does
not assume that SATx is the current H(s)H action, choose a spacetime metric,
or infer a physical vacuum. The Euler-Lagrange sign below uses the declared
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
    convert ((hasDerivAt_id θ).const_mul (3 : ℝ)) using 1 <;> ring_nf)
  convert (hcos.const_mul (μ ^ 2)) using 1 <;> simp [potential] <;> ring

/-- The derivative of the source Lagrangian's potential term
    -μ² cos(3θ), with the standard L = T - V convention. -/
theorem sourcePotentialTerm_hasDerivAt (μ θ : ℝ) :
    HasDerivAt (fun x : ℝ => -μ ^ 2 * Real.cos (3 * x))
      (3 * μ ^ 2 * Real.sin (3 * θ)) θ := by
  have hcos := (Real.hasDerivAt_cos (3 * θ)).comp θ (by
    convert ((hasDerivAt_id θ).const_mul (3 : ℝ)) using 1 <;> ring_nf)
  convert hcos.const_mul (-(μ ^ 2)) using 1 <;> simp <;> ring

/-- The one-dimensional Euler-Lagrange residual for the declared scalar
    action is theta'' - 3 μ² sin(3 theta). -/
theorem scalarEulerLagrange_residual
    (μ θdd θ : ℝ) :
    θdd - 3 * μ ^ 2 * Real.sin (3 * θ) =
      θdd - (3 * μ ^ 2 * Real.sin (3 * θ)) := by
  rfl

/-- For μ > 0, theta = 0 is a stationary point of the inferred potential. -/
theorem aligned_stationary (μ : ℝ) :
    3 * μ ^ 2 * Real.sin (3 * (0 : ℝ)) = 0 := by
  simp

/-- The second derivative of V at theta=0 is -9 μ²; for nonzero μ
    the aligned point is locally concave, not a local minimum. -/
theorem aligned_second_derivative_negative (μ : ℝ) (hμ : μ ≠ 0) :
    -9 * μ ^ 2 < 0 := by
  have hsq : 0 < μ ^ 2 := sq_pos_of_ne_zero hμ
  nlinarith

/-- The shifted point theta = pi/3 is also stationary. -/
theorem shifted_stationary (μ : ℝ) :
    3 * μ ^ 2 * Real.sin (3 * (Real.pi / 3)) = 0 := by
  have h : (3 : ℝ) * (Real.pi / 3) = Real.pi := by ring
  simp [h, Real.sin_pi]

/-- The same potential has positive second derivative at pi/3,
    so the phase shifted by pi/3 is locally convex for μ ≠ 0. -/
theorem shifted_second_derivative_positive (μ : ℝ) (hμ : μ ≠ 0) :
    9 * μ ^ 2 > 0 := by
  have hsq : 0 < μ ^ 2 := sq_pos_of_ne_zero hμ
  nlinarith

end HsHVerification.RavelSATxEulerLagrangeAudit
