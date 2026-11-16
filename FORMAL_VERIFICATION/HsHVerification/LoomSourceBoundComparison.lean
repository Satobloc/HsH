import Mathlib
import HsHVerification.NadirComparisonFreezeCoherence

/-!
# Source-bound comparison evidence

An additive refinement of the comparison-freeze contract. It binds every
E/D/F/R receipt and both paired H0/H1 prediction receipts to the same
nonempty source-bundle identifier already declared by the comparison freeze.
It also requires an explicit source-witness digest and a canonical manifest
identity containing both the source-manifest ID and observation-manifest ID.

This is a specification-level type contract. String identifiers and digests
remain opaque: Lean does not hash or authenticate source bytes, establish that
a bundle or manifest contains the claimed sources, verify reviewer independence,
or prove that a supplied verified attestation is truthful. Manifest membership
below is membership in a declared list, not filesystem or byte-level validation.
-/

namespace HsHVerification.LoomSourceBoundComparison

open HsHVerification.NadirComparisonFreezeCoherence

/-- The nonempty source bundle named by one comparison freeze, with an opaque
    witness digest string. The digest is not cryptographically checked here. -/
structure SourceBundleIdentity (F : ComparisonFreeze) where
  id : String
  matchesFreeze : id = F.sourceBundleId
  nonempty : id ≠ ""
  witnessDigest : String
  witnessDigestNonempty : witnessDigest ≠ ""

/-- Required comparison identifiers cannot be silently empty. The source
    bundle identifier and witness digest are checked separately. -/
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

/-- An existing evidence receipt plus explicit references to the common
    source bundle and its opaque witness digest. -/
structure SourceBoundEvidenceReceipt
    (F : ComparisonFreeze) (B : SourceBundleIdentity F)
    (axis : EvidenceAxis) where
  receipt : EvidenceReceipt F axis
  sourceBundleId : String
  sourceBundleMatches : sourceBundleId = B.id
  sourceBundleWitnessDigest : String
  sourceBundleWitnessDigestMatches : sourceBundleWitnessDigest = B.witnessDigest

/-- The freeze witness is bound to the same source bundle and digest as every
    evidence axis, rather than merely carrying an unused sourceBundleId. -/
structure SourceBoundFreezeWitness
    (F : ComparisonFreeze) (B : SourceBundleIdentity F) where
  witness : ComparisonFreezeWitness F
  sourceBundleId : String
  sourceBundleMatches : sourceBundleId = B.id
  sourceBundleWitnessDigest : String
  sourceBundleWitnessDigestMatches : sourceBundleWitnessDigest = B.witnessDigest

/-- Each model-specific prediction receipt is also tied to the same source
    bundle and digest, while retaining its H0/H1-specific model freeze. -/
structure SourceBoundPredictionReceipt
    (F : ComparisonFreeze) (B : SourceBundleIdentity F)
    (side : ModelSide) where
  receipt : ModelPredictionReceipt F side
  sourceBundleId : String
  sourceBundleMatches : sourceBundleId = B.id
  sourceBundleWitnessDigest : String
  sourceBundleWitnessDigestMatches : sourceBundleWitnessDigest = B.witnessDigest

/-- The canonical comparison-manifest identity. Its digest string is required
    to match the comparison freeze; byte-level digest validation is external. -/
structure ComparisonManifestIdentity
    (F : ComparisonFreeze) (B : SourceBundleIdentity F) where
  digest : String
  digestMatchesFreeze : digest = F.canonicalManifestDigest
  digestNonempty : digest ≠ ""
  sourceBundleId : String
  sourceBundleMatches : sourceBundleId = B.id
  sourceBundleWitnessDigest : String
  sourceBundleWitnessDigestMatches : sourceBundleWitnessDigest = B.witnessDigest
  members : List String

/-- The canonical manifest must declare both source and observation manifests
    as members. The IDs may coincide if a real manifest contract permits it;
    this structure does not impose an unjustified distinctness condition. -/
structure SourceObservationManifestMembership
    {F : ComparisonFreeze} {B : SourceBundleIdentity F}
    (M : ComparisonManifestIdentity F B) where
  sourceManifestId : String
  sourceManifestNonempty : sourceManifestId ≠ ""
  sourceManifestMember : sourceManifestId ∈ M.members
  observationManifestId : String
  observationManifestNonempty : observationManifestId ≠ ""
  observationManifestMember : observationManifestId ∈ M.members

