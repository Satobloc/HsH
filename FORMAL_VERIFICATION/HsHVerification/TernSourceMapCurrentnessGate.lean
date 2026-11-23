import Mathlib
import HsHVerification.LoomCrossContractFreezeKey

/-!
# Source-map currentness admission gate

This is an additive, opt-in provenance gate for a precommitted P2 comparison.
The existing cross-contract key binds a source-map artifact identity and digest,
and its correction-propagation theorem requires a new key after that digest
changes. It does not establish that the source map has been reconciled against
the latest correction ledger before a freeze is admitted.

This module adds a typed correction-audit witness. It requires:
* the audited source-map identity to equal the source map in the existing key;
* the correction-ledger identity to equal an externally supplied latest ledger;
* the audit artifact to bind both exact opaque digests;
* one unique disposition for every event in the pinned ledger;
* no unresolved correction events; and
* mixed-origin source material to be scoped at segment granularity.

Lean proves only these record-level implications. It does not fetch or hash
artifacts, prove that the supplied ledger is complete, authenticate source
locators, establish that an applied correction is actually present in the
source-map bytes, or determine whether an origin classification is historically
correct. Those remain source-critical readback and review obligations.
-/

namespace HsHVerification.TernSourceMapCurrentnessGate

open HsHVerification.NadirComparisonFreezeCoherence
open HsHVerification.LoomSourceBoundComparison
open HsHVerification.LoomCrossContractFreezeKey

/-- A correction receives an explicit, reviewable disposition. Supersession
    should be represented by a separate correction event in the same ledger,
    so both the superseded and superseding events receive dispositions. -/
inductive CorrectionDisposition
  | applied
  | notApplicable
  | unresolved
deriving DecidableEq, Repr

/-- Granularity at which a source correction is asserted to apply. -/
inductive CorrectionScopeKind
  | conversation
  | message
  | segment
  | claim
  | artifact
deriving DecidableEq, Repr

/-- Source-origin class carried by one correction disposition. -/
inductive SourceOriginClass
  | firstOrigin
  | crossPost
  | mixed
  | assistantReconstruction
  | unknown
deriving DecidableEq, Repr

/-- One correction event, with a source artifact, exact scope, origin class,
    disposition, and nonempty rationale. A mixed-origin item must be represented
    at segment granularity rather than assigning one origin to the whole message. -/
structure CorrectionDispositionRecord where
  eventId : String
  sourceArtifact : ArtifactIdentity
  scopeKind : CorrectionScopeKind
  sourceScope : String
  originClass : SourceOriginClass
  disposition : CorrectionDisposition
  rationale : String
  eventIdNonempty : eventId ≠ ""
  sourceScopeNonempty : sourceScope ≠ ""
  rationaleNonempty : rationale ≠ ""
  mixedRequiresSegmentScope :
    originClass = SourceOriginClass.mixed →
      scopeKind = CorrectionScopeKind.segment

/-- Event IDs represented by the disposition records. -/
def dispositionEventIds
    (records : List CorrectionDispositionRecord) : Finset String :=
  records.foldl (fun ids record => Finset.insert record.eventId ids) ∅

/-- Event IDs whose current disposition is unresolved. -/
def unresolvedCorrectionEventIds
    (records : List CorrectionDispositionRecord) : Finset String :=
  records.foldl
    (fun ids record =>
      match record.disposition with
      | CorrectionDisposition.unresolved => Finset.insert record.eventId ids
      | _ => ids)
    ∅

/-- A currentness key binds one source map, one exact correction-ledger
    snapshot, and one audit artifact to the existing cross-contract freeze key.
    The latestCorrectionLedger argument is supplied by an external current-state
    read; Lean cannot discover which ledger is latest. -/
