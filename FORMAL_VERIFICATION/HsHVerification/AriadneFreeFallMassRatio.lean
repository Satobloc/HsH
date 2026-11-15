import Mathlib

/-!
# Free-fall ratio identifiability

This module formalizes a conditional weak-field test model:

  a = g * (m_g / m_i).

It proves that a differential free-fall observable identifies the
gravitational-to-inertial mass ratio, not inertial mass separately.
A spin-dependent inertial mass can therefore be invisible to this
observable if gravitational mass changes proportionally.

This is algebra over the declared model. It is not a derivation from GR,
an H(s)H equation, or an empirical claim about any experiment.
-/

namespace HsHVerification.AriadneFreeFallMassRatio

structure MassState where
  gravitationalMass : ℝ
  inertialMass : ℝ
  inertialMass_pos : 0 < inertialMass

def freeFallAcceleration (g : ℝ) (state : MassState) : ℝ :=
  g * (state.gravitationalMass / state.inertialMass)

theorem freeFallAcceleration_eq_iff_mass_ratio_eq
    (g : ℝ) (hg : g ≠ 0) (state₀ state₁ : MassState) :
    freeFallAcceleration g state₀ = freeFallAcceleration g state₁ ↔
      state₀.gravitationalMass / state₀.inertialMass =
        state₁.gravitationalMass / state₁.inertialMass := by
  unfold freeFallAcceleration
  constructor
  · intro h
    exact mul_left_cancel₀ hg h
  · intro h
    rw [h]

theorem proportional_gravitational_mass_hides_inertial_mass_change
    (g λ m₀ m₁ : ℝ) (hm₀ : 0 < m₀) (hm₁ : 0 < m₁) :
    freeFallAcceleration g ⟨λ * m₀, m₀, hm₀⟩ =
      freeFallAcceleration g ⟨λ * m₁, m₁, hm₁⟩ := by
  unfold freeFallAcceleration
  field_simp [ne_of_gt hm₀, ne_of_gt hm₁]
  ring

theorem freeFall_null_does_not_imply_inertial_mass_equal
    (g λ m₀ m₁ : ℝ) (hm₀ : 0 < m₀) (hm₁ : 0 < m₁)
    (hneq : m₀ ≠ m₁) :
    freeFallAcceleration g ⟨λ * m₀, m₀, hm₀⟩ =
      freeFallAcceleration g ⟨λ * m₁, m₁, hm₁⟩ ∧ m₀ ≠ m₁ := by
  constructor
  · exact proportional_gravitational_mass_hides_inertial_mass_change
      g λ m₀ m₁ hm₀ hm₁
  · exact hneq

#print axioms freeFallAcceleration_eq_iff_mass_ratio_eq
#print axioms proportional_gravitational_mass_hides_inertial_mass_change
#print axioms freeFall_null_does_not_imply_inertial_mass_equal

end HsHVerification.AriadneFreeFallMassRatio
