import Mathlib

/-!
Kestrel empirical readout control for finite-core Kelvin-wave experiments.

Primary sources:
* Barckicke, Falcon & Gissinger, "Kelvin wave propagation along vortex cores,"
  Nature Physics 22 (2026), DOI: 10.1038/s41567-026-03175-w.
* Barckicke, Falcon & Gissinger, "Experimental evidence of Kelvin-wave turbulence
  along a vortex core," Physical Review Letters 137 (2026), DOI: 10.1103/t3bt-m431.
* Fonda et al., "Direct observation of Kelvin waves excited by quantized vortex
  reconnection," PNAS 111 (2014), DOI: 10.1073/pnas.1312536110.

The real-valued readout map below is transcribed from the Nature Physics paper:
two opposing interface radii are converted into centerline displacement eta
and mean core radius a. The rational acquisition values are transcribed from
the PNAS camera/laser-sheet description.

These theorems prove algebraic inversion and exact rational consequences only.
They do not prove that the experimental contour extraction is unbiased, that
the optical projection reconstructs the full 3D core, or that a classical
water vortex is physically equivalent to H(s)H or to a BEC vacuum.

The WKBJ broadening theorem is deliberately conditional on an interval for the
logarithmic bracket. Python independently evaluates that bracket; this Lean
module does not prove the logarithm interval.

The Barckicke 2026 resolution/uncertainty values are kept in a separate
namespace below. Its published dispersion analysis uses measured a0 but fits
(Gamma, v_z) to the dispersion data, then checks those fitted parameters
a posteriori against PIV/PTV measurements; that curve match is not a blind
holdout prediction. The rendered Methods PDF page 6 confirms k0/(2 pi)=25
m^-1 in the WKBJ estimate; use the rendered page rather than lossy text
extraction when resolving that digit.
-/

namespace HsHVerification.KestrelKelvinVortexReadout

/-- Source-defined two-sided contour readout: (center displacement, mean radius). -/
noncomputable def coreReadout (rPlus rMinus : ℝ) : ℝ × ℝ :=
  ((rPlus - rMinus) / 2, (rPlus + rMinus) / 2)

/-- Reconstruct the two opposing contour radii from displacement and radius. -/
def recoverSides (eta radius : ℝ) : ℝ × ℝ :=
  (radius + eta, radius - eta)

/-- Both opposing contour measurements recover the original pair exactly. -/
theorem recoverSides_after_coreReadout (rPlus rMinus : ℝ) :
    recoverSides (coreReadout rPlus rMinus).1 (coreReadout rPlus rMinus).2 =
      (rPlus, rMinus) := by
  ext <;> dsimp [recoverSides, coreReadout] <;> ring

/-- The two-sided readout is invertible on its two measured coordinates. -/
theorem coreReadout_after_recoverSides (eta radius : ℝ) :
    coreReadout (recoverSides eta radius).1 (recoverSides eta radius).2 =
      (eta, radius) := by
  ext <;> dsimp [recoverSides, coreReadout] <;> ring

/-- A single opposing contour radius cannot identify both displacement and radius. -/
theorem oneSideReadout_noninjective (rPlus : ℝ) :
    ∃ eta₁ radius₁ eta₂ radius₂ : ℝ,
      radius₁ + eta₁ = rPlus ∧
      radius₂ + eta₂ = rPlus ∧
      (eta₁, radius₁) ≠ (eta₂, radius₂) := by
  refine ⟨0, rPlus, 1, rPlus - 1, ?_, ?_, ?_⟩
  · ring
  · ring
  · intro h
    have hη : (0 : ℝ) = 1 := congrArg Prod.fst h
    norm_num at hη

/-- Fonda et al. camera field: 8.2 mm over 512 pixels, expressed in micrometres. -/
def pixelPitchUm : ℚ := 8200 / 512

/-- 54.3 frames/s converted to milliseconds per frame. -/
def frameIntervalMs : ℚ := 10000 / 543

