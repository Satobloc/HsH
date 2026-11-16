import Mathlib

/-!
# Tern h743 scheduler event cross-section

This module collects bounded, source-recorded scheduler cross-sections:
- h743 observations on 2026-11-10;
- h758 observations on 2026-11-11.

The `us` function encodes a UTC clock-of-day in microseconds since midnight;
the date is block-level metadata and is not part of the numeric coordinate.
All start-time subtraction theorems here compare observations from the same
declared UTC date. Cross-date ordering or subtraction is not formalized.

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

/-- Encode a UTC clock-of-day in microseconds since midnight, not an absolute timestamp. -/
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


/-! ## Current h758:s3 nominal selection

The current fixed :36 phase is h=758, s=3. This verifies the deterministic
ring lookup for this nominal slot only; it does not authenticate a worker,
thread, execution, delivery, or independent model instance.
-/

theorem h758_s3_sequence : 5 * 758 + 3 = 3793 := by decide

theorem h758_s3_index : rotationIndex 758 3 = 12 := by decide

theorem h758_s3_worker :
    ringAt (rotationIndex 758 3) = some "Tern Rook" := by rfl

theorem h758_s3_successor :
    ringAt ((rotationIndex 758 3 + 1) % 19) = some "Morrow" := by rfl

#print axioms h758_s3_sequence
#print axioms h758_s3_index
#print axioms h758_s3_worker
#print axioms h758_s3_successor


/-! ## h758 same-run-ID start-time field changes

These observations are client-readback records for the same run IDs and nominal
slots. The source JSON preserves the separate request/response windows. This
formalization checks only the transcribed identifiers, schedule fields, status,
chat-reference absence, and integer microsecond differences. It does not
identify scheduler attempts or explain why a mutable start-time field changed.
-/

/-- Minimal run-level fields needed to compare successive scheduler readbacks. -/
structure RunStampObservation where
  runId : String
  scheduledUs : Nat
  startedUs : Nat
  status : RunStatus
  chatRef : Option String
  deriving DecidableEq, Repr

/-- First readback of Tern h758:s3 on 2026-11-11, observed at 14:55:32.706Z. -/
def h758S3FirstReadback : RunStampObservation :=
  { runId := "2e7d7727-c150-8327-a9d7-9d78a6ab6cdc"
    scheduledUs := us 14 36 0 0
    startedUs := us 14 35 51 499419
    status := .inProgress
    chatRef := none }

/-- Later readback of the same Tern run on 2026-11-11, observed at 15:14:29.882Z. -/
def h758S3LaterReadback : RunStampObservation :=
  { runId := "2e7d7727-c150-8327-a9d7-9d78a6ab6cdc"
    scheduledUs := us 14 36 0 0
    startedUs := us 15 3 55 226485
    status := .inProgress
    chatRef := none }

theorem h758_s3_same_run_schedule_status_and_chat_across_readbacks :
    h758S3FirstReadback.runId = h758S3LaterReadback.runId ∧
    h758S3FirstReadback.scheduledUs = h758S3LaterReadback.scheduledUs ∧
    h758S3FirstReadback.status = h758S3LaterReadback.status ∧
    h758S3FirstReadback.chatRef = h758S3LaterReadback.chatRef := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h758_s3_started_at_field_changed :
    h758S3FirstReadback.startedUs ≠ h758S3LaterReadback.startedUs := by
  decide

theorem h758_s3_started_at_delta_us :
    h758S3LaterReadback.startedUs - h758S3FirstReadback.startedUs = 1683727066 := by
  decide

/-- First readback of Morrow h758:s4 on 2026-11-11, observed at 14:55:33.883Z. -/
def h758S4FirstReadback : RunStampObservation :=
  { runId := "0eeaf9b6-a868-8324-9e7f-b9d770e22d66"
    scheduledUs := us 14 48 0 0
    startedUs := us 14 44 44 693441
    status := .inProgress
    chatRef := none }

/-- Later readback of the same Morrow run on 2026-11-11, observed at 15:14:31.395Z. -/
def h758S4LaterReadback : RunStampObservation :=
  { runId := "0eeaf9b6-a868-8324-9e7f-b9d770e22d66"
    scheduledUs := us 14 48 0 0
    startedUs := us 15 12 21 561440
    status := .inProgress
    chatRef := none }

theorem h758_s4_same_run_schedule_status_and_chat_across_readbacks :
    h758S4FirstReadback.runId = h758S4LaterReadback.runId ∧
    h758S4FirstReadback.scheduledUs = h758S4LaterReadback.scheduledUs ∧
    h758S4FirstReadback.status = h758S4LaterReadback.status ∧
    h758S4FirstReadback.chatRef = h758S4LaterReadback.chatRef := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h758_s4_started_at_field_changed :
    h758S4FirstReadback.startedUs ≠ h758S4LaterReadback.startedUs := by
  decide

theorem h758_s4_started_at_delta_us :
    h758S4LaterReadback.startedUs - h758S4FirstReadback.startedUs = 1656867999 := by
  decide

#print axioms h758_s3_same_run_schedule_status_and_chat_across_readbacks
#print axioms h758_s3_started_at_field_changed
#print axioms h758_s3_started_at_delta_us
#print axioms h758_s4_same_run_schedule_status_and_chat_across_readbacks
#print axioms h758_s4_started_at_field_changed
#print axioms h758_s4_started_at_delta_us



/-- Third readback of the same Tern h758:s3 run on 2026-11-11, observed in the client
    interval 15:36:35.551Z–15:36:39.327Z. -/
def h758S3ThirdReadback : RunStampObservation :=
  { runId := "2e7d7727-c150-8327-a9d7-9d78a6ab6cdc"
    scheduledUs := us 14 36 0 0
    startedUs := us 15 33 30 430957
    status := .inProgress
    chatRef := none }

theorem h758_s3_later_third_same_run_schedule_status_and_chat_across_readbacks :
    h758S3LaterReadback.runId = h758S3ThirdReadback.runId ∧
    h758S3LaterReadback.scheduledUs = h758S3ThirdReadback.scheduledUs ∧
    h758S3LaterReadback.status = h758S3ThirdReadback.status ∧
    h758S3LaterReadback.chatRef = h758S3ThirdReadback.chatRef := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h758_s3_third_started_at_field_changed :
    h758S3LaterReadback.startedUs ≠ h758S3ThirdReadback.startedUs := by
  decide

