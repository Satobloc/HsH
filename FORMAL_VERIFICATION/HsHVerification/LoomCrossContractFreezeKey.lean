import Mathlib
import HsHVerification.LoomSourceBoundComparison

/-!
# Cross-contract freeze identity

An additive identity adapter for the existing source-bound P2 comparison bundle.
It binds the source-commitment map, geometry-map stack, readout contract,
observable family, candidate family, prediction envelope, coupled readout,
resolution contract, acquisition-unit map, holdout-exposure ledger, and paired
geometry-plot witnesses to one exact comparison/source bundle.

It also separates **identity** from **dependency**: the key fixes artifact
identities, while a required dependency witness records the declared
source→geometry→readout, acquisition-unit→calibration/covariance/readout,
prediction→analysis/decision, and holdout→partition/candidate/envelope edges.
Those edges are identifiers, not physical projection functions.

All identifiers and digests are opaque strings. Lean does not hash, fetch, or
authenticate bytes; prove manifest contents; establish reviewer independence;
or validate physical premises. Those checks remain external readback and
measurement obligations. This module adds no top-level admission gate and no
physical model.
-/

namespace HsHVerification.LoomCrossContractFreezeKey

open HsHVerification.NadirComparisonFreezeCoherence
open HsHVerification.LoomSourceBoundComparison

/-- Opaque identity for one versioned artifact. Nonemptiness is formalized;
digest authenticity is external. -/
structure ArtifactIdentity where
  id : String
  opaqueDigest : String
  idNonempty : id ≠ ""
  digestNonempty : opaqueDigest ≠ ""

/-- One immutable tuple binding all cross-contract artifacts to an existing
    comparison freeze and source-bound P2 bundle. Changing either F or B changes
    the type of this key. -/
