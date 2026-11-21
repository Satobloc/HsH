import Mathlib

namespace HsHVerification.SableRQMFrequencyDomain

/-!
Source-specific conditional audit of the two-radius superhelix frequency relation.

The archived WHIRLY/Interconn summaries give the ansatz
  H(λ) = (R cos(ωs λ), R sin(ωs λ), r cos(ωh λ), r sin(ωh λ))
and the uncoupled equation
  κ H'''' + 2 λs (|H|² - R²) H = 0.

This module formalizes only the algebraic consequences of that ansatz and
that asserted equation. It does not derive the equation by variation, define
the physical units/sign convention, or establish an H(s)H/GR-QM isomorphism.
-/

/-- The squared norm of the archived two-radius superhelix ansatz. -/
theorem superhelix_norm_sq (R r θ ψ : ℝ) :
    (R * Real.cos θ)^2 + (R * Real.sin θ)^2
      + (r * Real.cos ψ)^2 + (r * Real.sin ψ)^2 = R^2 + r^2 := by
  nlinarith [Real.sin_sq_add_cos_sq θ, Real.sin_sq_add_cos_sq ψ]

/-- With the stated ansatz, the constraint residual |H|² - R² is r². -/
theorem superhelix_constraint_residual (R r θ ψ : ℝ) :
    ((R * Real.cos θ)^2 + (R * Real.sin θ)^2
      + (r * Real.cos ψ)^2 + (r * Real.sin ψ)^2) - R^2 = r^2 := by
  rw [superhelix_norm_sq]
  ring

/-- The two component equations share the same fourth-power frequency. -/
theorem component_fourth_powers_equal
    (κ lambdaS r ωs ωh : ℝ)
    (hκ : κ ≠ 0)
    (hs : κ * ωs^4 + 2 * lambdaS * r^2 = 0)
    (hh : κ * ωh^4 + 2 * lambdaS * r^2 = 0) :
    ωs^4 = ωh^4 := by
  have hmul : κ * (ωs^4 - ωh^4) = 0 := by nlinarith
  rcases mul_eq_zero.mp hmul with hκ0 | hdiff
  · exact (hκ hκ0).elim
  · linarith

/-- A real-frequency solution with positive stiffness and nonzero transverse
radius requires the signed constraint coefficient to be nonpositive. -/
theorem signed_frequency_requires_nonpositive_lambda
    (κ lambdaS r ω : ℝ)
    (hκ : 0 < κ)
    (hr : 0 < r)
    (hdisp : κ * ω^4 + 2 * lambdaS * r^2 = 0) :
    lambdaS ≤ 0 := by
  have hω4 : 0 ≤ ω^4 := by positivity
  have hκω : 0 ≤ κ * ω^4 := mul_nonneg (le_of_lt hκ) hω4
  have hr2 : 0 < r^2 := by positivity
  nlinarith

/-- A nonzero real frequency requires a strictly negative signed
constraint coefficient under positive stiffness and nonzero transverse radius. -/
theorem signed_frequency_requires_negative_lambda
    (κ lambdaS r ω : ℝ)
    (hκ : 0 < κ)
    (hr : 0 < r)
    (hω : ω ≠ 0)
    (hdisp : κ * ω^4 + 2 * lambdaS * r^2 = 0) :
    lambdaS < 0 := by
  have hω4 : 0 < ω^4 := by positivity
  have hκω : 0 < κ * ω^4 := mul_pos hκ hω4
  have hr2 : 0 < r^2 := by positivity
  nlinarith

/-- Under lambdaS < 0, the signed and absolute-value frequency expressions agree
for every real κ; no sign or nonzero assumption on κ is needed for this algebraic identity. -/
theorem signed_and_absolute_frequency_forms_agree
    (κ lambdaS r : ℝ)
    (hLambda : lambdaS < 0) :
    -(2 * lambdaS * r^2) / κ = (2 * |lambdaS| * r^2) / κ := by
  rw [abs_of_neg hLambda]
  ring

/-- The alternative residual r² - R² differs from the residual r² produced
by the stated ansatz whenever the background radius R is positive. -/
theorem inserted_background_residual_mismatch
    (R r : ℝ)
    (hR : 0 < R) :
    r^2 - R^2 ≠ r^2 := by
  intro h
  have hR2 : 0 < R^2 := by positivity
  nlinarith

/-- Positive λ cannot satisfy the signed dispersion equation for any
real ω when κ and r are positive. -/
theorem positive_lambda_excludes_real_frequency
    (κ lambdaS r ω : ℝ)
    (hκ : 0 < κ)
    (hLambda : 0 < lambdaS)
    (hr : 0 < r)
    (hdisp : κ * ω^4 + 2 * lambdaS * r^2 = 0) :
    False := by
  have hω4 : 0 ≤ ω^4 := by positivity
  have hκω : 0 ≤ κ * ω^4 := mul_nonneg (le_of_lt hκ) hω4
  have hr2 : 0 < r^2 := by positivity
  have hLambdar : 0 < 2 * lambdaS * r^2 := by positivity
  nlinarith

#print axioms superhelix_norm_sq
#print axioms superhelix_constraint_residual
#print axioms component_fourth_powers_equal
#print axioms signed_frequency_requires_nonpositive_lambda
#print axioms signed_frequency_requires_negative_lambda
#print axioms signed_and_absolute_frequency_forms_agree
#print axioms inserted_background_residual_mismatch
#print axioms positive_lambda_excludes_real_frequency

end HsHVerification.SableRQMFrequencyDomain
