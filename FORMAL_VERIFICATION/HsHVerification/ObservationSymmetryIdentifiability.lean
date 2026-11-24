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
    (observe₁ (g • x), observe₂ (g • x)) ≠
      (observe₁ x, observe₂ x) := by
  intro h
  exact h₂ (congrArg Prod.snd h)

/-! ## Finite executable witness

A two-point permutation leaves a constant coarse channel unchanged while
changing an identity-valued target. The marker channel separates that same
pair. This is a finite algebraic execution check, not a physical fixture or
measurement.
-/

def swapTwo : Equiv.Perm (Fin 2) := Equiv.swap 0 1

def coarseChannel (x : Fin 2) : Bool := true

def markerChannel (x : Fin 2) : Fin 2 := x

def targetLabel (x : Fin 2) : Fin 2 := x

example :
    ¬ IdentifiableFrom coarseChannel targetLabel := by
  exact not_identifiable_of_symmetry_witness
    coarseChannel targetLabel swapTwo 0
    (by rfl)
    (by decide)

example :
    (coarseChannel (swapTwo • (0 : Fin 2)),
      markerChannel (swapTwo • (0 : Fin 2))) ≠
    (coarseChannel 0, markerChannel 0) := by
  exact added_channel_separates_symmetry_pair
    coarseChannel markerChannel swapTwo 0
    (by rfl)
    (by decide)

#eval swapTwo (0 : Fin 2)
#eval decide (coarseChannel (swapTwo • (0 : Fin 2)) = coarseChannel 0)
#eval decide (markerChannel (swapTwo • (0 : Fin 2)) ≠ markerChannel 0)

#print axioms not_identifiable_of_symmetry_witness
#print axioms jointObservation_invariant
#print axioms target_not_identifiable_from_joint_channels
#print axioms added_channel_separates_symmetry_pair

end HsHVerification.ObservationSymmetryIdentifiability
