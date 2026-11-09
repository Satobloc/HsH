import Mathlib

/-!
Source-linked conditional audit of the SAT4D O1 action.

Historical source: SAT4D_LIVE_DRAFT.txt, June 2025, byline Nathan McKnight,
Git blob 2a79fe25018cce7e99a2c33786d88b0551db6ae7, section
"SAT-O1: 4D Hyperhelical Filament Dynamics", especially the affine-parameter
definition and action.

The source writes S[gamma] = integral d lambda
  ((m / 2) * v^mu * v_mu - V_tension(gamma)),
with v = d gamma / d lambda and lambda called an affine parameter.

Conditional algebra audited here:
* Under an orientation-preserving affine rescaling lambda' = a lambda + b,
  a > 0, the tangent scales by a^{-1}.
* Any quadratic form Q on the tangent therefore scales by a^{-2}.
* If V_tension is treated as a scalar along the curve (rather than a
  parameter-density), the kinetic contribution per rescaled interval scales
  by a^{-1}, while the potential contribution scales by a.

The module proves those algebraic scaling identities and a concrete
counterexample to generic affine-scale invariance for a constant-density
unit interval. It does NOT formalize the chain rule, the full functional
change-of-variables theorem, the spacetime metric, the physical meaning or
units of lambda, or the tension law. It is not a physical calculation,
fit, prediction, or correction to the historical source.

Interpretive consequence: the source must either fix a physical normalization
of lambda (its gamma^0 = lambda may be intended as a gauge choice, but the
coordinate/time units are not stated), give V_tension the appropriate
parameter-density transformation, or adopt a reparameterization-invariant
action. This is a missing specification, not proof that the source's
intended model is impossible.
-/

namespace HsHVerification.AldusSAT4DAffineParameter

/-- Homogeneity law for a quadratic form on tangent vectors. -/
theorem quadratic_form_rescales
    {V : Type*} [SMul ℝ V] (Q : V → ℝ)
    (hQ : ∀ (c : ℝ) (v : V), Q (c • v) = c ^ 2 * Q v)
    (v : V) (a : ℝ) :
    Q (a⁻¹ • v) = (a⁻¹) ^ 2 * Q v := by
  exact hQ a⁻¹ v

/-- Kinetic contribution on a constant-density interval after lambda' = a lambda + b.
    q is the quadratic-form value before rescaling; a > 0 preserves orientation. -/
def scaledKineticAction (m q T a : ℝ) : ℝ :=
  (m * (q / a ^ 2) / 2) * (a * T)

/-- Original kinetic contribution on the same interval. -/
def kineticAction (m q T : ℝ) : ℝ :=
  (m * q / 2) * T

/-- The quadratic kinetic contribution scales inversely with affine parameter scale. -/
theorem kinetic_action_scales_inverse
    (m q T a : ℝ) (ha : 0 < a) :
    scaledKineticAction m q T a = kineticAction m q T / a := by
  unfold scaledKineticAction kineticAction
  have hne : a ≠ 0 := ne_of_gt ha
  field_simp [hne]
  ring

/-- Potential contribution if V is a scalar, not a parameter-density. -/
def scaledPotentialAction (V T a : ℝ) : ℝ :=
  V * (a * T)

/-- Original potential contribution on the same interval. -/
def potentialAction (V T : ℝ) : ℝ :=
  V * T

/-- A scalar potential contribution scales with the parameter interval. -/
theorem potential_action_scales_with_parameter
    (V T a : ℝ) :
    scaledPotentialAction V T a = a * potentialAction V T := by
  unfold scaledPotentialAction potentialAction
  ring

/-- The source action under the stated scalar-potential rescaling assumptions. -/
def actionAfterScale (m q V T a : ℝ) : ℝ :=
  scaledKineticAction m q T a - scaledPotentialAction V T a

/-- The same source action at unit parameter scale. -/
def actionAtUnitScale (m q V T : ℝ) : ℝ :=
  kineticAction m q T - potentialAction V T

/-- The rescaled action decomposes into inverse-scaled kinetic and
    directly scaled scalar-potential contributions. -/
theorem action_rescaling_formula
    (m q V T a : ℝ) (ha : 0 < a) :
    actionAfterScale m q V T a =
      kineticAction m q T / a - a * potentialAction V T := by
  unfold actionAfterScale
  rw [kinetic_action_scales_inverse m q T a ha]
  rw [potential_action_scales_with_parameter]

/-- Unit scale is the identity transformation. -/
theorem unit_scale_is_identity
    (m q V T : ℝ) :
    actionAfterScale m q V T 1 = actionAtUnitScale m q V T := by
  norm_num [actionAfterScale, scaledKineticAction, scaledPotentialAction,
    actionAtUnitScale, kineticAction, potentialAction]

/-- Algebraic counterexample: the written scalar-potential action is not
    invariant under every affine rescaling. This is not a physical fixture. -/
theorem action_not_invariant_in_general :
    actionAfterScale 1 1 1 1 2 ≠ actionAtUnitScale 1 1 1 1 := by
  norm_num [actionAfterScale, scaledKineticAction, scaledPotentialAction,
    actionAtUnitScale, kineticAction, potentialAction]

#print axioms quadratic_form_rescales
#print axioms kinetic_action_scales_inverse
#print axioms potential_action_scales_with_parameter
#print axioms action_rescaling_formula
#print axioms unit_scale_is_identity
#print axioms action_not_invariant_in_general

end HsHVerification.AldusSAT4DAffineParameter
