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

The theorem below uses only that generator action. It proves that a linear
SO(2)-equivariant map from the area-form coefficient alone to the spin-2
plus/cross pair must be zero.

This is conditional representation mathematics, not a physical source-to-
radiation map. It does not establish that the assistant-authored Blockwave
candidate is Nathan Direct, that its 4D current is correctly projected onto a
null screen, or that any H(s)H radiation map exists. It does not exclude
nonlinear maps or maps that use additional frame, field, derivative, or
other spin-carrying structure. No physical data or synthetic physical
fixture is introduced.
-/

namespace HsHVerification.HaleScreenSpinTwoNoGo

variable {K : Type*} [LinearOrderedField K]

/-- The coefficient of the oriented area 2-form is invariant under a
    proper screen quarter-turn. -/
def areaFormQuarterTurn (x : K) : K := x

/-- In the plus/cross basis, spin 2 doubles the screen angle. A screen
    quarter-turn therefore acts as a half-turn on polarization components. -/
def spinTwoQuarterTurn (v : Fin 2 → K) : Fin 2 → K :=
  fun i => -v i

/-- Any linear map intertwining the trivial area-form action with the
    spin-2 quarter-turn action is zero.

    Full SO(2)-equivariance implies this generator condition. The result
    excludes only a nonzero linear map from the area-form coefficient alone;
    it does not exclude nonlinear maps or maps supplied with additional
    frame, field, derivative, or other spin-carrying data. -/
theorem equivariant_map_from_area_form_to_spin_two_is_zero
    (f : K →ₗ[K] (Fin 2 → K))
    (h_equivariant : ∀ x,
      f (areaFormQuarterTurn x) = spinTwoQuarterTurn (f x)) :
    f = 0 := by
  apply LinearMap.ext
  intro x
  funext i
  have hx := congrFun (h_equivariant x) i
  simp [areaFormQuarterTurn, spinTwoQuarterTurn] at hx
  linarith

/-- The spin-2 action of a screen quarter-turn squares to the identity. -/
theorem spinTwoQuarterTurn_sq (v : Fin 2 → K) :
    spinTwoQuarterTurn (spinTwoQuarterTurn v) = v := by
  funext i
  simp [spinTwoQuarterTurn]

/-- The area-form coefficient is fixed by the same generator. -/
theorem areaFormQuarterTurn_fixed (x : K) :
    areaFormQuarterTurn x = x := rfl

/-- Executable plus-basis probe over rationals: one screen quarter-turn
    negates the plus component; two restore it. This is a symbolic
    representation check, not a physical simulation. -/
def plusBasis : Fin 2 → ℚ := fun i => if i = 0 then 1 else 0

#eval (spinTwoQuarterTurn plusBasis) 0
#eval (spinTwoQuarterTurn (spinTwoQuarterTurn plusBasis)) 0

#print axioms equivariant_map_from_area_form_to_spin_two_is_zero

end HsHVerification.HaleScreenSpinTwoNoGo
