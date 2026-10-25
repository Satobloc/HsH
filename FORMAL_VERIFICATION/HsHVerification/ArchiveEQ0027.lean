import Mathlib

namespace HsHVerification.ArchiveEQ0027

structure Dim where
  length : Int
  mass : Int
  time : Int
deriving DecidableEq, Repr

def Dim.mul (a b : Dim) : Dim :=
  ⟨a.length + b.length, a.mass + b.mass, a.time + b.time⟩

def Dim.div (a b : Dim) : Dim :=
  ⟨a.length - b.length, a.mass - b.mass, a.time - b.time⟩

def speedSquaredDim : Dim := ⟨2, 0, -2⟩
def lengthDim : Dim := ⟨1, 0, 0⟩
def massDim : Dim := ⟨0, 1, 0⟩
def gravitationalConstantDim : Dim := ⟨3, -1, -2⟩
def forceDim : Dim := ⟨1, 1, -2⟩

-- rho is dimensionless.  The May orientation has the dimensions of G.
theorem may_orientation_dimension :
    Dim.div (Dim.mul speedSquaredDim lengthDim) massDim =
      gravitationalConstantDim := by
  rfl

-- The June orientation c^2 m / ell instead has force dimensions.
theorem june_orientation_dimension :
    Dim.div (Dim.mul speedSquaredDim massDim) lengthDim = forceDim := by
  rfl

def model (rho c ell m : ℝ) : ℝ := rho^2 * c^2 * ell / m

theorem model_positive {rho c ell m : ℝ}
    (hr : rho ≠ 0) (hc : c ≠ 0) (he : 0 < ell) (hm : 0 < m) :
    0 < model rho c ell m := by
  unfold model
  positivity

theorem zero_overlap (c ell m : ℝ) : model 0 c ell m = 0 := by
  simp [model]

theorem zero_length (rho c m : ℝ) : model rho c 0 m = 0 := by
  simp [model]

theorem overlap_sign_invariant (rho c ell m : ℝ) :
    model (-rho) c ell m = model rho c ell m := by
  simp [model]

-- Exact rational transcription of the displayed archive anchors.
-- It exceeds 2022 CODATA G = 6.67430e-11 m^3 kg^-1 s^-2.
theorem printed_anchors_overpredict :
    model ((1 : ℝ) / 10^19) 299792458
      ((7937 : ℝ) / 10^19) ((10073 : ℝ) / 10^31)
      > (66743 : ℝ) / 10^15 := by
  norm_num [model]

end HsHVerification.ArchiveEQ0027
