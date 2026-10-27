import Mathlib

/-!
Hale source-specific review of GW170817/GRB 170817A.
Abbott et al. 2017, LIGO-P1700308-v8, §4.1, ApJL 848 L13:
observed gamma-minus-GW lag = +1.74 ± 0.05 s;
D=26 Mpc is the lower 90% credible luminosity-distance endpoint;
the interval [0,10] s for intrinsic gamma emission is an ASTROPHYSICAL
ASSUMPTION in the paper, NOT a direct observation.

Only the conditional algebra of the source's first-order speed formula
  (v_GW-v_EM)/v_EM ≈ (v_EM/D) (observedLag - intrinsicEmissionLag)
is formalized. No physical model, uncertainty distribution or SAT/HsH
worldtube propagation law is proven.
-/
namespace HsHVerification.HaleGW170817EmissionWindow

/-- First-order normalized speed difference with `scale = vEM / D`.
`observed` and `emitted` have time units; `scale` has inverse-time units. -/
def inferredFraction (scale observed emitted : ℝ) : ℝ :=
  scale * (observed - emitted)

/-- With a nonnegative scale and the paper's bounded source-emission lag,
the inferred fractional speed difference lies between the two endpoints. -/
theorem emission_window_bounds (scale observed emitted : ℝ)
    (hscale : 0 ≤ scale) (he0 : 0 ≤ emitted) (he10 : emitted ≤ 10) :
    inferredFraction scale observed 10 ≤ inferredFraction scale observed emitted ∧
    inferredFraction scale observed emitted ≤ inferredFraction scale observed 0 := by
  constructor
  · unfold inferredFraction
    apply mul_le_mul_of_nonneg_left ?_ hscale
    linarith
  · unfold inferredFraction
    apply mul_le_mul_of_nonneg_left ?_ hscale
    linarith

/-- The simultaneous-emission endpoint equals scale times observed lag. -/
theorem simultaneous_endpoint (scale observed : ℝ) :
    inferredFraction scale observed 0 = scale * observed := by
  simp [inferredFraction]

/-- The ten-second emission assumption gives the lower endpoint. -/
theorem ten_second_endpoint (scale observed : ℝ) :
    inferredFraction scale observed 10 = scale * (observed - 10) := by
  rfl

#print axioms emission_window_bounds
#print axioms simultaneous_endpoint
#print axioms ten_second_endpoint

end HsHVerification.HaleGW170817EmissionWindow
