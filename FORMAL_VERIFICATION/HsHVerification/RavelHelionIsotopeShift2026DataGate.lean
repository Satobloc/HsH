import Mathlib
import HsHVerification.RavelMuonicIsotopeGate

/-!
Ravel measured-input arithmetic gate: helium-3 / helium-4 isotope shift.

Primary experimental source:
  Steinebach et al., "Spectroscopy of 4He at 0.25 ppt Uncertainty and
  Improved Alpha-Helion Charge-Radius Difference Determination",
  Phys. Rev. Lett. 136, 243001 (2026), DOI 10.1103/rwg9-my6x,
  arXiv:2601.19444v1.
  The 4He 2^3S1 -> 2^1S0 transition was measured in a BEC in a
  magic-wavelength optical dipole trap. Nine measurement sets ran
  2024-11-28 through 2025-01-26. The final frequency is
  192510702148649(48) Hz. The paper's Table I gives the measured
  frequency and signed corrections used below.

The 3He transition input is van der Werf et al., Science 388, 850 (2025),
DOI 10.1126/science.adj2462; its raw-data deposit is Dryad
10.5061/dryad.4j0zpc8m3. The muonic comparison is Schuhmann et al.,
Science 388, 854 (2025), DOI 10.1126/science.adj2610. The existing
RavelMuonicIsotopeGate module supplies the published 1.0636 fm^2
muonic isotope-gap central value.

The 2026 paper's supplement cites CODATA 2022 for the helium mass used
in the recoil correction; its main-text general constants reference
still points to CODATA 2018. This module does not silently replace either
source. The recoil correction is retained exactly as printed in Table I.

Scope:
* Verify arithmetic on the published rounded measurement tables.
* Verify the listed quadrature budgets conditionally, without inventing
  an unreported covariance matrix.
* Verify the published finite-size affine inversion conditionally.
* Reproduce the approximately 1.2-sigma electronic/muonic comparison
  only under the explicit zero-cross-covariance assumption.

Not proved:
* No raw 3He or 4He time-series reanalysis.
* No full covariance audit; the component tables do not publish all
  cross-covariances.
* No H(s)H geometry-to-current, form-factor, polarizability, or
  atomic-readout map.
* No physical premise, nuclear model, or radius extraction is validated
  by Lean. The 1.0676(10) fm^2 radius difference is a published
  theory-conditioned inference, not a directly observed length.
-/

namespace HsHVerification.RavelHelionIsotopeShift2026

/-- 4He measured transition frequency before the listed corrections, Hz. -/
def fourHeMeasuredFrequencyHz : ℚ := 1925107021692051 / 10

/-- Signed corrections from Table I, all in Hz. -/
def fourHeRecoilShiftHz : ℚ := -2055430 / 100
def fourHeMagneticGradientHz : ℚ := -6
def fourHeDecayMuHz : ℚ := 0
def fourHeResidualDopplerHz : ℚ := 0
def fourHeBlackbodyHz : ℚ := 39 / 10
def fourHeDcStarkHz : ℚ := 0
def fourHeClockHz : ℚ := 0
def fourHeGravitationalRedshiftHz : ℚ := -9 / 100
def fourHeQuantumInterferenceHz : ℚ := 0

def fourHeCorrectionSumHz : ℚ :=
  fourHeRecoilShiftHz +
  fourHeMagneticGradientHz +
  fourHeDecayMuHz +
  fourHeResidualDopplerHz +
  fourHeBlackbodyHz +
  fourHeDcStarkHz +
  fourHeClockHz +
  fourHeGravitationalRedshiftHz +
  fourHeQuantumInterferenceHz

def fourHeCorrectedFrequencyHz : ℚ :=
  fourHeMeasuredFrequencyHz + fourHeCorrectionSumHz

def fourHePublishedFrequencyHz : ℚ := 192510702148649

theorem fourHe_correction_sum_matches_table :
    fourHeCorrectionSumHz = -2055649 / 100 := by
  norm_num [fourHeCorrectionSumHz, fourHeRecoilShiftHz,
    fourHeMagneticGradientHz, fourHeDecayMuHz,
    fourHeResidualDopplerHz, fourHeBlackbodyHz,
    fourHeDcStarkHz, fourHeClockHz,
    fourHeGravitationalRedshiftHz, fourHeQuantumInterferenceHz]

