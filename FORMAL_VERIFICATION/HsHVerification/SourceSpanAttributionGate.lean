import Mathlib

/-!
# Source-span attribution gate

A document or conversation turn has a container-level author label and a
span-level attribution map. The theorems below formalize only the information
loss incurred by projecting away the span map.

This does not identify any historical author and does not validate the
translation of an archive into `Span` and `Author`.
-/

namespace HsHVerification.SourceSpanAttributionGate

variable {Span Author : Type*}

/-- Span-level attribution is uniform when every span is attributed to the
container-level author. -/
def UniformAttribution (container : Author) (spanAuthor : Span → Author) : Prop :=
  ∀ s, spanAuthor s = container

/-- One span attributed differently from the container author is a witness
against uniform attribution. -/
theorem embedded_different_author_refutes_uniform
    (container : Author) (spanAuthor : Span → Author) (s : Span)
    (hDifferent : spanAuthor s ≠ container) :
    ¬ UniformAttribution container spanAuthor := by
  intro hUniform
  exact hDifferent (hUniform s)

/-- A source record keeps both the container label and the attribution of
individual spans. -/
structure ProvenanceRecord (Span Author : Type*) where
  containerAuthor : Author
  spanAuthor : Span → Author

/-- The lossy turn-level view of a source record. -/
def containerProjection (record : ProvenanceRecord Span Author) : Author :=
  record.containerAuthor

/-- If the author type contains two distinct values and there is a span, then
container projection is not injective: records with the same container label
can disagree on the selected span. -/
theorem containerProjection_not_injective
    (s : Span) (container a b : Author) (hab : a ≠ b) :
    ∃ r₁ r₂ : ProvenanceRecord Span Author,
      containerProjection r₁ = containerProjection r₂ ∧ r₁ ≠ r₂ := by
  let r₁ : ProvenanceRecord Span Author := ⟨container, fun _ => a⟩
  let r₂ : ProvenanceRecord Span Author := ⟨container, fun _ => b⟩
  refine ⟨r₁, r₂, rfl, ?_⟩
  intro hRecords
  have hSpan := congrArg
    (fun r : ProvenanceRecord Span Author => r.spanAuthor s) hRecords
  exact hab hSpan

/-- A single reconstruction from the container label cannot assign two
different authors to the same span. -/
theorem no_single_container_reconstruction
    (recover : Author → Span → Author) (container a b : Author) (s : Span)
    (hab : a ≠ b) :
    ¬ (recover container s = a ∧ recover container s = b) := by
  rintro ⟨ha, hb⟩
  exact hab (ha.symm.trans hb)

#print axioms embedded_different_author_refutes_uniform
#print axioms containerProjection_not_injective
#print axioms no_single_container_reconstruction

end HsHVerification.SourceSpanAttributionGate
