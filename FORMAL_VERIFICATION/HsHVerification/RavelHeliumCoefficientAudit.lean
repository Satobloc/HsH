import Mathlib

/-!
Source-specific exact-rational audit of the helium isotope-shift conversion.

Sources:
* 2026 4He spectroscopy preprint, arXiv:2601.19444v2, Supplementary
  Material, Eq. (6) and Table III:
  https://arxiv.org/pdf/2601.19444
* K. Pachucki, V. Patkos, V. A. Yerokhin, "QED nuclear recoil effect in
  helium isotope shift", Phys. Rev. A 113, 012824 (2026), author-hosted
  final PDF, Eq. (22) and Table V:
  https://www.fuw.edu.pl/~krp/papers/hel_iso_a5_fin.pdf
* The older coefficient pair is also present in the 2024 helium
  hyperfine paper, Table IV:
  https://www.fuw.edu.pl/~krp/papers/hel_hfs_sec.pdf

The two absolute-radius central values 1.97007 fm and 1.6786 fm are used
only through their symmetric sum of squares. The 2025 theory PDF's prose
appears to transpose their isotope labels; that label issue does not
change this sum.

This file proves only exact rational arithmetic under the encoded
published central values. It does not establish which coefficient version
the 2026 authors actually used, whether the table is erroneous, the
correctness of the underlying QED calculation, or any H(s)H/SAT model.
-/

namespace HsHVerification.RavelHeliumCoefficientAudit

/-- Finite-size remainder reconstructed from Supplementary Table III, in kHz. -/
def efsFromTableIII : ℚ :=
  (192504914418960 : ℚ) / 1000
    - (192510702148649 : ℚ) / 1000
    - (2246567059 : ℚ) / 1000
    + (8034146901 : ℚ) / 1000
    - (79056 : ℚ) / 1000
    + (157 : ℚ) / 1000

/-- Symmetric sum of the two quoted absolute-radius squares, in fm^2. -/
def radiusPairSumSq : ℚ :=
  ((197007 : ℚ) / 100000)^2 + ((16786 : ℚ) / 10000)^2

/-- Updated coefficients in the 2025 PRA paper's Table V, kHz/fm^2. -/
def cFromPRA2025TableV : ℚ := - (214353 : ℚ) / 1000
def dFromPRA2025TableV : ℚ := (13 : ℚ) / 1000

/-- Coefficients printed in the 2026 supplement's Table III, kHz/fm^2. -/
def cPrintedIn2026TableIII : ℚ := - (214758 : ℚ) / 1000
def dPrintedIn2026TableIII : ℚ := (17 : ℚ) / 1000

/-- Reported squared-radius difference in the 2026 supplement, fm^2. -/
def reportedDelta2026 : ℚ := (10676 : ℚ) / 10000

/-- Conditional inversion of Eq. (6) using the 2025 Table V coefficients. -/
def deltaUsingPRA2025Coefficients : ℚ :=
  (efsFromTableIII - dFromPRA2025TableV * radiusPairSumSq) /
    cFromPRA2025TableV

/-- Conditional inversion of Eq. (6) using the coefficients printed in 2026 Table III. -/
def deltaUsing2026PrintedCoefficients : ℚ :=
  (efsFromTableIII - dPrintedIn2026TableIII * radiusPairSumSq) /
    cPrintedIn2026TableIII

/-- Radius-square sum implied if the printed 2026 coefficients and reported delta
    are both inserted into Eq. (6). -/
def impliedRadiusSumFrom2026PrintedPair : ℚ :=
  (efsFromTableIII - cPrintedIn2026TableIII * reportedDelta2026) /
    dPrintedIn2026TableIII

/-- Independent-quadrature variance from the five uncertainties printed in Table III. -/
def tableIIIUncertaintyVariance : ℚ :=
  ((170 : ℚ) / 1000)^2
    + ((48 : ℚ) / 1000)^2
    + ((5 : ℚ) / 1000)^2
    + ((105 : ℚ) / 1000)^2
    + ((20 : ℚ) / 1000)^2

