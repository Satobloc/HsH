import Mathlib
import HsHVerification.EnheduannaFourViewReadout

/-!
# Phase-complete six-sample augmentation for m = 1 versus m = 3

The conditional four-cardinal operator in
`EnheduannaFourViewReadout` distinguishes m = 1 from m = 3 exactly when
`ε * sin φ ≠ 0`. It therefore has a phase blind spot at `sin φ = 0`.

This module adds a third antipodal pair at azimuth π/3. Under the same
single-harmonic radial ansatz, the resulting six-sample operator distinguishes
m = 1 from m = 3 exactly when `ε ≠ 0`. The extra pair is a proposed sampling
operator, not a recovered camera map for the experiment.

Scope limits:
* no claim that the paper's acquisition actually sampled π/3;
* no proof that the physical vortex is single-harmonic;
* no camera projection, synchronization, contour-extraction, noise, or
  calibration model is formalized here;
* the six-sample operator remains globally non-injective in mode index.
-/

namespace HsHVerification.PhaseCompleteSixViewReadout

open HsHVerification.NadirVortexTwoChannelReadout
open HsHVerification.EnheduannaFourViewReadout

noncomputable section

abbrev SixViewReadout := FourViewReadout × Readout

/-- The four cardinal samples, augmented by a third antipodal pair at π/3. -/
def sixViewModeReadout (m : ℕ) (a₀ ε φ : ℝ) : SixViewReadout :=
  (fourViewModeReadout m a₀ ε φ,
   antipodalModeReadout m a₀ ε (φ + (m : ℝ) * Real.pi / 3))

/-- The four-cardinal operator has an exact m=1/m=3 alias at phase φ=0. -/
theorem fourViewModeReadout_one_three_alias_at_zero
    (a₀ ε : ℝ) :
    fourViewModeReadout 1 a₀ ε 0 = fourViewModeReadout 3 a₀ ε 0 := by
  exact (fourViewModeReadout_one_three_eq_iff_signal_zero a₀ ε 0).2 (by simp)

/-- Adding the π/3 antipodal pair removes the four-view phase blind spot:
the six-sample readout identifies m=1 against m=3 for every phase iff the
single-harmonic amplitude is nonzero. This is an operator theorem, not an
empirical mode-identification claim. -/
theorem sixViewModeReadout_one_three_eq_iff_zero
    (a₀ ε φ : ℝ) :
    sixViewModeReadout 1 a₀ ε φ = sixViewModeReadout 3 a₀ ε φ ↔ ε = 0 := by
  constructor
  · intro h
    have hfour :
        fourViewModeReadout 1 a₀ ε φ =
          fourViewModeReadout 3 a₀ ε φ :=
      congrArg Prod.fst h
    have hthird :
        antipodalModeReadout 1 a₀ ε (φ + Real.pi / 3) =
          antipodalModeReadout 3 a₀ ε (φ + 3 * Real.pi / 3) := by
      simpa [sixViewModeReadout] using congrArg Prod.snd h
    have hsinprod : ε * Real.sin φ = 0 :=
      (fourViewModeReadout_one_three_eq_iff_signal_zero a₀ ε φ).1 hfour
    by_contra hε
    have hsin : Real.sin φ = 0 :=
      (mul_eq_zero.mp hsinprod).resolve_left hε
    have hphase : φ + 3 * Real.pi / 3 = φ + Real.pi := by ring
    have hthird' :
        antipodalModeReadout 1 a₀ ε (φ + Real.pi / 3) =
          antipodalModeReadout 1 a₀ ε (φ + Real.pi) := by
      calc
        antipodalModeReadout 1 a₀ ε (φ + Real.pi / 3) =
            antipodalModeReadout 3 a₀ ε (φ + 3 * Real.pi / 3) := hthird
        _ = antipodalModeReadout 3 a₀ ε (φ + Real.pi) := by rw [hphase]
        _ = antipodalModeReadout 1 a₀ ε (φ + Real.pi) :=
          antipodalModeReadout_two_step 1 a₀ ε (φ + Real.pi)
    have hfirst := congrArg Prod.fst hthird'
    simp [antipodalModeReadout_one_formula] at hfirst
    have hcos1 : Real.cos (φ + Real.pi / 3) = Real.cos φ / 2 := by
      rw [Real.cos_add]
      simp [hsin, Real.cos_pi_div_three]
    have hcos3 : Real.cos (φ + Real.pi) = -Real.cos φ := by
      rw [Real.cos_add]
      simp
    have hproduct : ε * (Real.cos φ / 2) = ε * (-Real.cos φ) := by
      simpa [hcos1, hcos3] using hfirst
    have hcosprod : ε * Real.cos φ = 0 := by
      nlinarith [hproduct]
    have hcos : Real.cos φ = 0 :=
      (mul_eq_zero.mp hcosprod).resolve_left hε
    have hnorm := Real.sin_sq_add_cos_sq φ
    rw [hsin, hcos] at hnorm
    norm_num at hnorm
  · intro hε
    subst ε
    simp [sixViewModeReadout, fourViewModeReadout, antipodalModeReadout,
      radialModeContour, observe, displacement, coreRadius]

