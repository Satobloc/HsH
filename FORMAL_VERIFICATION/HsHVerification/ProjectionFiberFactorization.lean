import Mathlib

/-!
# Feature descent through a many-to-one projection

A coarse representation is a map from a richer state space to a smaller one.
A target feature can be recovered from the coarse representation exactly
when it is constant on every fiber of that map (assuming the projection is
surjective onto the declared coarse-state type).

For a worldtube-to-worldline projection, this gives a precise conditional
test: a feature that is constant across all worldtube states sharing the
same projected worldline can be represented on the worldline alone. If two
such states have different feature values, no worldline-only decoder exists;
the representation must retain additional state or change the projection.

The projection, feature and surjectivity assumptions are abstract inputs.
This module does not instantiate a physical worldtube, thickness, twist,
contact surface, instrument map or measured system. It proves no physical
feature is in fact nonconstant on a worldline-projection fiber.
-/

namespace HsHVerification.ProjectionFiberFactorization

/-- The target feature is constant on every fiber of a projection. -/
def FiberConstant {X Y Z : Type*}
    (project : X → Y) (feature : X → Z) : Prop :=
  ∀ x₁ x₂, project x₁ = project x₂ → feature x₁ = feature x₂

/-- The target feature is computed by a decoder that sees only the projected
state. -/
def FactorsThrough {X Y Z : Type*}
    (project : X → Y) (feature : X → Z) : Prop :=
  ∃ decoder : Y → Z, ∀ x, feature x = decoder (project x)

/-- Any feature computed from the projection is constant on its fibers.
No surjectivity assumption is needed for this direction. -/
theorem factorsThrough_implies_fiberConstant
    {X Y Z : Type*}
    (project : X → Y) (feature : X → Z)
    (h : FactorsThrough project feature) :
    FiberConstant project feature := by
  rcases h with ⟨decoder, hdecode⟩
  intro x₁ x₂ hproject
  calc
    feature x₁ = decoder (project x₁) := hdecode x₁
    _ = decoder (project x₂) := congrArg decoder hproject
    _ = feature x₂ := (hdecode x₂).symm

/-- For a surjective projection, a feature descends to the coarse state space
iff it is constant on every projection fiber. Surjectivity is the condition
that lets the decoder be defined on every element of the declared codomain. -/
theorem fiberConstant_iff_factorsThrough_of_surjective
    {X Y Z : Type*}
    (project : X → Y) (feature : X → Z)
    (hsurjective : Function.Surjective project) :
    FiberConstant project feature ↔ FactorsThrough project feature := by
  constructor
  · intro hfiber
    refine ⟨fun y => feature (Classical.choose (hsurjective y)), ?_⟩
    intro x
    exact (hfiber (Classical.choose (hsurjective (project x))) x
      (Classical.choose_spec (hsurjective (project x)))).symm
  · exact factorsThrough_implies_fiberConstant project feature

/-- A single pair in one projection fiber with different feature values
rules out every decoder on the coarse state space. -/
theorem not_factorsThrough_of_fiber_collision
    {X Y Z : Type*}
    (project : X → Y) (feature : X → Z)
    (hcollision :
      ∃ x₁ x₂, project x₁ = project x₂ ∧ feature x₁ ≠ feature x₂) :
    ¬ FactorsThrough project feature := by
  rintro ⟨decoder, hdecode⟩
  rcases hcollision with ⟨x₁, x₂, hproject, hfeature⟩
  apply hfeature
  calc
    feature x₁ = decoder (project x₁) := hdecode x₁
    _ = decoder (project x₂) := congrArg decoder hproject
    _ = feature x₂ := (hdecode x₂).symm

/-- Nested coarse-graining maps compose when the intermediate decoder itself
factors through the next projection. This is an explicit map-composition
condition, not an analogy between levels of geometric description. -/
theorem factorsThrough_composes
    {X Y V Z : Type*}
    (project₁ : X → Y) (project₂ : Y → V)
    (feature : X → Z) (middleDecoder : Y → Z) (coarseDecoder : V → Z)
    (h₁ : ∀ x, feature x = middleDecoder (project₁ x))
    (h₂ : ∀ y, middleDecoder y = coarseDecoder (project₂ y)) :
    FactorsThrough (project₂ ∘ project₁) feature := by
  refine ⟨coarseDecoder, ?_⟩
  intro x
  calc
    feature x = middleDecoder (project₁ x) := h₁ x
    _ = coarseDecoder (project₂ (project₁ x)) := h₂ (project₁ x)

/-!
Interpretation boundary:
* If the target feature is fiber-constant, the projected representation is
  sufficient for that feature.
* If a source-authorized target varies within a projection fiber, the
  projected representation is insufficient for that feature.
* This is feature-relative. It does not establish that a finite-core
  variable is physically real, observable, necessary for every readout, or
  required by any particular experiment.
* The theorem assumes a total surjective projection. For a non-surjective
  projection, state the decoder only on the image or provide an explicit
  extension to the full codomain.
-/

#print axioms factorsThrough_implies_fiberConstant
#print axioms fiberConstant_iff_factorsThrough_of_surjective
#print axioms not_factorsThrough_of_fiber_collision
#print axioms factorsThrough_composes

end HsHVerification.ProjectionFiberFactorization
