import Mathlib

/-!
# Orson P1: first-trigger index is not recoverable from the archived Boolean flag

Primary source:
- aayambansal/ConsistencyBench
- commit bfc676baa848c7f1715bb73aee148180de15516e
- src/evaluate.py blob 0453540cb7c19227601e59fb342fa93e736da849

In evaluate_cgd, the NLI loop stops at the first positive comparison. The
archived result records contradiction_detected but not the index or identity
of the first positive prior pair. This module formalizes the finite
information-loss proposition: the Boolean aggregate "some comparison was
positive" does not determine the position of the first positive comparison.

This is a theorem about the abstract list-to-flag projection only. It does
not prove the Python-to-model translation, recover any actual trigger,
validate NLI semantics, establish a model's memory or cognition, or identify
causal revision effects.
-/

namespace HsHVerification.OrsonCGDTriggerIndex

/-- Position of the first positive comparison, if one exists. -/
def firstTrueIndex : List Bool → Option Nat
  | [] => none
  | true :: _ => some 0
  | false :: rest => (firstTrueIndex rest).map Nat.succ

/-- The archive-level Boolean projection: at least one comparison was positive. -/
def hasTrigger : List Bool → Bool
  | [] => false
  | true :: _ => true
  | false :: rest => hasTrigger rest

/--
No decoder that receives only the Boolean aggregate can recover the first
positive position for every finite comparison list.
-/
theorem first_trigger_not_identifiable_from_flag :
    ¬ ∃ decode : Bool → Option Nat,
        ∀ checks : List Bool,
          firstTrueIndex checks = decode (hasTrigger checks) := by
  intro h
  rcases h with ⟨decode, hdecode⟩
  have hA := hdecode [true, false]
  have hB := hdecode [false, true]
  have hFlag : hasTrigger [true, false] = hasTrigger [false, true] := by
    decide
  have hSame :
      firstTrueIndex [true, false] = firstTrueIndex [false, true] := by
    calc
      firstTrueIndex [true, false] = decode (hasTrigger [true, false]) := hA
      _ = decode (hasTrigger [false, true]) := congrArg decode hFlag
      _ = firstTrueIndex [false, true] := hB.symm
  have hNe :
      firstTrueIndex [true, false] ≠ firstTrueIndex [false, true] := by
    decide
  exact hNe hSame

theorem same_flag_different_first_position :
    hasTrigger [true, false] = hasTrigger [false, true] ∧
      firstTrueIndex [true, false] ≠ firstTrueIndex [false, true] := by
  decide

#eval hasTrigger [true, false]
#eval firstTrueIndex [true, false]
#eval firstTrueIndex [false, true]

#print axioms first_trigger_not_identifiable_from_flag
#print axioms same_flag_different_first_position

end HsHVerification.OrsonCGDTriggerIndex
