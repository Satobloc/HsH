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

def ringAt (i : Nat) : Option String := relayRing[i]?

theorem relayRing_length : relayRing.length = 19 := by decide

theorem h743_s2_sequence : 5 * 743 + 2 = 3717 := by decide

theorem h743_s2_index : (5 * 743 + 2) % 19 = 12 := by decide

theorem h743_s2_worker :
    ringAt ((5 * 743 + 2) % 19) = some "Tern Rook" := by rfl

theorem h743_s2_successor :
    ringAt (((5 * 743 + 2) + 1) % 19) = some "Morrow" := by rfl

theorem h743_s3_worker :
    ringAt ((5 * 743 + 3) % 19) = some "Morrow" := by rfl

theorem h743_s0_worker :
    ringAt ((5 * 743 + 0) % 19) = some "Nadir Voss" := by rfl

theorem h742_s4_worker :
    ringAt ((5 * 742 + 4) % 19) = some "Elias Kern" := by rfl

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

/-- Later exact-ID readback of the same :48 run ID at 23:40:56Z. -/
def run48Later : SchedulerSnapshot :=
  { phase := 4
    taskId := "6aa6c3bc02b48191b8a91a30d2a155e0"
    enabled := true
    scheduleMinute := 48
    runId := "1b06b14c-9e58-8328-b8a6-f5b291785bf9"
    scheduledUs := us 22 48 0 0
    startedUs := us 23 40 39 676243
    completedUs := none
    status := .inProgress
    latestResultRunId := some "e06d3067-1ba4-832d-b9db-d8732eeb5668"
    chatRef := none
    taskLastRunUs := us 22 11 15 543737
    taskUpdatedUs := us 22 11 39 534753
    nextRunUs := us 22 48 0 0 }

def observationUsLater : Nat := us 23 40 56 0


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

theorem h742_s4_same_run_id_across_readbacks :
    run48.runId = run48Later.runId ∧
    run48.taskId = run48Later.taskId ∧
    run48.scheduledUs = run48Later.scheduledUs := by decide

theorem h742_s4_started_at_field_changed :
    run48Later.startedUs - run48.startedUs = 1760759467 := by decide

theorem h742_s4_later_start_after_nominal :
    run48Later.startedUs - run48Later.scheduledUs = 3159676243 := by decide

theorem h742_s4_both_snapshots_in_progress :
    run48.status = .inProgress ∧ run48Later.status = .inProgress := by decide

theorem h742_s4_later_snapshot_still_in_progress_at_observation :
    run48Later.startedUs < observationUsLater ∧
    observationUsLater - run48Later.startedUs = 16323757 := by decide

theorem later_three_run_overlap_lower_bound :
    run24.startedUs ≤ run36.startedUs ∧
    run36.startedUs ≤ run48Later.startedUs ∧
    run48Later.startedUs < observationUsLater ∧
    observationUsLater - run48Later.startedUs = 16323757 := by decide

theorem three_run_overlap_lower_bound :
    run48.startedUs ≤ run24.startedUs ∧
    run24.startedUs ≤ run36.startedUs ∧
    run36.startedUs < observationUs ∧
    observationUs - run36.startedUs = 24854583 := by decide

/-! ## Addendum: later :24 snapshot and h743:s4 cross-section

The later automation readback returned the same :24 task and run IDs but a
different recorded `started_at`. The :48 lease was now the h743:s4 Kestrel
occurrence. These remain formalizations of reported scheduler fields only.
-/

/-- Later :24 readback, same task/run/schedule/status, changed started_at. -/
def run24Later : SchedulerSnapshot :=
  { phase := 2
    taskId := "6abda4c8eda88191bf23a6f2849e9a17"
    enabled := true
    scheduleMinute := 24
    runId := "5721c93e-6810-832e-adcf-ce430ba7e3b7"
    scheduledUs := us 23 24 0 0
    startedUs := us 23 52 3 992301
    completedUs := none
    status := .inProgress
    latestResultRunId := some "cb7286dc-433c-8323-b174-d9431fa5a6a0"
    chatRef := none
    taskLastRunUs := us 22 37 31 603455
    taskUpdatedUs := us 22 37 53 789210
    nextRunUs := us 23 24 0 0 }

/-- Current h743:s4 :48 occurrence, deterministically Kestrel. -/
def run48H743 : SchedulerSnapshot :=
  { phase := 4
    taskId := "6aa6c3bc02b48191b8a91a30d2a155e0"
    enabled := true
    scheduleMinute := 48
    runId := "420a2c92-21fc-8333-bdc3-a5b6f85473ff"
    scheduledUs := us 23 48 0 0
    startedUs := us 23 49 12 492639
    completedUs := none
    status := .inProgress
    latestResultRunId := some "1b06b14c-9e58-8328-b8a6-f5b291785bf9"
    chatRef := none
    taskLastRunUs := us 23 47 3 871119
    taskUpdatedUs := us 23 47 26 472414
    nextRunUs := us 23 48 0 0 }

