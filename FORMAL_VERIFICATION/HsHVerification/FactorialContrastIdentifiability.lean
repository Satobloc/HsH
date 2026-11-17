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
noncomputable def firstHarmonic (a b theta : ℝ) : ℝ :=
  a * Real.sin theta + b * Real.cos theta

/-- Intercept plus the two first-harmonic nuisance coefficients. -/
noncomputable def orientationModel (base a b theta : ℝ) : ℝ :=
  base + firstHarmonic a b theta

/-- An augmented model with an additional response in the same nuisance span. -/
noncomputable def orientationModelWithExtra
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


/-!
## Three-clocking, two-readout identifiability

The NIST Table 15 copper block has three clockings (0, 120, 240 degrees)
for each of two readout methods. The source's model
G(theta) = G_i + A * sin(theta - theta0) has a separate intercept G_i
for each readout but a shared amplitude and phase. After linearizing the
phase parameterization, this is a shared sine/cosine pair.

At the three sampled angles, the sine and cosine vectors are nonzero
scalar multiples of (0, 1, -1) and (2, -1, -1), respectively. Those
rationally rescaled vectors are used below to avoid introducing sqrt(3)
into an otherwise exact rational design argument.

Each readout's three values can be represented exactly by its own
intercept and two harmonic coefficients. Requiring one shared harmonic
pair across both readouts therefore imposes two cross-readout coefficient
equalities. A mismatch in either coefficient rules out the source's
shared-harmonic model. This is a finite-design statement, not an H(s)H
response claim and not a statistical significance result.
-/

def threeClockingSineBasis (i : Fin 3) : ℚ :=
  if i.val = 0 then 0 else if i.val = 1 then 1 else -1

def threeClockingCosineBasis (i : Fin 3) : ℚ :=
  if i.val = 0 then 2 else -1

@[ext]
structure ThreeClockingCoefficients where
  offset : ℚ
  sine : ℚ
  cosine : ℚ
deriving DecidableEq

/-- Offset plus the two sampled first-harmonic basis vectors. -/
def threeClockingResponse (c : ThreeClockingCoefficients) (i : Fin 3) : ℚ :=
  c.offset + c.sine * threeClockingSineBasis i +
    c.cosine * threeClockingCosineBasis i

/-- Exact inverse coefficient extraction for the three clockings. -/
def recoverThreeClockingResponse (y : Fin 3 → ℚ) : ThreeClockingCoefficients where
  offset := (y 0 + y 1 + y 2) / 3
  sine := (y 1 - y 2) / 2
  cosine := (2 * y 0 - y 1 - y 2) / 6

/-- Every three-point orientation series has a unique offset plus first-harmonic representation. -/
theorem recover_threeClockingResponse (c : ThreeClockingCoefficients) :
    recoverThreeClockingResponse (threeClockingResponse c) = c := by
  cases c
  ext <;>
    simp [recoverThreeClockingResponse, threeClockingResponse,
      threeClockingSineBasis, threeClockingCosineBasis] <;> ring

/-- The inverse coefficients reconstruct every three-point orientation series. -/
theorem threeClockingResponse_recover (y : Fin 3 → ℚ) :
    threeClockingResponse (recoverThreeClockingResponse y) = y := by
  funext i
  fin_cases i <;>
    simp [threeClockingResponse, recoverThreeClockingResponse,
      threeClockingSineBasis, threeClockingCosineBasis] <;> ring

/-- The three equally spaced clockings are saturated for an independent first-harmonic fit. -/
theorem threeClockingResponse_bijective :
    Function.Bijective threeClockingResponse := by
  constructor
  · intro c₁ c₂ h
    have h' := congrArg recoverThreeClockingResponse h
    simpa [recover_threeClockingResponse] using h'
  · intro y
    exact ⟨recoverThreeClockingResponse y, threeClockingResponse_recover y⟩

/-- Two readouts with separate offsets but a shared sampled first-harmonic pair. -/
@[ext]
structure SharedTwoReadoutCoefficients where
  servoOffset : ℚ
  freeOffset : ℚ
  sine : ℚ
  cosine : ℚ
deriving DecidableEq

def sharedTwoReadoutResponse (c : SharedTwoReadoutCoefficients)
    (r : Fin 2) (i : Fin 3) : ℚ :=
  (if r.val = 0 then c.servoOffset else c.freeOffset) +
    c.sine * threeClockingSineBasis i +
    c.cosine * threeClockingCosineBasis i

/-- Sine-coordinate contrast extracted from the three sampled clockings. -/
def sampledSineCoefficient (y : Fin 3 → ℚ) : ℚ :=
  (y 1 - y 2) / 2

/-- Cosine-coordinate contrast extracted from the three sampled clockings. -/
def sampledCosineCoefficient (y : Fin 3 → ℚ) : ℚ :=
  (2 * y 0 - y 1 - y 2) / 6

theorem shared_response_sine_coefficient (c : SharedTwoReadoutCoefficients)
    (r : Fin 2) :
    sampledSineCoefficient (fun i => sharedTwoReadoutResponse c r i) = c.sine := by
  simp [sampledSineCoefficient, sharedTwoReadoutResponse,
    threeClockingSineBasis, threeClockingCosineBasis] <;> ring

