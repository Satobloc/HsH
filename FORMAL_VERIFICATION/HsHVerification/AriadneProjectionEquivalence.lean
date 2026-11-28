import Mathlib

/-!
# Ariadne: common-carrier projection equivalence

Two candidate representations of the same source carrier are comparable only
through explicit maps.  This file formalizes the exact linear criterion for
an invertible correspondence that makes two surjective projections commute:
their kernels must agree.

This is a standard first-isomorphism result.  It supplies a verification gate
for proposed projection maps; it does not supply any physical map, select an
ontology, or establish that a physical system is linear.
-/

namespace HsHVerification.AriadneProjectionEquivalence

variable {K V A B : Type*}
variable [Field K]
variable [AddCommGroup V] [Module K V]
variable [AddCommGroup A] [Module K A]
variable [AddCommGroup B] [Module K B]

/-- An invertible linear correspondence that intertwines two maps from a
common carrier forces their discarded directions (kernels) to agree. -/
theorem intertwining_equiv_implies_kernel_eq
    (q₁ : V →ₗ[K] A) (q₂ : V →ₗ[K] B)
    (e : A ≃ₗ[K] B)
    (h : e.toLinearMap.comp q₁ = q₂) :
    LinearMap.ker q₁ = LinearMap.ker q₂ := by
  ext x
  simp only [LinearMap.mem_ker]
  constructor
  · intro hx
    have hcomp := congrArg (fun f : V →ₗ[K] B => f x) h
    change e (q₁ x) = q₂ x at hcomp
    simpa [hx] using hcomp.symm
  · intro hx
    have hcomp := congrArg (fun f : V →ₗ[K] B => f x) h
    change e (q₁ x) = q₂ x at hcomp
    have hz : e (q₁ x) = e 0 := by
      simpa [hx] using hcomp
    exact e.injective hz

/-- Canonical equivalence between the codomains, when both maps are
surjective and have the same kernel. -/
noncomputable def inducedEquivOfEqualKernels
    (q₁ : V →ₗ[K] A) (q₂ : V →ₗ[K] B)
    (hq₁ : Function.Surjective q₁)
    (hq₂ : Function.Surjective q₂)
    (hker : LinearMap.ker q₁ = LinearMap.ker q₂) :
    A ≃ₗ[K] B :=
  (q₁.quotKerEquivOfSurjective hq₁).symm.trans
    ((LinearMap.ker q₁).quotEquivOfEq (LinearMap.ker q₂) hker).trans
      (q₂.quotKerEquivOfSurjective hq₂)

/-- The induced equivalence makes the two projections commute. -/
theorem inducedEquivOfEqualKernels_commutes
    (q₁ : V →ₗ[K] A) (q₂ : V →ₗ[K] B)
    (hq₁ : Function.Surjective q₁)
    (hq₂ : Function.Surjective q₂)
    (hker : LinearMap.ker q₁ = LinearMap.ker q₂) :
    (inducedEquivOfEqualKernels q₁ q₂ hq₁ hq₂ hker).toLinearMap.comp q₁ = q₂ := by
  ext x
  simp [inducedEquivOfEqualKernels]

/-- For surjective maps from one carrier, an intertwining linear equivalence
exists exactly when the two maps discard the same directions. -/
theorem exists_intertwining_equiv_iff_kernel_eq
    (q₁ : V →ₗ[K] A) (q₂ : V →ₗ[K] B)
    (hq₁ : Function.Surjective q₁)
    (hq₂ : Function.Surjective q₂) :
    (∃ e : A ≃ₗ[K] B, e.toLinearMap.comp q₁ = q₂) ↔
      LinearMap.ker q₁ = LinearMap.ker q₂ := by
  constructor
  · rintro ⟨e, he⟩
    exact intertwining_equiv_implies_kernel_eq q₁ q₂ e he
  · intro hker
    exact ⟨inducedEquivOfEqualKernels q₁ q₂ hq₁ hq₂ hker,
      inducedEquivOfEqualKernels_commutes q₁ q₂ hq₁ hq₂ hker⟩

/-- If two surjective projections discard different directions, no
intertwining linear equivalence can identify their representations. -/
theorem no_intertwining_equiv_of_kernel_ne
    (q₁ : V →ₗ[K] A) (q₂ : V →ₗ[K] B)
    (hq₁ : Function.Surjective q₁)
    (hq₂ : Function.Surjective q₂)
    (hker : LinearMap.ker q₁ ≠ LinearMap.ker q₂) :
    ¬ ∃ e : A ≃ₗ[K] B, e.toLinearMap.comp q₁ = q₂ := by
  intro h
  exact hker
    (exists_intertwining_equiv_iff_kernel_eq q₁ q₂ hq₁ hq₂ |>.mp h)

#print axioms intertwining_equiv_implies_kernel_eq
#print axioms exists_intertwining_equiv_iff_kernel_eq
#print axioms no_intertwining_equiv_of_kernel_ne

end HsHVerification.AriadneProjectionEquivalence
