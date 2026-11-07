import Mathlib

namespace HsHVerification.ArchiveEQ0022

abbrev Vec4 := ℝ × ℝ × ℝ × ℝ

def o  : Vec4 := (0, 0, 0, 0)
def e1 : Vec4 := (1, 0, 0, 0)
def e2 : Vec4 := (0, 1, 0, 0)
def e3 : Vec4 := (0, 0, 1, 0)
def e4 : Vec4 := (0, 0, 0, 1)

/-- Rotation of the unobserved 3--4 plane.  When `c^2+s^2=1` this is in SO(4). -/
def spin34 (c s : ℝ) (x : Vec4) : Vec4 :=
  (x.1, x.2.1, c * x.2.2.1 - s * x.2.2.2,
    s * x.2.2.1 + c * x.2.2.2)

theorem three_markers_leave_continuous_freedom (c s : ℝ) :
    spin34 c s o = o ∧ spin34 c s e1 = e1 ∧ spin34 c s e2 = e2 := by
  simp [spin34, o, e1, e2]

theorem explicit_three_marker_counterexample :
    spin34 0 1 o = o ∧ spin34 0 1 e1 = e1 ∧ spin34 0 1 e2 = e2 ∧
    spin34 0 1 e3 ≠ e3 := by
  norm_num [spin34, o, e1, e2, e3]

theorem fourth_marker_removes_spin34 (c s : ℝ)
    (h : spin34 c s e3 = e3) : c = 1 ∧ s = 0 := by
  simpa [spin34, e3] using h

/-- Orientation-reversing completion fixes the four reconstruction markers but
    is rejected by the SO(4), rather than O(4), requirement. -/
def reflect4 (x : Vec4) : Vec4 := (x.1, x.2.1, x.2.2.1, -x.2.2.2)

theorem orientation_sign_gate :
    reflect4 o = o ∧ reflect4 e1 = e1 ∧ reflect4 e2 = e2 ∧
    reflect4 e3 = e3 ∧ reflect4 e4 ≠ e4 := by
  norm_num [reflect4, o, e1, e2, e3, e4]

def vadd (x y : Vec4) : Vec4 :=
  (x.1 + y.1, x.2.1 + y.2.1, x.2.2.1 + y.2.2.1,
    x.2.2.2 + y.2.2.2)

def vscale (a : ℝ) (x : Vec4) : Vec4 :=
  (a*x.1, a*x.2.1, a*x.2.2.1, a*x.2.2.2)

def similarity (center : Vec4) (scale : ℝ) (q : Vec4 → Vec4) (x : Vec4) : Vec4 :=
  vadd center (vscale scale (q x))

theorem zero_scale_collapses (center : Vec4) (q : Vec4 → Vec4) (x : Vec4) :
    similarity center 0 q x = center := by
  simp [similarity, vadd, vscale]

structure Dim where
  L : ℤ
  M : ℤ
  T : ℤ
deriving DecidableEq, Repr

def mulDim (a b : Dim) : Dim := ⟨a.L+b.L, a.M+b.M, a.T+b.T⟩
def coordDim : Dim := ⟨1,0,0⟩
def scaleDim : Dim := ⟨1,0,0⟩
def markerDim : Dim := ⟨0,0,0⟩

theorem scale_times_marker_has_coordinate_dimension :
    mulDim scaleDim markerDim = coordDim := by rfl

end HsHVerification.ArchiveEQ0022
