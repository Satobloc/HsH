import Mathlib

/-!
# Moving-plane traces of straight lines, helices and opposite parabolas

Primary source: HsH raw export `DIMENSIONAL GRAVITY`, conversation
`252d05c0-22ed-4ea2-a474-7966ab13145a`, blob
`2cea1924266418e19b825b95ae51e6b7cbace7e1`.

Relevant Nathan Direct messages (all user-authored):
- `aaa28bd9-07f7-4740-b878-b485d4db44d0` (2024-03-22T15:10:05.407Z):
  initial straight-axis/helical-line construction.
- `aaa2269b-7eab-4781-9454-647098d6747f` (2024-03-22T15:20:20.623Z):
  corrects the assistant: a fixed transverse plane meets the helix at one
  point, not a spiral drawn in the plane.
- `aaa20670-fd77-4577-8e31-0a33a9e358c6` (2024-03-22T15:23:19.544Z):
  clarifies the moving-plane setup.
- `aaa2d0b1-017d-453e-b95a-b23915f87d32` (2024-03-22T15:29:30.774Z):
  moving the slice makes the intersection point trace a circle; its rate
  depends on pitch and slice rate.
- `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` (2024-03-22T15:35:10.461Z):
  the orbit radius is the cross-sectional distance from the axis and is
  independent of pitch.
- `aaa26a36-fc31-4d8f-8c66-c1743e7fbaf5` (2024-03-22T15:47:03.303Z):
  asks whether a tilted line's intersection moves at the same rate as the
  moving plane.
- `aaa28cc8-23d6-4f36-bacf-6b659af8c4d0` (2024-03-22T15:48:05.011Z):
  supplies the perpendicular-to-x / tilted-in-yz case.
- `aaa2d4ce-e030-441f-81eb-ee2b7fc43beb` (2024-03-22T15:51:15.260Z),
  `aaa2b827-4eee-4ec0-a4ea-74d4b2a1f0ca` (2024-03-22T15:55:26.098Z),
  and `aaa27985-2676-48d7-a602-7ad1e2f6ea2d` (2024-03-22T15:56:11.528Z):
  explore a tilted helix axis while the slice remains z-normal.
- `aaa2d58f-3738-44f9-9fcc-d4c054b23c2a` (2024-03-22T16:08:08.428Z)
  and `aaa2d04a-8549-4458-9381-65efb44ec6be` (2024-03-22T16:11:26.988Z):
  propose two points meeting at the origin and correct the one-line
  construction.
- `aaa2fa79-70eb-46b0-928e-ce38246f52e2` (2024-03-22T16:20:56.977Z):
  proposes two opposite-opening parabolas.
- `aaa2371d-5442-4fa3-a791-606c747f96d5` (2024-03-22T16:47:32.847Z)
  and `aaa276dc-6f4b-47cb-9bc3-3af62e81797a` (2024-03-22T16:54:51.003Z):
  generalize to tilted, curved, wavy, helical and multiply intersecting
  one-dimensional shapes.
- `aaa2a868-90fa-439f-9d9d-4cf95519ab91` (2024-03-22T16:57:54.242Z),
  `aaa28a9a-dcfc-4835-8359-e7da7b36911c` (2024-03-22T17:07:55.781Z),
  and `aaa246c9-e52c-4650-84e8-b078149df0cc` (2024-03-22T18:05:42.011Z):
  lift the construction to 4D strings intersecting a 3D time surface, then
  discuss static 4D geometry and braiding.

The formulas below are assistant reconstructions, not verbatim Nathan
equations. Coordinates are (x,y,z), with the moving slice z = Z0 + v*t.
The user asks whether the y-rate equals the slice speed; the historical
assistant confirms without enough geometric information. The exact rate is
(dy/ds)/(dz/ds) times the slice speed. Equality requires dy = dz. The
opposite parabolas are represented by the standard model y = ±z^2, which
does not produce constant-speed convergence under a constant-speed z-slice.

