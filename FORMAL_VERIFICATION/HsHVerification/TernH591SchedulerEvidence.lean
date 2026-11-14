import Mathlib
import HsHVerification.TernH515SchedulerOverlapEvidence

/-!
Tern Rook / Comptroller — 2026-11-04T15:41Z scheduler snapshot.

This module records the live automation API observations for the five fixed
Workshop Relay leases. Time values are integer microseconds since
2026-11-04T13:00:00Z. The :36 record was observed in two successive peeks:
the same run ID first appeared failed/completed, then appeared in_progress
with a changed started_at and no completion timestamp. This module proves
only finite propositions over those transcribed observations. It does not
prove why the API record changed, backend scheduling semantics, future
dispatch, historical ChatGPT identity, or any physical H(s)H proposition.

The :24 latest_result belongs to an older Kestrel run, not the current Tern
run. The :36 latest_result carries the same run ID but its creation timestamp
precedes the later started_at record. These are deliberately represented as
different identity/time relations, not collapsed into a single success flag.
-/

namespace HsHVerification.TernH591SchedulerEvidence

open HsHVerification.TernH515SchedulerOverlapEvidence

def nominalHour : Nat := 591
def slot : Nat := 2
def sequence : Nat := 5 * nominalHour + slot
def selectedIndex : Nat := sequence % 19
def nextIndex : Nat := (sequence + 1) % 19

theorem nominal_hour_is_591 : nominalHour = 591 := by decide
theorem sequence_is_2957 : sequence = 2957 := by decide
theorem selected_index_is_12 : selectedIndex = 12 := by decide
theorem selected_name_is_tern :
    ring[selectedIndex]? = some "Tern Rook" := by decide
theorem next_index_is_13 : nextIndex = 13 := by decide
theorem next_name_is_morrow :
    ring[nextIndex]? = some "Morrow" := by decide

structure Lease where
  phase : String
  taskId : String
  enabled : Bool
  deriving Repr, DecidableEq

def leases : List Lease :=
  [ ⟨":00", "6aa1fe0de5e48191b886496095b1343f", true⟩
  , ⟨":12", "6aa61b3b2e4081918927a35b61007acc", false⟩
  , ⟨":24", "6abda4c8eda88191bf23a6f2849e9a17", true⟩
  , ⟨":36", "6a9f52b69ec08191b0a2ba24a074f781", true⟩
  , ⟨":48", "6aa6c3bc02b48191b8a91a30d2a155e0", true⟩
  ]

def enabledCount : Nat :=
  (leases.filter (fun lease => lease.enabled)).length

def leaseEnabled (phase : String) : Option Bool :=
  (leases.find? (fun lease => lease.phase == phase)).map (fun lease => lease.enabled)

theorem exactly_five_fixed_lease_ids : leases.length = 5 := by decide
theorem exactly_four_leases_enabled : enabledCount = 4 := by decide
theorem existing_12_lease_is_disabled : leaseEnabled ":12" = some false := by decide
theorem existing_24_lease_is_enabled : leaseEnabled ":24" = some true := by decide

inductive RecordedStatus where
  | completed
  | failed
  | inProgress
  deriving Repr, DecidableEq

structure RunSnapshot where
  runId : String
  scheduledUs : Nat
  startedUs : Nat
  status : RecordedStatus
  completedUs : Option Nat
  chatRefPresent : Bool
  latestResultRunId : String
  latestResultCreatedUs : Option Nat
  latestResultCompleted : Bool
  latestResultChatRefPresent : Bool
  latestResultFromEarlierSlot : Bool
  deriving Repr, DecidableEq

def run00 : RunSnapshot :=
  ⟨ "0b6bea9c-a1f4-8329-993f-b1853398dfa3"
  , 3_600_000_000
  , 7_075_900_453
  , .completed
  , some 7_625_009_146
  , true
  , "0b6bea9c-a1f4-8329-993f-b1853398dfa3"
  , some 7_623_341_705
  , true
  , true
  , false
  ⟩

def run24 : RunSnapshot :=
  ⟨ "c5eba963-e9ec-8327-9339-29dfeb701f13"
  , 8_640_000_000
  , 9_075_339_310
  , .inProgress
  , none
  , false
  , "aafe8c20-ccf8-8324-b271-85d78499b4a4"
  , none
  , true
  , true
  , true
  ⟩

