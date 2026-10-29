import Mathlib
import HsHVerification.AldusNBSResidualData

/-!
Aldus: evaluated-model residuals versus later published tracer-density value.
Stasiak et al. PNAS (2025), DOI 10.1073/pnas.2426064122, use 202.8 kg/m^3
= 0.2028 g/cm^3 for solid D2. Their figure is a paper parameter, NOT
an independent density measurement of the NBS table specimens.
1.65 K is the Tang 2023 reported helium-II bath temperature.
Comparison with a 17 K historical residual is a descriptive envelope
only, NOT a transferable uncertainty, sigma test, or physical H(s)H test.
-/

namespace HsHVerification.AldusNBSModelScatter

open HsHVerification.AldusNBSResidualData

def bathRelativeDifference : ℚ :=
  (rhoFit ((33 : ℚ) / 20) - ((2028 : ℚ) / 10000)) /
    rhoFit ((33 : ℚ) / 20)

def row17RelativeDifference : ℚ :=
  (rhoFit (17 : ℚ) - ((1951 : ℚ) / 10000)) / rhoFit (17 : ℚ)

theorem bath_relative_difference_between_08_and_09_percent :
    (8 : ℚ) / 1000 < bathRelativeDifference ∧
    bathRelativeDifference < (9 : ℚ) / 1000 := by
  norm_num [bathRelativeDifference, rhoFit]

theorem row17_relative_difference_between_09_and_10_percent :
    (9 : ℚ) / 1000 < row17RelativeDifference ∧
    row17RelativeDifference < (10 : ℚ) / 1000 := by
  norm_num [row17RelativeDifference, rhoFit]

theorem bath_difference_below_row17_historical_residual :
    bathRelativeDifference < row17RelativeDifference := by
  norm_num [bathRelativeDifference, row17RelativeDifference, rhoFit]

theorem bath_relative_difference_positive :
    0 < bathRelativeDifference := by
  norm_num [bathRelativeDifference, rhoFit]

#print axioms bath_relative_difference_between_08_and_09_percent
#print axioms row17_relative_difference_between_09_and_10_percent
#print axioms bath_difference_below_row17_historical_residual
#print axioms bath_relative_difference_positive

end HsHVerification.AldusNBSModelScatter
