import Mathlib

namespace HsHVerification.ArchiveEQ0021

structure Dim where
  L : ℤ
  M : ℤ
  T : ℤ
deriving DecidableEq, Repr

def mulDim (a b : Dim) : Dim := ⟨a.L + b.L, a.M + b.M, a.T + b.T⟩
def divDim (a b : Dim) : Dim := ⟨a.L - b.L, a.M - b.M, a.T - b.T⟩

def energyDim : Dim := ⟨2, 1, -2⟩
def tensionDim : Dim := ⟨1, 1, -2⟩
def lengthDim : Dim := ⟨1, 0, 0⟩
def dimensionless : Dim := ⟨0, 0, 0⟩

theorem archived_ratio_is_dimensionless :
    divDim energyDim (mulDim tensionDim lengthDim) = dimensionless := by
  rfl

def alphaModel (eTurn tension ell delta : ℝ) : ℝ :=
  eTurn / (tension * ell) * (1 - delta)

theorem delta_one_forces_zero (eTurn tension ell : ℝ) :
    alphaModel eTurn tension ell 1 = 0 := by
  simp [alphaModel]

theorem nonnegative_on_physical_domain
    (eTurn tension ell delta : ℝ)
    (hE : 0 ≤ eTurn) (hT : 0 < tension) (hL : 0 < ell) (hD : delta ≤ 1) :
    0 ≤ alphaModel eTurn tension ell delta := by
  exact mul_nonneg
    (div_nonneg hE (le_of_lt (mul_pos hT hL)))
    (sub_nonneg.mpr hD)

theorem inverse_fit
    (alpha tension ell delta : ℝ)
    (hT : tension ≠ 0) (hL : ell ≠ 0) (hD : 1 - delta ≠ 0) :
    alphaModel (alpha * tension * ell / (1 - delta)) tension ell delta = alpha := by
  field_simp [alphaModel, hT, hL, hD]
  <;> ring

theorem common_scale_cancels
    (eTurn tension ell delta s : ℝ)
    (hS : s ≠ 0) (hT : tension ≠ 0) (hL : ell ≠ 0) :
    alphaModel (s * eTurn) (s * tension) ell delta =
      alphaModel eTurn tension ell delta := by
  field_simp [alphaModel, hS, hT, hL]
  <;> ring

theorem rounded_claim_below_codata :
    (1000 / 137036 : ℚ) < 72973525643 / 10000000000000 := by
  norm_num

theorem codata_inside_denominator_rounding_interval :
    (2000 / 274073 : ℚ) < 72973525643 / 10000000000000 ∧
    72973525643 / 10000000000000 < (2000 / 274071 : ℚ) := by
  norm_num

end HsHVerification.ArchiveEQ0021
