import Mathlib

/-!
# Meridian / SAT.O legacy chiral-charge source-consistency gate
Original archival witness: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT_NOT_MYSTICISM.txt
Git blob 32227920da7ec1d08ef04c8ab3ba8a9a790108fb, section 7.2
(also repeated in the same witness family).

The text simultaneously prints [gamma5,Q] = 0 and {gamma5,Q} = 0.
For an involution gamma5²=1 on a nonzero rational 2-dimensional
module, these conditions force Q=0. The rational matrix space is a
conditional algebraic model, not an asserted literal particle Hilbert space.
The historical source's mass operator then cannot be interpreted as
an ordinary inverse of a nonzero chiral charge operator.

Lean compilation checks the explicitly encoded algebra, not source
authorship, physical truth, or the observed electron mass.
-/

namespace HsHVerification.MeridianSATChiral

abbrev Mat := Matrix (Fin 2) (Fin 2) ℚ

theorem commute_and_anticommute_force_zero
    (gamma charge : Mat)
    (gamma_sq : gamma * gamma = 1)
    (commutes : gamma * charge - charge * gamma = 0)
    (anticommutes : gamma * charge + charge * gamma = 0) :
    charge = 0 := by
  have hc : gamma * charge = charge * gamma := sub_eq_zero.mp commutes
  have hdouble : gamma * charge + gamma * charge = 0 := by
    calc
      gamma * charge + gamma * charge = gamma * charge + charge * gamma := by
        simp only [hc]
      _ = 0 := anticommutes
  have hzero : gamma * charge = 0 := by
    ext i j
    have hentry := congrArg (fun M : Mat => M i j) hdouble
    have htwo : (gamma * charge) i j + (gamma * charge) i j = 0 := by
      simpa using hentry
    linarith
  calc
    charge = (1 : Mat) * charge := by simp
    _ = (gamma * gamma) * charge := by rw [gamma_sq]
    _ = gamma * (gamma * charge) := by rw [mul_assoc]
    _ = 0 := by rw [hzero, mul_zero]

def chiralPlus (gamma charge : Mat) : Mat :=
  (2 : ℚ)⁻¹ • (charge + gamma * charge * gamma)

theorem forced_chiral_plus_vanishes
    (gamma charge : Mat)
    (gamma_sq : gamma * gamma = 1)
    (commutes : gamma * charge - charge * gamma = 0)
    (anticommutes : gamma * charge + charge * gamma = 0) :
    chiralPlus gamma charge = 0 := by
  have hzero := commute_and_anticommute_force_zero
    gamma charge gamma_sq commutes anticommutes
  simp [chiralPlus, hzero]

#print axioms commute_and_anticommute_force_zero
#print axioms forced_chiral_plus_vanishes

end HsHVerification.MeridianSATChiral
