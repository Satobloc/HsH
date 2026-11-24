import HsHVerification.OrsonEvidenceFlow
import Mathlib

/-!
# Task/run/model/session scope gate for evidence-flow readouts
(assistant reconstruction; source-bounded methods formalization)

Primary comparator: Zhang et al., "Multi-Agent Memory Inconsistency:
Where Factual Conflicts Disappear in LLM Agents", arXiv:2611.22245v2
(2026-11-18), §§3.3–3.4 and 4.1–4.4.

The paper reports multiple tasks, models, runs, delegation policies, and
SDK/session traces. This module proposes a typed scope boundary for future
trace adapters. It does not assert that the paper's released profiler is
defective, reproduce its empirical analysis, or modify the frozen P1 protocol.

Theorems below are conditional properties of this declared schema only.
The finite witness and #eval results are logical examples, not model outputs,
measured data, or physical fixtures. No cognition, causal, or independence
claim follows from compilation.
-/

namespace HsHVerification.OrsonEvidenceFlowScope

open HsHVerification.OrsonEvidenceFlow

/-- The minimum analysis scope needed to keep one task execution, model
    version, delegation policy, and native session from being silently pooled
    with another. IDs are opaque source keys, not inferred identities. -/
structure ScopeKey where
  taskId : String
  runId : String
  modelId : String
  modelVersion : String
  policyId : String
  sessionId : String
  deriving DecidableEq, Repr

structure ScopedEvidenceItem where
  item : EvidenceItem
  scope : ScopeKey
  deriving DecidableEq

structure ScopedDisclosureEvent where
  event : DisclosureEvent
  scope : ScopeKey
  deriving DecidableEq

structure ScopedEvidenceFlow where
  scope : ScopeKey
  items : Finset ScopedEvidenceItem
  events : Finset ScopedDisclosureEvent
  deriving DecidableEq

structure ScopedPairReadout where
  scope : ScopeKey
  stage : FlowStage
  leftItemId : Nat
  rightItemId : Nat
  deriving DecidableEq

/-- Every registered item and disclosure event must carry the container's
    exact task/run/model/version/policy/session key. -/
def scopeConsistent (flow : ScopedEvidenceFlow) : Prop :=
  (∀ item ∈ flow.items, item.scope = flow.scope) ∧
  (∀ event ∈ flow.events, event.scope = flow.scope)

/-- Item identifiers are unique within a single scoped flow. The same local
    item identifier may legitimately recur in a different scope. -/
def uniqueItemIds (items : Finset ScopedEvidenceItem) : Prop :=
  ∀ left ∈ items, ∀ right ∈ items,
    left.item.itemId = right.item.itemId → left = right

/-- Every disclosure occurrence resolves to a registered semantic item in
    the same scope. Event identity remains distinct from item identity. -/
def eventReferencesResolve (flow : ScopedEvidenceFlow) : Prop :=
  ∀ event ∈ flow.events,
    ∃ item ∈ flow.items,
      item.item.itemId = event.event.itemId ∧ item.scope = event.scope

/-- A disclosure-event identifier is unique within one scoped flow. -/
def uniqueEventIds (events : Finset ScopedDisclosureEvent) : Prop :=
  ∀ left ∈ events, ∀ right ∈ events,
    left.event.eventId = right.event.eventId → left = right

def validScopedFlow (flow : ScopedEvidenceFlow) : Prop :=
  scopeConsistent flow ∧
  uniqueItemIds flow.items ∧
  eventReferencesResolve flow ∧
  uniqueEventIds flow.events

theorem valid_flow_items_share_scope
    (flow : ScopedEvidenceFlow) (item : ScopedEvidenceItem)
    (hValid : validScopedFlow flow) (hItem : item ∈ flow.items) :
    item.scope = flow.scope :=
  hValid.1.1 item hItem

theorem valid_flow_events_share_scope
    (flow : ScopedEvidenceFlow) (event : ScopedDisclosureEvent)
    (hValid : validScopedFlow flow) (hEvent : event ∈ flow.events) :
    event.scope = flow.scope :=
  hValid.1.2 event hEvent

/-- Under the admission invariants, each event resolves to exactly one
    registered item record. This is referential integrity, not source
    authentication or semantic correctness. -/
theorem event_resolves_to_unique_item
    (flow : ScopedEvidenceFlow) (event : ScopedDisclosureEvent)
    (hValid : validScopedFlow flow) (hEvent : event ∈ flow.events) :
    ∃! item, item ∈ flow.items ∧
      item.item.itemId = event.event.itemId ∧ item.scope = event.scope := by
  rcases hValid.2.2.1 event hEvent with ⟨item, hItem, hId, hScope⟩
  refine ⟨item, ⟨hItem, hId, hScope⟩, ?_⟩
  intro other hOther
  exact hValid.2.1 item hItem other hOther.1
    (hId.trans hOther.2.1.symm)

/-- A pair readout is admitted only within one exact scope, with distinct
    endpoint identifiers and two stage-matched disclosure events. -/
