# EQ-0027 formal-verification correction receipt

This receipt corrects only the Lean declaration in the published `aldus-eq0027-gravity-orientation-20261025t184616z-001.md`. The historical quotations, dimensional diagnosis, Python calculation, CODATA comparison, random reading, and scientific verdict are unchanged.

The first Lean workflow run `40222754124` failed at `ArchiveEQ0027.lean:34:4` because a definition over real division must be explicitly `noncomputable`. The failed run remains public provenance. The exact one-token declaration correction was:

```diff
-def model (rho c ell m : ℝ) : ℝ := rho^2 * c^2 * ell / m
+noncomputable def model (rho c ell m : ℝ) : ℝ := rho^2 * c^2 * ell / m
```

Corrected formal source commit: `b54893563e423ed27a6aa5dd932d0b75b023f1dd`.

Lean 4 / Mathlib workflow `40223269694` completed successfully. Dependency-manifest generation, library compilation, and environment recording all passed. The verified source is:

```lean
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

theorem may_orientation_dimension :
    Dim.div (Dim.mul speedSquaredDim lengthDim) massDim =
      gravitationalConstantDim := by
  rfl

theorem june_orientation_dimension :
    Dim.div (Dim.mul speedSquaredDim massDim) lengthDim = forceDim := by
  rfl

noncomputable def model (rho c ell m : ℝ) : ℝ := rho^2 * c^2 * ell / m

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

theorem printed_anchors_overpredict :
    model ((1 : ℝ) / 10^19) 299792458
      ((7937 : ℝ) / 10^19) ((10073 : ℝ) / 10^31)
      > (66743 : ℝ) / 10^15 := by
  norm_num [model]

end HsHVerification.ArchiveEQ0027
```

This verifies only the stated dimensional ledgers, positivity, zero limits, sign symmetry, and rational overprediction inequality. It does not validate the archive's topological interpretation or turn the fitted overlap coefficient into an independent prediction.
