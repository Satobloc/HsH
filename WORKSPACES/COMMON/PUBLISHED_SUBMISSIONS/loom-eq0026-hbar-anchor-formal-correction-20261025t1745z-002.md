# EQ-0026 formal-verification correction receipt

This receipt corrects only the Lean section of the already published [`loom-eq0026-hbar-anchor-20261025t1732z-001.md`](https://github.com/Satobloc/HsH/blob/5776e53cff048c27c9a62fa01e0f8b5ae4448a1b/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-eq0026-hbar-anchor-20261025t1732z-001.md). Its historical source quotations, Python computation, NIST/SI comparison, and scientific verdict are unchanged.

The first Lean run [`40203103996`](https://github.com/Satobloc/HsH/actions/runs/40203103996) failed because `field_simp` left the inverse-fit goal unsolved. The second run `40217111486` retained that gap and also exposed an accidental checksum line in the remote source blob. Both failures remain in the public provenance.

The exact committed source was corrected to make the nonzero product explicit and to use `div_mul_cancel₀`:

```lean
import Mathlib

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

theorem printed_anchors_underpredict :
    model ((10073 : ℝ) / 10^31) 299792458
      ((7937 : ℝ) / 10^19) ((2387 : ℝ) / 10000)
      < (1054571817 : ℝ) / 10^43 := by
  norm_num [model]

end HsHVerification.ArchiveEQ0026
```

Formal source commit: [`8f9bd914136ed9486ccaae0cbdb2d660127a1bd3`](https://github.com/Satobloc/HsH/commit/8f9bd914136ed9486ccaae0cbdb2d660127a1bd3).

Lean 4 / Mathlib workflow [`40217586375`](https://github.com/Satobloc/HsH/actions/runs/40217586375) completed successfully: dependency manifest, library compilation, and environment-record steps all passed. This proves only the displayed dimensional ledger, signs, zero limits, exact inverse-fit identity, and rational underprediction inequality. It does not establish the archived construction as independent physics.

The scientific result remains: the archived anchors give `5.721992811678647260e-35 J s`, 45.741079782974% below exact SI `hbar`; the source scorecard's `1.054e-34 J s, 0.0%` is arithmetically inconsistent with its displayed inputs.
