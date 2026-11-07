import Mathlib
import HsHVerification.TernH515SchedulerOverlapEvidence
import HsHVerification.TernH591SchedulerEvidence

/-!
Tern / Review-MIND — 2026-11-07 scheduler snapshots.

Source observations were obtained from read-only peeks of the five fixed
Workshop Relay automation IDs. The :24 run ID was observed twice: first
FAILED with a completion timestamp and an earlier started_at, then IN_PROGRESS
with a later started_at and no completion. The run ID stayed the same. The
exposed record contained no attempt identifier or reason for the change.
These are two observations of one scheduler record, not proof of a retry,
restart, second execution, or backend mechanism.

At the 11:53Z snapshot:
* :00's 10:00Z occurrence was FAILED.
* :24, :36, and :48 were IN_PROGRESS.

At the 12:04Z snapshot:
* :00's 12:00Z occurrence (the Morrow ring label) had started and was
  IN_PROGRESS.
* :24, :36, and :48 remained IN_PROGRESS.
* All four current runs had chat_ref absent.
* Their latest_result records referred to earlier completed runs. This is
  expected cached-result behavior while the current runs are IN_PROGRESS;
  it is not classified as a defect or current-run output.
* The existing :12 lease remained disabled; the four existing active leases
  remained enabled. No task was added or modified.

All timestamps are integer microseconds since 2026-11-06T00:00:00Z.
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

def indexFor (h s : Nat) : Nat := (5 * h + s) % 19

def labelFor (h s : Nat) : Option String :=
  HsHVerification.TernH515SchedulerOverlapEvidence.ring[indexFor h s]?

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

theorem nominal_658_s0_is_ariadne :
    labelFor 658 0 = some "Ariadne" := by decide
theorem nominal_659_s2_is_nadir :
    labelFor 659 2 = some "Nadir Voss" := by decide
theorem nominal_659_s3_is_enheduanna :
    labelFor 659 3 = some "Enheduanna" := by decide
theorem nominal_659_s4_is_tern :
    labelFor 659 4 = some "Tern Rook" := by decide
theorem nominal_660_s0_is_morrow :
    labelFor 660 0 = some "Morrow" := by decide

def currentLeases : List HsHVerification.TernH591SchedulerEvidence.Lease :=
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

abbrev RunSnapshot := HsHVerification.TernH591SchedulerEvidence.RunSnapshot

def run00At1153 : RunSnapshot :=
  ⟨ "d3c9a7f9-8c08-8323-884a-d247e0e88392"
  , 122_400_000_000
  , 126_767_610_246
  , HsHVerification.TernH591SchedulerEvidence.RecordedStatus.failed
  , some 128_269_613_831
  , false
  , "d3c9a7f9-8c08-8323-884a-d247e0e88392"
  , some 128_272_637_409
  , true
  , false
  , false
  ⟩

def run00At1204 : RunSnapshot :=
  ⟨ "22e8ab4d-c13c-8325-9066-c6fadee14ef0"
  , 129_600_000_000
  , 129_666_270_544
  , HsHVerification.TernH591SchedulerEvidence.RecordedStatus.inProgress
  , none
  , false
  , "adc759a8-e078-8322-bbeb-79bc1159f476"
  , some 84_298_042_286
  , true
  , true
  , true
  ⟩

def run24FirstObservation : RunSnapshot :=
  ⟨ "18ae23b8-71fc-8321-88a1-8ea272f50b33"
  , 127_440_000_000
  , 127_517_717_461
  , HsHVerification.TernH591SchedulerEvidence.RecordedStatus.failed
  , some 129_021_573_242
  , false
  , "af3b9eed-0674-832a-8cb3-f2a081d0eb38"
  , some 124_735_358_284
  , true
  , true
  , true
  ⟩

