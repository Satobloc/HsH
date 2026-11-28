import Mathlib
import HsHVerification.DiscoveryCacheSoundness
import HsHVerification.DiscoveryEventCheckoutWitness

namespace HsHVerification.DiscoveryDecisionComposition

open HsHVerification.DiscoveryCache
open HsHVerification.DiscoveryEventCheckout

/-!
Composition of the stable-content/no-op contract with the actual source-cut
and final-publication contract.

The live workflow has two distinct terminal paths:
* no staged diff: exit without creating a commit;
* staged diff: commit, then retry a failed push by rebasing onto current main.

A no-op needs a final-currentness witness. A publication after rebase needs
either a rescan at the new base or a revalidation of the complete PublishedKey.
These are abstract software contracts, not claims that the current workflow
emits the witnesses or that GitHub state is authenticated by Lean.
-/

/-- One cached derivative, bound to its source and transform and independently checked. -/
structure DerivativeCacheWitness where
  sourceDigest : Nat
  expectedSourceDigest : Nat
  transformFingerprint : Nat
  expectedTransformFingerprint : Nat
  sidecarDigest : Nat
  expectedSidecarDigest : Nat
  decodeSucceeded : Bool
  dimensionsValid : Bool
  deriving DecidableEq, Repr

def derivativeCacheWitnessValid (w : DerivativeCacheWitness) : Prop :=
  w.sourceDigest = w.expectedSourceDigest ∧
  w.transformFingerprint = w.expectedTransformFingerprint ∧
  w.sidecarDigest = w.expectedSidecarDigest ∧
  w.decodeSucceeded = true ∧
  w.dimensionsValid = true

/-- The prior snapshot and the complete derivative manifest consumed by a no-op. -/
structure CacheIntegrityWitness where
  priorSnapshotDigest : Nat
  consumedPriorSnapshotDigest : Nat
  derivativeManifestDigest : Nat
  verifiedDerivativeManifestDigest : Nat
  derivativeManifestComplete : Bool
  derivatives : List DerivativeCacheWitness
  deriving DecidableEq, Repr

def cacheIntegrityWitnessValid (w : CacheIntegrityWitness) : Prop :=
  w.priorSnapshotDigest = w.consumedPriorSnapshotDigest ∧
  w.derivativeManifestDigest = w.verifiedDerivativeManifestDigest ∧
  w.derivativeManifestComplete = true ∧
  ∀ d ∈ w.derivatives, derivativeCacheWitnessValid d

/-- Evidence for a no-commit exit, including a final-main currentness check. -/
structure NoOpWitness where
  old : Snapshot
  new : Snapshot
  cache : CacheIntegrityWitness
  mode : CheckoutMode
  eventHead : Nat
  checkoutHead : Nat
  finalMain : Nat
  finalMainKey : Option PublishedKey
  deriving DecidableEq, Repr

def noOpCheckoutPolicySatisfied (w : NoOpWitness) : Prop :=
  match w.mode with
  | .EventPinned => w.checkoutHead = w.eventHead
  | .LatestMain => True

/--
If main has not moved, the scanned checkout is still current. If it has moved,
the published key must be recomputed at final main and match exactly.
-/
def noOpCurrentnessSatisfied (w : NoOpWitness) : Prop :=
  w.finalMain = w.checkoutHead ∨
  w.finalMainKey = some (publishedKey w.new)

def safeNoOpAtReadback (w : NoOpWitness) : Prop :=
  safeNoOp w.old w.new (cacheIntegrityWitnessValid w.cache) ∧
  noOpCheckoutPolicySatisfied w ∧
  noOpCurrentnessSatisfied w

theorem safe_noop_after_main_advance_requires_key_revalidation
    (w : NoOpWitness) (h : safeNoOpAtReadback w)
    (hMoved : w.finalMain ≠ w.checkoutHead) :
    w.finalMainKey = some (publishedKey w.new) := by
  rcases h with ⟨_hNoOp, _hPolicy, hCurrent⟩
  rcases hCurrent with hStable | hRevalidated
  · exact False.elim (hMoved hStable)
  · exact hRevalidated

