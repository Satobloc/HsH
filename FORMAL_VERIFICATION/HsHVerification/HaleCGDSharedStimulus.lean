import Mathlib

/-!
Hale Review-MIND :48, 2026-10-29 02:48 UTC.
Source-conditional finite census of the original 17 ConsistencyBench CGD
JSON output files (aayambansal/ConsistencyBench/results/*_cgd.json).
All 17 original Git blobs parsed; 17*81=1377 model-by-repeated-question
groups. 132 groups have uniform INITIAL extracted labels and discordant
FINAL extracted labels, but those 132 events involve only 47 distinct
literal question strings. Multiplicity histogram across distinct strings:
1 -> 10, 2 -> 12, 3 -> 11, 4 -> 7, 5 -> 6, 7 -> 1.
This is NOT a proof that those source facts are authentic, that any
answers are semantically correct, that models are independent, or that
CGD causally changes cognition. No physical calculation.
-/

namespace HsHVerification.HaleCGDSharedStimulus

def affectedDistinctStrings : Nat := 10 + 12 + 11 + 7 + 6 + 1

def affectedModelStringEvents : Nat :=
  1 * 10 + 2 * 12 + 3 * 11 + 4 * 7 + 5 * 6 + 7 * 1

def stringsAffectedInSeveralFiles : Nat := 12 + 11 + 7 + 6 + 1

theorem distinct_string_count : affectedDistinctStrings = 47 := by
  decide

theorem model_string_event_count : affectedModelStringEvents = 132 := by
  decide

theorem shared_string_count : stringsAffectedInSeveralFiles = 37 := by
  decide

theorem distinct_source_strings_fewer_than_events :
    affectedDistinctStrings < affectedModelStringEvents := by
  decide

/-- If the source counts are faithfully represented as finite types,
    projecting 132 model-string events to 47 strings cannot be injective.
    This is a combinatorial statement, not an independence test. -/
theorem source_conditional_noninjectivity
    {E Q : Type*} [Fintype E] [Fintype Q]
    (prompt : E → Q)
    (hEvents : Fintype.card E = affectedModelStringEvents)
    (hStrings : Fintype.card Q = affectedDistinctStrings) :
    ¬ Function.Injective prompt := by
  intro hInjective
  have hBound : Fintype.card E ≤ Fintype.card Q :=
    Fintype.card_le_of_injective prompt hInjective
  rw [hEvents, hStrings] at hBound
  norm_num [affectedModelStringEvents, affectedDistinctStrings] at hBound

#print axioms distinct_string_count
#print axioms model_string_event_count
#print axioms shared_string_count
#print axioms distinct_source_strings_fewer_than_events
#print axioms source_conditional_noninjectivity

end HsHVerification.HaleCGDSharedStimulus
