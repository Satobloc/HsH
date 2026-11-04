import Mathlib
import HsHVerification.NISTC4Sensitivity
namespace HsHVerification.NISTC4Dimensions
open HsHVerification.NISTC4Sensitivity
structure DimExp where
  l : Int
  m : Int
  t : Int
deriving DecidableEq, Repr
def add (x y : DimExp) : DimExp := ⟨x.l+y.l, x.m+y.m, x.t+y.t⟩
def sub (x y : DimExp) : DimExp := ⟨x.l-y.l, x.m-y.m, x.t-y.t⟩
def dimG : DimExp := ⟨3,-1,-2⟩
def dimMass : DimExp := ⟨0,1,0⟩
def dimLength : DimExp := ⟨1,0,0⟩
def dimTorque : DimExp := ⟨2,1,-2⟩
def prefactor : DimExp := add dimG (sub (add dimMass dimMass) dimLength)
def gammaRequired : DimExp := sub dimTorque prefactor
def gammaPrintedTable10 : DimExp := ⟨-1,2,0⟩
theorem prefactor_has_torque_dimension : prefactor = dimTorque := by decide
theorem gamma_required_dimensionless : gammaRequired = ⟨0,0,0⟩ := by decide
theorem table10_printed_unit_inconsistent :
    add prefactor gammaPrintedTable10 ≠ dimTorque := by decide
theorem combined_conditional_audit :
    gFromGammaTotal (-441 / 100) = 541 / 100 /\\
    gammaRequired = ⟨0,0,0⟩ := by
  exact ⟨nistC4_eq34_corrected_sign, gamma_required_dimensionless⟩
#eval gammaRequired
#eval add prefactor gammaPrintedTable10
#print axioms prefactor_has_torque_dimension
#print axioms gamma_required_dimensionless
#print axioms table10_printed_unit_inconsistent
#print axioms combined_conditional_audit
end HsHVerification.NISTC4Dimensions