structure CrossContractFreezeKey (F : ComparisonFreeze)
    (B : SourceBoundP2Bundle F) where
  comparisonFreezeId : String
  comparisonFreezeIdMatches : comparisonFreezeId = F.id
  sourceBundleId : String
  sourceBundleIdMatches : sourceBundleId = B.sourceBundle.id
  sourceBundleWitnessDigest : String
  sourceBundleWitnessDigestMatches :
    sourceBundleWitnessDigest = B.sourceBundle.witnessDigest
  canonicalManifestDigest : String
  canonicalManifestDigestMatches :
    canonicalManifestDigest = B.manifest.digest

  sourceCommitmentMap : ArtifactIdentity
  geometryMapStack : ArtifactIdentity
  readoutContract : ArtifactIdentity
  observableFamily : ArtifactIdentity
  candidateFamily : ArtifactIdentity
  predictionEnvelope : ArtifactIdentity
  coupledReadout : ArtifactIdentity
  resolutionContract : ArtifactIdentity
  acquisitionUnitMap : ArtifactIdentity
  holdoutExposureLedger : ArtifactIdentity
  h0PlotWitness : ArtifactIdentity
  h1PlotWitness : ArtifactIdentity

  sourceMapBundleId : String
  sourceMapBundleMatches : sourceMapBundleId = B.sourceBundle.id
  candidateSourceMapDigest : String
  candidateSourceMapMatches :
    candidateSourceMapDigest = sourceCommitmentMap.opaqueDigest
  candidateGeometryMapDigest : String
  candidateGeometryMapMatches :
    candidateGeometryMapDigest = geometryMapStack.opaqueDigest

  readoutSourceBundleId : String
  readoutSourceBundleMatches : readoutSourceBundleId = B.sourceBundle.id
  readoutGeometryMapDigest : String
  readoutGeometryMapMatches :
    readoutGeometryMapDigest = geometryMapStack.opaqueDigest
  observableReadoutDigest : String
  observableReadoutMatches :
    observableReadoutDigest = readoutContract.opaqueDigest
  envelopeCandidateFamilyDigest : String
  envelopeCandidateFamilyMatches :
    envelopeCandidateFamilyDigest = candidateFamily.opaqueDigest
  coupledReadoutDigest : String
  coupledReadoutMatches :
    coupledReadoutDigest = readoutContract.opaqueDigest
  resolutionReadoutDigest : String
  resolutionReadoutMatches :
    resolutionReadoutDigest = readoutContract.opaqueDigest

  acquisitionObservationFreezeId : String
  acquisitionObservationFreezeMatches :
    acquisitionObservationFreezeId = F.observationFreezeId
  holdoutPartitionId : String
  holdoutPartitionMatches : holdoutPartitionId = F.holdoutPartitionId
  holdoutCandidateFamilyDigest : String
  holdoutCandidateFamilyMatches :
    holdoutCandidateFamilyDigest = candidateFamily.opaqueDigest
  holdoutPredictionEnvelopeDigest : String
  holdoutPredictionEnvelopeMatches :
    holdoutPredictionEnvelopeDigest = predictionEnvelope.opaqueDigest

  h0PlotModelFreezeId : String
  h0PlotModelFreezeMatches : h0PlotModelFreezeId = F.h0ModelFreezeId
  h1PlotModelFreezeId : String
  h1PlotModelFreezeMatches : h1PlotModelFreezeId = F.h1ModelFreezeId
  h0PlotSourceBundleId : String
  h0PlotSourceBundleMatches : h0PlotSourceBundleId = B.sourceBundle.id
  h1PlotSourceBundleId : String
  h1PlotSourceBundleMatches : h1PlotSourceBundleId = B.sourceBundle.id
  h0PlotGeometryMapDigest : String
  h0PlotGeometryMapMatches :
    h0PlotGeometryMapDigest = geometryMapStack.opaqueDigest
  h1PlotGeometryMapDigest : String
  h1PlotGeometryMapMatches :
    h1PlotGeometryMapDigest = geometryMapStack.opaqueDigest

  decisionRuleId : String
  decisionRuleMatches : decisionRuleId = F.decisionRuleId
  comparatorFreezeId : String
  comparatorFreezeMatches : comparatorFreezeId = F.comparatorFreezeId
  uncertaintyCovarianceId : String
  uncertaintyCovarianceMatches :
    uncertaintyCovarianceId = F.uncertaintyCovarianceId
  instrumentCalibrationId : String
  instrumentCalibrationMatches :
    instrumentCalibrationId = F.instrumentCalibrationId
  sharedParameterManifestId : String
  sharedParameterManifestMatches :
    sharedParameterManifestId = F.sharedParameterManifestId
  analysisPlanFreezeId : String
  analysisPlanFreezeMatches :
    analysisPlanFreezeId = F.analysisPlanFreezeId
  observableOperatorId : String
  observableOperatorMatches : observableOperatorId = F.observableOperatorId

/-- A concrete artifact reference can inhabit a bundle only when its declared
    identity equals the identity selected by the common freeze key. -/
structure BoundArtifact (expected : ArtifactIdentity) where
  actual : ArtifactIdentity
  identity_eq : actual = expected

/-- Explicit cross-contract dependency edges. The freeze key binds artifact
    identities; this witness separately records which source, acquisition,
    readout, uncertainty, analysis, and holdout contracts each artifact
    declares as its dependency. These are opaque identity links, not the
    physical geometry/readout functions themselves. -/
