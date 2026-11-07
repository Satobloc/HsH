import Mathlib
import HsHVerification.TernH515SchedulerOverlapEvidence
import HsHVerification.TernH591SchedulerEvidence

/-!
Tern / Review-MIND — 2026-11-07 nominal :48 scheduler snapshot.

Source observations were obtained from read-only peeks of the five existing
Workshop Relay automation IDs. The current :24 run ID was observed twice
during this activation: first FAILED with a completion timestamp and an
earlier started_at, then IN_PROGRESS with a later started_at and no completion.
The run ID stayed the same. The exposed record contained no attempt identifier
or reason for the change. These are two observations of one scheduler record,
not proof of a retry, restart, second execution, or backend mechanism.

At the later snapshot:
* :00 was FAILED; its latest_result run ID matched its current run ID.
* :24, :36, and :48 were IN_PROGRESS, with chat_ref absent.
* Their latest_result run IDs referred to earlier completed runs with
  non-null chat references. Those cached results are not outputs of the
  current in-progress runs.
* All four existing active leases remained enabled. The existing :12 lease
  remained disabled. No task was added or modified.

All timestamps are integer microseconds since 2026-11-07T00:00:00Z.
This module proves only finite arithmetic and record-equality propositions
over these transcribed API observations and the user-supplied fixed ring.
It does not prove scheduler API truth, backend semantics, attempt identity,
the cause of the same-run record change, worker/thread identity, delivery,
recipient exposure, or any physical H(s)H proposition.
-/

namespace HsHVerification.TernH659SchedulerSnapshotEvidence

def nominalHour : Nat := 659
def slot : Nat := 4
def sequence : Nat := 5 * nominalHour + slot
def selectedIndex : Nat := sequence % 19
def nextIndex : Nat := (sequence + 1) % 19

theorem elapsed_utc_hours_from_epoch_is_659 : 27 * 24 + 11 = nominalHour := by decide
theorem sequence_is_3299 : sequence = 3299 := by decide
theorem selected_index_is_12 : selectedIndex = 12 := by decide
theorem selected_name_is_tern :
    HsHVerification.TernH515SchedulerOverlapEvidence.ring[selectedIndex]? =
      some "Tern Rook" := by decide
theorem next_index_is_13 : nextIndex = 13 := by decide
theorem next_name_is_morrow :
    HsHVerification.TernH515SchedulerOverlapEvidence.ring[nextIndex]? =
      some "Morrow" := by decide

open HsHVerification.TernH591SchedulerEvidence

def currentLeases : List Lease :=
  [ ⟨":00", "6aa1fe0de5e48191b886496095b1343f", true⟩
  , ⟨":12", "6aa61b3b2e4081918927a35b61007acc", false⟩
  , ⟨":24", "6abda4c8eda88191bf23a6f2849e9a17", true⟩
  , ⟨":36", "6a9f52b69ec08191b0a2ba24a074f781", true⟩
  , ⟨":48", "6aa6c3bc02b48191b8a91a30d2a155e0", true⟩
  ]

def currentEnabledCount : Nat :=
  (currentLeases.filter (fun lease => lease.enabled)).length

def currentLeaseEnabled (phase : String) : Option Bool :=
  (currentLeases.find? (fun lease => lease.phase == phase)).map
    (fun lease => lease.enabled)

theorem five_prescribed_relay_leases : currentLeases.length = 5 := by decide
theorem four_prescribed_leases_enabled : currentEnabledCount = 4 := by decide
theorem existing_12_lease_remains_disabled :
    currentLeaseEnabled ":12" = some false := by decide
theorem existing_48_lease_remains_enabled :
    currentLeaseEnabled ":48" = some true := by decide

def run00 : RunSnapshot :=
  ⟨ "d3c9a7f9-8c08-8323-884a-d247e0e88392"
  , 36_000_000_000
  , 40_367_610_246
  , .failed
  , some 41_869_613_831
  , false
  , "d3c9a7f9-8c08-8323-884a-d247e0e88392"
  , some 41_872_637_409
  , true
  , false
  , false
  ⟩

def run24FirstObservation : RunSnapshot :=
  ⟨ "18ae23b8-71fc-8321-88a1-8ea272f50b33"
  , 41_040_000_000
  , 41_117_717_461
  , .failed
  , some 42_621_573_242
  , false
  , "af3b9eed-0674-832a-8cb3-f2a081d0eb38"
  , some 38_335_358_284
  , true
  , true
  , true
  ⟩

def run24LaterObservation : RunSnapshot :=
  ⟨ "18ae23b8-71fc-8321-88a1-8ea272f50b33"
  , 41_040_000_000
  , 42_789_650_516
  , .inProgress
  , none
  , false
  , "af3b9eed-0674-832a-8cb3-f2a081d0eb38"
  , some 38_335_358_284
  , true
  , true
  , true
  ⟩

def run36 : RunSnapshot :=
  ⟨ "ebbfc6f1-e3ec-8329-aa83-af6f6f1389b4"
  , 41_760_000_000
  , 41_691_959_084
  , .inProgress
  , none
  , false
  , "1ee986bb-5f84-832c-a7fa-86e5cda31763"
  , some 25_118_188_916
  , true
  , true
  , true
  ⟩

