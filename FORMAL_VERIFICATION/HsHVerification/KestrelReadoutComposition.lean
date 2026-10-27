import Mathlib

/-!
Kestrel mixed-level readout and source-independence gate, 2026-10-27.

Source: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/
kestrel-mixed-level-geometry-20261027t14z-s0-001.md.
Nathan's core/shell/coiling geometry is not asserted to be a particular
Lean Set, and no empirical or physical law is proved here.

These theorems separate image inclusion, reverse inference under
injectivity, and information loss under composed observation maps.
The same abstract mathematical contract can be used to audit an
LLM trace -> label -> score pipeline, but that does not establish a
physical equivalence between cognition and worldtubes.
-/

namespace HsHVerification.KestrelReadoutComposition

variable {A B C : Type*}

/-- Inclusion survives application of the SAME forward map. -/
theorem inclusion_survives_forward_map
    (f : A → B) (core shell : Set A) (h : core ⊆ shell) :
    f '' core ⊆ f '' shell := Set.image_mono h

/-- Reverse inference from image inclusion requires injectivity. -/
theorem reverse_inclusion_requires_injectivity
    (f : A → B) (hf : Function.Injective f)
    (core shell : Set A) (h : f '' core ⊆ f '' shell) :
    core ⊆ shell := by
  intro x hx
  have hfx : f x ∈ f '' core := ⟨x, hx, rfl⟩
  rcases h hfx with ⟨y, hy, hEq⟩
  have hyx : y = x := hf hEq
  simpa [hyx] using hy

/-- A later readout cannot recover an identification already lost upstream. -/
theorem upstream_noninjectivity_survives_readout
    (section : A → B) (readout : B → C)
    (h : ¬ Function.Injective section) :
    ¬ Function.Injective (readout ∘ section) := by
  intro hcomposed
  apply h
  intro x y hxy
  apply hcomposed
  exact congrArg readout hxy

/-- Two injective maps compose to an injective readout. -/
theorem composed_injectivity_requires_both_maps
    (section : A → B) (readout : B → C)
    (hs : Function.Injective section)
    (hr : Function.Injective readout) :
    Function.Injective (readout ∘ section) :=
  hr.comp hs

#print axioms inclusion_survives_forward_map
#print axioms reverse_inclusion_requires_injectivity
#print axioms upstream_noninjectivity_survives_readout
#print axioms composed_injectivity_requires_both_maps

end HsHVerification.KestrelReadoutComposition
