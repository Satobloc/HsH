import Mathlib

/-!
# Conditional screen-spin-2 intertwiner no-go

This module formalizes one abstract representation-theoretic consequence of
the null-screen type distinction recorded in HsH issue #1638.

On an oriented two-dimensional screen, the coefficient of the area 2-form is
fixed by orientation-preserving screen rotations (the trivial SO(2)
representation). In the plus/cross basis, a symmetric trace-free rank-2
polarization transforms with twice the screen angle (spin 2). A screen
quarter-turn therefore acts as negative identity on the two polarization
components.

The theorem below uses only the two stipulated quarter-turn actions. It
proves that a linear map intertwining those actions is zero. This is a
necessary condition for full SO(2)-equivariance only after the geometric
actions have been derived from the corresponding tensor representations.

This is conditional representation mathematics, not a physical source-to-
radiation map. It does not establish that the assistant-authored Blockwave
candidate is Nathan Direct, that its 4D current is correctly projected onto a
null screen, or that any H(s)H radiation map exists. It does not exclude
nonlinear maps or maps that use additional frame, field, derivative, or
other spin-carrying structure. No physical data or synthetic physical
fixture is introduced.
-/

namespace HsHVerification.HaleScreenSpinTwoNoGo

/-- Stipulated trivial action on the coefficient of an oriented area 2-form
    under a proper screen quarter-turn. The geometric derivation from an
    actual screen rotation is not formalized in this module. -/
def areaFormQuarterTurn (x : ℝ) : ℝ := x

/-- Stipulated spin-2 action on plus/cross coordinates for a screen
    quarter-turn. The construction from an STF rank-2 tensor rotation is
    not formalized in this module. -/
def spinTwoQuarterTurn (v : Fin 2 → ℝ) : Fin 2 → ℝ :=
  fun i => -v i

/-- Any real-linear map intertwining these two stipulated quarter-turn
    actions is zero.

    This proves the single-generator algebraic consequence only. A separate
    geometric argument must derive the two actions from orientation-preserving
    screen rotations and the STF rank-2 plus/cross representation before the
    result can be read as a theorem about those geometric objects. It excludes
    only a nonzero linear map from the area-form coefficient alone; it does
    not exclude nonlinear maps or maps supplied with additional frame, field,
    derivative, or other spin-carrying data. -/
theorem equivariant_map_from_area_form_to_spin_two_is_zero
    (f : ℝ →ₗ[ℝ] (Fin 2 → ℝ))
    (h_equivariant : ∀ x,
      f (areaFormQuarterTurn x) = spinTwoQuarterTurn (f x)) :
    f = 0 := by
  apply LinearMap.ext
  intro x
  funext i
  have hx := congrFun (h_equivariant x) i
  simp [areaFormQuarterTurn, spinTwoQuarterTurn] at hx
  have hzero : f x i = 0 := by
    nlinarith [hx]
  simpa using hzero

/-- The spin-2 action of a screen quarter-turn squares to the identity. -/
theorem spinTwoQuarterTurn_sq (v : Fin 2 → ℝ) :
    spinTwoQuarterTurn (spinTwoQuarterTurn v) = v := by
  funext i
  simp [spinTwoQuarterTurn]

/-- The area-form coefficient is fixed by the same generator. -/
theorem areaFormQuarterTurn_fixed (x : ℝ) :
    areaFormQuarterTurn x = x := rfl

/-- Executable plus-basis probe over rationals: one screen quarter-turn
    negates the plus component; two restore it. This is a symbolic
    representation check, not a physical simulation. -/
def spinTwoQuarterTurnQ (v : Fin 2 → ℚ) : Fin 2 → ℚ :=
  fun i => -v i

def plusBasisQ : Fin 2 → ℚ := fun i => if i = 0 then 1 else 0

#eval (spinTwoQuarterTurnQ plusBasisQ) 0
#eval (spinTwoQuarterTurnQ (spinTwoQuarterTurnQ plusBasisQ)) 0

#print axioms equivariant_map_from_area_form_to_spin_two_is_zero

end HsHVerification.HaleScreenSpinTwoNoGo
