import Mathlib

/-!
# Hale: ConsistencyBench epistemic-key mismatch

Original benchmark: aayambansal/ConsistencyBench
Sample Git blob: 10eb2da27c84c706d8e9e2325afca864fcae6a0d
Evaluator Git blob: 0453540cb7c19227601e59fb342fa93e736da849
Archived GPT-4o / GPT-4.1 / Claude Opus 4.6 blobs:
8196ac51e92737d5a479fb4fca7f85261a7109ec
442a2dc4618ecee90f82af14b10abcf6789d8eaf
edbef31ca9554e2e2657d58eed55b43b748da97f

Actual record CB-88966 question 2 (zero-based):
  "If we know that [Ben was playing a sport], can we conclude with certainty
   that [Ben scored a goal]?"
  published key: "No, not with certainty"
  archived extracted model answers: all "Cannot be determined".

Source evaluate.py normalize_expected returns 'no' for "No, not with certainty"
and 'cannot_determine' for "No, not necessarily" (e.g. CB-59986 q2).
The hypothetical rekeying below is a SENSITIVITY TEST, not a correction
approved by independent human semantic adjudication.

This Lean module proves only facts about the explicit tokenized records and
two stipulated scoring labels. It does NOT verify the Python source, archived
API-call authenticity, semantic equivalence, LLM cognition or physical truth.
-/

namespace HsHVerification.HaleEpistemicKey

inductive Label where
  | yes
  | no
  | cannotDetermine
  deriving DecidableEq, Repr

def cb88966Recorded : Fin 3 → Label := fun _ => .cannotDetermine
def cb88966PublishedKey : Label := .no
def cb88966SensitivityKey : Label := .cannotDetermine
def cb59986PublishedKey : Label := .cannotDetermine

theorem published_keys_differ :
    cb88966PublishedKey ≠ cb59986PublishedKey := by
  decide

theorem cb88966_published_all_mismatch :
    ∀ i : Fin 3, cb88966Recorded i ≠ cb88966PublishedKey := by
  intro i
  simp [cb88966Recorded, cb88966PublishedKey]

theorem cb88966_sensitivity_all_match :
    ∀ i : Fin 3, cb88966Recorded i = cb88966SensitivityKey := by
  intro i
  rfl

theorem cb88966_scoring_noninvariance :
    (∀ i : Fin 3, cb88966Recorded i ≠ cb88966PublishedKey) ∧
    (∀ i : Fin 3, cb88966Recorded i = cb88966SensitivityKey) := by
  exact ⟨cb88966_published_all_mismatch, cb88966_sensitivity_all_match⟩

#print axioms cb88966_scoring_noninvariance

end HsHVerification.HaleEpistemicKey