/-- 150 micrometre laser-sheet thickness relative to the in-plane pixel pitch. -/
def sheetToPixelPitch : ℚ := 150 / pixelPitchUm

/-- Upper-bound normal-fluid tracer drift per frame at 6 micrometres/s. -/
def normalDriftUmPerFrame : ℚ := 60 / 543

/-- Normal-fluid tracer drift expressed in nominal in-plane pixel pitches. -/
def normalDriftPixels : ℚ := normalDriftUmPerFrame / pixelPitchUm

/-- Approximate 3 mm vortex length in nominal in-plane pixel pitches. -/
def vortexLengthPixelPitches : ℚ := 3000 / pixelPitchUm

/-- The 2.08 mm by 0.4 mm displayed region in nominal pixel pitches. -/
def regionWidthPixelPitches : ℚ := 2080 / pixelPitchUm
def regionHeightPixelPitches : ℚ := 400 / pixelPitchUm

/-!
The following values belong to the separate Barckicke–Falcon–Gissinger 2026
classical air–water vortex experiment. They are not the Fonda et al. 2014
superfluid-helium acquisition values above. The source reports 60 μm/px
resolution, 0.5 mm contour width, typical ~0.1 mm uncertainty on core radius
and position, PIV circulation uncertainty ~0.005 m²/s, and PTV vertical
velocity uncertainty ~0.05 m/s. The rational values below are nominal unit
conversions of those reported rounded quantities, not exact instrument error
distributions or covariance estimates.
-/
namespace Barckicke2026

def cameraResolutionUmPerPixel : ℚ := 60
def contourWidthUm : ℚ := 500
def reportedTypicalCoreReadoutUncertaintyUm : ℚ := 100
def reportedPIVCirculationUncertaintyM2PerS : ℚ := 5 / 1000
def reportedPTVVerticalVelocityUncertaintyMPerS : ℚ := 5 / 100

def nominalCoreReadoutUncertaintyPixels : ℚ :=
  reportedTypicalCoreReadoutUncertaintyUm / cameraResolutionUmPerPixel

def nominalContourWidthPixels : ℚ :=
  contourWidthUm / cameraResolutionUmPerPixel

def nominalUncertaintyToContourWidth : ℚ :=
  reportedTypicalCoreReadoutUncertaintyUm / contourWidthUm

theorem nominal_core_uncertainty_is_five_thirds_pixel :
    nominalCoreReadoutUncertaintyPixels = (5 : ℚ) / 3 := by
  norm_num [nominalCoreReadoutUncertaintyPixels,
    reportedTypicalCoreReadoutUncertaintyUm, cameraResolutionUmPerPixel]

theorem nominal_contour_width_is_twenty_five_thirds_pixel :
    nominalContourWidthPixels = (25 : ℚ) / 3 := by
  norm_num [nominalContourWidthPixels, contourWidthUm,
    cameraResolutionUmPerPixel]

theorem nominal_uncertainty_is_one_fifth_contour_width :
    nominalUncertaintyToContourWidth = (1 : ℚ) / 5 := by
  norm_num [nominalUncertaintyToContourWidth,
    reportedTypicalCoreReadoutUncertaintyUm, contourWidthUm]

theorem reported_piv_uncertainty_is_one_two_hundredth :
    reportedPIVCirculationUncertaintyM2PerS = (1 : ℚ) / 200 := by
  norm_num [reportedPIVCirculationUncertaintyM2PerS]

theorem reported_ptv_uncertainty_is_one_twentieth :
    reportedPTVVerticalVelocityUncertaintyMPerS = (1 : ℚ) / 20 := by
  norm_num [reportedPTVVerticalVelocityUncertaintyMPerS]

#eval nominalCoreReadoutUncertaintyPixels
#eval nominalContourWidthPixels
#eval nominalUncertaintyToContourWidth
#eval reportedPIVCirculationUncertaintyM2PerS
#eval reportedPTVVerticalVelocityUncertaintyMPerS

