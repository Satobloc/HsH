import Mathlib

/-!
# Morrow role-provenance graph

Source transcription:
- Morrow conversation: 6a9ee7ca-d340-83ea-b99d-6a3097429f36
- Morrow raw blob: 362075c5e32ec9e97579bd1de58fba7f612cb6bb
- Duplicate "Continue Conversation Here" conversation: 6a9bd6f4-8104-83ea-ac9b-ab97497a280e
- Duplicate snapshot blob used for replay: 8c738e4bc63e4464fbca2ef7d8f81cf1d4f78387

The raw-source audit separately compared the two role-clarification message bodies
for exact string equality across the inspected snapshots. This Lean module encodes
their observed code-unit counts, conversation IDs, message IDs, roles, parent edges,
timestamps and error metadata. It does not authenticate the archive's human speaker,
prove that the raw JSON is authentic, or infer consciousness/personhood.

The phrase "holographic self-similarity" in the later Team Archivist message is not
formalized here: no object, domain, scale map, equivalence relation, invariant or
composition law is supplied by the source. It remains a tentative analogy/hypothesis.
-/

namespace HsHVerification.MorrowRoleProvenance

inductive Speaker where
  | user
  | assistant
  deriving DecidableEq, Repr

structure ArchivedNode where
  conversationId : String
  id : String
  parentId : Option String
  speaker : Speaker
  timestampMicros : Nat
  contentCodeUnits : Nat
  status : String
  errorCode : Option String
  deriving DecidableEq, Repr

def morrowConversationId : String :=
  "6a9ee7ca-d340-83ea-b99d-6a3097429f36"

def continuationConversationId : String :=
  "6a9bd6f4-8104-83ea-ac9b-ab97497a280e"

def sourceBlobSha : String :=
  "362075c5e32ec9e97579bd1de58fba7f612cb6bb"

def duplicateSnapshotBlobSha : String :=
  "8c738e4bc63e4464fbca2ef7d8f81cf1d4f78387"

def mistypedRoleClarificationId : String :=
  "2c6ae3c8-f6f9-4d7b-b3c5-6d11e0f318df"

def roleClarification : ArchivedNode where
  conversationId := morrowConversationId
  id := "2c6ae3c8-f6f9-4d7b-b3df-66ea1ca2bed9"
  parentId := some "de5412bd-1c2c-54c8-a1bf-5a95660130f9"
  speaker := .user
  timestampMicros := 1788819899538000
  contentCodeUnits := 1353
  status := "finished_successfully"
  errorCode := none

def morrowAssistantStep1 : ArchivedNode where
  conversationId := morrowConversationId
  id := "56e65f32-76fb-4907-b901-9e5c9a589480"
  parentId := some roleClarification.id
  speaker := .assistant
  timestampMicros := 1788819901709388
  contentCodeUnits := 0
  status := "finished_successfully"
  errorCode := none

def morrowAssistantStep2 : ArchivedNode where
  conversationId := morrowConversationId
  id := "e08706ce-550d-4d7f-b20c-5df6a7050016"
  parentId := some morrowAssistantStep1.id
  speaker := .assistant
  timestampMicros := 1788819902052030
  contentCodeUnits := 0
  status := "finished_successfully"
  errorCode := none

def morrowRolePromptError : ArchivedNode where
  conversationId := morrowConversationId
  id := "1b2caef9-d456-5c09-b3fb-88bf56b73da2"
  parentId := some morrowAssistantStep2.id
  speaker := .assistant
  timestampMicros := 1788819902056133
  contentCodeUnits := 330
  status := "finished_partial_completion"
  errorCode := some "work_usage_limit_exceeded"

def morrowAssistantSelfDescription : ArchivedNode where
  conversationId := morrowConversationId
  id := "32ef4db5-269f-5c1c-8408-188c956cca52"
  parentId := some morrowRolePromptError.id
  speaker := .assistant
  timestampMicros := 1788835423768239
  contentCodeUnits := 3608
  status := "finished_successfully"
  errorCode := none

def teamArchivistAssignment : ArchivedNode where
  conversationId := morrowConversationId
  id := "402ade01-7116-4efb-9b14-31e477754458"
  parentId := some morrowAssistantSelfDescription.id
  speaker := .user
  timestampMicros := 1788837936187000
  contentCodeUnits := 1466
  status := "finished_successfully"
  errorCode := none

def teamArchivistAssistantStep1 : ArchivedNode where
  conversationId := morrowConversationId
  id := "ee5b35f5-38b5-4d58-b7d7-95f27a033f47"
  parentId := some teamArchivistAssignment.id
  speaker := .assistant
  timestampMicros := 1788837942478359
  contentCodeUnits := 0
  status := "finished_successfully"
  errorCode := none

