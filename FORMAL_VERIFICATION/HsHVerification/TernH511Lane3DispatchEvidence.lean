import Mathlib

/-!
Tern Rook / Comptroller, 2026-11-01 nominal 07:36Z run.

This module formalizes a bounded, source-backed rotation and Mersearch
dispatch snapshot. It is not physical data or a physical model.

Evidence snapshot:
* UTC epoch: 2026-10-11T00:00:00Z; nominal UTC hour h=511.
* Fixed 19-name ring and sequence rule supplied in the live relay instruction.
* Lane-3 request ID: aster-june-2025-disclosure-source-lineage-20261101-0536.
* Run: GitHub Actions #41278156840, job #124764453899.
* Run head: 60555504423e744b90f8864c3bccef23eb9f9105.
* Request at that run head had the same request ID and status "requested".
* Current main request blob: 425ef62e56e4e01d2dfc04d45640263e141e6009;
  its static marker is "staged_not_dispatched".
* Lane-3 workflow: .github/workflows/mersearch-request-bridge-lane-3.yml,
  blob d4af505b3a579c05f0c98e241dd85c3891b0249d.
* The workflow trigger path is MERSEARCH_REQUEST_LANE_3.json, not the
  shared MERSEARCH_REQUEST.json path used by the generic lane-1 workflow.
* At 2026-11-01T07:43:39Z the run/job and "Run Mersearch" step were
  observed in_progress; manifest/receipt steps had not started.

Lean checks only the finite propositions over these transcribed records.
It does not authenticate GitHub service metadata, establish the soundness
of the transcription, guarantee eventual completion, or validate any
historical/physical claim. Request markers and execution status are
deliberately represented as different types.
-/

namespace HsHVerification.TernH511Lane3DispatchEvidence

def ring : List String :=
  [ "Sable", "Loom", "Aster", "Ariadne", "Alberr", "Mira", "Aldus"
  , "Calder", "Hale", "Elias Kern", "Nadir Voss", "Enheduanna"
  , "Tern Rook", "Morrow", "Kestrel", "Meridian", "Mercer", "Ravel"
  , "Orson Vay"
  ]

def h : Nat := 511
def slot : Nat := 3
def sequence : Nat := 5 * h + slot
def selectedIndex : Nat := sequence % 19
def nextIndex : Nat := (sequence + 1) % 19

theorem epoch_hour_check : 21 * 24 + 7 = h := by decide
theorem ring_has_nineteen_names : ring.length = 19 := by decide
theorem sequence_is_2558 : sequence = 2558 := by decide
theorem selected_index_is_12 : selectedIndex = 12 := by decide
theorem selected_name_is_tern : ring[selectedIndex]? = some "Tern Rook" := by decide
theorem next_index_is_13 : nextIndex = 13 := by decide
theorem next_name_is_morrow : ring[nextIndex]? = some "Morrow" := by decide

inductive RequestMarker where
  | requested
  | stagedNotDispatched
  deriving DecidableEq, Repr

inductive ExecutionStatus where
  | queued
  | inProgress
  | completed
  | failed
  deriving DecidableEq, Repr

structure RequestSnapshot where
  requestId : String
  path : String
  marker : RequestMarker
  deriving DecidableEq, Repr

structure WorkflowSnapshot where
  path : String
  triggerPath : String
  deriving DecidableEq, Repr

structure RunSnapshot where
  runId : String
  requestId : String
  workflowPath : String
  status : ExecutionStatus
  deriving DecidableEq, Repr

def lane3RequestPath : String :=
  "WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_3.json"

def sharedRequestPath : String :=
  "WORKSPACES/COMMON/MERSEARCH_REQUEST.json"

def lane3WorkflowPath : String :=
  ".github/workflows/mersearch-request-bridge-lane-3.yml"

def genericWorkflowPath : String :=
  ".github/workflows/mersearch-request-bridge.yml"

def requestId : String :=
  "aster-june-2025-disclosure-source-lineage-20261101-0536"

def requestAtRunHead : RequestSnapshot :=
  ⟨requestId, lane3RequestPath, .requested⟩

def currentRequest : RequestSnapshot :=
  ⟨requestId, lane3RequestPath, .stagedNotDispatched⟩

def lane3Workflow : WorkflowSnapshot :=
  ⟨lane3WorkflowPath, lane3RequestPath⟩

def lane3Run : RunSnapshot :=
  ⟨"41278156840", requestId, lane3WorkflowPath, .inProgress⟩

def isBoundToWorkflow (request : RequestSnapshot)
    (workflow : WorkflowSnapshot) (run : RunSnapshot) : Prop :=
  request.requestId = run.requestId ∧
  request.path = workflow.triggerPath ∧
  workflow.path = run.workflowPath

theorem run_binds_to_request_snapshot_at_run_head :
    isBoundToWorkflow requestAtRunHead lane3Workflow lane3Run := by
  simp [isBoundToWorkflow, requestAtRunHead, lane3Workflow, lane3Run,
    requestId, lane3RequestPath, lane3WorkflowPath]

theorem current_request_identity_matches_run :
    currentRequest.requestId = lane3Run.requestId := by
  decide

theorem current_request_marker_is_staged :
    currentRequest.marker = .stagedNotDispatched := by
  decide

theorem lane3_run_was_in_progress_at_observation :
    lane3Run.status = .inProgress := by
  decide

theorem staged_marker_coexists_with_bound_run :
    currentRequest.marker = .stagedNotDispatched ∧
    isBoundToWorkflow currentRequest lane3Workflow lane3Run := by
  constructor
  · rfl
  · simp [isBoundToWorkflow, currentRequest, lane3Workflow, lane3Run,
      requestId, lane3RequestPath, lane3WorkflowPath]

theorem in_progress_run_is_not_completed :
    lane3Run.status ≠ .completed := by
  decide

theorem lane3_trigger_is_not_shared_slot :
    lane3Workflow.triggerPath ≠ sharedRequestPath := by
  decide

theorem dedicated_lane3_workflow_is_not_generic_bridge :
    lane3Workflow.path ≠ genericWorkflowPath := by
  decide

theorem request_head_and_current_snapshots_share_identity :
    requestAtRunHead.requestId = currentRequest.requestId ∧
    requestAtRunHead.path = currentRequest.path := by
  decide

#print axioms epoch_hour_check
#print axioms ring_has_nineteen_names
#print axioms sequence_is_2558
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_index_is_13
#print axioms next_name_is_morrow
#print axioms run_binds_to_request_snapshot_at_run_head
#print axioms current_request_identity_matches_run
#print axioms current_request_marker_is_staged
#print axioms lane3_run_was_in_progress_at_observation
#print axioms staged_marker_coexists_with_bound_run
#print axioms in_progress_run_is_not_completed
#print axioms lane3_trigger_is_not_shared_slot
#print axioms dedicated_lane3_workflow_is_not_generic_bridge
#print axioms request_head_and_current_snapshots_share_identity

end HsHVerification.TernH511Lane3DispatchEvidence