def run36 : RunSnapshot :=
  ⟨ "3eaaeb2f-b4fc-8324-865a-7ebe6dca5eab"
  , 5_760_000_000
  , 9_245_344_100
  , .inProgress
  , none
  , false
  , "3eaaeb2f-b4fc-8324-865a-7ebe6dca5eab"
  , some 8_998_382_873
  , false
  , false
  , false
  ⟩

def run48 : RunSnapshot :=
  ⟨ "c51cede1-cab4-832a-94a1-8c6afb99d947"
  , 2_880_000_000
  , 8_249_979_495
  , .completed
  , some 9_636_031_265
  , true
  , "c51cede1-cab4-832a-94a1-8c6afb99d947"
  , some 9_452_641_275
  , true
  , true
  , false
  ⟩

-- The :36 API record changed between peeks for the same run ID.
def run36InitialStatus : RecordedStatus := .failed
def run36InitialStartedUs : Nat := 7_497_394_113
def run36InitialCompletedUs : Option Nat := some 9_000_000_000
def run36FinalCompletedUs : Option Nat := none

theorem all_four_current_starts_after_nominal :
    run00.startedUs > run00.scheduledUs ∧
    run24.startedUs > run24.scheduledUs ∧
    run36.startedUs > run36.scheduledUs ∧
    run48.startedUs > run48.scheduledUs := by decide

theorem run00_start_lag_is_3475900453us :
    run00.startedUs - run00.scheduledUs = 3_475_900_453 := by decide

theorem run24_start_lag_is_435339310us :
    run24.startedUs - run24.scheduledUs = 435_339_310 := by decide

theorem run36_final_start_lag_is_3485344100us :
    run36.startedUs - run36.scheduledUs = 3_485_344_100 := by decide

theorem run48_start_lag_is_5369979495us :
    run48.startedUs - run48.scheduledUs = 5_369_979_495 := by decide

theorem current_24_is_in_progress_without_current_chat_ref :
    run24.status = .inProgress ∧ run24.completedUs = none ∧
    run24.chatRefPresent = false := by decide

theorem current_24_latest_result_is_stale_and_has_old_chat_ref :
    run24.latestResultRunId ≠ run24.runId ∧
    run24.latestResultFromEarlierSlot = true ∧
    run24.latestResultCompleted = true ∧
    run24.latestResultChatRefPresent = true := by decide

theorem run36_record_changed_between_peeks :
    run36InitialStatus = .failed ∧
    run36.status = .inProgress ∧
    run36InitialStartedUs ≠ run36.startedUs ∧
    run36InitialCompletedUs.isSome = true ∧
    run36FinalCompletedUs.isNone = true := by decide

theorem run36_start_timestamp_shift_is_1747949987us :
    run36.startedUs - run36InitialStartedUs = 1_747_949_987 := by decide

theorem run36_result_creation_precedes_final_started_at :
    run36.latestResultCreatedUs = some 8_998_382_873 ∧
    (run36.latestResultCreatedUs.getD 0) < run36.startedUs := by decide

theorem run36_same_id_result_exists_while_current_record_in_progress :
    run36.latestResultRunId = run36.runId ∧
    run36.latestResultCompleted = false ∧
    run36.status = .inProgress ∧
    run36.completedUs = none ∧
    run36.chatRefPresent = false := by decide

theorem run48_completed_with_same_run_result_and_chat_ref :
    run48.status = .completed ∧
    run48.completedUs = some 9_636_031_265 ∧
    run48.latestResultRunId = run48.runId ∧
    run48.latestResultCompleted = true ∧
    run48.chatRefPresent = true := by decide

#print axioms nominal_hour_is_591
#print axioms sequence_is_2957
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_index_is_13
#print axioms next_name_is_morrow
#print axioms exactly_five_fixed_lease_ids
#print axioms exactly_four_leases_enabled
#print axioms existing_12_lease_is_disabled
#print axioms existing_24_lease_is_enabled
#print axioms all_four_current_starts_after_nominal
#print axioms run00_start_lag_is_3475900453us
#print axioms run24_start_lag_is_435339310us
#print axioms run36_final_start_lag_is_3485344100us
#print axioms run48_start_lag_is_5369979495us
#print axioms current_24_is_in_progress_without_current_chat_ref
#print axioms current_24_latest_result_is_stale_and_has_old_chat_ref
#print axioms run36_record_changed_between_peeks
#print axioms run36_start_timestamp_shift_is_1747949987us
#print axioms run36_result_creation_precedes_final_started_at
#print axioms run36_same_id_result_exists_while_current_record_in_progress
#print axioms run48_completed_with_same_run_result_and_chat_ref

end HsHVerification.TernH591SchedulerEvidence