theorem safe_noop_requires_cache_integrity_witness
    (w : NoOpWitness) (h : safeNoOpAtReadback w) :
    cacheIntegrityWitnessValid w.cache := by
  rcases h with ⟨hNoOp, _hPolicy, _hCurrent⟩
  rcases hNoOp with ⟨_hOldScan, _hNewScan, _hKey, hCache⟩
  exact hCache

theorem safe_noop_requires_prior_snapshot_identity
    (w : NoOpWitness) (h : safeNoOpAtReadback w) :
    w.cache.priorSnapshotDigest = w.cache.consumedPriorSnapshotDigest := by
  have hCache := safe_noop_requires_cache_integrity_witness w h
  exact hCache.1

theorem safe_noop_requires_complete_derivative_manifest
    (w : NoOpWitness) (h : safeNoOpAtReadback w) :
    w.cache.derivativeManifestComplete = true := by
  have hCache := safe_noop_requires_cache_integrity_witness w h
  exact hCache.2.2.1

theorem safe_noop_requires_each_derivative_witness
    (w : NoOpWitness) (h : safeNoOpAtReadback w) :
    ∀ d ∈ w.cache.derivatives, derivativeCacheWitnessValid d := by
  have hCache := safe_noop_requires_cache_integrity_witness w h
  exact hCache.2.2.2

def validDerivative : DerivativeCacheWitness :=
  { sourceDigest := 11
    expectedSourceDigest := 11
    transformFingerprint := 13
    expectedTransformFingerprint := 13
    sidecarDigest := 17
    expectedSidecarDigest := 17
    decodeSucceeded := true
    dimensionsValid := true }

def validCache : CacheIntegrityWitness :=
  { priorSnapshotDigest := 19
    consumedPriorSnapshotDigest := 19
    derivativeManifestDigest := 23
    verifiedDerivativeManifestDigest := 23
    derivativeManifestComplete := true
    derivatives := [validDerivative] }

def validOldSnapshot : Snapshot :=
  { key := ⟨1, 2⟩
    receipt := ⟨5, 10, true⟩ }

def validNewSnapshot : Snapshot :=
  { key := ⟨1, 2⟩
    receipt := ⟨6, 11, true⟩ }

def validatedNoOpWitness : NoOpWitness :=
  { old := validOldSnapshot
    new := validNewSnapshot
    cache := validCache
    mode := .LatestMain
    eventHead := 4
    checkoutHead := 6
    finalMain := 6
    finalMainKey := none }

def revalidatedNoOpWitness : NoOpWitness :=
  { validatedNoOpWitness with
    finalMain := 7
    finalMainKey := some validNewSnapshot.key }

def unvalidatedNoOpWitness : NoOpWitness :=
  { validatedNoOpWitness with
    finalMain := 7
    finalMainKey := none }

def invalidCacheNoOpWitness : NoOpWitness :=
  { validatedNoOpWitness with
    cache := { validCache with
      derivatives := [{ validDerivative with sidecarDigest := 18 }] } }

theorem validated_noop_is_safe :
    safeNoOpAtReadback validatedNoOpWitness := by
  simp [safeNoOpAtReadback, safeNoOp, noOpCheckoutPolicySatisfied,
    noOpCurrentnessSatisfied, cacheIntegrityWitnessValid,
    derivativeCacheWitnessValid, publishedKey, validOldSnapshot,
    validNewSnapshot, validCache, validDerivative, validatedNoOpWitness]

theorem revalidated_noop_is_safe :
    safeNoOpAtReadback revalidatedNoOpWitness := by
  simp [safeNoOpAtReadback, safeNoOp, noOpCheckoutPolicySatisfied,
    noOpCurrentnessSatisfied, cacheIntegrityWitnessValid,
    derivativeCacheWitnessValid, publishedKey, validOldSnapshot,
    validNewSnapshot, validCache, validDerivative,
    validatedNoOpWitness, revalidatedNoOpWitness]