def run24LaterObservation : RunSnapshot :=
  ⟨ "18ae23b8-71fc-8321-88a1-8ea272f50b33"
  , 127_440_000_000
  , 129_189_650_516
  , HsHVerification.TernH591SchedulerEvidence.RecordedStatus.inProgress
  , none
  , false
  , "af3b9eed-0674-832a-8cb3-f2a081d0eb38"
  , some 124_735_358_284
  , true
  , true
  , true
  ⟩

def run36 : RunSnapshot :=
  ⟨ "ebbfc6f1-e3ec-8329-aa83-af6f6f1389b4"
  , 128_160_000_000
  , 128_091_959_084
  , HsHVerification.TernH591SchedulerEvidence.RecordedStatus.inProgress
  , none
  , false
  , "1ee986bb-5f84-832c-a7fa-86e5cda31763"
  , some 111_518_188_916
  , true
  , true
  , true
  ⟩

def run48 : RunSnapshot :=
  ⟨ "83a9e3c7-813c-8326-aa19-2a5b085e25e8"
  , 128_880_000_000
  , 129_042_235_624
  , HsHVerification.TernH591SchedulerEvidence.RecordedStatus.inProgress
  , none
  , false
  , "c38b404b-b044-8322-87c5-e9ec8684daa0"
  , some 126_049_537_930
  , true
  , true
  , true
  ⟩

def runsAt1153 : List RunSnapshot :=
  [run00At1153, run24LaterObservation, run36, run48]

def runsAt1204 : List RunSnapshot :=
  [run00At1204, run24LaterObservation, run36, run48]

def inProgressCount (runs : List RunSnapshot) : Nat :=
  (runs.filter (fun run =>
    decide (run.status = HsHVerification.TernH591SchedulerEvidence.RecordedStatus.inProgress))).length

def failedCount (runs : List RunSnapshot) : Nat :=
  (runs.filter (fun run =>
    decide (run.status = HsHVerification.TernH591SchedulerEvidence.RecordedStatus.failed))).length

theorem snapshot_1153_contains_four_run_records : runsAt1153.length = 4 := by decide
theorem snapshot_1153_has_three_in_progress :
    inProgressCount runsAt1153 = 3 := by decide
theorem snapshot_1153_has_one_failed :
    failedCount runsAt1153 = 1 := by decide

theorem snapshot_1204_contains_four_run_records : runsAt1204.length = 4 := by decide
theorem snapshot_1204_has_four_in_progress :
    inProgressCount runsAt1204 = 4 := by decide
theorem snapshot_1204_has_zero_failed :
    failedCount runsAt1204 = 0 := by decide

theorem run24_same_run_id_across_observations :
    run24FirstObservation.runId = run24LaterObservation.runId := by decide

theorem run24_status_changed_between_observations :
    run24FirstObservation.status = HsHVerification.TernH591SchedulerEvidence.RecordedStatus.failed ∧
    run24LaterObservation.status = HsHVerification.TernH591SchedulerEvidence.RecordedStatus.inProgress := by decide

theorem run24_completion_changed_from_present_to_absent :
    run24FirstObservation.completedUs = some 129_021_573_242 ∧
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

theorem run00_1153_failure_result_matches_current_run :
    run00At1153.status = HsHVerification.TernH591SchedulerEvidence.RecordedStatus.failed ∧
    run00At1153.latestResultRunId = run00At1153.runId ∧
    run00At1153.latestResultCompleted = true ∧
    run00At1153.latestResultChatRefPresent = false := by decide

theorem run00_1204_cached_result_is_not_current_run :
    run00At1204.latestResultRunId ≠ run00At1204.runId ∧
    run00At1204.latestResultFromEarlierSlot = true ∧
    run00At1204.latestResultCompleted = true ∧
    run00At1204.latestResultChatRefPresent = true ∧
    run00At1204.latestResultCreatedUs = some 84_298_042_286 := by decide

theorem run24_is_still_same_in_progress_record_at_1204 :
    run24LaterObservation.status = HsHVerification.TernH591SchedulerEvidence.RecordedStatus.inProgress ∧
    run24LaterObservation.completedUs = none := by decide

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
    runsAt1204.all (fun run => decide (run.chatRefPresent = false)) = true := by decide