def teamArchivistAssistantStep2 : ArchivedNode where
  conversationId := morrowConversationId
  id := "2151f257-1cf8-57b5-bd8f-73cd207cd6e1"
  parentId := some teamArchivistAssistantStep1.id
  speaker := .assistant
  timestampMicros := 1788838017821872
  contentCodeUnits := 249
  status := "finished_successfully"
  errorCode := none

def teamArchivistAssistantStep3 : ArchivedNode where
  conversationId := morrowConversationId
  id := "0dbdee1e-5469-44a1-b6cc-e0a21d6db536"
  parentId := some teamArchivistAssistantStep2.id
  speaker := .assistant
  timestampMicros := 1788838040204471
  contentCodeUnits := 0
  status := "finished_successfully"
  errorCode := none

def teamArchivistActionPlan : ArchivedNode where
  conversationId := morrowConversationId
  id := "b3df863e-9b61-5300-a0fa-3fb358b93396"
  parentId := some teamArchivistAssistantStep3.id
  speaker := .assistant
  timestampMicros := 1788838040208624
  contentCodeUnits := 2437
  status := "finished_successfully"
  errorCode := none

def duplicateRoleClarification : ArchivedNode where
  conversationId := continuationConversationId
  id := "67ad3c22-c1b8-4f66-9815-586184630e6a"
  parentId := some "1a18fd79-dea3-5fa9-ab13-b009e26c3ac7"
  speaker := .user
  timestampMicros := 1788819913750000
  contentCodeUnits := 1353
  status := "finished_successfully"
  errorCode := none

def duplicateAssistantStep1 : ArchivedNode where
  conversationId := continuationConversationId
  id := "388771ce-bde3-4fd6-8863-6d775643bd90"
  parentId := some duplicateRoleClarification.id
  speaker := .assistant
  timestampMicros := 1788819922997675
  contentCodeUnits := 0
  status := "finished_successfully"
  errorCode := none

def duplicateAssistantStep2 : ArchivedNode where
  conversationId := continuationConversationId
  id := "3387d652-9d65-5377-a3c5-6d11e0f318df"
  parentId := some duplicateAssistantStep1.id
  speaker := .assistant
  timestampMicros := 1788819935375358
  contentCodeUnits := 0
  status := "finished_successfully"
  errorCode := none

def duplicateAssistantStep3 : ArchivedNode where
  conversationId := continuationConversationId
  id := "0f059b6c-bc3a-597e-947c-5dee1e127490"
  parentId := some duplicateAssistantStep2.id
  speaker := .assistant
  timestampMicros := 1788819935894153
  contentCodeUnits := 301
  status := "finished_successfully"
  errorCode := none

def duplicateAssistantStep4 : ArchivedNode where
  conversationId := continuationConversationId
  id := "338a8e00-e98f-40d4-9921-1a1fba2e07d3"
  parentId := some duplicateAssistantStep3.id
  speaker := .assistant
  timestampMicros := 1788819943837508
  contentCodeUnits := 0
  status := "finished_successfully"
  errorCode := none

def duplicateThreadTerminalError : ArchivedNode where
  conversationId := continuationConversationId
  id := "7a189c49-69c9-5224-821d-a49a9ef28250"
  parentId := some duplicateAssistantStep4.id
  speaker := .assistant
  timestampMicros := 1788819943845020
  contentCodeUnits := 0
  status := "finished_partial_completion"
  errorCode := some "work_usage_limit_exceeded"

def ParentEdge (child parent : ArchivedNode) : Prop :=
  child.parentId = some parent.id

theorem role_clarification_is_user : roleClarification.speaker = .user := rfl

theorem assistant_self_description_is_assistant :
    morrowAssistantSelfDescription.speaker = .assistant := rfl

theorem team_archivist_assignment_is_user :
    teamArchivistAssignment.speaker = .user := rfl

theorem team_archivist_action_plan_is_assistant :
    teamArchivistActionPlan.speaker = .assistant := rfl

theorem incorrect_role_locator_differs_from_raw_id :
    mistypedRoleClarificationId ≠ roleClarification.id := by decide

theorem duplicate_prompt_is_in_a_distinct_conversation :
    roleClarification.conversationId ≠ duplicateRoleClarification.conversationId := by decide

theorem duplicate_prompt_recorded_lengths_match :
    roleClarification.contentCodeUnits = duplicateRoleClarification.contentCodeUnits := rfl

theorem duplicate_prompt_is_14212_milliseconds_later :
    duplicateRoleClarification.timestampMicros =
      roleClarification.timestampMicros + 14212000 := by decide

