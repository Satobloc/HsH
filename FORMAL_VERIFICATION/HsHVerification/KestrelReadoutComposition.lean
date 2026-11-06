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
    (sliceMap : A → B) (readout : B → C)
    (h : ¬ Function.Injective sliceMap) :
    ¬ Function.Injective (readout ∘ sliceMap) := by
  intro hcomposed
  apply h
  intro x y hxy
  apply hcomposed
  exact congrArg readout hxy

/--
Exact condition for an injective composite: the upstream map is injective,
and the downstream readout is injective only on the range actually reached
by the upstream map. Global injectivity of the readout is stronger than
necessary.
-/
theorem composed_injectivity_iff_range_restriction
    (sliceMap : A → B) (readout : B → C) :
    Function.Injective (readout ∘ sliceMap) ↔
      Function.Injective sliceMap ∧
      Function.Injective (fun b : Set.range sliceMap => readout b.1) := by
  constructor
  · intro h
    constructor
    · intro x y hxy
      apply h
      exact congrArg readout hxy
    · intro b₁ b₂ hread
      rcases b₁.property with ⟨x, hx⟩
      rcases b₂.property with ⟨y, hy⟩
      have hxy : x = y := h <| by
        calc
          (readout ∘ sliceMap) x = readout (sliceMap x) := rfl
          _ = readout b₁.1 := congrArg readout hx
          _ = readout b₂.1 := hread
          _ = readout (sliceMap y) := congrArg readout hy.symm
          _ = (readout ∘ sliceMap) y := rfl
      apply Subtype.ext
      calc
        b₁.1 = sliceMap x := hx.symm
        _ = sliceMap y := congrArg sliceMap hxy
        _ = b₂.1 := hy
  · rintro ⟨hs, hr⟩ x y hxy
    apply hs
    have hsub :
        (⟨sliceMap x, ⟨x, rfl⟩⟩ : Set.range sliceMap) =
          ⟨sliceMap y, ⟨y, rfl⟩⟩ := hr hxy
    exact congrArg Subtype.val hsub

/-- Two globally injective maps compose to an injective readout.
This is a convenient sufficient condition; the iff theorem above is exact. -/
theorem composed_injectivity_requires_both_maps
    (sliceMap : A → B) (readout : B → C)
    (hs : Function.Injective sliceMap)
    (hr : Function.Injective readout) :
    Function.Injective (readout ∘ sliceMap) :=
  hr.comp hs

#print axioms inclusion_survives_forward_map
#print axioms reverse_inclusion_requires_injectivity
#print axioms upstream_noninjectivity_survives_readout
#print axioms composed_injectivity_requires_both_maps
#print axioms composed_injectivity_iff_range_restriction

end HsHVerification.KestrelReadoutComposition
