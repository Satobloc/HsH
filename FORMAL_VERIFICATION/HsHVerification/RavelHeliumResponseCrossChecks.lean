import Mathlib

/-!
Ravel measured-response cross-checks for helium.

Primary sources:
* Schneider et al., "Direct measurement of the 3He+ magnetic moments",
  Nature 606, 878-883 (2022), DOI 10.1038/s41586-022-04761-7.
  The experiment measures four transition frequencies and the magnetic
  field in a single-ion Penning trap. The shielded ion g-factor is measured;
  the bare nuclear g-factor requires a calculated diamagnetic shielding
  correction. The zero-field hyperfine splitting is measured and the
  Zemach radius is subsequently extracted using QED/nuclear-structure terms.
* Steinebach et al., "Spectroscopy of 4He at 0.25 ppt Uncertainty and
  Improved Alpha-Helion Charge-Radius Difference Determination",
  Phys. Rev. Lett. 136, 243001 (2026), DOI 10.1103/rwg9-my6x,
  arXiv:2601.19444v1. The same 4He BEC campaign reports a triplet-singlet
  scattering length 61.6(3.6) a0, compared with the earlier 82.5(5.2) a0.
* The 3He/4He Zemach comparison is interpreted alongside the 2026
  Quantum Monte Carlo preprint, arXiv:2606.11153, which defines the
  elastic Zemach radius from charge/magnetic form factors and separately
  discusses inelastic two-photon exchange and nuclear polarizability.

Scope:
* Verify only the quoted quadrature arithmetic.
* The 2.608(24)-fm HFS-extracted effective Zemach radius and the
  2.528(16)-fm electron-scattering elastic Zemach radius need not be
  identical estimands. Their 2.8-sigma quoted difference is descriptive,
  not by itself a same-observable inconsistency.
* The 61.6(3.6) a0 and 82.5(5.2) a0 scattering-length comparison is
  conditional on independent experimental uncertainties. The 2026 BEC
  slope and zero-density frequency come from the same campaign; their
  covariance is not supplied here, so they are not combined as independent.
* Neither comparison establishes an H(s)H physical map or a universal
  rope/medium equivalence.
-/

namespace HsHVerification.RavelHeliumResponseCrossChecks

/-- HFS-derived effective Zemach radius, Schneider et al. 2022, fm. -/
def hfsExtractedZemachFm : ℚ := 2608 / 1000

/-- Standard uncertainty of the HFS-extracted value, fm. -/
def hfsExtractedZemachSigmaFm : ℚ := 24 / 1000

/-- Elastic electron-scattering Zemach radius, Sick 2014 as quoted by
Schneider et al. 2022, fm. -/
def elasticScatteringZemachFm : ℚ := 2528 / 1000

/-- Standard uncertainty of the elastic electron-scattering value, fm. -/
def elasticScatteringZemachSigmaFm : ℚ := 16 / 1000

/-- Descriptive squared difference in quoted standard deviations,
assuming zero cross-covariance. This does not harmonize the estimands. -/
def quotedZemachDifferenceZSquared : ℚ :=
  (hfsExtractedZemachFm - elasticScatteringZemachFm)^2 /
  (hfsExtractedZemachSigmaFm^2 + elasticScatteringZemachSigmaFm^2)

theorem quoted_zemach_difference_is_between_2_77_and_2_78_sigma :
    ((277 : ℚ) / 100)^2 < quotedZemachDifferenceZSquared ∧
    quotedZemachDifferenceZSquared < ((278 : ℚ) / 100)^2 := by
  norm_num [quotedZemachDifferenceZSquared,
    hfsExtractedZemachFm, elasticScatteringZemachFm,
    hfsExtractedZemachSigmaFm, elasticScatteringZemachSigmaFm]

/-- 2026 BEC triplet-singlet scattering length, in Bohr radii. -/
def becScatteringLength2026A0 : ℚ := 616 / 10

/-- 2026 BEC scattering-length standard uncertainty, in Bohr radii. -/
def becScatteringLength2026SigmaA0 : ℚ := 36 / 10

/-- Earlier measured triplet-singlet scattering length, in Bohr radii. -/
def becScatteringLengthEarlierA0 : ℚ := 825 / 10

/-- Earlier measurement standard uncertainty, in Bohr radii. -/
def becScatteringLengthEarlierSigmaA0 : ℚ := 52 / 10

/-- Conditional squared difference in standard deviations, assuming
independent experimental errors. -/
def becScatteringLengthDifferenceZSquared : ℚ :=
  (becScatteringLength2026A0 - becScatteringLengthEarlierA0)^2 /
  (becScatteringLength2026SigmaA0^2 + becScatteringLengthEarlierSigmaA0^2)

theorem bec_scattering_length_difference_is_between_3_30_and_3_31_sigma :
    ((330 : ℚ) / 100)^2 < becScatteringLengthDifferenceZSquared ∧
    becScatteringLengthDifferenceZSquared < ((331 : ℚ) / 100)^2 := by
  norm_num [becScatteringLengthDifferenceZSquared,
    becScatteringLength2026A0, becScatteringLengthEarlierA0,
    becScatteringLength2026SigmaA0, becScatteringLengthEarlierSigmaA0]

#eval quotedZemachDifferenceZSquared
#eval becScatteringLengthDifferenceZSquared

#print axioms quoted_zemach_difference_is_between_2_77_and_2_78_sigma
#print axioms bec_scattering_length_difference_is_between_3_30_and_3_31_sigma

end HsHVerification.RavelHeliumResponseCrossChecks
