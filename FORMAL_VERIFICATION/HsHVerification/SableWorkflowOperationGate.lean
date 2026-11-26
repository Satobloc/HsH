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


namespace HsHVerification.SableRunBinding

/-- UTC instants normalized to Unix epoch milliseconds by the external adapter.
    Correctness of that timestamp conversion is not established by this module. -/
abbrev InstantMs := Nat

inductive RunStatus where
  | queued
  | inProgress
  | completed
  | failed
  | other
deriving DecidableEq, Repr

/-- A conversation reference is context identity, not evidence of message delivery. -/
structure ConversationRef where
  kind : String
  id : String
deriving DecidableEq, Repr

/-- One observed automation invocation, corresponding to the live last_run record. -/
structure Invocation where
  id : String
  startedAtMs : InstantMs
  status : RunStatus
  completedAtMs : Option InstantMs
  chatRef : Option ConversationRef
deriving DecidableEq, Repr

/-- The cached latest_result record. Its runId may refer to an earlier invocation. -/
structure CachedResult where
  runId : String
  createdAtMs : InstantMs
  completedAtMs : Option InstantMs
  chatRef : Option ConversationRef
  contentTruncated : Bool
  isFailureMessage : Bool
  requiresUserAction : Bool
deriving DecidableEq, Repr

/-- A cached result is attributable to an invocation only if both its run identity
    matches and its creation time is not earlier than that invocation's start.
    The second condition rejects stale output retained across retries that reuse
    a run identifier. -/
def resultBoundToInvocation (run : Invocation) (result : CachedResult) : Prop :=
  run.id = result.runId ∧ run.startedAtMs ≤ result.createdAtMs

theorem result_binding_requires_matching_run_id
    (run : Invocation) (result : CachedResult)
    (h : resultBoundToInvocation run result) :
    run.id = result.runId := h.1

theorem result_binding_requires_not_older_than_run
    (run : Invocation) (result : CachedResult)
    (h : resultBoundToInvocation run result) :
    run.startedAtMs ≤ result.createdAtMs := h.2

theorem mismatched_run_id_blocks_attribution
    (run : Invocation) (result : CachedResult)
    (h : run.id ≠ result.runId) :
    ¬ resultBoundToInvocation run result := by
  intro bound
  exact h bound.1

theorem result_predates_invocation_blocks_attribution
    (run : Invocation) (result : CachedResult)
    (h : result.createdAtMs < run.startedAtMs) :
    ¬ resultBoundToInvocation run result := by
  intro bound
  exact (not_le_of_gt h) bound.2

def runCompleted (run : Invocation) : Prop :=
  run.status = .completed ∧ run.completedAtMs ≠ none

theorem in_progress_is_not_completed
    (run : Invocation) (h : run.status = .inProgress) :
    ¬ runCompleted run := by
  simp [runCompleted, h]

/-- A chat context can be associated with an invocation only after result binding
    and only when both nonempty conversation references agree. This is not delivery. -/
def chatContextBoundToInvocation
    (run : Invocation) (result : CachedResult) : Prop :=
  resultBoundToInvocation run result ∧
  ∃ ref : ConversationRef,
    run.chatRef = some ref ∧ result.chatRef = some ref

theorem no_chat_context_when_run_ref_absent
    (run : Invocation) (result : CachedResult)
    (h : run.chatRef = none) :
    ¬ chatContextBoundToInvocation run result := by
  intro bound
  rcases bound.2 with ⟨ref, runRef, _⟩
  simp [h] at runRef

/-- A result may proceed to independent readback only when it is bound to the
    current invocation, the invocation is completed, completion timestamps agree,
    the content is not truncated, and the result does not request user action or
    report a failure. This is eligibility for readback, not verified completion. -/
def resultEligibleForIndependentReadback
    (run : Invocation) (result : CachedResult) : Prop :=
  resultBoundToInvocation run result ∧
  runCompleted run ∧
  result.completedAtMs = run.completedAtMs ∧
  result.contentTruncated = false ∧
  result.isFailureMessage = false ∧
  result.requiresUserAction = false

theorem readback_eligibility_requires_run_binding
    (run : Invocation) (result : CachedResult)
    (h : resultEligibleForIndependentReadback run result) :
    resultBoundToInvocation run result := h.1

theorem readback_eligibility_requires_completed_run
    (run : Invocation) (result : CachedResult)
    (h : resultEligibleForIndependentReadback run result) :
    runCompleted run := h.2.1

/-
Observed software-run fixture from Workshop Relay :36, h1109:s3.
The actual prior result's non-null chat reference identifier is intentionally
redacted; only its observed presence is represented. Times are epoch milliseconds
normalized from the exact UTC strings in the automation readback.