/-- Printed corrections recover the published integer-Hz result by rounding. -/
theorem fourHe_corrected_frequency_rounds_to_published :
    |fourHeCorrectedFrequencyHz - fourHePublishedFrequencyHz| < (1 : ℚ) / 2 := by
  norm_num [fourHeCorrectedFrequencyHz, fourHePublishedFrequencyHz,
    fourHeMeasuredFrequencyHz, fourHeCorrectionSumHz,
    fourHeRecoilShiftHz, fourHeMagneticGradientHz,
    fourHeDecayMuHz, fourHeResidualDopplerHz,
    fourHeBlackbodyHz, fourHeDcStarkHz, fourHeClockHz,
    fourHeGravitationalRedshiftHz, fourHeQuantumInterferenceHz]

/-- Table-I component uncertainties, squared, in Hz^2.
The listed components are treated as uncorrelated for this conditional
quadrature reconstruction. -/
def fourHeFrequencyUncertaintyVarianceHz2 : ℚ :=
  (27 : ℚ)^2 + (22 : ℚ)^2 + (33 : ℚ)^2 + (3 : ℚ)^2 +
  ((3 : ℚ) / 10)^2 + ((3 : ℚ) / 5)^2 + (1 : ℚ)^2 +
  ((3 : ℚ) / 100)^2 + ((1 : ℚ) / 10)^2 + ((1 : ℚ) / 100)^2

theorem fourHe_frequency_uncertainty_rounds_to_48Hz :
    (48 : ℚ)^2 < fourHeFrequencyUncertaintyVarianceHz2 ∧
    fourHeFrequencyUncertaintyVarianceHz2 < (97 : ℚ / 2)^2 := by
  norm_num [fourHeFrequencyUncertaintyVarianceHz2]

/-- Signed Table-III isotope-shift contributions, in kHz. -/
def isotopeShiftComponentSumKHz : ℚ :=
  (192504914418960 : ℚ) / 1000
  - (192510702148649 : ℚ) / 1000
  - (2246567059 : ℚ) / 1000
  + (8034146901 : ℚ) / 1000
  - (79056 : ℚ) / 1000
  + (157 : ℚ) / 1000

theorem isotope_shift_component_sum_matches_table :
    isotopeShiftComponentSumKHz = -228746 / 1000 := by
  norm_num [isotopeShiftComponentSumKHz]

/-- Table-III uncertainty components, squared, in Hz^2.
The paper reports the combined 207-Hz uncertainty but does not publish a
complete covariance matrix for these components. -/
def isotopeShiftUncertaintyVarianceHz2 : ℚ :=
  (170 : ℚ)^2 + (48 : ℚ)^2 + (5 : ℚ)^2 +
  (105 : ℚ)^2 + (20 : ℚ)^2

theorem isotope_shift_uncertainty_variance_eq :
    isotopeShiftUncertaintyVarianceHz2 = 42654 := by
  norm_num [isotopeShiftUncertaintyVarianceHz2]

theorem isotope_shift_uncertainty_rounds_to_207Hz :
    (413 : ℚ / 2)^2 < isotopeShiftUncertaintyVarianceHz2 ∧
    isotopeShiftUncertaintyVarianceHz2 < (415 : ℚ / 2)^2 := by
  norm_num [isotopeShiftUncertaintyVarianceHz2]

/-- Muonic isotope-gap uncertainty components: 0.0006_exp and 0.0030_theory fm^2. -/
def muonicGapUncertaintyVarianceFm4 : ℚ :=
  ((6 : ℚ) / 10000)^2 + ((30 : ℚ) / 10000)^2

theorem muonic_gap_uncertainty_variance_eq :
    muonicGapUncertaintyVarianceFm4 = 936 / 100000000 := by
  norm_num [muonicGapUncertaintyVarianceFm4]

theorem muonic_gap_total_sigma_rounds_to_0_0031 :
    ((305 : ℚ) / 100000)^2 < muonicGapUncertaintyVarianceFm4 ∧
    muonicGapUncertaintyVarianceFm4 < ((315 : ℚ) / 100000)^2 := by
  norm_num [muonicGapUncertaintyVarianceFm4]