theorem unvalidated_main_advance_blocks_noop :
    ¬ safeNoOpAtReadback unvalidatedNoOpWitness := by
  simp [safeNoOpAtReadback, safeNoOp, noOpCheckoutPolicySatisfied,
    noOpCurrentnessSatisfied, cacheIntegrityWitnessValid,
    derivativeCacheWitnessValid, publishedKey, validOldSnapshot,
    validNewSnapshot, validCache, validDerivative,
    validatedNoOpWitness, unvalidatedNoOpWitness]

theorem invalid_derivative_cache_blocks_noop :
    ¬ safeNoOpAtReadback invalidCacheNoOpWitness := by
  simp [safeNoOpAtReadback, safeNoOp, noOpCheckoutPolicySatisfied,
    noOpCurrentnessSatisfied, cacheIntegrityWitnessValid,
    derivativeCacheWitnessValid, publishedKey, validOldSnapshot,
    validNewSnapshot, validCache, validDerivative,
    validatedNoOpWitness, invalidCacheNoOpWitness]

/-- A rebase resolution distinguishes no rebase, rescan, key revalidation, and an unverified rebase. -/
inductive RebaseResolution where
  | noRebase
  | rescanned
  | keyRevalidated
  | unverified
  deriving DecidableEq, Repr

structure RebaseWitness where
  run : RunWitness
  finalBaseHead : Nat
  scanHead : Nat
  finalBaseKey : Option PublishedKey
  rescanKey : Option PublishedKey
  rescanScansComplete : Bool
  generatedKey : PublishedKey
  resolution : RebaseResolution
  deriving DecidableEq, Repr

/--
A rescan is evidence only when it is complete and its resulting stable key is
the key attached to the generated artifact. Merely matching the new commit
number to a scan-head field does not bind the generated content to that scan.
A key-revalidation path instead requires the already-generated key to equal
the independently read final-base key.
-/
def rebaseResolutionSatisfied (w : RebaseWitness) : Prop :=
  w.run.generatedParent = w.finalBaseHead ∧
  match w.resolution with
  | .noRebase =>
      w.finalBaseHead = w.run.receipt.checkoutHead ∧
      w.scanHead = w.run.receipt.checkoutHead ∧
      w.generatedKey = w.run.key
  | .rescanned =>
      w.run.mode = .LatestMain ∧
      w.finalBaseHead ≠ w.run.receipt.checkoutHead ∧
      w.scanHead = w.finalBaseHead ∧
      w.rescanScansComplete = true ∧
      w.rescanKey = some w.generatedKey
  | .keyRevalidated =>
      w.run.mode = .LatestMain ∧
      w.finalBaseHead ≠ w.run.receipt.checkoutHead ∧
      w.scanHead = w.run.receipt.checkoutHead ∧
      w.finalBaseKey = some w.generatedKey ∧
      w.generatedKey = w.run.key
  | .unverified => False

def safeFinalPublication (w : RebaseWitness) : Prop :=
  w.run.receipt.scansComplete = true ∧
  checkoutPolicySatisfied w.run ∧
  rebaseResolutionSatisfied w ∧
  currentAtReadback w.run ∧
  w.run.generatedCommit ≠ w.run.generatedParent

theorem safe_final_publication_binds_parent_to_final_base
    (w : RebaseWitness) (h : safeFinalPublication w) :
    w.run.generatedParent = w.finalBaseHead := by
  rcases h with ⟨_hScans, _hPolicy, hRebase, _hReadback, _hCommit⟩
  exact hRebase.1

