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

/-!
# Repair contract: separate plan emission from rewrite admission

The legacy Hydra loop has one history bit for a node. It can emit the node's
child plan, fail to admit its recurrence rewrite because the per-call budget
is exhausted, and nevertheless mark the node as seen. The existing
EliasHydraRewriteStarvation namespace formalizes that loss.

This second model specifies a repair contract for nodes that have a required
rewrite: plan emission and rewrite admission have separate progress fields.
A deferred rewrite remains pending; a later invocation can admit it without
emitting the child plan again.

This is a finite software-state contract, not a patch to the Python POC.
It does not model child execution, semantic receipt verification, scheduler
behavior, or source-to-model equivalence.
-/

namespace HsHVerification.EliasHydraProgressSplit

structure NodeProgress where
  planEmitted : Bool
  rewriteAdmitted : Bool
  rewriteDeferred : Bool
  deriving DecidableEq, Repr

structure StepResult where
  progress : NodeProgress
  remainingBudget : Nat
  emitPlan : Bool
  admitRewrite : Bool
  deriving DecidableEq, Repr

def initialProgress : NodeProgress :=
  { planEmitted := false
    rewriteAdmitted := false
    rewriteDeferred := false }

/-- One node transition. The model assumes the node has a required rewrite. -/
def transition (budget : Nat) (p : NodeProgress) : StepResult :=
  let admit := (!p.rewriteAdmitted) && (budget > 0)
  { progress :=
      { planEmitted := true
        rewriteAdmitted := p.rewriteAdmitted || admit
        rewriteDeferred := (!p.rewriteAdmitted) && (!admit) }
    remainingBudget := if admit then budget - 1 else budget
    emitPlan := !p.planEmitted
    admitRewrite := admit }

def isComplete (p : NodeProgress) : Bool :=
  p.planEmitted && p.rewriteAdmitted

theorem zero_budget_emits_plan_and_defers_rewrite :
    let r := transition 0 initialProgress
    r.emitPlan = true ∧
    r.admitRewrite = false ∧
    r.progress.planEmitted = true ∧
    r.progress.rewriteAdmitted = false ∧
    r.progress.rewriteDeferred = true ∧
    isComplete r.progress = false := by
  decide

theorem deferred_rewrite_remains_retryable :
    (transition 0 initialProgress).progress.rewriteDeferred = true := by
  decide

theorem retry_admits_deferred_rewrite_without_duplicate_plan :
    let first := transition 0 initialProgress
    let second := transition 1 first.progress
    second.emitPlan = false ∧
    second.admitRewrite = true ∧
    second.progress.rewriteAdmitted = true ∧
    second.progress.rewriteDeferred = false ∧
    isComplete second.progress = true ∧
    second.remainingBudget = 0 := by
  decide

theorem zero_budget_does_not_consume_rewrite_budget :
    (transition 0 initialProgress).remainingBudget = 0 := by
  decide

theorem one_budget_unit_admits_exactly_one_pending_rewrite :
    (transition 1 (transition 0 initialProgress).progress).remainingBudget = 0 := by
  decide

#eval transition 0 initialProgress
#eval transition 1 (transition 0 initialProgress).progress

#print axioms zero_budget_emits_plan_and_defers_rewrite
#print axioms deferred_rewrite_remains_retryable
#print axioms retry_admits_deferred_rewrite_without_duplicate_plan
#print axioms zero_budget_does_not_consume_rewrite_budget
#print axioms one_budget_unit_admits_exactly_one_pending_rewrite

end HsHVerification.EliasHydraProgressSplit


/-!
# 2026-11-05: nested Hydra depth-guard source-fidelity witness

Source anchor: `Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py`,
Git blob `49988a769389b2baf264a27d596ba7c3ff822b36`.

