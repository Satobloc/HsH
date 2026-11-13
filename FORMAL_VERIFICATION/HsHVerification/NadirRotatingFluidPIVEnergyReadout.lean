import Mathlib
import HsHVerification.NadirProjectionCoarseGrainFactorization

/-!
# Rotating-fluid PIV: finite-plane energy observability

Primary source:
O. C. Jackson and P. J. Thomas, "An experimental study investigating the
inertial-wave field accompanying vortex rings translating through a rotating
fluid", Journal of Fluid Mechanics 1029 (2026), A47,
doi:10.1017/jfm.2026.11199.

Source-defined measurement facts:
* The wide-field vertical light-sheet (VLS) samples an axial-radial plane at
  60 Hz for 60 s; the thesis describes 2 mm light-sheet thickness.
* The idealized two-component VLS readout retains axial and radial components
  and omits the azimuthal component. The actual finite-thickness sheet can
  capture some out-of-plane motion; it is not an exact zero-thickness camera
  projection.
* Jackson's thesis reports a maximum 7.02% light-sheet geometric error for
  the **narrow-field** setup. That bound is not transferred to the distinct
  wide-field configuration; no corresponding wide-field bound was recovered.
* The horizontal light-sheet (HLS) is a separate acquisition at z = 3d0,
  with a 150 Hz frame rate and 20 s duration. It measures radial/azimuthal
  components in another plane; it is not simultaneous, co-registered 3D3C
  data with the wide-field VLS sequence.
* The paper's VLS kinetic-energy construction omits the out-of-plane
  contribution, reports radial and azimuthal velocities of similar magnitude,
  and uses an axisymmetry assumption to assign toroidal volume weights.

The maps below are assistant reconstructions of idealized measurement
boundaries, not source-authored H(s)H maps, full camera/PIV acquisition
operators, 3D reconstructions, or physical equivalences. The theorems are
conditional algebra: an ideal VLS-only component projection cannot determine
arbitrary full 3D kinetic energy, while a normalized VLS estimator is a lower
bound when the omitted component and volume weights are treated consistently.
The weighted estimator is not claimed to reproduce every step of the paper's
data-reduction pipeline. Lean does not establish axisymmetry, validate
calibration, or bound finite-sheet contamination.
-/

namespace HsHVerification.NadirRotatingFluidPIVEnergyReadout

open HsHVerification.NadirProjectionCoarseGrainFactorization

/-- Latent local velocity state (axial, radial, azimuthal), not a simultaneous measured 3D3C sample. -/
abbrev Velocity3 := ℝ × (ℝ × ℝ)

/-- The VLS two-component readout (axial, radial). -/
abbrev VLSReadout := ℝ × ℝ

/-- Idealized zero-thickness VLS component selection; finite-sheet and optical/PIV effects are not modeled. -/
def vlsReadout (v : Velocity3) : VLSReadout :=
  (v.1, v.2.1)

/-- Kinetic-energy density represented by the two in-plane VLS components. -/
noncomputable def vlsEnergyDensity (v : Velocity3) : ℝ :=
  (v.1 ^ 2 + v.2.1 ^ 2) / 2

/-- Full three-component kinetic-energy density. -/
noncomputable def fullEnergyDensity (v : Velocity3) : ℝ :=
  (v.1 ^ 2 + v.2.1 ^ 2 + v.2.2 ^ 2) / 2

/-- The VLS-only energy density never exceeds the full three-component value. -/
theorem vlsEnergyDensity_le_full (v : Velocity3) :
    vlsEnergyDensity v ≤ fullEnergyDensity v := by
  unfold vlsEnergyDensity fullEnergyDensity
  nlinarith [sq_nonneg v.2.2]

/-- Equality holds exactly when the omitted azimuthal component vanishes. -/
theorem fullEnergy_eq_vls_iff_azimuthal_zero (v : Velocity3) :
    fullEnergyDensity v = vlsEnergyDensity v ↔ v.2.2 = 0 := by
  constructor
  · intro h
    unfold fullEnergyDensity vlsEnergyDensity at h
    nlinarith [sq_nonneg v.2.2]
  · intro h
    simp [fullEnergyDensity, vlsEnergyDensity, h]

/-- Two states can have identical VLS data but different full kinetic energy. -/
def stateA : Velocity3 := (1, (1, 0))
def stateB : Velocity3 := (1, (1, 1))

theorem same_vls_different_full_energy :
    vlsReadout stateA = vlsReadout stateB ∧
      fullEnergyDensity stateA ≠ fullEnergyDensity stateB := by
  constructor
  · rfl
  · norm_num [fullEnergyDensity, stateA, stateB]