theorem h743_s4_sequence : 5 * 743 + 4 = 3719 := by decide

theorem h743_s4_index : (5 * 743 + 4) % 19 = 14 := by decide

theorem h743_s4_worker :
    ringAt ((5 * 743 + 4) % 19) = some "Kestrel" := by rfl

theorem h743_s4_successor :
    ringAt (((5 * 743 + 4) + 1) % 19) = some "Meridian" := by rfl

theorem h743_s2_same_run_and_schedule_across_readbacks :
    run24.runId = run24Later.runId ∧
    run24.taskId = run24Later.taskId ∧
    run24.scheduledUs = run24Later.scheduledUs := by
  exact ⟨rfl, rfl, rfl⟩

theorem h743_s2_started_at_field_changed :
    run24Later.startedUs - run24.startedUs = 1649042587 := by decide

theorem h743_s2_later_start_after_nominal :
    run24Later.startedUs - run24Later.scheduledUs = 1683992301 := by decide

theorem h743_s2_both_snapshots_in_progress :
    run24.status = .inProgress ∧ run24Later.status = .inProgress := by decide

theorem h743_s2_cached_result_fields :
    run24.latestResultRunId = some "cb7286dc-433c-8323-b174-d9431fa5a6a0" ∧
    run24Later.latestResultRunId = some "cb7286dc-433c-8323-b174-d9431fa5a6a0" ∧
    run24.runId = "5721c93e-6810-832e-adcf-ce430ba7e3b7" := by
  exact ⟨rfl, rfl, rfl⟩

theorem h743_s4_state_and_cache_fields :
    run48H743.status = .inProgress ∧
    run48H743.completedUs = none ∧
    run48H743.chatRef = none ∧
    run48H743.latestResultRunId = some "1b06b14c-9e58-8328-b8a6-f5b291785bf9" ∧
    run48H743.runId = "420a2c92-21fc-8333-bdc3-a5b6f85473ff" := by
  exact ⟨rfl, rfl, rfl, rfl, rfl⟩

theorem h743_s4_task_metadata_precedes_start :
    run48H743.taskLastRunUs < run48H743.startedUs ∧
    run48H743.taskUpdatedUs < run48H743.startedUs := by decide

theorem h743_latest_s2_s3_s4_states :
    run24Later.status = .inProgress ∧
    run36.status = .inProgress ∧
    run48H743.status = .inProgress := by decide

/-! ## Addendum: h743:s3 start-field mutation and h744:s0 current lease -/

/-- Later h743:s3 :36 readback; same run identity, changed started_at. -/
def run36Later : SchedulerSnapshot :=
  { phase := 3
    taskId := "6a9f52b69ec08191b0a2ba24a074f781"
    enabled := true
    scheduleMinute := 36
    runId := "72b112ed-2060-8322-bbc2-2c67cc950b99"
    scheduledUs := us 23 36 0 0
    startedUs := us 23 59 53 610868
    completedUs := none
    status := .inProgress
    latestResultRunId := some "b25fd8f4-e9bc-832b-beaa-16e00bc6a0d1"
    chatRef := none
    taskLastRunUs := us 22 39 32 682093
    taskUpdatedUs := us 22 40 15 174146
    nextRunUs := us 23 36 0 0 }

/-- h744:s0 :00 lease, deterministically Meridian. -/
def run00H744 : SchedulerSnapshot :=
  { phase := 0
    taskId := "6aa1fe0de5e48191b886496095b1343f"
    enabled := true
    scheduleMinute := 0
    runId := "77623cbd-8618-8330-a3bb-6a8ad48cf405"
    scheduledUs := us 24 0 0 0
    startedUs := us 23 57 44 238749
    completedUs := none
    status := .inProgress
    latestResultRunId := some "c03f589f-a870-8327-b6b5-903a18a439c0"
    chatRef := none
    taskLastRunUs := us 22 58 57 811717
    taskUpdatedUs := us 22 59 20 905241
    nextRunUs := us 24 0 0 0 }

theorem h743_s3_same_run_and_schedule_across_readbacks :
    run36.runId = run36Later.runId ∧
    run36.taskId = run36Later.taskId ∧
    run36.scheduledUs = run36Later.scheduledUs := by
  exact ⟨rfl, rfl, rfl⟩

theorem h743_s3_started_at_field_changed :
    run36Later.startedUs - run36.startedUs = 1665465451 := by decide

theorem h743_s3_later_start_after_nominal :
    run36Later.startedUs - run36Later.scheduledUs = 1433610868 := by decide

theorem h743_s3_both_snapshots_in_progress :
    run36.status = .inProgress ∧ run36Later.status = .inProgress := by decide

theorem h743_s3_cache_and_current_ids_recorded :
    run36.latestResultRunId = some "b25fd8f4-e9bc-832b-beaa-16e00bc6a0d1" ∧
    run36Later.latestResultRunId = some "b25fd8f4-e9bc-832b-beaa-16e00bc6a0d1" ∧
    run36.runId = "72b112ed-2060-8322-bbc2-2c67cc950b99" := by
  exact ⟨rfl, rfl, rfl⟩

