import Mathlib

/-!
Source-critical formalization, NOT a physics proof.
Observed historical source labels: Phase VII barrier manuscript SAT.O9,
later Phase VIII diagnostics and versioning SAT.O11.
The original barrier gradient contribution uses the scalar norm
of a phase-gradient, not the bare vector. EuclideanSpace below is
a conditional mathematical type, not an asserted SAT spacetime metric.
-/

namespace HsHVerification.AsterBarrierSourceFidelity

inductive ModuleLabel where
  | O9
  | O11
  deriving DecidableEq

theorem module_label_conflict :
    ModuleLabel.O9 ≠ ModuleLabel.O11 := by
  decide

theorem no_single_label_is_both (label : ModuleLabel) :
    ¬ (label = ModuleLabel.O9 ∧ label = ModuleLabel.O11) := by
  intro h
  have hBad : ModuleLabel.O9 = ModuleLabel.O11 := h.1.symm.trans h.2
  exact module_label_conflict hBad

theorem gradient_norm_sign_invariant
    (g : EuclideanSpace ℝ (Fin 3)) :
    ‖-g‖ = ‖g‖ := by
  simp

theorem barrier_gradient_sign_invariant
    (base beta length : ℝ) (g : EuclideanSpace ℝ (Fin 3)) :
    base + beta * length * ‖-g‖ =
      base + beta * length * ‖g‖ := by
  simp

theorem barrier_gradient_nonneg
    (beta length : ℝ) (g : EuclideanSpace ℝ (Fin 3))
    (hbeta : 0 ≤ beta) (hlength : 0 ≤ length) :
    0 ≤ beta * length * ‖g‖ := by
  exact mul_nonneg (mul_nonneg hbeta hlength) (norm_nonneg g)

#print axioms module_label_conflict
#print axioms no_single_label_is_both
#print axioms gradient_norm_sign_invariant
#print axioms barrier_gradient_sign_invariant
#print axioms barrier_gradient_nonneg

end HsHVerification.AsterBarrierSourceFidelity