structure CrossContractDependencyWitness
    (F : ComparisonFreeze) (B : SourceBoundP2Bundle F)
    (K : CrossContractFreezeKey F B) where
  geometryMapSourceCommitmentDigest : String
  geometryMapSourceCommitmentMatches :
    geometryMapSourceCommitmentDigest = K.sourceCommitmentMap.opaqueDigest
  readoutGeometryMapDigest : String
  readoutGeometryMapMatches :
    readoutGeometryMapDigest = K.geometryMapStack.opaqueDigest
  observableFamilyReadoutDigest : String
  observableFamilyReadoutMatches :
    observableFamilyReadoutDigest = K.readoutContract.opaqueDigest
  readoutObservableOperatorId : String
  readoutObservableOperatorMatches :
    readoutObservableOperatorId = F.observableOperatorId
  acquisitionUnitMapSourceBundleId : String
  acquisitionUnitMapSourceBundleMatches :
    acquisitionUnitMapSourceBundleId = B.sourceBundle.id
  acquisitionUnitMapObservationFreezeId : String
  acquisitionUnitMapObservationFreezeMatches :
    acquisitionUnitMapObservationFreezeId = F.observationFreezeId
  acquisitionUnitMapCalibrationId : String
  acquisitionUnitMapCalibrationMatches :
    acquisitionUnitMapCalibrationId = F.instrumentCalibrationId
  acquisitionUnitMapCovarianceId : String
  acquisitionUnitMapCovarianceMatches :
    acquisitionUnitMapCovarianceId = F.uncertaintyCovarianceId
  readoutAcquisitionUnitMapDigest : String
  readoutAcquisitionUnitMapMatches :
    readoutAcquisitionUnitMapDigest = K.acquisitionUnitMap.opaqueDigest
  holdoutLedgerPartitionId : String
  holdoutLedgerPartitionMatches :
    holdoutLedgerPartitionId = F.holdoutPartitionId
  holdoutLedgerCandidateFamilyDigest : String
  holdoutLedgerCandidateFamilyMatches :
    holdoutLedgerCandidateFamilyDigest = K.candidateFamily.opaqueDigest
  holdoutLedgerPredictionEnvelopeDigest : String
  holdoutLedgerPredictionEnvelopeMatches :
    holdoutLedgerPredictionEnvelopeDigest = K.predictionEnvelope.opaqueDigest
  resolutionCovarianceId : String
  resolutionCovarianceMatches :
    resolutionCovarianceId = F.uncertaintyCovarianceId
  resolutionCalibrationId : String
  resolutionCalibrationMatches :
    resolutionCalibrationId = F.instrumentCalibrationId
  predictionEnvelopeAnalysisPlanId : String
  predictionEnvelopeAnalysisPlanMatches :
    predictionEnvelopeAnalysisPlanId = F.analysisPlanFreezeId
  predictionEnvelopeDecisionRuleId : String
  predictionEnvelopeDecisionRuleMatches :
    predictionEnvelopeDecisionRuleId = F.decisionRuleId

/-- The optional cross-contract extension. Every artifact is indexed by the
    same K, so a witness from another key cannot be inserted without an
    explicit equality/rebinding proof. -/
structure P2CrossContractEvidenceBundle
    (F : ComparisonFreeze) (B : SourceBoundP2Bundle F)
    (K : CrossContractFreezeKey F B) where
  dependencyWitness : CrossContractDependencyWitness F B K
  sourceCommitmentMap : BoundArtifact K.sourceCommitmentMap
  geometryMapStack : BoundArtifact K.geometryMapStack
  readoutContract : BoundArtifact K.readoutContract
  observableFamily : BoundArtifact K.observableFamily
  candidateFamily : BoundArtifact K.candidateFamily
  predictionEnvelope : BoundArtifact K.predictionEnvelope
  coupledReadout : BoundArtifact K.coupledReadout
  resolutionContract : BoundArtifact K.resolutionContract
  acquisitionUnitMap : BoundArtifact K.acquisitionUnitMap
  holdoutExposureLedger : BoundArtifact K.holdoutExposureLedger
  h0PlotWitness : BoundArtifact K.h0PlotWitness
  h1PlotWitness : BoundArtifact K.h1PlotWitness

/-- The declared dependency edges all terminate at the same source bundle,
    comparison freeze, readout, candidate family, and prediction envelope. -/