theorem h744_s0_sequence : 5 * 744 + 0 = 3720 := by decide

theorem h744_s0_index : (5 * 744 + 0) % 19 = 15 := by decide

theorem h744_s0_worker :
    ringAt ((5 * 744 + 0) % 19) = some "Meridian" := by rfl

theorem h744_s0_successor :
    ringAt (((5 * 744 + 0) + 1) % 19) = some "Mercer" := by rfl

theorem h744_s0_started_before_nominal :
    run00H744.scheduledUs - run00H744.startedUs = 135761251 := by decide

theorem h744_s0_current_state_and_cache :
    run00H744.enabled = true ∧
    run00H744.status = .inProgress ∧
    run00H744.completedUs = none ∧
    run00H744.chatRef = none ∧
    run00H744.latestResultRunId = some "c03f589f-a870-8327-b6b5-903a18a439c0" := by
  exact ⟨rfl, rfl, rfl, rfl, rfl⟩

theorem h744_four_current_run_states :
    run00H744.status = .inProgress ∧
    run24Later.status = .inProgress ∧
    run36Later.status = .inProgress ∧
    run48H743.status = .inProgress := by decide

#print axioms h743_s4_worker
#print axioms h743_s2_same_run_and_schedule_across_readbacks
#print axioms h743_s2_started_at_field_changed
#print axioms h743_s4_state_and_cache_fields
#print axioms h743_s3_started_at_field_changed
#print axioms h744_s0_started_before_nominal
#print axioms h744_four_current_run_states

#print axioms h743_s2_worker
#print axioms three_run_overlap_lower_bound
#print axioms h742_s4_started_at_field_changed
#print axioms later_three_run_overlap_lower_bound


/-! ## General 19-hour rotation-cycle proof

The deterministic index function is an affine map modulo 19. This section
checks the fixed five-slot ring directly: every slot visits every ring index
exactly once over 19 consecutive nominal UTC hours, and the fixed ring labels
are pairwise distinct. These are properties of the encoded schedule only;
they do not authenticate worker identity, conversation continuity, execution,
delivery, or independence of model instances.
-/

/-- The deterministic worker index for nominal UTC hour h and slot s. -/
def rotationIndex (h s : Nat) : Nat := (5 * h + s) % 19

/-- Every fixed slot repeats its index after 19 nominal UTC hours. -/
theorem rotationIndex_period_19 (h s : Nat) :
    rotationIndex (h + 19) s = rotationIndex h s := by
  unfold rotationIndex
  omega

/-- The configured 19-name ring contains no duplicate labels. -/
theorem relayRing_nodup : relayRing.Nodup := by
  decide

/-- Indices visited by one fixed slot over 19 consecutive nominal UTC hours. -/
def slotCycleImage (s : Fin 5) : Finset (Fin 19) :=
  Finset.univ.image (fun h : Fin 19 =>
    ⟨rotationIndex h.val s.val, Nat.mod_lt _ (by decide)⟩)

/-- Each of the five fixed slots visits all 19 ring indices in one 19-hour cycle. -/
theorem slotCycleImage_complete (s : Fin 5) :
    slotCycleImage s = Finset.univ := by
  fin_cases s <;> decide

/-- The image of each slot's 19-hour cycle has exactly 19 distinct indices. -/
theorem slotCycleImage_card (s : Fin 5) :
    (slotCycleImage s).card = 19 := by
  rw [slotCycleImage_complete]
  simp

#print axioms rotationIndex_period_19
#print axioms relayRing_nodup
#print axioms slotCycleImage_complete
#print axioms slotCycleImage_card
/-! The following strengthens the base-cycle result to every starting
residue. The theorem is about the five mathematical phase values `0..4`;
the current :12 automation is disabled, so this does not assert that phase
1 is an active task. The four enabled phases remain `0, 2, 3, 4`.
-/

/-- Indices visited by slot s during 19 consecutive hours from start residue. -/
def slotCycleImageFrom (s : Fin 5) (start : Fin 19) : Finset (Fin 19) :=
  Finset.univ.image (fun offset : Fin 19 =>
    ⟨rotationIndex (start.val + offset.val) s.val, Nat.mod_lt _ (by decide)⟩)

/-- Any 19-hour window covers every ring index for every mathematical slot. -/
theorem slotCycleImageFrom_complete (s : Fin 5) (start : Fin 19) :
    slotCycleImageFrom s start = Finset.univ := by
  fin_cases s <;> fin_cases start <;> decide

/-- Every shifted 19-hour slot window contains exactly 19 distinct indices. -/
theorem slotCycleImageFrom_card (s : Fin 5) (start : Fin 19) :
    (slotCycleImageFrom s start).card = 19 := by
  rw [slotCycleImageFrom_complete]
  simp

#print axioms slotCycleImageFrom_complete
#print axioms slotCycleImageFrom_card
end HsHVerification.TernH743SchedulerSnapshotEvidence
