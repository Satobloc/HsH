import Mathlib

/-!
Mercer :24, 2026-10-29 23:24 UTC. REAL SOURCE DATA / conditional mathematics.
NIST CODATA 2022, helion moment in nuclear magnetons:
  free -2.1276253498(17)
  shielded (3He gas, sphere, 25 C) -2.1274977624(17).
These are CORRELATED evaluated quantities, not independent trials.
Historical SAT archive 2026/SAT MATH — BACKBONE.txt, blob
1854995be3311f565739f2be64269cbb0385a82f,
reports approximate -2.127 mu_N without an independently defined
electromagnetic current readout operator. It is NOT measured data.
Formalization checks decimal arithmetic only.
-/
namespace HsHVerification.MercerHelionCODATA

def legacyApprox : ℚ := -(2127 : ℚ) / 1000
def freeHelion : ℚ := -(21276253498 : ℚ) / 10000000000
def shieldedHelion : ℚ := -(21274977624 : ℚ) / 10000000000
def codataStdUncertainty : ℚ := (17 : ℚ) / 10000000000

theorem legacy_free_residual :
    legacyApprox - freeHelion = (6253498 : ℚ) / 10000000000 := by
  norm_num [legacyApprox, freeHelion]

theorem legacy_shielded_residual :
    legacyApprox - shieldedHelion = (4977624 : ℚ) / 10000000000 := by
  norm_num [legacyApprox, shieldedHelion]

theorem electronic_screening_shift :
    shieldedHelion - freeHelion = (1275874 : ℚ) / 10000000000 := by
  norm_num [freeHelion, shieldedHelion]

theorem adjusted_order :
    freeHelion < shieldedHelion ∧ shieldedHelion < legacyApprox := by
  constructor <;> norm_num [freeHelion, shieldedHelion, legacyApprox]

theorem recorded_standard_uncertainty_positive :
    0 < codataStdUncertainty := by
  norm_num [codataStdUncertainty]

#print axioms legacy_free_residual
#print axioms legacy_shielded_residual
#print axioms electronic_screening_shift
#print axioms adjusted_order
#print axioms recorded_standard_uncertainty_positive

end HsHVerification.MercerHelionCODATA