/--
No deterministic scalar readout on the VLS image can recover full
three-component kinetic-energy density for arbitrary velocity states.
This instantiates the existing fibre-factorization theorem with the
source-grounded VLS projection.
-/
theorem no_full_energy_factorization_through_vls :
    ¬ ∃ f : Set.range vlsReadout → ℝ,
      ∀ v, f (imageProjection vlsReadout v) = fullEnergyDensity v := by
  exact no_inducedCoarseGraining_of_fiber_mismatch
    vlsReadout (fun v => v) fullEnergyDensity stateA stateB
    (by rfl)
    (by norm_num [fullEnergyDensity, stateA, stateB])

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Sum of the axisymmetric toroidal volume weights. -/
def totalWeight (w : ι → ℝ) : ℝ :=
  ∑ i, w i

/-- Numerator from the two VLS components. -/
def vlsEnergyNumerator (w uAxial uRadial : ι → ℝ) : ℝ :=
  ∑ i, w i * (uAxial i ^ 2 + uRadial i ^ 2)

/-- Numerator from the omitted azimuthal component. -/
def azimuthalEnergyNumerator (w uAzimuthal : ι → ℝ) : ℝ :=
  ∑ i, w i * uAzimuthal i ^ 2

/-- Assistant-reconstructed normalized, volume-weighted VLS specific-energy estimator. -/
noncomputable def vlsSpecificEnergy (w uAxial uRadial : ι → ℝ) : ℝ :=
  vlsEnergyNumerator w uAxial uRadial / (2 * totalWeight w)

/-- Latent full-component counterpart using the same reconstructed normalization. -/
noncomputable def fullSpecificEnergy
    (w uAxial uRadial uAzimuthal : ι → ℝ) : ℝ :=
  (vlsEnergyNumerator w uAxial uRadial +
    azimuthalEnergyNumerator w uAzimuthal) / (2 * totalWeight w)

/-- The missing azimuthal contribution to the specific-energy estimator. -/
noncomputable def omittedAzimuthalSpecificEnergy
    (w uAzimuthal : ι → ℝ) : ℝ :=
  azimuthalEnergyNumerator w uAzimuthal / (2 * totalWeight w)

omit [DecidableEq ι] in
/-- Exact decomposition of full energy into VLS and omitted azimuthal terms. -/
lemma full_energy_decomposition
    (w uAxial uRadial uAzimuthal : ι → ℝ) :
    fullSpecificEnergy w uAxial uRadial uAzimuthal =
      vlsSpecificEnergy w uAxial uRadial +
        omittedAzimuthalSpecificEnergy w uAzimuthal := by
  simp [fullSpecificEnergy, vlsSpecificEnergy,
    omittedAzimuthalSpecificEnergy, add_div]

omit [DecidableEq ι] in
/-- Nonnegative volume weights make the omitted azimuthal numerator nonnegative. -/
lemma azimuthalEnergyNumerator_nonneg
    (w uAzimuthal : ι → ℝ)
    (hw : ∀ i, 0 ≤ w i) :
    0 ≤ azimuthalEnergyNumerator w uAzimuthal := by
  unfold azimuthalEnergyNumerator
  apply Finset.sum_nonneg
  intro i hi
  exact mul_nonneg (hw i) (sq_nonneg (uAzimuthal i))

omit [DecidableEq ι] in
/-- With positive total volume, the omitted azimuthal energy is nonnegative. -/
lemma omittedAzimuthalSpecificEnergy_nonneg
    (w uAzimuthal : ι → ℝ)
    (hw : ∀ i, 0 ≤ w i)
    (hW : 0 < totalWeight w) :
    0 ≤ omittedAzimuthalSpecificEnergy w uAzimuthal := by
  unfold omittedAzimuthalSpecificEnergy
  exact div_nonneg
    (azimuthalEnergyNumerator_nonneg w uAzimuthal hw)
    (by positivity)

omit [DecidableEq ι] in
/-- The VLS estimator is a lower bound for full specific kinetic energy. -/
theorem vlsSpecificEnergy_le_full
    (w uAxial uRadial uAzimuthal : ι → ℝ)
    (hw : ∀ i, 0 ≤ w i)
    (hW : 0 < totalWeight w) :
    vlsSpecificEnergy w uAxial uRadial ≤
      fullSpecificEnergy w uAxial uRadial uAzimuthal := by
  rw [full_energy_decomposition]
  exact le_add_of_nonneg_right
    (omittedAzimuthalSpecificEnergy_nonneg w uAzimuthal hw hW)

/--
Closed form corresponding to the source's toroidal-bin volume integral:
h ∫[r,r+dr] ∫[0,2π] ρ dφ dρ = π h ((r+dr)^2-r^2).
The physical use of this weight still depends on the source's axisymmetry
assumption; only its sign is proved here.
-/
noncomputable def toroidalVolumeWeight (h r dr : ℝ) : ℝ :=
  Real.pi * h * ((r + dr) ^ 2 - r ^ 2)

/-- The toroidal-bin volume weight is nonnegative for physical h, r, dr. -/
theorem toroidalVolumeWeight_nonneg
    (h r dr : ℝ)
    (hh : 0 ≤ h) (hr : 0 ≤ r) (hdr : 0 ≤ dr) :
    0 ≤ toroidalVolumeWeight h r dr := by
  have hrad : 0 ≤ (r + dr) ^ 2 - r ^ 2 := by
    nlinarith
  unfold toroidalVolumeWeight
  exact mul_nonneg (mul_nonneg Real.pi_pos.le hh) hrad