last_run:
  id         = 1c993f17-2e50-8331-a50e-86da9354252f
  started_at = 2026-11-26T05:37:04.333183Z
  status     = in_progress
  completed  = null
  chat_ref   = null

latest_result:
  run_id      = a4df1d5f-0f18-8326-99ff-00dc4c1af383
  created_at  = 2026-11-26T04:55:25.379867Z
  completed   = 2026-11-26T04:55:28.022582Z
  chat_ref    = non-null (prior Kestrel result; identifier redacted)
  truncated   = true
-/

def observedCurrentRun : Invocation :=
  { id := "1c993f17-2e50-8331-a50e-86da9354252f"
    startedAtMs := 1795671424333
    status := .inProgress
    completedAtMs := none
    chatRef := none }

def observedCachedPriorResult : CachedResult :=
  { runId := "a4df1d5f-0f18-8326-99ff-00dc4c1af383"
    createdAtMs := 1795668925379
    completedAtMs := some 1795668928022
    chatRef := some { kind := "chatgpt", id := "REDACTED_PRIOR_RUN_REF" }
    contentTruncated := true
    isFailureMessage := false
    requiresUserAction := false }

example : observedCurrentRun.id ≠ observedCachedPriorResult.runId := by decide

example :
    observedCachedPriorResult.createdAtMs <
      observedCurrentRun.startedAtMs := by decide

example :
    ¬ resultBoundToInvocation observedCurrentRun observedCachedPriorResult := by
  exact mismatched_run_id_blocks_attribution
    observedCurrentRun observedCachedPriorResult (by decide)

example : ¬ runCompleted observedCurrentRun := by
  apply in_progress_is_not_completed
  rfl

example :
    ¬ chatContextBoundToInvocation observedCurrentRun observedCachedPriorResult := by
  apply no_chat_context_when_run_ref_absent
  rfl

example :
    ¬ resultEligibleForIndependentReadback
      observedCurrentRun observedCachedPriorResult := by
  intro h
  exact mismatched_run_id_blocks_attribution
    observedCurrentRun observedCachedPriorResult (by decide) h.1

#print axioms result_binding_requires_matching_run_id
#print axioms result_binding_requires_not_older_than_run
#print axioms mismatched_run_id_blocks_attribution
#print axioms result_predates_invocation_blocks_attribution
#print axioms in_progress_is_not_completed
#print axioms no_chat_context_when_run_ref_absent
#print axioms readback_eligibility_requires_run_binding
#print axioms readback_eligibility_requires_completed_run

end HsHVerification.SableRunBinding


/-!
2026-11-26 h1113:s2 proposed extension.

This extension keeps route destination separate from the coarse HandoffStage,
and supplies a typed bridge between OperationEvidence and run-bound readback.

The hostAccepted, independentFetch, and exactBytesMatched fields are external
adapter observations. Lean proves only the conditional contract over those
supplied values. It does not authenticate a ChatGPT thread, execute a post,
retrieve bytes, or verify the SHA-256 implementation.
-/

namespace HsHVerification.SableOperationReadbackBridge

open HsHVerification.SableWorkflowOperationGate
open HsHVerification.SableRunBinding

/-- A route records where a handoff was actually directed. -/
inductive HandoffDestination where
  | repositoryInbox (path : String) (commitSha : String) (blobSha : String)
  | issueComment (issueUrl : String) (commentId : String)
  | chatThreadPost (conversationId : String) (turnId : String) (hostAccepted : Bool)
deriving DecidableEq, Repr

/-- The old coarse stage projection records only that something was routed. -/
def routeStageOf (_ : HandoffDestination) : HandoffStage := .routed

/-- This is a host-acceptance receipt predicate, not recipient acknowledgment
    or proof of consumption. The host result remains an external premise. -/
def chatThreadPostAccepted : HandoffDestination → Prop
  | .chatThreadPost conversationId turnId hostAccepted =>
      conversationId ≠ "" ∧ turnId ≠ "" ∧ hostAccepted = true
  | _ => False

theorem repository_inbox_is_not_chat_thread_post
    (path commitSha blobSha : String) :
    ¬ chatThreadPostAccepted (.repositoryInbox path commitSha blobSha) := by
  simp [chatThreadPostAccepted]

theorem issue_comment_is_not_chat_thread_post
    (issueUrl commentId : String) :
    ¬ chatThreadPostAccepted (.issueComment issueUrl commentId) := by
  simp [chatThreadPostAccepted]

theorem chat_thread_post_requires_host_acceptance
    (conversationId turnId : String) :
    ¬ chatThreadPostAccepted (.chatThreadPost conversationId turnId false) := by
  simp [chatThreadPostAccepted]