theorem h758_s3_third_started_at_delta_us :
    h758S3ThirdReadback.startedUs - h758S3LaterReadback.startedUs = 1775204472 := by
  decide

#print axioms h758_s3_later_third_same_run_schedule_status_and_chat_across_readbacks
#print axioms h758_s3_third_started_at_field_changed
#print axioms h758_s3_third_started_at_delta_us


/-! ## h762:s2 current :24 nominal selection

The fixed ring and user-specified sequence formula select Tern Rook at index 12;
the next ring index is Morrow at index 13. These are deterministic properties
of the encoded 19-name list only. They do not authenticate the executing
instance or establish a thread, delivery, or consumption.
-/

theorem h762_s2_sequence : 5 * 762 + 2 = 3812 := by decide

theorem h762_s2_index : rotationIndex 762 2 = 12 := by decide

theorem h762_s2_worker :
    ringAt (rotationIndex 762 2) = some "Tern Rook" := by rfl

theorem h762_s2_successor :
    ringAt ((rotationIndex 762 2 + 1) % 19) = some "Morrow" := by rfl

theorem h762_s3_worker :
    ringAt (rotationIndex 762 3) = some "Morrow" := by rfl

#print axioms h762_s2_sequence
#print axioms h762_s2_index
#print axioms h762_s2_worker
#print axioms h762_s2_successor
#print axioms h762_s3_worker



/-! ## h762 four-slot scheduler readbacks and same-run-ID status reversal

All timestamps below are UTC clock-of-day microseconds on 2026-11-11.
The :00 first readback was returned in the 18:53Z collection batch; its exact
client request interval was not retained. Later request/response windows are
preserved in the companion observation JSON. These records are normalized
connector observations, not raw HTTP bytes or provider-side event timestamps.

The :36 task's returned current run is still scheduled_for 17:36Z (h761:s3);
it is not relabeled as the next h762:s3 Morrow occurrence at 19:36Z.
-/

inductive ObservedRunStatus where
  | inProgress
  | failed
  | completed
  deriving DecidableEq, Repr

/-- Minimal run fields needed for the h762 cross-slot comparison. -/
structure RunRecordObservation where
  runId : String
  scheduledUs : Nat
  startedUs : Nat
  completedUs : Option Nat
  status : ObservedRunStatus
  latestResultRunId : Option String
  chatRef : Option String
  deriving DecidableEq, Repr

/-- First h762:s0 readback: Nadir's run was returned FAILED at 18:53Z. -/
def h762S0FailedReadback : RunRecordObservation :=
  { runId := "54491578-3cc0-8330-a031-4c1986ef2314"
    scheduledUs := us 18 0 0 0
    startedUs := us 18 27 59 644661
    completedUs := some (us 18 53 3 64133)
    status := .failed
    latestResultRunId := some "1e093ebd-e478-8325-86da-dd5fbf183847"
    chatRef := none }

/-- Later readback of the same h762:s0 run ID: status returned IN_PROGRESS. -/
def h762S0LaterReadback : RunRecordObservation :=
  { runId := "54491578-3cc0-8330-a031-4c1986ef2314"
    scheduledUs := us 18 0 0 0
    startedUs := us 18 57 19 294331
    completedUs := none
    status := .inProgress
    latestResultRunId := some "1e093ebd-e478-8325-86da-dd5fbf183847"
    chatRef := none }

/-- h762:s2 Tern run, read 18:59:56.770Z–18:59:59.337Z. -/
def h762S2Readback : RunRecordObservation :=
  { runId := "14db7f33-1298-8323-abb6-ee6f7091c3c0"
    scheduledUs := us 18 24 0 0
    startedUs := us 18 50 18 452090
    completedUs := none
    status := .inProgress
    latestResultRunId := some "325da37c-3fc8-832c-8943-5e5032f0bc39"
    chatRef := none }

/-- :36 lease's returned current run is still h761:s3, scheduled 17:36Z. -/
def h761S3ReadbackAtH762 : RunRecordObservation :=
  { runId := "23309e03-717c-8320-8c00-475ce51856d9"
    scheduledUs := us 17 36 0 0
    startedUs := us 18 36 52 771813
    completedUs := none
    status := .inProgress
    latestResultRunId := some "ac334e49-e780-8329-bced-028ccc39f86a"
    chatRef := none }

/-- h762:s4 Kestrel run, read 19:00:03.051Z–19:00:04.535Z. -/
def h762S4Readback : RunRecordObservation :=
  { runId := "90ced1b5-1ff4-8328-a31e-baee21c8846f"
    scheduledUs := us 18 48 0 0
    startedUs := us 18 50 43 600824
    completedUs := none
    status := .inProgress
    latestResultRunId := some "fa4f4310-8e88-8331-b416-f18113f51439"
    chatRef := none }

/-- Task-level metadata returned for the :24 lease at 18:59:56.770Z–18:59:59.337Z. -/
structure TaskMetadataObservation where
  lastRunUs : Nat
  updatedUs : Nat
  nextRunUs : Nat
  deriving DecidableEq, Repr

def h762S2TaskMetadata : TaskMetadataObservation :=
  { lastRunUs := us 17 39 25 974700
    updatedUs := us 17 39 49 814627
    nextRunUs := us 18 24 0 0 }

theorem h762_s0_same_run_id_schedule_cache_and_chat :
    h762S0FailedReadback.runId = h762S0LaterReadback.runId ∧
    h762S0FailedReadback.scheduledUs = h762S0LaterReadback.scheduledUs ∧
    h762S0FailedReadback.latestResultRunId = h762S0LaterReadback.latestResultRunId ∧
    h762S0FailedReadback.chatRef = h762S0LaterReadback.chatRef := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h762_s0_status_and_completion_reversed :
    h762S0FailedReadback.status = .failed ∧
    h762S0FailedReadback.completedUs = some (us 18 53 3 64133) ∧
    h762S0LaterReadback.status = .inProgress ∧
    h762S0LaterReadback.completedUs = none := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h762_s0_started_at_delta_us :
    h762S0LaterReadback.startedUs - h762S0FailedReadback.startedUs = 1759649670 := by
  decide