/-- The six-view operator is still not a global mode classifier: its
four-view component is 4-periodic, while the added pair is 6-periodic after
its mode-dependent phase shift. Their composition retains an m ↔ m+12 alias. -/
theorem sixViewModeReadout_twelve_step
    (m : ℕ) (a₀ ε φ : ℝ) :
    sixViewModeReadout (m + 12) a₀ ε φ =
      sixViewModeReadout m a₀ ε φ := by
  unfold sixViewModeReadout
  apply Prod.ext
  · calc
      fourViewModeReadout (m + 12) a₀ ε φ =
          fourViewModeReadout (m + 8) a₀ ε φ := by
            simpa [Nat.add_assoc] using
              (fourViewModeReadout_four_step (m + 8) a₀ ε φ)
      _ = fourViewModeReadout (m + 4) a₀ ε φ := by
            simpa [Nat.add_assoc] using
              (fourViewModeReadout_four_step (m + 4) a₀ ε φ)
      _ = fourViewModeReadout m a₀ ε φ :=
            fourViewModeReadout_four_step m a₀ ε φ
  · have hphase :
        φ + ((m + 12 : ℕ) : ℝ) * Real.pi / 3 =
          (φ + (m : ℝ) * Real.pi / 3) + 4 * Real.pi := by
      push_cast
      ring
    rw [hphase]
    let ψ := φ + (m : ℝ) * Real.pi / 3
    have hperiod₁ :
        antipodalModeReadout (m + 12) a₀ ε (ψ + 4 * Real.pi) =
          antipodalModeReadout (m + 12) a₀ ε (ψ + 2 * Real.pi) := by
      have h := antipodalModeReadout_phase_two_pi (m + 12) a₀ ε
        (ψ + 2 * Real.pi)
      simpa [show (ψ + 2 * Real.pi) + 2 * Real.pi =
        ψ + 4 * Real.pi by ring] using h
    have hperiod₂ :
        antipodalModeReadout (m + 12) a₀ ε (ψ + 2 * Real.pi) =
          antipodalModeReadout (m + 12) a₀ ε ψ :=
      antipodalModeReadout_phase_two_pi (m + 12) a₀ ε ψ
    calc
      antipodalModeReadout (m + 12) a₀ ε (ψ + 4 * Real.pi) =
          antipodalModeReadout (m + 12) a₀ ε (ψ + 2 * Real.pi) := hperiod₁
      _ = antipodalModeReadout (m + 12) a₀ ε ψ := hperiod₂
      _ = antipodalModeReadout (m + 10) a₀ ε ψ :=
        antipodalModeReadout_two_step (m + 10) a₀ ε ψ
      _ = antipodalModeReadout (m + 8) a₀ ε ψ :=
        antipodalModeReadout_two_step (m + 8) a₀ ε ψ
      _ = antipodalModeReadout (m + 6) a₀ ε ψ :=
        antipodalModeReadout_two_step (m + 6) a₀ ε ψ
      _ = antipodalModeReadout (m + 4) a₀ ε ψ :=
        antipodalModeReadout_two_step (m + 4) a₀ ε ψ
      _ = antipodalModeReadout (m + 2) a₀ ε ψ :=
        antipodalModeReadout_two_step (m + 2) a₀ ε ψ
      _ = antipodalModeReadout m a₀ ε ψ :=
        antipodalModeReadout_two_step m a₀ ε ψ

/-- Consequently, the six-view operator is not injective on all mode indices. -/
theorem sixViewModeReadout_not_injective
    (a₀ ε φ : ℝ) :
    ¬ Function.Injective
      (fun m : Fin 14 => sixViewModeReadout m.val a₀ ε φ) := by
  intro hinj
  have hEq :
      (fun m : Fin 14 => sixViewModeReadout m.val a₀ ε φ) 1 =
        (fun m : Fin 14 => sixViewModeReadout m.val a₀ ε φ) 13 := by
    simpa using (sixViewModeReadout_twelve_step 1 a₀ ε φ).symm
  have hne : (1 : Fin 14) ≠ 13 := by decide
  exact hne (hinj hEq)

/-- Exact rational sanity check for φ=0 and ε=1 at the new π/3 pair:
m=1 gives 1/2 and m=3 gives -1. This is a formal unit test, not physical
data or an experimental measurement. -/
def phaseZeroThirdPairCoefficients : ℚ × ℚ := (1 / 2, -1)

#eval phaseZeroThirdPairCoefficients
#eval decide
  (phaseZeroThirdPairCoefficients.1 ≠ phaseZeroThirdPairCoefficients.2)

#print axioms sixViewModeReadout_one_three_eq_iff_zero
#print axioms sixViewModeReadout_twelve_step
#print axioms sixViewModeReadout_not_injective

end
end HsHVerification.PhaseCompleteSixViewReadout
