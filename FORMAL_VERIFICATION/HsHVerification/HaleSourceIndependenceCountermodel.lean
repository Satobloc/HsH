import Mathlib

namespace HsHVerification.HaleSourceDependence

/-- A source label; labels can be distinct even when observations share a latent cause. -/
inductive SourceId where
  | first
  | second
  deriving DecidableEq

/-- The common latent state on a two-world uniform sample space. -/
def commonCause (ω : Bool) : Bool := ω

/-- Both nominal sources report the same latent variable. -/
def observe (_source : SourceId) : Bool → Bool := commonCause

def event (X : Bool → Bool) (a : Bool) : Finset Bool :=
  Finset.univ.filter (fun ω => X ω = a)

def jointEvent (X Y : Bool → Bool) (a b : Bool) : Finset Bool :=
  Finset.univ.filter (fun ω => X ω = a ∧ Y ω = b)

/-- Under the uniform counting measure on Bool, independence is the
factorization of each joint-cell probability. Cross-multiplying by four
gives this cardinality equation because Fintype.card Bool = 2. -/
def Independent (X Y : Bool → Bool) : Prop :=
  ∀ a b, 2 * (jointEvent X Y a b).card =
    (event X a).card * (event Y b).card

lemma event_commonCause_false :
    event commonCause false = {false} := by
  ext ω
  simp [event, commonCause, Finset.mem_filter]

lemma jointEvent_commonCause_false :
    jointEvent commonCause commonCause false false = {false} := by
  ext ω
  simp [jointEvent, commonCause, Finset.mem_filter]

theorem commonCause_not_independent :
    ¬ Independent commonCause commonCause := by
  intro h
  have h00 := h false false
  norm_num at h00

theorem distinct_source_ids_share_common_cause :
    SourceId.first ≠ SourceId.second ∧
    (∀ ω, observe SourceId.first ω = observe SourceId.second ω) ∧
    ¬ Independent (observe SourceId.first) (observe SourceId.second) := by
  refine ⟨by decide, ?_, ?_⟩
  · intro ω
    rfl
  · simpa [observe] using commonCause_not_independent

#print axioms commonCause_not_independent
#print axioms distinct_source_ids_share_common_cause

end HsHVerification.HaleSourceDependence