/-- Published electronic isotope-gap central value, fm^2. -/
def electronicIsotopeGapFm2 : ℚ := 10676 / 10000

/-- Published electronic isotope-gap standard uncertainty, fm^2. -/
def electronicIsotopeGapSigmaFm2 : ℚ := 1 / 1000

/-- Published muonic isotope-gap standard uncertainty, fm^2. -/
def muonicIsotopeGapSigmaFm2 : ℚ := 31 / 10000

/-- Conditional squared z-score, assuming zero cross-covariance between
the electronic and muonic determinations. -/
def electronicMuonicComparisonZSquared : ℚ :=
  (electronicIsotopeGapFm2 -
    HsHVerification.RavelMuonic2026.publishedIsotopeGap)^2 /
  (electronicIsotopeGapSigmaFm2^2 + muonicIsotopeGapSigmaFm2^2)

theorem electronic_muonic_comparison_is_between_1_22_and_1_23_sigma :
    (122 : ℚ / 100)^2 < electronicMuonicComparisonZSquared ∧
    electronicMuonicComparisonZSquared < (123 : ℚ / 100)^2 := by
  norm_num [electronicMuonicComparisonZSquared,
    electronicIsotopeGapFm2, electronicIsotopeGapSigmaFm2,
    muonicIsotopeGapSigmaFm2,
    HsHVerification.RavelMuonic2026.publishedIsotopeGap]

/-- Published finite-size relation from the 2026 paper, kHz and fm^2. -/
def finiteSizeCkHzPerFm2 : ℚ := -214758 / 1000
def finiteSizeDkHzPerFm2 : ℚ := 17 / 1000

/-- The D term is small relative to C, but it is not zero. -/
theorem finite_size_D_over_abs_C_is_positive_and_below_1e4 :
    0 < finiteSizeDkHzPerFm2 / (-finiteSizeCkHzPerFm2) ∧
    finiteSizeDkHzPerFm2 / (-finiteSizeCkHzPerFm2) < (1 : ℚ) / 10000 := by
  norm_num [finiteSizeCkHzPerFm2, finiteSizeDkHzPerFm2]

/-- Conditional algebraic inversion of
E_fs = C (r_h^2 - r_alpha^2) + D (r_h^2 + r_alpha^2).
This does not supply the physical map that generates C or D. -/
theorem finite_size_relation_inverts
    (rh2 ra2 efs : ℚ)
    (hC : finiteSizeCkHzPerFm2 ≠ 0)
    (hE : efs =
      finiteSizeCkHzPerFm2 * (rh2 - ra2) +
      finiteSizeDkHzPerFm2 * (rh2 + ra2)) :
    (efs - finiteSizeDkHzPerFm2 * (rh2 + ra2)) /
      finiteSizeCkHzPerFm2 = rh2 - ra2 := by
  rw [hE]
  field_simp [hC]
  ring

/-- The published 207-Hz residual uncertainty gives this linearized
scale if C is held fixed and the D-term uncertainty is ignored.
It is a scale check, not a reproduction of the full radius uncertainty. -/
def linearizedRadiusGapSigmaFm2 : ℚ :=
  (207 : ℚ) / 1000 / (-finiteSizeCkHzPerFm2)

theorem linearized_radius_gap_sigma_is_0_00096_to_0_00097 :
    (96 : ℚ) / 100000 < linearizedRadiusGapSigmaFm2 ∧
    linearizedRadiusGapSigmaFm2 < (97 : ℚ) / 100000 := by
  norm_num [linearizedRadiusGapSigmaFm2,
    finiteSizeCkHzPerFm2]

#eval fourHeCorrectionSumHz
#eval fourHeCorrectedFrequencyHz
#eval fourHeFrequencyUncertaintyVarianceHz2
#eval isotopeShiftComponentSumKHz
#eval isotopeShiftUncertaintyVarianceHz2
#eval electronicMuonicComparisonZSquared

#print axioms fourHe_corrected_frequency_rounds_to_published
#print axioms isotope_shift_component_sum_matches_table
#print axioms isotope_shift_uncertainty_rounds_to_207Hz
#print axioms electronic_muonic_comparison_is_between_1_22_and_1_23_sigma
#print axioms finite_size_relation_inverts

end HsHVerification.RavelHelionIsotopeShift2026
