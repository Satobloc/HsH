import Mathlib

/-!
P1 LLM cognition / provenance: a source-overlap invariant.

Source interpretation: Sable's 2026-10-26 source-diversity audit
WORKSPACES/SABLE/2026-10-26_1224Z_P1_SOURCE_DIVERSITY_AND_SCOPE_GATE.md
Git blob 34c73198a7390bf88458687cdc8a32d2a8afa4d3;
Orson's original shared-source-method checkpoint
WORKSPACES/ORSON_VAY/OV100_20261014_SHARED_SOURCE_AUTHORITY_GATE.md
Git blob b22a7d89f843e70085773abbca8d0559ca89acc9.

A and B are SETS OF SOURCE ANCESTORS, not raw model answer tokens.
The theorem says a bijective renaming of source identifiers preserves
the existence of a shared ancestor. It does NOT assert statistical
dependence, causation, experimental independence, or cognitive mechanisms.
-/

namespace HsHVerification.CognitionSourceOverlap

def SharesSource {α : Type*} (a b : Set α) : Prop :=
  ∃ x, x ∈ a ∧ x ∈ b

theorem shares_source_relabel_iff
    {α β : Type*} (rename : α ≃ β) (a b : Set α) :
    SharesSource a b ↔ SharesSource (rename '' a) (rename '' b) := by
  constructor
  · rintro ⟨x, ha, hb⟩
    exact ⟨rename x, ⟨x, ha, rfl⟩, ⟨x, hb, rfl⟩⟩
  · rintro ⟨y, ⟨x, ha, hxy⟩, ⟨z, hb, hzy⟩⟩
    have hxz : x = z := rename.injective (hxy.trans hzy.symm)
    exact ⟨x, ha, by simpa [hxz] using hb⟩


/-- If distinct sources are collapsed to one identifier, an apparent shared
    source can be introduced by the relabeling itself. This is a negative
    control on non-injective provenance normalization. -/
theorem source_id_collision_creates_false_overlap
    {α β : Type*} (f : α → β) (x y : α)
    (hDistinct : x ≠ y) (hCollision : f x = f y) :
    ¬ SharesSource ({x} : Set α) ({y} : Set α) ∧
      SharesSource (f '' ({x} : Set α)) (f '' ({y} : Set α)) := by
  constructor
  · rintro ⟨z, hzX, hzY⟩
    have hx : z = x := by simpa using hzX
    have hy : z = y := by simpa using hzY
    exact hDistinct (hx.symm.trans hy)
  · exact ⟨f x, ⟨x, by simp, rfl⟩, ⟨y, by simp, hCollision.symm⟩⟩

end HsHVerification.CognitionSourceOverlap
