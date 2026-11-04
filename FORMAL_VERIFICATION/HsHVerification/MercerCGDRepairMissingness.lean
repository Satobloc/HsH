import Mathlib

/-!
Mercer, Workshop Relay :48, 2026-10-28 20:48 UTC.
Independent source-critical cognition QA, NOT an LLM trial.

Source: aayambansal/ConsistencyBench, src/evaluate.py,
Git blob 0453540cb7c19227601e59fb342fa93e736da849.
Observed inputs: 17 archived results/*_cgd.json files (17 x 1150 = 19550
question records), individually source-pinned in the accompanying report.
Executed connected-GitHub JavaScript replayer found:
  initial missing (empty/whitespace or literal [ERROR]) = 444;
  final missing = 605; both missing = 420;
  initial-only missing = 24; final-only missing = 185;
  final-only missing following a checker-triggered revision = 185;
  66 of those 185 initial labels matched published normalized keys;
  final missing = 558 empty/whitespace + 47 literal [ERROR].
This is SOURCE-CONDITIONAL arithmetic and control-flow formalization.
No statement here proves archive provenance, semantic correctness,
provider behavior, causation, or physical SAT/H(s)H propositions.

The nested Option representation is essential:
  none       : no revision was attempted;
  some none  : revision attempted but no substantive response;
  some (some a): revision produced an answer.
Collapsing these states would misrepresent the actual evaluator,
which uses 'revision_response is not None' rather than truthiness.
-/

namespace HsHVerification.MercerCGDRepairMissingness

/-- A revision slot is absent when no revision was attempted. A present
revision slot can itself hold no substantive answer. -/
def finalValue {α : Type*}
    (initial : Option α) (revision : Option (Option α)) : Option α :=
  match revision with
  | none => initial
  | some answer => answer

theorem no_revision_preserves_initial {α : Type*} (a : α) :
    finalValue (some a) none = some a := by
  rfl

theorem blank_revision_overwrites_initial {α : Type*} (a : α) :
    finalValue (some a) (some none) = none := by
  rfl

theorem blank_revision_differs_from_no_revision {α : Type*} (a : α) :
    finalValue (some a) (some none) ≠ finalValue (some a) none := by
  simp [finalValue]

theorem source_missing_partition :
    (420 : Nat) + 24 = 444 ∧
    (420 : Nat) + 185 = 605 ∧
    (397 : Nat) + 47 = 444 ∧
    (558 : Nat) + 47 = 605 := by
  norm_num

theorem source_correct_initial_label_lost :
    (2 : Nat) + 21 + 31 + 12 = 66 ∧
    (66 : Nat) + 119 = 185 := by
  norm_num

#print axioms no_revision_preserves_initial
#print axioms blank_revision_overwrites_initial
#print axioms blank_revision_differs_from_no_revision
#print axioms source_missing_partition
#print axioms source_correct_initial_label_lost

end HsHVerification.MercerCGDRepairMissingness
