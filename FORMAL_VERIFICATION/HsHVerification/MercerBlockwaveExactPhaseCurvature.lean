import Mathlib.Analysis.Calculus.DifferentialForm.Basic

open ContinuousAlternatingMap

namespace HsHVerification.MercerBlockwaveExactPhaseCurvature

/-- Four-coordinate domain, matching the index count of the historical ansatz. -/
abbrev Spacetime := Fin 4 → ℝ

/-- Embed a single-valued scalar phase as a differential 0-form. -/
def phaseZeroForm (θ : Spacetime → ℝ) :
    Spacetime → Spacetime [⋀^Fin 0]→L[ℝ] ℝ :=
  fun x => constOfIsEmpty ℝ Spacetime (Fin 0) (θ x)

/-- The historical exact-potential ansatz A = α dθ, expressed as a 1-form. -/
def phasePotential (α : ℝ) (θ : Spacetime → ℝ) :
    Spacetime → Spacetime [⋀^Fin 1]→L[ℝ] ℝ :=
  fun x => α • extDeriv (phaseZeroForm θ) x

/-- The corresponding exterior curvature F = dA. -/
def phaseCurvature (α : ℝ) (θ : Spacetime → ℝ) :
    Spacetime → Spacetime [⋀^Fin 2]→L[ℝ] ℝ :=
  extDeriv (phasePotential α θ)

/--
For a twice continuously differentiable, single-valued scalar phase and constant α,
the exterior curvature of A = α dθ vanishes.

This proves only the exact-form identity. It does not establish that the
historical action is a correct physical model, nor does it cover singular,
multivalued, or distributional defect sectors.
-/
theorem phaseCurvature_eq_zero (α : ℝ) (θ : Spacetime → ℝ)
    (hθ : ContDiff ℝ 2 θ) :
    phaseCurvature α θ = 0 := by
  unfold phaseCurvature phasePotential
  have h0 : ContDiff ℝ 2 (phaseZeroForm θ) := by
    unfold phaseZeroForm
    simpa only [← constOfIsEmptyLIE_apply, Function.comp_apply] using
      (constOfIsEmptyLIE ℝ Spacetime ℝ (Fin 0)).contDiff.comp hθ
  funext x
  rw [extDeriv_fun_smul]
  rw [extDeriv_extDeriv h0 (by norm_num [minSmoothness])]
  simp

#print axioms phaseCurvature_eq_zero

end HsHVerification.MercerBlockwaveExactPhaseCurvature
