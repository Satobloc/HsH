import Mathlib

/-!
# Source-bound map composition and unit-normalized uncertainty propagation

This module supplies a reusable contract for a defined map chain.

A source-bundle identity is a type index on every edge. Consequently two
edges can compose only when they are attached to the same exact
source-bundle identity and their intermediate domain/codomain types agree.

Each edge declares an admissible domain, an input metric normalization, an
output metric normalization, and a nonnegative Lipschitz bound between the
corresponding normalized distances. The normalization is itself a type
index: the output normalization of the first edge must be exactly the input
normalization of the next edge. Composition additionally requires an explicit
proof that the first edge maps admissible inputs into the second edge's
admissible domain. The composite bound is the product of the edge bounds.

The identity and digest fields are required to be nonempty labels only.
This module does not compute or authenticate SHA-256, validate a source
manifest, construct any physical map, or establish that a proposed map is
Lipschitz. Those remain external, source-specific proof and measurement
obligations. In particular, no worldtube, timesheet, projection, instrument
map, calibration, or physical observable is supplied here.

The result is a conditional mathematical interface for unit-aware
uncertainty propagation, not a physical calculation or an H(s)H prediction.
-/

namespace HsHVerification.CalderMapUncertaintyComposition

universe u v w

/-- Exact source-bundle identity carried as a type index by every map edge. -/
structure SourceBundleIdentity where
  id : String
  digestLabel : String
  id_nonempty : id ≠ ""
  digestLabel_nonempty : digestLabel ≠ ""

/--
A named metric normalization. Adjacent maps compose only when both the
unit label and positive reference scale are exactly the same.
-/
structure MetricNormalization where
  unitLabel : String
  referenceScale : ℝ
  unitLabel_nonempty : unitLabel ≠ ""
  referenceScale_pos : 0 < referenceScale

/-- Distance expressed in the dimensionless units fixed by a normalization. -/
def normalizedDist {A : Type u} [PseudoMetricSpace A]
    (N : MetricNormalization) (x y : A) : ℝ :=
  dist x y / N.referenceScale

theorem normalizedDist_nonneg {A : Type u} [PseudoMetricSpace A]
    (N : MetricNormalization) (x y : A) :
    0 ≤ normalizedDist N x y := by
  dsimp [normalizedDist]
  exact div_nonneg dist_nonneg (le_of_lt N.referenceScale_pos)

/-- A declared identity for one map definition or its composed definition. -/
structure MapIdentity where
  id : String
  digestLabel : String
  id_nonempty : id ≠ ""
  digestLabel_nonempty : digestLabel ≠ ""

/--
A source-bound map with explicitly typed input/output normalizations, an
admissible domain, and a Lipschitz bound on normalized distances.

The source bundle and metric normalizations are type indices. They cannot
silently drift between adjacent edges in a composed chain.
-/
structure MapEdge (S : SourceBundleIdentity)
    (Input Output : MetricNormalization) (A : Type u) (B : Type v)
    [PseudoMetricSpace A] [PseudoMetricSpace B] where
  identity : MapIdentity
  admissible : A → Prop
  toFun : A → B
  lipschitzBound : NNReal
  lipschitzOnAdmissible :
    ∀ ⦃x y : A⦄, admissible x → admissible y →
      normalizedDist Output (toFun x) (toFun y) ≤
        (lipschitzBound : ℝ) * normalizedDist Input x y

namespace MapEdge

/--
Compose a map from A to B followed by a map from B to C.

The bridge proof is an explicit intermediate-domain condition. The common
source-bundle index S, intermediate metric normalization, and intermediate
type B are enforced by the function signature.
-/
def compose {S : SourceBundleIdentity}
    {Input Middle Output : MetricNormalization}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (g : MapEdge S Middle Output B C)
    (f : MapEdge S Input Middle A B)
    (bridge : ∀ x, f.admissible x → g.admissible (f.toFun x))
    (compositeIdentity : MapIdentity) : MapEdge S Input Output A C where
  identity := compositeIdentity
  admissible := f.admissible
  toFun := fun x => g.toFun (f.toFun x)
  lipschitzBound := g.lipschitzBound * f.lipschitzBound
  lipschitzOnAdmissible := by
    intro x y hx hy
    calc
      normalizedDist Output (g.toFun (f.toFun x))
          (g.toFun (f.toFun y))
          ≤ (g.lipschitzBound : ℝ) *
              normalizedDist Middle (f.toFun x) (f.toFun y) :=
            g.lipschitzOnAdmissible (bridge x hx) (bridge y hy)
      _ ≤ (g.lipschitzBound : ℝ) *
            ((f.lipschitzBound : ℝ) * normalizedDist Input x y) := by
          exact mul_le_mul_of_nonneg_left
            (f.lipschitzOnAdmissible hx hy) (by positivity)
      _ = ((g.lipschitzBound * f.lipschitzBound : NNReal) : ℝ) *
            normalizedDist Input x y := by
          simp [mul_assoc]

