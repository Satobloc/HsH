import Mathlib

/-!
Mercer, 2026-10-29 12:00 UTC. SOURCE-CONDITIONAL angle namespace gate.
Original source: HsH WORKSPACES/COMMON/extraction_outputs/
2026-09-13-RAVEL-AFTER-025946.md, Git blob
2817bc71c6a101198d1547b46ed91447d38402c5.
Assistant messages 10abe1d8-46d5-457a-997b-261a7f47ca64 and
5daa8e99-4c7d-48cc-b4d4-d29916ebbf15, adjacent to Nathan's
user message 1896b541-a337-4638-b4f8-b1d53b549c6c.
The first assistant uses D/sin alpha for a tilted tube cut, the
second sets alpha=0 for filament alignment with the time normal.
The following theorems encode ONLY trigonometric reparameterization
and normal-alignment endpoint arithmetic. They do not establish
which angle the original assistant meant, a Kerr metric, physical
tube diameter, mass, or a SAT/H(s)H prediction.
Lean's totalized division by zero must NOT be interpreted as a
physical finite value of D/sin alpha at alpha=0.
-/

namespace HsHVerification.MercerAngleConventionFidelity

/-- Sheet-plane angle = pi/2 minus time-normal angle. -/
theorem complementary_angle_denominator (theta : ℝ) :
    Real.sin (Real.pi / 2 - theta) = Real.cos theta := by
  rw [Real.sin_pi_div_two_sub]

/-- Conditional rewrite of a formula when angle convention is explicit. -/
theorem rewrite_section_diameter (D theta : ℝ) :
    D / Real.sin (Real.pi / 2 - theta) = D / Real.cos theta := by
  rw [complementary_angle_denominator]

/-- At normal alignment the cosine-denominator expression is finite. -/
theorem normal_alignment_section (D : ℝ) :
    D / Real.cos 0 = D := by
  simp

/-- The sine denominator vanishes at normal alignment. -/
theorem sine_denominator_zero_at_alignment :
    Real.sin (0 : ℝ) = 0 := by
  simp

end HsHVerification.MercerAngleConventionFidelity
