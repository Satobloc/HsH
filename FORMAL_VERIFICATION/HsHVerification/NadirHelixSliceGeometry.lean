import Mathlib

/-!
# Source-fidelity geometry: affine time-slices and helical filaments

Primary descriptive sources:
* Nathan Direct, "DIMENSIONAL GRAVITY", conversation
  252d05c0-22ed-4ea2-a474-7966ab13145a, raw export blob
  2cea1924266418e19b825b95ae51e6b7cbace7e1, 2024-03-22.
  Relevant user messages include aaa28bd9-07f7-4740-b878-b485d4db44d0,
  aaa2269b-7eab-4781-9454-647098d6747f,
  aaa2d0b1-017d-453e-b95a-b23915f87d32, and
  aaa2a1cc-e884-4f6a-800f-8afc29ab221a.
* Nathan Direct, "Switching to English", conversation
  69ab6f13-b8f8-832e-8d71-528c15e11037, raw export blob
  dfdaec331846087af7daf0008eba431520a5b9ad, message
  f236e23d-0266-4be8-94f7-ead029c534b6, 2026-03-07.

The raw messages are descriptive; they do not state the equations below.
This module therefore proves conditional mathematical reconstructions only:

* An affine line in all-plus Fin 4 coordinates meets an affine hyperplane
  at exactly one parameter when its direction is transverse.
* A standard circular helix, with pitch defined as axial rise per complete
  revolution, has constant radial separation r from its axis when sliced
  by a plane normal to that axis. The slice phase rate is 2*pi*speed/pitch.

The all-plus affine model is not a claim that the physical SAT4D metric is
Euclidean. The 2025 SAT4D draft uses R^(3,1); no Wick-rotation,
signature-change, or projection map between those models is supplied here.
The affine hyperplane is a local flat-slice model, not a proof for a curved
timesheet. The helix is a 3D cross-section model, not the full 4D worldline.
-/

namespace HsHVerification.NadirHelixSliceGeometry

noncomputable section

/-- All-plus Euclidean pairing on four coordinates. -/
def dot4 (n x : Fin 4 → ℝ) : ℝ :=
  ∑ i : Fin 4, n i * x i

/-- An affine line in four-dimensional coordinate space. -/
def linePoint (x v : Fin 4 → ℝ) (t : ℝ) : Fin 4 → ℝ :=
  fun i => x i + t * v i

/-- The affine three-dimensional slice with normal n and offset c. -/
def onTimeSlice (n : Fin 4 → ℝ) (c : ℝ) (x : Fin 4 → ℝ) : Prop :=
  dot4 n x = c

/-- The slice coordinate varies affinely along the line. -/
lemma dot4_linePoint (n x v : Fin 4 → ℝ) (t : ℝ) :
    dot4 n (linePoint x v t) = dot4 n x + t * dot4 n v := by
  unfold dot4 linePoint
  calc
    (∑ i : Fin 4, n i * (x i + t * v i))
        = ∑ i : Fin 4, (n i * x i + t * (n i * v i)) := by
            refine Finset.sum_congr rfl ?_
            intro i hi
            ring
    _ = (∑ i : Fin 4, n i * x i) + t * (∑ i : Fin 4, n i * v i) := by
            rw [Finset.sum_add_distrib, ← Finset.mul_sum]

/-- The unique candidate parameter for a transverse line/hyperplane crossing. -/
def sliceParameter (n x v : Fin 4 → ℝ) (c : ℝ) : ℝ :=
  (c - dot4 n x) / dot4 n v

/-- A transverse affine line has an intersection with the affine time-slice. -/
theorem transverse_line_intersection_exists
    (n x v : Fin 4 → ℝ) (c : ℝ)
    (htrans : dot4 n v ≠ 0) :
    onTimeSlice n c (linePoint x v (sliceParameter n x v c)) := by
  unfold onTimeSlice sliceParameter
  rw [dot4_linePoint]
  field_simp [htrans]
  ring

