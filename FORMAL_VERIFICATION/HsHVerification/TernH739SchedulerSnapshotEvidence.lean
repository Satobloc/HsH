import Mathlib
import HsHVerification.TernH515SchedulerOverlapEvidence

/-!
Tern Rook / Comptroller — 2026-11-10 nominal h739 scheduler snapshot.

Evidence class: read-only automation API snapshots transcribed during the
19:32–19:34Z execution window. The API does not expose a per-snapshot
observed_at or attempt identifier. Time offsets are integer microseconds
relative to 2026-11-10T19:00:00Z.

The four enabled task records exposed at this read:
* :00 run 6e050ef5-e164-8321-ba3b-7cc1503faad7, scheduled 19:00Z,
  started 19:28:33.380978Z, IN_PROGRESS, latest_result absent.
* :24 run cbbfaafc-101c-8328-b313-0b157e6ff80d, scheduled 19:24Z,
  started 19:28:32.211062Z, IN_PROGRESS; latest_result is older
  run db03de04-5428-8326-9452-9c5835bda6a3, scheduled 17:24Z.
* :36 run a76717f9-ca88-8330-8ec5-4fa85d5d2eed, scheduled 19:36Z,
  started 19:32:23.918795Z, IN_PROGRESS; latest_result is older
  run 49d2c5d9-dcfc-832e-bdc5-1af4b7a4327f, scheduled 17:36Z.
* :48 latest exposed run 42528615-b27c-832b-8240-31250c2deac3,
  scheduled 17:48Z, started 18:52:18.567179Z, FAILED/completed
  19:17:20.573240Z; latest_result matches that same run.

The :48 last_run therefore belongs to h737:s4 (Ariadne), not the
upcoming h739:s4 (Morrow). The latest peek did not expose an h739:s4
record; this is not a claim about the complete run history or a skipped run.

Task-level last_run_time and updated_at are transcribed separately.
Their semantics are undocumented; they must not be substituted for
last_run.started_at or used to select the rotation identity.

This module proves finite arithmetic and equality propositions over the
transcribed values and user-specified ring. It does not authenticate the
scheduler service, prove the transcription sound, explain backend behavior,
establish attempt identity, worker/thread identity, delivery, or any
physical H(s)H proposition.
-/

namespace HsHVerification.TernH739SchedulerSnapshotEvidence

open HsHVerification.TernH515SchedulerOverlapEvidence

def nominalHour : Nat := 739
def indexFor (hour slot : Nat) : Nat := (5 * hour + slot) % 19

theorem nominal_hour_is_30_days_19_hours : 30 * 24 + 19 = nominalHour := by decide
theorem h739_s0_is_elias :
    ring[indexFor 739 0]? = some "Elias Kern" := by decide
theorem h739_s2_is_enheduanna :
    ring[indexFor 739 2]? = some "Enheduanna" := by decide
theorem h739_s3_is_tern :
    ring[indexFor 739 3]? = some "Tern Rook" := by decide
theorem h739_s4_is_morrow :
    ring[indexFor 739 4]? = some "Morrow" := by decide
theorem h737_s4_is_ariadne :
    ring[indexFor 737 4]? = some "Ariadne" := by decide

inductive RecordedStatus where
  | failed
  | inProgress
  deriving Repr, DecidableEq

structure RunSnapshot where
  phase : String
  runId : String
  scheduledUs : Int
  startedUs : Int
  taskLastRunTimeUs : Int
  taskUpdatedAtUs : Int
  status : RecordedStatus
  latestResultRunId : Option String
  latestResultScheduledUs : Option Int
  deriving Repr, DecidableEq

def run00 : RunSnapshot :=
  ⟨ ":00"
  , "6e050ef5-e164-8321-ba3b-7cc1503faad7"
  , 0
  , 1_713_380_978
  , -2_741_116_587
  , -2_717_152_306
  , .inProgress
  , none
  , none
  ⟩

