import Mathlib

/-!
# Tern h743 scheduler event cross-section

This module formalizes a bounded, source-recorded scheduler snapshot read at
2026-11-10T23:32:33Z. Times are UTC microseconds since 00:00Z on that date.

The theorems establish only arithmetic and finite-list facts about the
transcribed records. They do not authenticate a worker/thread, explain
scheduler backend behavior, prove delivery/consumption, or establish that
the source-to-record transcription is sound.
-/

namespace HsHVerification.TernH743SchedulerSnapshotEvidence

/-- Fixed 19-label routing ring, in the user-specified order. -/
def relayRing : List String :=
  [ "Sable", "Loom", "Aster", "Ariadne", "Alberr", "Mira", "Aldus",
    "Calder", "Hale", "Elias Kern", "Nadir Voss", "Enheduanna",
    "Tern Rook", "Morrow", "Kestrel", "Meridian", "Mercer", "Ravel",
    "Orson Vay" ]

def ringAt (i : Nat) : Option String := relayRing.get? i

theorem relayRing_length : relayRing.length = 19 := by decide

theorem h743_s2_sequence : 5 * 743 + 2 = 3717 := by decide

theorem h743_s2_index : (5 * 743 + 2) % 19 = 12 := by decide

theorem h743_s2_worker :
    ringAt ((5 * 743 + 2) % 19) = some "Tern Rook" := by decide

theorem h743_s2_successor :
    ringAt (((5 * 743 + 2) + 1) % 19) = some "Morrow" := by decide

theorem h743_s3_worker :
    ringAt ((5 * 743 + 3) % 19) = some "Morrow" := by decide

theorem h743_s0_worker :
    ringAt ((5 * 743 + 0) % 19) = some "Nadir Voss" := by decide

theorem h742_s4_worker :
    ringAt ((5 * 742 + 4) % 19) = some "Elias Kern" := by decide

/-- Convert a same-day UTC clock reading to microseconds since midnight. -/
def us (hour minute second micros : Nat) : Nat :=
  ((hour * 3600 + minute * 60 + second) * 1000000) + micros

inductive RunStatus where
  | inProgress
  | completed
  deriving DecidableEq, Repr

/-- Only fields needed for the bounded scheduler comparison are represented. -/
structure SchedulerSnapshot where
  phase : Nat
  taskId : String
  enabled : Bool
  scheduleMinute : Nat
  runId : String
  scheduledUs : Nat
  startedUs : Nat
  completedUs : Option Nat
  status : RunStatus
  latestResultRunId : Option String
  chatRef : Option String
  taskLastRunUs : Nat
  taskUpdatedUs : Nat
  nextRunUs : Nat
  deriving DecidableEq, Repr

/-- :00 h743:s0, Nadir Voss. -/
def run00 : SchedulerSnapshot :=
  { phase := 0
    taskId := "6aa1fe0de5e48191b886496095b1343f"
    enabled := true
    scheduleMinute := 0
    runId := "c03f589f-a870-8327-b6b5-903a18a439c0"
    scheduledUs := us 23 0 0 0
    startedUs := us 22 55 11 376747
    completedUs := some (us 22 58 53 476837)
    status := .completed
    latestResultRunId := some "c03f589f-a870-8327-b6b5-903a18a439c0"
    chatRef := some "6ae7dcec-42d8-83e9-a704-5b6ed6589d9e"
    taskLastRunUs := us 22 58 57 811717
    taskUpdatedUs := us 22 59 20 905241
    nextRunUs := us 24 0 0 0 }

/-- :24 h743:s2, Tern Rook. This is the user's existing protected task ID. -/
def run24 : SchedulerSnapshot :=
  { phase := 2
    taskId := "6abda4c8eda88191bf23a6f2849e9a17"
    enabled := true
    scheduleMinute := 24
    runId := "5721c93e-6810-832e-adcf-ce430ba7e3b7"
    scheduledUs := us 23 24 0 0
    startedUs := us 23 24 34 949714
    completedUs := none
    status := .inProgress
    latestResultRunId := some "cb7286dc-433c-8323-b174-d9431fa5a6a0"
    chatRef := none
    taskLastRunUs := us 22 37 31 603455
    taskUpdatedUs := us 22 37 53 789210
    nextRunUs := us 23 24 0 0 }

/-- :36 h743:s3, Morrow. -/
def run36 : SchedulerSnapshot :=
  { phase := 3
    taskId := "6a9f52b69ec08191b0a2ba24a074f781"
    enabled := true
    scheduleMinute := 36
    runId := "72b112ed-2060-8322-bbc2-2c67cc950b99"
    scheduledUs := us 23 36 0 0
    startedUs := us 23 32 8 145417
    completedUs := none
    status := .inProgress
    latestResultRunId := some "b25fd8f4-e9bc-832b-beaa-16e00bc6a0d1"
    chatRef := none
    taskLastRunUs := us 22 39 32 682093
    taskUpdatedUs := us 22 40 15 174146
    nextRunUs := us 23 36 0 0 }

