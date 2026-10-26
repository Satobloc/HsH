import Mathlib

/-!
Archive EQ-0031: dimensional and algebraic checks for the spatial fourth-order
beam limit of the historical H(s)H equation.  These theorems establish only
the stated mathematics; they do not validate an H(s)H physical interpretation.
-/

namespace HsHVerification.ArchiveEQ0031

structure Dim where
  length : Int
  mass : Int
  time : Int
  deriving DecidableEq, Repr

def mulDim (a b : Dim) : Dim :=
  ⟨a.length + b.length, a.mass + b.mass, a.time + b.time⟩

def flexuralRigidityDim : Dim := ⟨3, 1, -2⟩
def fourthSpatialDerivativeDim : Dim := ⟨-3, 0, 0⟩
def distributedLoadDim : Dim := ⟨0, 1, -2⟩

theorem bending_term_dimension :
    mulDim flexuralRigidityDim fourthSpatialDerivativeDim = distributedLoadDim := by
  rfl

noncomputable def secondMoment (b t : ℝ) : ℝ := b * t ^ 3 / 12
noncomputable def tipStiffness (E b t L : ℝ) : ℝ := E * b * t ^ 3 / (4 * L ^ 3)

theorem secondMoment_width_scaling (b t c : ℝ) :
    secondMoment (c * b) t = c * secondMoment b t := by
  unfold secondMoment
  ring

theorem tipStiffness_width_scaling (E b t L c : ℝ) :
    tipStiffness E (c * b) t L = c * tipStiffness E b t L := by
  unfold tipStiffness
  ring

theorem tipStiffness_zero_width (E t L : ℝ) :
    tipStiffness E 0 t L = 0 := by
  unfold tipStiffness
  ring

theorem quartic_constraint_gradient_coefficient (lambda r2 R2 H : ℝ) :
    lambda * 2 * (r2 - R2) * H = 2 * lambda * (r2 - R2) * H := by
  ring

theorem measured_moduli_one_sigma_intervals_disjoint :
    (2194 / 10 : ℚ) + 6 / 10 < (2301 / 10 : ℚ) - 34 / 10 := by
  norm_num

end HsHVerification.ArchiveEQ0031