theorem safe_rebased_publication_requires_rescan_or_key_revalidation
    (w : RebaseWitness) (h : safeFinalPublication w)
    (hMoved : w.finalBaseHead ≠ w.run.receipt.checkoutHead) :
    (w.scanHead = w.finalBaseHead ∧
      w.rescanScansComplete = true ∧
      w.rescanKey = some w.generatedKey) ∨
      w.finalBaseKey = some w.generatedKey := by
  rcases h with ⟨_hScans, _hPolicy, hRebase, _hReadback, _hCommit⟩
  rcases hRebase with ⟨_hParent, hResolutionEvidence⟩
  cases hResolution : w.resolution with
  | noRebase =>
      simp [rebaseResolutionSatisfied, hResolution] at hResolutionEvidence
      rcases hResolutionEvidence with ⟨hBase, _hScan, _hKey⟩
      exact False.elim (hMoved hBase)
  | rescanned =>
      simp [rebaseResolutionSatisfied, hResolution] at hResolutionEvidence
      rcases hResolutionEvidence with
        ⟨_hMode, _hMoved, hScan, hComplete, hKey⟩
      exact Or.inl ⟨hScan, hComplete, hKey⟩
  | keyRevalidated =>
      simp [rebaseResolutionSatisfied, hResolution] at hResolutionEvidence
      rcases hResolutionEvidence with
        ⟨_hMode, _hMoved, _hScan, hKey, _hGeneratedKey⟩
      exact Or.inr hKey
  | unverified =>
      simp [rebaseResolutionSatisfied, hResolution] at hResolutionEvidence

theorem safe_event_pinned_publication_stays_on_event_head
    (w : RebaseWitness) (hMode : w.run.mode = .EventPinned)
    (h : safeFinalPublication w) :
    w.finalBaseHead = w.run.receipt.eventHead := by
  rcases h with ⟨_hScans, hPolicy, hRebase, _hReadback, _hCommit⟩
  have hCheckout : w.run.receipt.checkoutHead = w.run.receipt.eventHead := by
    simpa [checkoutPolicySatisfied, hMode] using hPolicy
  cases hResolution : w.resolution with
  | noRebase =>
      simp [rebaseResolutionSatisfied, hResolution] at hRebase
      exact hRebase.2.1.trans hCheckout
  | rescanned =>
      simp [rebaseResolutionSatisfied, hResolution, hMode] at hRebase
  | keyRevalidated =>
      simp [rebaseResolutionSatisfied, hResolution, hMode] at hRebase
  | unverified =>
      simp [rebaseResolutionSatisfied, hResolution] at hRebase

theorem safe_no_rebase_agrees_with_existing_publication_contract
    (w : RebaseWitness) (hNoRebase : w.resolution = .noRebase)
    (h : safeFinalPublication w) :
    safePublication w.run := by
  rcases h with ⟨hScans, hPolicy, hRebase, hReadback, _hCommit⟩
  simp [rebaseResolutionSatisfied, hNoRebase] at hRebase
  rcases hRebase with ⟨hParent, hBase, _hScan⟩
  exact ⟨hScans, hPolicy, hParent.trans hBase, hReadback⟩

def latestMainRescanWitness : RebaseWitness :=
  { run :=
      { key := ⟨1, 2⟩
        receipt := ⟨1, 2, 3, 4, true⟩
        mode := .LatestMain
        generatedParent := 3
        generatedCommit := 4
        currentMain := 4 }
    finalBaseHead := 3
    scanHead := 3
    finalBaseKey := none
    rescanKey := some ⟨7, 8⟩
    rescanScansComplete := true
    generatedKey := ⟨7, 8⟩
    resolution := .rescanned }

def latestMainKeyRevalidationWitness : RebaseWitness :=
  { run :=
      { key := ⟨1, 2⟩
        receipt := ⟨1, 2, 3, 4, true⟩
        mode := .LatestMain
        generatedParent := 3
        generatedCommit := 4
        currentMain := 4 }
    finalBaseHead := 3
    scanHead := 2
    finalBaseKey := some ⟨1, 2⟩
    rescanKey := none
    rescanScansComplete := false
    generatedKey := ⟨1, 2⟩
    resolution := .keyRevalidated }