theorem h762_s0_later_started_after_prior_completion_us :
    h762S0LaterReadback.startedUs - (us 18 53 3 64133) = 256230198 := by
  decide

theorem h762_s0_later_started_after_nominal_us :
    h762S0LaterReadback.startedUs - h762S0LaterReadback.scheduledUs = 3439294331 := by
  decide

theorem h762_s2_started_after_nominal_us :
    h762S2Readback.startedUs - h762S2Readback.scheduledUs = 1578452090 := by
  decide

theorem h761_s3_lease_run_started_after_nominal_us :
    h761S3ReadbackAtH762.startedUs - h761S3ReadbackAtH762.scheduledUs = 3652771813 := by
  decide

theorem h762_s4_started_after_nominal_us :
    h762S4Readback.startedUs - h762S4Readback.scheduledUs = 163600824 := by
  decide

/-- Four enabled lease records were returned IN_PROGRESS in the same
    18:59:53Z–19:00:04Z collection window. The :36 record retains its own
    17:36Z scheduled_for value; this theorem does not infer worker execution
    or a future :36 occurrence. -/
theorem h762_four_returned_run_records_in_progress :
    h762S0LaterReadback.status = .inProgress ∧
    h762S2Readback.status = .inProgress ∧
    h761S3ReadbackAtH762.status = .inProgress ∧
    h762S4Readback.status = .inProgress := by
  decide

theorem h762_s2_task_metadata_precedes_current_start :
    h762S2TaskMetadata.lastRunUs < h762S2Readback.startedUs ∧
    h762S2TaskMetadata.updatedUs < h762S2Readback.startedUs ∧
    h762S2TaskMetadata.nextRunUs = h762S2Readback.scheduledUs := by
  decide

theorem h762_s2_current_run_id_value :
    h762S2Readback.runId = "14db7f33-1298-8323-abb6-ee6f7091c3c0" := by
  rfl

theorem h762_s2_latest_result_pointer_value :
    h762S2Readback.latestResultRunId =
      some "325da37c-3fc8-832c-8943-5e5032f0bc39" := by
  rfl

theorem h762_s2_current_chat_ref_absent :
    h762S2Readback.chatRef = none := by
  rfl

#print axioms h762_s0_same_run_id_schedule_cache_and_chat
#print axioms h762_s0_status_and_completion_reversed
#print axioms h762_s0_started_at_delta_us
#print axioms h762_s0_later_started_after_prior_completion_us
#print axioms h762_s0_later_started_after_nominal_us
#print axioms h762_s2_started_after_nominal_us
#print axioms h761_s3_lease_run_started_after_nominal_us
#print axioms h762_s4_started_after_nominal_us
#print axioms h762_four_returned_run_records_in_progress
#print axioms h762_s2_task_metadata_precedes_current_start
#print axioms h762_s2_current_run_id_value
#print axioms h762_s2_latest_result_pointer_value
#print axioms h762_s2_current_chat_ref_absent



/-! ## h762 follow-up :36 completion readback

Client request/response interval: 2026-11-11T19:10:22.980Z–19:10:23.709Z.
This is the returned :36 lease run still scheduled_for 17:36Z (h761:s3), not
the next h762:s3 Morrow occurrence. The task-level metadata has now advanced
to the next nominal :36 occurrence at 19:36Z. -/

def h762S3CompletedReadback : RunRecordObservation :=
  { runId := "23309e03-717c-8320-8c00-475ce51856d9"
    scheduledUs := us 17 36 0 0
    startedUs := us 18 36 52 771813
    completedUs := some (us 19 1 56 884008)
    status := .failed
    latestResultRunId := some "23309e03-717c-8320-8c00-475ce51856d9"
    chatRef := none }

def h762S3TaskMetadataAfterCompletion : TaskMetadataObservation :=
  { lastRunUs := us 19 1 58 865835
    updatedUs := us 19 2 21 116576
    nextRunUs := us 19 36 0 0 }

theorem h762_s3_completed_failed_readback :
    h762S3CompletedReadback.status = .failed ∧
    h762S3CompletedReadback.completedUs = some (us 19 1 56 884008) ∧
    h762S3CompletedReadback.latestResultRunId =
      some "23309e03-717c-8320-8c00-475ce51856d9" ∧
    h762S3CompletedReadback.chatRef = none := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h762_s3_run_duration_us :
    h762S3CompletedReadback.completedUs.getD 0 -
      h762S3CompletedReadback.startedUs = 1504112195 := by
  decide

theorem h762_s3_completion_after_nominal_us :
    h762S3CompletedReadback.completedUs.getD 0 -
      h762S3CompletedReadback.scheduledUs = 5156884008 := by
  decide

theorem h762_s3_task_metadata_caught_up :
    h762S3TaskMetadataAfterCompletion.lastRunUs >
      h762S3CompletedReadback.completedUs.getD 0 ∧
    h762S3TaskMetadataAfterCompletion.updatedUs >
      h762S3TaskMetadataAfterCompletion.lastRunUs ∧
    h762S3TaskMetadataAfterCompletion.nextRunUs = us 19 36 0 0 := by
  decide

theorem h762_s3_followup_four_slot_statuses :
    h762S0LaterReadback.status = .inProgress ∧
    h762S2Readback.status = .inProgress ∧
    h762S3CompletedReadback.status = .failed ∧
    h762S4Readback.status = .inProgress := by
  decide

theorem h762_s3_completed_run_id_value :
    h762S3CompletedReadback.runId =
      "23309e03-717c-8320-8c00-475ce51856d9" := by
  rfl

#print axioms h762_s3_completed_failed_readback
#print axioms h762_s3_run_duration_us
#print axioms h762_s3_completion_after_nominal_us
#print axioms h762_s3_task_metadata_caught_up
#print axioms h762_s3_followup_four_slot_statuses
#print axioms h762_s3_completed_run_id_value

/-! ## h762 final four-lease follow-up readback at 19:40Z

Client-side request/response bounds:
- global catalog: 19:40:33.034Z–19:40:33.948Z;
- :00: 19:40:33.949Z–19:40:35.121Z;
- :24: 19:40:35.121Z–19:40:40.940Z;
- :36: 19:40:40.940Z–19:40:42.561Z;
- :48: 19:40:42.561Z–19:40:43.553Z.

