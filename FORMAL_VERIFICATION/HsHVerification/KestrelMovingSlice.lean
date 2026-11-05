import Mathlib

/-!
Source-conditional geometry fidelity gate for Nathan's historical moving-plane
line/helix construction.

Primary raw transcript:
HsH `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`,
Git blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`, JSON `conversation_id`
`252d05c0-22ed-4ea2-a474-7966ab13145a`, created 2024-03-22.
The earlier working-note locator `2cea192a7d16b57a27c531ac7c860e42`
is not the raw JSON `conversation_id`.
Direct user nodes:
* `aaa2269b-7eab-4781-9454-647098d6747f`: ideal line and plane meet at
  one point, not a spiral pattern.
* `aaa2d0b1-017d-453e-b95a-b23915f87d32`: moving plane makes H trace
  a circle; angular speed depends on pitch and slice rate.
* `aaa2a1cc-e884-4f6a-800f-8afc29ab221a`: orbit radius depends on the
  helix cross-section, not pitch.
* `aaa2d58f-3738-44f9-9fcc-d4c054b23c2a`: rejects a maximum/minimum
  radius interpretation for a perfect helix.
* `aaa26a36-fc31-4d8f-8c66-c1743e7fbaf5`: the plane is z-normal and moves
  at rate T; the line lies in the yz-plane, and the user asks whether its
  in-plane y-coordinate moves at the same rate.
* `aaa2b827-4eee-4ec0-a4ea-74d4b2a1f0ca` and
  `aaa27985-2676-48d7-a602-7ad1e2f6ea2d`: tilted-axis/orbit discussion.
  The phrase comparing an angle to helix pitch is dimensionally
  underspecified and is not used as a formal premise below.
* Assistant message `e7abb2e5-0991-408c-a5bb-4abbe26c6f55` incorrectly
  affirms the y-rate equals T without a slope restriction.

Historical flattened source: SAT archive `RMS SAT.txt`, Git blob
`4eb4146f74b089aa7d587bbf9cbcbc6c56c49513`.
The equations below are assistant reconstructions from those direct
geometric constraints, not user-supplied formulas. They prove only symbolic
relationships under explicit assumptions. They do not authenticate authorship,
prove a physical model, or infer empirical particle properties.
-/

namespace HsHVerification.KestrelMovingSlice

/-- The moving-plane readout of a constant-radius inclined helix obeys
an ellipse equation when u²+v²=1, x=a*u, and c*y=a*v.
Here c is the cosine of the tilt, with y relative to the straight-axis
intersection in the plane. This is the exact algebraic readout contract,
not an independently established H(s)H construction. -/
theorem moving_slice_ellipse
    (a c u v x y : ℝ)
    (hphase : u^2 + v^2 = 1)
    (hx : x = a * u)
    (hy : c * y = a * v) :
    x^2 + (c * y)^2 = a^2 := by
  rw [hx, hy]
  calc
    (a * u)^2 + (a * v)^2 = a^2 * (u^2 + v^2) := by ring
    _ = a^2 := by rw [hphase]; ring

/-- For a nontrivial tilt and nonzero transverse y coordinate,
the ellipse readout cannot simultaneously be a circle of radius a. -/
theorem tilted_slice_not_circle
    (a c x y : ℝ)
    (hc : c^2 ≠ 1)
    (hy : y ≠ 0)
    (hellipse : x^2 + (c * y)^2 = a^2) :
    x^2 + y^2 ≠ a^2 := by
  intro hcircle
  have hzero : (c^2 - 1) * y^2 = 0 := by
    nlinarith [hellipse, hcircle]
  have hc1 : c^2 - 1 ≠ 0 := sub_ne_zero.mpr hc
  have hy2 : y^2 ≠ 0 := pow_ne_zero 2 hy
  exact (mul_ne_zero hc1 hy2) hzero

/-- In a diagonal straight-line intersection, the slice-displacement
rate equals the slice rate only if the line slope is one, or if the
slice does not move. The source assistant accepted equality without
specifying either restriction. -/
theorem diagonal_trace_rate_not_equal
    (slope dz dy : ℝ)
    (hslope : slope ≠ 1)
    (hdz : dz ≠ 0)
    (htrace : dy = slope * dz) :
    dy ≠ dz := by
  intro heq
  have hzero : (slope - 1) * dz = 0 := by
    nlinarith [htrace, heq]
  exact (mul_ne_zero (sub_ne_zero.mpr hslope) hdz) hzero

/-!
## Exact affine slope factor for a moving z-normal slice

The 2024 direct description specifies a line in the y-z plane and a
z-normal plane moving at rate T, but the assistant's equality of the
in-plane y-rate with T omits the line's slope. The following conditional
coordinate model makes the missing ratio explicit. It is a mathematical
reconstruction, not a verbatim Nathan equation or physical measurement.
-/

/-- A straight line in the y-z plane, parameterized by s. -/
def yzLinePoint (y0 z0 dy dz s : ℝ) : ℝ × ℝ :=
  (y0 + dy * s, z0 + dz * s)

/-- The parameter at which the line meets z = z0 + speed * t. -/
noncomputable def movingSliceLineParameter (dz speed t : ℝ) : ℝ :=
  speed * t / dz

/-- The point where the line meets the moving z-normal plane. -/
noncomputable def movingSliceIntersection (y0 z0 dy dz speed t : ℝ) : ℝ × ℝ :=
  yzLinePoint y0 z0 dy dz (movingSliceLineParameter dz speed t)

/-- For nonzero z-direction, the constructed intersection lies on the
moving plane z = z0 + speed * t. -/
theorem moving_slice_intersection_on_plane
    (y0 z0 dy dz speed t : ℝ) (hdz : dz ≠ 0) :
    (movingSliceIntersection y0 z0 dy dz speed t).2 = z0 + speed * t := by
  simp [movingSliceIntersection, yzLinePoint, movingSliceLineParameter]
  field_simp [hdz]

/-- The exact in-plane y-displacement rate is (dy/dz) times the plane
speed. The source assistant's rate-equals-T claim is the special case
dy = dz, not the general diagonal-line case. -/
theorem moving_slice_intersection_y_rate
    (y0 z0 dy dz speed t1 t2 : ℝ)
    (hdz : dz ≠ 0) (ht : t1 ≠ t2) :
    ((movingSliceIntersection y0 z0 dy dz speed t2).1
      - (movingSliceIntersection y0 z0 dy dz speed t1).1) / (t2 - t1)
      = (dy * speed) / dz := by
  have hdt : t2 - t1 ≠ 0 := sub_ne_zero.mpr ht.symm
  simp [movingSliceIntersection, yzLinePoint, movingSliceLineParameter]
  field_simp [hdz, hdt]

#print axioms moving_slice_intersection_on_plane
#print axioms moving_slice_intersection_y_rate

#print axioms moving_slice_ellipse
#print axioms tilted_slice_not_circle
#print axioms diagonal_trace_rate_not_equal

end HsHVerification.KestrelMovingSlice
