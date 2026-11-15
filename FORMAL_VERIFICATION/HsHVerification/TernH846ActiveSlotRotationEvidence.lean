import Mathlib

/-!
Tern Rook / Comptroller — h846:s0 active-slot rotation and scheduler evidence.

Sources:
* Nathan's current relay instruction: fixed 19-name ring and sequence
  seq = 5*h + s, with h the nominal UTC hour since 2026-10-11T00:00Z.
* Live Automation API exact-ID peeks at 2026-11-15 approximately 05:55:51Z:
  :00 current run bb034e08-6308-8326-9f8e-c9b76c500636;
  :24 current run 751736c2-51bc-8322-8076-1bb98776974b;
  :36 current run d5f094d4-16cc-832a-8362-85b6c6e6b1ab;
  :48 current run 731969da-153c-8327-8e53-c78c501bbe15.
* The existing :12 task ID 6aa61b3b2e4081918927a35b61007acc was
  present but disabled at the same scheduler readback.
* The current :00 task ID and exact saved hourly DTSTART/RRULE were
  independently read; no task configuration was changed.

This module distinguishes the mathematical ring index from an active
scheduler slot. Because :12 (s=1) is disabled, the next ring identity
after h846:s0 is not the next active scheduled worker.

All list/count theorems below are finite computations over the stated
19-hour window beginning at h=846. They do not prove historical identity,
thread delivery, service authenticity, process concurrency, or physical
geometry. Scheduler timestamps are encoded as integer microseconds after
2026-11-15T05:00:00Z. Lean verifies only these formalized propositions.
-/

namespace HsHVerification.TernH846ActiveSlotRotationEvidence

def workerRing : List String :=
  [ "Sable", "Loom", "Aster", "Ariadne", "Alberr", "Mira", "Aldus"
  , "Calder", "Hale", "Elias Kern", "Nadir Voss", "Enheduanna"
  , "Tern Rook", "Morrow", "Kestrel", "Meridian", "Mercer", "Ravel"
  , "Orson Vay"
  ]

def ringIndex (h s : Nat) : Nat := (5 * h + s) % 19

def activeSlots : List Nat := [0, 2, 3, 4]
def allNominalSlots : List Nat := [0, 1, 2, 3, 4]

def assignmentsFor (slots : List Nat) : List Nat :=
  (List.range 19).flatMap fun dh =>
    slots.map fun s => ringIndex (846 + dh) s

def activeAssignments : List Nat := assignmentsFor activeSlots
def allNominalAssignments : List Nat := assignmentsFor allNominalSlots

def first19ActiveAssignments : List Nat := activeAssignments.take 19
def first19NominalAssignments : List Nat := allNominalAssignments.take 19

theorem worker_ring_has_nineteen_names : workerRing.length = 19 := by decide

theorem h846_is_35_days_6_hours : 35 * 24 + 6 = 846 := by decide
theorem h846_s0_sequence_is_4230 : 5 * 846 + 0 = 4230 := by decide
theorem h846_s0_index_is_12 : ringIndex 846 0 = 12 := by decide
theorem h846_s0_selects_tern :
    workerRing[ringIndex 846 0]? = some "Tern Rook" := by decide

theorem next_ring_index_is_13 : (ringIndex 846 0 + 1) % 19 = 13 := by decide
theorem next_ring_identity_is_morrow :
    workerRing[((ringIndex 846 0 + 1) % 19)]? = some "Morrow" := by decide

theorem next_active_slot_is_s2 : activeSlots[1]? = some 2 := by decide
theorem next_active_index_is_14 : ringIndex 846 2 = 14 := by decide
theorem next_active_identity_is_kestrel :
    workerRing[ringIndex 846 2]? = some "Kestrel" := by decide

theorem next_ring_identity_differs_from_next_active_identity :
    (ringIndex 846 0 + 1) % 19 ≠ ringIndex 846 2 := by decide

theorem active_assignment_count_over_19_hours : activeAssignments.length = 76 := by decide
theorem all_nominal_assignment_count_over_19_hours :
    allNominalAssignments.length = 95 := by decide

theorem each_worker_occurs_four_times_over_19_active_hours (i : Fin 19) :
    activeAssignments.count i.val = 4 := by
  fin_cases i <;> decide

theorem each_worker_occurs_five_times_over_19_full_hours (i : Fin 19) :
    allNominalAssignments.count i.val = 5 := by
  fin_cases i <;> decide

theorem first19_active_firings_have_16_distinct_indices :
    first19ActiveAssignments.toFinset.card = 16 := by decide

theorem first19_full_nominal_firings_have_19_distinct_indices :
    first19NominalAssignments.toFinset.card = 19 := by decide

theorem tern_repeats_in_first19_active_firings :
    first19ActiveAssignments.count 12 = 2 := by decide

theorem meridian_repeats_in_first19_active_firings :
    first19ActiveAssignments.count 15 = 2 := by decide

theorem mercer_repeats_in_first19_active_firings :
    first19ActiveAssignments.count 16 = 2 := by decide

inductive RunStatus where
  | completed
  | inProgress
  deriving DecidableEq, Repr

structure RunRecord where
  runId : String
  scheduledUs : Nat
  startedUs : Nat
  completedUs : Option Nat
  status : RunStatus
  latestResultRunId : Option String
  deriving DecidableEq, Repr