The :00 run ID previously returned FAILED, then IN_PROGRESS, and now FAILED
again with a later completion. The :24 run retains its h762:s2 scheduled time
and run ID, but its started_at field changed again. The :36 record is the
new h762:s3 Morrow run, which started before its nominal time. The :48
Kestrel run has now completed.

The definitions below record returned fields and same-day UTC clock-of-day
arithmetic only. They do not infer retry/restart/duplicate execution, backend
cause, worker identity, direct-thread delivery, or handoff consumption.
-/

/-- Final h762:s0 readback: same run ID/start as the later IN_PROGRESS
snapshot, now returned FAILED with a later completion. -/
def h762S0FinalReadback : RunRecordObservation :=
  { runId := "54491578-3cc0-8330-a031-4c1986ef2314"
    scheduledUs := us 18 0 0 0
    startedUs := us 18 57 19 294331
    completedUs := some (us 19 22 24 521837)
    status := .failed
    latestResultRunId := some "54491578-3cc0-8330-a031-4c1986ef2314"
    chatRef := none }

def h762S0TaskMetadataAfterFinal : TaskMetadataObservation :=
  { lastRunUs := us 19 22 27 530706
    updatedUs := us 19 22 49 024620
    nextRunUs := us 20 0 0 0 }

/-- Final h762:s2 readback: same scheduled run and cache pointer, later
started_at, still IN_PROGRESS, with no run-level chat reference. -/
def h762S2FollowupReadback : RunRecordObservation :=
  { runId := "14db7f33-1298-8323-abb6-ee6f7091c3c0"
    scheduledUs := us 18 24 0 0
    startedUs := us 19 20 20 946259
    completedUs := none
    status := .inProgress
    latestResultRunId := some "325da37c-3fc8-832c-8943-5e5032f0bc39"
    chatRef := none }

/-- Actual h762:s3 Morrow run observed before nominal start time. -/
def h762S3MorrowReadback : RunRecordObservation :=
  { runId := "2937e5dc-bfc0-8322-9beb-c2020784a6ba"
    scheduledUs := us 19 36 0 0
    startedUs := us 19 35 7 130406
    completedUs := none
    status := .inProgress
    latestResultRunId := some "ac334e49-e780-8329-bced-028ccc39f86a"
    chatRef := none }

def h762S3MorrowTaskMetadata : TaskMetadataObservation :=
  { lastRunUs := us 19 1 58 865835
    updatedUs := us 19 2 21 116576
    nextRunUs := us 19 36 0 0 }

/-- Final h762:s4 Kestrel readback: completed; the cached result now points
to this run. A non-null task-container reference is not worker authentication. -/
def h762S4CompletedReadback : RunRecordObservation :=
  { runId := "90ced1b5-1ff4-8328-a31e-baee21c8846f"
    scheduledUs := us 18 48 0 0
    startedUs := us 18 50 43 600824
    completedUs := some (us 19 11 51 964554)
    status := .completed
    latestResultRunId := some "90ced1b5-1ff4-8328-a31e-baee21c8846f"
    chatRef := some "6aea3ec3-55dc-83e9-a744-d8bf46bd8cff" }

def h762S4TaskMetadataAfterCompletion : TaskMetadataObservation :=
  { lastRunUs := us 19 11 55 117779
    updatedUs := us 19 12 17 544534
    nextRunUs := us 19 48 0 0 }

/-- The same current run, scheduled slot, start, and chat binding persist
across these readbacks. The latest-result pointer is deliberately excluded:
the later snapshot points to a prior cached result, while the final snapshot
points to this run (proved separately below). -/
theorem h762_s0_final_same_run_and_start_as_later :
    h762S0LaterReadback.runId = h762S0FinalReadback.runId ∧
    h762S0LaterReadback.scheduledUs = h762S0FinalReadback.scheduledUs ∧
    h762S0LaterReadback.startedUs = h762S0FinalReadback.startedUs ∧
    h762S0LaterReadback.chatRef = h762S0FinalReadback.chatRef := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h762_s0_final_status_returned_failed :
    h762S0LaterReadback.status = .inProgress ∧
    h762S0LaterReadback.completedUs = none ∧
    h762S0FinalReadback.status = .failed ∧
    h762S0FinalReadback.completedUs = some (us 19 22 24 521837) := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h762_s0_final_duration_us :
    h762S0FinalReadback.completedUs.getD 0 -
      h762S0FinalReadback.startedUs = 1505227506 := by
  decide

theorem h762_s0_final_completion_after_nominal_us :
    h762S0FinalReadback.completedUs.getD 0 -
      h762S0FinalReadback.scheduledUs = 4944521837 := by
  decide

theorem h762_s0_final_task_metadata_caught_up :
    h762S0TaskMetadataAfterFinal.lastRunUs >
      h762S0FinalReadback.completedUs.getD 0 ∧
    h762S0TaskMetadataAfterFinal.updatedUs >
      h762S0TaskMetadataAfterFinal.lastRunUs ∧
    h762S0TaskMetadataAfterFinal.nextRunUs = us 20 0 0 0 := by
  decide

theorem h762_s0_final_latest_result_is_current :
    h762S0FinalReadback.latestResultRunId = some h762S0FinalReadback.runId := by
  rfl

theorem h762_s2_followup_same_run_cache_and_chat :
    h762S2Readback.runId = h762S2FollowupReadback.runId ∧
    h762S2Readback.scheduledUs = h762S2FollowupReadback.scheduledUs ∧
    h762S2Readback.latestResultRunId =
      h762S2FollowupReadback.latestResultRunId ∧
    h762S2Readback.chatRef = h762S2FollowupReadback.chatRef ∧
    h762S2FollowupReadback.status = .inProgress ∧
    h762S2FollowupReadback.completedUs = none := by
  exact ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩

theorem h762_s2_followup_started_at_delta_us :
    h762S2FollowupReadback.startedUs - h762S2Readback.startedUs =
      1802494169 := by
  decide

theorem h762_s2_followup_started_after_nominal_us :
    h762S2FollowupReadback.startedUs -
      h762S2FollowupReadback.scheduledUs = 3380946259 := by
  decide