/-- Two different destinations can share the same coarse routed stage.
    Therefore HandoffStage alone cannot establish cross-thread delivery. -/
theorem routed_stage_does_not_determine_destination :
    ∃ repositoryRoute chatRoute : HandoffDestination,
      routeStageOf repositoryRoute = routeStageOf chatRoute ∧
      ¬ chatThreadPostAccepted repositoryRoute ∧
      chatThreadPostAccepted chatRoute := by
  refine
    ⟨ .repositoryInbox "WORKSPACES/SABLE/INBOX.md" "commit" "blob"
    , .chatThreadPost "conversation" "turn" true
    , rfl
    , ?_
    , ?_ ⟩
  · simp [chatThreadPostAccepted]
  · simp [chatThreadPostAccepted]

/-- External readback receipt. Digests and retrieval assertions are inputs
    supplied by the adapter; this structure does not implement SHA-256. -/
structure IndependentReadbackReceipt where
  invocationId : String
  resultRunId : String
  artifactPath : String
  expectedDigest : String
  observedDigest : String
  independentFetch : Bool
  exactBytesMatched : Bool
deriving DecidableEq, Repr

/-- A typed witness binds the external receipt to one completed invocation
    and its eligible cached result. -/
structure VerifiedReadbackWitness
    (run : Invocation) (result : CachedResult) where
  receipt : IndependentReadbackReceipt
  resultEligible : resultEligibleForIndependentReadback run result
  invocationMatches : receipt.invocationId = run.id
  resultMatches : receipt.resultRunId = result.runId
  artifactPathPresent : receipt.artifactPath ≠ ""
  expectedDigestPresent : receipt.expectedDigest ≠ ""
  digestMatches : receipt.observedDigest = receipt.expectedDigest
  independentFetchRecorded : receipt.independentFetch = true
  exactBytesMatchRecorded : receipt.exactBytesMatched = true

/-- A branch-state operation now carries both the original operation gate
    and a run/result-bound independent-readback witness. -/
structure OperationReadbackLink where
  operation : OperationEvidence
  run : Invocation
  result : CachedResult
  readback : VerifiedReadbackWitness run result
  operationReady : operationReadyForStateCommit operation

theorem linked_operation_has_run_bound_result
    (link : OperationReadbackLink) :
    resultBoundToInvocation link.run link.result :=
  link.readback.resultEligible.1

theorem linked_operation_has_completed_run
    (link : OperationReadbackLink) :
    runCompleted link.run :=
  link.readback.resultEligible.2.1

theorem linked_operation_has_matching_digest
    (link : OperationReadbackLink) :
    link.readback.digestMatches :=
  link.readback.digestMatches

theorem linked_operation_requires_readback_flag
    (link : OperationReadbackLink) :
    link.operation.independentReadback = true :=
  link.operationReady.2.2.2.2.2.1

/-- Counterexample to treating the old boolean operation gate as if it were
    already coupled to a particular live run/result. -/
def optimisticOperationEvidence : OperationEvidence :=
  { plannedSnapshotMatches := true
    authorityGranted := true
    preconditionsSatisfied := true
    executionRecorded := true
    artifactDigestBound := true
    independentReadback := true
    exitCriteriaVerified := true
    stage := .readbackVerified }

def inProgressInvocation : Invocation :=
  { id := "run-current"
    startedAtMs := 100
    status := .inProgress
    completedAtMs := none
    chatRef := none }

def inProgressCachedResult : CachedResult :=
  { runId := "run-current"
    createdAtMs := 101
    completedAtMs := none
    chatRef := none
    contentTruncated := false
    isFailureMessage := false
    requiresUserAction := false }

theorem legacy_boolean_gate_can_pass_without_run_readback_eligibility :
    operationReadyForStateCommit optimisticOperationEvidence ∧
    ¬ resultEligibleForIndependentReadback
      inProgressInvocation inProgressCachedResult := by
  constructor
  · simp [operationReadyForStateCommit, optimisticOperationEvidence]
  · intro eligible
    exact in_progress_is_not_completed
      inProgressInvocation rfl eligible.2.1

#print axioms repository_inbox_is_not_chat_thread_post
#print axioms issue_comment_is_not_chat_thread_post
#print axioms chat_thread_post_requires_host_acceptance
#print axioms routed_stage_does_not_determine_destination
#print axioms linked_operation_has_run_bound_result
#print axioms linked_operation_has_completed_run
#print axioms linked_operation_has_matching_digest
#print axioms linked_operation_requires_readback_flag
#print axioms legacy_boolean_gate_can_pass_without_run_readback_eligibility

end HsHVerification.SableOperationReadbackBridge
