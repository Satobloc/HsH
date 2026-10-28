import Mathlib

/-!
# Measured 2015 neutron-polarimeter signed-phase gate

Primary source: Demirel, Sponar and Hasegawa, New J. Phys. 17 (2015) 023065,
DOI 10.1088/1367-2630/17/2/023065, equations (8), (9) and (10).
Real experiment: TRIGA MARK II neutron polarimeter, incident wavelength
approximately 2.02 Angstrom; 12 rotation frequencies (0..9, 2.5, 7.5 kHz).
This module proves only mathematical consequences of the ideal readout
model. It does not prove the source translation, phase calibration, a
worldtube twist, or any physical H(s)H claim.
-/

namespace HsHVerification.AlberrPolarimeterPhaseGate

noncomputable def polarizationY (alpha phi : ℝ) : ℝ :=
  -Real.sin (alpha + phi)

noncomputable def polarizationZ (alpha phi : ℝ) : ℝ :=
  Real.cos (alpha + phi)

noncomputable def idealIntensity (alpha phi : ℝ) : ℝ :=
  (1 + Real.cos (alpha + phi)) / 2

theorem y_odd_at_zero (phi : ℝ) :
    polarizationY 0 (-phi) = -polarizationY 0 phi := by
  simp [polarizationY]

theorem z_even_at_zero (phi : ℝ) :
    polarizationZ 0 (-phi) = polarizationZ 0 phi := by
  simp [polarizationZ]

theorem ideal_intensity_even_at_zero (phi : ℝ) :
    idealIntensity 0 (-phi) = idealIntensity 0 phi := by
  simp [idealIntensity]

theorem ideal_intensity_is_z_projection (alpha phi : ℝ) :
    idealIntensity alpha phi = (1 + polarizationZ alpha phi) / 2 := by
  rfl

#print axioms y_odd_at_zero
#print axioms z_even_at_zero
#print axioms ideal_intensity_even_at_zero
#print axioms ideal_intensity_is_z_projection

end HsHVerification.AlberrPolarimeterPhaseGate
