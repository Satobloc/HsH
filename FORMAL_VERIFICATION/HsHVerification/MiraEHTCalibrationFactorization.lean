import Mathlib

/-!
# Mira: EHT Sgr A* two-stage ring-to-shadow calibration and identifiability

Primary standard source: Event Horizon Telescope Collaboration, Sgr A* Paper VI,
ApJL 930:L17 (2022), DOI 10.3847/2041-8213/ac6756, Eq. (1), §§3.2–3.4.
Paper I, ApJL 930:L12 (2022), DOI 10.3847/2041-8213/ac6674, Table 1 and note c,
provides the 2017 EHT central values and their uncertainty labels.

The source's total calibration is alpha_c = alpha_1 * alpha_2:
* alpha_1: physical image-formation factor, true bright-ring diameter / shadow diameter;
* alpha_2: measurement/reconstruction factor, measured ring diameter / true bright-ring diameter.
The second scalar map is an explicit formal reconstruction of the calibration stage
from the source's ground-truth-versus-reconstruction procedure. No statistical
independence between alpha_1 and alpha_2 is asserted here.

The source equation is
  d_hat_m = alpha_c * (1 + delta) * 6 * sqrt(3) * theta_g.
The shadow diameter is inferred from the measured ring only after alpha_1 and alpha_2
are calibrated. Paper I note c says the shadow estimate is determined from EHT data,
whereas delta uses theta_g priors from independent stellar-orbit analyses.

This module proves algebraic consequences of that published calibration map. It does
not validate the source's simulations, reproduce its posterior, prove GR, or derive an
H(s)H prediction. The 68% credible-interval endpoints used below are rounded posterior
summaries, not hard physical bounds.
-/

namespace HsHVerification.MiraEHTCalibrationFactorization

/-- Schwarzschild shadow angular diameter corresponding to angular gravitational radius. -/
noncomputable def schwarzschildShadowDiameter (thetaG : ℝ) : ℝ :=
  6 * Real.sqrt 3 * thetaG

/-- alpha_1: true bright-ring diameter divided by shadow diameter. -/
noncomputable def physicalImageCalibrationAlpha1 (trueRing shadow : ℝ) : ℝ :=
  trueRing / shadow

/-- alpha_2: measured ring diameter divided by the true bright-ring diameter. -/
noncomputable def measurementCalibrationAlpha2 (measuredRing trueRing : ℝ) : ℝ :=
  measuredRing / trueRing

/-- The published total calibration factor alpha_c = alpha_1 * alpha_2. -/
noncomputable def totalCalibrationAlpha (alpha1 alpha2 : ℝ) : ℝ :=
  alpha1 * alpha2

/-- Fractional shadow deviation from the Schwarzschild diameter. -/
noncomputable def shadowDeviation (shadow thetaG : ℝ) : ℝ :=
  shadow / schwarzschildShadowDiameter thetaG - 1

/-- The two calibration stages compose to measured-ring / shadow. -/
theorem total_calibration_is_measured_ring_over_shadow
    (trueRing shadow measuredRing : ℝ)
    (hTrueRing : trueRing ≠ 0) (hShadow : shadow ≠ 0) :
    totalCalibrationAlpha
      (physicalImageCalibrationAlpha1 trueRing shadow)
      (measurementCalibrationAlpha2 measuredRing trueRing)
      = measuredRing / shadow := by
  unfold totalCalibrationAlpha physicalImageCalibrationAlpha1 measurementCalibrationAlpha2
  field_simp [hTrueRing, hShadow]

/-- EHT Paper VI Eq. (1), with the two source-described calibration stages explicit. -/
theorem paperVI_equation_one_two_stage
    (trueRing shadow measuredRing thetaG : ℝ)
    (hTrueRing : trueRing ≠ 0)
    (hShadow : shadow ≠ 0)
    (hSchwarzschild : schwarzschildShadowDiameter thetaG ≠ 0) :
    measuredRing =
      totalCalibrationAlpha
        (physicalImageCalibrationAlpha1 trueRing shadow)
        (measurementCalibrationAlpha2 measuredRing trueRing) *
      (1 + shadowDeviation shadow thetaG) *
      schwarzschildShadowDiameter thetaG := by
  have hThetaG : thetaG ≠ 0 := by
    intro hZero
    apply hSchwarzschild
    simp [schwarzschildShadowDiameter, hZero]
  unfold totalCalibrationAlpha physicalImageCalibrationAlpha1
    measurementCalibrationAlpha2 shadowDeviation schwarzschildShadowDiameter at *
  field_simp [hTrueRing, hShadow, hSchwarzschild, hThetaG]
  <;> ring

/-- Once the total calibration factor is fixed and nonzero, a measured ring
    cannot correspond to two different shadow diameters. -/
