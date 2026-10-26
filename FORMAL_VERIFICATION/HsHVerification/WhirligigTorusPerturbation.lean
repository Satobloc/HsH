import Mathlib

/-!
Source-fidelity negative control for the historical "Donut canon" (SAT archive,
blob be985c292bfcae7352983d596c38e7f172f6029d).
Historical assistant proposes a torus embedding X_T and then Y = X_T + ε V,
calling Y a trajectory on the embedded torus. This formalizes a counterexample
to unconditional torus membership, not a physical model or Nathan Direct claim.
Cylindrical radius rho is nonnegative at the selected outer-equator point when
major >= 0 and minor > 0. The symbolic displacement is vertical.
-/

namespace HsHVerification

def torusProfileResidual (major minor rho z : ℝ) : ℝ :=
  (rho - major)^2 + z^2 - minor^2

theorem torus_outer_equator_is_on_surface (major minor : ℝ) :
    torusProfileResidual major minor (major + minor) 0 = 0 := by
  unfold torusProfileResidual
  ring

theorem vertical_displacement_residual (major minor eps : ℝ) :
    torusProfileResidual major minor (major + minor) eps = eps^2 := by
  unfold torusProfileResidual
  ring

theorem vertical_displacement_exits_torus (major minor eps : ℝ)
    (_hMajor : 0 ≤ major) (_hMinor : 0 < minor) (hEps : eps ≠ 0) :
    torusProfileResidual major minor (major + minor) eps ≠ 0 := by
  rw [vertical_displacement_residual, pow_two]
  exact mul_ne_zero hEps hEps

#print axioms torus_outer_equator_is_on_surface
#print axioms vertical_displacement_residual
#print axioms vertical_displacement_exits_torus

end HsHVerification
