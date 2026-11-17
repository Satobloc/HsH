import Mathlib
namespace HsHVerification.NISTC4Sensitivity
def gFromGammaTotal (c : Rat) : Rat := 1 - c
def gammaTotalRsAtFixedRt (a b : Rat) : Rat := b - a
def gRsAtFixedRtFromBasis (a b : Rat) : Rat :=
  gFromGammaTotal (gammaTotalRsAtFixedRt a b)
def gRsAtFixedEta (b : Rat) : Rat := 1 - b
def gEtaAtFixedRs (a : Rat) : Rat := -a
theorem gRsAtFixedRtFromBasis_eq (a b : Rat) :
    gRsAtFixedRtFromBasis a b = 1 - b + a := by
  unfold gRsAtFixedRtFromBasis gFromGammaTotal gammaTotalRsAtFixedRt
  ring
theorem sensitivity_basis_decomposition (a b : Rat) :
    gRsAtFixedRtFromBasis a b = gRsAtFixedEta b - gEtaAtFixedRs a := by
  unfold gRsAtFixedRtFromBasis gFromGammaTotal gammaTotalRsAtFixedRt
    gRsAtFixedEta gEtaAtFixedRs
  ring
theorem nistC4_eq34_corrected_sign :
    gFromGammaTotal (-441 / 100) = 541 / 100 := by
  norm_num [gFromGammaTotal]
theorem nistC4_table6_rounded_basis_value :
    gRsAtFixedRtFromBasis (44 / 10) (-12 / 1000) = 1353 / 250 := by
  norm_num [gRsAtFixedRtFromBasis, gFromGammaTotal, gammaTotalRsAtFixedRt]
#eval gFromGammaTotal (-441 / 100)
#eval gRsAtFixedRtFromBasis (44 / 10) (-12 / 1000)
#print axioms nistC4_eq34_corrected_sign
#print axioms nistC4_table6_rounded_basis_value
#print axioms sensitivity_basis_decomposition
end HsHVerification.NISTC4Sensitivity
