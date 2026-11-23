import Mathlib

/-!
Sable-lane workflow-operation contract, 2026-11-23.

Historical source basis: Nathan user-role messages in the raw
"SABLE Revival Rotation" conversation, especially:
* 2026-09-13T14:12:22.979Z, message 1d7df1de-5bb8-41fb-8d4b-2c7195a970aa:
  state-dependent workflow operations read from a named document;
* 2026-09-13T14:14:15.212Z, message 8aca810b-1c7e-4e62-b5f8-c5eda0c26bee:
  alternate work while a step is blocked or ambiguous;
* 2026-09-13T15:03:54.098Z, message 81114d33-7790-4b84-a142-4f55c807a033:
  trial workflow, bounded turns, explicit handoff and reconvening.

Current control sources:
* WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json
* WORKSPACES/COMMON/WORKFLOW_BRANCHING_MAP.md
* WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md
* WORKSPACES/COMMON/PROJECT_DESK_CONTROL_CONTRACT.md
* WORKSPACES/COMMON/ORCHESTRATOR_COMPTROLLER_MODEL.md

This is a proposed abstract contract, not a model of the live Python,
GitHub Actions, ChatGPT scheduler, or any production executor. It does
not authenticate an actor, verify a hash function, enforce permissions,
or establish that an action actually ran. The graph's branch status,
the operation lifecycle, and handoff delivery state are deliberately
separate types.
-/

namespace HsHVerification.SableWorkflowOperationGate

inductive BranchStatus where
  | candidate
  | active
  | blocked
  | handoffPending
  | parked
  | completed
  | superseded
  | rejected
deriving DecidableEq, Repr

inductive OperationStage where
  | proposed
  | authorized
  | executed
  | readbackVerified
  | stateCommitted
  | deferred
  | rejected
  | failed
  | needsReconciliation
deriving DecidableEq, Repr

inductive HandoffStage where
  | none
  | packetCreated
  | routed
  | acknowledged
  | consumed
deriving DecidableEq, Repr

structure OperationEvidence where
  plannedSnapshotMatches : Bool
  authorityGranted : Bool
  preconditionsSatisfied : Bool
  executionRecorded : Bool
  artifactDigestBound : Bool
  independentReadback : Bool
  exitCriteriaVerified : Bool
  stage : OperationStage
deriving Repr

/-- Evidence required before a branch-state update can be proposed for commit.
    This is a contract predicate, not a runtime permission check. -/
def operationReadyForStateCommit (e : OperationEvidence) : Prop :=
  e.plannedSnapshotMatches = true ∧
  e.authorityGranted = true ∧
  e.preconditionsSatisfied = true ∧
  e.executionRecorded = true ∧
  e.artifactDigestBound = true ∧
  e.independentReadback = true ∧
  e.stage = .readbackVerified

/-- Completion has an additional exit-criteria obligation. -/
def mayCommitBranchStatus (e : OperationEvidence) (target : BranchStatus) : Prop :=
  operationReadyForStateCommit e ∧
  (target = .completed → e.exitCriteriaVerified = true)

structure WorkflowState where
  branchStatus : BranchStatus
  operation : OperationEvidence

def branchProjection (w : WorkflowState) : BranchStatus := w.branchStatus

/-- The branch-status projection is non-injective with respect to operation
    readiness: one active branch may have only a proposal, while another active
    branch may have a verified operation. Branch status alone cannot recover
    operation readiness. -/
theorem branch_status_does_not_determine_operation_readiness :
    ∃ a b : WorkflowState,
      branchProjection a = branchProjection b ∧
      operationReadyForStateCommit a.operation ∧
      ¬ operationReadyForStateCommit b.operation := by
  let ready : OperationEvidence :=
    { plannedSnapshotMatches := true
      authorityGranted := true
      preconditionsSatisfied := true
      executionRecorded := true
      artifactDigestBound := true
      independentReadback := true
      exitCriteriaVerified := true
      stage := .readbackVerified }
  let proposed : OperationEvidence := { ready with stage := .proposed }
  refine ⟨⟨.active, ready⟩, ⟨.active, proposed⟩, rfl, ?_, ?_⟩
  · simp [operationReadyForStateCommit, ready]
  · simp [operationReadyForStateCommit, proposed, ready]

theorem stale_snapshot_blocks_state_commit
    (e : OperationEvidence) (target : BranchStatus)
    (h : e.plannedSnapshotMatches = false) :
    ¬ mayCommitBranchStatus e target := by
  simp [mayCommitBranchStatus, operationReadyForStateCommit, h]

theorem proposed_operation_cannot_commit
    (e : OperationEvidence) (target : BranchStatus)
    (h : e.stage = .proposed) :
    ¬ mayCommitBranchStatus e target := by
  simp [mayCommitBranchStatus, operationReadyForStateCommit, h]

theorem missing_independent_readback_blocks_commit
    (e : OperationEvidence) (target : BranchStatus)
    (h : e.independentReadback = false) :
    ¬ mayCommitBranchStatus e target := by
  simp [mayCommitBranchStatus, operationReadyForStateCommit, h]

theorem completed_requires_verified_exit_criteria
    (e : OperationEvidence)
    (h : mayCommitBranchStatus e .completed) :
    e.exitCriteriaVerified = true := by
  exact h.2 rfl

/-- Packet creation is not delivery, acknowledgment, or consumption. -/
def handoffDelivered (h : HandoffStage) : Prop :=
  h = .routed ∨ h = .acknowledged ∨ h = .consumed

theorem packet_creation_is_not_delivery :
    ¬ handoffDelivered .packetCreated := by
  simp [handoffDelivered]

theorem pending_packet_does_not_imply_delivery :
    ∃ h : HandoffStage, h = .packetCreated ∧ ¬ handoffDelivered h := by
  exact ⟨.packetCreated, rfl, packet_creation_is_not_delivery⟩

#print axioms branch_status_does_not_determine_operation_readiness
#print axioms stale_snapshot_blocks_state_commit
#print axioms proposed_operation_cannot_commit
#print axioms missing_independent_readback_blocks_commit
#print axioms completed_requires_verified_exit_criteria
#print axioms packet_creation_is_not_delivery

end HsHVerification.SableWorkflowOperationGate
