import Mathlib

/-!
Tern Rook / Comptroller, 2026-11-01 nominal 11:24Z run.

This module formalizes a bounded scheduler/rotation snapshot, not a
physical model and not proof of historical worker participation.

Sources:
* Fixed 19-name ring and sequence rule supplied in Nathan's current relay
  instruction. Epoch is 2026-10-11T00:00:00Z; nominal hour h=515; slot s=2.
* :48 automation task 6aa6c3bc02b48191b8a91a30d2a155e0, run
  00be68ec-2850-8333-8c04-f8b414023d62:
  scheduled 10:48:00Z, started 10:44:13.608876Z,
  completed 10:56:23.862464Z, recorded completed.
* :00 automation task 6aa1fe0de5e48191b886496095b1343f, run
  bb3641e4-0cf8-8332-bb79-8cceba5ee856:
  scheduled 11:00:00Z, started 10:55:23.201429Z,
  completed 11:20:27.696024Z, recorded failed. Failure reason not exposed
  in the scheduler record inspected here.
* :36 automation task 6a9f52b69ec08191b0a2ba24a074f781, run
  2780662b-122c-8322-8203-c01422448f4b:
  scheduled 10:36:00Z, started 10:59:10.922478Z, recorded in_progress
  at the final peek; no completion timestamp was available.
* Current :24 execution context: scheduled 11:24:00Z, started
  11:19:05Z. The task's global roster entry remains enabled; its
  per-ID peek was NOT_FOUND/NOT_ACCESSIBLE, so this context does not
  assert an independently verified task record or a chat_ref.

All timestamps below are integer microseconds since 2026-11-01T10:00:00Z.
Lean verifies only the closed propositions over these transcribed inputs.
It does not authenticate scheduler APIs, prove causal scheduler semantics,
or establish any physical proposition.
-/

namespace HsHVerification.TernH515SchedulerOverlapEvidence

def ring : List String :=
  [ "Sable", "Loom", "Aster", "Ariadne", "Alberr", "Mira", "Aldus"
  , "Calder", "Hale", "Elias Kern", "Nadir Voss", "Enheduanna"
  , "Tern Rook", "Morrow", "Kestrel", "Meridian", "Mercer", "Ravel"
  , "Orson Vay"
  ]

def h : Nat := 515
def slot : Nat := 2
def sequence : Nat := 5 * h + slot
def selectedIndex : Nat := sequence % 19
def nextIndex : Nat := (sequence + 1) % 19

theorem epoch_hour_is_515 : 21 * 24 + 11 = h := by decide
theorem ring_has_nineteen_names : ring.length = 19 := by decide
theorem sequence_is_2577 : sequence = 2577 := by decide
theorem selected_index_is_12 : selectedIndex = 12 := by decide
theorem selected_name_is_tern :
    ring[selectedIndex]? = some "Tern Rook" := by decide
theorem next_index_is_13 : nextIndex = 13 := by decide
theorem next_name_is_morrow :
    ring[nextIndex]? = some "Morrow" := by decide

inductive RecordedStatus where
  | completed
  | failed
  | inProgress
  deriving DecidableEq, Repr

def run48Status : RecordedStatus := .completed
def run00Status : RecordedStatus := .failed
def run36StatusAtPeek : RecordedStatus := .inProgress

theorem run48_recorded_completed :
    run48Status = .completed := by decide
theorem run00_recorded_failed :
    run00Status = .failed := by decide
theorem run36_recorded_in_progress :
    run36StatusAtPeek = .inProgress := by decide

-- :48 run, in microseconds since 10:00:00Z.
def run48ScheduledUs : Nat := 2_880_000_000
def run48StartedUs : Nat := 2_653_608_876
def run48CompletedUs : Nat := 3_383_862_464

-- :00 run, in microseconds since 10:00:00Z.
def run00ScheduledUs : Nat := 3_600_000_000
def run00StartedUs : Nat := 3_323_201_429
def run00CompletedUs : Nat := 4_827_696_024

-- :36 run, in microseconds since 10:00:00Z.
def run36ScheduledUs : Nat := 2_160_000_000
def run36StartedUs : Nat := 3_550_922_478

-- Current :24 automation execution context.
def run24ScheduledUs : Nat := 5_040_000_000
def run24StartedUs : Nat := 4_745_000_000

theorem run48_started_226391124us_early :
    run48ScheduledUs - run48StartedUs = 226_391_124 := by decide
theorem run48_duration_730253588us :
    run48CompletedUs - run48StartedUs = 730_253_588 := by decide
theorem run00_started_276798571us_early :
    run00ScheduledUs - run00StartedUs = 276_798_571 := by decide
theorem run00_duration_1504494595us :
    run00CompletedUs - run00StartedUs = 1_504_494_595 := by decide
theorem run36_started_1390922478us_late :
    run36StartedUs - run36ScheduledUs = 1_390_922_478 := by decide
theorem run24_started_295000000us_early :
    run24ScheduledUs - run24StartedUs = 295_000_000 := by decide

-- The completed :48 interval and completed :00 interval overlap exactly.
theorem run48_and_run00_intervals_overlap :
    run00StartedUs < run48CompletedUs ∧
    run48StartedUs < run00CompletedUs := by decide

theorem run48_run00_overlap_60661035us :
    run48CompletedUs - run00StartedUs = 60_661_035 := by decide

-- The current :24 execution began before the :00 run's recorded completion.
theorem current_run24_began_before_run00_completed :
    run24StartedUs < run00CompletedUs := by decide

theorem current_run24_run00_overlap_82696024us :
    run00CompletedUs - run24StartedUs = 82_696_024 := by decide

#print axioms epoch_hour_is_515
#print axioms ring_has_nineteen_names
#print axioms sequence_is_2577
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_index_is_13
#print axioms next_name_is_morrow
#print axioms run48_recorded_completed
#print axioms run00_recorded_failed
#print axioms run36_recorded_in_progress
#print axioms run48_started_226391124us_early
#print axioms run48_duration_730253588us
#print axioms run00_started_276798571us_early
#print axioms run00_duration_1504494595us
#print axioms run36_started_1390922478us_late
#print axioms run24_started_295000000us_early
#print axioms run48_and_run00_intervals_overlap
#print axioms run48_run00_overlap_60661035us
#print axioms current_run24_began_before_run00_completed
#print axioms current_run24_run00_overlap_82696024us

end HsHVerification.TernH515SchedulerOverlapEvidence
