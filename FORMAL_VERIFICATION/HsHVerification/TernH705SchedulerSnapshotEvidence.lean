import Mathlib
import HsHVerification.TernH515SchedulerOverlapEvidence

/-!
Tern Rook / Comptroller — 2026-11-09 nominal 09:24Z (:24) occurrence.

This is a bounded formalization of the user-specified 19-name rotation and
actual read-only scheduler API observations. It is NOT a physical model or
physical measurement.

Nominal UTC hour:
  2026-10-11T00:00:00Z -> 2026-11-09T09:00:00Z = 705 hours.
The selected :24 run is h=705, s=2. Its scheduled_for field, not its later
started_at field, determines the rotation label.

Two readbacks must be kept distinct.

Initial readback, after the :24 run began:
  :00 h705 run 78e8852d-bdac-8322-aab2-18f8283a4d70
      scheduled 09:00:00Z; started 09:59:46.833099Z;
      failed/completed 10:02:32.557527Z; chat_ref=null;
      latest_result points to this same run.
  :36 latest exposed run ef0a0fc9-5360-8326-a931-1477cfe35b12
      scheduled 08:36:00Z (h704:s3); started 09:33:33.816587Z;
      failed/completed 09:58:37.805795Z; chat_ref=null;
      latest_result was stale h700 Calder run f7379c01-874c-8322-89d6-483e208e303b.
  :48 h705 run a4f94d0f-7624-832e-9854-794c4d35407c
      scheduled 09:48:00Z; started 10:23:05.272566Z;
      IN_PROGRESS; completed_at=null; chat_ref=null;
      latest_result belongs to older h704 Elias run
      99865281-9260-8323-a5b3-209324d2a0a2.
  :24 h705 run 6b9b177a-4688-8329-9053-a6fabcced935
      scheduled 09:24:00Z; started 10:26:32.063120Z;
      IN_PROGRESS; completed_at=null; chat_ref=null;
      latest_result belongs to older h702 Mercer run
      c4da66d1-ae84-8330-81cf-76991624d75f.

Later readback:
  :36 h705:s3 run fcfaf452-9484-832a-bd4d-0f9032f5915d
      scheduled 10:36:00Z; started 10:37:28.557540Z;
      IN_PROGRESS; completed_at=null; chat_ref=null;
      latest_result still points to h700 Calder run
      f7379c01-874c-8322-89d6-483e208e303b.
  :00, :24, and :48 records remained as above.

The :36 task's last_run_time field still showed 09:58:39.408887Z
after the newer h705 run had started. This field mismatch is recorded,
not interpreted. The connector exposes no attempt ID/history in these
snapshots. A changed/delayed field does not establish retry, restart,
duplicate execution, or backend cause. A cached latest_result is not
current-run output.

Times below are integer microseconds after 2026-11-09T08:00:00Z.
Lean checks only the closed arithmetic and finite propositions over these
transcribed observations and the supplied ring. It does not authenticate
the scheduler service, prove the transcription sound, establish delivery
or historical worker identity, explain scheduler behavior, validate any
physical premise, or prove an H(s)H proposition.
-/

namespace HsHVerification.TernH705SchedulerSnapshotEvidence

def ringNames : List String :=
  HsHVerification.TernH515SchedulerOverlapEvidence.ring

def nominalHour : Nat := 705
def slot : Nat := 2
def sequence : Nat := 5 * nominalHour + slot
def selectedIndex : Nat := sequence % 19
def nextIndex : Nat := (sequence + 1) % 19

def indexFor (h s : Nat) : Nat := (5 * h + s) % 19

theorem utc_elapsed_hours_is_705 : 29 * 24 + 9 = nominalHour := by decide
theorem ring_has_nineteen_names : ringNames.length = 19 := by decide
theorem sequence_is_3527 : sequence = 3527 := by decide
theorem selected_index_is_12 : selectedIndex = 12 := by decide
theorem selected_name_is_tern :
    ringNames[selectedIndex]? = some "Tern Rook" := by decide
theorem next_index_is_13 : nextIndex = 13 := by decide
theorem next_name_is_morrow :
    ringNames[nextIndex]? = some "Morrow" := by decide
theorem h705_s3_is_morrow :
    ringNames[indexFor 705 3]? = some "Morrow" := by decide

structure LeaseSnapshot where
  phase : String
  taskId : String
  enabled : Bool
  timezone : String
  dtstart : String
  rrule : String
  nextRunTimeReported : Bool
  deriving Repr, DecidableEq

def lease00 : LeaseSnapshot :=
  ⟨":00", "6aa1fe0de5e48191b886496095b1343f", true,
    "America/New_York", "20261001T140000", "FREQ=HOURLY", false⟩

