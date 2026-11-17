import Mathlib

/-!
Tern Rook / Comptroller | 2026-11-15 | same-run attempt-identity
non-identifiability witness.

Source: WORKSPACES/TERN/OBSERVATIONS/
2026-11-15T1051Z_H849_S4_OBS028_AMENDMENT_18_MERIDIAN_H850_S2_SAME_ID_FAILED_TO_IN_PROGRESS.md
Git blob 448ec06cd53a2b6d6970007f9738b7e3f5126020.

The two API snapshots retain the same run ID and scheduled slot, while
started_at, status, and completed_at differ. The API evidence does not expose
an attempt identifier. We therefore model attemptOrdinal as hidden metadata
and prove that two different hidden assignments project to the same exposed
snapshot pair.

This is a non-identifiability result about the fields represented here.
It does NOT establish that either hidden assignment actually occurred,
nor retry, restart, duplicate execution, process concurrency, worker
identity, liveness, provider semantics, or backend cause. Lean verifies only
the propositions over these transcribed scheduler records.
-/

namespace HsHVerification.TernH853SameRunAttemptIdentifiability

inductive RunStatus where
  | failed
  | inProgress
  deriving DecidableEq, Repr

structure RunSnapshot where
  runId : String
  scheduledUs : Nat
  startedUs : Nat
  status : RunStatus
  completedUs : Option Nat
  chatRefPresent : Bool
  deriving DecidableEq, Repr

/-- Times are integer microseconds after 2026-11-15T10:00:00Z. -/
def priorSnapshot : RunSnapshot :=
  { runId := "22815188-cdb0-8333-89f3-0b6b997fa694"
    scheduledUs := 1_440_000_000
    startedUs := 1_401_692_103
    status := .failed
    completedUs := some 2_906_338_558
    chatRefPresent := false }

def laterSnapshot : RunSnapshot :=
  { runId := "22815188-cdb0-8333-89f3-0b6b997fa694"
    scheduledUs := 1_440_000_000
    startedUs := 3_080_324_754
    status := .inProgress
    completedUs := none
    chatRefPresent := false }

theorem same_run_id_and_scheduled_slot :
    priorSnapshot.runId = laterSnapshot.runId ∧
    priorSnapshot.scheduledUs = laterSnapshot.scheduledUs := by
  decide

theorem started_at_changed_by_1678632651_microseconds :
    laterSnapshot.startedUs - priorSnapshot.startedUs = 1_678_632_651 := by
  decide

theorem recorded_status_changed_from_failed_to_in_progress :
    priorSnapshot.status = .failed ∧
    laterSnapshot.status = .inProgress ∧
    priorSnapshot.status ≠ laterSnapshot.status := by
  decide

theorem completion_was_cleared :
    priorSnapshot.completedUs.isSome = true ∧
    laterSnapshot.completedUs = none := by
  decide

theorem chat_reference_absent_in_both_snapshots :
    priorSnapshot.chatRefPresent = false ∧
    laterSnapshot.chatRefPresent = false := by
  decide

/-- A hypothetical hidden attempt annotation; this is not an API field. -/
structure AttemptAnnotatedSnapshot where
  attemptOrdinal : Nat
  snapshot : RunSnapshot
  deriving DecidableEq, Repr

/-- The API projection discards the hidden attempt annotation. -/
def expose (x : AttemptAnnotatedSnapshot) : RunSnapshot := x.snapshot

def observedPair : List RunSnapshot := [priorSnapshot, laterSnapshot]

/-- Possible explanation A: both snapshots are assigned to one attempt. -/
def sameAttemptExplanation : List AttemptAnnotatedSnapshot :=
  [ ⟨0, priorSnapshot⟩
  , ⟨0, laterSnapshot⟩
  ]

/-- Possible explanation B: the snapshots are assigned to distinct attempts. -/
def distinctAttemptExplanation : List AttemptAnnotatedSnapshot :=
  [ ⟨0, priorSnapshot⟩
  , ⟨1, laterSnapshot⟩
  ]

theorem same_attempt_explanation_projects_to_observed_pair :
    sameAttemptExplanation.map expose = observedPair := by
  decide

theorem distinct_attempt_explanation_projects_to_observed_pair :
    distinctAttemptExplanation.map expose = observedPair := by
  decide

theorem hidden_attempt_explanations_are_distinct :
    sameAttemptExplanation ≠ distinctAttemptExplanation := by
  decide

/--
The exposed pair is compatible with two distinct hidden attempt assignments.
Consequently, attempt identity is not identifiable from these exposed fields.
-/
theorem attempt_identity_not_identifiable_from_exposed_pair :
    sameAttemptExplanation.map expose =
      distinctAttemptExplanation.map expose ∧
    sameAttemptExplanation ≠ distinctAttemptExplanation := by
  decide

#print axioms same_run_id_and_scheduled_slot
#print axioms started_at_changed_by_1678632651_microseconds
#print axioms recorded_status_changed_from_failed_to_in_progress
#print axioms completion_was_cleared
#print axioms chat_reference_absent_in_both_snapshots
#print axioms same_attempt_explanation_projects_to_observed_pair
#print axioms distinct_attempt_explanation_projects_to_observed_pair
#print axioms hidden_attempt_explanations_are_distinct
#print axioms attempt_identity_not_identifiable_from_exposed_pair

end HsHVerification.TernH853SameRunAttemptIdentifiability
