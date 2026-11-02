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

/-!
## Aggregate-count non-identifiability

The next finite construction is a mathematical counterexample, not an
observed model sample. It represents an unordered agreeing pair once,
using i < j. Two different label partitions of six abstract members,
with block sizes 3+3 and 4+1+1, both produce six agreeing pairs, while
their numbers of label classes differ. Thus the scalar pair count cannot
recover the underlying agreement-cluster partition.
-/

/-- One representative of each unordered pair whose labels agree. -/
def agreementEdges6 (f : Fin 6 → Fin 3) : Finset (Fin 6 × Fin 6) :=
  Finset.univ.filter fun p => p.1 < p.2 ∧ f p.1 = f p.2

/-- Number of distinct observed label classes. -/
def labelClassCount6 (f : Fin 6 → Fin 3) : ℕ :=
  (Finset.univ.image f).card

/-- Two clusters of three members each. -/
def partition33 : Fin 6 → Fin 3 :=
  fun i => if i.val < 3 then 0 else 1

/-- One cluster of four plus two singleton classes. -/
def partition411 : Fin 6 → Fin 3 :=
  fun i => if i.val < 4 then 0 else if i.val = 4 then 1 else 2

theorem partition33_agreement_count :
    (agreementEdges6 partition33).card = 6 := by
  decide

theorem partition411_agreement_count :
    (agreementEdges6 partition411).card = 6 := by
  decide

theorem partition33_class_count :
    labelClassCount6 partition33 = 2 := by
  decide

theorem partition411_class_count :
    labelClassCount6 partition411 = 3 := by
  decide

/-- A single aggregate pair count does not identify the label partition. -/
theorem aggregate_pair_count_does_not_identify_partition :
    (agreementEdges6 partition33).card =
      (agreementEdges6 partition411).card ∧
    labelClassCount6 partition33 ≠ labelClassCount6 partition411 := by
  decide

#eval (agreementEdges6 partition33).card
#eval (agreementEdges6 partition411).card
#eval labelClassCount6 partition33
#eval labelClassCount6 partition411

#print axioms ordered_agreement_reindex
#print axioms unordered_agreement_reindex
#print axioms before_after_difference_reindex
#print axioms aggregate_pair_count_does_not_identify_partition

end HsHVerification.KestrelConsensusIdentityBlindness