def lease12 : LeaseSnapshot :=
  ⟨":12", "6aa61b3b2e4081918927a35b61007acc", false,
    "America/New_York", "20261001T141200", "FREQ=HOURLY", false⟩

def lease24 : LeaseSnapshot :=
  ⟨":24", "6abda4c8eda88191bf23a6f2849e9a17", true,
    "America/New_York", "20261001T142400", "FREQ=HOURLY", false⟩

def lease36 : LeaseSnapshot :=
  ⟨":36", "6a9f52b69ec08191b0a2ba24a074f781", true,
    "America/New_York", "20261001T143600", "FREQ=HOURLY", false⟩

def lease48 : LeaseSnapshot :=
  ⟨":48", "6aa6c3bc02b48191b8a91a30d2a155e0", true,
    "America/New_York", "20261001T144800", "FREQ=HOURLY", false⟩

def currentLeases : List LeaseSnapshot :=
  [lease00, lease12, lease24, lease36, lease48]

def enabledCount : Nat :=
  (currentLeases.filter (fun lease => lease.enabled)).length

def nextRunTimeReportedCount : Nat :=
  (currentLeases.filter (fun lease => lease.nextRunTimeReported)).length

theorem five_fixed_leases : currentLeases.length = 5 := by decide
theorem four_fixed_leases_enabled : enabledCount = 4 := by decide
theorem existing_12_lease_disabled : lease12.enabled = false := by decide
theorem existing_24_lease_enabled : lease24.enabled = true := by decide
theorem existing_24_task_id_preserved :
    lease24.taskId = "6abda4c8eda88191bf23a6f2849e9a17" := by decide
theorem existing_24_schedule_preserved :
    lease24.timezone = "America/New_York" ∧
    lease24.dtstart = "20261001T142400" ∧
    lease24.rrule = "FREQ=HOURLY" := by decide
theorem next_run_time_unreported_for_all_five :
    nextRunTimeReportedCount = 0 := by decide

inductive RunStatus where
  | failed
  | inProgress
  | completed
  deriving DecidableEq, Repr

structure RunSnapshot where
  phase : String
  runId : String
  scheduledUs : Nat
  startedUs : Nat
  status : RunStatus
  completedUs : Option Nat
  chatRef : Option String
  latestResultRunId : String
  deriving Repr, DecidableEq

def run00H705 : RunSnapshot :=
  ⟨":00",
    "78e8852d-bdac-8322-aab2-18f8283a4d70",
    3_600_000_000, 7_186_833_099, .failed,
    some 7_352_557_527, none,
    "78e8852d-bdac-8322-aab2-18f8283a4d70"⟩

def run36H704 : RunSnapshot :=
  ⟨":36",
    "ef0a0fc9-5360-8326-a931-1477cfe35b12",
    2_160_000_000, 5_613_816_587, .failed,
    some 7_117_805_795, none,
    "f7379c01-874c-8322-89d6-483e208e303b"⟩

def run36H705 : RunSnapshot :=
  ⟨":36",
    "fcfaf452-9484-832a-bd4d-0f9032f5915d",
    9_360_000_000, 9_448_557_540, .inProgress,
    none, none,
    "f7379c01-874c-8322-89d6-483e208e303b"⟩

def run48H705 : RunSnapshot :=
  ⟨":48",
    "a4f94d0f-7624-832e-9854-794c4d35407c",
    6_480_000_000, 8_585_272_566, .inProgress,
    none, none,
    "99865281-9260-8323-a5b3-209324d2a0a2"⟩

def run24H705 : RunSnapshot :=
  ⟨":24",
    "6b9b177a-4688-8329-9053-a6fabcced935",
    5_040_000_000, 8_792_063_120, .inProgress,
    none, none,
    "c4da66d1-ae84-8330-81cf-76991624d75f"⟩

def initialReadbackRuns : List RunSnapshot :=
  [run00H705, run36H704, run48H705, run24H705]

def finalReadbackRuns : List RunSnapshot :=
  [run00H705, run36H705, run48H705, run24H705]

def countStatus (runs : List RunSnapshot) (status : RunStatus) : Nat :=
  (runs.filter (fun run => decide (run.status = status))).length

def staleLatestResultCount (runs : List RunSnapshot) : Nat :=
  (runs.filter (fun run => decide (run.latestResultRunId ≠ run.runId))).length

def allChatRefsAbsent (runs : List RunSnapshot) : Bool :=
  runs.all (fun run => run.chatRef.isNone)

theorem four_initial_run_records : initialReadbackRuns.length = 4 := by decide
theorem initial_two_records_failed :
    countStatus initialReadbackRuns RunStatus.failed = 2 := by decide
theorem initial_two_records_in_progress :
    countStatus initialReadbackRuns RunStatus.inProgress = 2 := by decide
theorem initial_three_latest_result_pointers_stale :
    staleLatestResultCount initialReadbackRuns = 3 := by decide
