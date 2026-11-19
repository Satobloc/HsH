import Mathlib

/-!
# Aster 2024 pasted prediction: source-layer identity

A conditional encoding of the actual March 23, 2024 conversation genealogy.
The source data and message IDs are documented in the companion Aster report.
The kernel proves facts about this encoding; it cannot authenticate historical
speakers, textual matches, or SAT physics.
-/

namespace HsHVerification.AsterPastedPrediction

inductive Speaker where
  | nathan
  | assistant
  deriving DecidableEq, Repr

inductive PhraseOrigin where
  | nathanEdit
  | assistantRewording
  deriving DecidableEq, Repr

structure SourceWitness where
  host : Speaker
  phraseOrigin : PhraseOrigin
  deriving DecidableEq, Repr

-- The 07:27 Nathan edit, and a user-hosted 07:44 pasted phrase whose
-- exact wording first appears in the 07:33 assistant overview.
def originalEdit : SourceWitness :=
  ⟨.nathan, .nathanEdit⟩

def laterUserRepost : SourceWitness :=
  ⟨.nathan, .assistantRewording⟩

def erasePhraseOrigin (w : SourceWitness) : Speaker := w.host

theorem original_edit_is_user_hosted :
    originalEdit.host = .nathan := rfl

theorem repost_is_user_hosted :
    laterUserRepost.host = .nathan := rfl

theorem pasted_phrase_has_distinct_origin :
    laterUserRepost.phraseOrigin ≠ originalEdit.phraseOrigin := by
  decide

theorem user_role_projection_is_not_injective :
    ¬ Function.Injective erasePhraseOrigin := by
  intro h
  have heq : originalEdit = laterUserRepost := h rfl
  have hsrc : originalEdit.phraseOrigin = laterUserRepost.phraseOrigin :=
    congrArg SourceWitness.phraseOrigin heq
  exact pasted_phrase_has_distinct_origin hsrc.symm

theorem user_host_does_not_force_nathan_phrase :
    ¬ (∀ w : SourceWitness, w.host = .nathan →
        w.phraseOrigin = .nathanEdit) := by
  intro h
  have hc := h laterUserRepost rfl
  have hn : laterUserRepost.phraseOrigin ≠ .nathanEdit := by decide
  exact hn hc

end HsHVerification.AsterPastedPrediction
