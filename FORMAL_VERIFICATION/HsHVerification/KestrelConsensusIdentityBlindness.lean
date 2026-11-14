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



/-!
## Lossless relational readout versus lossy scalar projection

The scalar agreement-edge count is a further compression of the
identity-labelled pair relation. The finite counterexample above proves
that this scalar is not injective over partitions.

The full pairwise equality relation has a different property: its fibers
recover the partition of model identities, independently of the names
assigned to the label classes. The next results make that reconstruction
map explicit. They concern only the mathematical partition induced by
recorded labels; they do not establish semantic correctness, independence,
causal influence, or any physical interpretation of the labels.
-/

/-- Identity-labelled pairwise agreement induced by a label map. -/
def identityAgreement (f : M → L) (i j : M) : Prop :=
  f i = f j

/-- Two label maps encode the same partition of model identities when
they induce the same pairwise equality relation. Class names may differ. -/
def sameIdentityPartition (f g : M → L) : Prop :=
  ∀ i j, identityAgreement f i j ↔ identityAgreement g i j

/-- The identity fiber containing i, recovered from the pairwise relation. -/
def identityFiber (f : M → L) (i : M) : Set M :=
  {j | identityAgreement f j i}

theorem identityAgreement_equivalence (f : M → L) :
    Equivalence (identityAgreement f) := by
  constructor
  · intro i
    rfl
  · intro i j hij
    exact hij.symm
  · intro i j k hij hjk
    exact hij.trans hjk

theorem sameIdentityPartition_refl (f : M → L) :
    sameIdentityPartition f f := by
  intro i j
  rfl

theorem sameIdentityPartition_symm (f g : M → L)
    (h : sameIdentityPartition f g) :
    sameIdentityPartition g f := by
  intro i j
  exact (h i j).symm

theorem sameIdentityPartition_trans (f g k : M → L)
    (hfg : sameIdentityPartition f g)
    (hgk : sameIdentityPartition g k) :
    sameIdentityPartition f k := by
  intro i j
  exact (hfg i j).trans (hgk i j)

/-- Equal identity-labelled relations give exactly equal membership
fibers, hence the same blocks of the induced partition. -/
theorem identityFiber_eq_of_sameIdentityPartition
    (f g : M → L)
    (h : sameIdentityPartition f g)
    (i : M) :
    identityFiber f i = identityFiber g i := by
  ext j
  exact h j i

/-- The full pairwise equality relation is sufficient to recover every
identity fiber, and equality of all fibers is sufficient to recover that
relation. This is the lossless partition readout missing from a scalar
agreement count. -/
theorem sameIdentityPartition_iff_identityFibers
    (f g : M → L) :
    sameIdentityPartition f g ↔
      ∀ i, identityFiber f i = identityFiber g i := by
  constructor
  · intro h i
    exact identityFiber_eq_of_sameIdentityPartition f g h i
  · intro h i j
    constructor
    · intro hij
      have hm : j ∈ identityFiber f i := by
        change f j = f i
        exact hij.symm
      have hm' : j ∈ identityFiber g i := by
        rw [← h i]
        exact hm
      change g j = g i at hm'
      exact hm'.symm
    · intro hij
      have hm : j ∈ identityFiber g i := by
        change g j = g i
        exact hij.symm
      have hm' : j ∈ identityFiber f i := by
        rw [h i]
        exact hm
      change f j = f i at hm'
      exact hm'.symm

/-- A pure relabeling preserves the partition even though the label values
change. -/
def partition33Relabelled : Fin 6 → Fin 3 :=
  fun i => if i.val < 3 then 2 else 0

/-- Explicit executable enumeration of the already-declared Fin 6 domain. -/
def fin6Indices : List (Fin 6) := [0, 1, 2, 3, 4, 5]

/-- Computable finite check of pairwise identity-partition equality on Fin 6.
The list is the concrete enumeration of the existing six-element domain;
the predicate compares decidable label equalities directly. -/
def sameIdentityPartitionBool6 (f g : Fin 6 → Fin 3) : Bool :=
  fin6Indices.all fun i =>
    fin6Indices.all fun j =>
      (decide (f i = f j)) == (decide (g i = g j))

#eval sameIdentityPartitionBool6 partition33 partition33Relabelled
#eval sameIdentityPartitionBool6 partition33 partition411

#print axioms identityAgreement_equivalence
#print axioms sameIdentityPartition_refl
#print axioms sameIdentityPartition_symm
#print axioms sameIdentityPartition_trans
#print axioms identityFiber_eq_of_sameIdentityPartition
#print axioms sameIdentityPartition_iff_identityFibers

end HsHVerification.KestrelConsensusIdentityBlindness
