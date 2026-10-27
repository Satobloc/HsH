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


/-!
## Historical SAT-X internal-phase 2π claim: source-fidelity check

SAT_THEORY_ARCHIVE_2023-25/SAT X/SATx CANONICAL.txt,
Git blob afbf610347a6a39c74cf52cbe3818ef22ab3ebcf,
Module 4 (internal phase) defines Ψ = exp(i ψ) φ and states that a
2π shift of ψ flips the sign of Ψ. The equations as written instead
have a full-turn period if φ is unchanged. A π shift gives a minus sign.

Module 1 of the same source separately uses ψ as a noncompact
time-flow rapidity, so the two uses must not be identified without a
typed map. These are mathematics/source-fidelity theorems, NOT a proof
of any physical spin mechanism, and they do not rule out an explicitly
specified nontrivial monodromy of φ.
-/

namespace HsHVerification

theorem internalPhase_fullTurn (z : ℂ) :
    Complex.exp (z + (2 * (Real.pi : ℂ) * Complex.I)) = Complex.exp z := by
  rw [Complex.exp_add, Complex.exp_two_pi_mul_I, mul_one]

theorem internalPhase_fullTurn_envelope (z envelope : ℂ) :
    Complex.exp (z + (2 * (Real.pi : ℂ) * Complex.I)) * envelope =
      Complex.exp z * envelope := by
  rw [internalPhase_fullTurn]

theorem internalPhase_halfTurn (z : ℂ) :
    Complex.exp (z + ((Real.pi : ℂ) * Complex.I)) = -Complex.exp z := by
  exact Complex.exp_add_pi_mul_I z

#print axioms internalPhase_fullTurn
#print axioms internalPhase_fullTurn_envelope
#print axioms internalPhase_halfTurn

end HsHVerification
