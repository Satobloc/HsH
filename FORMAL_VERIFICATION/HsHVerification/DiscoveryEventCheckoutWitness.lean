import Mathlib
import HsHVerification.DiscoveryCacheSoundness

namespace HsHVerification.DiscoveryEventCheckout

open HsHVerification.DiscoveryCache

/-!
A source-cut/publication witness for two legitimate checkout policies.

EventPinned is appropriate when a push-triggered run promises to scan the
immutable triggering commit. LatestMain is appropriate for a convergence
workflow that intentionally fetches the newest main at each attempt. In both
modes the receipt must record the actual checkout head, and the generated
snapshot commit must be directly based on that checked-out head.

Commit identifiers are abstract tokens, not cryptographic hashes. This module
does not authenticate GitHub events, repository inventories, scans, or actual
branch state.
-/

inductive CheckoutMode where
  | EventPinned
  | LatestMain
  deriving DecidableEq, Repr

/-- Run metadata kept separate from the stable published-content key. -/
structure ScanReceipt where
  eventHead : Nat
  checkoutHead : Nat
  checkedAt : Nat
  diagnosticsDigest : Nat
  scansComplete : Bool
  deriving DecidableEq, Repr

structure RunWitness where
  key : PublishedKey
  receipt : ScanReceipt
  mode : CheckoutMode
  generatedParent : Nat
  generatedCommit : Nat
  currentMain : Nat
  deriving DecidableEq, Repr

def checkoutPolicySatisfied (w : RunWitness) : Prop :=
  match w.mode with
  | .EventPinned => w.receipt.checkoutHead = w.receipt.eventHead
  | .LatestMain => True

def generatedDirectChild (w : RunWitness) : Prop :=
  w.generatedParent = w.receipt.checkoutHead

def currentAtReadback (w : RunWitness) : Prop :=
  w.currentMain = w.generatedCommit

def safePublication (w : RunWitness) : Prop :=
  w.receipt.scansComplete = true ∧
  checkoutPolicySatisfied w ∧
  generatedDirectChild w ∧
  currentAtReadback w

/-- In either checkout mode, the generated snapshot is directly based on the head actually scanned. -/
theorem safe_publication_binds_generated_parent_to_checkout_head
    (w : RunWitness) (h : safePublication w) :
    w.generatedParent = w.receipt.checkoutHead := by
  rcases h with ⟨_hScans, _hPolicy, hParent, _hReadback⟩
  exact hParent

/-- EventPinned mode additionally binds the checked-out source to the immutable trigger head. -/
theorem event_pinned_publication_binds_parent_to_event_head
    (w : RunWitness) (hMode : w.mode = .EventPinned)
    (h : safePublication w) :
    w.generatedParent = w.receipt.eventHead := by
  rcases h with ⟨_hScans, hPolicy, hParent, _hReadback⟩
  have hCheckout : w.receipt.checkoutHead = w.receipt.eventHead := by
    simpa [checkoutPolicySatisfied, hMode] using hPolicy
  exact hParent.trans hCheckout

/--
LatestMain is a legitimate convergence policy: a safe publication can scan a
newer main than the triggering event, provided the actual checkout is recorded
and the generated commit is directly based on it.
-/
theorem latest_main_publication_can_have_event_checkout_difference :
    ∃ w : RunWitness,
      w.mode = .LatestMain ∧
      safePublication w ∧
      w.receipt.checkoutHead ≠ w.receipt.eventHead := by
  refine
    ⟨⟨⟨0, 0⟩, ⟨1, 2, 3, 4, true⟩, .LatestMain, 2, 3, 3⟩,
     rfl, ?_, ?_⟩
  · simp [safePublication, checkoutPolicySatisfied, generatedDirectChild, currentAtReadback]
  · decide

/-- Source-cut binding alone does not establish current-at-readback. -/
theorem source_cut_binding_does_not_imply_current_at_readback :
    ∃ w : RunWitness,
      generatedDirectChild w ∧
      ¬ currentAtReadback w := by
  refine
    ⟨⟨⟨0, 0⟩, ⟨1, 1, 3, 4, true⟩, .LatestMain, 1, 2, 3⟩,
     rfl, ?_⟩
  simp [currentAtReadback]

/-- Current-at-readback alone does not establish that the artifact was built from the recorded checkout. -/
theorem current_at_readback_does_not_imply_generated_parent_binding :
    ∃ w : RunWitness,
      currentAtReadback w ∧
      ¬ generatedDirectChild w := by
  refine
    ⟨⟨⟨0, 0⟩, ⟨1, 2, 3, 4, true⟩, .LatestMain, 1, 3, 3⟩,
     rfl, ?_⟩
  simp [generatedDirectChild]

/-- Equal stable PublishedKeys do not establish source-cut binding by themselves. -/
theorem same_published_key_does_not_imply_source_cut_binding :
    ∃ first second : RunWitness,
      first.key = second.key ∧
      ¬ generatedDirectChild second := by
  refine
    ⟨⟨⟨0, 0⟩, ⟨1, 1, 2, 3, true⟩, .EventPinned, 1, 2, 2⟩,
     ⟨⟨0, 0⟩, ⟨1, 2, 3, 3, true⟩, .LatestMain, 1, 3, 3⟩,
     rfl, ?_⟩
  simp [generatedDirectChild]

#print axioms safe_publication_binds_generated_parent_to_checkout_head
#print axioms event_pinned_publication_binds_parent_to_event_head
#print axioms latest_main_publication_can_have_event_checkout_difference
#print axioms source_cut_binding_does_not_imply_current_at_readback
#print axioms current_at_readback_does_not_imply_generated_parent_binding
#print axioms same_published_key_does_not_imply_source_cut_binding

end HsHVerification.DiscoveryEventCheckout
