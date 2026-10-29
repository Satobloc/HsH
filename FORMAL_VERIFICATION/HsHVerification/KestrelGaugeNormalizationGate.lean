import Mathlib

/-!
# Kestrel: gravitational/gauge coefficient namespaces and historical normalization

Historical source: Satobloc/SAT_THEORY_ARCHIVE_2023-25,
SAT-O Theory Work/pre-mathproofBAK.txt, Git blob
843efca87b817ed75a03278225aca5cc615cdc7a.
The source separately gives gravitational kappa = 8*pi*G/c^4 and
gauge g_G^(-2) = rho_G/2, alongside g_G = 1/sqrt(rho_G).

The theorem checks only the conditional algebraic incompatibility of
the TWO exact gauge equalities for positive rho. If the historical
second relation is approximate, uses a different density convention,
or suppresses a normalization factor, that requires source recovery.
This theorem does NOT prove a physical gauge law, a frame-dragging
decoupling mechanism, or any property of actual matter.
-/

namespace HsHVerification.KestrelGaugeNormalizationGate

/-- The two historical gauge normalizations cannot both be exact for
positive density and real coupling, without a hidden rescaling. -/
theorem inverse_square_vs_sqrt_normalization
    (g rho : ℝ) (hrho : 0 < rho)
    (hInv : 1 / g^2 = rho / 2)
    (hSqrt : g = 1 / Real.sqrt rho) : False := by
  have hnorm : g^2 * rho = 1 := by
    rw [hSqrt, one_div, inv_pow, Real.sq_sqrt (le_of_lt hrho)]
    field_simp [ne_of_gt hrho]
  have hg : g ≠ 0 := by
    intro hz
    simp [hz] at hnorm
  have hfirst : 2 = rho * g^2 := by
    have h := hInv
    field_simp [pow_ne_zero 2 hg] at h
    nlinarith
  nlinarith [hnorm]

#print axioms inverse_square_vs_sqrt_normalization

end HsHVerification.KestrelGaugeNormalizationGate
