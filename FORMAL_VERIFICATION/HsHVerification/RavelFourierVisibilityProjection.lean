import Mathlib

/-!
# Ravel: Fourier visibility and closure-phase projection

This module formalizes standard interferometric readout algebra used by the
public Event Horizon Telescope M87* 2017 visibility data release.

It is an external measurement-layer comparator. It does **not** formalize an
H(s)H worldtube, a Kerr-core constitutive law, radiative transfer, or a
physical prediction.

The accompanying empirical audit uses the HOPS network-calibrated Stokes-I
CSV files in eventhorizontelescope/2019-D01-01. The formal results below
separate information retained by complex visibility from information lost
when only its magnitude is retained, and prove cancellation of additive
station-phase terms in a closed triangle.
-/

namespace HsHVerification.RavelFourierVisibilityProjection

/-- Amplitude-only visibility readout. -/
noncomputable def visibilityAmplitude (z : ℂ) : ℝ := ‖z‖

/-- Polar readout: amplitude together with the unit complex phase factor. -/
noncomputable def visibilityPolarReadout (z : ℂ) : ℝ × ℂ :=
  (‖z‖, z / (‖z‖ : ℂ))

/--
Magnitude-only visibility is not injective: it discards phase.
The witnesses are algebraic, not physical fixtures.
-/
theorem visibilityAmplitude_not_injective :
    ¬ Function.Injective visibilityAmplitude := by
  intro hinj
  have hmag :
      visibilityAmplitude (1 : ℂ) =
        visibilityAmplitude (-1 : ℂ) := by
    simp [visibilityAmplitude]
  have hEq : (1 : ℂ) = -1 := hinj hmag
  norm_num at hEq

/--
For a nonzero complex visibility, amplitude plus unit phase reconstructs
the original complex value.
-/
theorem visibilityPolarReadout_reconstructs
    (z : ℂ) (hz : z ≠ 0) :
    ((visibilityPolarReadout z).1 : ℂ) *
      (visibilityPolarReadout z).2 = z := by
  have hnormPos : 0 < ‖z‖ := norm_pos_iff.mpr hz
  have hnorm : (‖z‖ : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt hnormPos)
  simp only [visibilityPolarReadout]
  calc
    (‖z‖ : ℂ) * (z / (‖z‖ : ℂ)) =
        (z / (‖z‖ : ℂ)) * (‖z‖ : ℂ) := mul_comm _ _
    _ = z := div_mul_cancel₀ z hnorm

/--
The polar visibility readout is injective on nonzero complex visibilities.
This is a measurement-value statement, not injectivity of the sky-to-data
or worldtube-to-data map.
-/
theorem visibilityPolarReadout_injective_on_nonzero
    {z w : ℂ} (hz : z ≠ 0) (hw : w ≠ 0)
    (h : visibilityPolarReadout z = visibilityPolarReadout w) :
    z = w := by
  have hrec := congrArg
    (fun p : ℝ × ℂ => ((p.1 : ℂ) * p.2)) h
  calc
    z = ((visibilityPolarReadout z).1 : ℂ) *
        (visibilityPolarReadout z).2 :=
          (visibilityPolarReadout_reconstructs z hz).symm
    _ = ((visibilityPolarReadout w).1 : ℂ) *
        (visibilityPolarReadout w).2 := hrec
    _ = w := visibilityPolarReadout_reconstructs w hw

/-- Unwrapped closure phase in degrees for a directed triangle A-B-C-A. -/
def closurePhaseRaw (phiAB phiBC phiCA : ℝ) : ℝ :=
  phiAB + phiBC + phiCA

/--
Station-based additive phase terms cancel around a closed directed triangle.
This is the algebraic reason closure phase is invariant under station-phase
offsets in the standard interferometric measurement model.
-/
theorem closurePhase_stationPhase_offsets_cancel
    (phiAB phiBC phiCA gainA gainB gainC : ℝ) :
    closurePhaseRaw
      (phiAB + gainA - gainB)
      (phiBC + gainB - gainC)
      (phiCA + gainC - gainA)
      =
    closurePhaseRaw phiAB phiBC phiCA := by
  simp [closurePhaseRaw]
  ring

/--
Actual measured M87* HOPS high-band sample, 2017-04-05.
Dataset: eventhorizontelescope/2019-D01-01
File: csv/SR1_M87_2017_095_hi_hops_netcal_StokesI.csv
Git blob: d6cac32d27a6877ca0753574eae07912c143ce8e

At time(UTC)=03.60138881 (CSV row numbers 1452, 1458, 1453), directed phases are:
  AA->AZ = -43.3539 deg
  AZ->LM = -44.3824 deg
  AA->LM = -118.2559 deg
For the triangle A=AA, B=AZ, C=LM, the final baseline is reversed
to LM->AA, so its phase contribution is +118.2559 deg.
The three measured amplitudes are 0.09862260, 0.35358711, 0.05409816 Jy;
their reported amplitude sigmas are 0.00453032, 0.03433101, 0.00201930 Jy.
-/
def m87AA_AZ_LM_sample_closure_degrees : Float :=
  (-43.3539 : Float) + (-44.3824) + 118.2559

/-- Measured SNR for the AA->AZ baseline in the same triangle sample. -/
def m87AA_AZ_sample_snr : Float :=
  0.09862260 / 0.00453032

/-- Measured SNR for the AZ->LM baseline in the same triangle sample. -/
def m87AZ_LM_sample_snr : Float :=
  0.35358711 / 0.03433101

/-- Measured SNR for the AA->LM baseline in the same triangle sample. -/
def m87AA_LM_sample_snr : Float :=
  0.05409816 / 0.00201930

#eval m87AA_AZ_LM_sample_closure_degrees
#eval m87AA_AZ_sample_snr
#eval m87AZ_LM_sample_snr
#eval m87AA_LM_sample_snr

#print axioms visibilityAmplitude_not_injective
#print axioms visibilityPolarReadout_reconstructs
#print axioms visibilityPolarReadout_injective_on_nonzero
#print axioms closurePhase_stationPhase_offsets_cancel

end HsHVerification.RavelFourierVisibilityProjection
