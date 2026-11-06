import Mathlib

/-!
# Four-cell factorial contrast identifiability

This generic algebraic contract is motivated by the four aggregated
configurations in Schlamminger et al., Metrologia 63 (2026) 025012,
Table 16: copper/sapphire source-mass material crossed with
electrostatic-servo/free-deflection readout.

The four coefficients are a common mean, material contrast, readout
contrast, and material-by-readout interaction. The map from those four
coefficients to the four cell summaries is bijective. Consequently, at
this aggregation level the four-parameter factorial model is saturated:
it can represent any four cell values exactly and supplies no residual
degrees of freedom for testing an additional H(s)H-specific effect.

This theorem does NOT establish that the four measurements are independent,
does not encode their published covariance matrix or the paper's
configuration-specific dark-uncertainty model, and does not validate a
physical H(s)H map. Those remain separate empirical and source-translation
questions. No physical fixture or numerical measurement is introduced.
-/

namespace HsHVerification.FactorialContrastIdentifiability

structure Coefficients where
  mean : ℚ
  material : ℚ
  readout : ℚ
  interaction : ℚ
deriving DecidableEq

/-- Four cells ordered as:
    0 copper-servo, 1 copper-free, 2 sapphire-servo, 3 sapphire-free. -/
def cells (c : Coefficients) : Fin 4 → ℚ :=
  ![ c.mean - c.material - c.readout + c.interaction
   , c.mean - c.material + c.readout - c.interaction
   , c.mean + c.material - c.readout - c.interaction
   , c.mean + c.material + c.readout + c.interaction ]

/-- Inverse contrast transform from four cell summaries to the four
    factorial coefficients. -/
def recover (y : Fin 4 → ℚ) : Coefficients where
  mean := (y 0 + y 1 + y 2 + y 3) / 4
  material := (-y 0 - y 1 + y 2 + y 3) / 4
  readout := (-y 0 + y 1 - y 2 + y 3) / 4
  interaction := (y 0 - y 1 - y 2 + y 3) / 4

/-- Recovering coefficients from their four cells returns the coefficients. -/
theorem recover_cells (c : Coefficients) : recover (cells c) = c := by
  ext <;> simp [recover, cells] <;> ring

/-- Every four-cell summary is represented exactly by the four factorial
    coefficients. -/
theorem cells_recover (y : Fin 4 → ℚ) : cells (recover y) = y := by
  funext i
  fin_cases i <;> simp [cells, recover] <;> ring

/-- The four-cell factorial map is bijective. This is the formal reason
    the four-parameter model is saturated at the four-summary level. -/
theorem factorialCellMap_bijective : Function.Bijective cells := by
  constructor
  · intro c₁ c₂ h
    have h' := congrArg recover h
    simpa [recover_cells] using h'
  · intro y
    exact ⟨recover y, cells_recover y⟩

#print axioms recover_cells
#print axioms cells_recover
#print axioms factorialCellMap_bijective

end HsHVerification.FactorialContrastIdentifiability
