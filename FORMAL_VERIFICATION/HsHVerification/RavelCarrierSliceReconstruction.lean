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

/-- Minimal set-level carrier/timesheet/separate-medium-representation/provenance record.
    `core` and `sheets` are support sets in an ambient point type `M`.
    They are not parametrizations, boundaries, or a smooth/metric structure.
    The optional `medium` slot records whether a separate medium state is
    represented. Its absence does not license dropping the current tentative
    response-mechanism constraint in BEDROCK; this set-level module does not
    formalize that constraint or its constitutive map. -/
structure MinimalCarrierReadout (M : Type u) (I : Type v)
    (Medium : Type w) (Provenance : Type p) where
  core : Set M
  sheets : I → Set M
  /-- Optional separate medium representation; not an optional response constraint. -/
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


/-!
## Time-indexed spatial support and history projection

This is a set-level encoding of a persistent spatial cross-section. It
does not assume continuity, manifold structure, a metric, an expansion
law, or a physical response operator. In particular, it does not prove
an intrinsic dimension for the history; it only makes the time label and
the spatial projection explicit.
-/

namespace HsHVerification.RavelCarrierSliceReconstruction

/-- The graph of a time-indexed family of spatial supports. -/
def historyGraph {X : Type u} {T : Type v}
    (support : T → Set X) : Set (X × T) :=
  {p | p.1 ∈ support p.2}

