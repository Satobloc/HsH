import Mathlib

/-!
Tern Rook / Comptroller, 2026-10-29 07:24 UTC.
Actual observed system: the five existing hourly ChatGPT Workshop Relay
automation records, privately retrieved by their exact IDs on Oct 29.
All five records showed enabled=true, last_run.recorded_status=completed,
and next_run_time=null. Signed start offsets and run durations are derived
from each record's scheduled_for, started_at and completed_at timestamps
in microseconds. These are scheduler metadata, NOT physical measurements,
H(s)H predictions, or evidence that future jobs will dispatch.

The current Nathan Direct relay prompt is the source for the five intended
phases and no-sixth-task constraint. This file encodes observed records
as premises. Lean verifies only the finite consequences of that encoding.
-/

namespace HsHVerification.TernSchedulerEvidence

structure TaskObservation where
  phase : String
  enabled : Bool
  lastCompleted : Bool
  nextReported : Option Nat
  startOffsetMicroseconds : Int
  runtimeMicroseconds : Nat
  deriving Repr, DecidableEq

def observed : List TaskObservation :=
  [ ⟨":00", true, true, none, -179765500, 408013334⟩
  , ⟨":12", true, true, none, 179794045, 484152863⟩
  , ⟨":24", true, true, none, -135999029, 365788738⟩
  , ⟨":36", true, true, none, -57152065, 1016001553⟩
  , ⟨":48", true, true, none, -269866901, 514582430⟩
  ]

def earlyCount : Nat :=
  (observed.filter (fun r => decide (r.startOffsetMicroseconds < 0))).length

def lateCount : Nat :=
  (observed.filter (fun r => decide (r.startOffsetMicroseconds > 0))).length

def overFifteenMinutes : Nat :=
  (observed.filter (fun r => decide (r.runtimeMicroseconds > 900000000))).length

theorem five_actual_records : observed.length = 5 := by decide
theorem all_enabled : observed.all (fun r => r.enabled) = true := by decide
theorem all_last_completed :
    observed.all (fun r => r.lastCompleted) = true := by decide
theorem all_next_unreported :
    observed.all (fun r => r.nextReported.isNone) = true := by decide
theorem four_started_before_nominal : earlyCount = 4 := by decide
theorem one_started_after_nominal : lateCount = 1 := by decide
theorem one_run_exceeded_fifteen_minutes : overFifteenMinutes = 1 := by decide

#print axioms five_actual_records
#print axioms all_enabled
#print axioms all_last_completed
#print axioms all_next_unreported
#print axioms four_started_before_nominal
#print axioms one_started_after_nominal
#print axioms one_run_exceeded_fifteen_minutes

end HsHVerification.TernSchedulerEvidence
