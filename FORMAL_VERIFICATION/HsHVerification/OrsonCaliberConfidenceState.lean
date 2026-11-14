import Mathlib

/-!
# Orson external comparator: CALIBER confidence-state targets

Primary source:
Conor Finlay, Joshua Kurien, Saurabh Dash, Marzieh Fadaee, and Beyza Ermis,
"CALIBER: Calibrating Confidence Before and After Reasoning in Language Models,"
Findings of ACL: EMNLP 2026, pp. 51966-51980, DOI 10.18653/2026.findings-emnlp.2420.
See Section 4 and Appendix A.1.3.

This module formalizes only the finite target arithmetic stated by the paper:
the prompt-level pre-confidence target is the group-wise empirical success rate,
while the answer-level post-confidence target is the individual rollout's
correctness label.

It does NOT formalize the model's training dynamics, predicted confidence
scores, calibration quality, verifier reliability, OOD generalization, or any
P1 ConsistencyBench result. The source and its experimental claims remain
subject to ordinary empirical and source-critical review.
-/

namespace HsHVerification.OrsonCaliberConfidenceState

noncomputable section

/-- Instance-wise correctness target for a particular rollout. -/
def instanceTarget {n : ℕ} (correct : Fin n → ℝ) (i : Fin n) : ℝ :=
  correct i

/-- Group-wise empirical success-rate target for the prompt. -/
def groupTarget {n : ℕ} (correct : Fin n → ℝ) : ℝ :=
  (∑ i : Fin n, correct i) / (n : ℝ)

/-- Averaging the instance-wise correctness targets reproduces the
    group-wise prompt target by construction. This is a target identity,
    not a claim that a trained model's predicted confidences are exact. -/
theorem mean_instance_targets_eq_group_target {n : ℕ}
    (correct : Fin n → ℝ) :
    (∑ i : Fin n, instanceTarget correct i) / (n : ℝ) =
      groupTarget correct := by
  rfl

/-- If every instance target lies in [0,1], the group target lies in [0,1]. -/
theorem groupTarget_mem_Icc {n : ℕ} (hn : 0 < n)
    (correct : Fin n → ℝ)
    (hlo : ∀ i, 0 ≤ correct i)
    (hhi : ∀ i, correct i ≤ 1) :
    groupTarget correct ∈ Set.Icc (0 : ℝ) 1 := by
  constructor
  · unfold groupTarget
    apply div_nonneg
    · exact Finset.sum_nonneg fun i hi => hlo i
    · exact_mod_cast (Nat.zero_le n)
  · unfold groupTarget
    apply (div_le_iff₀ (by exact_mod_cast hn)).2
    calc
      ∑ i : Fin n, correct i ≤ ∑ i : Fin n, (1 : ℝ) :=
        Finset.sum_le_sum fun i hi => hhi i
      _ = (n : ℝ) := by simp

/-- Two two-rollout groups can share the same group-wise target while
    assigning success to different individual rollouts. The group target
    therefore does not identify the instance-wise outcome vector. -/
def firstSuccess : Fin 2 → ℝ := fun i => if i = 0 then 1 else 0

def secondSuccess : Fin 2 → ℝ := fun i => if i = 1 then 1 else 0

theorem same_group_target_different_instance_targets :
    groupTarget firstSuccess = groupTarget secondSuccess ∧
    instanceTarget firstSuccess 0 ≠ instanceTarget secondSuccess 0 := by
  constructor
  · norm_num [groupTarget, firstSuccess, secondSuccess]
  · norm_num [instanceTarget, firstSuccess, secondSuccess]

#print axioms mean_instance_targets_eq_group_target
#print axioms groupTarget_mem_Icc
#print axioms same_group_target_different_instance_targets

end

end HsHVerification.OrsonCaliberConfidenceState