/-- The transverse intersection parameter is unique. -/
theorem transverse_line_intersection_unique
    (n x v : Fin 4 → ℝ) (c t : ℝ)
    (htrans : dot4 n v ≠ 0)
    (ht : onTimeSlice n c (linePoint x v t)) :
    t = sliceParameter n x v c := by
  unfold onTimeSlice at ht
  unfold sliceParameter
  rw [dot4_linePoint] at ht
  have hmul : t * dot4 n v = c - dot4 n x := by
    linarith
  field_simp [htrans]
  linarith

/-- If the line direction is tangent to the slice, its slice coordinate is constant. -/
theorem tangent_line_has_constant_slice_coordinate
    (n x v : Fin 4 → ℝ) (t : ℝ)
    (htangent : dot4 n v = 0) :
    dot4 n (linePoint x v t) = dot4 n x := by
  rw [dot4_linePoint]
  simp [htangent]

/-- Circular helix about the z-axis; pitch is rise per full 2*pi turn. -/
def circularHelix (r pitch phase : ℝ) : ℝ × ℝ × ℝ :=
  (r * Real.cos phase, r * Real.sin phase,
    pitch * phase / (2 * Real.pi))

/-- Phase at which the helix reaches the horizontal slice z = z0. -/
def helixSlicePhase (pitch z0 : ℝ) : ℝ :=
  (2 * Real.pi * z0) / pitch

/-- The selected helix point lies in the same horizontal plane as its axis point. -/
theorem circularHelix_slice_z
    (r pitch z0 : ℝ) (hpitch : pitch ≠ 0) :
    (circularHelix r pitch (helixSlicePhase pitch z0)).2.2 = z0 := by
  change pitch * ((2 * Real.pi * z0) / pitch) / (2 * Real.pi) = z0
  have htwoPi : 2 * Real.pi ≠ 0 := by positivity
  field_simp [hpitch, htwoPi]

/-- Squared radial separation is r^2, independent of pitch and slice height. -/
theorem circularHelix_slice_radius_sq
    (r pitch z0 : ℝ) (_hpitch : pitch ≠ 0) :
    (circularHelix r pitch (helixSlicePhase pitch z0)).1 ^ 2
      + (circularHelix r pitch (helixSlicePhase pitch z0)).2.1 ^ 2
      = r ^ 2 := by
  change (r * Real.cos (helixSlicePhase pitch z0)) ^ 2
      + (r * Real.sin (helixSlicePhase pitch z0)) ^ 2 = r ^ 2
  have htrig := Real.sin_sq_add_cos_sq (helixSlicePhase pitch z0)
  calc
    (r * Real.cos (helixSlicePhase pitch z0)) ^ 2
        + (r * Real.sin (helixSlicePhase pitch z0)) ^ 2
      = r ^ 2 * (Real.cos (helixSlicePhase pitch z0) ^ 2
        + Real.sin (helixSlicePhase pitch z0) ^ 2) := by ring
    _ = r ^ 2 := by nlinarith [htrig]

/-- Phase rate of a slice moving axially at constant speed. -/
def movingSlicePhase (pitch z0 speed t : ℝ) : ℝ :=
  (2 * Real.pi * (z0 + speed * t)) / pitch

/-- The helix phase rate is 2*pi*speed/pitch; the radius theorem is separate. -/
theorem movingSlice_phase_rate
    (pitch z0 speed t1 t2 : ℝ)
    (hpitch : pitch ≠ 0) (htimes : t1 ≠ t2) :
    (movingSlicePhase pitch z0 speed t2
      - movingSlicePhase pitch z0 speed t1) / (t2 - t1)
      = (2 * Real.pi * speed) / pitch := by
  unfold movingSlicePhase
  field_simp [hpitch, htimes]
  ring

#print axioms transverse_line_intersection_exists
#print axioms transverse_line_intersection_unique
#print axioms tangent_line_has_constant_slice_coordinate
#print axioms circularHelix_slice_z
#print axioms circularHelix_slice_radius_sq
#print axioms movingSlice_phase_rate

end

end HsHVerification.NadirHelixSliceGeometry