structure SourceMapCurrentnessKey
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    (K : CrossContractFreezeKey F B)
    (latestCorrectionLedger : ArtifactIdentity) where
  auditArtifact : ArtifactIdentity
  sourceMap : ArtifactIdentity
  correctionLedger : ArtifactIdentity
  sourceMapMatchesFreeze : sourceMap = K.sourceCommitmentMap
  correctionLedgerMatchesLatest : correctionLedger = latestCorrectionLedger
  auditSourceMapDigest : String
  auditSourceMapDigestMatches :
    auditSourceMapDigest = sourceMap.opaqueDigest
  auditCorrectionLedgerDigest : String
  auditCorrectionLedgerDigestMatches :
    auditCorrectionLedgerDigest = correctionLedger.opaqueDigest

/-- The audit artifact must account for every event in its pinned correction
    ledger exactly once and leave no unresolved event. Its digest is bound to the
    same source-map and correction-ledger identities selected by the key. -/
structure SourceMapCorrectionAudit
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {latestCorrectionLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K latestCorrectionLedger) where
  auditArtifactDigest : String
  auditArtifactDigestMatches :
    auditArtifactDigest = key.auditArtifact.opaqueDigest
  sourceMapDigest : String
  sourceMapDigestMatches :
    sourceMapDigest = key.auditSourceMapDigest
  correctionLedgerDigest : String
  correctionLedgerDigestMatches :
    correctionLedgerDigest = key.auditCorrectionLedgerDigest
  ledgerEventIds : Finset String
  dispositionRecords : List CorrectionDispositionRecord
  dispositionRecordIdsNoDuplicates :
    (dispositionRecords.map (fun record => record.eventId)).Nodup
  dispositionEventIdsComplete :
    dispositionEventIds dispositionRecords = ledgerEventIds
  unresolvedEventIdsEmpty :
    unresolvedCorrectionEventIds dispositionRecords = ∅

/-- Stricter opt-in evidence bundle. It retains the complete existing P2
    cross-contract bundle and adds the current source-map correction audit
    without changing the parent API. -/
structure CurrentSourceMapP2EvidenceBundle
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {latestCorrectionLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K latestCorrectionLedger) where
  base : P2CrossContractEvidenceBundle F B K
  audit : SourceMapCorrectionAudit key

/-- Adding the currentness gate does not discard any existing cross-contract
    evidence. -/
def sourceMapCurrentnessAdmission_preservesCrossContractEvidence
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {latestCorrectionLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K latestCorrectionLedger)
    (bundle : CurrentSourceMapP2EvidenceBundle key) :
    P2CrossContractEvidenceBundle F B K :=
  bundle.base

/-- An admitted currentness audit is bound to the source map already selected
    by the cross-contract freeze key. -/
theorem sourceMapCurrentnessAdmission_hasCurrentSourceMap
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {latestCorrectionLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K latestCorrectionLedger) :
    key.sourceMap = K.sourceCommitmentMap :=
  key.sourceMapMatchesFreeze

/-- The correction ledger used by an admitted audit is the externally supplied
    latest ledger identity for this freeze. -/
theorem sourceMapCurrentnessAdmission_hasLatestCorrectionLedger
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {latestCorrectionLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K latestCorrectionLedger) :
    key.correctionLedger = latestCorrectionLedger :=
  key.correctionLedgerMatchesLatest

/-- The audit artifact itself is bound to the exact digest selected by the key. -/
theorem sourceMapCurrentnessAdmission_bindsAuditArtifact
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {latestCorrectionLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K latestCorrectionLedger)
    (bundle : CurrentSourceMapP2EvidenceBundle key) :
    bundle.audit.auditArtifactDigest = key.auditArtifact.opaqueDigest :=
  bundle.audit.auditArtifactDigestMatches

/-- The audit's source-map digest is the digest of the map selected by the
    cross-contract key. -/
theorem sourceMapCurrentnessAdmission_bindsSourceMapDigest
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {latestCorrectionLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K latestCorrectionLedger)
    (bundle : CurrentSourceMapP2EvidenceBundle key) :
    bundle.audit.sourceMapDigest = K.sourceCommitmentMap.opaqueDigest := by
  calc
    bundle.audit.sourceMapDigest = key.auditSourceMapDigest :=
      bundle.audit.sourceMapDigestMatches
    _ = key.sourceMap.opaqueDigest :=
      key.auditSourceMapDigestMatches
    _ = K.sourceCommitmentMap.opaqueDigest :=
      congrArg (fun artifact => artifact.opaqueDigest)
        key.sourceMapMatchesFreeze

