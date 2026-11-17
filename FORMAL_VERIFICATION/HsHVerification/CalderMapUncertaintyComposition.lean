import Mathlib

/-!
# Source-bound map composition and uncertainty propagation

This module supplies a reusable contract for a defined map chain.

A source-bundle identity is a type index on every edge. Consequently two
edges can compose only when they are attached to the same source-bundle
identity and their intermediate domain/codomain types agree.

Each edge declares an admissible domain and a nonnegative Lipschitz bound
valid on that domain. Composition additionally requires an explicit proof
that the first edge maps admissible inputs into the second edge's admissible
domain. The composite bound is the product of the edge bounds, so an input
distance bound propagates through the chain.

The identity and digest fields are required to be nonempty labels only.
This module does not compute or authenticate SHA-256, validate a source
manifest, construct any physical map, or establish that a proposed map is
Lipschitz. Those remain external, source-specific proof and measurement
obligations. In particular, no worldtube, timesheet, projection, instrument
map, calibration, or physical observable is supplied here.

The result is a conditional mathematical interface for uncertainty
propagation, not a physical calculation or an H(s)H prediction.
-/

namespace HsHVerification.CalderMapUncertaintyComposition

universe u v w

/-- Exact source-bundle identity carried as a type index by every map edge. -/
structure SourceBundleIdentity where
  id : String
  digestLabel : String
  id_nonempty : id ≠ ""
  digestLabel_nonempty : digestLabel ≠ ""

/-- A declared identity for one map definition or its composed definition. -/
structure MapIdentity where
  id : String
  digestLabel : String
  id_nonempty : id ≠ ""
  digestLabel_nonempty : digestLabel ≠ ""

/--
A source-bound map with an explicitly declared admissible domain and a
Lipschitz bound valid on that domain.

The source bundle is indexed in the type, preventing accidental composition
of edges that refer to different source-bundle identities.
-/
structure MapEdge (S : SourceBundleIdentity) (A : Type u) (B : Type v)
    [PseudoMetricSpace A] [PseudoMetricSpace B] where
  identity : MapIdentity
  admissible : A → Prop
  toFun : A → B
  lipschitzBound : NNReal
  lipschitzOnAdmissible :
    ∀ ⦃x y : A⦄, admissible x → admissible y →
      dist (toFun x) (toFun y) ≤
        (lipschitzBound : ℝ) * dist x y

namespace MapEdge

/--
Compose a map from A to B followed by a map from B to C.

The bridge proof is an explicit intermediate-domain condition. The common
source-bundle index S and the shared intermediate type B are enforced by
the function signature.
-/
def compose {S : SourceBundleIdentity}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (g : MapEdge S B C) (f : MapEdge S A B)
    (bridge : ∀ x, f.admissible x → g.admissible (f.toFun x))
    (compositeIdentity : MapIdentity) : MapEdge S A C where
  identity := compositeIdentity
  admissible := f.admissible
  toFun := fun x => g.toFun (f.toFun x)
  lipschitzBound := g.lipschitzBound * f.lipschitzBound
  lipschitzOnAdmissible := by
    intro x y hx hy
    calc
      dist (g.toFun (f.toFun x)) (g.toFun (f.toFun y))
          ≤ (g.lipschitzBound : ℝ) *
              dist (f.toFun x) (f.toFun y) :=
            g.lipschitzOnAdmissible (bridge x hx) (bridge y hy)
      _ ≤ (g.lipschitzBound : ℝ) *
            ((f.lipschitzBound : ℝ) * dist x y) := by
          apply mul_le_mul_of_nonneg_left
          · exact f.lipschitzOnAdmissible hx hy
          · positivity
      _ = ((g.lipschitzBound * f.lipschitzBound : NNReal) : ℝ) *
            dist x y := by
          simp [mul_assoc]

@[simp] theorem compose_apply
    {S : SourceBundleIdentity}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (g : MapEdge S B C) (f : MapEdge S A B)
    (bridge : ∀ x, f.admissible x → g.admissible (f.toFun x))
    (compositeIdentity : MapIdentity) (x : A) :
    (compose g f bridge compositeIdentity).toFun x =
      g.toFun (f.toFun x) := rfl

@[simp] theorem compose_bound
    {S : SourceBundleIdentity}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (g : MapEdge S B C) (f : MapEdge S A B)
    (bridge : ∀ x, f.admissible x → g.admissible (f.toFun x))
    (compositeIdentity : MapIdentity) :
    (compose g f bridge compositeIdentity).lipschitzBound =
      g.lipschitzBound * f.lipschitzBound := rfl

end MapEdge

/-- A two-edge chain records its intermediate admissibility condition. -/
structure TwoEdgeChain (S : SourceBundleIdentity)
    (A : Type u) (B : Type v) (C : Type w)
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C] where
  first : MapEdge S A B
  second : MapEdge S B C
  intermediateAdmissibility :
    ∀ x, first.admissible x → second.admissible (first.toFun x)
  compositeIdentity : MapIdentity

namespace TwoEdgeChain

/-- The composite map is explicitly second after first. -/
def composite {S : SourceBundleIdentity}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (chain : TwoEdgeChain S A B C) : MapEdge S A C :=
  MapEdge.compose chain.second chain.first
    chain.intermediateAdmissibility chain.compositeIdentity

@[simp] theorem composite_apply
    {S : SourceBundleIdentity}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (chain : TwoEdgeChain S A B C) (x : A) :
    chain.composite.toFun x =
      chain.second.toFun (chain.first.toFun x) := rfl

@[simp] theorem composite_bound_eq_product
    {S : SourceBundleIdentity}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (chain : TwoEdgeChain S A B C) :
    chain.composite.lipschitzBound =
      chain.second.lipschitzBound * chain.first.lipschitzBound := rfl

/--
If two admissible inputs are within epsilon, their composite outputs are
within the product-bound times epsilon. No contraction assumption is made:
either edge may have a bound above one.
-/
theorem composite_error_bound
    {S : SourceBundleIdentity}
    {A : Type u} {B : Type v} {C : Type w}
    [PseudoMetricSpace A] [PseudoMetricSpace B] [PseudoMetricSpace C]
    (chain : TwoEdgeChain S A B C)
    {x y : A} {epsilon : ℝ}
    (hx : chain.first.admissible x)
    (hy : chain.first.admissible y)
    (hxy : dist x y ≤ epsilon) :
    dist (chain.composite.toFun x) (chain.composite.toFun y) ≤
      ((chain.second.lipschitzBound *
        chain.first.lipschitzBound : NNReal) : ℝ) * epsilon := by
  calc
    dist (chain.composite.toFun x) (chain.composite.toFun y)
        ≤ (chain.composite.lipschitzBound : ℝ) * dist x y :=
          chain.composite.lipschitzOnAdmissible hx hy
    _ ≤ (chain.composite.lipschitzBound : ℝ) * epsilon :=
          mul_le_mul_of_nonneg_left hxy (by positivity)
    _ = ((chain.second.lipschitzBound *
          chain.first.lipschitzBound : NNReal) : ℝ) * epsilon := by
          simp [composite_bound_eq_product]

end TwoEdgeChain

#print axioms MapEdge.compose_apply
#print axioms MapEdge.compose_bound
#print axioms TwoEdgeChain.composite_apply
#print axioms TwoEdgeChain.composite_bound_eq_product
#print axioms TwoEdgeChain.composite_error_bound

end HsHVerification.CalderMapUncertaintyComposition
