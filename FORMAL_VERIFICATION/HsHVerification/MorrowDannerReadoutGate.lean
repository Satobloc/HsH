import HsHVerification.MorrowDannerArmPhase
import Mathlib

/-!
# Conditional two-path cosine readout
For the actual Danner et al. neutron interferometer, the idealized cosine
interference readout below deliberately omits count-rate backgrounds, contrast,
polarization losses and instrument phase-shifter calibration.
A phase-sign convention requires specifying both arm labels and chi orientation.
These are mathematical conditional statements, not empirical fits.
-/

namespace HsHVerification.MorrowDannerReadoutGate

open HsHVerification.MorrowDannerArmPhase

noncomputable def cosineReadout (chi phaseI phaseII : ℝ) : ℝ :=
  Real.cos (chi + relativePhase phaseI phaseII)

theorem zero_shifter_readout_arm_swap (phaseI phaseII : ℝ) :
    cosineReadout 0 phaseI phaseII = cosineReadout 0 phaseII phaseI := by
  unfold cosineReadout relativePhase
  have h : (0 : ℝ) + (phaseII - phaseI) =
      -((0 : ℝ) + (phaseI - phaseII)) := by ring
  rw [h, Real.cos_neg]

theorem joint_shifter_and_arm_reversal (chi phaseI phaseII : ℝ) :
    cosineReadout (-chi) phaseII phaseI = cosineReadout chi phaseI phaseII := by
  unfold cosineReadout relativePhase
  have h : -chi + (phaseII - phaseI) = -(chi + (phaseI - phaseII)) := by ring
  rw [h, Real.cos_neg]

theorem squared_relative_phase_arm_swap (phaseI phaseII : ℝ) :
    (relativePhase phaseI phaseII)^2 =
    (relativePhase phaseII phaseI)^2 := by
  unfold relativePhase
  ring

#print axioms zero_shifter_readout_arm_swap
#print axioms joint_shifter_and_arm_reversal
#print axioms squared_relative_phase_arm_swap

end HsHVerification.MorrowDannerReadoutGate
