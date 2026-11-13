import Mathlib

/-!
Hale Review-MIND :48, nominal 2026-10-29 21:48 UTC.
Source-conditional fixed complete-case label-agreement counts from all 17
original aayambansal/ConsistencyBench CGD JSON Git blobs, 1,150 aligned
question occurrences. Original evaluator src/evaluate.py Git blob
0453540cb7c19227601e59fb342fa93e736da849.
The source-locked manifest is in Orson's existing
WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js
(blob a2e21227dda53d867afcef771060fd39f8d6ae47).

Singleton literal-question strings: 896 occurrences, 106955 eligible pairs,
80931 initial matches and 81813 final matches, delta +882.
Repeated literal-question strings: 81 strings / 254 occurrences,
30956 eligible pairs, 21866 initial matches and 21068 final, delta -798.
Pooled: 137911 eligible pairs, 102797 -> 102881, delta +84.
Unique-string equal weighting divides each occurrence by its exact
literal-question multiplicity (max 8); integer scale 840 gives
weighted delta 523386/840 and eligible weight 98125065/840.

Proofs certify these formalized arithmetic and cardinality statements ONLY.
They do not authenticate the source, judge semantic correctness, prove
independence, estimate causation, or describe physical H(s)H dynamics.
-/

namespace HsHVerification.HaleP1RepeatStrata

def singletonPositions : Nat := 896
def repeatedPositions : Nat := 254
def distinctSingletonStrings : Nat := 896
def distinctRepeatedStrings : Nat := 81

def singletonEligible : Nat := 106955
def repeatedEligible : Nat := 30956
def singletonInitial : Nat := 80931
def singletonFinal : Nat := 81813
def repeatedInitial : Nat := 21866
def repeatedFinal : Nat := 21068

def singletonDelta : ℤ := (singletonFinal : ℤ) - singletonInitial
def repeatedDelta : ℤ := (repeatedFinal : ℤ) - repeatedInitial

def weightedDelta : ℚ := (523386 : ℚ) / 840
def weightedEligible : ℚ := (98125065 : ℚ) / 840

theorem occurrence_and_string_partitions :
    singletonPositions + repeatedPositions = 1150 ∧
    distinctSingletonStrings + distinctRepeatedStrings = 977 := by
  norm_num [singletonPositions, repeatedPositions,
    distinctSingletonStrings, distinctRepeatedStrings]

theorem eligible_pair_partition :
    singletonEligible + repeatedEligible = 137911 := by
  norm_num [singletonEligible, repeatedEligible]

theorem matching_pair_partitions :
    singletonInitial + repeatedInitial = 102797 ∧
    singletonFinal + repeatedFinal = 102881 := by
  norm_num [singletonInitial, repeatedInitial, singletonFinal, repeatedFinal]

theorem opposing_stratum_signs :
    singletonDelta = 882 ∧ repeatedDelta = -798 ∧
    singletonDelta > 0 ∧ repeatedDelta < 0 := by
  norm_num [singletonDelta, repeatedDelta, singletonFinal,
    singletonInitial, repeatedFinal, repeatedInitial]

theorem pooled_cancellation :
    singletonDelta + repeatedDelta = 84 := by
  norm_num [singletonDelta, repeatedDelta, singletonFinal,
    singletonInitial, repeatedFinal, repeatedInitial]

theorem unique_string_weighting_positive :
    weightedDelta > 0 ∧ weightedEligible > 0 := by
  norm_num [weightedDelta, weightedEligible]

theorem unique_string_weighted_fraction :
    weightedDelta / weightedEligible = (58154 : ℚ) / 10902785 := by
  norm_num [weightedDelta, weightedEligible]

/-- The observed occurrence-to-exact-question-string map has unequal
    domain/codomain cardinalities, hence cannot be injective. This does
    not imply equal full model prompts or identical preceding context. -/
theorem occurrence_projection_not_injective
    (q : Fin 1150 → Fin 977) : ¬ Function.Injective q := by
  intro h
  have hcard := Fintype.card_le_of_injective q h
  norm_num at hcard

#print axioms occurrence_and_string_partitions
#print axioms eligible_pair_partition
#print axioms matching_pair_partitions
#print axioms opposing_stratum_signs
#print axioms pooled_cancellation
#print axioms unique_string_weighting_positive
#print axioms unique_string_weighted_fraction
#print axioms occurrence_projection_not_injective

end HsHVerification.HaleP1RepeatStrata