The Python `hydra` loop iterates the immediate `node["spawn"]` list,
checks each immediate descriptor's `depth`, and appends an accepted
descriptor unchanged. A descriptor's nested `on_result.spawn` children
are carried inside that descriptor; this loop does not recursively visit
them. The model below isolates the one-level nested shape used by the
`nested_learning` scenario. It does not model arbitrary JSON, Python
execution, or an external consumer's possible later interpretation.

The current example has parent depth 1 and child depths 2, 2, so it passes
the bound 3. The adversarial software witness changes a nested child to
depth 4 while leaving the parent at depth 1. It shows that the immediate
guard is not a global descendant-depth invariant.

The child-aware filter is a proposed one-level contract only. A genuinely
recursive Hydra would need a recursive tree type and a recursive guard.
This formalization is not a POC patch or production authorization.
-/

namespace HsHVerification.EliasHydraNestedDepth

structure SpawnDescriptor where
  depth : Nat
  onResultChildDepths : List Nat
  deriving DecidableEq, Repr

/-- The observed Python loop's immediate-list guard, abstracted at one level:
    accepted parents are retained with their nested child descriptors unchanged. -/
def legacyTopLevelGuard (maxDepth : Nat) (xs : List SpawnDescriptor) :
    List SpawnDescriptor :=
  xs.filter (fun x => decide (x.depth <= maxDepth))

/-- One-level flattening of a parent descriptor and its on-result children. -/
def flattenDepths (xs : List SpawnDescriptor) : List Nat :=
  xs.flatMap (fun x => x.depth :: x.onResultChildDepths)

def allDepthsWithin (maxDepth : Nat) (depths : List Nat) : Bool :=
  depths.all (fun d => decide (d <= maxDepth))

/-- Depths in the existing nested_learning descriptor: parent 1, children 2 and 2. -/
def observedNestedLearningShape : SpawnDescriptor :=
  { depth := 1, onResultChildDepths := [2, 2] }

/-- Adversarial software-only probe: an accepted parent contains a child at depth 4. -/
def overDepthChildProbe : SpawnDescriptor :=
  { depth := 1, onResultChildDepths := [4] }

/-- The existing nested_learning example remains within the declared bound 3. -/
theorem observed_nested_learning_shape_within_bound :
    allDepthsWithin 3
      (flattenDepths (legacyTopLevelGuard 3 [observedNestedLearningShape])) = true := by
  decide

/-- The immediate guard preserves an over-depth child nested inside an accepted parent. -/
theorem top_level_guard_preserves_nested_overdepth_child :
    flattenDepths (legacyTopLevelGuard 3 [overDepthChildProbe]) = [1, 4] := by
  decide

/-- Therefore the immediate-list guard does not establish a global descendant-depth bound. -/
theorem top_level_guard_does_not_establish_global_bound :
    allDepthsWithin 3
      (flattenDepths (legacyTopLevelGuard 3 [overDepthChildProbe])) = false := by
  decide

/-- Proposed one-level child-aware guard; not the current Python implementation. -/
def oneLevelChildAwareGuard (maxDepth : Nat) (xs : List SpawnDescriptor) :
    List SpawnDescriptor :=
  xs.filterMap fun x =>
    if x.depth <= maxDepth then
      some
        { x with
          onResultChildDepths :=
            x.onResultChildDepths.filter (fun d => decide (d <= maxDepth)) }
    else
      none

theorem one_level_child_aware_guard_removes_overdepth_child :
    flattenDepths (oneLevelChildAwareGuard 3 [overDepthChildProbe]) = [1] := by
  decide

#eval flattenDepths (legacyTopLevelGuard 3 [observedNestedLearningShape])
#eval flattenDepths (legacyTopLevelGuard 3 [overDepthChildProbe])
#eval flattenDepths (oneLevelChildAwareGuard 3 [overDepthChildProbe])

#print axioms observed_nested_learning_shape_within_bound
#print axioms top_level_guard_preserves_nested_overdepth_child
#print axioms top_level_guard_does_not_establish_global_bound
#print axioms one_level_child_aware_guard_removes_overdepth_child

end HsHVerification.EliasHydraNestedDepth
