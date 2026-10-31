import Mathlib

/-!
# Ravel: minimal carrier / timesheet readout

This module formalizes a source-conditioned, set-level interface only.

Direct geometric anchors:
* SAT archive raw conversation "DIMENSIONAL GRAVITY", Git blob
  `2cea1924266418e19b825b95ae51e6b7cbace7e1`, conversation
  `252d05c0-22ed-4ea2-a474-7966ab13145a`.
* HsH raw conversation "Meridian Free Build", Git blob
  `7af1561b321f4d9364da5eb111df689efc652827`, conversation
  `6ac45d1f-17b0-83ea-ad1f-fa524602378b`.

The 2024 static/moving-plane construction is explicitly Nathan's abstraction
and heuristic, not an assertion of the universe's physical ontology
(`DIMENSIONAL GRAVITY`, user message
`aaa26f3d-e831-49cd-976e-a85c5e3b749d`, 2024-03-23T03:44:26Z).

The 2026 direct source distinguishes a 4D filament from its 3D intersectional
trace, places the proposed approximately 0.7 fm scale at a first-order coil
radius rather than filament thickness, and describes the time object as an
interacting 3D bulk/slice rather than a passive cut (`Meridian Free Build`,
user messages `3c657387-b80b-4982-a61a-8e6d8568b8d1`,
`5a929b5e-515e-4f77-a32a-e49feef42812`, and
`1178f25c-9f92-4d1c-b43b-06482e6bf1b1`).

The theorems below formalize only a conditional, set-level support
intersection. They do not model the physical interaction/response operator,
parametrize a 4D worldtube, choose a metric signature or coordinate
normalization, prove smooth transversality, or derive an action. In
particular, neither historical `w = ct` nor later `cw = t` is encoded here.
The `Medium` and `Provenance` parameters remain deliberately opaque slots.

The O3 algebraic audit is conditional: it assumes the pairing is both
symmetric and skew-symmetric. The standard oriented linking number in an
oriented 3-manifold is symmetric; that topological premise is not proved here.
-/

namespace HsHVerification.RavelCarrierSliceReconstruction

universe u v w p

/-- Minimal set-level carrier/timesheet/optional-medium/provenance record.
    `core` and `sheets` are support sets in an ambient point type `M`.
    They are not parametrizations, boundaries, or a smooth/metric structure. -/
structure MinimalCarrierReadout (M : Type u) (I : Type v)
    (Medium : Type w) (Provenance : Type p) where
  core : Set M
  sheets : I → Set M
  medium : Option Medium
  provenance : Provenance

namespace MinimalCarrierReadout

variable {M : Type u} {I : Type v} {Medium : Type w} {Provenance : Type p}
variable (S : MinimalCarrierReadout M I Medium Provenance)

/-- Bare set-theoretic support intersection with one labelled time-bulk
    section. This is not the physical response/readout operator. -/
def sectionAt (i : I) : Set M :=
  S.core ∩ S.sheets i

/-- Complete coverage of the candidate core by the labelled sheet family. -/
def sheetsCoverCore : Prop :=
  S.core ⊆ ⋃ i, S.sheets i

/-- If the sheets cover the core, their labelled sections reconstruct it as a set. -/
theorem completeSectionsRecoverCore
    (hcover : S.core ⊆ ⋃ i, S.sheets i) :
    S.core = ⋃ i, S.sectionAt i := by
  ext x
  constructor
  · intro hx
    rcases Set.mem_iUnion.mp (hcover hx) with ⟨i, hi⟩
    exact Set.mem_iUnion.mpr ⟨i, ⟨hx, hi⟩⟩
  · intro hx
    rcases Set.mem_iUnion.mp hx with ⟨i, hxi⟩
    exact hxi.1

end MinimalCarrierReadout

/-- Two candidate carriers have the same labelled readout when every
    corresponding timesheet section agrees. -/
def SameReadout {M : Type u} {I : Type v}
    (sheets : I → Set M) (A B : Set M) : Prop :=
  ∀ i, A ∩ sheets i = B ∩ sheets i

/-- Equal readouts determine equal supports when the sheets cover both candidates. -/
theorem sameReadoutDeterminesCarrierIfCovered
    {M : Type u} {I : Type v} (sheets : I → Set M)
    (A B : Set M)
    (hcover : A ∪ B ⊆ ⋃ i, sheets i)
    (hreadout : SameReadout sheets A B) :
    A = B := by
  ext x
  constructor
  · intro hx
    rcases Set.mem_iUnion.mp (hcover (Or.inl hx)) with ⟨i, hi⟩
    have hmem : x ∈ B ∩ sheets i := by
      rw [← hreadout i]
      exact ⟨hx, hi⟩
    exact hmem.1
  · intro hx
    rcases Set.mem_iUnion.mp (hcover (Or.inr hx)) with ⟨i, hi⟩
    have hmem : x ∈ A ∩ sheets i := by
      rw [hreadout i]
      exact ⟨hx, hi⟩
    exact hmem.1

/-- If an ambient point is absent from every sheet, the *bare set-intersection*
    map on all candidate supports is non-injective: `univ` and `univ \ {x}`
    agree. This does not establish injectivity or non-injectivity of an
    additional physical response operator. -/
