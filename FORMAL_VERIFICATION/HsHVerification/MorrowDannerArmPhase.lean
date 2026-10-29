import Mathlib

/-!
# Danner et al. (2020): two-path phase bookkeeping
Actual measured system: ILL S18 neutron interferometer, neutron wavelength 1.9 Angstrom,
rotating-field scan 0-20 kHz, reported guide field 9 G, nominal polarization ~0.99.
Primary: arXiv:1904.07085v1, main pp. 2-3 vs supplement pp. 4-5;
journal DOI 10.1038/s41534-020-0254-8.
Source labels: preprint main calls the RFG arm II, supplement/journal call it I.
The following theorems describe declared path labels only. They do NOT determine
physical apparatus sign, phase-shifter orientation, measured phase, or H(s)H physics.
-/

namespace HsHVerification.MorrowDannerArmPhase

def relativePhase (phaseI phaseII : ℝ) : ℝ := phaseI - phaseII

theorem swap_arms_reverses_relative_phase (phaseI phaseII : ℝ) :
    relativePhase phaseII phaseI = -relativePhase phaseI phaseII := by
  unfold relativePhase
  ring

theorem arm_I_phase_increment (reference increment : ℝ) :
    relativePhase (reference + increment) reference = increment := by
  unfold relativePhase
  ring

theorem arm_II_phase_increment (reference increment : ℝ) :
    relativePhase reference (reference + increment) = -increment := by
  unfold relativePhase
  ring

noncomputable def mashhoonPhase (omega transitTime : ℝ) : ℝ := omega * transitTime / 2

theorem reverse_rotation_reverses_phase (omega transitTime : ℝ) :
    mashhoonPhase (-omega) transitTime = -mashhoonPhase omega transitTime := by
  unfold mashhoonPhase
  ring

theorem opposite_arms_opposite_signed_phase (reference omega transitTime : ℝ) :
    relativePhase reference (reference + mashhoonPhase omega transitTime) =
    -relativePhase (reference + mashhoonPhase omega transitTime) reference := by
  unfold relativePhase
  ring

#print axioms swap_arms_reverses_relative_phase
#print axioms arm_I_phase_increment
#print axioms arm_II_phase_increment
#print axioms reverse_rotation_reverses_phase
#print axioms opposite_arms_opposite_signed_phase

end HsHVerification.MorrowDannerArmPhase
