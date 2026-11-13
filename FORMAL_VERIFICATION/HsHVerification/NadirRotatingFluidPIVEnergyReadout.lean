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
* The vertical light-sheet (VLS) samples the axial-radial plane.
* Its two-component PIV readout omits the azimuthal velocity component.
* The paper explicitly says the kinetic-energy calculation omits the
  out-of-plane contribution; it also reports radial and azimuthal velocities
  of similar magnitude.
* The paper uses an axisymmetry assumption to assign toroidal volume weights
  to VLS interrogation cells.

The map below is an assistant reconstruction of that measurement boundary.
It is not a source-authored H(s)H map, a 3D reconstruction, or a physical
equivalence. The theorems are conditional algebra: a VLS-only readout cannot
determine arbitrary full 3D kinetic energy, while the VLS energy is a lower
bound when the omitted component and volume weights are treated consistently.
Lean does not establish that the experiment is axisymmetric or validate the
PIV calibration.
-/

namespace HsHVerification.NadirRotatingFluidPIVEnergyReadout

open HsHVerification.NadirProjectionCoarseGrainFactorization

/-- Velocity components (axial, radial, azimuthal) at one spatial sample. -/
abbrev Velocity3 := ℝ × (ℝ × ℝ)

/-- The VLS two-component readout (axial, radial). -/
abbrev VLSReadout := ℝ × ℝ

/-- The VLS readout discards the azimuthal component. -/
def vlsReadout (v : Velocity3) : VLSReadout :=
  (v.1, v.2.1)

/-- Kinetic-energy density represented by the two in-plane VLS components. -/
def vlsEnergyDensity (v : Velocity3) : ℝ :=
  (v.1 ^ 2 + v.2.1 ^ 2) / 2

/-- Full three-component kinetic-energy density. -/
def fullEnergyDensity (v : Velocity3) : ℝ :=
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

/-- VLS-only specific kinetic-energy estimator. -/
def vlsSpecificEnergy (w uAxial uRadial : ι → ℝ) : ℝ :=
  vlsEnergyNumerator w uAxial uRadial / (2 * totalWeight w)

/-- Full specific kinetic energy with the azimuthal contribution restored. -/
def fullSpecificEnergy
    (w uAxial uRadial uAzimuthal : ι → ℝ) : ℝ :=
  (vlsEnergyNumerator w uAxial uRadial +
    azimuthalEnergyNumerator w uAzimuthal) / (2 * totalWeight w)

/-- The missing azimuthal contribution to the specific-energy estimator. -/
def omittedAzimuthalSpecificEnergy
    (w uAzimuthal : ι → ℝ) : ℝ :=
  azimuthalEnergyNumerator w uAzimuthal / (2 * totalWeight w)

/-- Exact decomposition of full energy into VLS and omitted azimuthal terms. -/
theorem full_energy_decomposition
    (w uAxial uRadial uAzimuthal : ι → ℝ) :
    fullSpecificEnergy w uAxial uRadial uAzimuthal =
      vlsSpecificEnergy w uAxial uRadial +
        omittedAzimuthalSpecificEnergy w uAzimuthal := by
  simp [fullSpecificEnergy, vlsSpecificEnergy,
    omittedAzimuthalSpecificEnergy, add_div]

/-- Nonnegative volume weights make the omitted azimuthal numerator nonnegative. -/
theorem azimuthalEnergyNumerator_nonneg
    (w uAzimuthal : ι → ℝ)
    (hw : ∀ i, 0 ≤ w i) :
    0 ≤ azimuthalEnergyNumerator w uAzimuthal := by
  unfold azimuthalEnergyNumerator
  apply Finset.sum_nonneg
  intro i hi
  exact mul_nonneg (hw i) (sq_nonneg (uAzimuthal i))

/-- With positive total volume, the omitted azimuthal energy is nonnegative. -/
theorem omittedAzimuthalSpecificEnergy_nonneg
    (w uAzimuthal : ι → ℝ)
    (hw : ∀ i, 0 ≤ w i)
    (hW : 0 < totalWeight w) :
    0 ≤ omittedAzimuthalSpecificEnergy w uAzimuthal := by
  unfold omittedAzimuthalSpecificEnergy
  exact div_nonneg
    (azimuthalEnergyNumerator_nonneg w uAzimuthal hw)
    (by positivity)

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
def toroidalVolumeWeight (h r dr : ℝ) : ℝ :=
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

#print axioms vlsEnergyDensity_le_full
#print axioms fullEnergy_eq_vls_iff_azimuthal_zero
#print axioms no_full_energy_factorization_through_vls
#print axioms full_energy_decomposition
#print axioms azimuthalEnergyNumerator_nonneg
#print axioms omittedAzimuthalSpecificEnergy_nonneg
#print axioms vlsSpecificEnergy_le_full
#print axioms toroidalVolumeWeight_nonneg

end HsHVerification.NadirRotatingFluidPIVEnergyReadout
