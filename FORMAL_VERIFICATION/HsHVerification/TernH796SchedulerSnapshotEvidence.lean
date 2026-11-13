import Mathlib
import HsHVerification.TernH515SchedulerOverlapEvidence

/-!
Tern Rook / Comptroller — 2026-11-13 nominal h796:s3 scheduler snapshot.

Source: exact-ID Automations.peek records for the :00 and :36 leases,
read at approximately 2026-11-13T04:40:37Z. Times below are integer
microseconds relative to 2026-11-13T04:00:00Z.

The :00 h796 run was first recorded IN_PROGRESS in its own receipt, then a
later exact-ID peek showed the same run ID COMPLETED. This module records
the later state; the earlier receipt remains a valid as-of observation.

The :24 task ID was not accessible to exact-ID peek in this context and is
deliberately omitted. The :48 lease's latest exposed run still belonged to
h795:s4, not the upcoming h796:s4 slot.

This module formalizes only arithmetic and equalities over the transcribed
scheduler records. It does not authenticate the service, prove process
concurrency, retries, restarts, worker/thread identity, delivery, backend
causation, or any physical H(s)H proposition.
-/ 

namespace HsHVerification.TernH796SchedulerSnapshotEvidence

open HsHVerification.TernH515SchedulerOverlapEvidence

def nominalHour : Nat := 796
def sequence : Nat := 5 * nominalHour + 3
def selectedIndex : Nat := sequence % 19
def nextIndex : Nat := (sequence + 1) % 19

theorem nominal_hour_is_33_days_4_hours : 33 * 24 + 4 = nominalHour := by decide
theorem sequence_is_3983 : sequence = 3983 := by decide
theorem selected_index_is_12 : selectedIndex = 12 := by decide
theorem selected_name_is_tern :
    ring[selectedIndex]? = some "Tern Rook" := by decide
theorem next_index_is_13 : nextIndex = 13 := by decide
theorem next_name_is_morrow :
    ring[nextIndex]? = some "Morrow" := by decide

inductive RunStatus where
  | completed
  | failed
  | inProgress
  deriving DecidableEq, Repr

structure RunRecord where
  phase : String
  runId : String
  scheduledUs : Nat
  startedUs : Nat
  completedUs : Option Nat
  status : RunStatus
  latestResultRunId : Option String
  deriving DecidableEq, Repr

def run00 : RunRecord :=
  ⟨ ":00"
  , "00ee0deb-e858-832c-b275-2d618c9b6f7c"
  , 0
  , 1_201_281_747
  , some 1_794_261_923
  , .completed
  , some "00ee0deb-e858-832c-b275-2d618c9b6f7c"
  ⟩

def run36 : RunRecord :=
  ⟨ ":36"
  , "17d2d32d-f654-8327-9336-f29b3035cdec"
  , 2_160_000_000
  , 2_436_443_807
  , none
  , .inProgress
  , some "53dc6d61-42f4-8330-aecc-9584ca28c83b"
  ⟩

def observedAtUs : Nat := 2_437_000_000

def latestResultMatchesRun (r : RunRecord) : Bool :=
  r.latestResultRunId == some r.runId

theorem run00_started_1201281747us_after_slot :
    run00.startedUs - run00.scheduledUs = 1_201_281_747 := by decide
theorem run00_duration_592980176us :
    1_794_261_923 - run00.startedUs = 592_980_176 := by decide
theorem run36_started_276443807us_after_slot :
    run36.startedUs - run36.scheduledUs = 276_443_807 := by decide

theorem run00_recorded_completed :
    run00.status = .completed ∧ run00.completedUs = some 1_794_261_923 := by decide
theorem run36_recorded_in_progress :
    run36.status = .inProgress ∧ run36.completedUs = none := by decide

theorem run00_latest_result_matches_current :
    latestResultMatchesRun run00 = true := by decide
theorem run36_latest_result_is_stale :
    latestResultMatchesRun run36 = false := by decide

-- These two recorded intervals do not overlap.
theorem run00_completed_before_run36_started :
    1_794_261_923 < run36.startedUs := by decide
theorem recorded_gap_between_run00_and_run36_us :
    run36.startedUs - 1_794_261_923 = 642_181_884 := by decide

-- The current :36 record is right-censored at the observation time.
theorem run36_age_at_observation_556193us :
    observedAtUs - run36.startedUs = 556_193 := by decide

#print axioms nominal_hour_is_33_days_4_hours
#print axioms sequence_is_3983
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_index_is_13
#print axioms next_name_is_morrow
#print axioms run00_started_1201281747us_after_slot
#print axioms run00_duration_592980176us
#print axioms run36_started_276443807us_after_slot
#print axioms run00_recorded_completed
#print axioms run36_recorded_in_progress
#print axioms run00_latest_result_matches_current
#print axioms run36_latest_result_is_stale
#print axioms run00_completed_before_run36_started
#print axioms recorded_gap_between_run00_and_run36_us
#print axioms run36_age_at_observation_556193us

end HsHVerification.TernH796SchedulerSnapshotEvidence
