import Mathlib

/-!
# Mira: source-typed graph of a parametrized time-flow field

Historical assistant-produced source:
SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SATO-BLOCK Hamiltonian and Hilbert Space.txt
blob 13b6da983ea8dcad5509b1c6941b8855a2653677.

The source says the 1+1-dimensional minimal model parametrizes u via a
rapidity psi, yet later writes a Hilbert tensor factor H_psi ⊗ H_u.
This module proves only that a parametrized pair (psi, f psi) is a
graph in the product, not the unconstrained Cartesian product.
If the full model assigns independent degrees of freedom to psi and u,
the graph premise does not apply; an explicit map is then required.

No quantum Hilbert-space construction, Dirac bracket, physical model,
original author attribution or empirical observation is proved here.
-/

namespace HsHVerification

universe u v

def rapidityGraph {A : Type u} {B : Type v} (f : A → B) (a : A) : A × B :=
  (a, f a)

theorem rapidityGraph_injective {A : Type u} {B : Type v} (f : A → B) :
    Function.Injective (rapidityGraph f) := by
  intro a b h
  exact congrArg Prod.fst h

theorem rapidityGraph_range_iff {A : Type u} {B : Type v}
    (f : A → B) (a : A) (b : B) :
    (a, b) ∈ Set.range (rapidityGraph f) ↔ b = f a := by
  constructor
  · rintro ⟨x, hx⟩
    have hxa : x = a := congrArg Prod.fst hx
    have hxb : f x = b := congrArg Prod.snd hx
    simpa [hxa] using hxb.symm
  · intro h
    exact ⟨a, by simp [rapidityGraph, h]⟩

theorem rapidityGraph_surjective_forces_subsingleton
    {A : Type u} {B : Type v} [Nonempty A] (f : A → B)
    (h : Function.Surjective (rapidityGraph f)) :
    Subsingleton B := by
  classical
  refine ⟨?_⟩
  intro b₁ b₂
  let a : A := Classical.choice inferInstance
  obtain ⟨x, hx⟩ := h (a, b₁)
  obtain ⟨y, hy⟩ := h (a, b₂)
  have hxa : x = a := congrArg Prod.fst hx
  have hya : y = a := congrArg Prod.fst hy
  have hfb1 : f x = b₁ := congrArg Prod.snd hx
  have hfb2 : f y = b₂ := congrArg Prod.snd hy
  calc
    b₁ = f x := hfb1.symm
    _ = f a := by rw [hxa]
    _ = f y := by rw [hya]
    _ = b₂ := hfb2

#print axioms rapidityGraph_injective
#print axioms rapidityGraph_range_iff
#print axioms rapidityGraph_surjective_forces_subsingleton

end HsHVerification
