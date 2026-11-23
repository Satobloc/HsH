import Mathlib

/-!
Assistant-proposed finite-state model for the read-only task-upkeep triage helper.

It separates attention ranking from a conservative pickup gate:
* blocked tasks are review-only;
* tasks with an owner require owner/coordinator action;
* ownerless, unblocked tasks are candidates for assignment review only;
* malformed owner metadata requires review.

A deterministic ring index is routing metadata and is deliberately absent from
the pickup classification. The h1049 arithmetic is included only to check the
supplied 19-member rotation formula.

Translation limits:
* This models the proposed classification, not the Python implementation's
  refinement or runtime enforcement.
* It does not determine whether support work is authorized, assign a task,
  authenticate a worker, or establish actual execution.
* Compilation proves only the Lean statements below, not the truth or
  completeness of any repository or scheduler evidence.
-/

namespace HsHVerification.TaskPickupEligibility

inductive TaskStatus where
  | active
  | blocked
  | handoffPending
  | candidate
deriving DecidableEq, Repr

inductive OwnerState where
  | unset
  | set
  | invalid
deriving DecidableEq, Repr

inductive PickupGate where
  | blockedReviewOnly
  | ownerCoordinationRequired
  | unassignedCandidate
  | ownerMetadataReview
deriving DecidableEq, Repr

def classify (status : TaskStatus) (hasBlockers : Bool)
    (owner : OwnerState) : PickupGate :=
  if hasBlockers || status = .blocked then
    .blockedReviewOnly
  else
    match owner with
    | .set => .ownerCoordinationRequired
    | .unset => .unassignedCandidate
    | .invalid => .ownerMetadataReview

structure TriageRecord where
  selectedRingIndex : Fin 19
  status : TaskStatus
  hasBlockers : Bool
  owner : OwnerState
deriving Repr

def pickupGate (r : TriageRecord) : PickupGate :=
  classify r.status r.hasBlockers r.owner

theorem blocked_status_never_becomes_pickup_candidate
    (hasBlockers : Bool) (owner : OwnerState) :
    classify .blocked hasBlockers owner = .blockedReviewOnly := by
  simp [classify]

theorem any_blocker_blocks_direct_pickup
    (status : TaskStatus) (owner : OwnerState) :
    classify status true owner = .blockedReviewOnly := by
  simp [classify]

theorem owned_unblocked_work_requires_coordination
    (status : TaskStatus) (hStatus : status ≠ .blocked) :
    classify status false .set = .ownerCoordinationRequired := by
  cases status <;> simp_all [classify]

theorem unassigned_unblocked_work_is_only_a_candidate
    (status : TaskStatus) (hStatus : status ≠ .blocked) :
    classify status false .unset = .unassignedCandidate := by
  cases status <;> simp_all [classify]

theorem invalid_owner_metadata_requires_review
    (status : TaskStatus) (hStatus : status ≠ .blocked) :
    classify status false .invalid = .ownerMetadataReview := by
  cases status <;> simp_all [classify]

theorem ring_index_does_not_change_pickup_gate
    (r : TriageRecord) (i : Fin 19) :
    pickupGate r = pickupGate { r with selectedRingIndex := i } := by
  rfl

def scheduledRingIndex (h : Nat) : Fin 19 :=
  ⟨(5 * h + 3) % 19, Nat.mod_lt _ (by decide)⟩

def nextScheduledRingIndex (h : Nat) : Fin 19 :=
  ⟨(5 * h + 4) % 19, Nat.mod_lt _ (by decide)⟩

theorem h1049_selected_ring_index :
    (scheduledRingIndex 1049).val = 4 := by
  norm_num [scheduledRingIndex]

theorem h1049_next_ring_index :
    (nextScheduledRingIndex 1049).val = 5 := by
  norm_num [nextScheduledRingIndex]

#eval (scheduledRingIndex 1049).val
#eval (nextScheduledRingIndex 1049).val
#eval classify .active false .set
#eval classify .active true .unset

#print axioms blocked_status_never_becomes_pickup_candidate
#print axioms any_blocker_blocks_direct_pickup
#print axioms owned_unblocked_work_requires_coordination
#print axioms unassigned_unblocked_work_is_only_a_candidate
#print axioms invalid_owner_metadata_requires_review
#print axioms ring_index_does_not_change_pickup_gate
#print axioms h1049_selected_ring_index
#print axioms h1049_next_ring_index

end HsHVerification.TaskPickupEligibility
