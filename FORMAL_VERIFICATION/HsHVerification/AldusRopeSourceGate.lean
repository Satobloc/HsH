import Mathlib

/-!
Aldus 2026-10-28: REAL manufacturer-published dynamic-rope specifications,
retrieved 2026-10-28 (not raw laboratory observations).
Petzl MAMBO 10.1 mm, product R32A:
https://www.petzl.com/US/en/Professional/Ropes/MAMBO-10-1-mm
Petzl VOLTA 9.2 mm, SINGLE-rope mode, product R35A:
https://www.petzl.com/US/en/Sport/Ropes/VOLTA-9-2-mm
The compared impact forces (8.5 and 8.6 kN) refer to EN892/UIAA single
rope testing with 80 kg mass and nominal fall factor 1.77. The published
product specifications do not report measurement uncertainties, test dates,
laboratory force-time traces, calibration covariance, or torsional response.
All rational equalities here encode NOMINAL PRINTED NUMBERS only.
No physical H(s)H constitutive law or experimental significance is proved.
-/

namespace HsHVerification.AldusRopeSourceGate

def mamboDiameterMM : ℚ := 101 / 10
def voltaDiameterMM : ℚ := 92 / 10
def mamboImpactKN : ℚ := 85 / 10
def voltaImpactKN : ℚ := 86 / 10
def mamboLinearMassGM : ℚ := 65
def voltaLinearMassGM : ℚ := 55

theorem source_diameter_order :
    voltaDiameterMM < mamboDiameterMM := by
  norm_num [voltaDiameterMM, mamboDiameterMM]

theorem source_impact_order :
    mamboImpactKN < voltaImpactKN := by
  norm_num [mamboImpactKN, voltaImpactKN]

theorem source_mass_order :
    voltaLinearMassGM < mamboLinearMassGM := by
  norm_num [voltaLinearMassGM, mamboLinearMassGM]

theorem nominal_area_proxy_ratio_window :
    (1205 : ℚ) / 1000 <
      mamboDiameterMM ^ 2 / voltaDiameterMM ^ 2 ∧
      mamboDiameterMM ^ 2 / voltaDiameterMM ^ 2 <
        (1206 : ℚ) / 1000 := by
  norm_num [mamboDiameterMM, voltaDiameterMM]

theorem nominal_cross_product_mismatch :
    mamboImpactKN * voltaDiameterMM ^ 2 <
      voltaImpactKN * mamboDiameterMM ^ 2 := by
  norm_num [mamboImpactKN, voltaImpactKN, mamboDiameterMM, voltaDiameterMM]

#print axioms source_diameter_order
#print axioms source_impact_order
#print axioms source_mass_order
#print axioms nominal_area_proxy_ratio_window
#print axioms nominal_cross_product_mismatch

end HsHVerification.AldusRopeSourceGate
