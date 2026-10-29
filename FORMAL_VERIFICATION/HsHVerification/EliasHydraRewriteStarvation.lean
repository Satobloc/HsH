import Mathlib

/-!
# Elias Track A: conditional Hydra rewrite-budget/history discrepancy

Source implementation: HSH_RESOURCES/tools/workflow_switchboard_demo.py,
Git blob 49988a769389b2baf264a27d596ba7c3ff822b36.
This model abstracts one eligible node with a rewrite after earlier nodes
have consumed the two-rewrite budget. The source appends the node's
fingerprint to history even when no rewrite was admitted.

Proof scope: these encoded state transitions only. Not a proof of Python
source equivalence, production scheduler behavior, or physical premises.
-/

namespace HsHVerification.EliasHydraRewriteStarvation

structure NodeState where
  used : Nat
  recorded : Bool
  deriving DecidableEq, Repr

def legacyStep (s : NodeState) : NodeState :=
  { used := if s.used < 2 then s.used + 1 else s.used
    recorded := true }

def replayEligible (s : NodeState) : Bool := !s.recorded

theorem first_rewrite_accepted :
    (legacyStep ⟨0, false⟩).used = 1 := by decide

theorem second_rewrite_accepted :
    (legacyStep ⟨1, false⟩).used = 2 := by decide

theorem third_rewrite_suppressed_but_recorded :
    legacyStep ⟨2, false⟩ = ⟨2, true⟩ := by decide

theorem suppressed_rewrite_cannot_replay_at_same_key :
    replayEligible (legacyStep ⟨2, false⟩) = false := by decide

theorem source_conditional_loss_of_pending_rewrite :
    (legacyStep ⟨2, false⟩).used = 2 ∧
    replayEligible (legacyStep ⟨2, false⟩) = false := by decide

end HsHVerification.EliasHydraRewriteStarvation
