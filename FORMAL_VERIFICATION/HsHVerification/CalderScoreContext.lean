import Mathlib

/-!
Calder Review-MIND / P1 adversarial review, 2026-10-28T22:48Z.
Source-conditional witness of a TYPE ERROR in a proposed observation pipeline:
a correctness score does not factor through an extracted answer label alone.

Actual source: aayambansal/ConsistencyBench results/gpt-4o_vanilla.json,
Git blob SHA-1 8196ac51e92737d5a479fb4fca7f85261a7109ec.
Actual archived set CB-58567, commonsense_entailment:
  question 0: extracted_answer Yes, published expected Yes;
  question 1: extracted_answer Yes, published expected No.
Evaluator src/evaluate.py Git blob 0453540cb7c19227601e59fb342fa93e736da849:
individual correctness is equality of normalized expected and extracted labels.

This proof checks an encoded SOURCE-KEY score, NOT semantic correctness of
either source key, actual model cognition, or causal independence.
-/

namespace HsHVerification.CalderScoreContext

inductive Answer where
  | yes
  | no
  | unclear
  deriving DecidableEq, Repr

inductive Occurrence where
  | cb58567q0
  | cb58567q1
  deriving DecidableEq, Repr

def observedLabel : Occurrence → Answer
  | .cb58567q0 => .yes
  | .cb58567q1 => .yes

def publishedKey : Occurrence → Answer
  | .cb58567q0 => .yes
  | .cb58567q1 => .no

def sourceScore (o : Occurrence) : Bool :=
  decide (observedLabel o = publishedKey o)

theorem same_extracted_label :
    observedLabel .cb58567q0 = observedLabel .cb58567q1 := by
  rfl

theorem different_source_scores :
    sourceScore .cb58567q0 = true ∧
    sourceScore .cb58567q1 = false := by
  decide

theorem general_nonfactorization {O L : Type*}
    (label : O → L) (score : O → Bool) (a b : O)
    (hl : label a = label b) (hs : score a ≠ score b) :
    ¬ ∃ f : L → Bool, ∀ o, f (label o) = score o := by
  intro h
  rcases h with ⟨f, hf⟩
  apply hs
  calc
    score a = f (label a) := (hf a).symm
    _ = f (label b) := congrArg f hl
    _ = score b := hf b

theorem no_label_only_scoring :
    ¬ ∃ f : Answer → Bool, ∀ o, f (observedLabel o) = sourceScore o := by
  apply general_nonfactorization observedLabel sourceScore
    Occurrence.cb58567q0 Occurrence.cb58567q1
  · exact same_extracted_label
  · intro h
    have ha : sourceScore Occurrence.cb58567q0 = true :=
      different_source_scores.1
    have hb : sourceScore Occurrence.cb58567q1 = false :=
      different_source_scores.2
    rw [ha, hb] at h
    cases h

#print axioms same_extracted_label
#print axioms different_source_scores
#print axioms general_nonfactorization
#print axioms no_label_only_scoring

end HsHVerification.CalderScoreContext
