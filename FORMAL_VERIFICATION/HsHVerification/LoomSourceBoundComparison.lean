import Mathlib
import HsHVerification.NadirComparisonFreezeCoherence

/-!
# Source-bound comparison evidence

An additive refinement of the comparison-freeze contract. It binds every
E/D/F/R receipt and both paired H0/H1 prediction receipts to the same
nonempty source-bundle identifier already declared by the comparison freeze.

This is a specification-level type contract. String identifiers remain
opaque: Lean does not hash or authenticate source bytes, establish that a
bundle contains the claimed sources, verify reviewer independence, or prove
that a supplied `verified = true` attestation is truthful.
-/

namespace HsHVerification.LoomSourceBoundComparison

open HsHVerification.NadirComparisonFreezeCoherence

/-- The nonempty source bundle named by one comparison freeze. -/
structure SourceBundleIdentity (F : ComparisonFreeze) where
  id : String
  matchesFreeze : id = F.sourceBundleId
  nonempty : id ≠ ""

/-- Required comparison identifiers cannot be silently empty. The source
    bundle identifier is checked separately by SourceBundleIdentity. -/
structure NonemptyFreezeIdentity (F : ComparisonFreeze) where
  comparisonIdPresent : F.id ≠ ""
  canonicalManifestDigestPresent : F.canonicalManifestDigest ≠ ""
  h0ModelFreezeIdPresent : F.h0ModelFreezeId ≠ ""
  h1ModelFreezeIdPresent : F.h1ModelFreezeId ≠ ""
  observationFreezeIdPresent : F.observationFreezeId ≠ ""
  instrumentCalibrationIdPresent : F.instrumentCalibrationId ≠ ""
  uncertaintyCovarianceIdPresent : F.uncertaintyCovarianceId ≠ ""
  sharedParameterManifestIdPresent : F.sharedParameterManifestId ≠ ""
  comparatorFreezeIdPresent : F.comparatorFreezeId ≠ ""
  analysisPlanFreezeIdPresent : F.analysisPlanFreezeId ≠ ""
  decisionRuleIdPresent : F.decisionRuleId ≠ ""
  holdoutPartitionIdPresent : F.holdoutPartitionId ≠ ""
  observableOperatorIdPresent : F.observableOperatorId ≠ ""

/-- An existing evidence receipt plus an explicit reference to the common
    source bundle. The underlying comparison-freeze and axis checks are reused. -/
structure SourceBoundEvidenceReceipt
    (F : ComparisonFreeze) (B : SourceBundleIdentity F)
    (axis : EvidenceAxis) where
  receipt : EvidenceReceipt F axis
  sourceBundleId : String
  sourceBundleMatches : sourceBundleId = B.id

/-- The freeze witness is bound to the same source bundle as every evidence
    axis, rather than merely carrying an unused sourceBundleId on the manifest. -/
structure SourceBoundFreezeWitness
    (F : ComparisonFreeze) (B : SourceBundleIdentity F) where
  witness : ComparisonFreezeWitness F
  sourceBundleId : String
  sourceBundleMatches : sourceBundleId = B.id

/-- Each model-specific prediction receipt is also tied to the same source
    bundle, while retaining the existing H0/H1 side-specific model freeze. -/
structure SourceBoundPredictionReceipt
    (F : ComparisonFreeze) (B : SourceBundleIdentity F)
    (side : ModelSide) where
  receipt : ModelPredictionReceipt F side
  sourceBundleId : String
  sourceBundleMatches : sourceBundleId = B.id

/-- Additive source-bound form of the existing P2 evidence bundle. -/
structure SourceBoundP2Bundle (F : ComparisonFreeze) where
  identity : NonemptyFreezeIdentity F
  sourceBundle : SourceBundleIdentity F
  empirical : SourceBoundEvidenceReceipt F sourceBundle .empirical
  discrimination : SourceBoundEvidenceReceipt F sourceBundle .discrimination
  freeze : SourceBoundFreezeWitness F sourceBundle
  review : SourceBoundEvidenceReceipt F sourceBundle .review
  h0 : SourceBoundPredictionReceipt F sourceBundle .h0
  h1 : SourceBoundPredictionReceipt F sourceBundle .h1

/-- All four evidence axes and both paired predictions carry one exact
    source-bundle identifier. -/
theorem source_bound_bundle_uses_one_source_bundle
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    b.empirical.sourceBundleId = b.discrimination.sourceBundleId ∧
    b.empirical.sourceBundleId = b.freeze.sourceBundleId ∧
    b.empirical.sourceBundleId = b.review.sourceBundleId ∧
    b.empirical.sourceBundleId = b.h0.sourceBundleId ∧
    b.empirical.sourceBundleId = b.h1.sourceBundleId := by
  constructor
  · exact b.empirical.sourceBundleMatches.trans b.discrimination.sourceBundleMatches.symm
  constructor
  · exact b.empirical.sourceBundleMatches.trans b.freeze.sourceBundleMatches.symm
  constructor
  · exact b.empirical.sourceBundleMatches.trans b.review.sourceBundleMatches.symm
  constructor
  · exact b.empirical.sourceBundleMatches.trans b.h0.sourceBundleMatches.symm
  · exact b.empirical.sourceBundleMatches.trans b.h1.sourceBundleMatches.symm

/-- The source-bundle identifier carried by every receipt is the one named
    in the comparison manifest. -/
theorem source_bound_bundle_uses_manifest_source_bundle
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    b.empirical.sourceBundleId = F.sourceBundleId :=
  b.empirical.sourceBundleMatches.trans b.sourceBundle.matchesFreeze

/-- An admitted source-bound bundle carries a nonempty source-bundle ID. -/
theorem source_bound_bundle_source_id_nonempty
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    b.sourceBundle.id ≠ "" :=
  b.sourceBundle.nonempty

/-- The source-bound refinement retains every nonempty comparison identity
    as an explicit witness. -/
theorem source_bound_bundle_has_nonempty_freeze_identity
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    NonemptyFreezeIdentity F :=
  b.identity

/-- Forgetting only the additive source-binding wrappers recovers the
    existing P2EvidenceBundle without changing its receipts or model sides. -/
def forgetSourceBindings
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    P2EvidenceBundle F :=
  { empirical := b.empirical.receipt
    discrimination := b.discrimination.receipt
    freeze := b.freeze.witness
    review := b.review.receipt
    h0 := b.h0.receipt
    h1 := b.h1.receipt }

/-- The refinement strengthens the existing contract; it does not replace it. -/
theorem source_bound_bundle_satisfies_existing_p2_contract
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    p2Ready F :=
  ⟨forgetSourceBindings b⟩

#print axioms source_bound_bundle_uses_one_source_bundle
#print axioms source_bound_bundle_uses_manifest_source_bundle
#print axioms source_bound_bundle_source_id_nonempty
#print axioms source_bound_bundle_has_nonempty_freeze_identity
#print axioms source_bound_bundle_satisfies_existing_p2_contract

end HsHVerification.LoomSourceBoundComparison
