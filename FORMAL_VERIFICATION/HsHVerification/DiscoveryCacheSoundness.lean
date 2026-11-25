import Mathlib

namespace HsHVerification.DiscoveryCache

/-!
An abstract cache-key contract for the public discovery generator.

The three fields separate:
* eligible source inventory;
* the transformation/policy/runtime that derives output from that inventory;
* repository-head provenance embedded in the published snapshot.

The theorems below are software-contract results only. They do not prove that
the live generator correctly computes any field, that its output is valid, or
that a physical model is correct.
-/

structure BuildKey where
  inventoryDigest : Nat
  transformFingerprint : Nat
  sourceHeadVector : Nat
  deriving DecidableEq, Repr

def inventoryCurrent (old new : BuildKey) : Prop :=
  old.inventoryDigest = new.inventoryDigest

def contentCurrent (old new : BuildKey) : Prop :=
  old.inventoryDigest = new.inventoryDigest ∧
  old.transformFingerprint = new.transformFingerprint

def branchHeadCurrent (old new : BuildKey) : Prop :=
  old.sourceHeadVector = new.sourceHeadVector

def contentOutput (key : BuildKey) : Nat × Nat :=
  (key.inventoryDigest, key.transformFingerprint)

def provenanceOutput (key : BuildKey) : Nat :=
  key.sourceHeadVector

/-- An inventory-only key cannot identify output when transformation inputs vary. -/
theorem inventory_digest_alone_does_not_identify_content_output :
    ∃ old new : BuildKey,
      inventoryCurrent old new ∧
      contentOutput old ≠ contentOutput new := by
  refine ⟨⟨0, 0, 0⟩, ⟨0, 1, 0⟩, rfl, ?_⟩
  decide

/-- Content may be reusable while the embedded repository-head provenance is stale. -/
theorem content_current_can_coexist_with_stale_branch_provenance :
    ∃ old new : BuildKey,
      contentCurrent old new ∧
      ¬ branchHeadCurrent old new := by
  refine ⟨⟨0, 0, 0⟩, ⟨0, 0, 1⟩, ⟨rfl, rfl⟩, ?_⟩
  simp [branchHeadCurrent]

theorem content_current_preserves_content_output
    {old new : BuildKey}
    (hInventory : old.inventoryDigest = new.inventoryDigest)
    (hTransform : old.transformFingerprint = new.transformFingerprint) :
    contentOutput old = contentOutput new := by
  simp [contentOutput, hInventory, hTransform]

theorem branch_head_current_preserves_provenance_output
    {old new : BuildKey}
    (hHead : old.sourceHeadVector = new.sourceHeadVector) :
    provenanceOutput old = provenanceOutput new := by
  simpa [provenanceOutput] using hHead

/--
A complete no-op requires both content and provenance equality, plus an
independently established cache-integrity condition. Lean does not establish
that external condition; the implementation must validate the JSON and all
referenced thumbnail sidecars.
-/
def safeNoOp (old new : BuildKey) (cacheIntegrityVerified : Prop) : Prop :=
  contentCurrent old new ∧
  branchHeadCurrent old new ∧
  cacheIntegrityVerified

theorem safe_noop_preserves_content_and_provenance
    {old new : BuildKey} {cacheIntegrityVerified : Prop}
    (h : safeNoOp old new cacheIntegrityVerified) :
    contentOutput old = contentOutput new ∧
    provenanceOutput old = provenanceOutput new := by
  rcases h with ⟨hContent, hHead, _hCache⟩
  rcases hContent with ⟨hInventory, hTransform⟩
  constructor
  · exact content_current_preserves_content_output hInventory hTransform
  · exact branch_head_current_preserves_provenance_output hHead

end HsHVerification.DiscoveryCache