#print axioms nominal_core_uncertainty_is_five_thirds_pixel
#print axioms nominal_contour_width_is_twenty_five_thirds_pixel
#print axioms nominal_uncertainty_is_one_fifth_contour_width
#print axioms reported_piv_uncertainty_is_one_two_hundredth
#print axioms reported_ptv_uncertainty_is_one_twentieth

end Barckicke2026


theorem pixel_pitch_exact : pixelPitchUm = 1025 / 64 := by
  norm_num [pixelPitchUm]

theorem frame_interval_18_to_19_ms :
    18 < frameIntervalMs ∧ frameIntervalMs < 19 := by
  norm_num [frameIntervalMs]

theorem sheet_thickness_9_to_10_pixel_pitches :
    9 < sheetToPixelPitch ∧ sheetToPixelPitch < 10 := by
  norm_num [sheetToPixelPitch, pixelPitchUm]

theorem normal_tracer_drift_below_one_hundredth_pixel :
    normalDriftPixels < (1 : ℚ) / 100 := by
  norm_num [normalDriftPixels, normalDriftUmPerFrame, pixelPitchUm]

theorem vortex_length_187_to_188_pixel_pitches :
    187 < vortexLengthPixelPitches ∧ vortexLengthPixelPitches < 188 := by
  norm_num [vortexLengthPixelPitches, pixelPitchUm]

theorem displayed_region_width_129_to_131_pixel_pitches :
    129 < regionWidthPixelPitches ∧ regionWidthPixelPitches < 131 := by
  norm_num [regionWidthPixelPitches, pixelPitchUm]

theorem displayed_region_height_24_to_26_pixel_pitches :
    24 < regionHeightPixelPitches ∧ regionHeightPixelPitches < 26 := by
  norm_num [regionHeightPixelPitches, pixelPitchUm]

/-- The source WKBJ inputs give delta-a/a0 = 1 mm / 1.9 mm = 10/19. -/
theorem core_radius_variation_ratio :
    (1 / 1000 : ℚ) / (19 / 10000) = 10 / 19 := by
  norm_num

/-- With k0/(2 pi)=25 m^-1, the source WKBJ output is 250/(19 B) m^-1. -/
def wkbjBroadeningMInv (bracket : ℚ) : ℚ :=
  (250 / 19) / bracket

/-- Conditional arithmetic check: a bracket in (1.650,1.651) yields 7.9--8.1 m^-1. -/
theorem wkbj_broadening_79_to_81_of_bracket (B : ℚ)
    (hB_lo : (1650 : ℚ) / 1000 < B)
    (hB_hi : B < (1651 : ℚ) / 1000) :
    (79 : ℚ) / 10 < wkbjBroadeningMInv B ∧
      wkbjBroadeningMInv B < (81 : ℚ) / 10 := by
  unfold wkbjBroadeningMInv
  have hBpos : 0 < B := by linarith
  constructor
  · rw [lt_div_iff₀ hBpos]
    nlinarith
  · rw [div_lt_iff₀ hBpos]
    nlinarith

#print axioms recoverSides_after_coreReadout
#print axioms coreReadout_after_recoverSides
#print axioms oneSideReadout_noninjective
#print axioms pixel_pitch_exact
#print axioms frame_interval_18_to_19_ms
#print axioms sheet_thickness_9_to_10_pixel_pitches
#print axioms normal_tracer_drift_below_one_hundredth_pixel
#print axioms vortex_length_187_to_188_pixel_pitches
#print axioms displayed_region_width_129_to_131_pixel_pitches
#print axioms displayed_region_height_24_to_26_pixel_pitches
#print axioms core_radius_variation_ratio
#print axioms wkbj_broadening_79_to_81_of_bracket

end HsHVerification.KestrelKelvinVortexReadout
