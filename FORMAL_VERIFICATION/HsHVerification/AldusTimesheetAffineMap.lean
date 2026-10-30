import Mathlib

/-!
# Aldus: affine filament / flat-timesheet intersection map

Primary geometry: Nathan/user messages in
DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json
(Git blob 2cea1924266418e19b825b95ae51e6b7cbace7e1):
a one-dimensional string/filament in a four-dimensional ambient space and a
three-dimensional time surface; "now" is described as their intersection.

Later assistant/worker reconstruction: WORKING_GROUP_1.txt and the finite-core
slice packets use an affine tangent-hyperplane map. This module formalizes only
the flat affine case. It does NOT prove that a physical timesheet is flat,
that the chosen direction is the physical filament tangent, or that the
curved/expanding wavefront is represented by one global hyperplane.

For n·T ≠ 0, the unique point on the line y + s T lying in the hyperplane
n·x = 0 is y - T (n·y)/(n·T). When n·T = 0, there is no unique transverse
intersection: the line misses the plane if n·y ≠ 0, and is contained in the
plane if n·y = 0.
-/

namespace HsHVerification.AldusTimesheetAffineMap

def dot4 (a b : Fin 4 → ℝ) : ℝ :=
  ∑ i : Fin 4, a i * b i

def linePoint (y T : Fin 4 → ℝ) (s : ℝ) : Fin 4 → ℝ :=
  fun i => y i + s * T i

noncomputable def affinePlaneHit (n T y : Fin 4 → ℝ) : Fin 4 → ℝ :=
  fun i => y i - T i * (dot4 n y / dot4 n T)

theorem dot4_linePoint (n y T : Fin 4 → ℝ) (s : ℝ) :
    dot4 n (linePoint y T s) = dot4 n y + s * dot4 n T := by
  classical
  unfold dot4 linePoint
  calc
    (∑ i : Fin 4, n i * (y i + s * T i))
        = ∑ i : Fin 4, (n i * y i + s * (n i * T i)) := by
            apply Finset.sum_congr rfl
            intro i hi
            ring
    _ = (∑ i : Fin 4, n i * y i) +
          (∑ i : Fin 4, s * (n i * T i)) := by
            rw [Finset.sum_add_distrib]
    _ = (∑ i : Fin 4, n i * y i) +
          s * (∑ i : Fin 4, n i * T i) := by
            rw [← Finset.mul_sum]

theorem affinePlaneHit_on_plane
    (n T y : Fin 4 → ℝ) (h : dot4 n T ≠ 0) :
    dot4 n (affinePlaneHit n T y) = 0 := by
  have hEq :
      affinePlaneHit n T y =
        linePoint y T (-(dot4 n y) / dot4 n T) := by
    funext i
    simp [affinePlaneHit, linePoint]
    ring
  rw [hEq, dot4_linePoint]
  field_simp [h]
  <;> ring

theorem line_plane_parameter_unique
    (n T y : Fin 4 → ℝ) (h : dot4 n T ≠ 0) (s : ℝ)
    (hs : dot4 n (linePoint y T s) = 0) :
    s = -(dot4 n y) / dot4 n T := by
  rw [dot4_linePoint] at hs
  have hmul : s * dot4 n T = -(dot4 n y) := by
    linarith
  calc
    s = (s * dot4 n T) / dot4 n T := by
      field_simp [h]
    _ = -(dot4 n y) / dot4 n T := by rw [hmul]

theorem parallel_line_misses_plane
    (n T y : Fin 4 → ℝ)
    (hT : dot4 n T = 0) (hy : dot4 n y ≠ 0) (s : ℝ) :
    dot4 n (linePoint y T s) ≠ 0 := by
  rw [dot4_linePoint, hT]
  simpa using hy

#print axioms dot4_linePoint
#print axioms affinePlaneHit_on_plane
#print axioms line_plane_parameter_unique
#print axioms parallel_line_misses_plane

end HsHVerification.AldusTimesheetAffineMap
