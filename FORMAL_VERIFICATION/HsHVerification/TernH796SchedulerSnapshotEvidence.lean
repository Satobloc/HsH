import Mathlib
import HsHVerification.TernH515SchedulerOverlapEvidence

/-!
Tern Rook / Comptroller — 2026-11-13 nominal h796:s3 scheduler snapshot.

Exact-ID Automations.peek sources for :00 and :36 were read at
approximately 2026-11-13T04:40:37Z. The :24 task-level peek was unavailable
in this context, but the contemporaneous Enheduanna h796:s2 CURRENT_WORK
and report supply a source-reported :24 run ID, start timestamp, and
IN_PROGRESS state. Its observation timestamp is not explicit, so no
:24 overlap or current-status claim is made here.

Times are integer microseconds relative to 2026-11-13T04:00:00Z.
The :00 run's earlier receipt recorded IN_PROGRESS; a later exact-ID peek
showed the same run ID COMPLETED. Both are retained as as-of observations.

This module formalizes only arithmetic and equalities over the transcribed
scheduler records. A later :36/:48 readback adds a conservative lower bound
for their recorded interval intersection. It does not authenticate the
service, prove process concurrency, retries, restarts, worker/thread identity,
delivery, backend causation, or any physical H(s)H proposition.
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

structure RunStartObservation where
  phase : String
  runId : String
  scheduledUs : Nat
  startedUs : Nat
  statusAtSourceReport : RunStatus
  completedUsAtSourceReport : Option Nat
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

def run24SourceReport : RunStartObservation :=
  ⟨ ":24"
  , "73830c6a-de40-8333-b45b-d482471885b2"
  , 1_440_000_000
  , 1_729_362_161
  , .inProgress
  , none
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

def run48 : RunRecord :=
  ⟨ ":48"
  , "49b6813d-a838-8324-8ccc-bf51c2f1fb7c"
  , 2_880_000_000
  , 3_103_350_981
  , none
  , .inProgress
  , some "48dccfa1-f0e8-832d-8299-a7af32b6081b"
  ⟩

-- Lower bound timestamp captured immediately before the exact-ID :36/:48
-- peeks. The peeks occurred after this time and both records remained
-- IN_PROGRESS. It is not represented as the exact API readback timestamp.
def laterReadbackLowerBoundUs : Nat := 3_529_997_055

def latestResultMatchesRun (r : RunRecord) : Bool :=
  r.latestResultRunId == some r.runId

theorem run00_started_1201281747us_after_slot :
    run00.startedUs - run00.scheduledUs = 1_201_281_747 := by decide
theorem run00_duration_592980176us :
    1_794_261_923 - run00.startedUs = 592_980_176 := by decide
theorem run24_source_started_289362161us_after_slot :
    run24SourceReport.startedUs - run24SourceReport.scheduledUs = 289_362_161 := by decide
theorem run36_started_276443807us_after_slot :
    run36.startedUs - run36.scheduledUs = 276_443_807 := by decide

theorem run00_recorded_completed :
    run00.status = .completed ∧ run00.completedUs = some 1_794_261_923 := by decide
theorem run24_source_reported_in_progress :
    run24SourceReport.statusAtSourceReport = .inProgress ∧
    run24SourceReport.completedUsAtSourceReport = none := by decide
theorem run36_recorded_in_progress :
    run36.status = .inProgress ∧ run36.completedUs = none := by decide

theorem run00_latest_result_matches_current :
    latestResultMatchesRun run00 = true := by decide
theorem run36_latest_result_is_stale :
    latestResultMatchesRun run36 = false := by decide

-- The :00 run's recorded completion precedes the :36 run's recorded start.
theorem run00_completed_before_run36_started :
    1_794_261_923 < run36.startedUs := by decide
theorem recorded_gap_between_run00_and_run36_us :
    run36.startedUs - 1_794_261_923 = 642_181_884 := by decide

-- The source-reported :24 start precedes the :36 start. Because the
-- :24 report has no explicit observed_at, this is start-order only,
-- not an interval-overlap theorem.
theorem run24_source_start_precedes_run36_start :
    run24SourceReport.startedUs < run36.startedUs := by decide
theorem run24_to_run36_start_separation_us :
    run36.startedUs - run24SourceReport.startedUs = 707_081_646 := by decide

-- The current :36 record is right-censored at the exact-ID observation time.
theorem run36_age_at_observation_556193us :
    observedAtUs - run36.startedUs = 556_193 := by decide

theorem run48_started_223350981us_after_slot :
    run48.startedUs - run48.scheduledUs = 223_350_981 := by decide
theorem run48_recorded_in_progress :
    run48.status = .inProgress ∧ run48.completedUs = none := by decide
theorem run48_latest_result_is_stale :
    latestResultMatchesRun run48 = false := by decide

-- Both records were IN_PROGRESS at the same later exact-ID readback.
-- The timestamp is a conservative lower bound on that readback time.
theorem run36_started_before_run48_started :
    run36.startedUs < run48.startedUs := by decide
theorem run36_run48_recorded_overlap_lower_bound :
    run36.startedUs < run48.startedUs ∧
    run48.startedUs < laterReadbackLowerBoundUs ∧
    run36.status = .inProgress ∧
    run48.status = .inProgress ∧
    laterReadbackLowerBoundUs - run48.startedUs = 426_646_074 := by decide
theorem run36_age_at_later_readback_lower_bound :
    laterReadbackLowerBoundUs - run36.startedUs = 1_093_553_248 := by decide

#print axioms nominal_hour_is_33_days_4_hours
#print axioms sequence_is_3983
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_index_is_13
#print axioms next_name_is_morrow
#print axioms run00_started_1201281747us_after_slot
#print axioms run00_duration_592980176us
#print axioms run24_source_started_289362161us_after_slot
#print axioms run36_started_276443807us_after_slot
#print axioms run00_recorded_completed
#print axioms run24_source_reported_in_progress
#print axioms run36_recorded_in_progress
#print axioms run00_latest_result_matches_current
#print axioms run36_latest_result_is_stale
#print axioms run00_completed_before_run36_started
#print axioms recorded_gap_between_run00_and_run36_us
#print axioms run24_source_start_precedes_run36_start
#print axioms run24_to_run36_start_separation_us
#print axioms run36_age_at_observation_556193us
#print axioms run48_started_223350981us_after_slot
#print axioms run48_recorded_in_progress
#print axioms run48_latest_result_is_stale
#print axioms run36_started_before_run48_started
#print axioms run36_run48_recorded_overlap_lower_bound
#print axioms run36_age_at_later_readback_lower_bound

end HsHVerification.TernH796SchedulerSnapshotEvidence