theorem morrow_initial_partial_completion_error :
    morrowRolePromptError.errorCode = some "work_usage_limit_exceeded" ∧
    morrowRolePromptError.status = "finished_partial_completion" := by
  constructor <;> rfl

theorem duplicate_thread_terminal_error :
    duplicateThreadTerminalError.errorCode = some "work_usage_limit_exceeded" ∧
    duplicateThreadTerminalError.status = "finished_partial_completion" := by
  constructor <;> rfl

theorem morrow_role_sequence_parent_edges :
    ParentEdge morrowAssistantStep1 roleClarification ∧
    ParentEdge morrowAssistantStep2 morrowAssistantStep1 ∧
    ParentEdge morrowRolePromptError morrowAssistantStep2 ∧
    ParentEdge morrowAssistantSelfDescription morrowRolePromptError ∧
    ParentEdge teamArchivistAssignment morrowAssistantSelfDescription ∧
    ParentEdge teamArchivistAssistantStep1 teamArchivistAssignment ∧
    ParentEdge teamArchivistAssistantStep2 teamArchivistAssistantStep1 ∧
    ParentEdge teamArchivistAssistantStep3 teamArchivistAssistantStep2 ∧
    ParentEdge teamArchivistActionPlan teamArchivistAssistantStep3 := by
  constructor <;> rfl

theorem duplicate_thread_parent_edges :
    ParentEdge duplicateAssistantStep1 duplicateRoleClarification ∧
    ParentEdge duplicateAssistantStep2 duplicateAssistantStep1 ∧
    ParentEdge duplicateAssistantStep3 duplicateAssistantStep2 ∧
    ParentEdge duplicateAssistantStep4 duplicateAssistantStep3 ∧
    ParentEdge duplicateThreadTerminalError duplicateAssistantStep4 := by
  constructor <;> rfl

theorem morrow_role_sequence_time_is_strictly_increasing :
    roleClarification.timestampMicros < morrowAssistantStep1.timestampMicros ∧
    morrowAssistantStep1.timestampMicros < morrowAssistantStep2.timestampMicros ∧
    morrowAssistantStep2.timestampMicros < morrowRolePromptError.timestampMicros ∧
    morrowRolePromptError.timestampMicros < morrowAssistantSelfDescription.timestampMicros ∧
    morrowAssistantSelfDescription.timestampMicros < teamArchivistAssignment.timestampMicros ∧
    teamArchivistAssignment.timestampMicros < teamArchivistAssistantStep1.timestampMicros ∧
    teamArchivistAssistantStep1.timestampMicros < teamArchivistAssistantStep2.timestampMicros ∧
    teamArchivistAssistantStep2.timestampMicros < teamArchivistAssistantStep3.timestampMicros ∧
    teamArchivistAssistantStep3.timestampMicros < teamArchivistActionPlan.timestampMicros := by
  decide

theorem duplicate_thread_time_is_strictly_increasing :
    duplicateRoleClarification.timestampMicros < duplicateAssistantStep1.timestampMicros ∧
    duplicateAssistantStep1.timestampMicros < duplicateAssistantStep2.timestampMicros ∧
    duplicateAssistantStep2.timestampMicros < duplicateAssistantStep3.timestampMicros ∧
    duplicateAssistantStep3.timestampMicros < duplicateAssistantStep4.timestampMicros ∧
    duplicateAssistantStep4.timestampMicros < duplicateThreadTerminalError.timestampMicros := by
  decide

theorem team_archivist_assignment_is_2512418761_microseconds_after_self_description :
    teamArchivistAssignment.timestampMicros =
      morrowAssistantSelfDescription.timestampMicros + 2512418761 := by decide

theorem action_plan_is_104021624_microseconds_after_assignment :
    teamArchivistActionPlan.timestampMicros =
      teamArchivistAssignment.timestampMicros + 104021624 := by decide

#print axioms role_clarification_is_user
#print axioms assistant_self_description_is_assistant
#print axioms team_archivist_assignment_is_user
#print axioms incorrect_role_locator_differs_from_raw_id
#print axioms duplicate_prompt_is_in_a_distinct_conversation
#print axioms duplicate_prompt_is_14212_milliseconds_later
#print axioms morrow_role_sequence_parent_edges
#print axioms duplicate_thread_parent_edges
#print axioms morrow_role_sequence_time_is_strictly_increasing
#print axioms duplicate_thread_time_is_strictly_increasing
#print axioms team_archivist_assignment_is_2512418761_microseconds_after_self_description
#print axioms action_plan_is_104021624_microseconds_after_assignment

end HsHVerification.MorrowRoleProvenance