/-- Additive source-bound form of the existing P2 evidence bundle. -/
structure SourceBoundP2Bundle (F : ComparisonFreeze) where
  identity : NonemptyFreezeIdentity F
  sourceBundle : SourceBundleIdentity F
  manifest : ComparisonManifestIdentity F sourceBundle
  manifestMembership : SourceObservationManifestMembership manifest
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

/-- An admitted source-bound bundle carries a nonempty opaque witness digest. -/
theorem source_bound_bundle_source_witness_digest_nonempty
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    b.sourceBundle.witnessDigest ≠ "" :=
  b.sourceBundle.witnessDigestNonempty

/-- All E/D/F/R and H0/H1 receipts carry the same opaque source-witness digest
    as the source-bundle identity and canonical comparison manifest. -/
theorem source_bound_bundle_uses_one_source_witness_digest
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    b.empirical.sourceBundleWitnessDigest = b.discrimination.sourceBundleWitnessDigest ∧
    b.empirical.sourceBundleWitnessDigest = b.freeze.sourceBundleWitnessDigest ∧
    b.empirical.sourceBundleWitnessDigest = b.review.sourceBundleWitnessDigest ∧
    b.empirical.sourceBundleWitnessDigest = b.h0.sourceBundleWitnessDigest ∧
    b.empirical.sourceBundleWitnessDigest = b.h1.sourceBundleWitnessDigest ∧
    b.empirical.sourceBundleWitnessDigest = b.manifest.sourceBundleWitnessDigest := by
  constructor
  · exact b.empirical.sourceBundleWitnessDigestMatches.trans
      b.discrimination.sourceBundleWitnessDigestMatches.symm
  constructor
  · exact b.empirical.sourceBundleWitnessDigestMatches.trans
      b.freeze.sourceBundleWitnessDigestMatches.symm
  constructor
  · exact b.empirical.sourceBundleWitnessDigestMatches.trans
      b.review.sourceBundleWitnessDigestMatches.symm
  constructor
  · exact b.empirical.sourceBundleWitnessDigestMatches.trans
      b.h0.sourceBundleWitnessDigestMatches.symm
  constructor
  · exact b.empirical.sourceBundleWitnessDigestMatches.trans
      b.h1.sourceBundleWitnessDigestMatches.symm
  · exact b.empirical.sourceBundleWitnessDigestMatches.trans
      b.manifest.sourceBundleWitnessDigestMatches.symm

/-- The canonical manifest digest is the one declared by the comparison
    freeze. This proves identity equality, not digest authenticity. -/
theorem source_bound_bundle_manifest_digest_matches_freeze
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    b.manifest.digest = F.canonicalManifestDigest :=
  b.manifest.digestMatchesFreeze

/-- Both the source manifest and observation manifest are declared members
    of the same canonical comparison manifest. -/
theorem source_bound_bundle_manifests_are_members
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    b.manifestMembership.sourceManifestId ∈ b.manifest.members ∧
    b.manifestMembership.observationManifestId ∈ b.manifest.members :=
  ⟨b.manifestMembership.sourceManifestMember,
   b.manifestMembership.observationManifestMember⟩

/-- Both manifest identifiers are nonempty. -/
theorem source_bound_bundle_manifest_ids_nonempty
    {F : ComparisonFreeze} (b : SourceBoundP2Bundle F) :
    b.manifestMembership.sourceManifestId ≠ "" ∧
    b.manifestMembership.observationManifestId ≠ "" :=
  ⟨b.manifestMembership.sourceManifestNonempty,
   b.manifestMembership.observationManifestNonempty⟩

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
#print axioms source_bound_bundle_source_witness_digest_nonempty
#print axioms source_bound_bundle_uses_one_source_witness_digest
#print axioms source_bound_bundle_manifest_digest_matches_freeze
#print axioms source_bound_bundle_manifests_are_members
#print axioms source_bound_bundle_manifest_ids_nonempty
#print axioms source_bound_bundle_has_nonempty_freeze_identity
#print axioms source_bound_bundle_satisfies_existing_p2_contract

end HsHVerification.LoomSourceBoundComparison