def run24 : RunSnapshot :=
  ⟨ ":24"
  , "cbbfaafc-101c-8328-b313-0b157e6ff80d"
  , 1_440_000_000
  , 1_712_211_062
  , 1_108_166
  , 29_918_349
  , .inProgress
  , some "db03de04-5428-8326-9452-9c5835bda6a3"
  , some (-5_760_000_000)
  ⟩

def run36 : RunSnapshot :=
  ⟨ ":36"
  , "a76717f9-ca88-8330-8ec5-4fa85d5d2eed"
  , 2_160_000_000
  , 1_943_918_795
  , -870_501_019
  , -849_867_897
  , .inProgress
  , some "49d2c5d9-dcfc-832e-bdc5-1af4b7a4327f"
  , some (-5_040_000_000)
  ⟩

def run48Latest : RunSnapshot :=
  ⟨ ":48"
  , "42528615-b27c-832b-8240-31250c2deac3"
  , -4_320_000_000
  , -461_432_821
  , 1_042_567_149
  , 1_064_244_551
  , .failed
  , some "42528615-b27c-832b-8240-31250c2deac3"
  , some (-4_320_000_000)
  ⟩

def startOffsetUs (r : RunSnapshot) : Int := r.startedUs - r.scheduledUs
def taskLastRunTimeMinusStartedUs (r : RunSnapshot) : Int :=
  r.taskLastRunTimeUs - r.startedUs

def latestResultMatchesRun (r : RunSnapshot) : Bool :=
  r.latestResultRunId == some r.runId

def latestResultSlotMatches (r : RunSnapshot) : Bool :=
  r.latestResultScheduledUs == some r.scheduledUs

theorem run00_started_1713380978us_after_slot :
    startOffsetUs run00 = 1_713_380_978 := by decide
theorem run24_started_272211062us_after_slot :
    startOffsetUs run24 = 272_211_062 := by decide
theorem run36_started_216081205us_before_slot :
    startOffsetUs run36 = -216_081_205 := by decide
theorem run48_h737_started_3858567179us_after_slot :
    startOffsetUs run48Latest = 3_858_567_179 := by decide

theorem task_last_run_time_precedes_start_00_24_36 :
    taskLastRunTimeMinusStartedUs run00 < 0 ∧
    taskLastRunTimeMinusStartedUs run24 < 0 ∧
    taskLastRunTimeMinusStartedUs run36 < 0 := by decide
theorem task_last_run_time_follows_start_48 :
    taskLastRunTimeMinusStartedUs run48Latest > 0 := by decide
theorem task_last_run_time_offsets_are_not_uniform :
    taskLastRunTimeMinusStartedUs run00 ≠
      taskLastRunTimeMinusStartedUs run48Latest := by decide

theorem run00_latest_result_absent :
    run00.latestResultRunId = none ∧ run00.latestResultScheduledUs = none := by decide
theorem run24_latest_result_is_older :
    latestResultMatchesRun run24 = false ∧
    latestResultSlotMatches run24 = false := by decide
theorem run36_latest_result_is_older :
    latestResultMatchesRun run36 = false ∧
    latestResultSlotMatches run36 = false := by decide
theorem run48_latest_result_matches_exposed_failed_run :
    latestResultMatchesRun run48Latest = true ∧
    latestResultSlotMatches run48Latest = true ∧
    run48Latest.status = .failed := by decide

#print axioms nominal_hour_is_30_days_19_hours
#print axioms h739_s0_is_elias
#print axioms h739_s2_is_enheduanna
#print axioms h739_s3_is_tern
#print axioms h739_s4_is_morrow
#print axioms h737_s4_is_ariadne
#print axioms run00_started_1713380978us_after_slot
#print axioms run24_started_272211062us_after_slot
#print axioms run36_started_216081205us_before_slot
#print axioms run48_h737_started_3858567179us_after_slot
#print axioms task_last_run_time_precedes_start_00_24_36
#print axioms task_last_run_time_follows_start_48
#print axioms task_last_run_time_offsets_are_not_uniform
#print axioms run00_latest_result_absent
#print axioms run24_latest_result_is_older
#print axioms run36_latest_result_is_older
#print axioms run48_latest_result_matches_exposed_failed_run

end HsHVerification.TernH739SchedulerSnapshotEvidence
