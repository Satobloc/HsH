import Mathlib

/-!
Mira 2026-10-28: Danner et al., J. Phys. Commun. 3 (2019) 035001,
DOI 10.1088/2399-6528/ab0805, equations (12), (15)-(17), pp. 9-11.
Real neutron beam nominal wavelength 1.7 Angstrom; displacement effective
length 40 plus-or-minus 1 mm; observed phase-difference slope 6.94(5) deg/kHz.
Neutron mass: CODATA 2022; Planck constant exact in SI.
Rational statements encode rounded source data and standard de Broglie
kinematics. They do not verify source translation, uncertainties, or H(s)H.
-/

namespace HsHVerification.MiraNeutronCalibrationGate

def measuredSlope : ℚ := 347 / 50

def predictedSlope : ℚ :=
  360 * ((167492750056 : ℚ) / 100000000000) * ((17 : ℚ) / 10) *
  ((4 : ℚ) / 100) / ((662607015 : ℚ) / 100000000)

theorem predicted_window :
    (6188 : ℚ) / 1000 < predictedSlope ∧
    predictedSlope < (6189 : ℚ) / 1000 := by
  norm_num [predictedSlope]

theorem observed_exceeds_forward : predictedSlope < measuredSlope := by
  norm_num [predictedSlope, measuredSlope]

theorem inferred_length_window :
    (44 : ℚ) / 1000 < ((4 : ℚ) / 100) * measuredSlope / predictedSlope ∧
    ((4 : ℚ) / 100) * measuredSlope / predictedSlope < (45 : ℚ) / 1000 := by
  norm_num [predictedSlope, measuredSlope]

#print axioms predicted_window
#print axioms observed_exceeds_forward
#print axioms inferred_length_window

end HsHVerification.MiraNeutronCalibrationGate
