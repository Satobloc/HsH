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

Scheduler task IDs and current run records:
  :00 task 6aa1fe0de5e48191b886496095b1343f
      run 78e8852d-bdac-8322-aab2-18f8283a4d70
      scheduled 09:00:00Z; started 09:59:46.833099Z;
      failed/completed 10:02:32.557527Z; chat_ref=null.
  :12 task 6aa61b3b2e4081918927a35b61007acc
      remains disabled; no current-hour run is represented.
  :24 task 6abda4c8eda88191bf23a6f2849e9a17
      run 6b9b177a-4688-8329-9053-a6fabcced935
      scheduled 09:24:00Z; started 10:26:32.063120Z;
      IN_PROGRESS; completed_at=null; chat_ref=null.
      latest_result belongs to older run c4da66d1-ae84-8330-81cf-76991624d75f.
  :36 task 6a9f52b69ec08191b0a2ba24a074f781
      latest exposed run ef0a0fc9-5360-8326-a931-1477cfe35b12
      scheduled 08:36:00Z; started 09:33:33.816587Z;
      failed/completed 09:58:37.805795Z; chat_ref=null.
      This is not the expected h705:s3 scheduled_for=09:36Z record;
      no h705:s3 run record was returned by the read-only peek.
  :48 task 6aa6c3bc02b48191b8a91a30d2a155e0
      run a4f94d0f-7624-832e-9854-794c4d35407c
      scheduled 09:48:00Z; started 10:23:05.272566Z;
      IN_PROGRESS; completed_at=null; chat_ref=null.
      latest_result belongs to older run 99865281-9260-8323-a5b3-209324d2a0a2.

Times below are integer microseconds after 2026-11-09T08:00:00Z.
The connector exposes no attempt ID/history in this snapshot. A changed or
delayed field does not establish retry, restart, duplicate execution, or
backend cause. A cached latest_result is not current-run output.

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

def run00 : RunSnapshot :=
  ⟨":00",
    "78e8852d-bdac-8322-aab2-18f8283a4d70",
    3_600_000_000, 7_186_833_099, .failed,
    some 7_352_557_527, none,
    "78e8852d-bdac-8322-aab2-18f8283a4d70"⟩

def run36 : RunSnapshot :=
  ⟨":36",
    "ef0a0fc9-5360-8326-a931-1477cfe35b12",
    2_160_000_000, 5_613_816_587, .failed,
    some 7_117_805_795, none,
    "ef0a0fc9-5360-8326-a931-1477cfe35b12"⟩

def run48 : RunSnapshot :=
  ⟨":48",
    "a4f94d0f-7624-832e-9854-794c4d35407c",
    6_480_000_000, 8_585_272_566, .inProgress,
    none, none,
    "99865281-9260-8323-a5b3-209324d2a0a2"⟩

def run24 : RunSnapshot :=
  ⟨":24",
    "6b9b177a-4688-8329-9053-a6fabcced935",
    5_040_000_000, 8_792_063_120, .inProgress,
    none, none,
    "c4da66d1-ae84-8330-81cf-76991624d75f"⟩

def observedRuns : List RunSnapshot := [run00, run36, run48, run24]

def failedCount : Nat :=
  (observedRuns.filter (fun run => decide (run.status = RunStatus.failed))).length

def inProgressCount : Nat :=
  (observedRuns.filter (fun run => decide (run.status = RunStatus.inProgress))).length

def staleLatestResultCount : Nat :=
  (observedRuns.filter (fun run => decide (run.latestResultRunId ≠ run.runId))).length

def allChatRefsAbsent : Bool :=
  observedRuns.all (fun run => run.chatRef.isNone)

theorem four_current_run_records : observedRuns.length = 4 := by decide
theorem two_current_records_failed : failedCount = 2 := by decide
theorem two_current_records_in_progress : inProgressCount = 2 := by decide
theorem two_latest_result_pointers_are_stale : staleLatestResultCount = 2 := by decide
theorem all_four_chat_refs_absent : allChatRefsAbsent = true := by decide
theorem run00_latest_result_matches_current :
    run00.latestResultRunId = run00.runId := by decide
theorem run36_latest_result_matches_current :
    run36.latestResultRunId = run36.runId := by decide
theorem run24_latest_result_is_stale :
    run24.latestResultRunId ≠ run24.runId := by decide
theorem run48_latest_result_is_stale :
    run48.latestResultRunId ≠ run48.runId := by decide
theorem run24_and_run48_are_in_progress :
    run24.status = RunStatus.inProgress ∧
    run48.status = RunStatus.inProgress := by decide
theorem run24_and_run48_have_no_completion :
    run24.completedUs = none ∧ run48.completedUs = none := by decide

def startLag00Us : Nat := run00.startedUs - run00.scheduledUs
def startLag36Us : Nat := run36.startedUs - run36.scheduledUs
def startLag48Us : Nat := run48.startedUs - run48.scheduledUs
def startLag24Us : Nat := run24.startedUs - run24.scheduledUs

theorem run00_start_lag_is_3586833099us :
    startLag00Us = 3_586_833_099 := by decide
theorem run36_start_lag_is_3453816587us :
    startLag36Us = 3_453_816_587 := by decide
theorem run48_start_lag_is_2105272566us :
    startLag48Us = 2_105_272_566 := by decide
theorem run24_start_lag_is_3752063120us :
    startLag24Us = 3_752_063_120 := by decide

theorem run00_duration_is_165724428us :
    run00.completedUs.getD 0 - run00.startedUs = 165_724_428 := by decide
theorem run36_duration_is_1503989208us :
    run36.completedUs.getD 0 - run36.startedUs = 1_503_989_208 := by decide
theorem run36_completion_precedes_run00_start_by_69027304us :
    run00.startedUs - run36.completedUs.getD 0 = 69_027_304 := by decide
theorem run48_started_before_run24_by_206790554us :
    run24.startedUs - run48.startedUs = 206_790_554 := by decide

#print axioms utc_elapsed_hours_is_705
#print axioms sequence_is_3527
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_name_is_morrow
#print axioms four_fixed_leases_enabled
#print axioms existing_24_schedule_preserved
#print axioms two_current_records_failed
#print axioms two_current_records_in_progress
#print axioms two_latest_result_pointers_are_stale
#print axioms all_four_chat_refs_absent
#print axioms run00_start_lag_is_3586833099us
#print axioms run36_start_lag_is_3453816587us
#print axioms run48_start_lag_is_2105272566us
#print axioms run24_start_lag_is_3752063120us
#print axioms run36_completion_precedes_run00_start_by_69027304us
#print axioms run48_started_before_run24_by_206790554us

end HsHVerification.TernH705SchedulerSnapshotEvidence
