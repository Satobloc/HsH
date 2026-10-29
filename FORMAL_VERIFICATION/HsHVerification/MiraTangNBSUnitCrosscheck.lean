import HsHVerification.MiraNBSDensityEvaluation
import Mathlib

/-!
Source-conditional crosscheck of published units. Tang et al. (2023),
Nature Communications 14:2941, print solid D2 density 202.8 g/cm^3.
Stasiak et al. (2025), PNAS 122:e2426064122, print 202.8 kg/m^3,
which converts to 0.2028 g/cm^3. The historical NBS 1973 density
fit is an independent approximate comparator, not a direct tracer assay.
The 2023 paper's actual simulation input is not known; the error is
in the printed unit and no correction is silently applied to results.
-/
namespace HsHVerification

def tangPrintedD2DensityGPerCm3 : ℚ := 2028 / 10

def stasiakD2DensityGPerCm3 : ℚ := 2028 / 10000

theorem tang_printed_to_stasiak_density_factor :
    tangPrintedD2DensityGPerCm3 = 1000 * stasiakD2DensityGPerCm3 := by
  norm_num [tangPrintedD2DensityGPerCm3, stasiakD2DensityGPerCm3]

theorem stasiak_density_within_one_percent_of_nbs_fit :
    (99 : ℚ) / 100 * nbsD2DensityAtTangTemperature < stasiakD2DensityGPerCm3 ∧
    stasiakD2DensityGPerCm3 < (101 : ℚ) / 100 * nbsD2DensityAtTangTemperature := by
  norm_num [stasiakD2DensityGPerCm3, nbsD2DensityAtTangTemperature,
    nbsD2DensityBase, nbsD2DensityQuadratic, tangBathTemperatureK]

theorem tang_literal_density_over_900_times_nbs_fit :
    900 * nbsD2DensityAtTangTemperature < tangPrintedD2DensityGPerCm3 := by
  norm_num [tangPrintedD2DensityGPerCm3, nbsD2DensityAtTangTemperature,
    nbsD2DensityBase, nbsD2DensityQuadratic, tangBathTemperatureK]

theorem tang_literal_density_under_1000_times_nbs_fit :
    tangPrintedD2DensityGPerCm3 < 1000 * nbsD2DensityAtTangTemperature := by
  norm_num [tangPrintedD2DensityGPerCm3, nbsD2DensityAtTangTemperature,
    nbsD2DensityBase, nbsD2DensityQuadratic, tangBathTemperatureK]

#print axioms tang_printed_to_stasiak_density_factor
#print axioms stasiak_density_within_one_percent_of_nbs_fit
#print axioms tang_literal_density_over_900_times_nbs_fit
#print axioms tang_literal_density_under_1000_times_nbs_fit

end HsHVerification
