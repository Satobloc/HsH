import Mathlib
import HsHVerification.EliasHydraEvidenceRevision

/-!
# Elias Kern: separate Hydra loop-state identity from invocation idempotency

Source: private HSH_RESOURCES switchboard prototype; immutable source blob
Git blob: 49988a769389b2baf264a27d596ba7c3ff822b36
Relevant source: Switchboard.run, Switchboard.hydra, especially the statekey
projection at the hydra history guard.

The source-derived loop-state projection contains node, candidate stage and
directive-incorporation state. The earlier EliasHydraRevision module extends
that state key with candidate identity and evidence revision.

This module models a separate proposed invocation key. It adds the outer
actor/locale inputs used by run(), plus proposed event ID, lease ID and
state-version fields. The latter three are NOT present in the current POC;
they are proposed envelope fields requiring a runtime adapter.

The point is to avoid using one fingerprint for two different jobs:
(1) state-level loop detection, and (2) exact invocation/replay idempotency.
The source's top-level run() constructs a fresh Switchboard per scenario;
the observed second-call suppression below was reproduced only by calling
hydra() twice on one persistent in-memory instance. It is not evidence of
cross-run production suppression. The current POC has no production executor.
This module proves only the encoded key relationships. It does not prove
Python/Lean equivalence, correct runtime policy, successful delivery, or
any physical proposition.
-/

namespace HsHVerification.EliasHydraEventLeaseScope

open HsHVerification.EliasHydraRevision

structure Invocation where
  snapshot : Snapshot
  actor : String
  locale : String
  eventId : String
  leaseId : String
  stateVersion : Nat
deriving DecidableEq, Repr

structure ExecutionKey where
  loopState : RevisionKey
  actor : String
  locale : String
  eventId : String
  leaseId : String
  stateVersion : Nat
deriving DecidableEq, Repr

/-- State-level recurrence key; deliberately independent of invocation identity. -/
def loopStateKey (i : Invocation) : RevisionKey :=
  revisionKey i.snapshot

/-- Proposed exact-invocation key for replay/idempotency accounting. -/
def executionKey (i : Invocation) : ExecutionKey :=
  ⟨loopStateKey i, i.actor, i.locale, i.eventId, i.leaseId, i.stateVersion⟩

theorem loop_state_key_ignores_actor (i : Invocation) (actor' : String) :
    loopStateKey {i with actor := actor'} = loopStateKey i := by
  rfl

theorem loop_state_key_ignores_locale (i : Invocation) (locale' : String) :
    loopStateKey {i with locale := locale'} = loopStateKey i := by
  rfl

theorem loop_state_key_ignores_event_id (i : Invocation) (event' : String) :
    loopStateKey {i with eventId := event'} = loopStateKey i := by
  rfl

theorem loop_state_key_ignores_lease_id (i : Invocation) (lease' : String) :
    loopStateKey {i with leaseId := lease'} = loopStateKey i := by
  rfl

theorem loop_state_key_ignores_state_version (i : Invocation) (version' : Nat) :
    loopStateKey {i with stateVersion := version'} = loopStateKey i := by
  rfl

theorem execution_key_distinguishes_actor (i : Invocation) (actor' : String)
    (hne : actor' ≠ i.actor) :
    executionKey {i with actor := actor'} ≠ executionKey i := by
  intro h
  have h' := congrArg ExecutionKey.actor h
  exact hne (by simpa [executionKey] using h')

theorem execution_key_distinguishes_locale (i : Invocation) (locale' : String)
    (hne : locale' ≠ i.locale) :
    executionKey {i with locale := locale'} ≠ executionKey i := by
  intro h
  have h' := congrArg ExecutionKey.locale h
  exact hne (by simpa [executionKey] using h')

theorem execution_key_distinguishes_event_id (i : Invocation) (event' : String)
    (hne : event' ≠ i.eventId) :
    executionKey {i with eventId := event'} ≠ executionKey i := by
  intro h
  have h' := congrArg ExecutionKey.eventId h
  exact hne (by simpa [executionKey] using h')

theorem execution_key_distinguishes_lease_id (i : Invocation) (lease' : String)
    (hne : lease' ≠ i.leaseId) :
    executionKey {i with leaseId := lease'} ≠ executionKey i := by
  intro h
  have h' := congrArg ExecutionKey.leaseId h
  exact hne (by simpa [executionKey] using h')

theorem execution_key_distinguishes_state_version (i : Invocation) (version' : Nat)
    (hne : version' ≠ i.stateVersion) :
    executionKey {i with stateVersion := version'} ≠ executionKey i := by
  intro h
  have h' := congrArg ExecutionKey.stateVersion h
  exact hne (by simpa [executionKey] using h')

def sourceSnapshot : Snapshot where
  node := "candidate_checks"
  stage := "constructed"
  directives := [("WAR_ROOM_DECLARATION_2026-09-24", false)]
  candidateId := "candidate-geometry-001"
  revision := 0

def invocationA : Invocation where
  snapshot := sourceSnapshot
  actor := "Comptroller"
  locale := "theory_workbench"
  eventId := "event-A"
  leaseId := "lease-A"
  stateVersion := 7

def invocationB : Invocation where
  snapshot := sourceSnapshot
  actor := "Comptroller"
  locale := "theory_workbench"
  eventId := "event-B"
  leaseId := "lease-B"
  stateVersion := 7

theorem same_loop_state_different_invocation_scope :
    loopStateKey invocationA = loopStateKey invocationB ∧
    executionKey invocationA ≠ executionKey invocationB := by
  decide

#print axioms loop_state_key_ignores_actor
#print axioms loop_state_key_ignores_locale
#print axioms loop_state_key_ignores_event_id
#print axioms loop_state_key_ignores_lease_id
#print axioms loop_state_key_ignores_state_version
#print axioms execution_key_distinguishes_actor
#print axioms execution_key_distinguishes_locale
#print axioms execution_key_distinguishes_event_id
#print axioms execution_key_distinguishes_lease_id
#print axioms execution_key_distinguishes_state_version
#print axioms same_loop_state_different_invocation_scope

end HsHVerification.EliasHydraEventLeaseScope
