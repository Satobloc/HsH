import HsHVerification.MercerHelionCODATA
import Mathlib

/-!
Source-conditional precision/readout gate, same real measured 3He system.
Three-decimal nearest-rounding bin is a CONDITIONAL interpretation
of the archive's 'approximately -2.127' notation. No archive author
explicitly supplied a prediction uncertainty or rounding policy.
A free nucleus, a one-electron 3He+ ion and neutral gas have different
magnetic shielding operators. Neither Lean nor these decimals supplies
an H(s)H 4D current-to-NMR observable map.
-/
namespace HsHVerification.MercerHelionReadoutGate
open HsHVerification.MercerHelionCODATA

def binLower : ℚ := legacyApprox - 1 / 2000
def binUpper : ℚ := legacyApprox + 1 / 2000

theorem nearest_thousandth_bin :
    binLower = -(21275 : ℚ) / 10000 ∧
    binUpper = -(21265 : ℚ) / 10000 := by
  constructor <;> norm_num [binLower, binUpper, legacyApprox]

theorem free_exits_legacy_bin :
    freeHelion < binLower := by
  norm_num [freeHelion, binLower, legacyApprox]

theorem shielded_enters_legacy_bin :
    binLower < shieldedHelion ∧ shieldedHelion < binUpper := by
  constructor <;> norm_num [shieldedHelion, binLower, binUpper, legacyApprox]

theorem readout_state_changes_rounded_agreement :
    freeHelion < binLower ∧
    binLower < shieldedHelion ∧
    shieldedHelion < binUpper := by
  exact ⟨free_exits_legacy_bin,
    shielded_enters_legacy_bin.1,
    shielded_enters_legacy_bin.2⟩

theorem shift_is_smaller_than_free_residual :
    shieldedHelion - freeHelion < legacyApprox - freeHelion := by
  norm_num [shieldedHelion, freeHelion, legacyApprox]

theorem measured_uncertainty_smaller_than_screening_shift :
    codataStdUncertainty < shieldedHelion - freeHelion := by
  norm_num [codataStdUncertainty, shieldedHelion, freeHelion]

#print axioms nearest_thousandth_bin
#print axioms free_exits_legacy_bin
#print axioms shielded_enters_legacy_bin
#print axioms readout_state_changes_rounded_agreement
#print axioms shift_is_smaller_than_free_residual
#print axioms measured_uncertainty_smaller_than_screening_shift

end HsHVerification.MercerHelionReadoutGate
