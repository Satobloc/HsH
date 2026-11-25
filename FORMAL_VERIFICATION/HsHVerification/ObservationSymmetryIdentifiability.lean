import Mathlib

/-!
# Observation symmetry and identifiability

This module formalizes one conditional obstruction to recovering a target
from measurements: if every selected channel is invariant under a state
transformation while the target changes, no deterministic decoder of those
channels can recover that target.

The theorem is deliberately weaker than a full identifiability result:
symmetry witnesses prove non-identifiability, but absence of such a witness
does not prove that the observation map is injective or that the target is
constant on every observation fiber.

The group action is an abstract mathematical input. This module does not
assert that H(s)H has a particular physical gauge group or that any proposed
frame rotation is a physical symmetry.
-/

namespace HsHVerification.ObservationSymmetryIdentifiability

variable {G X : Type*} [Group G] [MulAction G X]
variable {O Z : Type*}

/-- A target is identifiable from an observation exactly when it is constant
on every fiber of that observation map. -/
def IdentifiableFrom (observe : X → O) (target : X → Z) : Prop :=
  ∀ x₁ x₂, observe x₁ = observe x₂ → target x₁ = target x₂

/-- A symmetry witness that preserves the observation but changes the target
is sufficient to disprove identifiability from that observation. -/
theorem not_identifiable_of_symmetry_witness
    (observe : X → O) (target : X → Z)
    (g : G) (x : X)
    (hObserve : observe (g • x) = observe x)
    (hTarget : target (g • x) ≠ target x) :
    ¬ IdentifiableFrom observe target := by
  intro h
  exact hTarget (h (g • x) x hObserve)

variable {ι : Type*} {Y : ι → Type*}

/-- The joint observation retains every declared channel without identifying
their codomains or silently replacing them by a scalar summary. -/
def jointObservation (channels : ∀ i : ι, X → Y i) (x : X) :
    ∀ i : ι, Y i :=
  fun i => channels i x

/-- If every channel is invariant under the same state transformation, their
joint observation is invariant as well. -/
theorem jointObservation_invariant
    (channels : ∀ i : ι, X → Y i) (g : G)
    (hChannels : ∀ i x, channels i (g • x) = channels i x)
    (x : X) :
    jointObservation channels (g • x) = jointObservation channels x := by
  funext i
  exact hChannels i x

/-- A target that changes along a symmetry left invisible by every channel
cannot be recovered from the joint observation. -/
theorem target_not_identifiable_from_joint_channels
    (channels : ∀ i : ι, X → Y i) (target : X → Z)
    (g : G) (x : X)
    (hChannels : ∀ i x, channels i (g • x) = channels i x)
    (hTarget : target (g • x) ≠ target x) :
    ¬ IdentifiableFrom (jointObservation channels) target := by
  intro h
  exact hTarget (h (g • x) x (jointObservation_invariant channels g hChannels x))

/-- A second channel separates this particular symmetry-related pair when the
first channel is invariant but the second is not. This is pairwise separation,
not a claim of global identifiability. -/
theorem added_channel_separates_symmetry_pair
    {Y₁ Y₂ : Type*}
    (observe₁ : X → Y₁) (observe₂ : X → Y₂)
    (g : G) (x : X)
    (h₁ : observe₁ (g • x) = observe₁ x)
    (h₂ : observe₂ (g • x) ≠ observe₂ x) :
    observe₁ (g • x) = observe₁ x ∧
      observe₂ (g • x) ≠ observe₂ x ∧
      (observe₁ (g • x), observe₂ (g • x)) ≠
        (observe₁ x, observe₂ x) := by
  refine ⟨h₁, h₂, ?_⟩
  intro h
  exact h₂ (congrArg Prod.snd h)

/- A source-defined symmetry group and action are required before this
abstract obstruction can be assigned to a physical model. The theorem above
does not identify such a group or action for H(s)H. -/

/-! ## Identifiability under representation equivalence

Ravel's representation-conversion formalization supplies pairwise
equivalences, conversion-compatible evolution, and observation invariance.
To transport *feature identifiability* across those representations, the
target feature must also be preserved by the same equivalence. Observation
agreement alone is not the target-preservation premise.

This theorem is pairwise and abstract. It does not establish that a
time-field/trajectory conversion exists for H(s)H, that it varies
continuously across an interpolation parameter, or that any physical
observable or feature satisfies the two preservation laws.
-/

/-- A bijective representation change preserves feature identifiability
iff it transports both the complete observation and the target feature. -/
theorem identifiable_iff_under_observation_and_feature_preserving_equiv
    {X' : Type*}
    (e : X ≃ X')
    (observe : X → O)
    (observe' : X' → O)
    (target : X → Z)
    (target' : X' → Z)
    (hObserve : ∀ x, observe' (e x) = observe x)
    (hTarget : ∀ x, target' (e x) = target x) :
    IdentifiableFrom observe target ↔
      IdentifiableFrom observe' target' := by
  constructor
  · intro hIdent y₁ y₂ hObserved
    have hObservedSource :
        observe (e.symm y₁) = observe (e.symm y₂) := by
      calc
        observe (e.symm y₁) =
            observe' (e (e.symm y₁)) := (hObserve (e.symm y₁)).symm
        _ = observe' y₁ := by simp
        _ = observe' y₂ := hObserved
        _ = observe' (e (e.symm y₂)) := by simp
        _ = observe (e.symm y₂) := hObserve (e.symm y₂)
    have hTargetSource :=
      hIdent (e.symm y₁) (e.symm y₂) hObservedSource
    calc
      target' y₁ = target' (e (e.symm y₁)) := by simp
      _ = target (e.symm y₁) := hTarget (e.symm y₁)
      _ = target (e.symm y₂) := hTargetSource
      _ = target' (e (e.symm y₂)) := (hTarget (e.symm y₂)).symm
      _ = target' y₂ := by simp
  · intro hIdent x₁ x₂ hObserved
    have hObservedTarget :
        observe' (e x₁) = observe' (e x₂) := by
      calc
        observe' (e x₁) = observe x₁ := hObserve x₁
        _ = observe x₂ := hObserved
        _ = observe' (e x₂) := (hObserve x₂).symm
    have hTargetImage := hIdent (e x₁) (e x₂) hObservedTarget
    calc
      target x₁ = target' (e x₁) := (hTarget x₁).symm
      _ = target' (e x₂) := hTargetImage
      _ = target x₂ := hTarget x₂

#print axioms not_identifiable_of_symmetry_witness
#print axioms jointObservation_invariant
#print axioms target_not_identifiable_from_joint_channels
#print axioms added_channel_separates_symmetry_pair

end HsHVerification.ObservationSymmetryIdentifiability
