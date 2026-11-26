import Mathlib

/-!
Partial-map domain gate for comparing composed geometry-to-observable routes.

A comparison on the intersection of two partial-map domains is only a
comparison on that restricted intersection. It does not establish that the
two routes are equally defined on the source-supported configuration space.
The finite Bool witness below is purely logical, not a physical fixture.
-/

namespace HsHVerification.PartialMapDomainGate

/-- The source points on which a partial map actually returns a value. -/
def partialDomain {α β : Type*} (f : α → Option β) : Set α :=
  {x | (f x).isSome}

def everywhereDefined : Bool → Option Unit := fun _ => some ()
def trueOnly : Bool → Option Unit := fun b => if b then some () else none

/-- Extensional equality of partial maps requires both equal definedness
    domains and equal values wherever the maps are defined. -/
theorem partialMap_ext_iff_domain_and_values
    {α β : Type*} (f g : α → Option β) :
    f = g ↔
      partialDomain f = partialDomain g ∧
      ∀ x, x ∈ partialDomain f → f x = g x := by
  constructor
  · intro h
    subst g
    exact ⟨rfl, by intro x hx; rfl⟩
  · rintro ⟨hdom, hval⟩
    funext x
    by_cases hx : x ∈ partialDomain f
    · exact hval x hx
    · have hy : x ∉ partialDomain g := by
        rw [← hdom]
        exact hx
      have hf : f x = none := by
        cases hfx : f x with
        | none => rfl
        | some y => simp [partialDomain, hfx] at hx
      have hg : g x = none := by
        cases hgx : g x with
        | none => rfl
        | some y => simp [partialDomain, hgx] at hy
      rw [hf, hg]

/-- Agreement wherever both routes are defined does not imply equality of
    the partial maps: one route may silently exclude source states. -/
theorem common_domain_agreement_does_not_imply_partial_map_equality :
    (∀ x, x ∈ partialDomain everywhereDefined →
      x ∈ partialDomain trueOnly →
      everywhereDefined x = trueOnly x) ∧
    partialDomain everywhereDefined ≠ partialDomain trueOnly := by
  constructor
  · intro x _ hx
    cases x with
    | false => simp [partialDomain, trueOnly] at hx
    | true => rfl
  · intro hdom
    have hfalse : false ∈ partialDomain everywhereDefined := by
      simp [partialDomain, everywhereDefined]
    have hfalse' : false ∈ partialDomain trueOnly := by
      rw [← hdom]
      exact hfalse
    simp [partialDomain, trueOnly] at hfalse'

end HsHVerification.PartialMapDomainGate