/-- A time-labelled event belonging to a spatial support history. -/
def historyPoint {X : Type u} {T : Type v}
    (support : T → Set X) :=
  {p : X × T // p.1 ∈ support p.2}

/-- Projection from a history event to its spatial coordinate. -/
def historySpatialProjection {X : Type u} {T : Type v}
    (support : T → Set X) : historyPoint support → X :=
  fun p => p.val.1

/-- Projection from a history event to its time label. -/
def historyTimeProjection {X : Type u} {T : Type v}
    (support : T → Set X) : historyPoint support → T :=
  fun p => p.val.2

/-- The spatial slice of a history graph at time t. -/
def historySlice {X : Type u} {T : Type v}
    (support : T → Set X) (t : T) : Set X :=
  {x | (x, t) ∈ historyGraph support}

/-- Each time slice of the history graph recovers the original support. -/
theorem historySlice_eq_support {X : Type u} {T : Type v}
    (support : T → Set X) (t : T) :
    historySlice support t = support t := by
  ext x
  rfl

/-- If the same spatial point belongs to the support at two distinct times,
the spatial projection of history events is not injective. Time therefore
cannot be discarded without losing event identity. -/
theorem historySpatialProjection_noninjective_of_persistence
    {X : Type u} {T : Type v}
    (support : T → Set X) (x : X) (t1 t2 : T)
    (hx1 : x ∈ support t1) (hx2 : x ∈ support t2)
    (ht : t1 ≠ t2) :
    ¬ Function.Injective (historySpatialProjection support) := by
  intro hinj
  have hproj :
      historySpatialProjection support ⟨(x, t1), hx1⟩ =
      historySpatialProjection support ⟨(x, t2), hx2⟩ := rfl
  have heq :
      (⟨(x, t1), hx1⟩ : historyPoint support) =
      ⟨(x, t2), hx2⟩ := hinj hproj
  exact ht (congrArg (historyTimeProjection support) heq)

#print axioms historySlice_eq_support
#print axioms historySpatialProjection_noninjective_of_persistence

end HsHVerification.RavelCarrierSliceReconstruction


/-!
## Product-space persistence dimension

A finite-dimensional real spatial vector space crossed with one real
persistence coordinate has one additional vector-space dimension. This is
a product-space theorem only; it does not prove that a physical support
history is a product manifold or that its evolution is regular.
-/

namespace HsHVerification.RavelCarrierSliceReconstruction

/-- A finite-dimensional real carrier crossed with one real time coordinate
has dimension one greater. -/
theorem product_with_time_line_adds_one_dimension
    (V : Type u) [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V] :
    Module.finrank ℝ (V × ℝ) = Module.finrank ℝ V + 1 := by
  rw [Module.finrank_prod]
  simp

#print axioms product_with_time_line_adds_one_dimension

end HsHVerification.RavelCarrierSliceReconstruction


/-!
## Fibered support and explicit timesheet pullback

This is a generic set-level interface for a parameter-indexed family of
fibers embedded in an ambient type and a second embedded support (for
example, a labelled timesheet). The base parameter is deliberately not
identified with physical time. No manifold, metric, regularity,
transversality, injectivity, or physical response law is assumed.

The pullback retains pairs of parameter-space and sheet-space
representatives. Its ambient image is the set intersection; that image
forgets multiplicity when distinct representatives map to the same
ambient point.
-/

namespace HsHVerification.RavelCarrierSliceReconstruction

universe u₁ v₁ w₁ z₁

/-- A support carried by a parameter-indexed family of fibers and mapped
into one common ambient type. -/
structure FiberedSupport (Ambient : Type u₁) (Base : Type v₁) where
  Fiber : Base → Type w₁
  embed : (b : Base) → Fiber b → Ambient

namespace FiberedSupport

variable {Ambient : Type u₁} {Base : Type v₁}
variable (T : FiberedSupport Ambient Base)

/-- The total space of the parameter-indexed family of fibers. -/
abbrev TotalSpace := Sigma T.Fiber

/-- Map from the total fiber space into the ambient type. -/
def toAmbient : T.TotalSpace → Ambient :=
  fun p => T.embed p.1 p.2

/-- Projection from the total fiber space to its base parameter. -/
def baseProjection : T.TotalSpace → Base := Sigma.fst

/-- Ambient image of the fiber over one base parameter. -/
def fiberImage (b : Base) : Set Ambient := Set.range (T.embed b)

/-- The tube image is the union of its parameter-indexed fiber images. -/
theorem totalImage_eq_iUnion_fiberImage :
    Set.range T.toAmbient = ⋃ b, T.fiberImage b := by
  ext x
  constructor
  · rintro ⟨⟨b, f⟩, rfl⟩
    exact Set.mem_iUnion.mpr ⟨b, ⟨f, rfl⟩⟩
  · intro hx
    rcases Set.mem_iUnion.mp hx with ⟨b, hb⟩
    rcases hb with ⟨f, hf⟩
    exact ⟨⟨b, f⟩, hf⟩


/-!
## Recovering the filament parameter from the ambient support

FiberedSupport retains a base label in its total space. That label
descends to a single-valued function of the ambient point exactly when
distinct fiber images are disjoint. If two differently labelled sections
overlap, an ambient point alone cannot recover which filament parameter
produced it; a quotient, multivalued relation, or additional state is
required.

This is a set-level identifiability criterion. It does not assert that any
source-defined Kerr sections are disjoint or overlapping, nor does it
supply a physical sweep map.
-/

/-- Distinct base labels have disjoint ambient fiber images. -/
def fiberImagesPairwiseDisjoint
    (T : FiberedSupport Ambient Base) : Prop :=
  ∀ ⦃b₁ b₂ : Base⦄ ⦃x : Ambient⦄,
    x ∈ T.fiberImage b₁ →
    x ∈ T.fiberImage b₂ →
    b₁ = b₂

/-- The total-space base projection descends to a single-valued function
    on the ambient image of the fibered support. -/
def baseProjectionDescends
    (T : FiberedSupport Ambient Base) : Prop :=
  ∃ π : Set.range T.toAmbient → Base,
    ∀ p : T.TotalSpace,
      π ⟨T.toAmbient p, ⟨p, rfl⟩⟩ = T.baseProjection p

/-- An ambient point determines its base label exactly when differently
    labelled fiber images are pairwise disjoint. This is the global
    single-valuedness condition for recovering a filament parameter from
    a worldtube point. -/
theorem baseProjectionDescends_iff_fiberImagesPairwiseDisjoint
    (T : FiberedSupport Ambient Base) :
    T.baseProjectionDescends ↔ T.fiberImagesPairwiseDisjoint := by
  constructor
  · rintro ⟨π, hπ⟩ b₁ b₂ x h₁ h₂
    rcases h₁ with ⟨f₁, hf₁⟩
    rcases h₂ with ⟨f₂, hf₂⟩
    let p₁ : T.TotalSpace := ⟨b₁, f₁⟩
    let p₂ : T.TotalSpace := ⟨b₂, f₂⟩
    have hp₁ : T.toAmbient p₁ = x := hf₁
    have hp₂ : T.toAmbient p₂ = x := hf₂
    have hs₁ :
        (⟨x, ⟨p₁, hp₁⟩⟩ : Set.range T.toAmbient) =
          ⟨T.toAmbient p₁, ⟨p₁, rfl⟩⟩ := by
      apply Subtype.ext
      exact hp₁.symm
    have hs₂ :
        (⟨x, ⟨p₂, hp₂⟩⟩ : Set.range T.toAmbient) =
          ⟨T.toAmbient p₂, ⟨p₂, rfl⟩⟩ := by
      apply Subtype.ext
      exact hp₂.symm
    have hπ₁ :
        π (⟨x, ⟨p₁, hp₁⟩⟩ : Set.range T.toAmbient) = b₁ := by
      calc
        _ = π ⟨T.toAmbient p₁, ⟨p₁, rfl⟩⟩ := congrArg π hs₁
        _ = T.baseProjection p₁ := hπ p₁
        _ = b₁ := rfl
    have hπ₂ :
        π (⟨x, ⟨p₂, hp₂⟩⟩ : Set.range T.toAmbient) = b₂ := by
      calc
        _ = π ⟨T.toAmbient p₂, ⟨p₂, rfl⟩⟩ := congrArg π hs₂
        _ = T.baseProjection p₂ := hπ p₂
        _ = b₂ := rfl
    have hsame :
        (⟨x, ⟨p₁, hp₁⟩⟩ : Set.range T.toAmbient) =
          ⟨x, ⟨p₂, hp₂⟩⟩ := by
      apply Subtype.ext
      rfl
    calc
      b₁ = π ⟨x, ⟨p₁, hp₁⟩⟩ := hπ₁.symm
      _ = π ⟨x, ⟨p₂, hp₂⟩⟩ := congrArg π hsame
      _ = b₂ := hπ₂
  · intro hdisjoint
    classical
    let witness : ∀ x : Set.range T.toAmbient,
        ∃ b : Base, ∃ p : T.TotalSpace,
          T.toAmbient p = x.1 ∧ T.baseProjection p = b := by
      intro x
      rcases x.2 with ⟨p, hp⟩
      exact ⟨T.baseProjection p, p, hp, rfl⟩
    let π : Set.range T.toAmbient → Base :=
      fun x => Classical.choose (witness x)
    refine ⟨π, ?_⟩
    intro p
    let x : Set.range T.toAmbient := ⟨T.toAmbient p, ⟨p, rfl⟩⟩
    rcases Classical.choose_spec (witness x) with ⟨p', hp', hbase'⟩
    have h₁ : x.1 ∈ T.fiberImage (T.baseProjection p') := by
      refine ⟨p'.2, ?_⟩
      simpa [x, FiberedSupport.toAmbient, FiberedSupport.baseProjection] using hp'
    have h₂ : x.1 ∈ T.fiberImage (T.baseProjection p) := by
      exact ⟨p.2, rfl⟩
    have hbase : T.baseProjection p' = T.baseProjection p :=
      hdisjoint h₁ h₂
    change π x = T.baseProjection p
    change Classical.choose (witness x) = T.baseProjection p
    rw [← hbase']
    exact hbase

/-- Two distinct base labels can share one ambient point, making recovery
    of a unique base label impossible. This finite counterexample is an
    abstract map witness, not a physical fixture. -/
def collapsedFiberSupport : FiberedSupport Unit Bool where
  Fiber := fun _ => Unit
  embed := fun _ _ => ()

/-- A shared ambient point across distinct fibers prevents a single-valued
    base projection from recovering both labels. -/
theorem overlappingFibers_prevent_baseProjection :
    ¬ collapsedFiberSupport.baseProjectionDescends := by
  intro h
  have hdisjoint :=
    (baseProjectionDescends_iff_fiberImagesPairwiseDisjoint
      collapsedFiberSupport).mp h
  have hfalse : false = true :=
    hdisjoint (b₁ := false) (b₂ := true) (x := ())
      ⟨(), rfl⟩ ⟨(), rfl⟩
  cases hfalse

#print axioms baseProjectionDescends_iff_fiberImagesPairwiseDisjoint
#print axioms overlappingFibers_prevent_baseProjection

end FiberedSupport

/-- A second support, such as a labelled timesheet, embedded into the
same ambient type. -/
structure EmbeddedSupport (Ambient : Type u₁) where
  Carrier : Type z₁
  embed : Carrier → Ambient

/-- Set-level pullback of a fibered support and a second support over the
ambient space. -/
def SlicePullback {Ambient : Type u₁} {Base : Type v₁}
    (T : FiberedSupport Ambient Base)
    (S : EmbeddedSupport Ambient) :=
  {p : T.TotalSpace × S.Carrier // T.toAmbient p.1 = S.embed p.2}

namespace SlicePullback

variable {Ambient : Type u₁} {Base : Type v₁}
variable (T : FiberedSupport Ambient Base) (S : EmbeddedSupport Ambient)

/-- Projection from the pullback to the tube's total fiber space. -/
def toTube (p : SlicePullback T S) : T.TotalSpace := p.1.1

/-- Projection from the pullback to the second support. -/
def toSheet (p : SlicePullback T S) : S.Carrier := p.1.2

/-- Composition of the pullback-to-tube projection with the tube base map. -/
def toBase (p : SlicePullback T S) : Base :=
  T.baseProjection (toTube T S p)

/-- Ambient map from the pullback, composed through the tube projection. -/
def toAmbient (p : SlicePullback T S) : Ambient :=
  T.toAmbient (toTube T S p)

/-- The two routes from the pullback to ambient space commute. -/
theorem ambient_maps_commute (p : SlicePullback T S) :
    T.toAmbient (toTube T S p) = S.embed (toSheet T S p) := p.2

/-- The ambient image of the pullback is exactly the intersection of the
two embedded supports. This is a set-level identity, not a dynamical law. -/
theorem ambient_image_eq_intersection :
    Set.range (toAmbient T S) = Set.range T.toAmbient ∩ Set.range S.embed := by
  ext x
  constructor
  · rintro ⟨p, rfl⟩
    exact ⟨⟨toTube T S p, rfl⟩,
      ⟨toSheet T S p, (ambient_maps_commute T S p).symm⟩⟩
  · rintro ⟨⟨tube, htube⟩, ⟨sheet, hsheet⟩⟩
    refine ⟨⟨(tube, sheet), ?_⟩, htube⟩
    exact htube.trans hsheet.symm

/-- The full slice is the union, over base parameters, of the
fiberwise intersections with the second support. -/
theorem slice_decomposes_over_base :
    Set.range (toAmbient T S) =
      ⋃ b, (T.fiberImage b ∩ Set.range S.embed) := by
  rw [ambient_image_eq_intersection T S]
  rw [FiberedSupport.totalImage_eq_iUnion_fiberImage T]
  ext x
  constructor
  · rintro ⟨hx, hs⟩
    rcases Set.mem_iUnion.mp hx with ⟨b, hb⟩
    exact Set.mem_iUnion.mpr ⟨b, ⟨hb, hs⟩⟩
  · intro hx
    rcases Set.mem_iUnion.mp hx with ⟨b, ⟨hb, hs⟩⟩
    exact ⟨Set.mem_iUnion.mpr ⟨b, hb⟩, hs⟩

#print axioms FiberedSupport.totalImage_eq_iUnion_fiberImage
#print axioms SlicePullback.ambient_maps_commute
#print axioms SlicePullback.ambient_image_eq_intersection
#print axioms SlicePullback.slice_decomposes_over_base

end SlicePullback

end HsHVerification.RavelCarrierSliceReconstruction


/-!
## Label-preserving fiber/slice pullback

The earlier `SlicePullback` pairs a fibered total-space representative
with one unlabelled embedded support. The earlier `MinimalCarrierReadout`
has a labelled family of supports. This extension makes the missing
index/base alignment explicit without identifying it with physical time.

`baseOf` is an input map, not a derived or physically established map.
The result remains set-theoretic: it proves the image decomposition for
the supplied labelled family and alignment, not a physical interaction law.
-/

namespace HsHVerification.RavelCarrierSliceReconstruction

/-- A family of embedded supports with an explicit label. -/
structure EmbeddedSupportFamily (Ambient : Type u₁) (Label : Type z₁) where
  Carrier : Label → Type w₁
  embed : (i : Label) → Carrier i → Ambient

/-- Label-preserving pullback of a fibered support and a labelled support
family, using an explicit alignment map from labels to the fiber base. -/
def LabelledSlicePullback {Ambient : Type u₁} {Base : Type v₁}
    {Label : Type z₁}
    (T : FiberedSupport Ambient Base)
    (S : EmbeddedSupportFamily Ambient Label)
    (baseOf : Label → Base) :=
  {p : Σ i : Label, T.Fiber (baseOf i) × S.Carrier i //
    T.embed (baseOf p.1) p.2.1 = S.embed p.1 p.2.2}

namespace LabelledSlicePullback

variable {Ambient : Type u₁} {Base : Type v₁} {Label : Type z₁}
variable (T : FiberedSupport Ambient Base)
variable (S : EmbeddedSupportFamily Ambient Label)
variable (baseOf : Label → Base)

/-- Projection preserving the support-family label. -/
def toLabel (p : LabelledSlicePullback T S baseOf) : Label :=
  p.1.1

/-- Projection to the tube's total fiber space. -/
def toTube (p : LabelledSlicePullback T S baseOf) : T.TotalSpace :=
  ⟨baseOf (toLabel T S baseOf p), p.1.2.1⟩

/-- Projection to the labelled support family, retaining its label. -/
def toSheet (p : LabelledSlicePullback T S baseOf) :
    Σ i : Label, S.Carrier i :=
  ⟨toLabel T S baseOf p, p.1.2.2⟩

/-- Projection to the tube base, explicitly composed through the label map. -/
def toBase (p : LabelledSlicePullback T S baseOf) : Base :=
  T.baseProjection (toTube T S baseOf p)

/-- Ambient projection through the tube representative. -/
def toAmbient (p : LabelledSlicePullback T S baseOf) : Ambient :=
  T.toAmbient (toTube T S baseOf p)

/-- The base projection is exactly the supplied label-to-base composition. -/
theorem base_projection_commutes (p : LabelledSlicePullback T S baseOf) :
    toBase T S baseOf p = baseOf (toLabel T S baseOf p) := rfl

/-- The two labelled representatives reach the same ambient point. -/
theorem ambient_maps_commute (p : LabelledSlicePullback T S baseOf) :
    T.toAmbient (toTube T S baseOf p) =
      S.embed (toLabel T S baseOf p) (p.1.2.2) := p.2

/-- The ambient image is the union, over labels, of the corresponding
fiber-image / labelled-support intersections. -/
theorem ambient_image_eq_iUnion_fiberSheetIntersections :
    Set.range (toAmbient T S baseOf) =
      ⋃ i, (T.fiberImage (baseOf i) ∩ Set.range (S.embed i)) := by
  ext x
  constructor
  · rintro ⟨p, rfl⟩
    refine Set.mem_iUnion.mpr ⟨p.1.1, ?_⟩
    exact ⟨⟨p.1.2.1, rfl⟩, ⟨p.1.2.2, p.2.symm⟩⟩
  · intro hx
    rcases Set.mem_iUnion.mp hx with ⟨i, ⟨hf, hs⟩⟩
    rcases hf with ⟨f, hf⟩
    rcases hs with ⟨s, hs⟩
    refine ⟨⟨⟨i, (f, s)⟩, ?_⟩, hf⟩
    exact hf.trans hs.symm

#print axioms LabelledSlicePullback.base_projection_commutes
#print axioms LabelledSlicePullback.ambient_maps_commute
#print axioms LabelledSlicePullback.ambient_image_eq_iUnion_fiberSheetIntersections

end LabelledSlicePullback
end HsHVerification.RavelCarrierSliceReconstruction


/-!
## Conditional oblique-slice angle convention

The historical assistant used both a sine denominator for an angle measured
from the slice plane and a cosine/secant denominator for an angle measured
from the propagation normal. This module proves only that the two algebraic
forms agree under an explicitly supplied complementary-angle map. It does
not establish the physical slicing model, the source-to-model angle map, or
any Kerr/ER geometry.
-/

namespace HsHVerification.RavelObliqueSliceAngleConvention

/-- Sine of the angle complementary to a propagation-normal angle. -/
theorem sin_complementary_plane_angle (thetaProp : ℝ) :
    Real.sin (Real.pi / 2 - thetaProp) = Real.cos thetaProp := by
  exact Real.sin_pi_div_two_sub thetaProp

/-- Two apparent-diameter denominator forms agree if the plane and
propagation-normal angles are explicitly complementary. -/
theorem apparent_scale_forms_agree_of_complement
    (D0 thetaProp thetaPlane : ℝ)
    (hComplement : thetaPlane = Real.pi / 2 - thetaProp) :
    D0 / Real.sin thetaPlane = D0 / Real.cos thetaProp := by
  rw [hComplement, Real.sin_pi_div_two_sub]

/-- The same conditional identity for a semiaxis expression with absolute
values, matching the finite-core slice convention. -/
theorem oblique_semiaxis_forms_agree_of_complement
    (a thetaProp thetaPlane : ℝ)
    (hComplement : thetaPlane = Real.pi / 2 - thetaProp) :
    a / |Real.sin thetaPlane| = a / |Real.cos thetaProp| := by
  rw [hComplement, Real.sin_pi_div_two_sub]

#print axioms sin_complementary_plane_angle
#print axioms apparent_scale_forms_agree_of_complement
#print axioms oblique_semiaxis_forms_agree_of_complement

end HsHVerification.RavelObliqueSliceAngleConvention


/-!
## Independent spatial-plus-proper-time branch: 5D domain gate

The November 8 source anchor records a fourth spatial direction w and proper
time as distinct or possibly emergent along w. It does not choose whether
proper time is an independent factor. The following structure formalizes
only the independent-factor branch: a four-dimensional spatial tangent
carrier crossed with a one-dimensional real parameter, mapped toward a
four-dimensional target.

The target has no declared metric or signature. This is a local
finite-dimensional linearization, not a supplied derivative of a smooth
physical map. If proper time is emergent/reparameterized along an existing
spatial coordinate, or if the target is five-dimensional, this particular
gate does not apply.
-/

namespace HsHVerification.RavelCarrierSliceReconstruction

variable {SpatialCarrier : Type*}
  [AddCommGroup SpatialCarrier] [Module ℝ SpatialCarrier]
  [FiniteDimensional ℝ SpatialCarrier]
variable {TargetTangent : Type*}
  [AddCommGroup TargetTangent] [Module ℝ TargetTangent]
  [FiniteDimensional ℝ TargetTangent]

/-- A candidate linearization from a four-dimensional spatial carrier crossed
    with an independent one-dimensional proper-time parameter into a
    four-dimensional target. The target signature is deliberately unspecified. -/
structure IndependentSpatialTimeLinearization where
  spatialDimension_eq : Module.finrank ℝ SpatialCarrier = 4
  targetDimension_eq : Module.finrank ℝ TargetTangent = 4
  differential : (SpatialCarrier × ℝ) →ₗ[ℝ] TargetTangent

namespace IndependentSpatialTimeLinearization

variable (S : IndependentSpatialTimeLinearization
  (SpatialCarrier := SpatialCarrier) (TargetTangent := TargetTangent))

/-- The independent spatial-time product has five tangent dimensions. -/
theorem domain_dimension :
    Module.finrank ℝ (SpatialCarrier × ℝ) = 5 := by
  calc
    Module.finrank ℝ (SpatialCarrier × ℝ) =
        Module.finrank ℝ SpatialCarrier + 1 :=
      product_with_time_line_adds_one_dimension SpatialCarrier
    _ = 5 := by rw [S.spatialDimension_eq]

/-- Rank-nullity for the supplied candidate linearization. -/
theorem rank_add_nullity :
    Module.finrank ℝ (LinearMap.range S.differential) +
      Module.finrank ℝ (LinearMap.ker S.differential) =
      Module.finrank ℝ (SpatialCarrier × ℝ) :=
  S.differential.finrank_range_add_finrank_ker

/-- A five-dimensional independent spatial-time history mapped to a
    four-dimensional target must lose at least one tangent direction. -/
theorem kernel_dimension_at_least_one :
    1 ≤ Module.finrank ℝ (LinearMap.ker S.differential) := by
  have hRange :
      Module.finrank ℝ (LinearMap.range S.differential) ≤ 4 := by
    calc
      Module.finrank ℝ (LinearMap.range S.differential) ≤
          Module.finrank ℝ TargetTangent :=
        (LinearMap.range S.differential).finrank_le
      _ = 4 := S.targetDimension_eq
  have hNull := S.rank_add_nullity
  rw [S.domain_dimension] at hNull
  omega

/-- No injective first-order map exists from the independent 4D-spatial
    plus 1D-time product into a four-dimensional target. -/
theorem no_injective_four_dimensional_target :
    ¬ Function.Injective S.differential := by
  intro hInjective
  have hKer : LinearMap.ker S.differential = ⊥ :=
    LinearMap.ker_eq_bot.mpr hInjective
  have hKerZero :
      Module.finrank ℝ (LinearMap.ker S.differential) = 0 := by
    rw [hKer]
    simp
  have hPositive := S.kernel_dimension_at_least_one
  omega

/-- If the candidate map has full target rank four, exactly one local
    direction is collapsed by the 5D-to-4D representation. -/
theorem full_rank_forces_exactly_one_kernel_dimension
    (hRank : Module.finrank ℝ (LinearMap.range S.differential) = 4) :
    Module.finrank ℝ (LinearMap.ker S.differential) = 1 := by
  have hNull := S.rank_add_nullity
  rw [S.domain_dimension, hRank] at hNull
  omega

/-- If the candidate map has rank at most three, at least two local
    directions are collapsed. -/
theorem rank_at_most_three_forces_two_kernel_dimensions
    (hRank : Module.finrank ℝ (LinearMap.range S.differential) ≤ 3) :
    2 ≤ Module.finrank ℝ (LinearMap.ker S.differential) := by
  have hNull := S.rank_add_nullity
  rw [S.domain_dimension] at hNull
  omega

end IndependentSpatialTimeLinearization

#print axioms IndependentSpatialTimeLinearization.domain_dimension
#print axioms IndependentSpatialTimeLinearization.rank_add_nullity
#print axioms IndependentSpatialTimeLinearization.kernel_dimension_at_least_one
#print axioms IndependentSpatialTimeLinearization.no_injective_four_dimensional_target
#print axioms IndependentSpatialTimeLinearization.full_rank_forces_exactly_one_kernel_dimension
#print axioms IndependentSpatialTimeLinearization.rank_at_most_three_forces_two_kernel_dimensions

end HsHVerification.RavelCarrierSliceReconstruction