theorem shared_response_cosine_coefficient (c : SharedTwoReadoutCoefficients)
    (r : Fin 2) :
    sampledCosineCoefficient (fun i => sharedTwoReadoutResponse c r i) = c.cosine := by
  simp [sampledCosineCoefficient, sharedTwoReadoutResponse,
    threeClockingSineBasis, threeClockingCosineBasis] <;> ring

/-- The source model's shared harmonic pair forces both readouts to have equal extracted coefficients. -/
theorem shared_response_sine_coefficients_equal (c : SharedTwoReadoutCoefficients) :
    sampledSineCoefficient (fun i => sharedTwoReadoutResponse c 0 i) =
      sampledSineCoefficient (fun i => sharedTwoReadoutResponse c 1 i) := by
  rw [shared_response_sine_coefficient, shared_response_sine_coefficient]

theorem shared_response_cosine_coefficients_equal (c : SharedTwoReadoutCoefficients) :
    sampledCosineCoefficient (fun i => sharedTwoReadoutResponse c 0 i) =
      sampledCosineCoefficient (fun i => sharedTwoReadoutResponse c 1 i) := by
  rw [shared_response_cosine_coefficient, shared_response_cosine_coefficient]

/-- A readout-dependent sine-coordinate mismatch cannot be represented by the shared-harmonic source model. -/
theorem readout_sine_mismatch_excludes_shared_model
    (servo free : Fin 3 → ℚ)
    (h : sampledSineCoefficient servo ≠ sampledSineCoefficient free) :
    ¬ ∃ c : SharedTwoReadoutCoefficients,
      (fun i => sharedTwoReadoutResponse c 0 i) = servo ∧
      (fun i => sharedTwoReadoutResponse c 1 i) = free := by
  rintro ⟨c, hs, hf⟩
  apply h
  calc
    sampledSineCoefficient servo =
        sampledSineCoefficient (fun i => sharedTwoReadoutResponse c 0 i) := by
          rw [← hs]
    _ = sampledSineCoefficient (fun i => sharedTwoReadoutResponse c 1 i) :=
      shared_response_sine_coefficients_equal c
    _ = sampledSineCoefficient free := by rw [hf]

/-- A readout-dependent cosine-coordinate mismatch cannot be represented by the shared-harmonic source model. -/
theorem readout_cosine_mismatch_excludes_shared_model
    (servo free : Fin 3 → ℚ)
    (h : sampledCosineCoefficient servo ≠ sampledCosineCoefficient free) :
    ¬ ∃ c : SharedTwoReadoutCoefficients,
      (fun i => sharedTwoReadoutResponse c 0 i) = servo ∧
      (fun i => sharedTwoReadoutResponse c 1 i) = free := by
  rintro ⟨c, hs, hf⟩
  apply h
  calc
    sampledCosineCoefficient servo =
        sampledCosineCoefficient (fun i => sharedTwoReadoutResponse c 0 i) := by
          rw [← hs]
    _ = sampledCosineCoefficient (fun i => sharedTwoReadoutResponse c 1 i) :=
      shared_response_cosine_coefficients_equal c
    _ = sampledCosineCoefficient free := by rw [hf]

#print axioms recover_threeClockingResponse
#print axioms threeClockingResponse_recover
#print axioms threeClockingResponse_bijective
#print axioms shared_response_sine_coefficient
#print axioms shared_response_cosine_coefficient
#print axioms readout_sine_mismatch_excludes_shared_model
#print axioms readout_cosine_mismatch_excludes_shared_model


/-!
## Common-mode aliasing on the actual three-clocking acquisition

The preceding results show that every three-point series on the copper
clocking grid has a unique offset-plus-sampled-sine-plus-sampled-cosine
representation. Combining that result with the source model's shared
harmonic pair gives a stronger conditional identifiability statement:
any added sampled increment that is identical in the two readout modes
can be absorbed exactly by changing the two readout offsets by the same
amount and changing the shared harmonic coefficients.

This applies to the three acquired values only. The underlying angular
function may have any behavior between the sampled clockings; the
three-point acquisition does not observe those unsampled values. The
result is a design-level non-identifiability theorem, not an H(s)H law,
not evidence that an H(s)H response is common to the two readouts, and
not a statement about the full eight-observation covariance or the
sapphire configuration.
-/

/-- Any common increment on the three sampled copper clockings is
    exactly absorbed by updating both readout offsets equally and the
    shared sampled sine/cosine coefficients. This is a conditional
    finite-acquisition non-identifiability result. -/
theorem common_sampled_increment_absorbed
    (c : SharedTwoReadoutCoefficients) (h : Fin 3 → ℚ) :
    ∃ c' : SharedTwoReadoutCoefficients,
      ∀ r i, sharedTwoReadoutResponse c r i + h i =
        sharedTwoReadoutResponse c' r i := by
  let d := recoverThreeClockingResponse h
  refine ⟨{ servoOffset := c.servoOffset + d.offset
          , freeOffset := c.freeOffset + d.offset
          , sine := c.sine + d.sine
          , cosine := c.cosine + d.cosine }, ?_⟩
  intro r i
  have hrep :
      h i =
        d.offset + d.sine * threeClockingSineBasis i +
          d.cosine * threeClockingCosineBasis i := by
    simpa [d, threeClockingResponse] using
      (congrFun (threeClockingResponse_recover h) i).symm
  fin_cases r <;>
    simp [sharedTwoReadoutResponse, d, hrep] <;> ring

#print axioms common_sampled_increment_absorbed

end HsHVerification.FactorialContrastIdentifiability
