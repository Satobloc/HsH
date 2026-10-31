import Mathlib

namespace HsHVerification.HaleGW250114DirectWave

noncomputable section

/-!
Source-derived conditional algebra for the direct-wave and rational-filter
representations used in recent black-hole ringdown analyses.

Source families:
* Lu et al., "GW250114 reveals signatures of post-merger black-hole horizon",
  Nature (2026), Supplementary Information; arXiv:2510.01001.
* Sun et al., "Complex frequency evolution of direct waves from binary black
  hole mergers", arXiv:2608.23209.
* Ma and Wang, "Foundations of Direct Waves in Schwarzschild Ringdown",
  arXiv:2607.06677.
* Dyer, Chung, and Moore, "Modeling Direct Waves in Binary Black Hole
  Ringdowns", arXiv:2606.25021.

The equations below are standard-source equations, not Nathan Direct equations.
This file proves only their stated algebraic consequences. It does not prove
that the physical source model, filtering interpretation, Kerr background,
or mapping to H(s)H is correct.
-/

def directWaveOmega (β ΩH Ωorb : ℝ) : ℝ :=
  (β * ΩH + Ωorb) / (1 + β)

def directWaveDecay (β κH : ℝ) : ℝ :=
  (2 * β * κH) / (1 + β)

theorem directWaveOmega_reverse
    (β ΩH Ωorb Ωobs : ℝ)
    (hβ : 0 ≤ β)
    (h : directWaveOmega β ΩH Ωorb = Ωobs) :
    Ωorb = (1 + β) * Ωobs - β * ΩH := by
  have hden : 1 + β ≠ 0 := by linarith
  unfold directWaveOmega at h
  have hmul : β * ΩH + Ωorb = Ωobs * (1 + β) :=
    (div_eq_iff hden).mp h
  linarith

theorem directWaveOmega_horizon_offset
    (β ΩH Ωorb : ℝ)
    (hβ : 0 ≤ β) :
    directWaveOmega β ΩH Ωorb - ΩH =
      (Ωorb - ΩH) / (1 + β) := by
  unfold directWaveOmega
  have hden : 1 + β ≠ 0 := by linarith
  field_simp [hden]
  ring

theorem directWaveDecay_nonneg
    (β κH : ℝ)
    (hβ : 0 ≤ β)
    (hκ : 0 < κH) :
    0 ≤ directWaveDecay β κH := by
  unfold directWaveDecay
  positivity

theorem directWaveDecay_lt_twoKappa
    (β κH : ℝ)
    (hβ : 0 ≤ β)
    (hκ : 0 < κH) :
    directWaveDecay β κH < 2 * κH := by
  unfold directWaveDecay
  have hden : 0 < 1 + β := by linarith
  apply (div_lt_iff₀ hden).2
  nlinarith


/-- Under the source model's timelike tortoise-coordinate bound β < 1,
the instantaneous source damping is strictly below the Kerr surface-gravity
scale κH. This is conditional on that model's definition of β. -/
theorem directWaveDecay_lt_kappa
    (β κH : ℝ)
    (hβ : 0 ≤ β)
    (hβ1 : β < 1)
    (hκ : 0 < κH) :
    directWaveDecay β κH < κH := by
  unfold directWaveDecay
  have hden : 0 < 1 + β := by linarith
  apply (div_lt_iff₀ hden).2
  nlinarith

theorem directWaveDecay_reverse
    (β κH γ : ℝ)
    (hβ : 0 ≤ β)
    (hκ : 0 < κH)
    (h : directWaveDecay β κH = γ) :
    β = γ / (2 * κH - γ) := by
  have hden : 1 + β ≠ 0 := by linarith
  have hmul : 2 * β * κH = γ * (1 + β) := by
    unfold directWaveDecay at h
    exact (div_eq_iff hden).mp h
  have hdiffpos : 0 < 2 * κH - γ := by
    rw [← h]
    unfold directWaveDecay
    have hcalc :
        2 * κH - (2 * β * κH) / (1 + β) =
          2 * κH / (1 + β) := by
      field_simp [hden]
      ring
    rw [hcalc]
    positivity
  have hdiff : 2 * κH - γ ≠ 0 := ne_of_gt hdiffpos
  have hprod : β * (2 * κH - γ) = γ := by
    nlinarith [hmul]
  field_simp [hdiff]
  exact hprod

