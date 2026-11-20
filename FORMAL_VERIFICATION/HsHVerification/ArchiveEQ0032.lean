import Mathlib

/-!
Archive EQ-0032: active-branch witness discipline for conversation provenance.

This module formalizes only the archive-reading rule that a record outside the
selected visible branch cannot witness a visible self-identification.  It does
not authenticate a worker, infer cognition, or establish continuity.
-/

namespace HsHVerification.ArchiveEQ0032

structure MessageRecord where
  id : Nat
  onActiveBranch : Bool
  hasSelfLabel : Bool
  deriving DecidableEq, Repr

def HasVisibleSelfIdentification (records : List MessageRecord) : Prop :=
  ∃ r ∈ records, r.onActiveBranch = true ∧ r.hasSelfLabel = true

theorem off_branch_record_not_visible_witness
    (records : List MessageRecord) (r : MessageRecord)
    (hr : r ∈ records) (hoff : r.onActiveBranch = false) :
    ¬ (r ∈ records ∧ r.onActiveBranch = true ∧ r.hasSelfLabel = true) := by
  intro h
  exact Bool.false_ne_true (hoff.symm.trans h.2.1)

theorem labels_only_off_branch_imply_no_visible_identification
    (records : List MessageRecord)
    (h : ∀ r ∈ records, r.hasSelfLabel = true → r.onActiveBranch = false) :
    ¬ HasVisibleSelfIdentification records := by
  rintro ⟨r, hr, hactive, hlabel⟩
  have hoff := h r hr hlabel
  exact Bool.false_ne_true (hoff.symm.trans hactive)

def offBranchLabelExample : List MessageRecord :=
  [⟨0, false, true⟩]

theorem label_somewhere_does_not_imply_visible_identification :
    (∃ r ∈ offBranchLabelExample, r.hasSelfLabel = true) ∧
      ¬ HasVisibleSelfIdentification offBranchLabelExample := by
  constructor
  · exact ⟨⟨0, false, true⟩, by simp [offBranchLabelExample]⟩
  · apply labels_only_off_branch_imply_no_visible_identification
    intro r hr hlabel
    simp [offBranchLabelExample] at hr
    subst r
    rfl

end HsHVerification.ArchiveEQ0032
