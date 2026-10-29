import Mathlib

/-!
Nadir Voss | neutron signed-charge second moment | 2026-10-29.
Real physical sources:
* Particle Data Group, Review of Particle Physics 2025 baryon summary,
  neutron mean-square electric charge radius = -0.1155 ± 0.0017 fm².
  This is a PDG evaluation, NOT a CODATA recommendation.
* Heacock et al., 2021 neutron-silicon Pendellösung interferometry,
  neutron mean-square electric charge radius = -0.1101 ± 0.0089 fm².
  This is an independently measured, theory-assisted extraction,
  not an independently observed hard-core diameter.
The exact rationals encode PRINTED central values and 1σ uncertainties.
No covariance is established. Formal statements below are conditional
arithmetic, not physical H(s)H predictions or a 4D readout operator.
-/

namespace HsHVerification.NadirNeutronChargeData

def pdgMeanSqFm2 : ℚ := -(1155 / 10000)
def pdgSigmaFm2 : ℚ := 17 / 10000
def heacockMeanSqFm2 : ℚ := -(1101 / 10000)
def heacockSigmaFm2 : ℚ := 89 / 10000

theorem pdg_one_sigma_upper_negative :
    pdgMeanSqFm2 + pdgSigmaFm2 < 0 := by
  norm_num [pdgMeanSqFm2, pdgSigmaFm2]

theorem heacock_one_sigma_upper_negative :
    heacockMeanSqFm2 + heacockSigmaFm2 < 0 := by
  norm_num [heacockMeanSqFm2, heacockSigmaFm2]

theorem printed_central_difference :
    heacockMeanSqFm2 - pdgMeanSqFm2 = 27 / 5000 := by
  norm_num [heacockMeanSqFm2, pdgMeanSqFm2]

theorem printed_uncorrelated_variance_sum :
    pdgSigmaFm2 ^ 2 + heacockSigmaFm2 ^ 2 =
      (821 : ℚ) / 10000000 := by
  norm_num [pdgSigmaFm2, heacockSigmaFm2]

theorem printed_one_sigma_intervals_overlap :
    heacockMeanSqFm2 - heacockSigmaFm2 ≤ pdgMeanSqFm2 + pdgSigmaFm2 ∧
    pdgMeanSqFm2 - pdgSigmaFm2 ≤ heacockMeanSqFm2 + heacockSigmaFm2 := by
  norm_num [heacockMeanSqFm2, heacockSigmaFm2, pdgMeanSqFm2, pdgSigmaFm2]

#print axioms pdg_one_sigma_upper_negative
#print axioms heacock_one_sigma_upper_negative
#print axioms printed_central_difference
#print axioms printed_uncorrelated_variance_sum
#print axioms printed_one_sigma_intervals_overlap

end HsHVerification.NadirNeutronChargeData
