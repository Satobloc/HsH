import Mathlib
import HsHVerification.TernH515SchedulerOverlapEvidence

/-!
Tern Rook / Comptroller — 2026-11-13 nominal h796:s3 scheduler snapshot.

Source: exact-ID Automations.peek records read at approximately
2026-11-13T04:40:37Z. Times below are integer microseconds relative to
2026-11-13T04:00:00Z.

The :00 run had a later readback showing COMPLETED; its earlier receipt's
IN_PROGRESS state remains a historically valid as-of observation.
The :24 and :36 runs were still recorded IN_PROGRESS at the snapshot.
Their latest_result run IDs refer to older executions.

This module formalizes only arithmetic and equalities over those
transcribed scheduler records. It does not authenticate the service,
prove process concurrency, retries, restarts, worker/thread identity,
delivery, backend causation, or any physical H(s)H proposition.
A recorded interval overlap is not a claim of simultaneous model execution.
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

def run24 : RunRecord :=
  ⟨ ":24"
  , "73830c6a-de40-8333-b45b-d482471885b2"
  , 1_440_000_000
  , 1_729_362_161
  , none
  , .inProgress
  , some "a71e7ed6-7fc0-8328-9580-67d25fc6e457"
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
theorem run24_started_289362161us_after_slot :
    run24.startedUs - run24.scheduledUs = 289_362_161 := by decide
theorem run36_started_276443807us_after_slot :
    run36.startedUs - run36.scheduledUs = 276_443_807 := by decide

theorem run00_recorded_completed :
    run00.status = .completed ∧ run00.completedUs = some 1_794_261_923 := by decide
theorem run24_recorded_in_progress :
    run24.status = .inProgress ∧ run24.completedUs = none := by decide
theorem run36_recorded_in_progress :
    run36.status = .inProgress ∧ run36.completedUs = none := by decide

theorem run00_latest_result_matches_current :
    latestResultMatchesRun run00 = true := by decide
theorem run24_latest_result_is_stale :
    latestResultMatchesRun run24 = false := by decide
theorem run36_latest_result_is_stale :
    latestResultMatchesRun run36 = false := by decide

-- :00 and :24 have a finite, exactly bounded recorded-interval intersection.
theorem run00_run24_recorded_overlap_exact :
    run24.startedUs < 1_794_261_923 ∧
    1_794_261_923 - run24.startedUs = 64_899_762 := by decide

-- :00 completed before :36 began; these two recorded intervals do not overlap.
theorem run00_completed_before_run36_started :
    1_794_261_923 < run36.startedUs := by decide

-- :24 and :36 are right-censored at the observation time. The API records
-- both as in progress, and the shared recorded interval extends at least
-- from the :36 start to the observation timestamp.
theorem run24_run36_recorded_overlap_lower_bound :
    run24.startedUs < run36.startedUs ∧
    run36.startedUs < observedAtUs ∧
    run24.status = .inProgress ∧
    run36.status = .inProgress ∧
    observedAtUs - run36.startedUs = 556_193 := by decide

#print axioms nominal_hour_is_33_days_4_hours
#print axioms sequence_is_3983
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_index_is_13
#print axioms next_name_is_morrow
#print axioms run00_started_1201281747us_after_slot
#print axioms run24_started_289362161us_after_slot
#print axioms run36_started_276443807us_after_slot
#print axioms run00_recorded_completed
#print axioms run24_recorded_in_progress
#print axioms run36_recorded_in_progress
#print axioms run00_latest_result_matches_current
#print axioms run24_latest_result_is_stale
#print axioms run36_latest_result_is_stale
#print axioms run00_run24_recorded_overlap_exact
#print axioms run00_completed_before_run36_started
#print axioms run24_run36_recorded_overlap_lower_bound

end HsHVerification.TernH796SchedulerSnapshotEvidence
