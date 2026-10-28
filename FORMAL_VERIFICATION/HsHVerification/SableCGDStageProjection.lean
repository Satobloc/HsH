import Mathlib

/-!
Sable-selected source-fidelity / cognition-workflow QA, 2026-10-28 10:00Z.
Original public ConsistencyBench sample: Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d.
Evaluator src/evaluate.py: Git blob 0453540cb7c19227601e59fb342fa93e736da849.
Seventeen archived CGD result files: SHA list in Orson's source-pinned
WORKSPACES/ORSON_VAY/CODE/2026_10_28_conjunction_null_replay.py.
Counts were calculated by a source-parsing JavaScript replay, NOT inferred from Lean.
Lean only proves the propositions below given those transcribed constants.
No physical truth, source authenticity, cognitive/semantic equivalence or causal
claim is proved.
-/

namespace HsHVerification.SableCGDStageProjection

-- A repeated-question group is discordant when it has >1 extracted label.
-- Across 17 CGD model files, 167 initially discordant groups; 261 final.
-- 132 become discordant, 38 become concordant, 129 stay discordant.
theorem observed_stage_transition :
    (129 : Nat) + 38 = 167 ∧ 129 + 132 = 261 := by norm_num

theorem observed_stage_delta :
    (261 : Nat) - 167 = 94 ∧ 132 - 38 = 94 := by norm_num

-- Across 19,550 question positions, 6,702 were checker-flagged;
-- 2,010 changed extracted labels and 4,692 did not.
theorem observed_checker_partition :
    (2010 : Nat) + 4692 = 6702 := by norm_num

-- In the 300-set sample, exact-prompt edges induce 229 connected
-- components: 205 singleton sets and 24 nontrivial components
-- containing 95 sets. These are source-dependent counts.
theorem observed_prompt_component_partition :
    (205 : Nat) + 95 = 300 ∧ 205 + 24 = 229 := by norm_num

-- If two occurrences start with equal answer labels but finish
-- with unequal labels, at least one answer label changed.
-- No assumptions about why the change occurred.
theorem new_discordance_requires_change {α : Type*}
    (initialA initialB finalA finalB : α)
    (hinitial : initialA = initialB)
    (hfinal : finalA ≠ finalB) :
    finalA ≠ initialA ∨ finalB ≠ initialB := by
  by_cases ha : finalA = initialA
  · right
    intro hb
    exact hfinal (ha.trans (hinitial.trans hb.symm))
  · exact Or.inl ha

#print axioms observed_stage_transition
#print axioms observed_stage_delta
#print axioms observed_checker_partition
#print axioms observed_prompt_component_partition
#print axioms new_discordance_requires_change


-- Separate 2025 Nathan-authored Fundamental Intuitions Extension B and
-- assistant-proposed derivative-dependent effective potential.
-- For a source-form L = rho*Ft²/2 - tau*Fs²/2 - V(F,Ft,Fs),
-- the Euler-Lagrange residual contains -∂t(V_Ft)-∂s(V_Fs).
-- The historical abbreviated equation omits these terms.
-- This theorem checks only the algebraic relationship of the residuals;
-- it does NOT prove a variational theorem or a physical field equation.
theorem derivative_dependent_potential_omission
    (inertial tension spatialPotential timeDerivative spatialDerivative : ℝ)
    (hfull :
      inertial - tension - timeDerivative - spatialDerivative + spatialPotential = 0) :
    (inertial - tension + spatialPotential = 0 ↔
      timeDerivative + spatialDerivative = 0) := by
  constructor <;> intro h <;> linarith

#print axioms derivative_dependent_potential_omission

end HsHVerification.SableCGDStageProjection
