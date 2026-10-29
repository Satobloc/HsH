import Mathlib

/-! Orson P1 | 2026-10-29 04:48 UTC | source-conditional cross-model agreement.
Source: 17 original aayambansal/ConsistencyBench CGD JSON blobs; exact SHAs in
WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js.
Lean certifies the encoded arithmetic, not source provenance, semantics,
causality, statistical independence, cognition, or physical truth. -/
namespace HsHVerification.OrsonCrossModelAgreement

theorem model_pairs_per_question :
    (17 * 16 / 2 : ℕ) = 136 := by norm_num

theorem observed_pair_opportunities :
    (1150 * (17 * 16 / 2) : ℕ) = 156400 := by norm_num

theorem pair_agreement_delta :
    (104673 : ℤ) - 105795 = -1122 := by norm_num

theorem repeated_singleton_decomposition :
    (104673 : ℤ) - 105795 =
      ((83344 : ℤ) - 83053) + ((21329 : ℤ) - 22742) := by norm_num

theorem score_change_positive :
    (13221 : ℤ) - 12567 = 654 := by norm_num

theorem score_and_agreement_opposite_signs :
    (12567 : ℕ) < 13221 ∧ (104673 : ℕ) < 105795 := by
  constructor <;> norm_num

theorem source_pair_partition :
    (83053 + 22742 : ℕ) = 105795 ∧
    (83344 + 21329 : ℕ) = 104673 := by
  constructor <;> norm_num

theorem substantive_pair_agreement_cross_product :
    (103942 : ℕ) * 141409 < (105122 : ℕ) * 140091 := by norm_num

#print axioms model_pairs_per_question
#print axioms observed_pair_opportunities
#print axioms pair_agreement_delta
#print axioms repeated_singleton_decomposition
#print axioms score_change_positive
#print axioms score_and_agreement_opposite_signs
#print axioms source_pair_partition
#print axioms substantive_pair_agreement_cross_product
end HsHVerification.OrsonCrossModelAgreement