theorem key_relations_hold
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    (K : CrossContractFreezeKey F B) :
    K.sourceMapBundleId = B.sourceBundle.id ∧
    K.sourceBundleWitnessDigest = B.sourceBundle.witnessDigest ∧
    K.canonicalManifestDigest = B.manifest.digest ∧
    K.candidateSourceMapDigest = K.sourceCommitmentMap.opaqueDigest ∧
    K.candidateGeometryMapDigest = K.geometryMapStack.opaqueDigest ∧
    K.readoutSourceBundleId = B.sourceBundle.id ∧
    K.readoutGeometryMapDigest = K.geometryMapStack.opaqueDigest ∧
    K.observableReadoutDigest = K.readoutContract.opaqueDigest ∧
    K.envelopeCandidateFamilyDigest = K.candidateFamily.opaqueDigest ∧
    K.coupledReadoutDigest = K.readoutContract.opaqueDigest ∧
    K.resolutionReadoutDigest = K.readoutContract.opaqueDigest ∧
    K.acquisitionObservationFreezeId = F.observationFreezeId ∧
    K.holdoutPartitionId = F.holdoutPartitionId ∧
    K.holdoutCandidateFamilyDigest = K.candidateFamily.opaqueDigest ∧
    K.holdoutPredictionEnvelopeDigest = K.predictionEnvelope.opaqueDigest ∧
    K.h0PlotModelFreezeId = F.h0ModelFreezeId ∧
    K.h1PlotModelFreezeId = F.h1ModelFreezeId ∧
    K.h0PlotSourceBundleId = B.sourceBundle.id ∧
    K.h1PlotSourceBundleId = B.sourceBundle.id ∧
    K.h0PlotGeometryMapDigest = K.geometryMapStack.opaqueDigest ∧
    K.h1PlotGeometryMapDigest = K.geometryMapStack.opaqueDigest ∧
    K.decisionRuleId = F.decisionRuleId ∧
    K.comparatorFreezeId = F.comparatorFreezeId ∧
    K.uncertaintyCovarianceId = F.uncertaintyCovarianceId ∧
    K.instrumentCalibrationId = F.instrumentCalibrationId ∧
    K.sharedParameterManifestId = F.sharedParameterManifestId ∧
    K.analysisPlanFreezeId = F.analysisPlanFreezeId ∧
    K.observableOperatorId = F.observableOperatorId := by
  exact
    ⟨K.sourceMapBundleMatches,
     K.sourceBundleWitnessDigestMatches,
     K.canonicalManifestDigestMatches,
     K.candidateSourceMapMatches,
     K.candidateGeometryMapMatches,
     K.readoutSourceBundleMatches,
     K.readoutGeometryMapMatches,
     K.observableReadoutMatches,
     K.envelopeCandidateFamilyMatches,
     K.coupledReadoutMatches,
     K.resolutionReadoutMatches,
     K.acquisitionObservationFreezeMatches,
     K.holdoutPartitionMatches,
     K.holdoutCandidateFamilyMatches,
     K.holdoutPredictionEnvelopeMatches,
     K.h0PlotModelFreezeMatches,
     K.h1PlotModelFreezeMatches,
     K.h0PlotSourceBundleMatches,
     K.h1PlotSourceBundleMatches,
     K.h0PlotGeometryMapMatches,
     K.h1PlotGeometryMapMatches,
     K.decisionRuleMatches,
     K.comparatorFreezeMatches,
     K.uncertaintyCovarianceMatches,
     K.instrumentCalibrationMatches,
     K.sharedParameterManifestMatches,
     K.analysisPlanFreezeMatches,
     K.observableOperatorMatches⟩

/-- Every concrete artifact reference in the bundle matches the one K. -/
theorem bundle_artifacts_match_key
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    (bundle : P2CrossContractEvidenceBundle F B K) :
    bundle.sourceCommitmentMap.actual = K.sourceCommitmentMap ∧
    bundle.geometryMapStack.actual = K.geometryMapStack ∧
    bundle.readoutContract.actual = K.readoutContract ∧
    bundle.observableFamily.actual = K.observableFamily ∧
    bundle.candidateFamily.actual = K.candidateFamily ∧
    bundle.predictionEnvelope.actual = K.predictionEnvelope ∧
    bundle.coupledReadout.actual = K.coupledReadout ∧
    bundle.resolutionContract.actual = K.resolutionContract ∧
    bundle.acquisitionUnitMap.actual = K.acquisitionUnitMap ∧
    bundle.holdoutExposureLedger.actual = K.holdoutExposureLedger ∧
    bundle.h0PlotWitness.actual = K.h0PlotWitness ∧
    bundle.h1PlotWitness.actual = K.h1PlotWitness := by
  exact
    ⟨bundle.sourceCommitmentMap.identity_eq,
     bundle.geometryMapStack.identity_eq,
     bundle.readoutContract.identity_eq,
     bundle.observableFamily.identity_eq,
     bundle.candidateFamily.identity_eq,
     bundle.predictionEnvelope.identity_eq,
     bundle.coupledReadout.identity_eq,
     bundle.resolutionContract.identity_eq,
     bundle.acquisitionUnitMap.identity_eq,
     bundle.holdoutExposureLedger.identity_eq,
     bundle.h0PlotWitness.identity_eq,
     bundle.h1PlotWitness.identity_eq⟩

