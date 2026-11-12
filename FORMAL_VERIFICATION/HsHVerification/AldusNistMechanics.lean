import Mathlib

namespace HsHVerification.AldusNistMechanics

/-
Conditional source comparison for the NIST BIPM torsion-balance paper.

For a uniform annular cylinder with actual annular mass m, inner radius a,
and outer radius b, the standard axial polar moment is
  I = (m / 2) * (a^2 + b^2).
The paper's printed Eq. (9) uses (m / 2) * (b^2 - a^2).
This file proves only the algebraic consequences of those definitions.
It does not establish that the paper's implementation used the printed
expression, nor that the physical test masses satisfy the uniform-annulus
premise. Units are not represented by Lean's real-number type.
-/

def annularPolarMoment (m a b : ℝ) : ℝ :=
  (m / 2) * (a ^ 2 + b ^ 2)

def eq9PrintedOwnMoment (m a b : ℝ) : ℝ :=
  (m / 2) * (b ^ 2 - a ^ 2)

def eq9PrintedTotalMoment (m a b R I_disk : ℝ) : ℝ :=
  4 * m * R ^ 2 + 4 * eq9PrintedOwnMoment m a b + I_disk

def annularTotalMoment (m a b R I_disk : ℝ) : ℝ :=
  4 * m * R ^ 2 + 4 * annularPolarMoment m a b + I_disk

theorem own_moment_difference (m a b : ℝ) :
    annularPolarMoment m a b - eq9PrintedOwnMoment m a b = m * a ^ 2 := by
  unfold annularPolarMoment eq9PrintedOwnMoment
  ring

theorem total_moment_difference (m a b R I_disk : ℝ) :
    annularTotalMoment m a b R I_disk -
      eq9PrintedTotalMoment m a b R I_disk = 4 * m * a ^ 2 := by
  unfold annularTotalMoment eq9PrintedTotalMoment
    annularPolarMoment eq9PrintedOwnMoment
  ring

theorem total_difference_pos
    {m a b R I_disk : ℝ} (hm : 0 < m) (ha : 0 < a) :
    0 < annularTotalMoment m a b R I_disk -
      eq9PrintedTotalMoment m a b R I_disk := by
  rw [total_moment_difference]
  positivity

/-- The two NIST torsion-strip stiffness expressions, represented
as dimensionless real-valued formulas for conditional algebra only. -/
def gravitationalStripStiffness (W b L : ℝ) : ℝ :=
  W * b ^ 2 / (12 * L)

def elasticStripStiffness (F b t L : ℝ) : ℝ :=
  F * b * t ^ 3 / (3 * L)

theorem strip_stiffness_ratio
    (W F b t L : ℝ)
    (hF : F ≠ 0) (hb : b ≠ 0) (ht : t ≠ 0) (hL : L ≠ 0) :
    gravitationalStripStiffness W b L /
        elasticStripStiffness F b t L =
      W * b / (4 * F * t ^ 3) := by
  unfold gravitationalStripStiffness elasticStripStiffness
  field_simp [hF, hb, ht, hL]
  <;> ring

end HsHVerification.AldusNistMechanics
