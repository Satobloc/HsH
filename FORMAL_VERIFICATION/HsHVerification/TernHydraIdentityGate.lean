import Mathlib

/-!
# Identity-blind workflow deduplication, source-conditional

This is an abstract formalization of an observed prototype control key,
NOT a formalization of the Python runtime, GitHub SHA-256 implementation,
a production scheduler, or actual reviewer outcomes.

Original inspected prototype Git blob: 49988a769389b2baf264a27d596ba7c3ff822b36.
The prototype's history key includes node, candidate stage and directive state,
but not candidate identity. These are conditional mathematical consequences
of that reconstructed projection.
-/

namespace HsHVerification.TernHydraIdentityGate

structure Candidate where
  id : String
  stage : String
  deriving Repr, DecidableEq

def historyInput (node : String) (candidate : Candidate)
    (directives : List (String × Bool)) :
    String × String × List (String × Bool) :=
  (node, candidate.stage, directives)

theorem same_stage_same_history_input
    (node : String) (a b : Candidate)
    (directives : List (String × Bool))
    (hstage : a.stage = b.stage) :
    historyInput node a directives = historyInput node b directives := by
  simp [historyInput, hstage]

def issue682 : Candidate := ⟨"HsH issue #682", "checked_fail"⟩
def pr715 : Candidate := ⟨"HsH PR #715", "checked_fail"⟩

theorem recorded_identifiers_differ : issue682.id ≠ pr715.id := by
  decide

theorem same_key_for_distinct_records :
    historyInput "candidate_fail" issue682 [] =
      historyInput "candidate_fail" pr715 [] := by
  decide

theorem history_input_not_injective :
    ∃ a b : Candidate,
      a ≠ b ∧
      historyInput "candidate_fail" a [] =
        historyInput "candidate_fail" b [] := by
  refine ⟨issue682, pr715, ?_, ?_⟩
  · decide
  · decide

#print axioms same_stage_same_history_input
#print axioms recorded_identifiers_differ
#print axioms same_key_for_distinct_records
#print axioms history_input_not_injective

end HsHVerification.TernHydraIdentityGate
