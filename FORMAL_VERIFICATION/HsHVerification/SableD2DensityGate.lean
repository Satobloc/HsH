import Mathlib

/-!
Sable source-fidelity unit gate, 2026-10-28.
2023 Tang et al. Nat Commun 14:2941 prints 202.8 g/cm^3.
2025 Stasiak et al. PNAS 122:e2426064122 prints 202.8 kg/m^3.
Both cite Xu and Van Sciver (2008), not yet inspected in full.
These theorems establish only exact unit arithmetic, not which historical
physical measurement is correct or what code either study executed.
-/

namespace HsHVerification.SableD2DensityGate

def tangPrintedKgM3 : ℚ :=
  (2028 / 10 : ℚ) * (1 / 1000) / (1 / 1000000)

def stasiakPrintedKgM3 : ℚ := (2028 / 10 : ℚ)

theorem printed_density_ratio :
    tangPrintedKgM3 = 1000 * stasiakPrintedKgM3 := by
  norm_num [tangPrintedKgM3, stasiakPrintedKgM3]

theorem stasiak_to_g_cm3 :
    stasiakPrintedKgM3 / 1000 = (2028 / 10000 : ℚ) := by
  norm_num [stasiakPrintedKgM3]

theorem printed_values_not_equal :
    tangPrintedKgM3 ≠ stasiakPrintedKgM3 := by
  norm_num [tangPrintedKgM3, stasiakPrintedKgM3]

end HsHVerification.SableD2DensityGate