@[simp] theorem compose_apply
    {S : SourceBundleIdentity}
    {Input Middle Output : MetricNormalization}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (g : MapEdge S Middle Output B C)
    (f : MapEdge S Input Middle A B)
    (bridge : ∀ x, f.admissible x → g.admissible (f.toFun x))
    (compositeIdentity : MapIdentity) (x : A) :
    (compose g f bridge compositeIdentity).toFun x =
      g.toFun (f.toFun x) := rfl

@[simp] theorem compose_bound
    {S : SourceBundleIdentity}
    {Input Middle Output : MetricNormalization}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (g : MapEdge S Middle Output B C)
    (f : MapEdge S Input Middle A B)
    (bridge : ∀ x, f.admissible x → g.admissible (f.toFun x))
    (compositeIdentity : MapIdentity) :
    (compose g f bridge compositeIdentity).lipschitzBound =
      g.lipschitzBound * f.lipschitzBound := rfl

end MapEdge

/-- A two-edge chain records its intermediate admissibility condition. -/
structure TwoEdgeChain (S : SourceBundleIdentity)
    (Input Middle Output : MetricNormalization)
    (A : Type u) (B : Type v) (C : Type w)
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C] where
  first : MapEdge S Input Middle A B
  second : MapEdge S Middle Output B C
  intermediateAdmissibility :
    ∀ x, first.admissible x → second.admissible (first.toFun x)
  compositeIdentity : MapIdentity

namespace TwoEdgeChain

/-- The composite map is explicitly second after first. -/
def composite {S : SourceBundleIdentity}
    {Input Middle Output : MetricNormalization}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (chain : TwoEdgeChain S Input Middle Output A B C) :
    MapEdge S Input Output A C :=
  MapEdge.compose chain.second chain.first
    chain.intermediateAdmissibility chain.compositeIdentity

@[simp] theorem composite_apply
    {S : SourceBundleIdentity}
    {Input Middle Output : MetricNormalization}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (chain : TwoEdgeChain S Input Middle Output A B C) (x : A) :
    chain.composite.toFun x =
      chain.second.toFun (chain.first.toFun x) := rfl

@[simp] theorem composite_bound_eq_product
    {S : SourceBundleIdentity}
    {Input Middle Output : MetricNormalization}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (chain : TwoEdgeChain S Input Middle Output A B C) :
    chain.composite.lipschitzBound =
      chain.second.lipschitzBound * chain.first.lipschitzBound := rfl

/--
If two admissible inputs are within epsilon in the declared input
normalization, their composite outputs are within the product-bound times
epsilon in the declared output normalization. No contraction assumption is
made: either edge may have a bound above one.
-/
theorem composite_error_bound
    {S : SourceBundleIdentity}
    {Input Middle Output : MetricNormalization}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (chain : TwoEdgeChain S Input Middle Output A B C)
    {x y : A} {epsilon : ℝ}
    (hx : chain.first.admissible x)
    (hy : chain.first.admissible y)
    (hxy : normalizedDist Input x y ≤ epsilon) :
    normalizedDist Output (chain.composite.toFun x)
      (chain.composite.toFun y) ≤
      ((chain.second.lipschitzBound *
        chain.first.lipschitzBound : NNReal) : ℝ) * epsilon := by
  calc
    normalizedDist Output (chain.composite.toFun x)
        (chain.composite.toFun y)
        ≤ (chain.composite.lipschitzBound : ℝ) *
            normalizedDist Input x y :=
          chain.composite.lipschitzOnAdmissible hx hy
    _ ≤ (chain.composite.lipschitzBound : ℝ) * epsilon :=
          mul_le_mul_of_nonneg_left hxy (by positivity)
    _ = ((chain.second.lipschitzBound *
          chain.first.lipschitzBound : NNReal) : ℝ) * epsilon := by
          rw [composite_bound_eq_product]

end TwoEdgeChain

#print axioms normalizedDist_nonneg
#print axioms MapEdge.compose_apply
#print axioms MapEdge.compose_bound
#print axioms TwoEdgeChain.composite_apply
#print axioms TwoEdgeChain.composite_bound_eq_product
#print axioms TwoEdgeChain.composite_error_bound

end HsHVerification.CalderMapUncertaintyComposition
