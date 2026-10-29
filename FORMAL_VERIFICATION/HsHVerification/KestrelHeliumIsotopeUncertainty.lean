import HsHVerification.KestrelHeliumIsotopeSources

/-!
Four separately reported standard-uncertainty components, each in fm^2:
electronic exp 0.0012, electronic theory 0.0009;
muonic exp 0.0006, muonic theory 0.0030.
Quadrature is a CONDITIONAL zero-covariance comparator, not an inferred
experimental covariance matrix. It must NOT be called the final discrepancy.
-/
namespace HsHVerification.KestrelHeliumIsotopeUncertainty

open HsHVerification.KestrelHeliumIsotopeSources

def electronicExpU : ℚ := 12 / 10000
def electronicTheoryU : ℚ := 9 / 10000
def muonicExpU : ℚ := 6 / 10000
def muonicTheoryU : ℚ := 30 / 10000

def independentVariance : ℚ :=
    electronicExpU ^ 2 + electronicTheoryU ^ 2 +
    muonicExpU ^ 2 + muonicTheoryU ^ 2

theorem quadrature_variance :
    independentVariance = 1161 / 100000000 := by
  norm_num [independentVariance, electronicExpU, electronicTheoryU,
    muonicExpU, muonicTheoryU]

/-- Under an assumed zero-covariance variance, the published raw gap is
strictly above three and below four nominal combined standard deviations. -/
theorem raw_gap_over_three_nominal :
    9 * independentVariance <
      (electronicExtract - muonicExtract) ^ 2 := by
  norm_num [independentVariance, electronicExpU, electronicTheoryU,
    muonicExpU, muonicTheoryU, electronicExtract, muonicExtract]

theorem raw_gap_under_four_nominal :
    (electronicExtract - muonicExtract) ^ 2 <
      16 * independentVariance := by
  norm_num [independentVariance, electronicExpU, electronicTheoryU,
    muonicExpU, muonicTheoryU, electronicExtract, muonicExtract]

/-- Reusing the *same* uncertainty as a sensitivity illustration is NOT a
revised uncertainty determination: Qi et al. did not supply covariance here. -/
theorem revised_gap_under_two_nominal :
    ((electronicExtract + proposedMixingShift) - muonicExtract) ^ 2 <
      4 * independentVariance := by
  norm_num [independentVariance, electronicExpU, electronicTheoryU,
    muonicExpU, muonicTheoryU, electronicExtract, muonicExtract,
    proposedMixingShift]

theorem revised_gap_over_one_nominal :
    independentVariance <
      ((electronicExtract + proposedMixingShift) - muonicExtract) ^ 2 := by
  norm_num [independentVariance, electronicExpU, electronicTheoryU,
    muonicExpU, muonicTheoryU, electronicExtract, muonicExtract,
    proposedMixingShift]

#print axioms quadrature_variance
#print axioms raw_gap_over_three_nominal
#print axioms raw_gap_under_four_nominal
#print axioms revised_gap_under_two_nominal
#print axioms revised_gap_over_one_nominal

end HsHVerification.KestrelHeliumIsotopeUncertainty
