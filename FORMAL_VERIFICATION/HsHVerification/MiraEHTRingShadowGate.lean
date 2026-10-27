import Mathlib

/-!
Mira | EHT Sgr A* ring-versus-shadow measurement-role gate, 2026-10-27.

Actual measured system: Sgr A*, 2017 Event Horizon Telescope observations
and independent stellar-orbit angular gravitational-radius estimates.
Original published source: Event Horizon Telescope Collaboration (2022),
"First Sagittarius A* EHT Results. I", ApJL 930 L12, Table 1,
DOI 10.3847/2041-8213/ac6674.
Method/forward calibration: EHT Paper IV (L15), DOI 10.3847/2041-8213/ac6736;
Paper VI (L17), DOI 10.3847/2041-8213/ac6756.

Published 68% emission-ring diameter: 51.8 +/- 2.3 microarcseconds.
Separately inferred, simulation-calibrated shadow diameter: 48.7 +/- 7.0.
Orbital theta_g priors: VLTI 5.125, Keck 4.92 microarcseconds.
All rationals below encode those *published point values*, not toy fixtures.
They are mathematical statements about source-reported central estimates.
They do not formalize the calibration simulation, full posterior,
uncertainty correlation, an H(s)H forward law, or physical correctness.
-/

namespace HsHVerification.MiraEHTRingShadowGate

def ringDiameter : ℚ := 518 / 10
def calibratedShadowDiameter : ℚ := 487 / 10
def vltiTheta : ℚ := 5125 / 1000
def keckTheta : ℚ := 492 / 100

/-- The published fitted emission-ring diameter and the calibrated
    geometric shadow diameter are distinct positive point estimates. -/
theorem shadow_smaller_than_ring :
    calibratedShadowDiameter < ringDiameter := by
  norm_num [calibratedShadowDiameter, ringDiameter]

/-- The ring-to-calibrated-shadow diameter ratio is independent of
    which positive stellar-orbit angular prior is used. -/
theorem source_calibration_ratio :
    ringDiameter / calibratedShadowDiameter = (518 : ℚ) / 487 := by
  norm_num [ringDiameter, calibratedShadowDiameter]

/-- Substituting the ring for the shadow changes the VLTI-scaled
    diameter by exactly 124/205 in these published central values. -/
theorem vlti_scaled_difference :
    ringDiameter / vltiTheta -
    calibratedShadowDiameter / vltiTheta = (124 : ℚ) / 205 := by
  norm_num [ringDiameter, calibratedShadowDiameter, vltiTheta]

/-- The corresponding Keck-scaled difference is 155/246. -/
theorem keck_scaled_difference :
    ringDiameter / keckTheta -
    calibratedShadowDiameter / keckTheta = (155 : ℚ) / 246 := by
  norm_num [ringDiameter, calibratedShadowDiameter, keckTheta]

/-- Keck and VLTI are alternative orbital-prior readouts of the SAME
    ring observation, not two independent EHT diameter measurements. -/
theorem prior_choice_changes_ring_scale :
    ringDiameter / vltiTheta < ringDiameter / keckTheta := by
  norm_num [ringDiameter, vltiTheta, keckTheta]

/-- The sign of the ring/shadow substitution error is preserved for
    any positive physical angular-radius prior. -/
theorem ring_shadow_substitution_direction (theta : ℝ)
    (h : 0 < theta) :
    ((487 : ℝ) / 10) / theta < ((518 : ℝ) / 10) / theta := by
  apply div_lt_div_of_pos_right (by norm_num) h

#print axioms shadow_smaller_than_ring
#print axioms source_calibration_ratio
#print axioms vlti_scaled_difference
#print axioms keck_scaled_difference
#print axioms prior_choice_changes_ring_scale
#print axioms ring_shadow_substitution_direction

end HsHVerification.MiraEHTRingShadowGate