theorem h762_s2_followup_task_metadata_still_stale :
    h762S2TaskMetadata.lastRunUs < h762S2FollowupReadback.startedUs ∧
    h762S2TaskMetadata.updatedUs < h762S2FollowupReadback.startedUs ∧
    h762S2TaskMetadata.nextRunUs =
      h762S2FollowupReadback.scheduledUs := by
  decide

theorem h762_s2_latest_result_pointer_remains_prior :
    h762S2FollowupReadback.latestResultRunId =
      some "325da37c-3fc8-832c-8943-5e5032f0bc39" ∧
    h762S2FollowupReadback.latestResultRunId ≠
      some h762S2FollowupReadback.runId := by
  decide

theorem h762_s3_morrow_started_before_nominal_us :
    h762S3MorrowReadback.scheduledUs -
      h762S3MorrowReadback.startedUs = 52869594 := by
  decide

theorem h762_s3_morrow_current_run_fields :
    h762S3MorrowReadback.status = .inProgress ∧
    h762S3MorrowReadback.completedUs = none ∧
    h762S3MorrowReadback.chatRef = none ∧
    h762S3MorrowReadback.latestResultRunId =
      some "ac334e49-e780-8329-bced-028ccc39f86a" := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h762_s3_morrow_task_metadata_precedes_current_start :
    h762S3MorrowTaskMetadata.lastRunUs <
      h762S3MorrowReadback.startedUs ∧
    h762S3MorrowTaskMetadata.updatedUs <
      h762S3MorrowReadback.startedUs ∧
    h762S3MorrowTaskMetadata.nextRunUs =
      h762S3MorrowReadback.scheduledUs := by
  decide

theorem h762_s4_kestrel_completed_readback :
    h762S4CompletedReadback.status = .completed ∧
    h762S4CompletedReadback.completedUs =
      some (us 19 11 51 964554) ∧
    h762S4CompletedReadback.latestResultRunId =
      some h762S4CompletedReadback.runId ∧
    h762S4CompletedReadback.chatRef =
      some "6aea3ec3-55dc-83e9-a744-d8bf46bd8cff" := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h762_s4_kestrel_duration_us :
    h762S4CompletedReadback.completedUs.getD 0 -
      h762S4CompletedReadback.startedUs = 1268363730 := by
  decide

theorem h762_s4_kestrel_completion_after_nominal_us :
    h762S4CompletedReadback.completedUs.getD 0 -
      h762S4CompletedReadback.scheduledUs = 1431964554 := by
  decide

theorem h762_s4_kestrel_task_metadata_caught_up :
    h762S4TaskMetadataAfterCompletion.lastRunUs >
      h762S4CompletedReadback.completedUs.getD 0 ∧
    h762S4TaskMetadataAfterCompletion.updatedUs >
      h762S4TaskMetadataAfterCompletion.lastRunUs ∧
    h762S4TaskMetadataAfterCompletion.nextRunUs = us 19 48 0 0 := by
  decide

theorem h762_followup_four_lease_status_vector :
    h762S0FinalReadback.status = .failed ∧
    h762S2FollowupReadback.status = .inProgress ∧
    h762S3MorrowReadback.status = .inProgress ∧
    h762S4CompletedReadback.status = .completed := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h762_followup_four_lease_chat_ref_vector :
    h762S0FinalReadback.chatRef = none ∧
    h762S2FollowupReadback.chatRef = none ∧
    h762S3MorrowReadback.chatRef = none ∧
    h762S4CompletedReadback.chatRef =
      some "6aea3ec3-55dc-83e9-a744-d8bf46bd8cff" := by
  exact ⟨rfl, rfl, rfl, rfl⟩

#print axioms h762_s0_final_same_run_and_start_as_later
#print axioms h762_s0_final_status_returned_failed
#print axioms h762_s0_final_duration_us
#print axioms h762_s0_final_completion_after_nominal_us
#print axioms h762_s0_final_task_metadata_caught_up
#print axioms h762_s0_final_latest_result_is_current
#print axioms h762_s2_followup_same_run_cache_and_chat
#print axioms h762_s2_followup_started_at_delta_us
#print axioms h762_s2_followup_started_after_nominal_us
#print axioms h762_s2_followup_task_metadata_still_stale
#print axioms h762_s2_latest_result_pointer_remains_prior
#print axioms h762_s3_morrow_started_before_nominal_us
#print axioms h762_s3_morrow_current_run_fields
#print axioms h762_s3_morrow_task_metadata_precedes_current_start
#print axioms h762_s4_kestrel_completed_readback
#print axioms h762_s4_kestrel_duration_us
#print axioms h762_s4_kestrel_completion_after_nominal_us
#print axioms h762_s4_kestrel_task_metadata_caught_up
#print axioms h762_followup_four_lease_status_vector
#print axioms h762_followup_four_lease_chat_ref_vector

#eval [h762S0FinalReadback.status, h762S2FollowupReadback.status,
      h762S3MorrowReadback.status, h762S4CompletedReadback.status]


/-! ## h868 four-lease scheduler readbacks and same-run lifecycle

The nominal hour is 2026-11-16T04:00Z (h868). The first readback clock
was 04:53:10Z, immediately before exact-ID peeks of the :24, :36, and :48
leases. The :36 run was later returned COMPLETED at 04:56:00.202342Z; a
second exact-ID collection was bounded below by 04:58:08Z. The :24 and :48
records remained IN_PROGRESS at that later collection.

The :00 task's latest returned record was still h867:s0 (Ariadne), FAILED;
no h868:s0 run record surfaced, and the task metadata pointed to 05:00Z.
That absence is bounded to this readback. It does not establish why no
h868:s0 record was returned.

The overlap theorem below concerns the intersection of the *recorded*
run intervals, using the returned start/completion fields and right-censoring
the two still-IN_PROGRESS records at 04:58:08Z. It is not proof of actual
process concurrency, backend causation, authenticated worker identity,
or thread delivery. These are normalized scheduler observations, not raw
provider event bytes.
-/

def h867S0FailedReadback : RunRecordObservation :=
  { runId := "8c09d5f5-d580-8333-b9be-e35e3e06fddf"
    scheduledUs := us 3 0 0 0
    startedUs := us 3 59 37 839667
    completedUs := some (us 4 24 43 904984)
    status := .failed
    latestResultRunId := some "8c09d5f5-d580-8333-b9be-e35e3e06fddf"
    chatRef := none }

