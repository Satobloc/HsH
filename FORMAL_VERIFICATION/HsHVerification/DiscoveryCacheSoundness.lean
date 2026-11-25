import Mathlib

namespace HsHVerification.DiscoveryCache

/-!
An abstract cache contract for the public discovery generator.

The public artifact is keyed by eligible source inventory plus every
output-determining transformation input. Raw branch-head observations and
scan times belong in a separate scan receipt, not in the public no-op key.

Theorems here concern only this abstract software model. They do not prove
that the live generator computes a complete key or that external cache checks
are true.
-/

structure PublishedKey where
  inventoryDigest : Nat
  transformFingerprint : Nat
  deriving DecidableEq, Repr

structure ScanReceipt where
  observedBranchHead : Nat
  checkedAt : Nat
  allScansComplete : Bool
  deriving DecidableEq, Repr

structure Snapshot where
  key : PublishedKey
  receipt : ScanReceipt
  deriving DecidableEq, Repr

def publishedKey (snapshot : Snapshot) : PublishedKey :=
  snapshot.key

def scanReceiptKey (snapshot : Snapshot) : ScanReceipt :=
  snapshot.receipt

def safeNoOp (old new : Snapshot) (cacheIntegrityVerified : Prop) : Prop :=
  old.receipt.allScansComplete = true ∧
  new.receipt.allScansComplete = true ∧
  publishedKey old = publishedKey new ∧
  cacheIntegrityVerified

/-- An inventory-only digest cannot identify output when transformation inputs vary. -/
theorem inventory_digest_alone_does_not_identify_published_key :
    ∃ old new : Snapshot,
      old.key.inventoryDigest = new.key.inventoryDigest ∧
      publishedKey old ≠ publishedKey new := by
  refine ⟨⟨⟨0, 0⟩, ⟨0, 0, true⟩⟩,
          ⟨⟨0, 1⟩, ⟨0, 0, true⟩⟩, rfl, ?_⟩
  decide

/--
The same published content key can coexist with a different raw branch head
and scan time. Those observations belong in the scan receipt, not the public
artifact's no-op key.
-/
theorem same_published_key_can_have_distinct_scan_receipts :
    ∃ old new : Snapshot,
      publishedKey old = publishedKey new ∧
      scanReceiptKey old ≠ scanReceiptKey new := by
  refine ⟨⟨⟨0, 0⟩, ⟨0, 0, true⟩⟩,
          ⟨⟨0, 0⟩, ⟨1, 1, true⟩⟩, rfl, ?_⟩
  decide

/-- A safe no-op preserves the public key, conditional on external cache validation. -/
theorem safe_noop_preserves_published_key
    {old new : Snapshot} {cacheIntegrityVerified : Prop}
    (h : safeNoOp old new cacheIntegrityVerified) :
    publishedKey old = publishedKey new := by
  rcases h with ⟨_hOldScan, _hNewScan, hKey, _hCache⟩
  exact hKey

/--
A no-op can remain safe even when a generated-only commit advances the raw
branch head, provided the published key and external integrity checks remain
equal. This is an abstract separation theorem, not a claim about the live
workflow's implementation.
-/
theorem safe_noop_can_ignore_raw_head_when_published_key_matches :
    ∃ old new : Snapshot,
      safeNoOp old new True ∧
      old.receipt.observedBranchHead ≠ new.receipt.observedBranchHead := by
  refine ⟨⟨⟨0, 0⟩, ⟨0, 0, true⟩⟩,
          ⟨⟨0, 0⟩, ⟨1, 1, true⟩⟩, ?_, ?_⟩
  · exact ⟨rfl, rfl, rfl, trivial⟩
  · decide

end HsHVerification.DiscoveryCache