/-- :48 h742:s4, Elias Kern. It is still in progress at the observation time. -/
def run48 : SchedulerSnapshot :=
  { phase := 4
    taskId := "6aa6c3bc02b48191b8a91a30d2a155e0"
    enabled := true
    scheduleMinute := 48
    runId := "1b06b14c-9e58-8328-b8a6-f5b291785bf9"
    scheduledUs := us 22 48 0 0
    startedUs := us 23 11 18 916776
    completedUs := none
    status := .inProgress
    latestResultRunId := some "e06d3067-1ba4-832d-b9db-d8732eeb5668"
    chatRef := none
    taskLastRunUs := us 22 11 15 543737
    taskUpdatedUs := us 22 11 39 534753
    nextRunUs := us 22 48 0 0 }

/-- The prior :36 result still cached by the current :36 task. -/
def run36Prior : SchedulerSnapshot :=
  { phase := 3
    taskId := "6a9f52b69ec08191b0a2ba24a074f781"
    enabled := true
    scheduleMinute := 36
    runId := "b25fd8f4-e9bc-832b-beaa-16e00bc6a0d1"
    scheduledUs := us 22 36 0 0
    startedUs := us 22 37 44 359366
    completedUs := some (us 22 39 30 681934)
    status := .completed
    latestResultRunId := some "b25fd8f4-e9bc-832b-beaa-16e00bc6a0d1"
    chatRef := some "6ae7ff45-d118-83ea-9e33-6277d620feb4"
    taskLastRunUs := us 22 39 32 682093
    taskUpdatedUs := us 22 40 15 174146
    nextRunUs := us 23 36 0 0 }

def observationUs : Nat := us 23 32 33 0

theorem protected24_task_identity_and_schedule :
    run24.enabled = true ∧
    run24.taskId = "6abda4c8eda88191bf23a6f2849e9a17" ∧
    run24.scheduleMinute = 24 := by decide

theorem current_run_states :
    run00.status = .completed ∧
    run24.status = .inProgress ∧
    run36.status = .inProgress ∧
    run48.status = .inProgress := by decide

theorem current_run_chat_refs :
    run24.chatRef = none ∧
    run36.chatRef = none ∧
    run48.chatRef = none := by decide

theorem latest_result_alignment :
    run00.latestResultRunId = some run00.runId ∧
    run36.latestResultRunId = some run36Prior.runId := by decide

theorem latest_result_is_older_run :
    run24.latestResultRunId ≠ some run24.runId ∧
    run36.latestResultRunId ≠ some run36.runId ∧
    run48.latestResultRunId ≠ some run48.runId := by decide

theorem h743_s0_start_and_completion_before_nominal :
    run00.scheduledUs - run00.startedUs = 288623253 ∧
    run00.scheduledUs - run00.completedUs.getD 0 = 66523163 := by decide

theorem h742_s3_start_and_completion_after_nominal :
    run36Prior.startedUs - run36Prior.scheduledUs = 104359366 ∧
    run36Prior.completedUs.getD 0 - run36Prior.scheduledUs = 210681934 := by decide

theorem h742_s4_start_after_nominal :
    run48.startedUs - run48.scheduledUs = 1398916776 := by decide

theorem h743_s2_start_after_nominal :
    run24.startedUs - run24.scheduledUs = 34949714 := by decide

theorem h743_s3_start_before_nominal :
    run36.scheduledUs - run36.startedUs = 231854583 := by decide

theorem current_task_level_metadata_precedes_run_starts :
    run24.taskLastRunUs < run24.startedUs ∧
    run24.taskUpdatedUs < run24.startedUs ∧
    run36.taskLastRunUs < run36.startedUs ∧
    run36.taskUpdatedUs < run36.startedUs ∧
    run48.taskLastRunUs < run48.startedUs ∧
    run48.taskUpdatedUs < run48.startedUs := by decide

theorem next_run_metadata_at_observation :
    run24.nextRunUs < observationUs ∧
    observationUs < run36.nextRunUs ∧
    run48.nextRunUs < observationUs := by decide

/-- At least 24.854583 seconds of three-way overlap are visible at the readback. -/
theorem three_run_overlap_lower_bound :
    run48.startedUs ≤ run24.startedUs ∧
    run24.startedUs ≤ run36.startedUs ∧
    run36.startedUs < observationUs ∧
    observationUs - run36.startedUs = 24854583 := by decide

#print axioms h743_s2_worker
#print axioms three_run_overlap_lower_bound

end HsHVerification.TernH743SchedulerSnapshotEvidence
