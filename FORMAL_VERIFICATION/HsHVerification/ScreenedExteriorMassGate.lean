import Mathlib

/-!
Meridian-selected, 2026-10-27. Hostile control on the existing
screened Householder comparison A(r)=1-exp(1-r/r_s), NOT an adopted
SAT/H(s)H field equation.

Primary project source: WORKSPACES/MERCER/
SANDBOX_2026-10-11_HOUSEHOLDER_SCHWARZSCHILD_ELASTIC_GATE.md
(blob 5c91ab82fab083e3b88fd8d935e2d296d11e366c).
Empirical anchor: GRAVITY Collaboration A&A 657 L12 (2022),
Sgr A* and S2; exact observed inputs and uncertainty are in the
separate Python measurement check.

Lean checks sign and horizon contracts for the mathematical model,
not the physical interpretation, source translation, symbolic
differentiation, asymptotic ADM identification or observations.
-/

namespace HsHVerification.ScreenedExteriorMassGate

/-- Quasi-local mass divided by the horizon-calibrating parameter M,
    for x = r/r_s, under the specified static spherical metric. -/
noncomputable def normalizedMass (x : ℝ) : ℝ :=
  x * Real.exp (1 - x)

/-- Dimensionless factor proportional to the radial mass derivative.
    The derivative identity is independently checked with SymPy. -/
noncomputable def normalizedMassSlope (x : ℝ) : ℝ :=
  Real.exp (1 - x) * (1 - x)

theorem normalizedMass_at_horizon : normalizedMass 1 = 1 := by
  simp [normalizedMass]

theorem normalizedMass_positive {x : ℝ} (hx : 0 < x) :
    0 < normalizedMass x := by
  exact mul_pos hx (Real.exp_pos _) 

theorem normalizedMassSlope_negative_outside {x : ℝ} (hx : 1 < x) :
    normalizedMassSlope x < 0 := by
  unfold normalizedMassSlope
  exact mul_neg_of_pos_of_neg (Real.exp_pos _) (sub_neg.mpr hx)

theorem normalizedMassSlope_zero_at_horizon :
    normalizedMassSlope 1 = 0 := by
  simp [normalizedMassSlope]

end HsHVerification.ScreenedExteriorMassGate