theorem norm_sub_conj_eq (x : ℝ) (z : ℂ) :
    ‖(x : ℂ) - z‖ = ‖(x : ℂ) - star z‖ := by
  calc
    ‖(x : ℂ) - z‖ =
        ‖star ((x : ℂ) - z)‖ := by
          symm
          exact Complex.norm_conj _
    _ = ‖(x : ℂ) - star z‖ := by simp

theorem norm_add_conj_eq (x : ℝ) (z : ℂ) :
    ‖(x : ℂ) + star z‖ = ‖(x : ℂ) + z‖ := by
  calc
    ‖(x : ℂ) + star z‖ =
        ‖star ((x : ℂ) + star z)‖ := by
          symm
          exact Complex.norm_conj _
    _ = ‖(x : ℂ) + z‖ := by simp

/-- One conjugate-paired factor of the rational all-pass filter. -/
def rationalFilterFactor (x : ℝ) (z : ℂ) : ℂ :=
  (((x : ℂ) - z) / ((x : ℂ) - star z)) *
    (((x : ℂ) + star z) / ((x : ℂ) + z))

theorem rationalFilterFactor_norm_one
    (x : ℝ) (z : ℂ)
    (hminus : (x : ℂ) - star z ≠ 0)
    (hplus : (x : ℂ) + z ≠ 0) :
    ‖rationalFilterFactor x z‖ = 1 := by
  unfold rationalFilterFactor
  rw [norm_mul, norm_div, norm_div]
  rw [norm_sub_conj_eq, norm_add_conj_eq]
  have hminusNorm :
      ‖(x : ℂ) - star z‖ ≠ 0 :=
    (norm_pos_iff.mpr hminus).ne'
  have hplusNorm :
      ‖(x : ℂ) + z‖ ≠ 0 :=
    (norm_pos_iff.mpr hplus).ne'
  simp [hminusNorm, hplusNorm]

/-- Finite ordered product of conjugate-paired rational-filter factors. -/
def rationalFilter (x : ℝ) : List ℂ → ℂ
  | [] => 1
  | z :: zs => rationalFilterFactor x z * rationalFilter x zs

theorem rationalFilter_norm_one (x : ℝ) :
    ∀ roots : List ℂ,
      (∀ z ∈ roots, (x : ℂ) - star z ≠ 0) →
      (∀ z ∈ roots, (x : ℂ) + z ≠ 0) →
      ‖rationalFilter x roots‖ = 1 := by
  intro roots
  induction roots with
  | nil =>
      intro hminus hplus
      simp [rationalFilter]
  | cons z zs ih =>
      intro hminus hplus
      have hminusZ : (x : ℂ) - star z ≠ 0 :=
        hminus z (by simp)
      have hplusZ : (x : ℂ) + z ≠ 0 :=
        hplus z (by simp)
      have hminusS : ∀ w ∈ zs, (x : ℂ) - star w ≠ 0 := by
        intro w hw
        exact hminus w (by simp [hw])
      have hplusS : ∀ w ∈ zs, (x : ℂ) + w ≠ 0 := by
        intro w hw
        exact hplus w (by simp [hw])
      simp [rationalFilter,
        rationalFilterFactor_norm_one x z hminusZ hplusZ,
        ih hminusS hplusS]

#print axioms directWaveOmega_reverse
#print axioms directWaveDecay_reverse
#print axioms rationalFilterFactor_norm_one
#print axioms rationalFilter_norm_one

end

end HsHVerification.HaleGW250114DirectWave
