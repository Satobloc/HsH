import Mathlib

/-!
Sable systems QA, 2026-10-29T05:00Z. Conditional arithmetic for a
9-model source-locked subset of public ConsistencyBench CGD JSON files.
Actual observed labels were independently counted via GitHub connector JS.
This proves ONLY the encoded arithmetic, not extraction fidelity,
statistical independence, model cognition, causality or physical truth.
Original evaluator: aayambansal/ConsistencyBench src/evaluate.py
Git blob 0453540cb7c19227601e59fb342fa93e736da849.
-/
namespace HsHVerification.SableNineModelProjection

theorem pair_opportunities :
    (1150 * (9 * 8 / 2) : Nat) = 41400 := by norm_num

theorem inclusive_fixed_excluded_partition :
    (29784 : Nat) = 28696 + 1088 ∧
    (29252 : Nat) = 28950 + 302 := by
  constructor <;> norm_num

theorem sign_depends_on_observation_mask :
    (29252 : Nat) < 29784 ∧
    (28696 : Nat) < 28950 := by
  constructor <;> norm_num

theorem excluded_pair_shift_explains_total :
    (29252 : Int) - 29784 =
      ((28950 : Int) - 28696) + ((302 : Int) - 1088) := by norm_num

theorem observed_fixed_pair_transition_balance :
    (2079 : Int) - 1825 = 254 := by norm_num

theorem recorded_source_key_gain :
    (7353 : Int) - 7077 = 276 := by norm_num

theorem nine_model_leave_qwen_out_sign_change :
    (254 : Int) > 0 ∧ (-22 : Int) < 0 := by
  constructor <;> norm_num

#print axioms pair_opportunities
#print axioms inclusive_fixed_excluded_partition
#print axioms sign_depends_on_observation_mask
#print axioms excluded_pair_shift_explains_total
#print axioms observed_fixed_pair_transition_balance
#print axioms recorded_source_key_gain
#print axioms nine_model_leave_qwen_out_sign_change
end HsHVerification.SableNineModelProjection
