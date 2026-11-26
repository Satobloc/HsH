import Mathlib
import HsHVerification.CognitionSourceOverlap

/-!
A source-bound finite witness for the Workshop Relay :48 task.

Observed task:
  task_id = 6aa6c3bc02b48191b8a91a30d2a155e0
  task_conversation_id = 6af7619b-1d50-83e9-a583-9dd68f95db3c

Previous cached result:
  run_id = c2df8547-0484-8321-b973-ed2bc5aff2c6
  scheduled hour h = 994
  deterministic ring label = Meridian (index 15)
  completed_at = 2026-11-21T11:13:25.631911Z
  run chat_ref = the task-level conversation id

Current last_run:
  run_id = 550790a9-0e28-832c-9d67-a4cff9cbd74f
  scheduled hour h = 995
  deterministic ring label = Loom (index 1)
  started_at = 2026-11-21T12:20:25.955838Z
  status = in progress
  run chat_ref = null

The labels are deterministic ring labels computed from nominal scheduled_for,
not authenticated worker identities. An absent field means "not present in the
observed API snapshot", not proof that the runtime has no such field. This file
formalizes the recorded metadata only; it does not prove thread delivery,
human/LLM participation, or the truth of any cognitive claim.
-/

namespace HsHVerification.LoomTaskConversationFiber

open HsHVerification.CognitionSourceOverlap

inductive RingLabel where
  | meridian
  | loom
  deriving DecidableEq, Repr

inductive RunStatus where
  | completed
  | inProgress
  deriving DecidableEq, Repr

structure TaskRecord where
  taskId : String
  taskConversationId : String
  deriving DecidableEq, Repr

structure ProcessAttempt where
  runId : String
  scheduledHour : Nat
  startedAt : Option String
  completedAt : Option String
  attemptId : Option String
  status : RunStatus
  runChatRef : Option String
  deriving DecidableEq, Repr

structure RunObservation where
  task : TaskRecord
  attempt : ProcessAttempt
  selectedRingLabel : RingLabel
  deriving DecidableEq, Repr

def sharedTask : TaskRecord :=
  { taskId := "6aa6c3bc02b48191b8a91a30d2a155e0"
    taskConversationId := "6af7619b-1d50-83e9-a583-9dd68f95db3c" }

def previousRun : RunObservation :=
  { task := sharedTask
    attempt :=
      { runId := "c2df8547-0484-8321-b973-ed2bc5aff2c6"
        scheduledHour := 994
        startedAt := none
        completedAt := some "2026-11-21T11:13:25.631911Z"
        attemptId := none
        status := .completed
        runChatRef := some sharedTask.taskConversationId }
    selectedRingLabel := .meridian }

def currentRun : RunObservation :=
  { task := sharedTask
    attempt :=
      { runId := "550790a9-0e28-832c-9d67-a4cff9cbd74f"
        scheduledHour := 995
        startedAt := some "2026-11-21T12:20:25.955838Z"
        completedAt := none
        attemptId := none
        status := .inProgress
        runChatRef := none }
    selectedRingLabel := .loom }

def taskConversationProjection (r : RunObservation) : String :=
  r.task.taskConversationId

theorem previous_slot_ring_index : (5 * 994 + 4) % 19 = 15 := by
  norm_num

theorem current_slot_ring_index : (5 * 995 + 4) % 19 = 1 := by
  norm_num

theorem distinct_run_observations : previousRun ≠ currentRun := by
  decide

theorem same_task_id :
    previousRun.task.taskId = currentRun.task.taskId := rfl

theorem same_task_conversation_id :
    taskConversationProjection previousRun =
      taskConversationProjection currentRun := rfl

theorem different_ring_labels :
    previousRun.selectedRingLabel ≠ currentRun.selectedRingLabel := by
  decide

theorem previous_run_chat_ref_matches_task_pointer :
    previousRun.attempt.runChatRef =
      some previousRun.task.taskConversationId := rfl

theorem current_run_chat_ref_is_unavailable :
    currentRun.attempt.runChatRef = none := rfl

/-- A non-injective run-to-task-reference projection creates apparent
    shared-source overlap between two distinct process attempts. -/
theorem task_conversation_projection_creates_false_shared_source :
    ¬ SharesSource ({previousRun} : Set RunObservation)
        ({currentRun} : Set RunObservation) ∧
      SharesSource
        (taskConversationProjection '' ({previousRun} : Set RunObservation))
        (taskConversationProjection '' ({currentRun} : Set RunObservation)) := by
  exact source_id_collision_creates_false_overlap
    taskConversationProjection previousRun currentRun
    distinct_run_observations same_task_conversation_id

/-- No classifier using only the task-level conversation reference can
    recover both deterministic ring labels in these two recorded runs. -/
theorem no_ring_label_function_of_task_conversation :
    ¬ ∃ f : String → RingLabel,
      f (taskConversationProjection previousRun) =
          previousRun.selectedRingLabel ∧
        f (taskConversationProjection currentRun) =
          currentRun.selectedRingLabel := by
  intro h
  rcases h with ⟨f, hp, hc⟩
  apply different_ring_labels
  calc
    previousRun.selectedRingLabel =
        f (taskConversationProjection previousRun) := hp.symm
    _ = f (taskConversationProjection currentRun) :=
      congrArg f same_task_conversation_id
    _ = currentRun.selectedRingLabel := hc

#print axioms task_conversation_projection_creates_false_shared_source
#print axioms no_ring_label_function_of_task_conversation

end HsHVerification.LoomTaskConversationFiber
