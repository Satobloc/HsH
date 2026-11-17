import Mathlib

/-!
# Inertial-wave phase-normal versus group-transport typing

Primary source: O. C. Jackson and P. J. Thomas, "An experimental study
investigating the inertial-wave field accompanying vortex rings translating
through a rotating fluid", Journal of Fluid Mechanics 1029 (2026), A47,
DOI 10.1017/jfm.2026.11199.

The paper defines theta in its dispersion relation as the angle between the
rotation axis and the wavevector. Its experimental angle estimator uses the
first-zero vertical and horizontal spatial-correlation distances:
theta = arctan(Dv / Dh). The same paper distinguishes phase velocity from
group velocity and identifies group velocity as the direction of energy
transfer.

This module makes the measurement output and the group-transport vector
different types. It formalizes only the algebraic orthogonality of the
gradient numerator associated with the standard inviscid inertial-wave
dispersion relation. The common scalar factor 2*Omega/|k|^3 is omitted.

It does NOT prove that the source's correlation estimator recovers the
physical wavevector in the experiment, derive the gradient by calculus,
formalize PIV acquisition/filtering, validate the experiment, establish an
H(s)H map, or provide a physical prediction. Those require separate source,
calibration, acquisition, and model premises.
-/

namespace HsHVerification.InertialWavePhaseGroupDirection

/-- Meridional wavevector direction: radial and axial components. -/
structure WavevectorDirection where
  radial : ℝ
  axial : ℝ

/-- Group-velocity / energy-transport direction, kept type-distinct. -/
structure GroupVelocityDirection where
  radial : ℝ
  axial : ℝ

/-- Positive first-zero correlation distances reported by the source method. -/
structure CorrelationDistances where
  vertical : ℝ
  horizontal : ℝ
  vertical_pos : 0 < vertical
  horizontal_pos : 0 < horizontal

/-- The angle read from the correlation-distance ratio is a wavevector angle. -/
structure WavevectorAngleReadout where
  radians : ℝ

/-- Source-reported correlation readout, typed as a wavevector angle. -/
noncomputable def correlationWavevectorAngle
    (d : CorrelationDistances) : WavevectorAngleReadout :=
  ⟨Real.arctan (d.vertical / d.horizontal)⟩

/--
Gradient numerator for the positive/negative inertial-wave branch.

For omega = branch * 2*Omega*k_axial / sqrt(k_radial^2 + k_axial^2),
the meridional gradient is the displayed pair multiplied by the common
factor 2*Omega/(k_radial^2 + k_axial^2)^(3/2).
-/
def groupVelocityGradientNumerator
    (branch : ℝ) (k : WavevectorDirection) : GroupVelocityDirection :=
  { radial := -branch * k.radial * k.axial
    axial := branch * k.radial ^ 2 }

/-- The wavevector is orthogonal to the supplied group-velocity gradient numerator. -/
theorem wavevector_orthogonal_to_group_velocity
    (branch : ℝ) (k : WavevectorDirection) :
    k.radial * (groupVelocityGradientNumerator branch k).radial
      + k.axial * (groupVelocityGradientNumerator branch k).axial = 0 := by
  dsimp [groupVelocityGradientNumerator]
  ring

#print axioms wavevector_orthogonal_to_group_velocity

end HsHVerification.InertialWavePhaseGroupDirection
