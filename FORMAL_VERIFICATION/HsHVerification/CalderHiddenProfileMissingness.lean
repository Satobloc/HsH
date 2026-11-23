import Mathlib

/-!
# Calder: hidden-profile missing-outcome envelope

Source: Toxtli-Hernández and Delaflor, "Hidden Profile Decision Making in
Multi-Agent LLM Groups", CSCW Companion '26, DOI 10.1145/3785651.3831525.
The published hidden-profile table reports GPT-OSS asynchronous as 0/5,
while the design specifies 15 sessions per cell. The 10 unobserved cases
are derived as 15 - 5. The all-missing-successes extreme is a sensitivity
bound, not an imputation or an observed result.

This module proves only the arithmetic envelope for a binary rate. It does
not prove that the source's "under 5%" sensitivity statement uses this
estimand, does not reconstruct the raw dataset, and does not establish
anything about model cognition or causal effects.
-/

namespace HsHVerification.CalderHiddenProfileMissingness

/-- Binary success rate over the planned denominator. -/
def successRate (successes planned : ℕ) : ℚ :=
  (successes : ℚ) / (planned : ℚ)

/-- If observed of planned binary outcomes are observed, the full-sample
    success rate lies between the all-missing-failures and all-missing-
    successes bounds. Observed successes cannot exceed the observed count,
    and missing successes cannot exceed the number of unobserved cases. -/
theorem binary_missingness_rate_bounds
    (planned observed observedSuccesses missingSuccesses : ℕ)
    (hObserved : observed ≤ planned)
    (hSuccesses : observedSuccesses ≤ observed)
    (hMissing : missingSuccesses ≤ planned - observed)
    (hPlanned : 0 < planned) :
    successRate observedSuccesses planned ≤
      successRate (observedSuccesses + missingSuccesses) planned ∧
    successRate (observedSuccesses + missingSuccesses) planned ≤
      successRate (observedSuccesses + (planned - observed)) planned ∧
    observedSuccesses + missingSuccesses ≤ planned := by
  unfold successRate
  have hDenPos : (0 : ℚ) < (planned : ℚ) := by
    exact_mod_cast hPlanned
  have hDen : (0 : ℚ) ≤ (planned : ℚ) := le_of_lt hDenPos
  have hLowNat : observedSuccesses ≤ observedSuccesses + missingSuccesses := by
    omega
  have hTotal : observedSuccesses + missingSuccesses ≤ planned := by
    omega
  have hLow : (observedSuccesses : ℚ) ≤
      (observedSuccesses + missingSuccesses : ℚ) := by
    exact_mod_cast hLowNat
  have hUpperNat : observedSuccesses + missingSuccesses ≤
      observedSuccesses + (planned - observed) := by
    exact Nat.add_le_add_left hMissing observedSuccesses
  have hUpper : (observedSuccesses + missingSuccesses : ℚ) ≤
      (observedSuccesses + (planned - observed) : ℚ) := by
    exact_mod_cast hUpperNat
  have hObservedLePlanned : observed ≤ planned := by
    omega
  constructor
  ·
    simpa only [Nat.cast_add] using
      (div_le_div_of_nonneg_right hLow hDen)
  · constructor
    ·
      simpa only [Nat.cast_add, Nat.cast_sub hObservedLePlanned,
        add_sub_cancel_left] using
        (div_le_div_of_nonneg_right hUpper hDen)
    · exact hTotal

/-- Source-derived instantiation: 0 observed successes in 5 observed
    sessions, with 10 of 15 planned sessions unobserved. -/
theorem gpt_oss_hidden_async_identified_interval :
    successRate 0 15 ≤ successRate 10 15 ∧
    successRate 10 15 ≤ successRate 10 15 ∧
    10 ≤ 15 := by
  have h := binary_missingness_rate_bounds
    15 5 0 10 (by norm_num) (by norm_num) (by norm_num) (by norm_num)
  simpa [successRate] using h

/-- The all-missing-successes upper bound is exactly 2/3. -/
theorem gpt_oss_hidden_async_upper_rate :
    successRate 10 15 = (2 : ℚ) / 3 := by
  norm_num [successRate]

/-- The upper bound is greater than 5%; this contradicts an "under 5%"
    statement only if that statement refers to this cell's accuracy rate. -/
theorem gpt_oss_hidden_async_upper_rate_exceeds_five_percent :
    successRate 10 15 > (1 : ℚ) / 20 := by
  norm_num [successRate]

/-- Nine of the ten missing outcomes being successes would produce a
    9/15 point rate above the 1/3 chance baseline. This is not a
    significance test and makes no claim that those outcomes occurred. -/
theorem nine_missing_successes_exceed_chance_point_rate :
    successRate 9 15 > (1 : ℚ) / 3 := by
  norm_num [successRate]

#print axioms binary_missingness_rate_bounds
#print axioms gpt_oss_hidden_async_identified_interval
#print axioms gpt_oss_hidden_async_upper_rate
#print axioms gpt_oss_hidden_async_upper_rate_exceeds_five_percent
#print axioms nine_missing_successes_exceed_chance_point_rate

end HsHVerification.CalderHiddenProfileMissingness
