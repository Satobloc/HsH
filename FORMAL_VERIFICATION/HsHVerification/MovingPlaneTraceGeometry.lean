import Mathlib

/-!
# Moving-plane traces of straight lines and opposite parabolas

Primary source: HsH raw export `DIMENSIONAL GRAVITY`, conversation
`252d05c0-22ed-4ea2-a474-7966ab13145a`, blob
`2cea1924266418e19b825b95ae51e6b7cbace7e1`.

Relevant Nathan Direct messages:
- `aaa28bd9-...` (2024-03-22T15:10:09Z): a helix/axis pair is cut by a plane
  perpendicular to the straight axis.
- `aaa2269b-...` (2024-03-22T15:12:26Z): the helix meets a fixed slice at
  one point, not a spiral painted in the plane.
- `aaa2d0b1-...` (2024-03-22T15:18:39Z): translating the slice makes that
  point trace a circle; its rate depends on pitch and slice rate, while its
  radius is the helix's cross-sectional radius.
- `aaa2a1cc-...` (2024-03-22T15:35:10Z): a tilted straight line is proposed
  to make the intersection point move in-plane.
- `aaa2e4d5-...` (2024-03-22T17:00:25Z): the user corrects the assistant's
  one-line construction and proposes two opposite-opening parabolas.
- `aaa276dc-...` (2024-03-22T16:54:06Z): qualitative taxonomy of straight,
  angled, curved, wavy, helical and multiply intersecting 1D shapes.
- `aaa246c9-...` (2024-03-22T18:05:42Z): the user lifts the construction to
  4D strings intersecting a 3D time surface.

The coordinate formulas below are assistant reconstructions. The first
coordinate is x, the second y, and the slice normal is z. The source's
statement that a tilted line moves the intersection along y at the same rate
as the plane is underdetermined: the rate is (dy/ds)/(dz/ds) times the plane
speed. Equality with plane speed requires equal y- and z-components of the
line direction. The parabola pair is likewise a standard model, not a
verbatim source equation. No physical dynamics, metric, or time-surface law
is encoded.
-/

namespace HsHVerification.MovingPlaneTraceGeometry

/-- A straight line in R^3, parameterized by s. -/
def linePoint (x0 y0 z0 dx dy dz s : ℝ) : ℝ × ℝ × ℝ :=
  (x0 + dx * s, y0 + dy * s, z0 + dz * s)

/-- Parameter at which a transverse line meets the slice z = Z. -/
def sliceParameter (z0 dz Z : ℝ) : ℝ :=
  (Z - z0) / dz

/-- x-coordinate of the line/slice intersection. -/
def sliceX (x0 z0 dx dz Z : ℝ) : ℝ :=
  x0 + dx * ((Z - z0) / dz)

/-- y-coordinate of the line/slice intersection. -/
def sliceY (y0 z0 dy dz Z : ℝ) : ℝ :=
  y0 + dy * ((Z - z0) / dz)

/-- The intersection point lies on the requested z-slice when dz is nonzero. -/
theorem lineSlicePoint_z (z0 dz Z : ℝ) (hdz : dz ≠ 0) :
    (linePoint 0 0 z0 0 0 dz (sliceParameter z0 dz Z)).2.2 = Z := by
  simp [linePoint, sliceParameter]
  field_simp [hdz]
  ring

/-- A slice z = Z0 + v*t moves at constant normal speed v. -/
def movingSliceX (x0 z0 dx dz Z0 v t : ℝ) : ℝ :=
  sliceX x0 z0 dx dz (Z0 + v * t)

/-- The in-plane y-coordinate of the line/slice intersection as the slice moves. -/
def movingSliceY (y0 z0 dy dz Z0 v t : ℝ) : ℝ :=
  sliceY y0 z0 dy dz (Z0 + v * t)

/-- Exact x-velocity of the intersection point under a constant-speed slice. -/
theorem movingSliceX_rate
    (x0 z0 dx dz Z0 v t1 t2 : ℝ)
    (hdz : dz ≠ 0) (ht : t1 ≠ t2) :
    (movingSliceX x0 z0 dx dz Z0 v t2
      - movingSliceX x0 z0 dx dz Z0 v t1) / (t2 - t1)
      = dx * v / dz := by
  unfold movingSliceX sliceX
  have hdt : t2 - t1 ≠ 0 := sub_ne_zero.mpr (Ne.symm ht)
  field_simp [hdz, hdt]
  ring