theorem initial_all_chat_refs_absent :
    allChatRefsAbsent initialReadbackRuns = true := by decide

theorem four_final_run_records : finalReadbackRuns.length = 4 := by decide
theorem final_one_record_failed :
    countStatus finalReadbackRuns RunStatus.failed = 1 := by decide
theorem final_three_records_in_progress :
    countStatus finalReadbackRuns RunStatus.inProgress = 3 := by decide
theorem final_three_latest_result_pointers_stale :
    staleLatestResultCount finalReadbackRuns = 3 := by decide
theorem final_all_chat_refs_absent :
    allChatRefsAbsent finalReadbackRuns = true := by decide

theorem run00_latest_result_matches_current :
    run00H705.latestResultRunId = run00H705.runId := by decide
theorem run36H704_latest_result_is_stale :
    run36H704.latestResultRunId ≠ run36H704.runId := by decide
theorem run36H705_latest_result_is_stale :
    run36H705.latestResultRunId ≠ run36H705.runId := by decide
theorem run24_latest_result_is_stale :
    run24H705.latestResultRunId ≠ run24H705.runId := by decide
theorem run48_latest_result_is_stale :
    run48H705.latestResultRunId ≠ run48H705.runId := by decide

theorem run36_h704_failed_then_h705_in_progress :
    run36H704.status = RunStatus.failed ∧
    run36H705.status = RunStatus.inProgress := by decide
theorem run24_36_48_h705_are_in_progress :
    run24H705.status = RunStatus.inProgress ∧
    run36H705.status = RunStatus.inProgress ∧
    run48H705.status = RunStatus.inProgress := by decide
theorem run24_36_48_h705_have_no_completion :
    run24H705.completedUs = none ∧
    run36H705.completedUs = none ∧
    run48H705.completedUs = none := by decide

def startLag00Us : Nat := run00H705.startedUs - run00H705.scheduledUs
def startLag36H704Us : Nat := run36H704.startedUs - run36H704.scheduledUs
def startLag36H705Us : Nat := run36H705.startedUs - run36H705.scheduledUs
def startLag48Us : Nat := run48H705.startedUs - run48H705.scheduledUs
def startLag24Us : Nat := run24H705.startedUs - run24H705.scheduledUs

theorem run00_start_lag_is_3586833099us :
    startLag00Us = 3_586_833_099 := by decide
theorem run36_h704_start_lag_is_3453816587us :
    startLag36H704Us = 3_453_816_587 := by decide
theorem run36_h705_start_lag_is_88557540us :
    startLag36H705Us = 88_557_540 := by decide
theorem run48_start_lag_is_2105272566us :
    startLag48Us = 2_105_272_566 := by decide
theorem run24_start_lag_is_3752063120us :
    startLag24Us = 3_752_063_120 := by decide

theorem run00_duration_is_165724428us :
    run00H705.completedUs.getD 0 - run00H705.startedUs = 165_724_428 := by decide
theorem run36_h704_duration_is_1503989208us :
    run36H704.completedUs.getD 0 - run36H704.startedUs = 1_503_989_208 := by decide
theorem run36_h704_completion_precedes_run00_start_by_69027304us :
    run00H705.startedUs - run36H704.completedUs.getD 0 = 69_027_304 := by decide
theorem run48_started_before_run24_by_206790554us :
    run24H705.startedUs - run48H705.startedUs = 206_790_554 := by decide
theorem run36_h705_started_after_run24_by_656494420us :
    run36H705.startedUs - run24H705.startedUs = 656_494_420 := by decide
theorem run36_h705_started_after_run48_by_863284974us :
    run36H705.startedUs - run48H705.startedUs = 863_284_974 := by decide

#print axioms utc_elapsed_hours_is_705
#print axioms sequence_is_3527
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_name_is_morrow
#print axioms four_fixed_leases_enabled
#print axioms existing_24_schedule_preserved
#print axioms initial_two_records_failed
#print axioms initial_three_latest_result_pointers_stale
#print axioms final_one_record_failed
#print axioms final_three_records_in_progress
#print axioms final_three_latest_result_pointers_stale
#print axioms final_all_chat_refs_absent
#print axioms run00_start_lag_is_3586833099us
#print axioms run36_h704_start_lag_is_3453816587us
#print axioms run36_h705_start_lag_is_88557540us
#print axioms run48_start_lag_is_2105272566us
#print axioms run24_start_lag_is_3752063120us
#print axioms run36_h704_completion_precedes_run00_start_by_69027304us
#print axioms run48_started_before_run24_by_206790554us
#print axioms run36_h705_started_after_run24_by_656494420us
#print axioms run36_h705_started_after_run48_by_863284974us

end HsHVerification.TernH705SchedulerSnapshotEvidence
