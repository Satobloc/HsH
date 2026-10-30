import Mathlib

/-!
Sable Review-MIND | source-derived GRAIL / Human AI Platform visibility map.

Source snapshots inspected:
* mcschoo/group_ai_lab @ 6e339e3918bcf06d8df6c467a21fa9510f1da5bc
  server/src/controlPlaneAdapter.js (blob e3171053f930359826cb11e7f36de44f9c000017)
  server/src/callbacks.js (blob 1d481fa055f47295c47675cdd5f7ade5c15574dd)
* mcschoo/human-ai-platform @ 5f0e913d534778a01a913c68adba3369791e4b08
  control_plane/orchestration.py (blob 8186155f7a553980c0b5f2e83f3d99e2476e12ce)
  control_plane/repository.py (blob eed0bb390b272def0013ea0ef827981b76048d1c)
  control_plane/models.py (blob 9583a6141c23744f3cc00fa798d209cdae1b03ad)

Assistant reconstruction of source behavior:
* Repository.transcript filters by app/session/channel, not sender.
* Orchestrator._transcript maps every returned row; the viewer's own sender ID
  becomes role "assistant", every other sender becomes role "user".
* handle_message iterates selected slots sequentially, awaits each response,
  stores that response, and only then advances to the next slot.
* This module formalizes the filter/map and sequential-append abstractions only.
  It does NOT prove that this abstraction is a sound translation of the Python
  implementation, that a deployed service matches this commit, or that any
  human/LLM experiment produced a particular behavior.
-/

namespace HsHVerification.SableGRAILPeerVisibility

structure Message where
  appId : String
  sessionId : String
  channel : String
  senderId : String
  text : String
deriving DecidableEq, Repr

structure TranscriptRow where
  role : String
  content : String
deriving DecidableEq, Repr

def inScope (appId sessionId channel : String) (m : Message) : Bool :=
  (m.appId == appId) && (m.sessionId == sessionId) && (m.channel == channel)

def roleFor (viewer sender : String) : String :=
  if sender = viewer then "assistant" else "user"

def render (viewer : String) (m : Message) : TranscriptRow :=
  { role := roleFor viewer m.senderId, content := m.text }

def transcript (appId sessionId channel viewer : String) (rows : List Message) :
    List TranscriptRow :=
  (rows.filter (inScope appId sessionId channel)).map (render viewer)

/-- Every row already returned by the app/session/channel query is retained;
    sender identity changes its role, not whether it is present. -/
theorem scoped_message_retained
    (rows : List Message) (appId sessionId channel viewer : String)
    (m : Message) (hmem : m ∈ rows)
    (happ : m.appId = appId)
    (hsession : m.sessionId = sessionId)
    (hchannel : m.channel = channel) :
    render viewer m ∈ transcript appId sessionId channel viewer rows := by
  have hscope : inScope appId sessionId channel m = true := by
    simp [inScope, happ, hsession, hchannel]
  unfold transcript
  apply List.mem_map.mpr
  refine ⟨m, List.mem_filter.mpr ⟨hmem, hscope⟩, rfl⟩

/-- A message from another participant is rendered as a user message. -/
theorem peer_message_role_is_user
    (viewer : String) (m : Message) (hpeer : m.senderId ≠ viewer) :
    (render viewer m).role = "user" := by
  simp [render, roleFor, hpeer]

/-- A participant's own earlier messages are rendered as assistant messages. -/
theorem own_message_role_is_assistant
    (viewer : String) (m : Message) (hself : m.senderId = viewer) :
    (render viewer m).role = "assistant" := by
  simp [render, roleFor, hself]

/-- The role projection does not change the number of scoped transcript rows. -/
theorem transcript_length_is_scope_count
    (rows : List Message) (appId sessionId channel viewer : String) :
    (transcript appId sessionId channel viewer rows).length =
      (rows.filter (inScope appId sessionId channel)).length := by
  simp [transcript]

/-- Abstract the source loop's append-after-response behavior. -/
def commitReplies (context replies : List Message) : List Message :=
  replies.foldl (fun acc reply => acc ++ [reply]) context

theorem commitReplies_eq_append (context replies : List Message) :
    commitReplies context replies = context ++ replies := by
  induction replies generalizing context with
  | nil =>
      simp [commitReplies]
  | cons reply rest ih =>
      simp [commitReplies, ih, List.append_assoc]

/-- Every reply committed by the sequential loop remains in its resulting
    context. -/
theorem committed_reply_remains_visible
    (context replies : List Message) (reply : Message)
    (hreply : reply ∈ replies) :
    reply ∈ commitReplies context replies := by
  rw [commitReplies_eq_append]
  exact List.mem_append_right _ hreply

/-- If an earlier reply is in the prefix committed before a later request,
    the later request's abstract context contains it. -/
def contextAfter (context replies : List Message) (n : Nat) : List Message :=
  commitReplies context (replies.take n)

theorem prior_reply_in_later_context
    (context replies : List Message) (n : Nat) (reply : Message)
    (hprior : reply ∈ replies.take n) :
    reply ∈ contextAfter context replies n := by
  unfold contextAfter
  rw [commitReplies_eq_append]
  exact List.mem_append_right _ hprior

#print axioms scoped_message_retained
#print axioms peer_message_role_is_user
#print axioms own_message_role_is_assistant
#print axioms transcript_length_is_scope_count
#print axioms commitReplies_eq_append
#print axioms committed_reply_remains_visible
#print axioms prior_reply_in_later_context

end HsHVerification.SableGRAILPeerVisibility