def run48 : RunSnapshot :=
  ⟨ "83a9e3c7-813c-8326-aa19-2a5b085e25e8"
  , 42_480_000_000
  , 42_642_235_624
  , .inProgress
  , none
  , false
  , "c38b404b-b044-8322-87c5-e9ec8684daa0"
  , some 39_649_537_930
  , true
  , true
  , true
  ⟩

def currentRuns : List RunSnapshot := [run00, run24LaterObservation, run36, run48]

def inProgressCount : Nat :=
  (currentRuns.filter (fun run =>
    decide (run.status = RecordedStatus.inProgress))).length

def failedCount : Nat :=
  (currentRuns.filter (fun run =>
    decide (run.status = RecordedStatus.failed))).length

theorem current_snapshot_contains_four_run_records : currentRuns.length = 4 := by decide
theorem current_snapshot_has_three_in_progress : inProgressCount = 3 := by decide
theorem current_snapshot_has_one_failed : failedCount = 1 := by decide

theorem run24_same_run_id_across_observations :
    run24FirstObservation.runId = run24LaterObservation.runId := by decide

theorem run24_status_changed_between_observations :
    run24FirstObservation.status = RecordedStatus.failed ∧
    run24LaterObservation.status = RecordedStatus.inProgress := by decide

theorem run24_completion_changed_from_present_to_absent :
    run24FirstObservation.completedUs = some 42_621_573_242 ∧
    run24LaterObservation.completedUs = none := by decide

theorem run24_started_at_changed :
    run24FirstObservation.startedUs ≠ run24LaterObservation.startedUs := by decide

theorem run24_second_observed_start_follows_first_completion :
    run24LaterObservation.startedUs -
      run24FirstObservation.completedUs.getD 0 = 168_077_274 := by decide

theorem run24_first_start_lag_is_77717461us :
    run24FirstObservation.startedUs -
      run24FirstObservation.scheduledUs = 77_717_461 := by decide

theorem run24_later_start_lag_is_1749650516us :
    run24LaterObservation.startedUs -
      run24LaterObservation.scheduledUs = 1_749_650_516 := by decide

theorem run24_cached_result_is_not_current_run :
    run24LaterObservation.latestResultRunId ≠
      run24LaterObservation.runId ∧
    run24LaterObservation.latestResultFromEarlierSlot = true ∧
    run24LaterObservation.latestResultCompleted = true ∧
    run24LaterObservation.latestResultChatRefPresent = true := by decide

theorem run24_cached_result_precedes_current_slot :
    run24LaterObservation.latestResultCreatedUs =
      some 38_335_358_284 ∧
    38_335_358_284 < run24LaterObservation.scheduledUs := by decide

theorem run00_failure_result_matches_current_run :
    run00.status = RecordedStatus.failed ∧
    run00.latestResultRunId = run00.runId ∧
    run00.latestResultCompleted = true ∧
    run00.latestResultChatRefPresent = false := by decide

theorem run36_cached_result_is_not_current_run :
    run36.latestResultRunId ≠ run36.runId ∧
    run36.latestResultFromEarlierSlot = true ∧
    run36.latestResultCompleted = true ∧
    run36.latestResultChatRefPresent = true := by decide

theorem run48_cached_result_is_not_current_run :
    run48.latestResultRunId ≠ run48.runId ∧
    run48.latestResultFromEarlierSlot = true ∧
    run48.latestResultCompleted = true ∧
    run48.latestResultChatRefPresent = true := by decide

theorem all_current_run_chat_refs_are_absent :
    currentRuns.all (fun run => decide (run.chatRefPresent = false)) = true := by decide

theorem run36_started_before_nominal_slot :
    run36.startedUs < run36.scheduledUs := by decide

theorem run48_started_after_nominal_slot :
    run48.startedUs > run48.scheduledUs := by decide

#print axioms elapsed_utc_hours_from_epoch_is_659
#print axioms sequence_is_3299
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_index_is_13
#print axioms next_name_is_morrow
#print axioms five_prescribed_relay_leases
#print axioms four_prescribed_leases_enabled
#print axioms existing_12_lease_remains_disabled
#print axioms existing_48_lease_remains_enabled
#print axioms current_snapshot_has_three_in_progress
#print axioms current_snapshot_has_one_failed
#print axioms run24_same_run_id_across_observations
#print axioms run24_status_changed_between_observations
#print axioms run24_completion_changed_from_present_to_absent
#print axioms run24_started_at_changed
#print axioms run24_second_observed_start_follows_first_completion
#print axioms run24_first_start_lag_is_77717461us
#print axioms run24_later_start_lag_is_1749650516us
#print axioms run24_cached_result_is_not_current_run
#print axioms run00_failure_result_matches_current_run
#print axioms run36_cached_result_is_not_current_run
#print axioms run48_cached_result_is_not_current_run
#print axioms all_current_run_chat_refs_are_absent

end HsHVerification.TernH659SchedulerSnapshotEvidence
