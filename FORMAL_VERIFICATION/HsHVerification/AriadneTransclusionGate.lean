import HsHVerification.AriadneArchiveWitness

/-!
Conditional role-identity gate for archived text transclusion. A tool message
containing an apparent quotation from a user is still a tool-authored envelope,
not an authenticated original user turn. Formalized role structure only.
-/
namespace HsHVerification.AriadneArchive

inductive MessageRole where
  | user | assistant | tool | unknown
  deriving DecidableEq, Repr

structure MentionWitness where
  role : MessageRole
  containsKirk : Bool
  sourceMessageId : String
  deriving DecidableEq, Repr

-- Actual current-chain tool message in the ARIADNE raw export.
def observedKirkToolWitness : MentionWitness :=
  ⟨.tool, true, "db23ad55-09f2-4485-af04-a255129b8db6"⟩

def IsDirectUser (w : MentionWitness) : Prop := w.role = .user
def MentionsKirk (w : MentionWitness) : Prop := w.containsKirk = true

theorem observed_tool_mentions_kirk : MentionsKirk observedKirkToolWitness := by decide
theorem observed_tool_is_not_direct_user : ¬ IsDirectUser observedKirkToolWitness := by decide

theorem mention_does_not_force_user_role :
    ¬ (∀ w : MentionWitness, MentionsKirk w → IsDirectUser w) := by
  intro h
  have hUser := h observedKirkToolWitness observed_tool_mentions_kirk
  exact observed_tool_is_not_direct_user hUser

theorem role_gate (w : MentionWitness) (h : w.role = .tool) :
    ¬ IsDirectUser w := by
  intro hUser
  simp only [IsDirectUser] at hUser
  rw [h] at hUser
  cases hUser

end HsHVerification.AriadneArchive
