import Mathlib

/-!
Nadir Review-MIND | 2026-10-29 10:48 UTC | Orson P1 independent QC.
Actual 17 public ConsistencyBench CGD model-output JSON blobs from
aayambansal/ConsistencyBench/results; evaluator src/evaluate.py
Git blob 0453540cb7c19227601e59fb342fa93e736da849.
All 39,100 archived extracted labels reproduced in connected JavaScript.
This file checks source-conditional integer identities and a simple
selection-map property only. It does NOT prove the source counts,
semantic correctness, causal claims, model independence, or cognition.
No physical calculation or BEDROCK promotion.
-/

namespace HsHVerification.NadirP1BoundarySelection

/-- A stricter lexical projection excludes an exposed answer;
    retained observations keep their original label. -/
def maskEmbedded (exposed : Bool) (label : Option String) : Option String :=
  if exposed then none else label

theorem mask_unexposed (label : Option String) :
    maskEmbedded false label = label := by rfl

theorem mask_exposed (label : Option String) :
    maskEmbedded true label = none := by rfl

/-- Published original fixed-complete-case pair census partitions into
    common eligible pairs and pairs excluded by the boundary projection. -/
theorem original_pair_partition :
    (137911 : ℕ) = 132500 + 5411 := by norm_num

theorem original_initial_matches_partition :
    (102797 : ℕ) = 101049 + 1748 := by norm_num

theorem original_final_matches_partition :
    (102881 : ℕ) = 100638 + 2243 := by norm_num

theorem common_pair_change_negative :
    (100638 : ℤ) - 101049 = -411 := by norm_num

theorem excluded_pair_change_positive :
    (2243 : ℤ) - 1748 = 495 := by norm_num

/-- The sign change arises from the eligibility projection:
    retained-pair -411 plus excluded-pair +495 yields original +84. -/
theorem full_pair_change_decomposition :
    (102881 : ℤ) - 102797 =
      ((100638 : ℤ) - 101049) + ((2243 : ℤ) - 1748) := by
  norm_num

/-- Source-conditional inclusive pairwise agreement under two extraction
    projections. The counterfactual is NOT a semantic ground truth. -/
theorem inclusive_original_change :
    (104673 : ℤ) - 105795 = -1122 := by norm_num

theorem inclusive_boundary_change :
    (103897 : ℤ) - 104879 = -982 := by norm_num

theorem inclusive_change_difference :
    ((103897 : ℤ) - 104879) - (104673 - 105795) = 140 := by
  norm_num

theorem signed_partition_identity (a₀ a₁ b₀ b₁ : ℤ) :
    (a₁ + b₁) - (a₀ + b₀) = (a₁ - a₀) + (b₁ - b₀) := by
  ring

#print axioms mask_unexposed
#print axioms mask_exposed
#print axioms original_pair_partition
#print axioms common_pair_change_negative
#print axioms excluded_pair_change_positive
#print axioms full_pair_change_decomposition
#print axioms inclusive_change_difference
#print axioms signed_partition_identity

end HsHVerification.NadirP1BoundarySelection
