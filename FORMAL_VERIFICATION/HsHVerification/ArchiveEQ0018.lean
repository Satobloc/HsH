import Mathlib

/-!
Archive recovery EQ-0018: reduced-Planck-constant construction.

Historical source equation: `hbar = m0 * c * ell_f * B`.
These theorems check dimensions, inverse algebra, limiting behavior, sign,
and the archived rationalized numerical discriminator only. They do not
establish a physical law or the source's topology.
-/

namespace HsHVerification.ArchiveEQ0018

structure Dim where
  mass : ℤ
  length : ℤ
  time : ℤ
deriving DecidableEq, Repr

def addDim (a b : Dim) : Dim :=
  ⟨a.mass + b.mass, a.length + b.length, a.time + b.time⟩

def massDim : Dim := ⟨1, 0, 0⟩
def speedDim : Dim := ⟨0, 1, -1⟩
def lengthDim : Dim := ⟨0, 1, 0⟩
def actionDim : Dim := ⟨1, 2, -1⟩

theorem hbar_model_has_action_dimension :
    addDim (addDim massDim speedDim) lengthDim = actionDim := by
  decide

-- For h*c/(f*alpha^2), alpha is dimensionless. Its cube root therefore has
-- M^(1/3) L T^(-1/3), not L; compare cubed dimensions integrally.
def rawEllRadicandDim : Dim := ⟨1, 3, -1⟩
def lengthCubedDim : Dim := ⟨0, 3, 0⟩

theorem raw_ell_radicand_is_not_length_cubed :
    rawEllRadicandDim ≠ lengthCubedDim := by
  decide

def model (m c ell B : ℝ) : ℝ := m * c * ell * B

theorem zero_mass_limit (c ell B : ℝ) : model 0 c ell B = 0 := by
  simp [model]

theorem zero_length_limit (m c B : ℝ) : model m c 0 B = 0 := by
  simp [model]

theorem sign_flips_with_B (m c ell B : ℝ) :
    model m c ell (-B) = -model m c ell B := by
  ring

theorem inverse_length_reproduces_target
    (m c B target : ℝ) (hm : m ≠ 0) (hc : c ≠ 0) (hB : B ≠ 0) :
    model m c (target / (m * c * B)) B = target := by
  field_simp [model, hm, hc, hB]

-- Decimalized Python result: prediction/reference = 0.542589202170...
theorem archived_prediction_is_below_fifty_five_percent :
    (542589202170 : ℝ) / 1000000000000 < 55 / 100 := by
  norm_num

theorem archived_prediction_does_not_equal_claimed_ratio :
    (542589202170 : ℝ) / 1000000000000 ≠ 1 := by
  norm_num

end HsHVerification.ArchiveEQ0018
