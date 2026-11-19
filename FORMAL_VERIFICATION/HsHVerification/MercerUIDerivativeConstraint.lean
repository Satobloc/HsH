import Mathlib

/-!
# Mercer UI: derivative-indicatrix radius consistency

This module checks one assistant-generated four-coordinate parameterization
from the historical "DERIVATIVE INDICATRIX" document:

  H = (a cos θ₁, a sin θ₁, b cos θ₂, b sin θ₂).

It proves only its Euclidean squared norm and the resulting constraint residual.
It does not assert that this parameterization is Nathan Direct, that it is the
Universal Indicatrix itself, or that the proposed Lagrangian is physical.
The source's separate UI mapping geometry remains distinct.
-/

namespace HsHVerification.MercerUIDerivativeConstraint

theorem four_coordinate_norm_sq
    (a b θ₁ θ₂ : ℝ) :
    (a * Real.cos θ₁) ^ 2 + (a * Real.sin θ₁) ^ 2 +
      (b * Real.cos θ₂) ^ 2 + (b * Real.sin θ₂) ^ 2 =
      a ^ 2 + b ^ 2 := by
  have h₁ : Real.cos θ₁ ^ 2 + Real.sin θ₁ ^ 2 = 1 := by
    nlinarith [Real.sin_sq_add_cos_sq θ₁]
  have h₂ : Real.cos θ₂ ^ 2 + Real.sin θ₂ ^ 2 = 1 := by
    nlinarith [Real.sin_sq_add_cos_sq θ₂]
  calc
    _ = a ^ 2 * (Real.cos θ₁ ^ 2 + Real.sin θ₁ ^ 2) +
        b ^ 2 * (Real.cos θ₂ ^ 2 + Real.sin θ₂ ^ 2) := by ring
    _ = a ^ 2 * 1 + b ^ 2 * 1 := by rw [h₁, h₂]
    _ = a ^ 2 + b ^ 2 := by ring

theorem major_radius_constraint_residual
    (a b θ₁ θ₂ : ℝ) :
    ((a * Real.cos θ₁) ^ 2 + (a * Real.sin θ₁) ^ 2 +
      (b * Real.cos θ₂) ^ 2 + (b * Real.sin θ₂) ^ 2) - a ^ 2 =
      b ^ 2 := by
  rw [four_coordinate_norm_sq]
  ring

theorem nonzero_minor_radius_misses_major_radius_sphere
    (a b θ₁ θ₂ : ℝ) (hb : b ≠ 0) :
    (a * Real.cos θ₁) ^ 2 + (a * Real.sin θ₁) ^ 2 +
      (b * Real.cos θ₂) ^ 2 + (b * Real.sin θ₂) ^ 2 ≠ a ^ 2 := by
  rw [four_coordinate_norm_sq]
  intro h
  have hzero : b ^ 2 = 0 := by linarith
  exact (pow_ne_zero 2 hb) hzero

#print axioms four_coordinate_norm_sq
#print axioms major_radius_constraint_residual
#print axioms nonzero_minor_radius_misses_major_radius_sphere

end HsHVerification.MercerUIDerivativeConstraint