theorem fixed_total_calibration_identifies_shadow
    (measuredRing alpha shadowA shadowB : ℝ)
    (hAlpha : alpha ≠ 0)
    (hA : measuredRing = alpha * shadowA)
    (hB : measuredRing = alpha * shadowB) :
    shadowA = shadowB := by
  have hdiff : alpha * (shadowA - shadowB) = 0 := by
    calc
      alpha * (shadowA - shadowB) = alpha * shadowA - alpha * shadowB := by ring
      _ = measuredRing - measuredRing := by rw [← hA, ← hB]
      _ = 0 := by ring
  rcases mul_eq_zero.mp hdiff with hAlphaZero | hShadowEqual
  · exact (hAlpha hAlphaZero).elim
  · exact sub_eq_zero.mp hShadowEqual

/-- If the total calibration is unconstrained, any two positive candidate shadow
    diameters can reproduce the same positive measured ring with different alpha_c.
    This is an identifiability result, not a claim that arbitrary calibrations are
    physically admissible. -/
theorem free_total_calibration_does_not_identify_shadow
    (measuredRing shadowA shadowB : ℝ)
    (hMeasured : 0 < measuredRing)
    (hShadowA : 0 < shadowA)
    (hShadowB : 0 < shadowB)
    (hDistinct : shadowA ≠ shadowB) :
    ∃ alphaA alphaB : ℝ,
      0 < alphaA ∧ 0 < alphaB ∧
      measuredRing = alphaA * shadowA ∧
      measuredRing = alphaB * shadowB ∧
      alphaA ≠ alphaB := by
  refine ⟨measuredRing / shadowA, measuredRing / shadowB,
    div_pos hMeasured hShadowA, div_pos hMeasured hShadowB, ?_, ?_, ?_⟩
  · field_simp [ne_of_gt hShadowA]
  · field_simp [ne_of_gt hShadowB]
  · intro hEqual
    apply hDistinct
    have hProduct : measuredRing * shadowB = measuredRing * shadowA := by
      have h := hEqual
      field_simp [ne_of_gt hShadowA, ne_of_gt hShadowB] at h
      nlinarith [h]
    have hDifference : measuredRing * (shadowA - shadowB) = 0 := by
      calc
        measuredRing * (shadowA - shadowB) =
            measuredRing * shadowA - measuredRing * shadowB := by ring
        _ = 0 := by linarith [hProduct]
    rcases mul_eq_zero.mp hDifference with hMeasuredZero | hShadowsEqual
    · exact False.elim ((ne_of_gt hMeasured) hMeasuredZero)
    · exact sub_eq_zero.mp hShadowsEqual

/-- Published central ring diameter: 51.8 microarcseconds (Paper I, Table 1). -/
def sgrAStarMeasuredRingCentralQ : ℚ := 259 / 5

/-- Published central calibrated shadow diameter: 48.7 microarcseconds (Paper I, Table 1). -/
def sgrAStarCalibratedShadowCentralQ : ℚ := 487 / 10

/-- Exact quotient of the two rounded published central values. This is not the
    posterior median of alpha_c and carries no propagated uncertainty. -/
theorem sgrAStar_central_value_quotient :
    sgrAStarMeasuredRingCentralQ / sgrAStarCalibratedShadowCentralQ =
      (518 : ℚ) / 487 := by
  norm_num [sgrAStarMeasuredRingCentralQ, sgrAStarCalibratedShadowCentralQ]

/-- The 68% shadow interval is reported as 48.7 ± 7.0 microarcseconds.
    Its rounded endpoints (41.7, 55.7) and the measured-ring central value 51.8
    furnish a source-specific witness: without a constrained alpha_c, both
    shadow values can reproduce the same measured ring. The endpoints are not
    treated as hard bounds or as independent observations. -/
theorem sgrAStar_reported_interval_witness_requires_calibration_information :
    ∃ alphaLower alphaUpper : ℝ,
      0 < alphaLower ∧ 0 < alphaUpper ∧
      (51.8 : ℝ) = alphaLower * (41.7 : ℝ) ∧
      (51.8 : ℝ) = alphaUpper * (55.7 : ℝ) ∧
      alphaLower ≠ alphaUpper := by
  apply free_total_calibration_does_not_identify_shadow
  · norm_num
  · norm_num
  · norm_num
  · norm_num

#eval sgrAStarMeasuredRingCentralQ / sgrAStarCalibratedShadowCentralQ
#eval (51.8 : ℚ) / (41.7 : ℚ)
#eval (51.8 : ℚ) / (55.7 : ℚ)

#print axioms total_calibration_is_measured_ring_over_shadow
#print axioms paperVI_equation_one_two_stage
#print axioms fixed_total_calibration_identifies_shadow
#print axioms free_total_calibration_does_not_identify_shadow
#print axioms sgrAStar_central_value_quotient
#print axioms sgrAStar_reported_interval_witness_requires_calibration_information

end HsHVerification.MiraEHTCalibrationFactorization
