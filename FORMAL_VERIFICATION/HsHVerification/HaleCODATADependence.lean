import Mathlib
import HsHVerification.RavelKNMassCancellation

/-!
Hale external-calibration review, 2026-10-27. Conditional SI/CODATA algebra.
Historical/current source: HsH/WORKSPACES/RAVEL/KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md,
blob 8bc65c97e88afd9c7e6add7386574c0eea3492b9, sections 3-4.
Original CODATA 2022 source: NIST SP 961 (May 2024) and RMP 97 025002 (2025).
In the post-2019 SI e,h,c are exact; epsilon0 is inferred from measured alpha.
These theorems formalize the dependence, not a new physical prediction.
-/

namespace HsHVerification.HaleCODATADependence

noncomputable def epsilonFromAlpha (e h c alpha : ℝ) : ℝ :=
  e ^ 2 / (2 * alpha * h * c)

noncomputable def alphaFromEpsilon (e h c epsilon : ℝ) : ℝ :=
  e ^ 2 / (2 * epsilon * h * c)

/-- With nonzero defining constants, deriving epsilon0 from alpha and
    recomputing alpha from epsilon0 is algebraically a round trip. -/
theorem alpha_roundtrip
    (e h c alpha : ℝ) (he : e ≠ 0) (hh : h ≠ 0)
    (hc : c ≠ 0) (ha : alpha ≠ 0) :
    alphaFromEpsilon e h c (epsilonFromAlpha e h c alpha) = alpha := by
  dsimp [alphaFromEpsilon, epsilonFromAlpha]
  field_simp [he, hh, hc, ha]
  <;> ring

/-- The exact unrounded CODATA-consistent residual is zero by construction. -/
theorem alpha_residual_zero
    (e h c alpha : ℝ) (he : e ≠ 0) (hh : h ≠ 0)
    (hc : c ≠ 0) (ha : alpha ≠ 0) :
    alphaFromEpsilon e h c (epsilonFromAlpha e h c alpha) - alpha = 0 := by
  rw [alpha_roundtrip e h c alpha he hh hc ha]
  ring

/-- Link to Ravel's compiled conditional Kerr-Newman control: the
    normalized radius reduces to the *input* alpha when epsilon0 is
    defined from that same alpha. This cannot be a held-out prediction. -/
theorem kn_ratio_reuses_alpha
    (G m c e h alpha : ℝ) (hG : G ≠ 0) (hm : m ≠ 0)
    (hc : c ≠ 0) (he : e ≠ 0) (hh : h ≠ 0)
    (ha : alpha ≠ 0) :
    RavelKNMassCancellation.turnaroundRadius G m c
      (e ^ 2 / (4 * Real.pi * epsilonFromAlpha e h c alpha)) /
    RavelKNMassCancellation.spinLength (h / (2 * Real.pi)) m c = alpha := by
  have hbar_nonzero : h / (2 * Real.pi) ≠ 0 :=
    div_ne_zero hh (mul_ne_zero (by norm_num) Real.pi_ne_zero)
  rw [RavelKNMassCancellation.normalized_turnaround_eq_alpha G m c
    (e ^ 2 / (4 * Real.pi * epsilonFromAlpha e h c alpha))
    (h / (2 * Real.pi)) hG hm hc hbar_nonzero]
  dsimp [RavelKNMassCancellation.fineStructure, epsilonFromAlpha]
  field_simp [he, hh, hc, ha, Real.pi_ne_zero]
  <;> ring

#print axioms HsHVerification.HaleCODATADependence.alpha_roundtrip
#print axioms HsHVerification.HaleCODATADependence.alpha_residual_zero
#print axioms HsHVerification.HaleCODATADependence.kn_ratio_reuses_alpha
