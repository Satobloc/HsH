import Mathlib

namespace HsHVerification.TorusFlickerSlopeAlgebra

/--
The tangent-addition slope map used in the historical flat-coordinate
reconstruction of torus winding:
  r ↦ (r + t) / (1 - r*t).

This file proves only the conditional real-algebra statement. It does not
identify the source's embedded donut with a flat quotient torus, does not
prove a trajectory is geodesic, and says nothing about physical chirality.
-/
def rotateSlope (r t : ℝ) : ℝ := (r + t) / (1 - r * t)

/-- An irrational tangent increment cannot make the tangent-addition
denominator vanish when the initial slope is rational. -/
theorem denominator_ne_zero_of_irrational
    (r : ℚ) (t : ℝ) (ht : Irrational t) :
    1 - (r : ℝ) * t ≠ 0 := by
  intro hden
  have hprod : (r : ℝ) * t = 1 := by linarith
  have hr : (r : ℝ) ≠ 0 := by
    intro hr0
    rw [hr0] at hprod
    norm_num at hprod
  have htRat : t = (((1 / r : ℚ) : ℝ)) := by
    apply (eq_div_iff hr).2
    simpa [mul_comm] using hprod
  exact ht ⟨1 / r, htRat.symm⟩

/--
If the initial slope is rational and the tangent of the angular increment
is irrational, the tangent-addition result is irrational.

This formalizes the assistant's flat-coordinate algebra only. It is not a
theorem about the embedded ring torus, geodesic flow, the 3-torus proposal,
or the physical "flicker" mechanism.
-/
theorem irrational_slope_after_rational_angle_shift
    (r : ℚ) (t : ℝ) (ht : Irrational t) :
    Irrational (rotateSlope (r : ℝ) t) := by
  have hden := denominator_ne_zero_of_irrational r t ht
  intro h
  rcases h with ⟨q, hq⟩
  have hmul : (q : ℝ) * (1 - (r : ℝ) * t) = (r : ℝ) + t := by
    calc
      (q : ℝ) * (1 - (r : ℝ) * t)
          = rotateSlope (r : ℝ) t * (1 - (r : ℝ) * t) := by rw [hq]
      _ = (r : ℝ) + t := by
        simp [rotateSlope, hden]
  have hden2 : 1 + (q : ℝ) * (r : ℝ) ≠ 0 := by
    intro hz
    have hqr : (q : ℝ) * (r : ℝ) = -1 := by linarith
    have hmul' : (q : ℝ) - (q : ℝ) * (r : ℝ) * t = (r : ℝ) + t := by
      calc
        (q : ℝ) - (q : ℝ) * (r : ℝ) * t
            = (q : ℝ) * (1 - (r : ℝ) * t) := by ring
        _ = (r : ℝ) + t := hmul
    have hqeq : (q : ℝ) = (r : ℝ) := by
      rw [hqr] at hmul'
      linarith
    have hr2 : (r : ℝ) * (r : ℝ) = -1 := by
      calc
        (r : ℝ) * (r : ℝ) = (q : ℝ) * (r : ℝ) := by rw [← hqeq]
        _ = -1 := hqr
    nlinarith [hr2, sq_nonneg (r : ℝ)]
  have hsolve : t * (1 + (q : ℝ) * (r : ℝ)) = (q : ℝ) - (r : ℝ) := by
    have hmul' : (q : ℝ) - (q : ℝ) * (r : ℝ) * t = (r : ℝ) + t := by
      calc
        (q : ℝ) - (q : ℝ) * (r : ℝ) * t
            = (q : ℝ) * (1 - (r : ℝ) * t) := by ring
        _ = (r : ℝ) + t := hmul
    nlinarith [hmul']
  have htRat : t = (((q - r) / (1 + q * r) : ℚ) : ℝ) := by
    calc
      t = ((q : ℝ) - (r : ℝ)) / (1 + (q : ℝ) * (r : ℝ)) :=
        (eq_div_iff hden2).2 hsolve
      _ = (((q - r) / (1 + q * r) : ℚ) : ℝ) := by push_cast; ring
  exact ht ⟨(q - r) / (1 + q * r), htRat.symm⟩

#print axioms denominator_ne_zero_of_irrational
#print axioms irrational_slope_after_rational_angle_shift

end HsHVerification.TorusFlickerSlopeAlgebra
