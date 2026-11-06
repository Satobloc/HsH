import Mathlib

/-!
Real-source anchored *published extraction* arithmetic for the 3He/4He isotope-shift
comparison. Units: fm^2. Values are encoded as exact rationals ONLY to check
arithmetic on rounded reported figures, not to declare experimental precision.

CREMA, Science 388 (2025) 854-858, doi:10.1126/science.adj2610:
  muonic extracted r_h^2-r_alpha^2 = 1.0636 fm^2.
van der Werf et al., Science 388 (2025) 850-853, doi:10.1126/science.adj2462:
  electronic extracted r_h^2-r_alpha^2 = 1.0757 fm^2.
Qi et al., arXiv:2409.09279 (theory reanalysis):
  proposed hyperfine-mixing shift = -0.0064 fm^2.
No H(s)H prediction, physical mapping or covariance model is proved here.
-/
namespace HsHVerification.KestrelHeliumIsotopeSources

def muonicExtract : ℚ := 10636 / 10000
def electronicExtract : ℚ := 10757 / 10000
def proposedMixingShift : ℚ := -(64 / 10000)

theorem original_gap :
    electronicExtract - muonicExtract = 121 / 10000 := by
  norm_num [electronicExtract, muonicExtract]

theorem theory_revised_electronic :
    electronicExtract + proposedMixingShift = 10693 / 10000 := by
  norm_num [electronicExtract, proposedMixingShift]

theorem theory_revised_gap :
    (electronicExtract + proposedMixingShift) - muonicExtract = 57 / 10000 := by
  norm_num [electronicExtract, muonicExtract, proposedMixingShift]

theorem gap_reduction_identity :
    electronicExtract - muonicExtract =
      -proposedMixingShift +
      ((electronicExtract + proposedMixingShift) - muonicExtract) := by
  ring

theorem revised_gap_still_positive :
    (0 : ℚ) < (electronicExtract + proposedMixingShift) - muonicExtract := by
  norm_num [electronicExtract, muonicExtract, proposedMixingShift]

#print axioms original_gap
#print axioms theory_revised_electronic
#print axioms theory_revised_gap
#print axioms gap_reduction_identity
#print axioms revised_gap_still_positive

end HsHVerification.KestrelHeliumIsotopeSources