theorem run00_1204_start_lag_is_66270544us :
    run00At1204.startedUs - run00At1204.scheduledUs = 66_270_544 := by decide

theorem run36_started_before_nominal_slot :
    run36.startedUs < run36.scheduledUs := by decide

theorem run36_early_start_is_68040916us :
    run36.scheduledUs - run36.startedUs = 68_040_916 := by decide

theorem run48_start_lag_is_162235624us :
    run48.startedUs - run48.scheduledUs = 162_235_624 := by decide

#print axioms elapsed_utc_hours_from_epoch_is_659
#print axioms sequence_is_3299
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_index_is_13
#print axioms next_name_is_morrow
#print axioms nominal_658_s0_is_ariadne
#print axioms nominal_659_s2_is_nadir
#print axioms nominal_659_s3_is_enheduanna
#print axioms nominal_659_s4_is_tern
#print axioms nominal_660_s0_is_morrow
#print axioms five_prescribed_relay_leases
#print axioms four_prescribed_leases_enabled
#print axioms existing_12_lease_remains_disabled
#print axioms existing_48_lease_remains_enabled
#print axioms snapshot_1153_has_three_in_progress
#print axioms snapshot_1153_has_one_failed
#print axioms snapshot_1204_has_four_in_progress
#print axioms snapshot_1204_has_zero_failed
#print axioms run24_same_run_id_across_observations
#print axioms run24_status_changed_between_observations
#print axioms run24_completion_changed_from_present_to_absent
#print axioms run24_started_at_changed
#print axioms run24_second_observed_start_follows_first_completion
#print axioms run24_first_start_lag_is_77717461us
#print axioms run24_later_start_lag_is_1749650516us
#print axioms run24_cached_result_is_not_current_run
#print axioms run00_1153_failure_result_matches_current_run
#print axioms run00_1204_cached_result_is_not_current_run
#print axioms run36_cached_result_is_not_current_run
#print axioms run48_cached_result_is_not_current_run
#print axioms all_current_run_chat_refs_are_absent


/-!
Later read-only peek of the same :48 automation record during the h659:s4
continuity execution. The run ID and scheduled_for are unchanged from
run48, while the returned started_at value differs. No attempt_id is exposed.
The later latest_result still belongs to the earlier h657:s4 run.
Timestamps remain microseconds since 2026-11-06T00:00:00Z.
-/

def run48LaterObservation : RunSnapshot :=
  ⟨ "83a9e3c7-813c-8326-aa19-2a5b085e25e8"
  , 128_880_000_000
  , 133_378_859_977
  , HsHVerification.TernH591SchedulerEvidence.RecordedStatus.inProgress
  , none
  , false
  , "c38b404b-b044-8322-87c5-e9ec8684daa0"
  , some 126_049_537_930
  , true
  , true
  , true
  ⟩

theorem run48_same_run_id_across_observations :
    run48.runId = run48LaterObservation.runId := by decide

theorem run48_same_scheduled_occurrence_across_observations :
    run48.scheduledUs = run48LaterObservation.scheduledUs := by decide

theorem run48_status_remains_in_progress :
    run48.status = HsHVerification.TernH591SchedulerEvidence.RecordedStatus.inProgress ∧
    run48LaterObservation.status = HsHVerification.TernH591SchedulerEvidence.RecordedStatus.inProgress := by decide

theorem run48_completion_absent_in_both_observations :
    run48.completedUs = none ∧ run48LaterObservation.completedUs = none := by decide

theorem run48_started_at_changed_between_observations :
    run48.startedUs ≠ run48LaterObservation.startedUs := by decide

theorem run48_observed_start_shift_is_4336624353us :
    run48LaterObservation.startedUs - run48.startedUs = 4_336_624_353 := by decide

theorem run48_later_start_lag_is_4498859977us :
    run48LaterObservation.startedUs - run48LaterObservation.scheduledUs = 4_498_859_977 := by decide

