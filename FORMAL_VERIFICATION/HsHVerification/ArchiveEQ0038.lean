import Mathlib

/-!
# ArchiveEQ0038 — projection-tower coherence and reconstruction gate

Nathan Direct source: current Workshop Relay instruction, 2026-10-26:
shape hierarchy or nesting requires explicit projection and composition maps
with conditions, not analogy.

Historical context:
`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT BUILDING STORY.txt`,
blob `5c4e20eb52043b655eb81496962133e0ffe33f04`, read at repository
snapshot `121c65f48392a1c4abb0e1b36f9217b7598403a8`.
That mixed conversation includes Nathan's correction that worldline/filament
objects are pragmatic mathematical modeling primitives rather than ontology.
This module therefore formalizes abstract maps between representation levels.

The theorems check only the encoded map obligations. They do not show that the
types or maps faithfully translate SAT/H(s)H, nor that any physical system or
measured dataset realizes them.
-/

namespace HsHVerification.ArchiveEQ0038

/-- Three representation levels with an explicit direct projection and a
staged projection. Coherence is the commuting-diagram obligation. -/
structure ProjectionTower (Fine Mid Coarse : Type*) where
  fineToMid : Fine → Mid
  midToCoarse : Mid → Coarse
  fineToCoarse : Fine → Coarse
  coherent : ∀ x, fineToCoarse x = midToCoarse (fineToMid x)

theorem staged_projection_equals_direct
    {Fine Mid Coarse : Type*}
    (tower : ProjectionTower Fine Mid Coarse) (x : Fine) :
    tower.midToCoarse (tower.fineToMid x) = tower.fineToCoarse x := by
  exact (tower.coherent x).symm

/-- If the fine-to-mid projection identifies two states, every coherent
downstream coarse projection must identify them too. -/
theorem mid_collapse_propagates_to_coarse
    {Fine Mid Coarse : Type*}
    (tower : ProjectionTower Fine Mid Coarse)
    {x y : Fine} (hmid : tower.fineToMid x = tower.fineToMid y) :
    tower.fineToCoarse x = tower.fineToCoarse y := by
  calc
    tower.fineToCoarse x =
        tower.midToCoarse (tower.fineToMid x) := tower.coherent x
    _ = tower.midToCoarse (tower.fineToMid y) := congrArg tower.midToCoarse hmid
    _ = tower.fineToCoarse y := (tower.coherent y).symm

/-- Observable coarse separation is a necessary witness of mid-level
separation, conditional on projection coherence. -/
theorem coarse_difference_requires_mid_difference
    {Fine Mid Coarse : Type*}
    (tower : ProjectionTower Fine Mid Coarse)
    {x y : Fine} (hcoarse : tower.fineToCoarse x ≠ tower.fineToCoarse y) :
    tower.fineToMid x ≠ tower.fineToMid y := by
  intro hmid
  exact hcoarse (mid_collapse_propagates_to_coarse tower hmid)

/-- One explicit noncommuting witness refutes global hierarchy coherence. -/
theorem noncommuting_witness_blocks_coherence
    {Fine Mid Coarse : Type*}
    (fineToMid : Fine → Mid) (midToCoarse : Mid → Coarse)
    (fineToCoarse : Fine → Coarse) (x : Fine)
    (hmismatch : fineToCoarse x ≠ midToCoarse (fineToMid x)) :
    ¬ ∀ z, fineToCoarse z = midToCoarse (fineToMid z) := by
  intro hcoherent
  exact hmismatch (hcoherent x)

/-- A declared global reconstruction map forces the projection to be
injective. The hypothesis is substantive and must not be inferred from a
picture of nested shapes. -/
theorem reconstruction_requires_injective_projection
    {Fine Mid : Type*} (project : Fine → Mid) (reconstruct : Mid → Fine)
    (hleft : Function.LeftInverse reconstruct project) :
    Function.Injective project := by
  intro x y hproject
  calc
    x = reconstruct (project x) := (hleft x).symm
    _ = reconstruct (project y) := congrArg reconstruct hproject
    _ = y := hleft y

/-- A concrete collapsed pair blocks every global left-inverse reconstruction. -/
theorem collapse_blocks_reconstruction
    {Fine Mid : Type*} (project : Fine → Mid)
    {x y : Fine} (hxy : x ≠ y) (hcollapse : project x = project y) :
    ¬ ∃ reconstruct : Mid → Fine, Function.LeftInverse reconstruct project := by
  rintro ⟨reconstruct, hleft⟩
  exact hxy (reconstruction_requires_injective_projection project reconstruct hleft hcollapse)

#print axioms staged_projection_equals_direct
#print axioms mid_collapse_propagates_to_coarse
#print axioms coarse_difference_requires_mid_difference
#print axioms noncommuting_witness_blocks_coherence
#print axioms reconstruction_requires_injective_projection
#print axioms collapse_blocks_reconstruction

end HsHVerification.ArchiveEQ0038
