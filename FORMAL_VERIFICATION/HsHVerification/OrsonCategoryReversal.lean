import Mathlib

/-!
# Orson P1: category-stratified key sensitivity in archived ConsistencyBench responses

This module formalizes **only the arithmetic of source-observed integer counts**
from 17 matched vanilla/CGD model pairs, 50 archived question sets per
category per model (850 set observations per category).

Primary source: aayambansal/ConsistencyBench,
data/consistency_bench_sample.json Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d,
src/evaluate.py Git blob 0453540cb7c19227601e59fb342fa93e736da849.
Counts were independently reproduced from all 34 archived response files.
The sole intervention on the scoring rule replaces the incorrect negation Q3
key (NOT P) with P, keeping the original outputs fixed.

Lean does not verify the source retrieval, semantics of the key correction,
causal effect of CGD, model independence, or physical premises.
-/

namespace HsHVerification.OrsonCategoryReversal

/-- Ordered categories: contrapositive, transitivity, syllogistic,
    negation, modus tollens, commonsense entailment. -/
def originalVanilla : List ℤ := [170, 209, 57, 104, 93, 193]
def originalCGD : List ℤ := [335, 195, 98, 123, 162, 252]
def correctedVanilla : List ℤ := [170, 209, 57, 211, 93, 193]
def correctedCGD : List ℤ := [335, 195, 98, 172, 162, 252]

theorem original_total_gain :
    originalCGD.sum - originalVanilla.sum = 339 := by
  norm_num [originalCGD, originalVanilla]

theorem corrected_total_gain :
    correctedCGD.sum - correctedVanilla.sum = 281 := by
  norm_num [correctedCGD, correctedVanilla]

theorem negation_category_sign_reversal :
    ((123 : ℤ) - 104 = 19) ∧
    ((172 : ℤ) - 211 = -39) ∧
    ((172 : ℤ) - 211 < 0) := by
  norm_num

/-- Changing the key changes the measured CGD advantage by the difference
    between the two strategies' respective score corrections. -/
theorem difference_of_differences
    (vOld cOld vNew cNew : ℤ) :
    (cNew - vNew) - (cOld - vOld) =
      (cNew - cOld) - (vNew - vOld) := by
  ring

theorem observed_gain_change :
    (correctedCGD.sum - correctedVanilla.sum) -
      (originalCGD.sum - originalVanilla.sum) = -58 := by
  norm_num [correctedCGD, correctedVanilla, originalCGD, originalVanilla]

theorem category_balance :
    (165 : ℤ) - 14 + 41 - 39 + 69 + 59 = 281 := by
  norm_num

theorem positive_aggregate_with_negative_categories :
    (281 : ℤ) > 0 ∧
    ((195 : ℤ) - 209 < 0) ∧
    ((172 : ℤ) - 211 < 0) := by
  norm_num

#print axioms original_total_gain
#print axioms corrected_total_gain
#print axioms negation_category_sign_reversal
#print axioms difference_of_differences
#print axioms observed_gain_change
#print axioms category_balance
#print axioms positive_aggregate_with_negative_categories

end HsHVerification.OrsonCategoryReversal
