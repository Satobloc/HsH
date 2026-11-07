import Mathlib

/-!
# Four-cell factorial contrast identifiability

This generic algebraic contract is motivated by the four final aggregate
determinations in Schlamminger et al., Metrologia 63 (2026) 025012,
Table 16. They are a copper/sapphire by servo/free summary, not the raw
acquisition design. Table 15 reports eight torque differences: copper
source masses at 0, 120, and 240 degrees, plus sapphire at one orientation,
each measured in both readout modes.

The four coefficients are a common mean, material contrast, readout
contrast, and material-by-readout interaction. The map from those four
coefficients to the four final summaries is bijective. Consequently, the
four-summary model is saturated after aggregation. This does NOT imply
that the full eight-observation acquisition has no residual structure.

For the copper orientations, the paper models
G(theta) = G_i + A sin(theta - theta_0), with i indexing the two readout
methods, and uses the three equally spaced clockings to cancel the
first-harmonic density-gradient contribution. The added theorem below
formalizes a conditional identifiability limit: an extra response in the
same first-harmonic sine/cosine span can be absorbed by reparameterizing
that nuisance model. It does not assert that H(s)H predicts such a term.

The module does NOT encode the eight measured values, raw time series,
published covariance matrix, or configuration-specific dark-uncertainty
posterior, and it does not validate a physical H(s)H map. Those remain
separate empirical and source-translation questions. No fit or physical
prediction is computed.
-/

namespace HsHVerification.FactorialContrastIdentifiability

@[ext]
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


/-- The phase-form orientation nuisance used in the NIST paper is a
    first-harmonic sine/cosine combination. This is a source-model
    reparameterization, not a claim about an H(s)H response. -/
theorem phase_parameterization_is_first_harmonic
    (A theta₀ theta : ℝ) :
    A * Real.sin (theta - theta₀) =
      (A * Real.cos theta₀) * Real.sin theta -
      (A * Real.sin theta₀) * Real.cos theta := by
  rw [Real.sin_sub]
  ring

/-- First-harmonic orientation response in the linear nuisance basis. -/
def firstHarmonic (a b theta : ℝ) : ℝ :=
  a * Real.sin theta + b * Real.cos theta

/-- Intercept plus the two first-harmonic nuisance coefficients. -/
def orientationModel (base a b theta : ℝ) : ℝ :=
  base + firstHarmonic a b theta

/-- An augmented model with an additional response in the same nuisance span. -/
def orientationModelWithExtra
    (base a b amplitude extraSin extraCos theta : ℝ) : ℝ :=
  orientationModel base a b theta +
    amplitude * firstHarmonic extraSin extraCos theta

/-- Any added first-harmonic response is exactly absorbed by changing the
    two nuisance coefficients. This is a conditional identifiability
    theorem; it does not establish that an H(s)H term has this form. -/
theorem same_span_extra_is_absorbed
    (base a b amplitude extraSin extraCos : ℝ) :
    ∃ a' b' : ℝ, ∀ theta : ℝ,
      orientationModelWithExtra base a b amplitude extraSin extraCos theta =
        orientationModel base a' b' theta := by
  refine ⟨a + amplitude * extraSin,
    b + amplitude * extraCos, ?_⟩
  intro theta
  unfold orientationModelWithExtra orientationModel firstHarmonic
  ring

#print axioms phase_parameterization_is_first_harmonic
#print axioms same_span_extra_is_absorbed

end HsHVerification.FactorialContrastIdentifiability