theorem tableIII_remainder_reconstructs :
    efsFromTableIII = - (228746 : ℚ) / 1000 := by
  norm_num [efsFromTableIII]

theorem radius_pair_sum_is_exact :
    radiusPairSumSq = (66988737649 : ℚ) / 10000000000 := by
  norm_num [radiusPairSumSq]

theorem tableIII_quadrature_rounds_to_0_207 :
    ((206 : ℚ) / 1000)^2 < tableIIIUncertaintyVariance
      ∧ tableIIIUncertaintyVariance < ((207 : ℚ) / 1000)^2 := by
  norm_num [tableIIIUncertaintyVariance]

theorem updated_PRA2025_pair_rounds_to_reported_delta :
    (106755 : ℚ) / 100000 ≤ deltaUsingPRA2025Coefficients
      ∧ deltaUsingPRA2025Coefficients < (106765 : ℚ) / 100000 := by
  norm_num [deltaUsingPRA2025Coefficients, efsFromTableIII, radiusPairSumSq,
    cFromPRA2025TableV, dFromPRA2025TableV]

theorem printed_2026_pair_rounds_to_1_0657 :
    (106565 : ℚ) / 100000 ≤ deltaUsing2026PrintedCoefficients
      ∧ deltaUsing2026PrintedCoefficients < (106575 : ℚ) / 100000 := by
  norm_num [deltaUsing2026PrintedCoefficients, efsFromTableIII, radiusPairSumSq,
    cPrintedIn2026TableIII, dPrintedIn2026TableIII]

theorem coefficient_pair_changes_delta_by_more_than_0_0018 :
    deltaUsingPRA2025Coefficients - deltaUsing2026PrintedCoefficients
      > (18 : ℚ) / 10000 := by
  norm_num [deltaUsingPRA2025Coefficients, deltaUsing2026PrintedCoefficients,
    efsFromTableIII, radiusPairSumSq, cFromPRA2025TableV, dFromPRA2025TableV,
    cPrintedIn2026TableIII, dPrintedIn2026TableIII]

theorem updated_pair_residual_below_0_011_kHz :
    |efsFromTableIII -
      (cFromPRA2025TableV * reportedDelta2026
        + dFromPRA2025TableV * radiusPairSumSq)| < (11 : ℚ) / 1000 := by
  norm_num [efsFromTableIII, radiusPairSumSq, cFromPRA2025TableV,
    dFromPRA2025TableV, reportedDelta2026]

theorem printed_pair_residual_above_0_4_kHz :
    |efsFromTableIII -
      (cPrintedIn2026TableIII * reportedDelta2026
        + dPrintedIn2026TableIII * radiusPairSumSq)| > (2 : ℚ) / 5 := by
  norm_num [efsFromTableIII, radiusPairSumSq, cPrintedIn2026TableIII,
    dPrintedIn2026TableIII, reportedDelta2026]

theorem printed_pair_implies_radius_sum_above_31_fm2 :
    impliedRadiusSumFrom2026PrintedPair > 31 := by
  norm_num [impliedRadiusSumFrom2026PrintedPair, efsFromTableIII,
    cPrintedIn2026TableIII, dPrintedIn2026TableIII, reportedDelta2026]

#print axioms tableIII_remainder_reconstructs
#print axioms radius_pair_sum_is_exact
#print axioms tableIII_quadrature_rounds_to_0_207
#print axioms updated_PRA2025_pair_rounds_to_reported_delta
#print axioms printed_2026_pair_rounds_to_1_0657
#print axioms coefficient_pair_changes_delta_by_more_than_0_0018
#print axioms updated_pair_residual_below_0_011_kHz
#print axioms printed_pair_residual_above_0_4_kHz
#print axioms printed_pair_implies_radius_sum_above_31_fm2

end HsHVerification.RavelHeliumCoefficientAudit
