import Mathlib

/-!
Elias Kern Track A / Review-MIND / 2026-11-02.

Source objects inspected:
- PR #1251 head f24c5184ff506888adbc635252e3541bd5d583a1
- .github/workflows/issue-publisher.yml blob
  455222a761ca500fd2eb2dc7ca76762e4b35307f
- tools/issue_publish.py blob
  474162d45765c6fc6ab0af2457f1019b04fb8d24
- GitHub webhook documentation: the top-level sender identifies the
  user who triggered the event; the issue object is a separate payload object.

The draft PR adds issues.edited, but its workflow filter checks
github.event.issue.author_association == 'OWNER'. Its script re-fetches
the current issue and validates that issue object's author_association,
then discards the event's sender when calling validate. These are issue-author
checks, not editor-identity checks.

The finite witness below is a SYNTHETIC SOFTWARE EVENT, not an observed
GitHub delivery and not evidence that an unauthorized publication occurred.
It isolates the logical gap: an owner-authored issue can be edited by a
different actor, while the current predicates remain true. The proposed
actor-bound predicate requires a present sender whose login is the repository
owner; missing or ghost sender values fail closed.

Lean verifies only this abstraction and its propositions. It does not
authenticate GitHub, establish that a given collaborator can edit a given
issue, prove source-to-formal translation soundness, or establish production
exploitability. No physical system or physical calculation is involved.
-/

namespace HsHVerification.EliasPublisherEditActorGate

inductive IssueAuthorAssociation where
  | owner
  | collaborator
  | other
  deriving DecidableEq, BEq, Repr

structure IssueEditEvent where
  publisherTitle : Bool
  issueAuthorAssociation : IssueAuthorAssociation
  payloadValid : Bool
  senderLogin : Option String
  deriving DecidableEq, BEq, Repr

def repositoryOwner : String := "Satobloc"

/-- Current PR #1251 workflow job filter, abstracted from the YAML. -/
def currentWorkflowFilter (e : IssueEditEvent) : Bool :=
  e.publisherTitle && (e.issueAuthorAssociation == .owner)

/-- Current script's relevant issue-object checks; payloadValid abstracts
    the remaining schema, ID, length, and digest checks. -/
def currentScriptValidation (e : IssueEditEvent) : Bool :=
  (e.issueAuthorAssociation == .owner) && e.payloadValid

/-- Combined current acceptance predicate. It does not inspect senderLogin. -/
def currentPublisherAccepts (e : IssueEditEvent) : Bool :=
  currentWorkflowFilter e && currentScriptValidation e

/-- Proposed actor binding. Missing and non-owner senders are rejected. -/
def senderIsRepositoryOwner (e : IssueEditEvent) : Bool :=
  e.senderLogin == some repositoryOwner

def actorBoundPublisherAccepts (e : IssueEditEvent) : Bool :=
  currentPublisherAccepts e && senderIsRepositoryOwner e

/-- Owner-created issue, edited by the repository owner. -/
def ownerEditEvent : IssueEditEvent :=
  { publisherTitle := true
    issueAuthorAssociation := .owner
    payloadValid := true
    senderLogin := some repositoryOwner }

/-- Owner-created issue, edited by a different collaborator. -/
def collaboratorEditEvent : IssueEditEvent :=
  { publisherTitle := true
    issueAuthorAssociation := .owner
    payloadValid := true
    senderLogin := some "trusted-collaborator" }

/-- Event whose sender is absent; the proposed gate must fail closed. -/
def missingSenderEditEvent : IssueEditEvent :=
  { publisherTitle := true
    issueAuthorAssociation := .owner
    payloadValid := true
    senderLogin := none }

/-- The current draft-PR predicates accept the collaborator-edit witness. -/
theorem current_gate_accepts_collaborator_edit :
    currentPublisherAccepts collaboratorEditEvent = true := by
  decide

theorem collaborator_edit_actor_is_not_repository_owner :
    senderIsRepositoryOwner collaboratorEditEvent = false := by
  decide

/-- Current acceptance does not imply that the editor is the repository owner. -/
theorem current_gate_accepts_nonowner_editor :
    currentPublisherAccepts collaboratorEditEvent = true ∧
    senderIsRepositoryOwner collaboratorEditEvent = false := by
  decide

/-- Adding the actor binding rejects the collaborator-edit witness. -/
theorem actor_bound_gate_rejects_collaborator_edit :
    actorBoundPublisherAccepts collaboratorEditEvent = false := by
  decide

theorem actor_bound_gate_accepts_owner_edit :
    actorBoundPublisherAccepts ownerEditEvent = true := by
  decide

theorem actor_bound_gate_rejects_missing_sender :
    actorBoundPublisherAccepts missingSenderEditEvent = false := by
  decide

#eval currentPublisherAccepts collaboratorEditEvent
#eval senderIsRepositoryOwner collaboratorEditEvent
#eval actorBoundPublisherAccepts collaboratorEditEvent
#eval actorBoundPublisherAccepts ownerEditEvent
#eval actorBoundPublisherAccepts missingSenderEditEvent

#print axioms current_gate_accepts_collaborator_edit
#print axioms collaborator_edit_actor_is_not_repository_owner
#print axioms current_gate_accepts_nonowner_editor
#print axioms actor_bound_gate_rejects_collaborator_edit
#print axioms actor_bound_gate_accepts_owner_edit
#print axioms actor_bound_gate_rejects_missing_sender

end HsHVerification.EliasPublisherEditActorGate
