import Mathlib

/-!
# Source-grounded period support for the lunar "yearly" response bin

The 21 degree-two tide-raising Fourier constituent periods are transcribed
from Table 1 of Williams & Boggs (2015), JGR: Planets 120, 689–724,
DOI 10.1002/2014JE004755.

Goossens et al. (2024), AGU Advances 5, e2024AV001285,
DOI 10.1029/2024AV001285, group constituents with periods below 35 days
as monthly and the remaining constituents as yearly. Their paper states
that only four of the 21 constituents fall in the latter group, that only
one is the 365.260-day annual term, and that the 2190.350-day (six-year)
term is also included in the yearly group.

This module formalizes that published support partition and its span. It
does not infer a lunar constitutive law, reproduce the tracking-data fit,
or establish an H(s)H response. In particular, the four-term "yearly"
coefficient is not a point observation at exactly one year unless an
additional response model justifies that interpretation.
-/

namespace HsHVerification.LoomLunarPeriodGrouping

/-- Degree-two tide-raising constituent periods from Williams & Boggs (2015),
    Table 1, in days. Decimal entries preserve the table's 0.001-day display
    precision as exact rationals for source-table bookkeeping. -/
def publishedConstituentPeriodsDays : List ℚ :=
  [27.212, 27.555, 31.812, 14.765, 13.777, 13.691, 13.606,
   2190.350, 9.614, 365.260, 14.666, 9.572, 9.146, 32.281,
   188.201, 9.108, 205.892, 15.387, 9.185, 26.878, 34.847]

/-- Goossens et al. (2024) use the 35-day split for monthly versus yearly
    constituent groups. -/
def monthlyConstituentPeriodsDays : List ℚ :=
  publishedConstituentPeriodsDays.filter (fun p => decide (p < 35))

def yearlyConstituentPeriodsDays : List ℚ :=
  publishedConstituentPeriodsDays.filter (fun p => decide (35 < p))

def annualPeriodDays : ℚ := 365.260

def annualConstituentsInYearlyGroup : List ℚ :=
  yearlyConstituentPeriodsDays.filter (fun p => decide (p = annualPeriodDays))

def nonAnnualConstituentsInYearlyGroup : List ℚ :=
  yearlyConstituentPeriodsDays.filter (fun p => decide (p ≠ annualPeriodDays))

theorem published_constituent_count :
    publishedConstituentPeriodsDays.length = 21 := by
  decide

theorem monthly_group_count :
    monthlyConstituentPeriodsDays.length = 17 := by
  decide

theorem yearly_group_count :
    yearlyConstituentPeriodsDays.length = 4 := by
  decide

theorem annual_group_count :
    annualConstituentsInYearlyGroup.length = 1 := by
  decide

theorem nonannual_yearly_group_count :
    nonAnnualConstituentsInYearlyGroup.length = 3 := by
  decide

theorem annual_term_is_in_yearly_group :
    annualPeriodDays ∈ yearlyConstituentPeriodsDays := by
  decide

theorem six_year_term_is_in_yearly_group :
    (2190.350 : ℚ) ∈ yearlyConstituentPeriodsDays := by
  decide

theorem six_to_seven_month_terms_are_in_yearly_group :
    (188.201 : ℚ) ∈ yearlyConstituentPeriodsDays ∧
    (205.892 : ℚ) ∈ yearlyConstituentPeriodsDays := by
  decide

/-- The source-defined "yearly" bin is not a singleton annual-period sample. -/
theorem yearly_group_is_not_single_annual_point :
    yearlyConstituentPeriodsDays ≠ [annualPeriodDays] := by
  decide

/-- The longest-to-shortest period ratio within the four-term yearly bin
    lies strictly between 11 and 12. -/
theorem yearly_group_period_span_ratio_between_11_and_12 :
    11 < (2190.350 : ℚ) / 188.201 ∧
    (2190.350 : ℚ) / 188.201 < 12 := by
  norm_num

/-- Three quarters of the source-defined yearly-bin constituents are not
    the 365.260-day annual constituent. -/
theorem nonannual_share_of_yearly_group_is_three_quarters :
    (nonAnnualConstituentsInYearlyGroup.length : ℚ) /
      (yearlyConstituentPeriodsDays.length : ℚ) = 3 / 4 := by
  norm_num [nonAnnualConstituentsInYearlyGroup, yearlyConstituentPeriodsDays,
    publishedConstituentPeriodsDays, annualConstituentsInYearlyGroup,
    annualPeriodDays]

#eval publishedConstituentPeriodsDays.length
#eval monthlyConstituentPeriodsDays
#eval yearlyConstituentPeriodsDays
#eval annualConstituentsInYearlyGroup
#eval nonAnnualConstituentsInYearlyGroup
#eval (2190.350 : ℚ) / 188.201

#print axioms yearly_group_count
#print axioms annual_group_count
#print axioms nonannual_yearly_group_count
#print axioms yearly_group_is_not_single_annual_point
#print axioms yearly_group_period_span_ratio_between_11_and_12
#print axioms nonannual_share_of_yearly_group_is_three_quarters

end HsHVerification.LoomLunarPeriodGrouping