/-- Exact y-velocity: line slope in the slice-normal direction times slice speed. -/
theorem movingSliceY_rate
    (y0 z0 dy dz Z0 v t1 t2 : ℝ)
    (hdz : dz ≠ 0) (ht : t1 ≠ t2) :
    (movingSliceY y0 z0 dy dz Z0 v t2
      - movingSliceY y0 z0 dy dz Z0 v t1) / (t2 - t1)
      = dy * v / dz := by
  unfold movingSliceY sliceY
  have hdt : t2 - t1 ≠ 0 := sub_ne_zero.mpr (Ne.symm ht)
  field_simp [hdz, hdt]
  ring

/-- If the line is perpendicular to x (dx = 0), its intersection has no x-motion. -/
theorem perpendicular_x_has_zero_x_rate
    (x0 z0 dx dz Z0 v t1 t2 : ℝ)
    (hdz : dz ≠ 0) (ht : t1 ≠ t2) (hdx : dx = 0) :
    (movingSliceX x0 z0 dx dz Z0 v t2
      - movingSliceX x0 z0 dx dz Z0 v t1) / (t2 - t1) = 0 := by
  rw [movingSliceX_rate x0 z0 dx dz Z0 v t1 t2 hdz ht, hdx]
  ring

/-- The y-rate equals the slice-normal speed only under the additional
    equal-component condition dy = dz. -/
theorem y_rate_eq_slice_speed_of_equal_components
    (y0 z0 dy dz Z0 v t1 t2 : ℝ)
    (hdz : dz ≠ 0) (ht : t1 ≠ t2) (hdy : dy = dz) :
    (movingSliceY y0 z0 dy dz Z0 v t2
      - movingSliceY y0 z0 dy dz Z0 v t1) / (t2 - t1) = v := by
  rw [movingSliceY_rate y0 z0 dy dz Z0 v t1 t2 hdz ht, hdy]
  field_simp [hdz]

/-- Counterexample: a line with dy = 2 and dz = 1 moves its intersection
    at twice the slice speed, not at the slice speed. -/
theorem y_rate_need_not_equal_slice_speed :
    ∃ y0 z0 dy dz Z0 v t1 t2 : ℝ,
      dz ≠ 0 ∧ t1 ≠ t2 ∧
      (movingSliceY y0 z0 dy dz Z0 v t2
        - movingSliceY y0 z0 dy dz Z0 v t1) / (t2 - t1) ≠ v := by
  refine ⟨0, 0, 2, 1, 0, 1, 0, 1, by norm_num, by norm_num, ?_⟩
  norm_num [movingSliceY, sliceY]

/-- Standard opposite-opening parabolas in the yz-plane, represented by
    their y-coordinate as a function of the slice coordinate z. -/
def parabolaA (z : ℝ) : ℝ := z ^ 2

def parabolaB (z : ℝ) : ℝ := -(z ^ 2)

/-- Their signed y-separation. -/
def parabolicSeparation (z : ℝ) : ℝ :=
  parabolaA z - parabolaB z

theorem parabolas_meet_at_origin :
    parabolaA 0 = parabolaB 0 := by
  simp [parabolaA, parabolaB]

theorem parabolicSeparation_eq (z : ℝ) :
    parabolicSeparation z = 2 * z ^ 2 := by
  simp [parabolicSeparation, parabolaA, parabolaB]
  ring

theorem parabolicSeparation_positive (z : ℝ) (hz : z ≠ 0) :
    0 < parabolicSeparation z := by
  rw [parabolicSeparation_eq]
  exact mul_pos (by norm_num) (sq_pos_of_ne_zero hz)

theorem parabolicSeparation_even (z : ℝ) :
    parabolicSeparation z = parabolicSeparation (-z) := by
  simp [parabolicSeparation, parabolaA, parabolaB]

theorem parabolicSeparation_strictly_increases_with_positive_slice
    {z1 z2 : ℝ} (hz1 : 0 ≤ z1) (hz12 : z1 < z2) :
    parabolicSeparation z1 < parabolicSeparation z2 := by
  rw [parabolicSeparation_eq, parabolicSeparation_eq]
  have hz2 : 0 ≤ z2 := le_trans hz1 (le_of_lt hz12)
  nlinarith

#print axioms lineSlicePoint_z
#print axioms movingSliceX_rate
#print axioms movingSliceY_rate
#print axioms y_rate_eq_slice_speed_of_equal_components
#print axioms y_rate_need_not_equal_slice_speed
#print axioms parabolas_meet_at_origin
#print axioms parabolicSeparation_eq
#print axioms parabolicSeparation_positive
#print axioms parabolicSeparation_even
#print axioms parabolicSeparation_strictly_increases_with_positive_slice

end HsHVerification.MovingPlaneTraceGeometry
