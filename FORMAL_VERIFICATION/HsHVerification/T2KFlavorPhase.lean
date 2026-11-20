import Mathlib

/-!
# T2K atmospheric phase scale: source-bound arithmetic

Inputs are the published T2K characteristic baseline (295 km), beam peak
(0.6 GeV), and normal-ordering best-fit Delta m^2_32 (2.506e-3 eV^2).
The conventional PDG vacuum phase is 1.267 * Delta m^2(eV^2) * L(km)/E(GeV).

This module checks only the rational arithmetic for those rounded reported
inputs. It does not formalize the full three-flavor matter-affected fit,
validate the source translation, or identify this propagation phase with an
H(s)H geometric relative tilt.
-/

namespace HsHVerification.T2KFlavorPhase

def t2kBaselineKm : ℚ := 295
def t2kPeakEnergyGeV : ℚ := (3 : ℚ) / 5
def t2kDeltaM32SquaredEV2 : ℚ := (2506 : ℚ) / 1000000
def roundedPhaseFactor : ℚ := (1267 : ℚ) / 1000

/-- Characteristic baseline-to-peak-energy ratio, in km/GeV. -/
def t2kLEKmPerGeV : ℚ := t2kBaselineKm / t2kPeakEnergyGeV

/-- Conventional dominant vacuum atmospheric phase, using rounded source inputs. -/
def t2kDominantVacuumPhase : ℚ :=
  roundedPhaseFactor * t2kDeltaM32SquaredEV2 * t2kLEKmPerGeV

theorem t2kLE_exact :
    t2kLEKmPerGeV = (1475 : ℚ) / 3 := by
  norm_num [t2kLEKmPerGeV, t2kBaselineKm, t2kPeakEnergyGeV]

theorem t2k_phase_exact :
    t2kDominantVacuumPhase = (93665509 : ℚ) / 60000000 := by
  norm_num [t2kDominantVacuumPhase, roundedPhaseFactor,
    t2kDeltaM32SquaredEV2, t2kLEKmPerGeV, t2kBaselineKm,
    t2kPeakEnergyGeV]

theorem t2k_phase_between_156_157 :
    (156 : ℚ) / 100 < t2kDominantVacuumPhase ∧
    t2kDominantVacuumPhase < (157 : ℚ) / 100 := by
  constructor <;>
    norm_num [t2kDominantVacuumPhase, roundedPhaseFactor,
      t2kDeltaM32SquaredEV2, t2kLEKmPerGeV, t2kBaselineKm,
      t2kPeakEnergyGeV]

#eval t2kLEKmPerGeV
#eval t2kDominantVacuumPhase

#print axioms t2kLE_exact
#print axioms t2k_phase_exact
#print axioms t2k_phase_between_156_157


/-- Lower endpoint of the reported asymmetric Delta m^2_32 interval. -/
def t2kDeltaM32LowerEV2 : ℚ := (2454 : ℚ) / 1000000

/-- Upper endpoint of the reported asymmetric Delta m^2_32 interval. -/
def t2kDeltaM32UpperEV2 : ℚ := (2545 : ℚ) / 1000000

/-- Phase bounds from Delta m^2 uncertainty alone, holding L and E fixed. -/
def t2kPhaseLower : ℚ :=
  roundedPhaseFactor * t2kDeltaM32LowerEV2 * t2kLEKmPerGeV

def t2kPhaseUpper : ℚ :=
  roundedPhaseFactor * t2kDeltaM32UpperEV2 * t2kLEKmPerGeV

theorem t2k_phase_lower_exact :
    t2kPhaseLower = (30573977 : ℚ) / 20000000 := by
  norm_num [t2kPhaseLower, roundedPhaseFactor, t2kDeltaM32LowerEV2,
    t2kLEKmPerGeV, t2kBaselineKm, t2kPeakEnergyGeV]

theorem t2k_phase_upper_exact :
    t2kPhaseUpper = (38049277 : ℚ) / 24000000 := by
  norm_num [t2kPhaseUpper, roundedPhaseFactor, t2kDeltaM32UpperEV2,
    t2kLEKmPerGeV, t2kBaselineKm, t2kPeakEnergyGeV]

theorem t2k_phase_parameter_only_bounds :
    (1528 : ℚ) / 1000 < t2kPhaseLower ∧
    t2kPhaseLower < (1529 : ℚ) / 1000 ∧
    (1585 : ℚ) / 1000 < t2kPhaseUpper ∧
    t2kPhaseUpper < (1586 : ℚ) / 1000 := by
  norm_num [t2kPhaseLower, t2kPhaseUpper, roundedPhaseFactor,
    t2kDeltaM32LowerEV2, t2kDeltaM32UpperEV2, t2kLEKmPerGeV,
    t2kBaselineKm, t2kPeakEnergyGeV]

#eval t2kPhaseLower
#eval t2kPhaseUpper

#print axioms t2k_phase_lower_exact
#print axioms t2k_phase_upper_exact
#print axioms t2k_phase_parameter_only_bounds

end HsHVerification.T2KFlavorPhase
