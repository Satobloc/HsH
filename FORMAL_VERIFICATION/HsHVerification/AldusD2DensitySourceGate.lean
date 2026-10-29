import Mathlib

/-!
Aldus 2026-10-29: source-conditional density-unit provenance gate.
REAL SYSTEM: Tang et al. 2023, helium-II D2 tracers at 1.65 K,
DOI 10.1038/s41467-023-38787-w (published text 202.8 g/cm^3).
LATER PUBLICATION: Stasiak et al. 2025, 202.8 kg/m^3.
The 2008 cited Xu/Van Sciver full text and actual simulation inputs
have NOT been recovered. rhoHeApprox is only a ~145 kg/m^3
literature-scale estimate, NOT a measured run-specific value.
All claims are exact rational arithmetic on labeled nominal inputs,
NOT empirical validation or a correction to authors' calculations.
-/

namespace HsHVerification.AldusD2DensitySourceGate

def rhoD2LaterKgM3 : ℚ := 1014 / 5
def rhoD2LiteralKgM3 : ℚ := 202800
def rhoHeApproxKgM3 : ℚ := 145
def contrastLater : ℚ := rhoD2LaterKgM3 - rhoHeApproxKgM3
def contrastLiteral : ℚ := rhoD2LiteralKgM3 - rhoHeApproxKgM3

theorem printed_density_unit_factor :
    rhoD2LiteralKgM3 = 1000 * rhoD2LaterKgM3 := by
  norm_num [rhoD2LiteralKgM3, rhoD2LaterKgM3]

theorem source_conditional_contrasts :
    contrastLater = 289 / 5 ∧ contrastLiteral = 202655 := by
  norm_num [contrastLater, contrastLiteral, rhoD2LaterKgM3,
    rhoD2LiteralKgM3, rhoHeApproxKgM3]

theorem positive_density_contrasts :
    0 < contrastLater ∧ 0 < contrastLiteral := by
  norm_num [contrastLater, contrastLiteral, rhoD2LaterKgM3,
    rhoD2LiteralKgM3, rhoHeApproxKgM3]

#print axioms printed_density_unit_factor
#print axioms source_conditional_contrasts
#print axioms positive_density_contrasts

end HsHVerification.AldusD2DensitySourceGate
