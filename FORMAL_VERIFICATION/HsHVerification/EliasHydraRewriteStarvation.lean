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


/-!
# Elias Track A: Hydra context projection and recurrence scope

Assistant reconstruction from the source boundary in
HSH_RESOURCES/tools/workflow_switchboard_demo.py
(blob 49988a769389b2baf264a27d596ba7c3ff822b36, source commit
186b2088f0a883a763cf4f6491d1b7900c2c22fd).

The Python demo's `run` function computes wake and branch outputs, then calls
`hydra(event)`; the Hydra method receives the event payload, while its
fingerprint input contains only node, candidate stage, and directive flags.
The following types make the omitted context and a proposed scoped key explicit.

Theorems establish properties of these encoded projections only. They do not
prove the source-to-model translation, Python runtime behavior, SHA-256
implementation, or production scheduler semantics.
-/

namespace HsHVerification.EliasHydraScopeProjection

structure SwitchboardContext where
  actor : String
  locale : String
  eventPayload : String
  wakeFingerprint : String
  branchFingerprint : String
  nodeId : String
  candidateStage : Option String
  directiveFlags : List (String × Option Bool)
  eventId : String
  leaseId : String
  threadId : String
  seedVersion : String
  parentGoal : String
  stateVersion : Nat
  deriving DecidableEq, Repr

/-- The current demo passes the event payload to Hydra, not the full wake/branch context. -/
def hydraInputProjection (c : SwitchboardContext) : String :=
  c.eventPayload

/-- Source-derived pre-hash projection: node, candidate stage, directive id/flag pairs. -/
def legacyFingerprintProjection (c : SwitchboardContext) :
    String × Option String × List (String × Option Bool) :=
  (c.nodeId, c.candidateStage, c.directiveFlags)

structure ScopedFingerprintKey where
  base : String × Option String × List (String × Option Bool)
  actor : String
  locale : String
  eventId : String
  leaseId : String
  threadId : String
  seedVersion : String
  parentGoal : String
  stateVersion : Nat
  wakeFingerprint : String
  branchFingerprint : String
  deriving DecidableEq, Repr

/-- Proposed context-preserving key; not yet implemented in the Python prototype. -/
def scopedFingerprintProjection (c : SwitchboardContext) : ScopedFingerprintKey :=
  { base := legacyFingerprintProjection c
    actor := c.actor
    locale := c.locale
    eventId := c.eventId
    leaseId := c.leaseId
    threadId := c.threadId
    seedVersion := c.seedVersion
    parentGoal := c.parentGoal
    stateVersion := c.stateVersion
    wakeFingerprint := c.wakeFingerprint
    branchFingerprint := c.branchFingerprint }

theorem hydra_input_projection_ignores_actor_and_prior_outputs
    (actor1 actor2 locale1 locale2 eventPayload wake1 wake2 branch1 branch2 nodeId : String)
    (stage : Option String)
    (directives : List (String × Option Bool))
    (eventId1 eventId2 leaseId1 leaseId2 threadId1 threadId2 seedVersion1 seedVersion2 parentGoal1 parentGoal2 : String)
    (stateVersion1 stateVersion2 : Nat)
    (hActor : actor1 ≠ actor2) :
    let c1 : SwitchboardContext :=
      ⟨actor1, locale1, eventPayload, wake1, branch1, nodeId, stage, directives,
       eventId1, leaseId1, threadId1, seedVersion1, parentGoal1, stateVersion1⟩
    let c2 : SwitchboardContext :=
      ⟨actor2, locale2, eventPayload, wake2, branch2, nodeId, stage, directives,
       eventId2, leaseId2, threadId2, seedVersion2, parentGoal2, stateVersion2⟩
    c1 ≠ c2 ∧ hydraInputProjection c1 = hydraInputProjection c2 := by
  dsimp
  constructor
  · intro h
    exact hActor (congrArg SwitchboardContext.actor h)
  · rfl

theorem legacy_fingerprint_projection_collapses_distinct_events
    (actor1 actor2 locale1 locale2 eventPayload1 eventPayload2 wake1 wake2 branch1 branch2 nodeId : String)
    (stage : Option String)
    (directives : List (String × Option Bool))
    (eventId1 eventId2 leaseId1 leaseId2 threadId1 threadId2 seedVersion1 seedVersion2 parentGoal1 parentGoal2 : String)
    (stateVersion1 stateVersion2 : Nat)
    (hEvent : eventId1 ≠ eventId2) :
    let c1 : SwitchboardContext :=
      ⟨actor1, locale1, eventPayload1, wake1, branch1, nodeId, stage, directives,
       eventId1, leaseId1, threadId1, seedVersion1, parentGoal1, stateVersion1⟩
    let c2 : SwitchboardContext :=
      ⟨actor2, locale2, eventPayload2, wake2, branch2, nodeId, stage, directives,
       eventId2, leaseId2, threadId2, seedVersion2, parentGoal2, stateVersion2⟩
    c1 ≠ c2 ∧ legacyFingerprintProjection c1 = legacyFingerprintProjection c2 := by
  dsimp
  constructor
  · intro h
    exact hEvent (congrArg SwitchboardContext.eventId h)
  · rfl

theorem scoped_fingerprint_projection_separates_distinct_events
    (c1 c2 : SwitchboardContext)
    (hEvent : c1.eventId ≠ c2.eventId) :
    scopedFingerprintProjection c1 ≠ scopedFingerprintProjection c2 := by
  intro h
  exact hEvent (congrArg ScopedFingerprintKey.eventId h)

#print axioms hydra_input_projection_ignores_actor_and_prior_outputs
#print axioms legacy_fingerprint_projection_collapses_distinct_events
#print axioms scoped_fingerprint_projection_separates_distinct_events

end HsHVerification.EliasHydraScopeProjection