/--
The article's explicit spectral-resolution example: a 60 Hz recording rate,
60 s record, 3600 samples, 1800 positive-frequency bins, and a 30 Hz Nyquist
frequency. The inertial-wave band edge is twice the tank rotation frequency.
These are exact rational reconstructions of the paper's stated 3, 6, 9 and
12 rpm cases, not new measurements.
-/
def sampleRateHz : ℚ := 60
def recordDurationSeconds : ℚ := 60
def sampleCount : ℚ := sampleRateHz * recordDurationSeconds
def nyquistFrequencyHz : ℚ := sampleRateHz / 2
def positiveFrequencyBinCount : ℚ := sampleCount / 2
def fftBinWidthHz : ℚ := nyquistFrequencyHz / positiveFrequencyBinCount

/-- Maximum inertial-wave frequency in Hz for a tank rotation rate in rpm. -/
def maxInertialWaveFrequencyHz (rpm : ℚ) : ℚ :=
  2 * (rpm / 60)

/-- Nominal number of FFT bins from zero to the inertial-wave band edge. -/
def inertialWaveBandBinCount (rpm : ℚ) : ℚ :=
  maxInertialWaveFrequencyHz rpm / fftBinWidthHz

theorem sampleCount_eq_3600 : sampleCount = 3600 := by
  norm_num [sampleCount, sampleRateHz, recordDurationSeconds]

theorem nyquistFrequency_eq_30 : nyquistFrequencyHz = 30 := by
  norm_num [nyquistFrequencyHz, sampleRateHz]

theorem positiveFrequencyBinCount_eq_1800 :
    positiveFrequencyBinCount = 1800 := by
  norm_num [positiveFrequencyBinCount, sampleCount, sampleRateHz,
    recordDurationSeconds]

theorem fftBinWidth_eq_one_sixtieth :
    fftBinWidthHz = (1 : ℚ) / 60 := by
  norm_num [fftBinWidthHz, nyquistFrequencyHz, positiveFrequencyBinCount,
    sampleCount, sampleRateHz, recordDurationSeconds]

theorem maxInertialFrequency_at_12rpm :
    maxInertialWaveFrequencyHz 12 = (2 : ℚ) / 5 := by
  norm_num [maxInertialWaveFrequencyHz]

theorem inertialBandBins_at_3rpm :
    inertialWaveBandBinCount 3 = 6 := by
  norm_num [inertialWaveBandBinCount, maxInertialWaveFrequencyHz,
    fftBinWidthHz, nyquistFrequencyHz, positiveFrequencyBinCount,
    sampleCount, sampleRateHz, recordDurationSeconds]

theorem inertialBandBins_at_6rpm :
    inertialWaveBandBinCount 6 = 12 := by
  norm_num [inertialWaveBandBinCount, maxInertialWaveFrequencyHz,
    fftBinWidthHz, nyquistFrequencyHz, positiveFrequencyBinCount,
    sampleCount, sampleRateHz, recordDurationSeconds]

theorem inertialBandBins_at_9rpm :
    inertialWaveBandBinCount 9 = 18 := by
  norm_num [inertialWaveBandBinCount, maxInertialWaveFrequencyHz,
    fftBinWidthHz, nyquistFrequencyHz, positiveFrequencyBinCount,
    sampleCount, sampleRateHz, recordDurationSeconds]

theorem inertialBandBins_at_12rpm :
    inertialWaveBandBinCount 12 = 24 := by
  norm_num [inertialWaveBandBinCount, maxInertialWaveFrequencyHz,
    fftBinWidthHz, nyquistFrequencyHz, positiveFrequencyBinCount,
    sampleCount, sampleRateHz, recordDurationSeconds]

#eval sampleCount
#eval nyquistFrequencyHz
#eval fftBinWidthHz
#eval inertialWaveBandBinCount 3
#eval inertialWaveBandBinCount 6
#eval inertialWaveBandBinCount 9
#eval inertialWaveBandBinCount 12

#print axioms vlsEnergyDensity_le_full
#print axioms fullEnergy_eq_vls_iff_azimuthal_zero
#print axioms no_full_energy_factorization_through_vls
#print axioms full_energy_decomposition
#print axioms azimuthalEnergyNumerator_nonneg
#print axioms omittedAzimuthalSpecificEnergy_nonneg
#print axioms vlsSpecificEnergy_le_full
#print axioms toroidalVolumeWeight_nonneg
#print axioms sampleCount_eq_3600
#print axioms fftBinWidth_eq_one_sixtieth
#print axioms inertialBandBins_at_3rpm
#print axioms inertialBandBins_at_6rpm
#print axioms inertialBandBins_at_9rpm
#print axioms inertialBandBins_at_12rpm

end HsHVerification.NadirRotatingFluidPIVEnergyReadout