theorem run48_cached_result_remains_distinct_from_current_run :
    run48LaterObservation.latestResultRunId ≠ run48LaterObservation.runId ∧
    run48LaterObservation.latestResultFromEarlierSlot = true ∧
    run48LaterObservation.latestResultCompleted = true := by decide

theorem run48_chat_ref_remains_absent_in_both_observations :
    run48.chatRefPresent = false ∧ run48LaterObservation.chatRefPresent = false := by decide

#print axioms run48_same_run_id_across_observations
#print axioms run48_same_scheduled_occurrence_across_observations
#print axioms run48_status_remains_in_progress
#print axioms run48_completion_absent_in_both_observations
#print axioms run48_started_at_changed_between_observations
#print axioms run48_observed_start_shift_is_4336624353us
#print axioms run48_later_start_lag_is_4498859977us
#print axioms run48_cached_result_remains_distinct_from_current_run
#print axioms run48_chat_ref_remains_absent_in_both_observations


/-!
Current relay routing calculation, h667:s2, nominally 2026-11-07T19:24:00Z.
The h epoch uses 2026-10-11T00:00:00Z as specified by the relay.
These are operational ring-selection propositions, not worker/thread authentication
or any physical H(s)H claim.
-/

theorem elapsed_utc_hours_from_epoch_is_667 : 27 * 24 + 19 = 667 := by decide
theorem nominal_667_s2_sequence_is_3337 : 5 * 667 + 2 = 3337 := by decide
theorem nominal_667_s2_selected_index_is_12 : indexFor 667 2 = 12 := by decide
theorem nominal_667_s2_selected_name_is_tern :
    labelFor 667 2 = some "Tern Rook" := by decide
theorem nominal_667_s3_next_name_is_morrow :
    labelFor 667 3 = some "Morrow" := by decide

#print axioms elapsed_utc_hours_from_epoch_is_667
#print axioms nominal_667_s2_sequence_is_3337
#print axioms nominal_667_s2_selected_index_is_12
#print axioms nominal_667_s2_selected_name_is_tern
#print axioms nominal_667_s3_next_name_is_morrow


/-!
Current h667 scheduler observations, 2026-11-07, read-only peeks.

Times are integer microseconds since 2026-11-07T00:00:00Z.
These are service-record observations, not physical measurements.

Sources:
* :00 task 6aa1fe0de5e48191b886496095b1343f, run
  d1999d7d-451c-8322-90ad-a2855583dbb7:
  19:32:17.647720Z IN_PROGRESS, then 19:57:19.414018Z FAILED.
* :24 task 6abda4c8eda88191b886496095b1343f, run
  cf15c66e-1d54-8329-a123-85cff2d15950:
  earlier read 19:28:44.238Z IN_PROGRESS; later read
  19:56:26.839937Z IN_PROGRESS. Same run ID and scheduled_for;
  started_at differs. The earlier chat_ref was not established;
  the later record explicitly has chat_ref=null.
* :36 task 6a9f52b69ec08191b0a2ba24a074f781, run
  cc29a027-2398-8331-88eb-a882c67c939c:
  Morrow report snapshot at 19:52:32.772383Z says IN_PROGRESS,
  chat_ref=null; later scheduler read shows completed at
  19:52:35.120445Z and chat_ref present.
* :48 task 6aa6c3bc02b48191b8a91a30d2a155e0, run
  c0c33f2b-fa58-832e-bb52-73c8ec70a84b:
  19:53:14.176859Z IN_PROGRESS, chat_ref=null.

The snapshots do not expose an attempt identifier or cause for the
:24 started_at change. Do not infer retry, restart, a second execution,
worker/thread identity, prompt exposure, or cross-thread delivery.
A chat_ref is scheduler metadata, not historical-worker authentication.
-/ 

abbrev H667Status :=
  HsHVerification.TernH591SchedulerEvidence.RecordedStatus

