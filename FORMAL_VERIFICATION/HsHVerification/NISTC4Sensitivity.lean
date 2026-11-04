import Mathlib
namespace HsHVerification.NISTC4Sensitivity
def gFromGammaTotal (cGammaTotal : Rat) : Rat := 1 - cGammaTotal
theorem nistC4_eq34_corrected_sign : gFromGammaTotal (-441 / 100) = 541 / 100 := by norm_num [gFromGammaTotal]
end HsHVerification.NISTC4Sensitivity