def run24 : RunRecord :=
  ⟨ "751736c2-51bc-8322-8076-1bb98776974b"
  , 1_440_000_000
  , 1_632_155_014
  , some 2_134_493_439
  , .completed
  , some "751736c2-51bc-8322-8076-1bb98776974b"
  ⟩

def run36 : RunRecord :=
  ⟨ "d5f094d4-16cc-832a-8362-85b6c6e6b1ab"
  , 2_160_000_000
  , 2_368_677_685
  , some 3_350_184_536
  , .completed
  , some "d5f094d4-16cc-832a-8362-85b6c6e6b1ab"
  ⟩

def run48 : RunRecord :=
  ⟨ "731969da-153c-8327-8e53-c78c501bbe15"
  , 2_880_000_000
  , 2_670_347_312
  , none
  , .inProgress
  , some "ed45bfa3-a5a8-8330-ae7c-8e183d399a17"
  ⟩

def run00h846 : RunRecord :=
  ⟨ "bb034e08-6308-8326-9f8e-c9b76c500636"
  , 3_600_000_000
  , 3_350_272_606
  , none
  , .inProgress
  , some "6210f8b8-25f8-832f-b7e0-29b3842e784a"
  ⟩

def latestResultMatchesRun (r : RunRecord) : Bool :=
  r.latestResultRunId == some r.runId

theorem run24_completed_and_cache_matches :
    run24.status = .completed ∧
    run24.completedUs = some 2_134_493_439 ∧
    latestResultMatchesRun run24 = true := by decide

theorem run36_completed_and_cache_matches :
    run36.status = .completed ∧
    run36.completedUs = some 3_350_184_536 ∧
    latestResultMatchesRun run36 = true := by decide

theorem run48_in_progress_and_cache_stale :
    run48.status = .inProgress ∧
    run48.completedUs = none ∧
    latestResultMatchesRun run48 = false := by decide

theorem run00_in_progress_and_cache_stale :
    run00h846.status = .inProgress ∧
    run00h846.completedUs = none ∧
    latestResultMatchesRun run00h846 = false := by decide

theorem run24_started_192155014us_after_slot :
    run24.startedUs - run24.scheduledUs = 192_155_014 := by decide

theorem run36_started_208677685us_after_slot :
    run36.startedUs - run36.scheduledUs = 208_677_685 := by decide

theorem run48_started_209652688us_before_slot :
    run48.scheduledUs - run48.startedUs = 209_652_688 := by decide

theorem run00_started_249727394us_before_slot :
    run00h846.scheduledUs - run00h846.startedUs = 249_727_394 := by decide

theorem run24_completed_before_run36_started :
    run24.completedUs.getD 0 < run36.startedUs := by decide

theorem run24_to_run36_recorded_gap_us :
    run36.startedUs - run24.completedUs.getD 0 = 234_184_246 := by decide

theorem run48_started_before_run36_completed :
    run48.startedUs < run36.completedUs.getD 0 := by decide

theorem run36_run48_recorded_interval_intersection_us :
    run36.completedUs.getD 0 - run48.startedUs = 679_837_224 := by decide

theorem run36_completed_before_run00_started :
    run36.completedUs.getD 0 < run00h846.startedUs := by decide

theorem run36_to_run00_recorded_gap_us :
    run00h846.startedUs - run36.completedUs.getD 0 = 88_070 := by decide

theorem run48_started_before_run00_started :
    run48.startedUs < run00h846.startedUs := by decide

#print axioms worker_ring_has_nineteen_names
#print axioms h846_is_35_days_6_hours
#print axioms h846_s0_sequence_is_4230
#print axioms h846_s0_index_is_12
#print axioms h846_s0_selects_tern
#print axioms next_ring_index_is_13
#print axioms next_ring_identity_is_morrow
#print axioms next_active_slot_is_s2
#print axioms next_active_index_is_14
#print axioms next_active_identity_is_kestrel
#print axioms next_ring_identity_differs_from_next_active_identity
#print axioms active_assignment_count_over_19_hours
#print axioms all_nominal_assignment_count_over_19_hours
#print axioms each_worker_occurs_four_times_over_19_active_hours
#print axioms each_worker_occurs_five_times_over_19_full_hours
#print axioms first19_active_firings_have_16_distinct_indices
#print axioms first19_full_nominal_firings_have_19_distinct_indices
#print axioms tern_repeats_in_first19_active_firings
#print axioms meridian_repeats_in_first19_active_firings
#print axioms mercer_repeats_in_first19_active_firings
#print axioms run24_completed_and_cache_matches
#print axioms run36_completed_and_cache_matches
#print axioms run48_in_progress_and_cache_stale
#print axioms run00_in_progress_and_cache_stale
#print axioms run24_started_192155014us_after_slot
#print axioms run36_started_208677685us_after_slot
#print axioms run48_started_209652688us_before_slot
#print axioms run00_started_249727394us_before_slot
#print axioms run24_completed_before_run36_started
#print axioms run24_to_run36_recorded_gap_us
#print axioms run48_started_before_run36_completed
#print axioms run36_run48_recorded_interval_intersection_us
#print axioms run36_completed_before_run00_started
#print axioms run36_to_run00_recorded_gap_us
#print axioms run48_started_before_run00_started

end HsHVerification.TernH846ActiveSlotRotationEvidence