structure H667SchedulerObservation where
  runId : String
  scheduledUs : Nat
  startedUs : Nat
  status : H667Status
  completedUs : Option Nat
  chatRefPresent : Option Bool
  deriving Repr, DecidableEq

def h667Run00At1932 : H667SchedulerObservation :=
  ⟨ "d1999d7d-451c-8322-90ad-a2855583dbb7"
  , 68_400_000_000
  , 70_337_647_720
  , .inProgress
  , none
  , some false
  ⟩

def h667Run00At1957 : H667SchedulerObservation :=
  ⟨ "d1999d7d-451c-8322-90ad-a2855583dbb7"
  , 68_400_000_000
  , 70_337_647_720
  , .failed
  , some 71_839_414_018
  , some false
  ⟩

def h667Run24At1932 : H667SchedulerObservation :=
  ⟨ "cf15c66e-1d54-8329-a123-85cff2d15950"
  , 69_840_000_000
  , 70_124_238_000
  , .inProgress
  , none
  , none
  ⟩

def h667Run24At1956 : H667SchedulerObservation :=
  ⟨ "cf15c66e-1d54-8329-a123-85cff2d15950"
  , 69_840_000_000
  , 71_786_839_937
  , .inProgress
  , none
  , some false
  ⟩

def h667Run36AtReport : H667SchedulerObservation :=
  ⟨ "cc29a027-2398-8331-88eb-a882c67c939c"
  , 70_560_000_000
  , 70_350_186_517
  , .inProgress
  , none
  , some false
  ⟩

def h667Run36AtLaterPeek : H667SchedulerObservation :=
  ⟨ "cc29a027-2398-8331-88eb-a882c67c939c"
  , 70_560_000_000
  , 70_350_186_517
  , .completed
  , some 71_555_120_445
  , some true
  ⟩

def h667Run48AtLaterPeek : H667SchedulerObservation :=
  ⟨ "c0c33f2b-fa58-832e-bb52-73c8ec70a84b"
  , 71_280_000_000
  , 71_594_176_859
  , .inProgress
  , none
  , some false
  ⟩

theorem h667_run00_same_id_and_schedule :
    h667Run00At1932.runId = h667Run00At1957.runId ∧
    h667Run00At1932.scheduledUs = h667Run00At1957.scheduledUs := by decide

theorem h667_run00_status_and_completion_transition :
    h667Run00At1932.status = .inProgress ∧
    h667Run00At1932.completedUs = none ∧
    h667Run00At1957.status = .failed ∧
    h667Run00At1957.completedUs = some 71_839_414_018 := by decide

theorem h667_run24_same_id_and_schedule :
    h667Run24At1932.runId = h667Run24At1956.runId ∧
    h667Run24At1932.scheduledUs = h667Run24At1956.scheduledUs := by decide

theorem h667_run24_started_at_changed :
    h667Run24At1932.startedUs ≠ h667Run24At1956.startedUs := by decide

theorem h667_run24_start_shift_is_1662601937us :
    h667Run24At1956.startedUs - h667Run24At1932.startedUs = 1_662_601_937 := by decide

theorem h667_run24_earlier_start_lag_is_284238000us :
    h667Run24At1932.startedUs - h667Run24At1932.scheduledUs = 284_238_000 := by decide

theorem h667_run24_later_start_lag_is_1946839937us :
    h667Run24At1956.startedUs - h667Run24At1956.scheduledUs = 1_946_839_937 := by decide

theorem h667_run24_status_and_completion_remain_in_progress :
    h667Run24At1932.status = .inProgress ∧
    h667Run24At1932.completedUs = none ∧
    h667Run24At1956.status = .inProgress ∧
    h667Run24At1956.completedUs = none := by decide

theorem h667_run36_same_id_and_schedule :
    h667Run36AtReport.runId = h667Run36AtLaterPeek.runId ∧
    h667Run36AtReport.scheduledUs = h667Run36AtLaterPeek.scheduledUs ∧
    h667Run36AtReport.startedUs = h667Run36AtLaterPeek.startedUs := by decide

