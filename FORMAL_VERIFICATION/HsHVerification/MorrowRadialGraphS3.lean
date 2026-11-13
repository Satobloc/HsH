import Mathlib

/-!
# Conditional source-fidelity lemma for a positive radial graph over S³

Source conversation: Satobloc/HsH, `LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json`,
conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, raw blob
`56a84cb85d5c386efa4ea11d322d11e95e2c7703`.

The direct user-side source distinguishes an instantaneous 3D universe slice
from its 4D history. The formula
`X(w,Ω) = [w-d(w,Ω)] n(Ω)` was introduced by assistant message
`56e1fb71-4b75-4e4c-b2ab-cfbcc260aca6`; it is NOT a Nathan Direct equation.

This module fixes one value of the assistant's radial parameter w and writes
r(Ω) = w-d(w,Ω). It assumes r is positive and the direction map n is
injective into the unit 3-sphere in Euclidean 4-space. It proves that radial
projection recovers n(Ω), so the radial parametrization is injective and
equivalent as a TYPE to its range.

The final equivalence is set-theoretic, not a Homeomorph. Continuity of r/n,
a homeomorphism or embedding theorem, the w-family/evolution map, the native
cw=t coordinate conversion, global Cruller/Klein topology, metric,
curvature, and physical interpretation are not proved here. This module
formalizes a conditional property of an assistant reconstruction only.
-/

namespace HsHVerification.MorrowRadialGraphS3

/-- Unit directions in Euclidean four-space, used here as a typed S³. -/
abbrev DirectionS3 := {u : EuclideanSpace ℝ (Fin 4) // ‖u‖ = 1}

/-- A fixed-w radial graph with positive radius function r and direction map n. -/
def radialGraph (r : DirectionS3 → ℝ) (n : DirectionS3 → DirectionS3)
    (ω : DirectionS3) : EuclideanSpace ℝ (Fin 4) :=
  r ω • (n ω).val

/-- Radial projection of a nonzero vector to its unit direction. -/
def radialProjection (x : EuclideanSpace ℝ (Fin 4)) : EuclideanSpace ℝ (Fin 4) :=
  ‖x‖⁻¹ • x

/-- A positive radial graph point has norm equal to its radial coordinate. -/
theorem norm_radialGraph
    (r : DirectionS3 → ℝ) (n : DirectionS3 → DirectionS3)
    (ω : DirectionS3) (hr : 0 < r ω) :
    ‖radialGraph r n ω‖ = r ω := by
  rw [radialGraph, norm_smul, Real.norm_eq_abs, abs_of_pos hr, (n ω).property]
  ring

/-- Radial projection exactly recovers the selected unit direction. -/
theorem radialProjection_recovers_direction
    (r : DirectionS3 → ℝ) (n : DirectionS3 → DirectionS3)
    (ω : DirectionS3) (hr : 0 < r ω) :
    radialProjection (radialGraph r n ω) = (n ω).val := by
  rw [radialProjection, norm_radialGraph r n ω hr, radialGraph]
  simp [smul_smul, hr.ne']

/-- Positive radius plus injective direction map makes the radial parametrization injective. -/
theorem radialGraph_injective
    (r : DirectionS3 → ℝ) (n : DirectionS3 → DirectionS3)
    (hr : ∀ ω, 0 < r ω) (hn : Function.Injective n) :
    Function.Injective (radialGraph r n) := by
  intro a b hab
  apply hn
  apply Subtype.ext
  have h := congrArg radialProjection hab
  rw [radialProjection_recovers_direction r n a (hr a),
      radialProjection_recovers_direction r n b (hr b)] at h
  exact h

/-- The domain is bijective with the set-theoretic image of its radial graph.
    This is not a topological homeomorphism. -/
def radialGraphEquivRange
    (r : DirectionS3 → ℝ) (n : DirectionS3 → DirectionS3)
    (hr : ∀ ω, 0 < r ω) (hn : Function.Injective n) :
    DirectionS3 ≃ Set.range (radialGraph r n) := by
  let f : DirectionS3 → Set.range (radialGraph r n) :=
    fun ω => ⟨radialGraph r n ω, ⟨ω, rfl⟩⟩
  exact Equiv.ofInjective f (by
    intro a b hab
    exact radialGraph_injective r n hr hn (congrArg Subtype.val hab))

#print axioms norm_radialGraph
#print axioms radialProjection_recovers_direction
#print axioms radialGraph_injective
#print axioms radialGraphEquivRange

end HsHVerification.MorrowRadialGraphS3
