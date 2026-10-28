import Mathlib

/-!
Source-conditional geometry fidelity gate for Nathan's historical moving-plane
line/helix construction, 2026-10-28.
Original flattened transcript: Satobloc/SAT_THEORY_ARCHIVE_2023-25,
RMS SAT.txt, Git blob 4eb4146f74b089aa7d587bbf9cbcbc6c56c49513.
Role-tagged opening: HsH DIMENSIONAL GRAVITY, 2024-03-28.
These theorems prove only symbolic relationships under explicitly given
assumptions. They do not authenticate authorship, prove a physical model,
or infer empirical particle properties.
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
