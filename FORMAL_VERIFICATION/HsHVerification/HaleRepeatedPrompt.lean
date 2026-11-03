import Mathlib

/-!
Hale :00 / source-conditioned repeated-prompt observation gate, 2026-10-28 23Z.
Original archived aayambansal/ConsistencyBench GPT-4o vanilla results,
Git blob 8196ac51e92737d5a479fb4fca7f85261a7109ec.
Observed question text in CB-88561 Q3 and CB-46342 Q3 is byte-identical:
"Given: (1) \"All vehicles are machines.\" If something is a member of machines,
is it necessarily a member of vehicles?"
The source evaluator records extracted labels No and Cannot be determined,
respectively; both raw answers start "No.".
Source evaluator src/evaluate.py blob 0453540cb7c19227601e59fb342fa93e736da849.
This proves only the finite encoded source-conditional nonfactorization, not
authenticated model calls, semantic correctness, stochastic mechanism, or
a theory of cognition. No physical calculation or invented fixture.
-/

namespace HsHVerification.HaleRepeatedPrompt

inductive Prompt where
  | vehiclesReverse
  deriving DecidableEq, Repr

inductive Observation where
  | cb88561q3
  | cb46342q3
  deriving DecidableEq, Repr

inductive Label where
  | no
  | cannotDetermine
  deriving DecidableEq, Repr

inductive RawLead where
  | no
  deriving DecidableEq, Repr

def promptOf : Observation → Prompt
  | .cb88561q3 => .vehiclesReverse
  | .cb46342q3 => .vehiclesReverse

def extractedLabel : Observation → Label
  | .cb88561q3 => .no
  | .cb46342q3 => .cannotDetermine

def rawLead : Observation → RawLead
  | .cb88561q3 => .no
  | .cb46342q3 => .no

theorem same_prompt :
    promptOf .cb88561q3 = promptOf .cb46342q3 := by
  rfl

theorem same_raw_lead :
    rawLead .cb88561q3 = rawLead .cb46342q3 := by
  rfl

theorem distinct_extracted_labels :
    extractedLabel .cb88561q3 ≠ extractedLabel .cb46342q3 := by
  decide

theorem no_prompt_only_extractor :
    ¬ ∃ f : Prompt → Label, ∀ o, f (promptOf o) = extractedLabel o := by
  intro h
  rcases h with ⟨f, hf⟩
  apply distinct_extracted_labels
  calc
    extractedLabel .cb88561q3 = f (promptOf .cb88561q3) := (hf _).symm
    _ = f (promptOf .cb46342q3) := congrArg f same_prompt
    _ = extractedLabel .cb46342q3 := hf _

theorem no_raw_lead_only_extractor :
    ¬ ∃ f : RawLead → Label, ∀ o, f (rawLead o) = extractedLabel o := by
  intro h
  rcases h with ⟨f, hf⟩
  apply distinct_extracted_labels
  calc
    extractedLabel .cb88561q3 = f (rawLead .cb88561q3) := (hf _).symm
    _ = f (rawLead .cb46342q3) := congrArg f same_raw_lead
    _ = extractedLabel .cb46342q3 := hf _

#print axioms same_prompt
#print axioms same_raw_lead
#print axioms distinct_extracted_labels
#print axioms no_prompt_only_extractor
#print axioms no_raw_lead_only_extractor

end HsHVerification.HaleRepeatedPrompt