/-- h868:s2 Nadir Voss, still IN_PROGRESS at the 04:58:08Z readback. -/
def h868S2Readback : RunRecordObservation :=
  { runId := "8c9a4f46-4478-8331-94ca-89c7db3a906a"
    scheduledUs := us 4 24 0 0
    startedUs := us 4 51 37 308539
    completedUs := none
    status := .inProgress
    latestResultRunId := some "6ac3f176-38f4-8326-8608-73790a1009cd"
    chatRef := none }

/-- h868:s3 Enheduanna, first returned IN_PROGRESS at 04:53:10Z. -/
def h868S3InitialReadback : RunRecordObservation :=
  { runId := "e7bb47f1-c688-8325-9f36-b68a709fa7a1"
    scheduledUs := us 4 36 0 0
    startedUs := us 4 37 31 424796
    completedUs := none
    status := .inProgress
    latestResultRunId := some "8880bfb2-7598-832e-a64d-27571f13c650"
    chatRef := none }

/-- Same h868:s3 run after completion, returned at the 04:58:08Z collection. -/
def h868S3CompletedReadback : RunRecordObservation :=
  { runId := "e7bb47f1-c688-8325-9f36-b68a709fa7a1"
    scheduledUs := us 4 36 0 0
    startedUs := us 4 37 31 424796
    completedUs := some (us 4 56 0 202342)
    status := .completed
    latestResultRunId := some "e7bb47f1-c688-8325-9f36-b68a709fa7a1"
    chatRef := some "6af51a99-15e4-83e9-93e5-bc29e8dfdbb8" }

/-- h868:s4 Tern Rook, still IN_PROGRESS at the 04:58:08Z readback. -/
def h868S4Readback : RunRecordObservation :=
  { runId := "e04c8549-6180-8322-8bda-b4b69d920aaf"
    scheduledUs := us 4 48 0 0
    startedUs := us 4 44 57 715383
    completedUs := none
    status := .inProgress
    latestResultRunId := none
    chatRef := none }

/-- No h868:s0 run record was returned by the 04:58:08Z :00 lease peek. -/
def h868S0Readback : Option RunRecordObservation := none

def h868InitialReadbackAtUs : Nat := us 4 53 10 0
def h868ReadbackAtUs : Nat := us 4 58 8 0

def h868S0TaskMetadata : TaskMetadataObservation :=
  { lastRunUs := us 4 24 48 289064
    updatedUs := us 4 25 11 656575
    nextRunUs := us 5 0 0 0 }

def h868S2TaskMetadata : TaskMetadataObservation :=
  { lastRunUs := us 3 37 11 520522
    updatedUs := us 3 37 34 410348
    nextRunUs := us 4 24 0 0 }

def h868S3TaskMetadataAfterCompletion : TaskMetadataObservation :=
  { lastRunUs := us 4 56 2 805829
    updatedUs := us 4 56 24 645669
    nextRunUs := us 5 36 0 0 }

def h868S4TaskMetadata : TaskMetadataObservation :=
  { lastRunUs := us 4 7 27 443340
    updatedUs := us 4 7 49 837550
    nextRunUs := us 4 48 0 0 }

theorem h867_s0_worker :
    ringAt ((5 * 867 + 0) % 19) = some "Ariadne" := by rfl

theorem h868_s0_sequence : 5 * 868 + 0 = 4340 := by decide

theorem h868_s0_index : (5 * 868 + 0) % 19 = 8 := by decide

theorem h868_s0_expected_worker :
    ringAt ((5 * 868 + 0) % 19) = some "Hale" := by rfl

theorem h868_s2_sequence : 5 * 868 + 2 = 4342 := by decide

theorem h868_s2_index : (5 * 868 + 2) % 19 = 10 := by decide

theorem h868_s2_worker :
    ringAt ((5 * 868 + 2) % 19) = some "Nadir Voss" := by rfl

theorem h868_s3_index : (5 * 868 + 3) % 19 = 11 := by decide

theorem h868_s3_worker :
    ringAt ((5 * 868 + 3) % 19) = some "Enheduanna" := by rfl

theorem h868_s4_sequence : 5 * 868 + 4 = 4344 := by decide

theorem h868_s4_index : (5 * 868 + 4) % 19 = 12 := by decide

theorem h868_s4_worker :
    ringAt ((5 * 868 + 4) % 19) = some "Tern Rook" := by rfl

theorem h868_s4_successor :
    ringAt (((5 * 868 + 4) + 1) % 19) = some "Morrow" := by rfl

theorem h869_s0_worker :
    ringAt ((5 * 869 + 0) % 19) = some "Morrow" := by rfl

theorem h867_s0_failure_timing :
    h867S0FailedReadback.status = .failed ∧
    h867S0FailedReadback.startedUs - h867S0FailedReadback.scheduledUs = 3577839667 ∧
    h867S0FailedReadback.completedUs.getD 0 -
      h867S0FailedReadback.scheduledUs = 5083904984 := by
  decide

theorem h868_s0_not_surfaced :
    h868S0Readback = none := by rfl

theorem h868_s0_task_metadata_after_prior_failure :
    h868S0TaskMetadata.lastRunUs >
      h867S0FailedReadback.completedUs.getD 0 ∧
    h868S0TaskMetadata.updatedUs > h868S0TaskMetadata.lastRunUs ∧
    h868S0TaskMetadata.nextRunUs = us 5 0 0 0 := by
  decide

theorem h868_s2_run_fields :
    h868S2Readback.status = .inProgress ∧
    h868S2Readback.completedUs = none ∧
    h868S2Readback.latestResultRunId =
      some "6ac3f176-38f4-8326-8608-73790a1009cd" ∧
    h868S2Readback.chatRef = none := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h868_s2_started_after_nominal_us :
    h868S2Readback.startedUs - h868S2Readback.scheduledUs = 1657308539 := by
  decide

theorem h868_s2_task_metadata_still_precedes_current_start :
    h868S2TaskMetadata.lastRunUs < h868S2Readback.startedUs ∧
    h868S2TaskMetadata.updatedUs < h868S2Readback.startedUs ∧
    h868S2TaskMetadata.nextRunUs = h868S2Readback.scheduledUs := by
  decide

