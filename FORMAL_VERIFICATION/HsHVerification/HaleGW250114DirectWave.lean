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

/-- Source notation: the hatted orbital/source frequency scale \hat{\Omega}. -/
abbrev hatOmega := directWaveOmega

/-- Source notation: the hatted damping scale \hat{\kappa}. -/
abbrev hatKappa := directWaveDecay

/-- The complex source frequency \omega_G = 2\hat{\Omega} - i\hat{\kappa}. -/
def sourceComplexFrequency (β ΩH Ωorb κH : ℝ) : ℂ :=
  Complex.ofReal (2 * hatOmega β ΩH Ωorb) -
    Complex.I * Complex.ofReal (hatKappa β κH)

theorem sourceComplexFrequency_re
    (β ΩH Ωorb κH : ℝ) :
    Complex.re (sourceComplexFrequency β ΩH Ωorb κH) =
      2 * hatOmega β ΩH Ωorb := by
  simp [sourceComplexFrequency]

theorem sourceComplexFrequency_im
    (β ΩH Ωorb κH : ℝ) :
    Complex.im (sourceComplexFrequency β ΩH Ωorb κH) =
      -hatKappa β κH := by
  simp [sourceComplexFrequency]

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
  simp only [norm_mul, norm_div]
  have hfirst :
      ‖(x : ℂ) - z‖ / ‖(x : ℂ) - star z‖ = 1 := by
    rw [norm_sub_conj_eq]
    exact div_self ((norm_pos_iff.mpr hminus).ne')
  have hsecond :
      ‖(x : ℂ) + star z‖ / ‖(x : ℂ) + z‖ = 1 := by
    rw [norm_add_conj_eq]
    exact div_self ((norm_pos_iff.mpr hplus).ne')
  rw [hfirst, hsecond]
  norm_num

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

/-!
Source-derived calibration ledger for Prasad, Sarkar & Sarkar,
"Listening to the Horizon: Probing Near-Horizon Reflectivity with GW250114",
arXiv:2610.12429 (2026-10-08).

The analytic DW shape is described as having no free shape parameters, but:
* the plunge trajectory is calibrated to numerical relativity;
* the event fit includes complex amplitude A and time alignment delta-t;
* the echo search estimates reflectivity magnitude, phase, and delay.

This ledger distinguishes a fixed analytic shape from an uncalibrated,
parameter-free end-to-end prediction. It records the paper's stated workflow;
it does not validate the physical model.
-/

structure DirectWaveCalibrationLedger where
  freeShapeParameterCount : Nat
  trajectoryNRCalibrated : Bool
  remnantParametersEventConditioned : Bool
  complexAmplitudeFit : Bool
  timeAlignmentFit : Bool
  reflectivityMagnitudeFit : Bool
  reflectivityPhaseFit : Bool
  echoDelayFit : Bool
deriving DecidableEq, Repr

def gw250114CalibrationLedger : DirectWaveCalibrationLedger :=
  { freeShapeParameterCount := 0
    trajectoryNRCalibrated := true
    remnantParametersEventConditioned := true
    complexAmplitudeFit := true
    timeAlignmentFit := true
    reflectivityMagnitudeFit := true
    reflectivityPhaseFit := true
    echoDelayFit := true }

def shapeFixed (m : DirectWaveCalibrationLedger) : Prop :=
  m.freeShapeParameterCount = 0

def hasCalibrationOrFit (m : DirectWaveCalibrationLedger) : Prop :=
  m.trajectoryNRCalibrated = true ∨
  m.remnantParametersEventConditioned = true ∨
  m.complexAmplitudeFit = true ∨
  m.timeAlignmentFit = true ∨
  m.reflectivityMagnitudeFit = true ∨
  m.reflectivityPhaseFit = true ∨
  m.echoDelayFit = true

theorem gw250114_shapeFixed_and_calibrated :
    shapeFixed gw250114CalibrationLedger ∧
    hasCalibrationOrFit gw250114CalibrationLedger := by
  constructor
  · simp [shapeFixed, gw250114CalibrationLedger]
  · left
    simp [gw250114CalibrationLedger]

/-- The source's zero-free-shape-parameter statement does not imply that
    the complete event-conditioned plunge/echo analysis is uncalibrated
    or fit-free. The actual source ledger is a concrete counterexample. -/
theorem shapeFixed_does_not_imply_noCalibrationOrFit :
    ¬ (shapeFixed gw250114CalibrationLedger →
        ¬ hasCalibrationOrFit gw250114CalibrationLedger) := by
  intro h
  have hshape : shapeFixed gw250114CalibrationLedger := by
    simp [shapeFixed, gw250114CalibrationLedger]
  have hcal : hasCalibrationOrFit gw250114CalibrationLedger := by
    left
    simp [gw250114CalibrationLedger]
  exact (h hshape) hcal

/-- Exact arithmetic for the published 90% posterior upper limit
    |R_s| < 0.059. This is a unit conversion, not a new posterior. -/
theorem reported_reflectivity_square_exact :
    (59 / 1000 : ℝ) ^ 2 = 3481 / 1000000 := by
  norm_num

/-- The reported amplitude limit implies a squared-amplitude threshold
    below 0.4 percent, conditional on interpreting |R_s| as an amplitude. -/
theorem reported_reflectivity_energy_below_0_4_percent :
    (59 / 1000 : ℝ) ^ 2 < 4 / 1000 := by
  norm_num

/-!
The first-echo composition in Prasad et al. (arXiv:2610.12429), Eq. (5),
contains two distinct source channels: the outgoing-to-infinity component
and the horizon-directed component Z_H^(+). The paper states that the latter
has no simple closed-form direct-wave analogue and is computed numerically.
The phase argument below represents exp(i k_H Delta-t); it is left symbolic.
-/

/-- Source-faithful two-channel first-echo amplitude, with the phase factor
    kept explicit and the outgoing and horizon-directed channels separated. -/
def firstEchoAmplitude
    (Rsurf phase Rbh Zinf sigma tBH ZHplus : ℂ) : ℂ :=
  Rsurf * phase * (Rbh * Zinf + sigma * tBH * ZHplus)

/-- The first-echo amplitude as a map from the ordered source-channel pair
    (Z^infinity, Z_H^(+)) to one complex echo amplitude. -/
def firstEchoChannels
    (Rsurf phase Rbh sigma tBH : ℂ) (channels : ℂ × ℂ) : ℂ :=
  firstEchoAmplitude Rsurf phase Rbh channels.1 sigma tBH channels.2

theorem firstEchoAmplitude_split
    (Rsurf phase Rbh Zinf sigma tBH ZHplus : ℂ) :
    firstEchoAmplitude Rsurf phase Rbh Zinf sigma tBH ZHplus =
      (Rsurf * phase) * (Rbh * Zinf) +
      (Rsurf * phase) * (sigma * tBH * ZHplus) := by
  unfold firstEchoAmplitude
  rw [mul_add]

/-- With all transfer coefficients nonzero, the first-echo amplitude is
    injective in the distinct horizon-directed source component Z_H^(+).
    This is an algebraic identifiability statement conditional on fixed,
    nonzero coefficients; it is not a detector-data identifiability claim. -/
theorem firstEchoAmplitude_injective_horizonPlus
    (Rsurf phase Rbh Zinf sigma tBH : ℂ)
    (hcoeff : Rsurf * phase * sigma * tBH ≠ 0) :
    Function.Injective
      (fun ZHplus : ℂ =>
        firstEchoAmplitude Rsurf phase Rbh Zinf sigma tBH ZHplus) := by
  intro z1 z2 heq
  have houter : Rsurf * phase ≠ 0 := by
    intro hz
    apply hcoeff
    simp [hz]
  dsimp [firstEchoAmplitude] at heq
  have hinner :
      Rbh * Zinf + sigma * tBH * z1 =
        Rbh * Zinf + sigma * tBH * z2 :=
    mul_left_cancel₀ houter heq
  have hplus : sigma * tBH * z1 = sigma * tBH * z2 :=
    add_left_cancel hinner
  have htransfer : sigma * tBH ≠ 0 := by
    intro hz
    apply hcoeff
    calc
      Rsurf * phase * sigma * tBH =
          Rsurf * phase * (sigma * tBH) := by ring
      _ = 0 := by rw [hz]; simp
  exact mul_left_cancel₀ htransfer hplus

/-- The first-echo map is invariant under a nonzero channel displacement
    along its algebraic null direction. This is a property of the source
    equation, not a statement that the physical source channels are independent. -/
theorem firstEchoChannels_shift_invariant
    (Rsurf phase Rbh sigma tBH Zinf ZHplus : ℂ) :
    firstEchoChannels Rsurf phase Rbh sigma tBH
        (Zinf + sigma * tBH, ZHplus - Rbh) =
      firstEchoChannels Rsurf phase Rbh sigma tBH (Zinf, ZHplus) := by
  dsimp [firstEchoChannels, firstEchoAmplitude]
  ring

/-- If both source channels are free, one complex first-echo amplitude does
    not identify their ordered pair, even when the horizon transfer coefficient
    is nonzero. A source relation or another independent observable is needed
    for joint identification. -/
theorem firstEchoChannels_not_injective
    (Rsurf phase Rbh sigma tBH : ℂ)
    (htransfer : sigma * tBH ≠ 0) :
    ¬ Function.Injective (firstEchoChannels Rsurf phase Rbh sigma tBH) := by
  intro hinj
  let p0 : ℂ × ℂ := (0, 0)
  let p1 : ℂ × ℂ := (sigma * tBH, -Rbh)
  have hneq : p0 ≠ p1 := by
    intro h
    have hfst : (0 : ℂ) = sigma * tBH := by
      simpa [p0, p1] using congrArg Prod.fst h
    exact htransfer hfst.symm
  have heq :
      firstEchoChannels Rsurf phase Rbh sigma tBH p0 =
        firstEchoChannels Rsurf phase Rbh sigma tBH p1 := by
    simpa [p0, p1] using
      (firstEchoChannels_shift_invariant Rsurf phase Rbh sigma tBH 0 0).symm
  exact hneq (hinj heq)

#eval ((59 : Rat) / 1000) ^ 2
#eval gw250114CalibrationLedger

#print axioms directWaveOmega_reverse
#print axioms directWaveDecay_reverse
#print axioms sourceComplexFrequency_re
#print axioms sourceComplexFrequency_im
#print axioms rationalFilterFactor_norm_one
#print axioms rationalFilter_norm_one
#print axioms gw250114_shapeFixed_and_calibrated
#print axioms shapeFixed_does_not_imply_noCalibrationOrFit
#print axioms reported_reflectivity_square_exact
#print axioms reported_reflectivity_energy_below_0_4_percent
#print axioms firstEchoAmplitude_split
#print axioms firstEchoAmplitude_injective_horizonPlus
#print axioms firstEchoChannels_shift_invariant
#print axioms firstEchoChannels_not_injective

end

end HsHVerification.HaleGW250114DirectWave
