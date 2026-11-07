import HsHVerification.RavelMuonicSpectroscopyLedger
import Mathlib

/-!
Source-conditioned muonic He isotope comparison.
CREMA arXiv:2305.11679v2 PDF eq. (18), with experimentally measured
Lamb shifts for 3He and 4He. Published central gap: 1.0636 fm^2.
The 2021 Nature alpha radius 1.67824(83) fm and 2025 Science
helion radius 1.97007(94) fm are separately model-extracted.
The naive difference of their squares is not the correlated isotope
readout and must not be substituted for it.
-/

namespace HsHVerification.RavelMuonic2026

def muonicIsotopeGap : ℚ :=
  -e3 / slope3 + e4 / slope4 + isotopeOffset
def publishedIsotopeGap : ℚ := 10636 / 10000
def publishedHelionFm : ℚ := 197007 / 100000
def publishedAlphaFm : ℚ := 167824 / 100000
def naiveSquaredGap : ℚ := publishedHelionFm ^ 2 - publishedAlphaFm ^ 2

theorem isotope_formula_source_rounding_bound :
    publishedIsotopeGap < muonicIsotopeGap ∧
    muonicIsotopeGap < (10638 : ℚ) / 10000 := by
  norm_num [publishedIsotopeGap, muonicIsotopeGap,
    e3, e4, slope3, slope4, isotopeOffset]

theorem independently_extracted_radius_gap_exceeds_isotope_formula :
    muonicIsotopeGap < naiveSquaredGap := by
  norm_num [muonicIsotopeGap, naiveSquaredGap,
    e3, e4, slope3, slope4, isotopeOffset,
    publishedHelionFm, publishedAlphaFm]

theorem difference_below_two_thousandths :
    naiveSquaredGap - muonicIsotopeGap < (2 : ℚ) / 1000 := by
  norm_num [muonicIsotopeGap, naiveSquaredGap,
    e3, e4, slope3, slope4, isotopeOffset,
    publishedHelionFm, publishedAlphaFm]

#print axioms HsHVerification.RavelMuonic2026.isotope_formula_source_rounding_bound
#print axioms HsHVerification.RavelMuonic2026.independently_extracted_radius_gap_exceeds_isotope_formula
#print axioms HsHVerification.RavelMuonic2026.difference_below_two_thousandths

end HsHVerification.RavelMuonic2026