For a circular cross-section whose axis is tilted in the yz-plane, a fixed
z-normal slice gives an oblique projection. Writing c = cos(beta), the
projected coordinates are (r*u, r*v/c), with u^2+v^2=1. This is an ellipse,
not a circle, unless the tilt vanishes (c=1). This is a conditional
projection model, not a full solution of the implicit tilted-helix/slice
intersection. No physical dynamics, metric, or time-surface law is encoded.
-/

namespace HsHVerification.MovingPlaneTraceGeometry

/-- A straight line in R^3, parameterized by s. -/
def linePoint (x0 y0 z0 dx dy dz s : ℝ) : ℝ × ℝ × ℝ :=
  (x0 + dx * s, y0 + dy * s, z0 + dz * s)

/-- Parameter at which a transverse line meets the slice z = Z. -/
def sliceParameter (z0 dz Z : ℝ) : ℝ :=
  (Z - z0) / dz

/-- The intersection point of a line with the slice z = Z. -/
def lineSlicePoint (x0 y0 z0 dx dy dz Z : ℝ) : ℝ × ℝ × ℝ :=
  linePoint x0 y0 z0 dx dy dz (sliceParameter z0 dz Z)

/-- x-coordinate of the line/slice intersection. -/
def sliceX (x0 z0 dx dz Z : ℝ) : ℝ :=
  x0 + dx * ((Z - z0) / dz)

/-- y-coordinate of the line/slice intersection. -/
def sliceY (y0 z0 dy dz Z : ℝ) : ℝ :=
  y0 + dy * ((Z - z0) / dz)

/-- The intersection point lies on the requested z-slice when dz is nonzero. -/
theorem lineSlicePoint_z
    (x0 y0 z0 dx dy dz Z : ℝ) (hdz : dz ≠ 0) :
    (lineSlicePoint x0 y0 z0 dx dy dz Z).2.2 = Z := by
  simp [lineSlicePoint, linePoint, sliceParameter]
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

/-- A concrete line with dy = 2 and dz = 1 moves its intersection at
    twice the slice speed. -/
theorem y_rate_witness :
    (movingSliceY 0 0 2 1 0 1 1
      - movingSliceY 0 0 2 1 0 1 0) / (1 - 0) = 2 := by
  norm_num [movingSliceY, sliceY]

theorem y_rate_need_not_equal_slice_speed :
    (movingSliceY 0 0 2 1 0 1 1
      - movingSliceY 0 0 2 1 0 1 0) / (1 - 0) ≠ 1 := by
  rw [y_rate_witness]
  norm_num

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

/-- Oblique projection of a circular cross-section into a fixed z-normal
    slice. Here c is the cosine of the axis tilt and (u,v) is a unit-circle
    parameter. -/
def obliqueCircleSection (r c u v : ℝ) : ℝ × ℝ :=
  (r * u, r * v / c)

/-- The projected circle lies on the ellipse x^2 + (c*y)^2 = r^2. -/
theorem obliqueCircleSection_on_ellipse
    (r c u v : ℝ) (hc : c ≠ 0) (hunit : u ^ 2 + v ^ 2 = 1) :
    (obliqueCircleSection r c u v).1 ^ 2
      + (c * (obliqueCircleSection r c u v).2) ^ 2 = r ^ 2 := by
  simp [obliqueCircleSection]
  field_simp [hc]
  nlinarith [hunit]

/-- At the vertical unit-circle parameter, the projected semi-axis is r/c. -/
theorem obliqueCircleSection_vertical_semiaxis (r c : ℝ) :
    (obliqueCircleSection r c 0 1).2 = r / c := by
  simp [obliqueCircleSection]

#print axioms lineSlicePoint_z
#print axioms movingSliceX_rate
#print axioms movingSliceY_rate
#print axioms y_rate_eq_slice_speed_of_equal_components
#print axioms y_rate_witness
#print axioms y_rate_need_not_equal_slice_speed
#print axioms parabolas_meet_at_origin
#print axioms parabolicSeparation_eq
#print axioms parabolicSeparation_positive
#print axioms parabolicSeparation_even
#print axioms parabolicSeparation_strictly_increases_with_positive_slice
#print axioms obliqueCircleSection_on_ellipse
#print axioms obliqueCircleSection_vertical_semiaxis

end HsHVerification.MovingPlaneTraceGeometry