/-- Every declared cross-contract dependency edge agrees with the same
    source bundle, observation freeze, calibration, covariance, readout,
    analysis plan, decision rule, and holdout partition. -/
theorem dependency_witness_edges_hold
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    (D : CrossContractDependencyWitness F B K) :
    D.geometryMapSourceCommitmentDigest = K.sourceCommitmentMap.opaqueDigest ∧
    D.readoutGeometryMapDigest = K.geometryMapStack.opaqueDigest ∧
    D.observableFamilyReadoutDigest = K.readoutContract.opaqueDigest ∧
    D.readoutObservableOperatorId = F.observableOperatorId ∧
    D.acquisitionUnitMapSourceBundleId = B.sourceBundle.id ∧
    D.acquisitionUnitMapObservationFreezeId = F.observationFreezeId ∧
    D.acquisitionUnitMapCalibrationId = F.instrumentCalibrationId ∧
    D.acquisitionUnitMapCovarianceId = F.uncertaintyCovarianceId ∧
    D.readoutAcquisitionUnitMapDigest = K.acquisitionUnitMap.opaqueDigest ∧
    D.holdoutLedgerPartitionId = F.holdoutPartitionId ∧
    D.holdoutLedgerCandidateFamilyDigest = K.candidateFamily.opaqueDigest ∧
    D.holdoutLedgerPredictionEnvelopeDigest = K.predictionEnvelope.opaqueDigest ∧
    D.resolutionCovarianceId = F.uncertaintyCovarianceId ∧
    D.resolutionCalibrationId = F.instrumentCalibrationId ∧
    D.predictionEnvelopeAnalysisPlanId = F.analysisPlanFreezeId ∧
    D.predictionEnvelopeDecisionRuleId = F.decisionRuleId := by
  exact
    ⟨D.geometryMapSourceCommitmentMatches,
     D.readoutGeometryMapMatches,
     D.observableFamilyReadoutMatches,
     D.readoutObservableOperatorMatches,
     D.acquisitionUnitMapSourceBundleMatches,
     D.acquisitionUnitMapObservationFreezeMatches,
     D.acquisitionUnitMapCalibrationMatches,
     D.acquisitionUnitMapCovarianceMatches,
     D.readoutAcquisitionUnitMapMatches,
     D.holdoutLedgerPartitionMatches,
     D.holdoutLedgerCandidateFamilyMatches,
     D.holdoutLedgerPredictionEnvelopeMatches,
     D.resolutionCovarianceMatches,
     D.resolutionCalibrationMatches,
     D.predictionEnvelopeAnalysisPlanMatches,
     D.predictionEnvelopeDecisionRuleMatches⟩

/-- A complete cross-contract bundle necessarily carries the dependency
    witness; artifact identity alone is not treated as a composition proof. -/