theorem h868_s3_same_run_schedule_and_start :
    h868S3InitialReadback.runId = h868S3CompletedReadback.runId ∧
    h868S3InitialReadback.scheduledUs = h868S3CompletedReadback.scheduledUs ∧
    h868S3InitialReadback.startedUs = h868S3CompletedReadback.startedUs := by
  exact ⟨rfl, rfl, rfl⟩

theorem h868_s3_state_cache_and_chat_transition :
    h868S3InitialReadback.status = .inProgress ∧
    h868S3InitialReadback.completedUs = none ∧
    h868S3InitialReadback.latestResultRunId =
      some "8880bfb2-7598-832e-a64d-27571f13c650" ∧
    h868S3InitialReadback.chatRef = none ∧
    h868S3CompletedReadback.status = .completed ∧
    h868S3CompletedReadback.completedUs = some (us 4 56 0 202342) ∧
    h868S3CompletedReadback.latestResultRunId =
      some "e7bb47f1-c688-8325-9f36-b68a709fa7a1" ∧
    h868S3CompletedReadback.chatRef =
      some "6af51a99-15e4-83e9-93e5-bc29e8dfdbb8" := by
  exact ⟨rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl⟩

theorem h868_s3_started_after_nominal_us :
    h868S3CompletedReadback.startedUs -
      h868S3CompletedReadback.scheduledUs = 91424796 := by
  decide

theorem h868_s3_run_duration_us :
    h868S3CompletedReadback.completedUs.getD 0 -
      h868S3CompletedReadback.startedUs = 1108777546 := by
  decide

theorem h868_s3_task_metadata_caught_up :
    h868S3TaskMetadataAfterCompletion.lastRunUs >
      h868S3CompletedReadback.completedUs.getD 0 ∧
    h868S3TaskMetadataAfterCompletion.updatedUs >
      h868S3TaskMetadataAfterCompletion.lastRunUs ∧
    h868S3TaskMetadataAfterCompletion.nextRunUs = us 5 36 0 0 := by
  decide

theorem h868_s4_run_fields :
    h868S4Readback.status = .inProgress ∧
    h868S4Readback.completedUs = none ∧
    h868S4Readback.latestResultRunId = none ∧
    h868S4Readback.chatRef = none := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h868_s4_started_before_nominal_us :
    h868S4Readback.scheduledUs - h868S4Readback.startedUs = 182284617 := by
  decide

theorem h868_s4_task_metadata_still_precedes_current_start :
    h868S4TaskMetadata.lastRunUs < h868S4Readback.startedUs ∧
    h868S4TaskMetadata.updatedUs < h868S4Readback.startedUs ∧
    h868S4TaskMetadata.nextRunUs = h868S4Readback.scheduledUs := by
  decide

theorem h868_three_run_recorded_overlap_us :
    min (min (h868S2Readback.completedUs.getD h868ReadbackAtUs)
             (h868S3CompletedReadback.completedUs.getD h868ReadbackAtUs))
        (h868S4Readback.completedUs.getD h868ReadbackAtUs) -
      max (max h868S2Readback.startedUs h868S3CompletedReadback.startedUs)
          h868S4Readback.startedUs = 262893803 := by
  decide

theorem h868_initial_readback_within_three_run_overlap :
    h868S2Readback.startedUs ≤ h868InitialReadbackAtUs ∧
    h868S3CompletedReadback.startedUs ≤ h868InitialReadbackAtUs ∧
    h868S4Readback.startedUs ≤ h868InitialReadbackAtUs ∧
    h868InitialReadbackAtUs ≤ h868S3CompletedReadback.completedUs.getD 0 := by
  decide

#print axioms h867_s0_worker
#print axioms h868_s0_sequence
#print axioms h868_s0_index
#print axioms h868_s0_expected_worker
#print axioms h868_s2_sequence
#print axioms h868_s2_index
#print axioms h868_s2_worker
#print axioms h868_s3_index
#print axioms h868_s3_worker
#print axioms h868_s4_sequence
#print axioms h868_s4_index
#print axioms h868_s4_worker
#print axioms h868_s4_successor
#print axioms h869_s0_worker
#print axioms h867_s0_failure_timing
#print axioms h868_s0_not_surfaced
#print axioms h868_s0_task_metadata_after_prior_failure
#print axioms h868_s2_run_fields
#print axioms h868_s2_started_after_nominal_us
#print axioms h868_s2_task_metadata_still_precedes_current_start
#print axioms h868_s3_same_run_schedule_and_start
#print axioms h868_s3_state_cache_and_chat_transition
#print axioms h868_s3_started_after_nominal_us
#print axioms h868_s3_run_duration_us
#print axioms h868_s3_task_metadata_caught_up
#print axioms h868_s4_run_fields
#print axioms h868_s4_started_before_nominal_us
#print axioms h868_s4_task_metadata_still_precedes_current_start
#print axioms h868_three_run_recorded_overlap_us
#print axioms h868_initial_readback_within_three_run_overlap

#eval [h867S0FailedReadback.status, h868S2Readback.status,
      h868S3CompletedReadback.status, h868S4Readback.status]


/-! ## h868:s2 completion and h869:s0 successor start

A 05:04:15Z exact-ID collection shows h868:s2 completed and acquired its
run-level chat binding; its task-level last-run/update fields caught up.
The h869:s0 :00 run had started at 05:03:08.683277Z but remained
IN_PROGRESS with no current chat binding. Its latest cached result still
referred to a prior run, and its task-level last-run/update fields remained
at the h867:s0 values.

The :24 completion precedes the :00 successor start by 8,530,531
microseconds in the returned run records. The :48 h868 run and :00 h869
run have a right-censored recorded-interval overlap of at least
66,316,723 microseconds at the 05:04:15Z readback. These are record-level
relations, not claims about actual process concurrency or causal scheduling.
-/

def h868S2CompletedReadback : RunRecordObservation :=
  { runId := "8c9a4f46-4478-8331-94ca-89c7db3a906a"
    scheduledUs := us 4 24 0 0
    startedUs := us 4 51 37 308539
    completedUs := some (us 5 3 0 152746)
    status := .completed
    latestResultRunId := some "8c9a4f46-4478-8331-94ca-89c7db3a906a"
    chatRef := some "6af0cffc-7e10-83e9-9385-22e7347fef4b" }