/-- The audit's correction-ledger digest is the digest of the exact latest
    ledger identity supplied to the key. -/
theorem sourceMapCurrentnessAdmission_bindsLatestCorrectionLedgerDigest
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {latestCorrectionLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K latestCorrectionLedger)
    (bundle : CurrentSourceMapP2EvidenceBundle key) :
    bundle.audit.correctionLedgerDigest =
      latestCorrectionLedger.opaqueDigest := by
  calc
    bundle.audit.correctionLedgerDigest = key.auditCorrectionLedgerDigest :=
      bundle.audit.correctionLedgerDigestMatches
    _ = key.correctionLedger.opaqueDigest :=
      key.auditCorrectionLedgerDigestMatches
    _ = latestCorrectionLedger.opaqueDigest :=
      congrArg (fun artifact => artifact.opaqueDigest)
        key.correctionLedgerMatchesLatest

/-- Every correction event in the pinned ledger has exactly one disposition
    record in an admitted currentness audit. -/
theorem sourceMapCurrentnessAdmission_hasCompleteCorrectionCoverage
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {latestCorrectionLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K latestCorrectionLedger)
    (bundle : CurrentSourceMapP2EvidenceBundle key) :
    dispositionEventIds bundle.audit.dispositionRecords =
      bundle.audit.ledgerEventIds :=
  bundle.audit.dispositionEventIdsComplete

/-- No correction event remains unresolved in an admitted currentness audit. -/
theorem sourceMapCurrentnessAdmission_hasNoUnresolvedCorrections
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {latestCorrectionLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K latestCorrectionLedger)
    (bundle : CurrentSourceMapP2EvidenceBundle key) :
    unresolvedCorrectionEventIds bundle.audit.dispositionRecords = ∅ :=
  bundle.audit.unresolvedEventIdsEmpty

/-- A mixed-origin correction must carry segment-level scope. This prevents a
    copied header and a direct continuation from being collapsed into one
    message-level origin label in the formalized record. -/
theorem sourceMapCurrentnessAdmission_mixedCorrectionUsesSegmentScope
    (record : CorrectionDispositionRecord)
    (hMixed : record.originClass = SourceOriginClass.mixed) :
    record.scopeKind = CorrectionScopeKind.segment :=
  record.mixedRequiresSegmentScope hMixed

/-- A changed correction-ledger identity cannot be substituted into an old
    currentness key. A new ledger therefore requires a new key and audit. -/
theorem changedCorrectionLedger_invalidatesOldCurrentnessKey
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    {oldLedger newLedger : ArtifactIdentity}
    (key : SourceMapCurrentnessKey K oldLedger)
    (hChanged : newLedger ≠ oldLedger) :
    key.correctionLedger ≠ newLedger := by
  intro hEqual
  exact hChanged
    ((key.correctionLedgerMatchesLatest.symm.trans hEqual).symm)

#print axioms sourceMapCurrentnessAdmission_preservesCrossContractEvidence
#print axioms sourceMapCurrentnessAdmission_hasCurrentSourceMap
#print axioms sourceMapCurrentnessAdmission_hasLatestCorrectionLedger
#print axioms sourceMapCurrentnessAdmission_bindsAuditArtifact
#print axioms sourceMapCurrentnessAdmission_bindsSourceMapDigest
#print axioms sourceMapCurrentnessAdmission_bindsLatestCorrectionLedgerDigest
#print axioms sourceMapCurrentnessAdmission_hasCompleteCorrectionCoverage
#print axioms sourceMapCurrentnessAdmission_hasNoUnresolvedCorrections
#print axioms sourceMapCurrentnessAdmission_mixedCorrectionUsesSegmentScope
#print axioms changedCorrectionLedger_invalidatesOldCurrentnessKey

end HsHVerification.TernSourceMapCurrentnessGate
