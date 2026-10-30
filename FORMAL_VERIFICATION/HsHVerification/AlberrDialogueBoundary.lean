import Mathlib

/-!
# Alberr: role-tagged dialogue boundary (source-conditional)

Original archived ChatGPT conversation: Git blob
c98f63fa861b0df478a5fa98dff54d731348c81f.
Message d8915702-90ec-450d-952b-0e298602aabf, 2026-06-06T19:58:14Z,
is author.role = assistant. Its body contains five textual stage-direction
spans attributing actions to "You" (nod, explain, continue, explain, explain).
These are five spans in ONE assistant-authored source message, not five
independent user-role messages.

The source count and role attribution were checked against the raw JSON.
Lean checks only the encoded role/projection statements; it cannot validate
the source parser, the roleplay's consent, or real human actions.
-/

namespace HsHVerification.AlberrDialogueBoundary

inductive Role where
  | user
  | assistant
  | tool
  deriving DecidableEq, Repr

def sourceNode : String := "d8915702-90ec-450d-952b-0e298602aabf"

def cueAuthor : Fin 5 → Role := fun _ => .assistant

def cueMessage : Fin 5 → String := fun _ => sourceNode

def recordedUserTurn (i : Fin 5) : Prop := cueAuthor i = .user

theorem all_five_spans_share_assistant_source (i : Fin 5) :
    cueAuthor i = .assistant ∧ cueMessage i = sourceNode := by
  exact ⟨rfl, rfl⟩

theorem no_span_is_a_user_role_message :
    ¬ ∃ i : Fin 5, recordedUserTurn i := by
  rintro ⟨i, hi⟩
  simp [recordedUserTurn, cueAuthor] at hi

theorem cannot_reclassify_all_as_user_turns :
    ¬ (∀ i : Fin 5, recordedUserTurn i) := by
  intro h
  exact no_span_is_a_user_role_message ⟨0, h 0⟩

theorem user_role_span_count_zero :
    (Finset.univ.filter (fun i : Fin 5 => cueAuthor i = .user)).card = 0 := by
  simp [cueAuthor]

#print axioms all_five_spans_share_assistant_source
#print axioms no_span_is_a_user_role_message
#print axioms cannot_reclassify_all_as_user_turns
#print axioms user_role_span_count_zero

end HsHVerification.AlberrDialogueBoundary
