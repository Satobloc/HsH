import Mathlib

/-!
Orson Vay, source-conditional cognition methods audit, 2026-10-28 09:48Z.
Original public source: aayambansal/ConsistencyBench sample JSON
Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d;
full JSON blob 3171d2899fd1eb4292794df5952514666b0e2f43.
35 source-pinned archived model-output JSON files, enumerated in
WORKSPACES/ORSON_VAY/CODE/2026_10_28_conjunction_null_replay.py.

Source-transcribed counts:
- 1150 sample question positions, 977 distinct exact question strings;
- 81 repeated-string groups occupy 254 positions; 896 singleton groups;
- negation 93 duplicate positions, syllogistic 80 duplicate positions;
- 17 paired model labels: 151 vanilla and 261 CGD discordant
  repeated-text groups, measured separately in their archived files.
All arithmetic theorems are conditional on these source counts.
Lean DOES NOT authenticate original JSON, model execution, semantic
equivalence of labels, independent trials, or causal CGD effects.
-/

namespace HsHVerification.OrsonRepeatedPrompt

theorem source_question_partition : (977 : Nat) + 173 = 1150 := by norm_num

theorem source_repeated_group_partition :
    (81 : Nat) + 896 = 977 ∧ 254 + 896 = 1150 := by norm_num

theorem source_repeated_excess : (254 : Nat) - 81 = 173 := by norm_num

theorem source_category_excess : (93 : Nat) + 80 = 173 := by norm_num

theorem source_discordance_delta : (261 : Nat) - 151 = 110 := by norm_num

-- With 1150 recorded positions but only 977 distinct text identities,
-- a position-to-text-index map cannot be injective.
theorem no_injective_prompt_index (f : Fin 1150 → Fin 977) :
    ¬ Function.Injective f := by
  intro hf
  have hcard : Fintype.card (Fin 1150) ≤ Fintype.card (Fin 977) :=
    Fintype.card_le_of_injective f hf
  norm_num at hcard

/-! Mira independent source-identity QC, 2026-10-28 14:48Z.
Source-conditional sample: 81 repeated exact-question groups = 39 with
different set-premise strings (119 positions, syllogistic) + 42 with
identical set-premise strings (135 positions, negation).
Full corpus: 122 = 65 variant-premise groups (236 positions) +
57 same-premise groups (252 positions). No repeated-question group has
different published expected-answer strings.
The vanilla evaluator passes q["question"] alone, not set["premise"].
CGD initial calls likewise; CGD repair inserts the set premise.
These counts are externally measured, not verified by Lean. -/
theorem source_premise_partition :
    (39 : Nat) + 42 = 81 ∧
    (119 : Nat) + 135 = 254 ∧
    (65 : Nat) + 57 = 122 ∧
    (236 : Nat) + 252 = 488 := by
  norm_num

/-- If two distinct source scenarios have the same projected question
but different premises, the question projection cannot be injective.
This is conditional on real source witnesses, not a proof that the
source classification or LLM interpretation is correct. -/
theorem context_variant_question_noninjective
    {Occurrence Question Premise : Type*}
    (question : Occurrence → Question)
    (premise : Occurrence → Premise)
    (a b : Occurrence)
    (hsame : question a = question b)
    (hdiff : premise a ≠ premise b) :
    ¬ Function.Injective question := by
  intro hinj
  exact hdiff (congrArg premise (hinj hsame))

#print axioms source_premise_partition
#print axioms context_variant_question_noninjective

#print axioms source_question_partition
#print axioms source_repeated_group_partition
#print axioms source_repeated_excess
#print axioms source_category_excess
#print axioms source_discordance_delta
#print axioms no_injective_prompt_index

end HsHVerification.OrsonRepeatedPrompt
