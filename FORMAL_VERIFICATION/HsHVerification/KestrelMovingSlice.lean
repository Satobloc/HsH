import Mathlib

/-!
Source-conditional geometry fidelity gate for Nathan's historical moving-plane
line/helix construction.

Primary raw transcript:
HsH `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`,
Git blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`, conversation ID
`2cea192a7d16b57a27c531ac7c860e42`, created 2024-03-22.
Direct user nodes:
* `aaa2269b-7eab-4781-9454-647098d6747f`: ideal line and plane meet at
  one point, not a spiral pattern.
* `aaa2d0b1-017d-453e-b95a-b23915f87d32`: moving plane makes H trace
  a circle; angular speed depends on pitch and slice rate.
* `aaa2a1cc-e884-4f6a-800f-8afc29ab221a`: orbit radius depends on the
  helix cross-section, not pitch.
* `aaa2d58f-3738-44f9-9fcc-d4c054b23c2a`: rejects a maximum/minimum
  radius interpretation for a perfect helix.

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

#print axioms moving_slice_ellipse
#print axioms tilted_slice_not_circle
#print axioms diagonal_trace_rate_not_equal

end HsHVerification.KestrelMovingSlice
