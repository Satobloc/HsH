import Mathlib

/- EQ-0026: structural checks for the archived hbar anchor formula. -/
namespace HsHVerification.ArchiveEQ0026

structure Dim where
  length : Int
  mass : Int
  time : Int
deriving DecidableEq, Repr

def Dim.mul (a b : Dim) : Dim :=
  ⟨a.length + b.length, a.mass + b.mass, a.time + b.time⟩

def massDim : Dim := ⟨0, 1, 0⟩
def speedDim : Dim := ⟨1, 0, -1⟩
def lengthDim : Dim := ⟨1, 0, 0⟩
def actionDim : Dim := ⟨2, 1, -1⟩

theorem dimension_ledger :
    Dim.mul (Dim.mul massDim speedDim) lengthDim = actionDim := by
  rfl

def model (m c ell b : ℝ) : ℝ := m * c * ell * b

theorem model_positive {m c ell b : ℝ}
    (hm : 0 < m) (hc : 0 < c) (he : 0 < ell) (hb : 0 < b) :
    0 < model m c ell b := by
  exact mul_pos (mul_pos (mul_pos hm hc) he) hb

theorem zero_mass (c ell b : ℝ) : model 0 c ell b = 0 := by simp [model]
theorem zero_speed (m ell b : ℝ) : model m 0 ell b = 0 := by simp [model]
theorem zero_length (m c b : ℝ) : model m c 0 b = 0 := by simp [model]
theorem zero_projection (m c ell : ℝ) : model m c ell 0 = 0 := by simp [model]

theorem fitted_mass_is_identity {target c ell b : ℝ}
    (hc : c ≠ 0) (he : ell ≠ 0) (hb : b ≠ 0) :
    model (target / (c * ell * b)) c ell b = target := by
  have hceb : c * ell * b ≠ 0 := mul_ne_zero (mul_ne_zero hc he) hb
  unfold model
  calc
    target / (c * ell * b) * c * ell * b =
        target / (c * ell * b) * (c * ell * b) := by ring
    _ = target := div_mul_cancel₀ target hceb

-- Exact rational transcription of the printed anchors using B = 0.2387.
-- The right side is the 2022 CODATA/SI decimal 1.054571817e-34 J s.
theorem printed_anchors_underpredict :
    model ((10073 : ℝ) / 10^31) 299792458
      ((7937 : ℝ) / 10^19) ((2387 : ℝ) / 10000)
      < (1054571817 : ℝ) / 10^43 := by
  norm_num [model]

end HsHVerification.ArchiveEQ0026
