import HsHVerification.SableP1ModelFlagSource
import Mathlib
/-!
Source-conditional diagnostic lift audit. Both comparisons use genuine
published-key discrepancies in the same 17 original CGD model files.
The comparison is descriptive, NOT a p-value, causal inference, model
independence assertion, or semantic contradiction precision estimate.
-/
namespace HsHVerification.SableP1ModelFlagLift
open HsHVerification.SableP1ModelFlagSource

-- Pooled source-key discrepancy: 3093/6702 flagged versus 2871/7748 unflagged.
theorem pooled_flagged_higher_key_error :
    (3093 : Nat) * 7748 > 2871 * 6702 := by norm_num

-- The Qwen 2.5 72B file reverses the pooled direction.
theorem qwen_flagged_lower_key_error :
    (87 : Nat) * 497 < 189 * 353 := by norm_num

theorem sonnet46_flagged_lower_key_error :
    (198 : Nat) * 459 < 254 * 391 := by norm_num

theorem llama33_flagged_lower_key_error :
    (185 : Nat) * 485 < 258 * 365 := by norm_num

-- A positive pooled comparison does not establish a universal model-wise signal.
theorem no_universal_positive_signal :
    ¬ ∀ c ∈ observed, flagMoreKeyWrong c = true := by decide

theorem model_count_and_pooled_are_distinct_gates :
    observed.length = 17 ∧
    (observed.filter flagLessKeyWrong).length = 3 ∧
    pooled = ⟨3093,3609,2871,4877⟩ := by
  exact ⟨source_has_seventeen_models, model_sign_partition.2, observed_pooled_counts⟩

#print axioms pooled_flagged_higher_key_error
#print axioms qwen_flagged_lower_key_error
#print axioms sonnet46_flagged_lower_key_error
#print axioms llama33_flagged_lower_key_error
#print axioms no_universal_positive_signal
#print axioms model_count_and_pooled_are_distinct_gates
end HsHVerification.SableP1ModelFlagLift
