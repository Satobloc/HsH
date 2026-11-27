import Mathlib

/-!
# Charge-support / geometric-core identifiability gate

Source roles:
* Nathan Direct (2026-09-07): the object is a four-dimensional extension of a
  worldtube with a chosen spatial Kerr section extended along the filament.
  Shell distortion as a force-carrier was left as a question; Nathan later
  corrected that filament and timesheet distortions are mutual accommodations
  and that force is the primitive.
* Standard measurement: Bourilkov (2000), arXiv:hep-ph/0002172, fits a
  phenomenological electron form factor
    F(Q²) = 1 + Q² r_e² / 6
  to LEP2 Bhabha-scattering data and reports a model-dependent 95% CL limit.
* Historical assistant reconstruction: the compact Blockwave action uses a
  conserved antisymmetric worldsheet current J^{μν}. This is not an
  electromagnetic four-current j^μ and does not by itself specify a charge
  density on the Kerr section.

The theorem below is a minimal algebraic identifiability witness. A fraction f
of a normalized, same-sign static charge profile is placed at the geometric
outer radius R; the remainder is at the origin. It is NOT asserted to be the
electron's physical profile. It shows that a second-moment/form-factor
parameter cannot bound total geometric support unless the model supplies a
positive lower bound on the charge fraction coupled to the outer core.

This does not formalize distributions, a covariant current, QED scattering, or
the actual LEP likelihood. It does not prove that the LEP r_e parameter is a
positive static charge-density moment. That identification is an additional
physical premise, not a Lean result.
-/

namespace HsHVerification.ChargeSupportIdentifiabilityGate

/-- Squared second moment for a two-component radial profile:
outerFraction of normalized charge lies at squared radius coreRadiusSq,
and the rest lies at radius zero. -/
def chargeMomentSq (outerFraction coreRadiusSq : ℝ) : ℝ :=
  outerFraction * coreRadiusSq

/-- The linearized effective form-factor parameterization used in the
Bourilkov LEP analysis, expressed as a readout of the squared-radius parameter. -/
def linearizedFormFactor (qSquared momentSq : ℝ) : ℝ :=
  1 + qSquared * momentSq / 6

/-- A positive normalized profile has second moment no larger than its
squared geometric support radius. -/
theorem charge_moment_le_support_squared
    (f R2 : ℝ) (hf0 : 0 ≤ f) (hf1 : f ≤ 1) (hR2 : 0 ≤ R2) :
    chargeMomentSq f R2 ≤ R2 := by
  unfold chargeMomentSq
  have hMoment : 0 ≤ f * R2 := mul_nonneg hf0 hR2
  have hRemainder : 0 ≤ (1 - f) * R2 :=
    mul_nonneg (sub_nonneg.mpr hf1) hR2
  nlinarith

/-- A thin uniformly charged shell has its full charge moment at the
geometric support radius. -/
theorem uniform_shell_moment_eq_support
    (R2 : ℝ) :
    chargeMomentSq 1 R2 = R2 := by
  simp [chargeMomentSq]

/-- For any fixed positive second moment and any proposed upper bound on
squared support, there is a larger support radius and a positive outer
charge fraction producing exactly that same moment. Thus the moment alone
does not identify the geometric support. -/
theorem fixed_positive_moment_has_unbounded_support
    (momentSq : ℝ) (hMoment : 0 < momentSq) :
    ∀ bound : ℝ, ∃ R2 f : ℝ,
      bound < R2 ∧ 0 < f ∧ f ≤ 1 ∧
      chargeMomentSq f R2 = momentSq := by
  intro bound
  let R2 : ℝ := max (bound + 1) momentSq
  have hBound : bound < R2 := by
    dsimp [R2]
    exact lt_of_lt_of_le (lt_add_of_pos_right bound zero_lt_one) (le_max_left _ _)
  have hMomentLe : momentSq ≤ R2 := by
    dsimp [R2]
    exact le_max_right _ _
  have hR2 : 0 < R2 := lt_of_lt_of_le hMoment hMomentLe
  refine ⟨R2, momentSq / R2, hBound, div_pos hMoment hR2, ?_, ?_⟩
  · rw [div_le_iff₀ hR2]
    simpa using hMomentLe
  · simp [chargeMomentSq, ne_of_gt hR2]

/-- If the model guarantees at least fMin > 0 of the charge at the outer
core radius, an upper bound on the measured second moment bounds the
geometric support. This is the missing profile-closure condition. -/
theorem lower_outer_fraction_and_moment_bound_bound_support
    (f fMin R2 measuredMomentSq : ℝ)
    (hfMin : 0 < fMin)
    (hFraction : fMin ≤ f)
    (hR2 : 0 ≤ R2)
    (hMeasured : chargeMomentSq f R2 ≤ measuredMomentSq) :
    R2 ≤ measuredMomentSq / fMin := by
  have hProduct : fMin * R2 ≤ chargeMomentSq f R2 := by
    unfold chargeMomentSq
    exact mul_le_mul_of_nonneg_right hFraction hR2
  have hBound : R2 * fMin ≤ measuredMomentSq := by
    calc
      R2 * fMin = fMin * R2 := mul_comm _ _
      _ ≤ chargeMomentSq f R2 := hProduct
      _ ≤ measuredMomentSq := hMeasured
  rw [le_div_iff₀ hfMin]
  exact hBound

/-- At the linearized form-factor order, profiles with the same second
moment have exactly the same readout, regardless of their support radii. -/
theorem same_moment_same_linearized_form_factor
    (qSquared f₁ R₁ f₂ R₂ : ℝ)
    (hMoment : chargeMomentSq f₁ R₁ = chargeMomentSq f₂ R₂) :
    linearizedFormFactor qSquared (chargeMomentSq f₁ R₁) =
      linearizedFormFactor qSquared (chargeMomentSq f₂ R₂) := by
  simp [linearizedFormFactor, hMoment]

/-- A fixed positive form-factor moment is compatible with arbitrarily
large geometric support while preserving the same linearized readout. -/
theorem different_support_can_be_form_factor_indistinguishable
    (momentSq bound qSquared : ℝ) (hMoment : 0 < momentSq) :
    ∃ R2 f : ℝ,
      bound < R2 ∧ 0 < f ∧ f ≤ 1 ∧
      linearizedFormFactor qSquared (chargeMomentSq f R2) =
        linearizedFormFactor qSquared momentSq := by
  obtain ⟨R2, f, hBound, hf0, hf1, hEq⟩ :=
    fixed_positive_moment_has_unbounded_support momentSq hMoment bound
  refine ⟨R2, f, hBound, hf0, hf1, ?_⟩
  rw [hEq]

#print axioms charge_moment_le_support_squared
#print axioms uniform_shell_moment_eq_support
#print axioms fixed_positive_moment_has_unbounded_support
#print axioms lower_outer_fraction_and_moment_bound_bound_support
#print axioms same_moment_same_linearized_form_factor
#print axioms different_support_can_be_form_factor_indistinguishable

end HsHVerification.ChargeSupportIdentifiabilityGate