theorem bundle_has_complete_dependency_witness
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    (bundle : P2CrossContractEvidenceBundle F B K) :
    bundle.dependencyWitness.geometryMapSourceCommitmentDigest =
        K.sourceCommitmentMap.opaqueDigest ∧
    bundle.dependencyWitness.readoutGeometryMapDigest =
        K.geometryMapStack.opaqueDigest ∧
    bundle.dependencyWitness.observableFamilyReadoutDigest =
        K.readoutContract.opaqueDigest ∧
    bundle.dependencyWitness.readoutObservableOperatorId =
        F.observableOperatorId ∧
    bundle.dependencyWitness.acquisitionUnitMapSourceBundleId =
        B.sourceBundle.id ∧
    bundle.dependencyWitness.acquisitionUnitMapObservationFreezeId =
        F.observationFreezeId ∧
    bundle.dependencyWitness.acquisitionUnitMapCalibrationId =
        F.instrumentCalibrationId ∧
    bundle.dependencyWitness.acquisitionUnitMapCovarianceId =
        F.uncertaintyCovarianceId ∧
    bundle.dependencyWitness.readoutAcquisitionUnitMapDigest =
        K.acquisitionUnitMap.opaqueDigest ∧
    bundle.dependencyWitness.holdoutLedgerPartitionId =
        F.holdoutPartitionId ∧
    bundle.dependencyWitness.holdoutLedgerCandidateFamilyDigest =
        K.candidateFamily.opaqueDigest ∧
    bundle.dependencyWitness.holdoutLedgerPredictionEnvelopeDigest =
        K.predictionEnvelope.opaqueDigest ∧
    bundle.dependencyWitness.resolutionCovarianceId =
        F.uncertaintyCovarianceId ∧
    bundle.dependencyWitness.resolutionCalibrationId =
        F.instrumentCalibrationId ∧
    bundle.dependencyWitness.predictionEnvelopeAnalysisPlanId =
        F.analysisPlanFreezeId ∧
    bundle.dependencyWitness.predictionEnvelopeDecisionRuleId =
        F.decisionRuleId := by
  exact dependency_witness_edges_hold bundle.dependencyWitness

/-- Changing the candidate-family identity requires a new freeze key. -/
theorem changed_candidate_family_requires_new_key
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    (K₁ K₂ : CrossContractFreezeKey F B)
    (h : K₁.candidateFamily ≠ K₂.candidateFamily) : K₁ ≠ K₂ := by
  intro hEq
  exact h (congrArg (fun k => k.candidateFamily) hEq)

/-- Changing the prediction envelope requires a new freeze key. -/
theorem changed_prediction_envelope_requires_new_key
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    (K₁ K₂ : CrossContractFreezeKey F B)
    (h : K₁.predictionEnvelope ≠ K₂.predictionEnvelope) : K₁ ≠ K₂ := by
  intro hEq
  exact h (congrArg (fun k => k.predictionEnvelope) hEq)

/-- Changing the holdout-exposure ledger requires a new freeze key. -/
theorem changed_holdout_exposure_requires_new_key
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    (K₁ K₂ : CrossContractFreezeKey F B)
    (h : K₁.holdoutExposureLedger ≠ K₂.holdoutExposureLedger) : K₁ ≠ K₂ := by
  intro hEq
  exact h (congrArg (fun k => k.holdoutExposureLedger) hEq)

/-- Changing either geometry-plot witness requires a new freeze key. -/
theorem changed_h0_plot_witness_requires_new_key
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    (K₁ K₂ : CrossContractFreezeKey F B)
    (h : K₁.h0PlotWitness ≠ K₂.h0PlotWitness) : K₁ ≠ K₂ := by
  intro hEq
  exact h (congrArg (fun k => k.h0PlotWitness) hEq)

/-- The extension retains the existing source-bound P2 readiness contract.
    It adds identity joins; it does not replace or weaken the prior bundle. -/
theorem cross_contract_bundle_retains_existing_p2_contract
    {F : ComparisonFreeze} {B : SourceBoundP2Bundle F}
    {K : CrossContractFreezeKey F B}
    (_bundle : P2CrossContractEvidenceBundle F B K) :
    p2Ready F :=
  source_bound_bundle_satisfies_existing_p2_contract B

#print axioms key_relations_hold
#print axioms bundle_artifacts_match_key
#print axioms dependency_witness_edges_hold
#print axioms bundle_has_complete_dependency_witness
#print axioms changed_candidate_family_requires_new_key
#print axioms changed_prediction_envelope_requires_new_key
#print axioms changed_holdout_exposure_requires_new_key
#print axioms changed_h0_plot_witness_requires_new_key
#print axioms cross_contract_bundle_retains_existing_p2_contract

end HsHVerification.LoomCrossContractFreezeKey