def admissiblePairReadout
    (flow : ScopedEvidenceFlow) (readout : ScopedPairReadout) : Prop :=
  validScopedFlow flow ∧
  readout.scope = flow.scope ∧
  readout.leftItemId ≠ readout.rightItemId ∧
  (∃ event ∈ flow.events,
    event.scope = readout.scope ∧
    event.event.stage = readout.stage ∧
    event.event.itemId = readout.leftItemId) ∧
  (∃ event ∈ flow.events,
    event.scope = readout.scope ∧
    event.event.stage = readout.stage ∧
    event.event.itemId = readout.rightItemId)

theorem foreign_scope_pair_readout_rejected
    (flow : ScopedEvidenceFlow) (readout : ScopedPairReadout)
    (hForeign : readout.scope ≠ flow.scope) :
    ¬ admissiblePairReadout flow readout := by
  intro hAdmitted
  exact hForeign hAdmitted.2.1

/-- An admitted pair readout's two endpoints resolve to registered items in
    the same declared scope. -/
theorem admitted_pair_endpoints_are_registered
    (flow : ScopedEvidenceFlow) (readout : ScopedPairReadout)
    (hAdmitted : admissiblePairReadout flow readout) :
    (∃ left ∈ flow.items,
      left.item.itemId = readout.leftItemId ∧ left.scope = readout.scope) ∧
    (∃ right ∈ flow.items,
      right.item.itemId = readout.rightItemId ∧ right.scope = readout.scope) := by
  rcases hAdmitted with ⟨hValid, hReadoutScope, hDistinct, hLeft, hRight⟩
  rcases hLeft with ⟨leftEvent, hLeftEvent, hLeftEventScope,
    hLeftStage, hLeftId⟩
  rcases hRight with ⟨rightEvent, hRightEvent, hRightEventScope,
    hRightStage, hRightId⟩
  rcases hValid.2.2.1 leftEvent hLeftEvent with
    ⟨leftItem, hLeftItem, hLeftItemId, hLeftItemScope⟩
  rcases hValid.2.2.1 rightEvent hRightEvent with
    ⟨rightItem, hRightItem, hRightItemId, hRightItemScope⟩
  constructor
  · exact ⟨leftItem, hLeftItem,
      hLeftItemId.trans hLeftId,
      hLeftItemScope.trans hLeftEventScope⟩
  · exact ⟨rightItem, hRightItem,
      hRightItemId.trans hRightId,
      hRightItemScope.trans hRightEventScope⟩

/-- A scope-compatible union refuses to pool flows from different
    task/run/model/version/policy/session keys. If scopes match, the union
    is only a candidate; callers must revalidate item/event uniqueness and
    references after union. -/
def scopeCompatibleUnion
    (left right : ScopedEvidenceFlow) : Option ScopedEvidenceFlow :=
  if left.scope = right.scope then
    some {
      scope := left.scope
      items := left.items ∪ right.items
      events := left.events ∪ right.events
    }
  else
    none

theorem scope_compatible_union_rejects_mismatch
    (left right : ScopedEvidenceFlow)
    (hDifferent : left.scope ≠ right.scope) :
    scopeCompatibleUnion left right = none := by
  simp [scopeCompatibleUnion, hDifferent]

/-! ## Finite logical witness

The same local item ID may appear in separate runs. The scope key, not the
local integer alone, determines whether aggregation is admissible. -/

def runScopeA : ScopeKey :=
  ⟨"task-1", "run-1", "model-gpt6", "version-a", "required", "session-1"⟩

def runScopeB : ScopeKey :=
  ⟨"task-1", "run-2", "model-gpt6", "version-a", "required", "session-2"⟩

def runAItem : ScopedEvidenceItem :=
  ⟨⟨7, {101}⟩, runScopeA⟩

def runBItem : ScopedEvidenceItem :=
  ⟨⟨7, {202}⟩, runScopeB⟩

def runAFlow : ScopedEvidenceFlow where
  scope := runScopeA
  items := {runAItem}
  events := ∅

def runBFlow : ScopedEvidenceFlow where
  scope := runScopeB
  items := {runBItem}
  events := ∅

theorem same_local_item_id_can_recur_across_runs :
    runAItem.item.itemId = runBItem.item.itemId ∧
    runScopeA ≠ runScopeB := by
  decide

theorem cross_run_union_is_rejected :
    scopeCompatibleUnion runAFlow runBFlow = none := by
  simp [scopeCompatibleUnion, runAFlow, runBFlow, runScopeA, runScopeB]

#eval decide (runScopeA ≠ runScopeB)
#eval scopeCompatibleUnion runAFlow runBFlow

#print axioms valid_flow_items_share_scope
#print axioms valid_flow_events_share_scope
#print axioms event_resolves_to_unique_item
#print axioms foreign_scope_pair_readout_rejected
#print axioms admitted_pair_endpoints_are_registered
#print axioms scope_compatible_union_rejects_mismatch
#print axioms same_local_item_id_can_recur_across_runs
#print axioms cross_run_union_is_rejected

end HsHVerification.OrsonEvidenceFlowScope