theorem readoutNoninjectiveIfUncovered
    {M : Type u} {I : Type v} (sheets : I → Set M)
    (x : M) (hx : x ∉ ⋃ i, sheets i) :
    ¬ Function.Injective (fun A : Set M => fun i => A ∩ sheets i) := by
  intro hinj
  have hSame :
      (fun i => (Set.univ : Set M) ∩ sheets i) =
      (fun i => (Set.univ \ {x}) ∩ sheets i) := by
    funext i
    ext y
    constructor
    · intro hy
      have hyx : y ≠ x := by
        intro hEq
        apply hx
        exact Set.mem_iUnion.mpr ⟨i, by simpa [hEq] using hy.2⟩
      exact ⟨⟨Set.mem_univ y, by simpa using hyx⟩, hy.2⟩
    · intro hy
      exact ⟨Set.mem_univ y, hy.2⟩
  have hEq : (Set.univ : Set M) = Set.univ \ {x} :=
    hinj hSame
  have hxIn : x ∈ (Set.univ \ {x}) := by
    rw [← hEq]
    exact Set.mem_univ x
  exact hxIn.2 (by simp)

/-- Slice readout distributes over a union of labelled components. The
    index is retained in the family; plain union alone forgets multiplicity. -/
theorem sectionDistributesOverComposition
    {M : Type u} {I : Type v} {J : Type w}
    (components : J → Set M) (sheets : I → Set M) (i : I) :
    (⋃ j, components j) ∩ sheets i =
      ⋃ j, components j ∩ sheets i := by
  ext x
  constructor
  · intro hx
    rcases Set.mem_iUnion.mp hx.1 with ⟨j, hj⟩
    exact Set.mem_iUnion.mpr ⟨j, ⟨hj, hx.2⟩⟩
  · intro hx
    rcases Set.mem_iUnion.mp hx with ⟨j, hj⟩
    exact ⟨Set.mem_iUnion.mpr ⟨j, hj.1⟩, hj.2⟩

/-- Relabelling the timesheet index by an equivalence does not change
    the observational equivalence relation. This is index covariance,
    not a claim about physical gauge symmetry. -/
theorem sameReadoutInvariantUnderIndexEquiv
    {M : Type u} {I : Type v} {J : Type w}
    (e : I ≃ J) (sheets : I → Set M) (A B : Set M) :
    SameReadout sheets A B ↔
      SameReadout (fun j => sheets (e.symm j)) A B := by
  constructor
  · intro h j
    exact h (e.symm j)
  · intro h i
    simpa using h (e i)

/-- Conventional Poincare-dual degree bookkeeping in an oriented 4-manifold:
    a k-dimensional carrier has current degree 4-k. These arithmetic lemmas
    do not prove Poincare duality or identify any archived current. -/
def pdDegree (carrierDimension : Nat) : Nat := 4 - carrierDimension

theorem lineCarrierHasThreeFormDegree : pdDegree 1 = 3 := by decide
theorem worldsheetCarrierHasTwoFormDegree : pdDegree 2 = 2 := by decide
theorem hypersurfaceCarrierHasOneFormDegree : pdDegree 3 = 1 := by decide
theorem fullCoreRegionHasZeroFormDegree : pdDegree 4 = 0 := by decide

namespace O3LinkingBracket

/-- An integer-valued pairing that is both symmetric and skew-symmetric
    vanishes identically. This audits the simultaneous symmetry/antisymmetry
    requirements in the unbylined SAT-O3 PDF under the standard linking-number
    convention; the topological symmetry premise remains external. -/
theorem symmetricAndSkewIntegerPairingIsZero
    {α : Type*} (L : α → α → ℤ)
    (hSymm : ∀ a b, L a b = L b a)
    (hSkew : ∀ a b, L a b = - L b a) :
    ∀ a b, L a b = 0 := by
  intro a b
  have h : L a b = - L a b := by
    calc
      L a b = L b a := hSymm a b
      _ = - L a b := hSkew b a
  omega

/-- A nonzero symmetric integer pairing cannot also satisfy the
    antisymmetry required of a Lie bracket. -/
theorem nonzeroSymmetricPairingNotSkew
    {α : Type*} (L : α → α → ℤ)
    (hSymm : ∀ a b, L a b = L b a)
    (a b : α) (hNonzero : L a b ≠ 0) :
    ¬ (∀ x y, L x y = - L y x) := by
  intro hSkew
  have hzero := symmetricAndSkewIntegerPairingIsZero L hSymm hSkew
  exact hNonzero (hzero a b)

end O3LinkingBracket

#print axioms MinimalCarrierReadout.completeSectionsRecoverCore
#print axioms sameReadoutDeterminesCarrierIfCovered
#print axioms readoutNoninjectiveIfUncovered
#print axioms sectionDistributesOverComposition
#print axioms sameReadoutInvariantUnderIndexEquiv
#print axioms lineCarrierHasThreeFormDegree
#print axioms worldsheetCarrierHasTwoFormDegree
#print axioms hypersurfaceCarrierHasOneFormDegree
#print axioms fullCoreRegionHasZeroFormDegree
#print axioms O3LinkingBracket.symmetricAndSkewIntegerPairingIsZero
#print axioms O3LinkingBracket.nonzeroSymmetricPairingNotSkew

end HsHVerification.RavelCarrierSliceReconstruction
