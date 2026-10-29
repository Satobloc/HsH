import Mathlib

/-!
Source-conditional numerical audit, NOT a new physical model.
NBS Technical Note 641 (Roder, Childs, McCarty, Angerhofer, 1973),
printed page 14, equation for saturated solid deuterium:
  rho [g/cm^3] = 0.20459 - 0.000026337 * T[K]^2.
Tang et al., Nature Communications 14:2941 (2023), 1.65 K helium-II
vortex-ring experiment. This NBS fit is an independent historical
cryogenic reference, not CODATA 2022 and not an experimental
measurement of Tang's specific tracer particles.
The statements below are exact arithmetic about printed coefficients.
-/
namespace HsHVerification

def tangBathTemperatureK : ℚ := 165 / 100

def nbsD2DensityBase : ℚ := 20459 / 100000

def nbsD2DensityQuadratic : ℚ := 26337 / 1000000000

def nbsD2DensityAtTangTemperature : ℚ :=
  nbsD2DensityBase - nbsD2DensityQuadratic * tangBathTemperatureK ^ 2

theorem nbs_d2_density_polynomial_at_tang_temperature :
    nbsD2DensityAtTangTemperature = (2045182975175 : ℚ) / 10000000000000 := by
  norm_num [nbsD2DensityAtTangTemperature, nbsD2DensityBase,
    nbsD2DensityQuadratic, tangBathTemperatureK]

theorem nbs_d2_density_positive : 0 < nbsD2DensityAtTangTemperature := by
  norm_num [nbsD2DensityAtTangTemperature, nbsD2DensityBase,
    nbsD2DensityQuadratic, tangBathTemperatureK]

theorem nbs_d2_density_in_historical_solid_range :
    (20 : ℚ) / 100 < nbsD2DensityAtTangTemperature ∧
    nbsD2DensityAtTangTemperature < (21 : ℚ) / 100 := by
  norm_num [nbsD2DensityAtTangTemperature, nbsD2DensityBase,
    nbsD2DensityQuadratic, tangBathTemperatureK]

#print axioms nbs_d2_density_polynomial_at_tang_temperature
#print axioms nbs_d2_density_positive
#print axioms nbs_d2_density_in_historical_solid_range

end HsHVerification