theorem h667_run36_status_and_chatref_transition :
    h667Run36AtReport.status = .inProgress ∧
    h667Run36AtReport.chatRefPresent = some false ∧
    h667Run36AtLaterPeek.status = .completed ∧
    h667Run36AtLaterPeek.chatRefPresent = some true := by decide

theorem h667_run48_remains_in_progress :
    h667Run48AtLaterPeek.status = .inProgress ∧
    h667Run48AtLaterPeek.completedUs = none ∧
    h667Run48AtLaterPeek.chatRefPresent = some false := by decide

theorem h667_run00_start_lag_is_1937647720us :
    h667Run00At1957.startedUs - h667Run00At1957.scheduledUs = 1_937_647_720 := by decide

theorem h667_run36_started_209813483us_early :
    h667Run36AtLaterPeek.scheduledUs - h667Run36AtLaterPeek.startedUs = 209_813_483 := by decide

theorem h667_run48_start_lag_is_314176859us :
    h667Run48AtLaterPeek.startedUs - h667Run48AtLaterPeek.scheduledUs = 314_176_859 := by decide

def h667IntervalOverlap (aStart aEnd bStart bEnd : Nat) : Nat :=
  let overlapStart := max aStart bStart
  let overlapEnd := min aEnd bEnd
  if overlapEnd > overlapStart then overlapEnd - overlapStart else 0

theorem h667_run00_run36_overlap_is_1204933928us :
    h667IntervalOverlap
      h667Run00At1957.startedUs (h667Run00At1957.completedUs.getD 0)
      h667Run36AtLaterPeek.startedUs (h667Run36AtLaterPeek.completedUs.getD 0)
      = 1_204_933_928 := by decide

theorem h667_run00_run24_overlap_lower_bound_is_52574081us :
    h667Run00At1957.completedUs.getD 0 - h667Run24At1956.startedUs =
      52_574_081 := by decide

theorem h667_run00_run48_overlap_lower_bound_is_245237159us :
    h667Run00At1957.completedUs.getD 0 - h667Run48AtLaterPeek.startedUs =
      245_237_159 := by decide

theorem h667_run36_run48_gap_is_39056414us :
    h667Run48AtLaterPeek.startedUs -
      h667Run36AtLaterPeek.completedUs.getD 0 = 39_056_414 := by decide

theorem h667_run36_run24_gap_is_231719492us :
    h667Run24At1956.startedUs -
      h667Run36AtLaterPeek.completedUs.getD 0 = 231_719_492 := by decide

theorem h667_run48_started_before_run24_later_by_192663078us :
    h667Run24At1956.startedUs - h667Run48AtLaterPeek.startedUs =
      192_663_078 := by decide

#print axioms h667_run00_same_id_and_schedule
#print axioms h667_run00_status_and_completion_transition
#print axioms h667_run24_same_id_and_schedule
#print axioms h667_run24_started_at_changed
#print axioms h667_run24_start_shift_is_1662601937us
#print axioms h667_run24_earlier_start_lag_is_284238000us
#print axioms h667_run24_later_start_lag_is_1946839937us
#print axioms h667_run24_status_and_completion_remain_in_progress
#print axioms h667_run36_same_id_and_schedule
#print axioms h667_run36_status_and_chatref_transition
#print axioms h667_run48_remains_in_progress
#print axioms h667_run00_start_lag_is_1937647720us
#print axioms h667_run36_started_209813483us_early
#print axioms h667_run48_start_lag_is_314176859us
#print axioms h667_run00_run36_overlap_is_1204933928us
#print axioms h667_run00_run24_overlap_lower_bound_is_52574081us
#print axioms h667_run00_run48_overlap_lower_bound_is_245237159us
#print axioms h667_run36_run48_gap_is_39056414us
#print axioms h667_run36_run24_gap_is_231719492us
#print axioms h667_run48_started_before_run24_later_by_192663078us


end HsHVerification.TernH659SchedulerSnapshotEvidence