def h868S4LaterReadback : RunRecordObservation :=
  { runId := "e04c8549-6180-8322-8bda-b4b69d920aaf"
    scheduledUs := us 4 48 0 0
    startedUs := us 4 44 57 715383
    completedUs := none
    status := .inProgress
    latestResultRunId := none
    chatRef := none }

def h869S0Readback : RunRecordObservation :=
  { runId := "bbc22399-1778-8321-82ce-de683e80fd96"
    scheduledUs := us 5 0 0 0
    startedUs := us 5 3 8 683277
    completedUs := none
    status := .inProgress
    latestResultRunId := some "3d4617de-bf24-8332-8f14-8d87fa9c51f9"
    chatRef := none }

def h868S2TaskMetadataAfterCompletion : TaskMetadataObservation :=
  { lastRunUs := us 5 3 3 545209
    updatedUs := us 5 3 27 809715
    nextRunUs := us 5 24 0 0 }

def h869S0TaskMetadataAtReadback : TaskMetadataObservation :=
  { lastRunUs := us 4 24 48 289064
    updatedUs := us 4 25 11 656575
    nextRunUs := us 5 0 0 0 }

def h869ReadbackAtUs : Nat := us 5 4 15 0

theorem h868_s2_same_run_schedule_and_start :
    h868S2Readback.runId = h868S2CompletedReadback.runId ∧
    h868S2Readback.scheduledUs = h868S2CompletedReadback.scheduledUs ∧
    h868S2Readback.startedUs = h868S2CompletedReadback.startedUs := by
  exact ⟨rfl, rfl, rfl⟩

theorem h868_s2_completion_cache_and_chat_transition :
    h868S2Readback.status = .inProgress ∧
    h868S2Readback.completedUs = none ∧
    h868S2Readback.latestResultRunId =
      some "6ac3f176-38f4-8326-8608-73790a1009cd" ∧
    h868S2Readback.chatRef = none ∧
    h868S2CompletedReadback.status = .completed ∧
    h868S2CompletedReadback.completedUs = some (us 5 3 0 152746) ∧
    h868S2CompletedReadback.latestResultRunId =
      some "8c9a4f46-4478-8331-94ca-89c7db3a906a" ∧
    h868S2CompletedReadback.chatRef =
      some "6af0cffc-7e10-83e9-9385-22e7347fef4b" := by
  exact ⟨rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl⟩

theorem h868_s2_completion_after_nominal_us :
    h868S2CompletedReadback.completedUs.getD 0 -
      h868S2CompletedReadback.scheduledUs = 2340152746 := by
  decide

theorem h868_s2_run_duration_us :
    h868S2CompletedReadback.completedUs.getD 0 -
      h868S2CompletedReadback.startedUs = 682844207 := by
  decide

theorem h868_s2_task_metadata_caught_up :
    h868S2TaskMetadataAfterCompletion.lastRunUs >
      h868S2CompletedReadback.completedUs.getD 0 ∧
    h868S2TaskMetadataAfterCompletion.updatedUs >
      h868S2TaskMetadataAfterCompletion.lastRunUs ∧
    h868S2TaskMetadataAfterCompletion.nextRunUs = us 5 24 0 0 := by
  decide

theorem h869_s0_worker :
    ringAt ((5 * 869 + 0) % 19) = some "Morrow" := by rfl

theorem h869_s0_started_after_nominal_us :
    h869S0Readback.startedUs - h869S0Readback.scheduledUs = 188683277 := by
  decide

theorem h869_s0_current_unbound_with_prior_cache :
    h869S0Readback.status = .inProgress ∧
    h869S0Readback.completedUs = none ∧
    h869S0Readback.latestResultRunId =
      some "3d4617de-bf24-8332-8f14-8d87fa9c51f9" ∧
    h869S0Readback.chatRef = none := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem h869_s0_task_metadata_still_stale :
    h869S0TaskMetadataAtReadback.lastRunUs <
      h869S0Readback.startedUs ∧
    h869S0TaskMetadataAtReadback.updatedUs <
      h869S0Readback.startedUs ∧
    h869S0TaskMetadataAtReadback.nextRunUs =
      h869S0Readback.scheduledUs := by
  decide

theorem h868_s2_to_h869_s0_recorded_gap_us :
    h869S0Readback.startedUs -
      h868S2CompletedReadback.completedUs.getD 0 = 8530531 := by
  decide

theorem h868_s4_same_run_and_start_across_later_readback :
    h868S4Readback.runId = h868S4LaterReadback.runId ∧
    h868S4Readback.scheduledUs = h868S4LaterReadback.scheduledUs ∧
    h868S4Readback.startedUs = h868S4LaterReadback.startedUs := by
  exact ⟨rfl, rfl, rfl⟩

theorem h868_s4_h869_s0_both_in_progress_at_readback :
    h868S4LaterReadback.status = .inProgress ∧
    h868S4LaterReadback.completedUs = none ∧
    h868S4LaterReadback.chatRef = none ∧
    h869S0Readback.status = .inProgress ∧
    h869S0Readback.completedUs = none ∧
    h869S0Readback.chatRef = none := by
  exact ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩

theorem h868_s4_h869_s0_recorded_overlap_lower_bound_us :
    h869ReadbackAtUs -
      max h868S4LaterReadback.startedUs h869S0Readback.startedUs =
        66316723 := by
  decide

#print axioms h868_s2_same_run_schedule_and_start
#print axioms h868_s2_completion_cache_and_chat_transition
#print axioms h868_s2_completion_after_nominal_us
#print axioms h868_s2_run_duration_us
#print axioms h868_s2_task_metadata_caught_up
#print axioms h869_s0_worker
#print axioms h869_s0_started_after_nominal_us
#print axioms h869_s0_current_unbound_with_prior_cache
#print axioms h869_s0_task_metadata_still_stale
#print axioms h868_s2_to_h869_s0_recorded_gap_us
#print axioms h868_s4_same_run_and_start_across_later_readback
#print axioms h868_s4_h869_s0_both_in_progress_at_readback
#print axioms h868_s4_h869_s0_recorded_overlap_lower_bound_us

#eval [h868S2CompletedReadback.status, h868S3CompletedReadback.status,
      h868S4LaterReadback.status, h869S0Readback.status]

end HsHVerification.TernH743SchedulerSnapshotEvidence
