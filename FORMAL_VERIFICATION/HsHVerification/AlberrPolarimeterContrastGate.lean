import HsHVerification.AlberrPolarimeterPhaseGate

/-!
# Conditional visibility extension of 2015 neutron-polarimeter readout

Observed mean modulation contrast: 95.23(84)% in Demirel et al. (2015),
New J. Phys. 17 023065, figure 3(B). This module treats C as an
arbitrary real parameter: it does not derive a visibility mechanism.
Ideal phase model I_C = [1 + C cos(alpha + phi)]/2.
The signed quadrature difference is an algebraic discriminator provided
the scan reference alpha is calibrated; a cosine-only zero-reference
readout is even in phi. Neither establishes physical worldtube chirality.
-/

namespace HsHVerification.AlberrPolarimeterContrastGate

open HsHVerification.AlberrPolarimeterPhaseGate

noncomputable def visibilityIntensity (C alpha phi : ℝ) : ℝ :=
  (1 + C * Real.cos (alpha + phi)) / 2

theorem zero_reference_even (C phi : ℝ) :
    visibilityIntensity C 0 phi = visibilityIntensity C 0 (-phi) := by
  simp [visibilityIntensity]

theorem unit_visibility_recovers_ideal (alpha phi : ℝ) :
    visibilityIntensity 1 alpha phi = idealIntensity alpha phi := by
  simp [visibilityIntensity, idealIntensity]

theorem opposite_phase_difference (C alpha phi : ℝ) :
    visibilityIntensity C alpha phi - visibilityIntensity C alpha (-phi) =
    -C * Real.sin alpha * Real.sin phi := by
  unfold visibilityIntensity
  simp only [Real.cos_add, Real.cos_neg, Real.sin_neg]
  ring

theorem zero_contrast_is_uninformative (alpha phi : ℝ) :
    visibilityIntensity 0 alpha phi = 1 / 2 := by
  simp [visibilityIntensity]

#print axioms zero_reference_even
#print axioms unit_visibility_recovers_ideal
#print axioms opposite_phase_difference
#print axioms zero_contrast_is_uninformative

end HsHVerification.AlberrPolarimeterContrastGate
