import Mathlib

/-!
Hale 2026-10-28: conditional arithmetic checks of 17 actual archived
ConsistencyBench vanilla/CGD model-pair counts, after Orson's documented
negation-key correction. Source: HsH Orson 2026-10-27 07:12Z report,
Git blob ddf615c2e0fd4cce2599ee0fc13c647a623f6f99.

Provider grouping (Alibaba, Anthropic, DeepSeek, Google, Meta, OpenAI)
has corrected net set-pass gains (-1, 111, 24, 62, -10, 95) and
model counts (1, 4, 1, 3, 2, 6). Each model evaluated 300 question sets.
This proves arithmetic CONDITIONAL ON transcribed observed counts;
it does not authenticate the dataset, show independent model trials,
justify statistical exchangeability, or prove a causal treatment effect.
-/

namespace HsHVerification.HaleP1ProviderSensitivity

theorem six_provider_net_sum :
    (-1 : ℤ) + 111 + 24 + 62 - 10 + 95 = 281 := by
  norm_num

theorem positive_provider_count :
    ([-1, 111, 24, 62, -10, 95] : List ℤ).filter (fun n => n > 0) |>.length = 4 := by
  decide

theorem corrected_net_positive_without_each_provider :
    0 < (281 - (-1) : ℤ) ∧
    0 < (281 - 111 : ℤ) ∧
    0 < (281 - 24 : ℤ) ∧
    0 < (281 - 62 : ℤ) ∧
    0 < (281 - (-10) : ℤ) ∧
    0 < (281 - 95 : ℤ) := by
  norm_num

theorem model_weighted_exceeds_provider_balanced :
    (281 : ℚ) / (17 * 3) >
      (((-1 : ℚ) / 1 + 111 / 4 + 24 / 1 + 62 / 3 + (-10) / 2 + 95 / 6) / 6) / 3 := by
  norm_num

#print axioms six_provider_net_sum
#print axioms positive_provider_count
#print axioms corrected_net_positive_without_each_provider
#print axioms model_weighted_exceeds_provider_balanced

end HsHVerification.HaleP1ProviderSensitivity
