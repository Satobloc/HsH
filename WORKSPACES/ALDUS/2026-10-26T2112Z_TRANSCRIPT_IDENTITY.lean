/-
Aldus provenance gate, 2026-10-26. This file is a Lean 4 PROOF CANDIDATE.
Not compiled in the available environment. It proves only conditional record-identity
statements, not that archived headers are authentic publication timestamps.
-/
structure TranscriptRecord where
  header : String
  body : String
  deriving DecidableEq

def sameBody (a b : TranscriptRecord) : Prop := a.body = b.body

theorem sameBody_refl (a : TranscriptRecord) : sameBody a a := rfl

theorem sameBody_symm (a b : TranscriptRecord)
    (h : sameBody a b) : sameBody b a := h.symm

theorem sameBody_trans (a b c : TranscriptRecord)
    (hab : sameBody a b) (hbc : sameBody b c) : sameBody a c :=
  hab.trans hbc

theorem distinctHeaders_imply_distinctRecords (a b : TranscriptRecord)
    (h : a.header ≠ b.header) : a ≠ b := by
  intro eq
  exact h (congrArg TranscriptRecord.header eq)

theorem sameBody_does_not_fix_header (a b : TranscriptRecord)
    (hBody : sameBody a b) (hHeader : a.header ≠ b.header) :
    sameBody a b ∧ a ≠ b :=
  ⟨hBody, distinctHeaders_imply_distinctRecords a b hHeader⟩
