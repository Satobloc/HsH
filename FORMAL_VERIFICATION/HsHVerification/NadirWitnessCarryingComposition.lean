import Mathlib
import HsHVerification.NadirProjectionCoarseGrainFactorization

/-!
# Witness-carrying composition for nested projections

This module strengthens the existing one-step factorization contract by
carrying each intermediate image witness in the codomain.  It proves a
two-stage composition law for abstract maps.

The statements are conditional map mathematics.  They do not construct
physical projections, coarse-graining maps, worldtubes, timesheets, or
instrument readouts, and they do not establish a physical commutation law.
The source-defined nested-helix-to-framed-sphere map remains unspecified.
-/

namespace HsHVerification.NadirWitnessCarryingComposition

universe u₀ u₁ u₂ u₃ u₄ u₅

open HsHVerification.NadirProjectionCoarseGrainFactorization

variable {W0 : Type u₀} {O0 : Type u₁}
variable {W1 : Type u₂} {O1 : Type u₃}
variable {W2 : Type u₄} {O2 : Type u₅}

/--
The induced map now returns a value bundled with its witness that it lies in
the next projection's image.  The representative is chosen from the actual
image subtype of the first projection.
-/
noncomputable def inducedRangeMap
    (P0 : W0 → O0) (C0 : W0 → W1) (P1 : W1 → O1) :
    Set.range P0 → Set.range P1 :=
  fun y =>
    ⟨P1 (C0 (Classical.choose y.property)),
      ⟨C0 (Classical.choose y.property), rfl⟩⟩

/-- Fibre constancy makes the witness-carrying induced map factor the rung. -/
theorem inducedRangeMap_factors
    (P0 : W0 → O0) (C0 : W0 → W1) (P1 : W1 → O1)
    (hFiber0 : ∀ x y, P0 x = P0 y →
      P1 (C0 x) = P1 (C0 y)) :
    ∀ w, inducedRangeMap P0 C0 P1
      (imageProjection P0 w) = imageProjection P1 (C0 w) := by
  intro w
  apply Subtype.ext
  have hmem : P0 w ∈ Set.range P0 := ⟨w, rfl⟩
  have hrep : P0 (Classical.choose hmem) = P0 w :=
    Classical.choose_spec hmem
  simpa [inducedRangeMap, imageProjection] using
    hFiber0 (Classical.choose hmem) w hrep

/--
Existence of a range-to-range factorization is equivalent to the same
fibre-constancy condition as the ambient-codomain theorem.  The stronger
codomain records that every induced output is in the next projection's
actual image.
-/
theorem rangeFactorization_iff_fiberwise
    (P0 : W0 → O0) (C0 : W0 → W1) (P1 : W1 → O1) :
    (∃ D0 : Set.range P0 → Set.range P1,
      ∀ w, D0 (imageProjection P0 w) = imageProjection P1 (C0 w)) ↔
    (∀ x y, P0 x = P0 y →
      P1 (C0 x) = P1 (C0 y)) := by
  constructor
  · rintro ⟨D0, hD0⟩ x y hxy
    have hproj : imageProjection P0 x = imageProjection P0 y := by
      apply Subtype.ext
      exact hxy
    have hRange :
        imageProjection P1 (C0 x) = imageProjection P1 (C0 y) := by
      calc
        imageProjection P1 (C0 x) = D0 (imageProjection P0 x) :=
          (hD0 x).symm
        _ = D0 (imageProjection P0 y) := congrArg D0 hproj
        _ = imageProjection P1 (C0 y) := hD0 y
    exact congrArg Subtype.val hRange
  · intro hFiber0
    exact ⟨inducedRangeMap P0 C0 P1,
      inducedRangeMap_factors P0 C0 P1 hFiber0⟩

/-- The witness-carrying induced map is unique on the projected image. -/
theorem inducedRangeMap_unique
    (P0 : W0 → O0) (C0 : W0 → W1) (P1 : W1 → O1)
    (f g : Set.range P0 → Set.range P1)
    (hf : ∀ w, f (imageProjection P0 w) = imageProjection P1 (C0 w))
    (hg : ∀ w, g (imageProjection P0 w) = imageProjection P1 (C0 w)) :
    f = g := by
  funext y
  rcases y.property with ⟨w, hw⟩
  have hproj : imageProjection P0 w = y := by
    apply Subtype.ext
    exact hw
  calc
    f y = f (imageProjection P0 w) := by rw [← hproj]
    _ = imageProjection P1 (C0 w) := hf w
    _ = g (imageProjection P0 w) := (hg w).symm
    _ = g y := by rw [hproj]

/--
Two independently fibre-constant stages compose.  The intermediate image
witness emitted by the first stage is exactly the domain required by the
second stage, so no ambient surjectivity or unproved identification is
silently inserted.
-/
theorem twoStage_witness_carrying_composition
    (P0 : W0 → O0) (C0 : W0 → W1) (P1 : W1 → O1)
    (C1 : W1 → W2) (P2 : W2 → O2)
    (hFiber0 : ∀ x y, P0 x = P0 y →
      P1 (C0 x) = P1 (C0 y))
    (hFiber1 : ∀ u v, P1 u = P1 v →
      P2 (C1 u) = P2 (C1 v)) :
    ∀ w, inducedRangeMap P1 C1 P2 hFiber1
      (inducedRangeMap P0 C0 P1 hFiber0 (imageProjection P0 w)) =
      imageProjection P2 (C1 (C0 w)) := by
  intro w
  calc
    inducedRangeMap P1 C1 P2 hFiber1
        (inducedRangeMap P0 C0 P1 hFiber0 (imageProjection P0 w))
        =
      inducedRangeMap P1 C1 P2 hFiber1 (imageProjection P1 (C0 w)) := by
        rw [inducedRangeMap_factors P0 C0 P1 hFiber0 w]
    _ = imageProjection P2 (C1 (C0 w)) :=
      inducedRangeMap_factors P1 C1 P2 hFiber1 (C0 w)

#print axioms inducedRangeMap_factors
#print axioms rangeFactorization_iff_fiberwise
#print axioms inducedRangeMap_unique
#print axioms twoStage_witness_carrying_composition

end HsHVerification.NadirWitnessCarryingComposition
