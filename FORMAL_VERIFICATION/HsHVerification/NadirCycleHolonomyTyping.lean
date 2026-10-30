import Mathlib

/-!
# Cycle order versus holonomy phase

This module formalizes only an algebraic representation distinction:

* every element of an additive phase group can be the image of the generator
  of an infinite cyclic group;
* a homomorphism from ZMod 3 must send its generator to a 3-torsion element.

This does NOT formalize a differential-geometric connection, a cobordism,
a physical cycle, higher holonomy, or H(s)H dynamics. It checks only the
explicitly stated group-homomorphism propositions below.
-/

namespace HsHVerification.NadirCycleHolonomyTyping

/-- Additive circle phases, normalized so one turn is 1. -/
abbrev Phase := AddCircle (1 : ℝ)

/-- A representation of the infinite cyclic group with arbitrary generator phase. -/
def loopRep (θ : Phase) : ℤ →+ Phase where
  toFun n := n • θ
  map_zero' := by simp
  map_add' m n := by simp [add_zsmul]

@[simp] theorem loopRep_one (θ : Phase) : loopRep θ 1 = θ := by
  simp [loopRep]

/-- Every circle phase is admissible as the image of one infinite-cycle generator. -/
theorem every_phase_is_realizable_on_infinite_cyclic_generator (θ : Phase) :
    ∃ ρ : ℤ →+ Phase, ρ 1 = θ := by
  exact ⟨loopRep θ, loopRep_one θ⟩

/-- The order-three relation forces the represented generator to be 3-torsion. -/
theorem c3_generator_is_three_torsion (ρ : ZMod 3 →+ Phase) :
    3 • ρ 1 = 0 := by
  have hmul : (3 : ℕ) • (1 : ZMod 3) = 0 := by norm_num
  have hmap : ρ ((3 : ℕ) • (1 : ZMod 3)) =
      (3 : ℕ) • ρ (1 : ZMod 3) := by
    exact map_nsmul ρ 3 1
  rw [hmul] at hmap
  simpa using hmap.symm

/-- C3 symmetry also admits the trivial representation; it does not select 120 degrees. -/
theorem trivial_c3_representation_has_zero_generator_phase :
    (0 : ZMod 3 →+ Phase) 1 = 0 := by
  simp

end HsHVerification.NadirCycleHolonomyTyping
