import Mathlib

/-!
Source-conditional corpus provenance audit (Loom, 2026-10-28 17:48 UTC).
Original selected ancestry: DIMENSIONAL GRAVITY, 2024-03-23, Git blob
2cea1924266418e19b825b95ae51e6b7cbace7e1.

Six complete, normalized sentences (three Predictions, two Testing SAT,
one epistemic caveat) occur in assistant turn
658fcf34-fe17-4032-89e3-14c63544586e, then in later user-pasted outline
aaa20385-4291-4096-94f5-881e1e975a0d and subsequent assistant expansion
ead5243c-1d4e-41d7-bf5c-0f5b6ef2d2b1, but not in earlier Nathan edit
aaa2ca24-b946-4878-a6e0-e74d235ab01c.

These are transcribed SOURCE OBSERVATIONS, not independent author attribution
or evidence of copying direction, causality, scientific validity or H(s)H physics.
Lean proves only the encoded propositions.
-/

namespace HsHVerification.LoomReimportedSpanProvenance

inductive Turn where
  | originalUserEdit
  | assistantOverview
  | laterUserOutline
  | assistantExpansion
  deriving DecidableEq

def isUserTurn : Turn → Bool
  | .originalUserEdit => true
  | .assistantOverview => false
  | .laterUserOutline => true
  | .assistantExpansion => false

def matchedSentenceCount : Turn → Nat
  | .originalUserEdit => 0
  | .assistantOverview => 6
  | .laterUserOutline => 6
  | .assistantExpansion => 6

theorem earlier_user_edit_has_zero_six_sentence_matches :
    matchedSentenceCount .originalUserEdit = 0 := rfl

theorem assistant_and_later_user_share_six_exact_sentences :
    matchedSentenceCount .assistantOverview = 6 ∧
    matchedSentenceCount .laterUserOutline = 6 := by decide

theorem subsequent_assistant_preserves_six_sentences :
    matchedSentenceCount .assistantExpansion = 6 := rfl

theorem identical_outer_role_does_not_determine_six_sentence_signature :
    ¬ ∃ f : Bool → Nat, ∀ t : Turn,
      f (isUserTurn t) = matchedSentenceCount t := by
  rintro ⟨f, hf⟩
  have h0 := hf Turn.originalUserEdit
  have h6 := hf Turn.laterUserOutline
  simp only [isUserTurn, matchedSentenceCount] at h0 h6
  omega

#print axioms earlier_user_edit_has_zero_six_sentence_matches
#print axioms assistant_and_later_user_share_six_exact_sentences
#print axioms subsequent_assistant_preserves_six_sentences
#print axioms identical_outer_role_does_not_determine_six_sentence_signature

end HsHVerification.LoomReimportedSpanProvenance
