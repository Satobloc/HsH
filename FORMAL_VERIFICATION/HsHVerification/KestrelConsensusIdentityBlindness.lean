import Mathlib

/-!
Kestrel Review-MIND: the observation map that counts equal extracted labels
over ALL unordered model pairs is blind to the names assigned to models.
Motivation: actual 17-model ConsistencyBench CGD archive, 1,150 matched
question occurrences, source-locked replay of 2026-10-29.
This is a general mathematical theorem conditional on a finite model set.
It does NOT assert the source labels are semantically true, nor that model
responses are independent, nor that a real checker caused agreement.
-/

namespace HsHVerification.KestrelConsensusIdentityBlindness

universe u v

variable {M : Type u} {L : Type v}

/-- Ordered distinct model pairs with exactly equal observed labels. -/
abbrev AgreePair (f : M → L) : Type _ :=
  {p : M × M // p.1 ≠ p.2 ∧ f p.1 = f p.2}

/-- Reassigning model identities bijectively preserves the set of
matching pairs up to an explicit bijection. -/
def reindexAgreePairs (f : M → L) (σ : Equiv.Perm M) :
    AgreePair (fun i => f (σ i)) ≃ AgreePair f where
  toFun p := ⟨(σ p.val.1, σ p.val.2), by
    constructor
    · intro heq
      exact p.property.1 (σ.injective heq)
    · exact p.property.2⟩
  invFun p := ⟨(σ.symm p.val.1, σ.symm p.val.2), by
    constructor
    · intro heq
      exact p.property.1 (σ.symm.injective heq)
    · simpa using p.property.2⟩
  left_inv := by
    intro p
    apply Subtype.ext
    apply Prod.ext <;> simp
  right_inv := by
    intro p
    apply Subtype.ext
    apply Prod.ext <;> simp

/-- The cardinality of matching ordered pairs is invariant under any
bijective, potentially question-dependent model-name reassignment. -/
theorem ordered_agreement_reindex [Fintype M] [DecidableEq M] [DecidableEq L]
    (f : M → L) (σ : Equiv.Perm M) :
    Fintype.card (AgreePair (fun i => f (σ i))) =
      Fintype.card (AgreePair f) := by
  classical
  exact Fintype.card_congr (reindexAgreePairs f σ)

/-- Each unordered agreeing pair is represented twice by AgreePair. -/
noncomputable def unorderedAgreement [Fintype M] [DecidableEq M] [DecidableEq L]
    (f : M → L) : ℕ :=
  Fintype.card (AgreePair f) / 2

theorem unordered_agreement_reindex [Fintype M] [DecidableEq M] [DecidableEq L]
    (f : M → L) (σ : Equiv.Perm M) :
    unorderedAgreement (fun i => f (σ i)) =
      unorderedAgreement f := by
  unfold unorderedAgreement
  rw [ordered_agreement_reindex f σ]

/-- Even the before/after difference is blind to a common relabeling
of model identities; no causal or semantic inference follows. -/
theorem before_after_difference_reindex [Fintype M] [DecidableEq M] [DecidableEq L]
    (initial final : M → L) (σ : Equiv.Perm M) :
    unorderedAgreement (fun i => initial (σ i)) -
      unorderedAgreement (fun i => final (σ i)) =
    unorderedAgreement initial - unorderedAgreement final := by
  rw [unordered_agreement_reindex initial σ,
      unordered_agreement_reindex final σ]

#print axioms ordered_agreement_reindex
#print axioms unordered_agreement_reindex
#print axioms before_after_difference_reindex

end HsHVerification.KestrelConsensusIdentityBlindness
