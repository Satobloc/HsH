import Mathlib

/-!
Aldus 2026-10-28: original UIAA SafeCom historical account, 2020-09-26:
https://www.theuiaa.org/uiaa-safecom-answers-your-questions-rope-testing/
The article describes a historical empirical correlation N * M^4 = K
with K rope-specific and explains five 55 kg half-rope test drops as an
equivalent standard to a single 80 kg fall. The quoted masses and fall
counts are REAL published standard-test settings, not fabricated fixtures.
The numerical equivalence is APPROXIMATE, not an exact algebraic identity:
5*55^4 / 80^4 = 73205/65536 ~ 1.1170. No claim is made that the
historical relation is universal, exact physics, or an H(s)H equation.
-/

namespace HsHVerification.AldusRopeStandardHistoryGate

def historicalSingleMassKG : ℕ := 80
def halfRopeMassKG : ℕ := 55
def historicalSingleFalls : ℕ := 1
def halfRopeFalls : ℕ := 5

theorem fourth_power_nominal_values :
    historicalSingleFalls * historicalSingleMassKG ^ 4 = 40960000 ∧
    halfRopeFalls * halfRopeMassKG ^ 4 = 45753125 := by
  norm_num [historicalSingleFalls, historicalSingleMassKG,
    halfRopeFalls, halfRopeMassKG]

theorem nominal_historical_exact_equivalence_fails :
    historicalSingleFalls * historicalSingleMassKG ^ 4 ≠
      halfRopeFalls * halfRopeMassKG ^ 4 := by
  norm_num [historicalSingleFalls, historicalSingleMassKG,
    halfRopeFalls, halfRopeMassKG]

theorem fourth_power_ratio_window :
    (111 : ℚ) / 100 <
      (5 : ℚ) * 55 ^ 4 / (80 ^ 4) ∧
      (5 : ℚ) * 55 ^ 4 / (80 ^ 4) < (112 : ℚ) / 100 := by
  norm_num

#print axioms fourth_power_nominal_values
#print axioms nominal_historical_exact_equivalence_fails
#print axioms fourth_power_ratio_window

end HsHVerification.AldusRopeStandardHistoryGate
