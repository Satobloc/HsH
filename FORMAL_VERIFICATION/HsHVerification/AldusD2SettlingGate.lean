import Mathlib
import HsHVerification.AldusD2DensitySourceGate

/-!
Source-conditional Stokes settling calibration sensitivity.
The source reports a settling-velocity distribution peak ~0.1 mm/s
and an INFERRED particle-radius peak ~1.1 micrometres.
The latter is not independent of the density assumption.
This module checks exact density-contrast ratios and the relative
squared-radius scale for fixed measured settling speed, fluid viscosity
and g. It does not validate the Stokes assumptions, experimental
uncertainties, any H(s)H mechanism, or a 2008 source attribution.
-/

namespace HsHVerification.AldusD2SettlingGate

open HsHVerification.AldusD2DensitySourceGate

def contrastRatio : ℚ := contrastLiteral / contrastLater
def fixedStokesRadiusSquaredRatio : ℚ := contrastLater / contrastLiteral

theorem contrast_ratio_exact :
    contrastRatio = (2026550 : ℚ) / 578 := by
  norm_num [contrastRatio, contrastLater, contrastLiteral,
    rhoD2LaterKgM3, rhoD2LiteralKgM3, rhoHeApproxKgM3]

theorem contrast_ratio_above_3000 :
    (3000 : ℚ) < contrastRatio := by
  norm_num [contrastRatio, contrastLater, contrastLiteral,
    rhoD2LaterKgM3, rhoD2LiteralKgM3, rhoHeApproxKgM3]

theorem fixed_radius_squared_scale_below_one_three_thousandth :
    fixedStokesRadiusSquaredRatio < (1 : ℚ) / 3000 := by
  norm_num [fixedStokesRadiusSquaredRatio, contrastLater, contrastLiteral,
    rhoD2LaterKgM3, rhoD2LiteralKgM3, rhoHeApproxKgM3]

theorem density_contrast_reciprocal :
    contrastRatio * fixedStokesRadiusSquaredRatio = 1 := by
  norm_num [contrastRatio, fixedStokesRadiusSquaredRatio,
    contrastLater, contrastLiteral, rhoD2LaterKgM3,
    rhoD2LiteralKgM3, rhoHeApproxKgM3]

#print axioms contrast_ratio_exact
#print axioms contrast_ratio_above_3000
#print axioms fixed_radius_squared_scale_below_one_three_thousandth
#print axioms density_contrast_reciprocal

end HsHVerification.AldusD2SettlingGate