def eventPinnedRebaseWitness : RebaseWitness :=
  { run :=
      { key := ⟨1, 2⟩
        receipt := ⟨2, 2, 3, 4, true⟩
        mode := .EventPinned
        generatedParent := 3
        generatedCommit := 4
        currentMain := 4 }
    finalBaseHead := 3
    scanHead := 3
    finalBaseKey := none
    rescanKey := some ⟨7, 8⟩
    rescanScansComplete := true
    generatedKey := ⟨7, 8⟩
    resolution := .rescanned }

def unverifiedRebaseWitness : RebaseWitness :=
  { run :=
      { key := ⟨1, 2⟩
        receipt := ⟨1, 2, 3, 4, true⟩
        mode := .LatestMain
        generatedParent := 3
        generatedCommit := 4
        currentMain := 4 }
    finalBaseHead := 3
    scanHead := 2
    finalBaseKey := none
    rescanKey := none
    rescanScansComplete := false
    generatedKey := ⟨1, 2⟩
    resolution := .unverified }

def missingRescanKeyWitness : RebaseWitness :=
  { latestMainRescanWitness with rescanKey := none }

def incompleteRescanWitness : RebaseWitness :=
  { latestMainRescanWitness with rescanScansComplete := false }

theorem latest_main_rescan_is_safe :
    safeFinalPublication latestMainRescanWitness := by
  simp [safeFinalPublication, checkoutPolicySatisfied, rebaseResolutionSatisfied,
    currentAtReadback, latestMainRescanWitness]

theorem latest_main_key_revalidation_is_safe :
    safeFinalPublication latestMainKeyRevalidationWitness := by
  simp [safeFinalPublication, checkoutPolicySatisfied, rebaseResolutionSatisfied,
    currentAtReadback, latestMainKeyRevalidationWitness]

theorem event_pinned_rebase_to_new_main_is_rejected :
    ¬ safeFinalPublication eventPinnedRebaseWitness := by
  simp [safeFinalPublication, checkoutPolicySatisfied, rebaseResolutionSatisfied,
    currentAtReadback, eventPinnedRebaseWitness]

theorem unverified_rebase_is_rejected :
    ¬ safeFinalPublication unverifiedRebaseWitness := by
  simp [safeFinalPublication, checkoutPolicySatisfied, rebaseResolutionSatisfied,
    currentAtReadback, unverifiedRebaseWitness]

theorem missing_rescan_key_blocks_publication :
    ¬ safeFinalPublication missingRescanKeyWitness := by
  simp [safeFinalPublication, checkoutPolicySatisfied, rebaseResolutionSatisfied,
    currentAtReadback, missingRescanKeyWitness, latestMainRescanWitness]

theorem incomplete_rescan_blocks_publication :
    ¬ safeFinalPublication incompleteRescanWitness := by
  simp [safeFinalPublication, checkoutPolicySatisfied, rebaseResolutionSatisfied,
    currentAtReadback, incompleteRescanWitness, latestMainRescanWitness]

#print axioms safe_noop_after_main_advance_requires_key_revalidation
#print axioms safe_noop_requires_prior_snapshot_identity
#print axioms safe_noop_requires_complete_derivative_manifest
#print axioms safe_noop_requires_each_derivative_witness
#print axioms safe_rebased_publication_requires_rescan_or_key_revalidation
#print axioms safe_event_pinned_publication_stays_on_event_head
#print axioms safe_no_rebase_agrees_with_existing_publication_contract
#print axioms latest_main_rescan_is_safe
#print axioms latest_main_key_revalidation_is_safe
#print axioms event_pinned_rebase_to_new_main_is_rejected
#print axioms unverified_rebase_is_rejected
#print axioms missing_rescan_key_blocks_publication
#print axioms incomplete_rescan_blocks_publication

end HsHVerification.DiscoveryDecisionComposition
