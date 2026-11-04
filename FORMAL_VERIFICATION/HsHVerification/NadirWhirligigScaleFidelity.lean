import Mathlib

/-!
Source-fidelity formalization, Nadir-selected Workshop Relay :00, 2026-10-27 17Z.
The historical two-plane Whirligig has first-plane amplitude R and fixed
second-plane amplitude r. These are not automatically one isotropic Sim+(4)
dilation. Algebraic checks only, no empirical or constitutive claim.
-/

namespace HsHVerification.NadirWhirligigScaleFidelity

/-- Exact second-derivative norm of the variable-radius first plane,
conditional on naming Rp=R' and Rpp=R'' and q=Rp/R, qp=q'. -/
theorem variable_plane_acceleration_factorization
    (R Rp Rpp q qp omega : ℝ)
    (hRp : Rp = R * q)
    (hRpp : Rpp = R * (qp + q^2)) :
    (Rpp - R * omega^2)^2 + (2 * omega * Rp)^2 =
      R^2 * ((qp + q^2 - omega^2)^2 + 4 * omega^2 * q^2) := by
  rw [hRp, hRpp]
  ring

/-- Multiplying the first-plane logarithmic rate by the total squared
radius shows the missing second-plane contribution. -/
theorem local_global_cross_difference (R r Rp : ℝ) :
    (R^2 + r^2) * Rp - R * (R * Rp) = r^2 * Rp := by
  ring

/-- If the first-plane rate q and the total-radius rate q coincide,
while the second-plane radius is nonzero, q must vanish. -/
theorem nonzero_secondary_plane_forces_stationarity
    (R r Rp q : ℝ)
    (hplane : Rp = R * q)
    (hglobal : R * Rp = (R^2 + r^2) * q)
    (hr : r ≠ 0) : q = 0 := by
  rw [hplane] at hglobal
  have hprod : r^2 * q = 0 := by nlinarith [hglobal]
  rcases mul_eq_zero.mp hprod with hzero | hq
  · exact False.elim ((pow_ne_zero 2 hr) hzero)
  · exact hq

/-- The first-plane logarithmic rate cannot be finite at a simple
zero of its amplitude. This says nothing about a possible weak extension. -/
theorem no_finite_local_rate_at_simple_zero
    (R Rp q : ℝ) (hzero : R = 0) (hslope : Rp ≠ 0) :
    Rp ≠ R * q := by
  intro h
  apply hslope
  simpa [hzero] using h

#print axioms variable_plane_acceleration_factorization
#print axioms local_global_cross_difference
#print axioms nonzero_secondary_plane_forces_stationarity
#print axioms no_finite_local_rate_at_simple_zero

end HsHVerification.NadirWhirligigScaleFidelity
