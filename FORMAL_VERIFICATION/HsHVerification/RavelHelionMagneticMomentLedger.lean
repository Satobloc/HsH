import HsHVerification.RavelHelionRadiusLedger
import Mathlib

/-!
Ravel measured-input extension, 2026-10-31.

Primary physical inputs:
* Schneider et al., Nature 606 (2022), DOI 10.1038/s41586-022-04761-7.
  The directly measured quantity is the bound-ion factor
  g'_I = -4.2550996069(30)_stat(17)_sys. The bare-nucleus factor
  g_I = -4.2552506997(30)_stat(17)_sys(1)_theo is derived using the
  calculated diamagnetic shielding sigma = 0.00003550738(3).
* CREMA Collaboration, Science 388 (2025), DOI 10.1126/science.adj2610.
  r_h = 1.97007(94) fm is extracted from three measured muonic-ion
  transitions by comparison with atomic/nuclear theory. It is not a
  direct worldtube-envelope measurement.

The historical SAT value -2.127 mu_N has no quoted uncertainty or
declared rounding convention. The interval theorems below show that
the measured central value is outside nearest-rounding-to-0.001 for
-2.127, but inside truncation-toward-zero at that precision. This is
not a significance test and not an independent-prediction score.

The uncertainty variance theorem is conditional on treating the three
published components as independent for quadrature. No covariance was
supplied here; components remain separately named. All statements are
exact rational arithmetic over rounded published inputs, not a physical
current derivation or validation of H(s)H.
-/

namespace HsHVerification.RavelHelionMagneticMoment

def boundIonG : ℚ := -42550996069 / 10000000000
def shielding : ℚ := 3550738 / 100000000000
def reportedBareG : ℚ := -42552506997 / 10000000000
def reconstructedBareG : ℚ := boundIonG / (1 - shielding)

def nuclearSpin : ℚ := 1 / 2
def magneticMomentMuN : ℚ := nuclearSpin * reportedBareG

def statSigmaMuN : ℚ := 15 / 10000000000
def sysSigmaMuN : ℚ := 85 / 100000000000
def shieldingTheorySigmaMuN : ℚ := 5 / 100000000000
def quadratureVarianceMuN : ℚ :=
  statSigmaMuN ^ 2 + sysSigmaMuN ^ 2 + shieldingTheorySigmaMuN ^ 2

def historicalSATApproxMuN : ℚ := -2127 / 1000
def residualMuN : ℚ := historicalSATApproxMuN - magneticMomentMuN
def relativeResidualPercent : ℚ :=
  residualMuN / (-magneticMomentMuN) * 100

def nearestRoundingLower : ℚ := -21275 / 10000
def nearestRoundingUpper : ℚ := -21265 / 10000
def truncationLower : ℚ := -2128 / 1000
def truncationUpper : ℚ := -2127 / 1000

def helionRadiusSquaredFm2 : ℚ :=
  HsHVerification.RavelHelionRadius.helionFm ^ 2
def helionRadiusSquaredLinearSigmaFm2 : ℚ :=
  2 * HsHVerification.RavelHelionRadius.helionFm *
    HsHVerification.RavelHelionRadius.helionSigmaFm

theorem shielding_reconstruction_matches_reported_bare_g_within_5e_12 :
    |reconstructedBareG - reportedBareG| < (1 : ℚ) / 200000000000 := by
  norm_num [reconstructedBareG, boundIonG, shielding, reportedBareG]

theorem magnetic_moment_from_spin_half :
    magneticMomentMuN = -42552506997 / 20000000000 := by
  norm_num [magneticMomentMuN, nuclearSpin, reportedBareG]

theorem reported_component_quadrature_variance :
    quadratureVarianceMuN = (2975 : ℚ) / 10^21 := by
  norm_num [quadratureVarianceMuN, statSigmaMuN, sysSigmaMuN,
    shieldingTheorySigmaMuN]

theorem historical_central_residual :
    residualMuN = (62534985 : ℚ) / 100000000000 := by
  norm_num [residualMuN, historicalSATApproxMuN,
    magneticMomentMuN, nuclearSpin, reportedBareG]

theorem historical_relative_residual_percent_bounds :
    (2939 : ℚ) / 100000 < relativeResidualPercent ∧
    relativeResidualPercent < (2940 : ℚ) / 100000 := by
  norm_num [relativeResidualPercent, residualMuN,
    historicalSATApproxMuN, magneticMomentMuN, nuclearSpin, reportedBareG]

theorem measured_value_outside_nearest_rounding_interval :
    magneticMomentMuN < nearestRoundingLower := by
  norm_num [magneticMomentMuN, nuclearSpin, reportedBareG,
    nearestRoundingLower]

theorem measured_value_inside_truncation_interval :
    truncationLower < magneticMomentMuN ∧
    magneticMomentMuN < truncationUpper := by
  norm_num [magneticMomentMuN, nuclearSpin, reportedBareG,
    truncationLower, truncationUpper]

theorem extracted_charge_radius_squared :
    helionRadiusSquaredFm2 =
      (38811758049 : ℚ) / 10000000000 := by
  norm_num [helionRadiusSquaredFm2,
    HsHVerification.RavelHelionRadius.helionFm]

theorem first_order_charge_radius_squared_uncertainty :
    helionRadiusSquaredLinearSigmaFm2 =
      (37037316 : ℚ) / 10000000000 := by
  norm_num [helionRadiusSquaredLinearSigmaFm2,
    HsHVerification.RavelHelionRadius.helionFm,
    HsHVerification.RavelHelionRadius.helionSigmaFm]

#print axioms HsHVerification.RavelHelionMagneticMoment.shielding_reconstruction_matches_reported_bare_g_within_5e_12
#print axioms HsHVerification.RavelHelionMagneticMoment.magnetic_moment_from_spin_half
#print axioms HsHVerification.RavelHelionMagneticMoment.reported_component_quadrature_variance
#print axioms HsHVerification.RavelHelionMagneticMoment.historical_central_residual
#print axioms HsHVerification.RavelHelionMagneticMoment.historical_relative_residual_percent_bounds
#print axioms HsHVerification.RavelHelionMagneticMoment.measured_value_outside_nearest_rounding_interval
#print axioms HsHVerification.RavelHelionMagneticMoment.measured_value_inside_truncation_interval
#print axioms HsHVerification.RavelHelionMagneticMoment.extracted_charge_radius_squared
#print axioms HsHVerification.RavelHelionMagneticMoment.first_order_charge_radius_squared_uncertainty

end HsHVerification.RavelHelionMagneticMoment
