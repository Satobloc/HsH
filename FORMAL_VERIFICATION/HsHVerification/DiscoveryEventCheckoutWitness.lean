import Mathlib
import HsHVerification.DiscoveryCacheSoundness

namespace HsHVerification.DiscoveryEventCheckout

open HsHVerification.DiscoveryCache

/-!
An event/checkout/publication witness for the discovery workflow.

The fields are abstract commit identifiers, not cryptographic hashes.
For a push-triggered run, eventHead represents the immutable triggering
commit. For a scheduled run, it represents the main head captured when the
run starts. checkoutHead is the commit actually scanned; generatedParent is
the direct parent of the generated snapshot commit; generatedCommit is that
commit; currentMain is the branch head at independent readback.

This module formalizes only the source-cut and readback contract. It does not
authenticate GitHub events, source inventories, scans, or actual branch state.
-/

structure RunWitness where
  key : PublishedKey
  eventHead : Nat
  checkoutHead : Nat
  generatedParent : Nat
  generatedCommit : Nat
  currentMain : Nat
  scansComplete : Bool
  deriving DecidableEq, Repr

def eventHeadPinned (w : RunWitness) : Prop :=
  w.checkoutHead = w.eventHead

def generatedDirectChild (w : RunWitness) : Prop :=
  w.generatedParent = w.checkoutHead

def currentAtReadback (w : RunWitness) : Prop :=
  w.currentMain = w.generatedCommit

def safePublication (w : RunWitness) : Prop :=
  w.scansComplete = true ∧
  eventHeadPinned w ∧
  generatedDirectChild w ∧
  currentAtReadback w

/-- A safe publication's generated commit is directly based on the triggering source cut. -/
theorem safe_publication_binds_generated_parent_to_event_head
    (w : RunWitness) (h : safePublication w) :
    w.generatedParent = w.eventHead := by
  rcases h with ⟨_hScans, hEvent, hParent, _hReadback⟩
  exact hParent.trans hEvent

/-- A safe publication is the branch head at the recorded final readback. -/
theorem safe_publication_is_current_at_readback
    (w : RunWitness) (h : safePublication w) :
    w.currentMain = w.generatedCommit := by
  rcases h with ⟨_hScans, _hEvent, _hParent, hReadback⟩
  exact hReadback

/--
Equal published content keys do not establish that a queued run scanned its
triggering event head. The second witness models a run that checks out a newer
generated commit while retaining the same abstract PublishedKey.
-/
theorem same_published_key_does_not_imply_event_head_binding :
    ∃ first second : RunWitness,
      first.key = second.key ∧
      generatedDirectChild second ∧
      ¬ eventHeadPinned second := by
  refine
    ⟨⟨⟨0, 0⟩, 1, 1, 1, 2, 2, true⟩,
     ⟨⟨0, 0⟩, 1, 2, 2, 3, 3, true⟩,
     rfl, rfl, ?_⟩
  simp [eventHeadPinned]

/--
Source-cut binding alone does not establish that the generated artifact is
still the current branch head at final readback.
-/
theorem source_cut_binding_does_not_imply_current_at_readback :
    ∃ w : RunWitness,
      generatedDirectChild w ∧
      ¬ currentAtReadback w := by
  refine ⟨⟨⟨0, 0⟩, 1, 1, 1, 2, 3, true⟩, rfl, ?_⟩
  simp [currentAtReadback]

/--
A generated artifact can be the current branch head while its source checkout
was not pinned to the triggering event head.
-/
theorem current_at_readback_does_not_imply_event_head_binding :
    ∃ w : RunWitness,
      currentAtReadback w ∧
      generatedDirectChild w ∧
      ¬ eventHeadPinned w := by
  refine ⟨⟨⟨0, 0⟩, 1, 2, 2, 3, 3, true⟩, rfl, rfl, ?_⟩
  simp [eventHeadPinned]

#print axioms safe_publication_binds_generated_parent_to_event_head
#print axioms same_published_key_does_not_imply_event_head_binding
#print axioms source_cut_binding_does_not_imply_current_at_readback
#print axioms current_at_readback_does_not_imply_event_head_binding

end HsHVerification.DiscoveryEventCheckout
