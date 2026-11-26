import Mathlib
import HsHVerification.HeterogeneousReadoutFiberSeparation

/-!
# Precommitted holdout admission for heterogeneous model comparisons

This is a typed adapter from the Pairwise Discrimination Record (PDR) fields
to the heterogeneous common-readout comparison. It also keeps Nathan Direct,
assistant reconstruction, historical source, standard reference, proposal
and independent measurement as distinct declared authority classes. It binds a candidate family,
its shared/nuisance/candidate-specific parameter manifests, a calibration /
holdout partition, a frozen prediction and falsification rule, an exposure
ledger, and an evaluation result to the same source packet and common carrier.

The temporal fields are ordered ticks in one declared time base. Lean checks
the supplied order relations; it does not authenticate clocks, hashes, source
artifacts, event-log completeness, data independence, or the truth of the
recorded outcome.

The partition also carries a source-addressed observation-to-independent-unit
map, and the declared calibration/holdout unit sets must be exactly the images
of their listed observation IDs under that same map. This is mapping
traceability, not proof of source-map authenticity, data completeness, or
statistical independence. The ordinary one-shot wrapper requires zero pre-evaluation
queries and feedback. Named adaptive-holdout mechanisms need a separate,
mechanism-specific contract and are not admitted by this wrapper.

This is an opt-in stricter surface. It does not rewrite legacy candidate gates
or instantiate a physical system, dataset, numerical prediction, fit, or
falsification threshold.
-/

namespace HsHVerification.PrecommittedHoldoutAdmission

open HsHVerification.EvidenceGatedAdmission
open HsHVerification.HeterogeneousReadoutFiberSeparation
open HsHVerification.MeasurementDomainCompatibility
open HsHVerification.SharedReadoutFiberSeparation
open HsHVerification.ModelSelectionPreference

universe uH uS uHF uSF uCF uP

variable {HState : Type uH} {SState : Type uS}
variable {HField : Type uHF} {SField : Type uSF}
variable {CommonField : Type uCF}
variable {Payload : MeasurementMode → Type uP}

/-- A recorded outcome. Only pass can enter the positive admission wrapper;
    fail and inconclusive records remain representable outside it. -/
inductive HoldoutOutcome
  | pass
  | fail
  | inconclusive
  deriving DecidableEq, Repr

/-- Declared authority class for every source-bearing claim. This is a
    classification field, not authentication of the source or author. -/
inductive EvidenceAuthority
  | nathanDirect
  | assistantReconstruction
  | historicalSource
  | standardReference
  | proposal
  | independentMeasurement
  deriving DecidableEq, Repr

/-- A source claim with an explicit authority class, exact artifact locator,
    digest, source date and bounded claim scope. -/
structure SourceEvidenceRecord where
  authority : EvidenceAuthority
  artifact : SourceArtifactRef
  digest : NonEmptyText
  sourceDate : NonEmptyText
  claimScope : NonEmptyText

/-- The intended prediction-domain target of the holdout. Blocking can test
    interpolation, extrapolation, or a declared mixture; the label does not
    determine which regime the observed split actually realizes. -/
inductive PredictorDomainGoal
  | interpolation
  | extrapolation
  | mixed
  deriving DecidableEq, Repr

/-- A source-addressed calibration/holdout partition at an explicit unit
    grain (for example, frame, acquisition, run, event, or subject). The
    unit IDs and locators are formalized declarations; source review must
    verify that they enumerate the actual dataset units. Disjointness at the
    declared grain is not, by itself, statistical independence. -/
structure CalibrationHoldoutPartition where
  sourceSystemId : NonEmptyText
  datasetId : NonEmptyText
  datasetArtifact : SourceArtifactRef
  calibrationSetId : NonEmptyText
  holdoutSetId : NonEmptyText
  calibrationSetArtifact : SourceArtifactRef
  holdoutSetArtifact : SourceArtifactRef
  independenceUnitKind : NonEmptyText
  independenceUnitDefinition : SourceArtifactRef
  calibrationUnitIds : Finset String
  holdoutUnitIds : Finset String
  calibrationUnitsNonempty : calibrationUnitIds.Nonempty
  holdoutUnitsNonempty : holdoutUnitIds.Nonempty
  /-- Exact source artifact and evidence for the observation-to-unit map.
      Source review must verify that this artifact implements the declared
      function below for this dataset and unit definition. -/
  observationUnitMapArtifact : SourceArtifactRef
  observationUnitMapEvidence : SourceEvidenceRecord
  observationUnitMapEvidenceMatchesArtifact :
    observationUnitMapEvidence.artifact = observationUnitMapArtifact
  /-- Stable raw observation IDs on each side of the split. -/
  calibrationObservationIds : Finset String
  holdoutObservationIds : Finset String
  /-- One total declared map assigns every listed observation to its
      independence unit. Exact-image equalities prevent orphan declared
      units and observations mapped outside the declared partition. -/
  observationToUnit : String → String
  calibrationObservationIdsNonempty : calibrationObservationIds.Nonempty
  holdoutObservationIdsNonempty : holdoutObservationIds.Nonempty
  calibrationUnitIdsExactlyMapped :
    calibrationUnitIds = calibrationObservationIds.image observationToUnit
  holdoutUnitIdsExactlyMapped :
    holdoutUnitIds = holdoutObservationIds.image observationToUnit
  unitSetsDisjoint : Disjoint calibrationUnitIds holdoutUnitIds
  predictionTarget : NonEmptyText
  predictorDomainGoal : PredictorDomainGoal
  predictorDomainAssessment : SourceArtifactRef

/-- One candidate's source and candidate-specific parameter record inside a
    frozen candidate-family manifest. -/
structure CandidateFamilyEntry where
  candidateId : NonEmptyText
  candidateSource : SourceArtifactRef
  hshModelSource : SourceArtifactRef
  hshProjectionSource : SourceArtifactRef
  candidateParameterManifest : SourceArtifactRef
  sourceEvidence : SourceEvidenceRecord
  sourceEvidenceMatchesCandidate : sourceEvidence.artifact = candidateSource

/-- A source-addressed candidate-family manifest. Shared and nuisance
    parameter manifests are family-level; candidate-specific parameters are
    carried by each entry. The standard comparator, common carrier, predicted
    observable and falsification/threshold artifacts are explicit. -/
structure FrozenCandidateFamilyManifest where
  familyId : NonEmptyText
  familyVersion : NonEmptyText
  familyDigest : NonEmptyText
  manifest : SourceArtifactRef
  sourceCommitmentMap : SourceArtifactRef
  geometryMapStack : SourceArtifactRef
  candidates : List CandidateFamilyEntry
  sharedParameterManifest : SourceArtifactRef
  nuisanceParameterManifest : SourceArtifactRef
  standardComparatorId : NonEmptyText
  standardModelSource : SourceArtifactRef
  standardProjectionSource : SourceArtifactRef
  commonCarrierId : NonEmptyText
  commonCarrierArtifact : SourceArtifactRef
  predictedObservable : SourceArtifactRef
  falsificationRule : SourceArtifactRef
  thresholdSpec : SourceArtifactRef
  evidenceLineage : List SourceEvidenceRecord
  standardComparatorEvidence : SourceEvidenceRecord
  standardComparatorAuthority :
    standardComparatorEvidence.authority = EvidenceAuthority.standardReference
  standardComparatorEvidenceMatches :
    standardComparatorEvidence.artifact = standardModelSource
  predictionEvidence : SourceEvidenceRecord
  predictionEvidenceMatches :
    predictionEvidence.artifact = predictedObservable
  timeBaseId : NonEmptyText
  frozenAt : Nat

/-- A one-shot precommitted evaluation record. All time fields are ordered
    ticks in timeBaseId; their physical clock provenance remains external.
    The exposure ledger and result are locators plus declared digests, not
    authenticated bytes. -/
structure PrecommittedHoldoutPlan where
  sourceSystemId : NonEmptyText
  datasetId : NonEmptyText
  datasetArtifact : SourceArtifactRef
  measurementEvidence : SourceEvidenceRecord
  measurementAuthority :
    measurementEvidence.authority = EvidenceAuthority.independentMeasurement
  measurementEvidenceMatchesDataset :
    measurementEvidence.artifact = datasetArtifact
  sharedReadoutId : NonEmptyText
  familyId : NonEmptyText
  familyVersion : NonEmptyText
  familyDigest : NonEmptyText
  calibrationSetId : NonEmptyText
  holdoutSetId : NonEmptyText
  calibrationSetArtifact : SourceArtifactRef
  holdoutSetArtifact : SourceArtifactRef
  partition : CalibrationHoldoutPartition
  partitionSourceSystemBound :
    partition.sourceSystemId.value = sourceSystemId.value
  partitionDatasetBound :
    partition.datasetId.value = datasetId.value
  partitionDatasetArtifactBound :
    partition.datasetArtifact = datasetArtifact
  partitionCalibrationSetIdBound :
    partition.calibrationSetId.value = calibrationSetId.value
  partitionHoldoutSetIdBound :
    partition.holdoutSetId.value = holdoutSetId.value
  partitionCalibrationArtifactBound :
    partition.calibrationSetArtifact = calibrationSetArtifact
  partitionHoldoutArtifactBound :
    partition.holdoutSetArtifact = holdoutSetArtifact
  exposureLedger : SourceArtifactRef
  exposureLedgerDigest : NonEmptyText
  evaluationResultArtifact : SourceArtifactRef
  evaluationResultDigest : NonEmptyText
  predictedObservable : SourceArtifactRef
  falsificationRule : SourceArtifactRef
  thresholdSpec : SourceArtifactRef
  timeBaseId : NonEmptyText
  calibrationFrozenAt : Nat
  familyFrozenAt : Nat
  predictionFrozenAt : Nat
  firstHoldoutAccessAt : Nat
  evaluationAt : Nat
  preEvaluationQueryCount : Nat
  preEvaluationFeedbackCount : Nat
  familyDigestAtFirstAccess : NonEmptyText
  familyDigestAtEvaluation : NonEmptyText
  outcome : HoldoutOutcome
  calibrationHoldoutDistinct :
    calibrationSetId.value ≠ holdoutSetId.value
  calibrationBeforeAccess :
    calibrationFrozenAt < firstHoldoutAccessAt
  familyBeforeAccess :
    familyFrozenAt < firstHoldoutAccessAt
  predictionBeforeAccess :
    predictionFrozenAt < firstHoldoutAccessAt
  firstAccessBeforeEvaluation :
    firstHoldoutAccessAt ≤ evaluationAt
  noPriorQueries : preEvaluationQueryCount = 0
  noPriorFeedback : preEvaluationFeedbackCount = 0
  familyDigestMatchesFirstAccess :
    familyDigestAtFirstAccess.value = familyDigest.value
  familyDigestMatchesEvaluation :
    familyDigestAtEvaluation.value = familyDigest.value

/-- A heterogeneous comparison admitted only when its candidate belongs to
    the frozen family, its model/projection sources match that family, and
    the precommitted holdout plan binds to the same packet and carrier. -/
structure PrecommittedHeterogeneousModelComparison
    (HState : Type uH) (SState : Type uS)
    (HField : Type uHF) (SField : Type uSF)
    (CommonField : Type uCF)
    (Payload : MeasurementMode → Type uP) where
  comparison :
    HeterogeneousEvidenceGatedModelComparison
      HState SState HField SField CommonField Payload
  family : FrozenCandidateFamilyManifest
  candidateEntry : CandidateFamilyEntry
  holdout : PrecommittedHoldoutPlan
  candidateEntryInFamily : candidateEntry ∈ family.candidates
  candidateIdBound :
    candidateEntry.candidateId.value =
      comparison.binding.candidate.id.value
  candidateSourceBound :
    candidateEntry.candidateSource =
      comparison.binding.candidate.source
  hshModelSourceBound :
    candidateEntry.hshModelSource =
      comparison.binding.models.hshModelSource
  hshProjectionSourceBound :
    candidateEntry.hshProjectionSource =
      comparison.binding.models.hshProjectionSource
  standardModelSourceBound :
    family.standardModelSource =
      comparison.binding.models.standardModelSource
  standardProjectionSourceBound :
    family.standardProjectionSource =
      comparison.binding.models.standardProjectionSource
  commonCarrierIdBound :
    family.commonCarrierId.value =
      comparison.packet.commonCarrierId.value
  commonCarrierArtifactBound :
    family.commonCarrierArtifact =
      comparison.packet.commonCarrierArtifact
  candidateEvidenceMatchesSource :
    candidateEntry.sourceEvidence.artifact = candidateEntry.candidateSource
  standardComparatorAuthority :
    family.standardComparatorEvidence.authority =
      EvidenceAuthority.standardReference
  standardComparatorEvidenceMatchesSource :
    family.standardComparatorEvidence.artifact = family.standardModelSource
  predictionEvidenceMatchesObservable :
    family.predictionEvidence.artifact = family.predictedObservable
  measurementAuthority :
    holdout.measurementEvidence.authority =
      EvidenceAuthority.independentMeasurement
  measurementEvidenceMatchesDataset :
    holdout.measurementEvidence.artifact = holdout.datasetArtifact
  datasetArtifactBound :
    holdout.datasetArtifact = comparison.packet.packet.datasetArtifact
  sourceSystemBound :
    holdout.sourceSystemId.value =
      comparison.packet.packet.sourceSystemId.value
  datasetBound :
    holdout.datasetId.value =
      comparison.packet.packet.datasetId.value
  readoutBound :
    holdout.sharedReadoutId.value =
      comparison.packet.packet.sharedReadoutId.value
  familyIdBound :
    holdout.familyId.value = family.familyId.value
  familyVersionBound :
    holdout.familyVersion.value = family.familyVersion.value
  familyDigestBound :
    holdout.familyDigest.value = family.familyDigest.value
  familyFreezeBound : holdout.familyFrozenAt = family.frozenAt
  timeBaseBound : holdout.timeBaseId.value = family.timeBaseId.value
  predictedObservableBound :
    holdout.predictedObservable = family.predictedObservable
  falsificationRuleBound :
    holdout.falsificationRule = family.falsificationRule
  thresholdSpecBound :
    holdout.thresholdSpec = family.thresholdSpec
  positiveOutcome : holdout.outcome = HoldoutOutcome.pass

/-- Explicit evidence exposed by the stricter admission surface. -/
structure PrecommittedComparisonEvidence
    (c : PrecommittedHeterogeneousModelComparison
      HState SState HField SField CommonField Payload) : Prop where
  candidateHardGate :
    hardGate c.comparison.binding.candidate.value
  readoutGate :
    commonReadoutEvidenceGate
      c.comparison.packet.packet.readout.contract
  packetIdentity :
    c.comparison.binding.packetId.value =
      c.comparison.packet.packet.packetId.value ∧
    c.comparison.binding.packetDigest.value =
      c.comparison.packet.packet.packetDigest.value
  commonCarrierIdentity :
    c.comparison.binding.models.commonCarrierId.value =
      c.comparison.packet.commonCarrierId.value ∧
    c.comparison.binding.models.commonCarrierArtifact =
      c.comparison.packet.commonCarrierArtifact
  detectorSeparation :
    heterogeneousDetectorLevelTwoSidedSeparation
      c.comparison.binding.models
      c.comparison.packet.packet.readout.contract
      c.comparison.binding.hshStates.value
      c.comparison.binding.standardStates.value
  candidateEntryInFamily : c.candidateEntry ∈ c.family.candidates
  candidateEvidenceMatchesSource :
    c.candidateEntry.sourceEvidence.artifact =
      c.candidateEntry.candidateSource
  standardComparatorAuthority :
    c.family.standardComparatorEvidence.authority =
      EvidenceAuthority.standardReference
  standardComparatorEvidenceMatchesSource :
    c.family.standardComparatorEvidence.artifact =
      c.family.standardModelSource
  predictionEvidenceMatchesObservable :
    c.family.predictionEvidence.artifact =
      c.family.predictedObservable
  measurementAuthority :
    c.holdout.measurementEvidence.authority =
      EvidenceAuthority.independentMeasurement
  measurementEvidenceMatchesDataset :
    c.holdout.measurementEvidence.artifact =
      c.holdout.datasetArtifact
  datasetArtifactBound :
    c.holdout.datasetArtifact =
      c.comparison.packet.packet.datasetArtifact
  candidateIdBound :
    c.candidateEntry.candidateId.value =
      c.comparison.binding.candidate.id.value
  candidateSourceBound :
    c.candidateEntry.candidateSource =
      c.comparison.binding.candidate.source
  hshModelSourceBound :
    c.candidateEntry.hshModelSource =
      c.comparison.binding.models.hshModelSource
  hshProjectionSourceBound :
    c.candidateEntry.hshProjectionSource =
      c.comparison.binding.models.hshProjectionSource
  standardModelSourceBound :
    c.family.standardModelSource =
      c.comparison.binding.models.standardModelSource
  standardProjectionSourceBound :
    c.family.standardProjectionSource =
      c.comparison.binding.models.standardProjectionSource
  commonCarrierIdBound :
    c.family.commonCarrierId.value =
      c.comparison.packet.commonCarrierId.value
  commonCarrierArtifactBound :
    c.family.commonCarrierArtifact =
      c.comparison.packet.commonCarrierArtifact
  sourceSystemBound :
    c.holdout.sourceSystemId.value =
      c.comparison.packet.packet.sourceSystemId.value
  datasetBound :
    c.holdout.datasetId.value =
      c.comparison.packet.packet.datasetId.value
  readoutBound :
    c.holdout.sharedReadoutId.value =
      c.comparison.packet.packet.sharedReadoutId.value
  familyIdBound : c.holdout.familyId.value = c.family.familyId.value
  familyVersionBound :
    c.holdout.familyVersion.value = c.family.familyVersion.value
  familyDigestBound :
    c.holdout.familyDigest.value = c.family.familyDigest.value
  familyFreezeBound : c.holdout.familyFrozenAt = c.family.frozenAt
  timeBaseBound : c.holdout.timeBaseId.value = c.family.timeBaseId.value
  predictedObservableBound :
    c.holdout.predictedObservable = c.family.predictedObservable
  falsificationRuleBound :
    c.holdout.falsificationRule = c.family.falsificationRule
  thresholdSpecBound :
    c.holdout.thresholdSpec = c.family.thresholdSpec
  calibrationHoldoutDistinct :
    c.holdout.calibrationSetId.value ≠ c.holdout.holdoutSetId.value
  partitionSourceSystemBound :
    c.holdout.partition.sourceSystemId.value =
      c.holdout.sourceSystemId.value
  partitionDatasetBound :
    c.holdout.partition.datasetId.value = c.holdout.datasetId.value
  partitionDatasetArtifactBound :
    c.holdout.partition.datasetArtifact = c.holdout.datasetArtifact
  partitionCalibrationSetIdBound :
    c.holdout.partition.calibrationSetId.value =
      c.holdout.calibrationSetId.value
  partitionHoldoutSetIdBound :
    c.holdout.partition.holdoutSetId.value =
      c.holdout.holdoutSetId.value
  partitionCalibrationArtifactBound :
    c.holdout.partition.calibrationSetArtifact =
      c.holdout.calibrationSetArtifact
  partitionHoldoutArtifactBound :
    c.holdout.partition.holdoutSetArtifact =
      c.holdout.holdoutSetArtifact
  calibrationUnitsNonempty :
    c.holdout.partition.calibrationUnitIds.Nonempty
  holdoutUnitsNonempty :
    c.holdout.partition.holdoutUnitIds.Nonempty
  calibrationHoldoutUnitSetsDisjoint :
    Disjoint c.holdout.partition.calibrationUnitIds
      c.holdout.partition.holdoutUnitIds
  observationUnitMapEvidenceMatchesArtifact :
    c.holdout.partition.observationUnitMapEvidence.artifact =
      c.holdout.partition.observationUnitMapArtifact
  calibrationUnitIdsExactlyMapped :
    c.holdout.partition.calibrationUnitIds =
      c.holdout.partition.calibrationObservationIds.image
        c.holdout.partition.observationToUnit
  holdoutUnitIdsExactlyMapped :
    c.holdout.partition.holdoutUnitIds =
      c.holdout.partition.holdoutObservationIds.image
        c.holdout.partition.observationToUnit
  calibrationHoldoutObservationIdsDisjoint :
    Disjoint c.holdout.partition.calibrationObservationIds
      c.holdout.partition.holdoutObservationIds
  calibrationBeforeAccess :
    c.holdout.calibrationFrozenAt < c.holdout.firstHoldoutAccessAt
  familyBeforeAccess :
    c.holdout.familyFrozenAt < c.holdout.firstHoldoutAccessAt
  predictionBeforeAccess :
    c.holdout.predictionFrozenAt < c.holdout.firstHoldoutAccessAt
  firstAccessBeforeEvaluation :
    c.holdout.firstHoldoutAccessAt ≤ c.holdout.evaluationAt
  noPriorQueries : c.holdout.preEvaluationQueryCount = 0
  noPriorFeedback : c.holdout.preEvaluationFeedbackCount = 0
  familyDigestMatchesFirstAccess :
    c.holdout.familyDigestAtFirstAccess.value =
      c.holdout.familyDigest.value
  familyDigestMatchesEvaluation :
    c.holdout.familyDigestAtEvaluation.value =
      c.holdout.familyDigest.value
  positiveOutcome : c.holdout.outcome = HoldoutOutcome.pass

/-- The typed wrapper exposes the existing candidate/readout/separation
    gates plus the PDR's source, parameter, calibration, holdout, prediction,
    falsification, threshold, exposure and evaluation bindings. -/
theorem precommittedComparison_has_evidence
    (c : PrecommittedHeterogeneousModelComparison
      HState SState HField SField CommonField Payload) :
    PrecommittedComparisonEvidence c := by
  exact
    { candidateHardGate := c.comparison.candidateHardGate
      readoutGate := c.comparison.readoutGate
      packetIdentity := c.comparison.packetIdentity
      commonCarrierIdentity := c.comparison.commonCarrierIdentity
      detectorSeparation := c.comparison.detectorSeparation
      candidateEntryInFamily := c.candidateEntryInFamily
      candidateEvidenceMatchesSource := c.candidateEvidenceMatchesSource
      standardComparatorAuthority := c.standardComparatorAuthority
      standardComparatorEvidenceMatchesSource :=
        c.standardComparatorEvidenceMatchesSource
      predictionEvidenceMatchesObservable := c.predictionEvidenceMatchesObservable
      measurementAuthority := c.measurementAuthority
      measurementEvidenceMatchesDataset := c.measurementEvidenceMatchesDataset
      datasetArtifactBound := c.datasetArtifactBound
      candidateIdBound := c.candidateIdBound
      candidateSourceBound := c.candidateSourceBound
      hshModelSourceBound := c.hshModelSourceBound
      hshProjectionSourceBound := c.hshProjectionSourceBound
      standardModelSourceBound := c.standardModelSourceBound
      standardProjectionSourceBound := c.standardProjectionSourceBound
      commonCarrierIdBound := c.commonCarrierIdBound
      commonCarrierArtifactBound := c.commonCarrierArtifactBound
      sourceSystemBound := c.sourceSystemBound
      datasetBound := c.datasetBound
      readoutBound := c.readoutBound
      familyIdBound := c.familyIdBound
      familyVersionBound := c.familyVersionBound
      familyDigestBound := c.familyDigestBound
      familyFreezeBound := c.familyFreezeBound
      timeBaseBound := c.timeBaseBound
      predictedObservableBound := c.predictedObservableBound
      falsificationRuleBound := c.falsificationRuleBound
      thresholdSpecBound := c.thresholdSpecBound
      calibrationHoldoutDistinct := c.holdout.calibrationHoldoutDistinct
      partitionSourceSystemBound := c.holdout.partitionSourceSystemBound
      partitionDatasetBound := c.holdout.partitionDatasetBound
      partitionDatasetArtifactBound := c.holdout.partitionDatasetArtifactBound
      partitionCalibrationSetIdBound := c.holdout.partitionCalibrationSetIdBound
      partitionHoldoutSetIdBound := c.holdout.partitionHoldoutSetIdBound
      partitionCalibrationArtifactBound := c.holdout.partitionCalibrationArtifactBound
      partitionHoldoutArtifactBound := c.holdout.partitionHoldoutArtifactBound
      calibrationUnitsNonempty := c.holdout.partition.calibrationUnitsNonempty
      holdoutUnitsNonempty := c.holdout.partition.holdoutUnitsNonempty
      calibrationHoldoutUnitSetsDisjoint := c.holdout.partition.unitSetsDisjoint
      observationUnitMapEvidenceMatchesArtifact :=
        c.holdout.partition.observationUnitMapEvidenceMatchesArtifact
      calibrationUnitIdsExactlyMapped :=
        c.holdout.partition.calibrationUnitIdsExactlyMapped
      holdoutUnitIdsExactlyMapped :=
        c.holdout.partition.holdoutUnitIdsExactlyMapped
      calibrationHoldoutObservationIdsDisjoint :=
        holdoutPlan_has_disjoint_observation_ids c.holdout
      calibrationBeforeAccess := c.holdout.calibrationBeforeAccess
      familyBeforeAccess := c.holdout.familyBeforeAccess
      predictionBeforeAccess := c.holdout.predictionBeforeAccess
      firstAccessBeforeEvaluation := c.holdout.firstAccessBeforeEvaluation
      noPriorQueries := c.holdout.noPriorQueries
      noPriorFeedback := c.holdout.noPriorFeedback
      familyDigestMatchesFirstAccess :=
        c.holdout.familyDigestMatchesFirstAccess
      familyDigestMatchesEvaluation :=
        c.holdout.familyDigestMatchesEvaluation
      positiveOutcome := c.positiveOutcome }

/-- The precommitted plan exposes nonempty calibration and holdout
    unit sets that are disjoint at the declared independence-unit grain. -/
theorem holdoutPlan_has_disjoint_unit_partition
    (plan : PrecommittedHoldoutPlan) :
    plan.partition.calibrationUnitIds.Nonempty ∧
    plan.partition.holdoutUnitIds.Nonempty ∧
    Disjoint plan.partition.calibrationUnitIds
      plan.partition.holdoutUnitIds := by
  exact
    ⟨plan.partition.calibrationUnitsNonempty,
      plan.partition.holdoutUnitsNonempty,
      plan.partition.unitSetsDisjoint⟩

/-- Because one total observation-to-unit map is used on both sides,
    disjoint unit sets imply that no raw observation ID appears in both
    calibration and holdout. This is partition integrity, not statistical
    independence between the declared units. -/
theorem holdoutPlan_has_disjoint_observation_ids
    (plan : PrecommittedHoldoutPlan) :
    Disjoint plan.partition.calibrationObservationIds
      plan.partition.holdoutObservationIds := by
  refine Finset.disjoint_left.mpr ?_
  intro observation hCalibration hHoldout
  have hCalibrationUnit :
      plan.partition.observationToUnit observation ∈
        plan.partition.calibrationUnitIds := by
    rw [plan.partition.calibrationUnitIdsExactlyMapped]
    exact Finset.mem_image.mpr ⟨observation, hCalibration, rfl⟩
  have hHoldoutUnit :
      plan.partition.observationToUnit observation ∈
        plan.partition.holdoutUnitIds := by
    rw [plan.partition.holdoutUnitIdsExactlyMapped]
    exact Finset.mem_image.mpr ⟨observation, hHoldout, rfl⟩
  exact (Finset.disjoint_left.mp plan.partition.unitSetsDisjoint)
    hCalibrationUnit hHoldoutUnit

/-- Abstract counterexample: distinct set labels can still designate the
    same nonempty unit set. This is a logical witness, not a physical dataset
    or synthetic experimental fixture. -/
theorem distinct_set_labels_do_not_imply_unit_disjointness :
    ∃ (calibrationSetId holdoutSetId : String)
      (calibrationUnitIds holdoutUnitIds : Finset String),
      calibrationSetId ≠ holdoutSetId ∧
      calibrationUnitIds = holdoutUnitIds ∧
      calibrationUnitIds.Nonempty := by
  refine
    ⟨"calibration", "holdout", {"unit"}, {"unit"}, ?_, rfl, ?_⟩
  · decide
  · simp

/-- The three precommitment freezes precede the first holdout access, and
    the recorded evaluation follows that access. -/
theorem holdoutPlan_has_precommitment_order
    (plan : PrecommittedHoldoutPlan) :
    plan.calibrationFrozenAt < plan.firstHoldoutAccessAt ∧
    plan.familyFrozenAt < plan.firstHoldoutAccessAt ∧
    plan.predictionFrozenAt < plan.firstHoldoutAccessAt ∧
    plan.firstHoldoutAccessAt ≤ plan.evaluationAt := by
  exact
    ⟨plan.calibrationBeforeAccess,
      plan.familyBeforeAccess,
      plan.predictionBeforeAccess,
      plan.firstAccessBeforeEvaluation⟩

/-- Two candidate comparisons share one frozen evaluation context only when
    they use the same exact packet, common carrier, candidate-family manifest,
    and complete holdout/evaluation record. -/
def sameFrozenEvaluationContext
    (a b : PrecommittedHeterogeneousModelComparison
      HState SState HField SField CommonField Payload) : Prop :=
  a.comparison.packet.packet = b.comparison.packet.packet ∧
  a.comparison.packet.commonCarrierId.value =
    b.comparison.packet.commonCarrierId.value ∧
  a.comparison.packet.commonCarrierArtifact =
    b.comparison.packet.commonCarrierArtifact ∧
  a.family = b.family ∧
  a.holdout = b.holdout

/-- A tie-break between heterogeneous candidates is available only when
    both comparisons satisfy the precommitted evidence wrapper and share the
    exact same frozen evaluation context. -/
def precommittedHeterogeneousIntelligibilityTieBreak
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : PrecommittedHeterogeneousModelComparison
      HState SState HField SField CommonField Payload) : Prop :=
  PrecommittedComparisonEvidence a ∧
  PrecommittedComparisonEvidence b ∧
  sameFrozenEvaluationContext a b ∧
  empiricallyEquivalent
    a.comparison.binding.candidate.value
    b.comparison.binding.candidate.value ∧
  humanPrefers
    a.comparison.binding.candidate.value
    b.comparison.binding.candidate.value ∧
  noMoreComplex
    a.comparison.binding.candidate.value.complexity
    b.comparison.binding.candidate.value.complexity

/-- Both sides of a precommitted heterogeneous tie-break retain all their
    candidate, readout, separation, parameter, calibration and holdout
    evidence. -/
theorem tieBreak_requires_both_precommitted_evidence
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : PrecommittedHeterogeneousModelComparison
      HState SState HField SField CommonField Payload)
    (h : precommittedHeterogeneousIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    PrecommittedComparisonEvidence a ∧
    PrecommittedComparisonEvidence b :=
  ⟨h.1, h.2.1⟩

/-- A heterogeneous tie-break cannot silently mix calibration/holdout
    partitions, family versions, predicted observables or thresholds. -/
theorem tieBreak_requires_same_frozen_evaluation_context
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : PrecommittedHeterogeneousModelComparison
      HState SState HField SField CommonField Payload)
    (h : precommittedHeterogeneousIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    sameFrozenEvaluationContext a b :=
  h.2.2.1

/-- The tie-break still requires empirical equivalence. -/
theorem tieBreak_requires_empirical_equivalence
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : PrecommittedHeterogeneousModelComparison
      HState SState HField SField CommonField Payload)
    (h : precommittedHeterogeneousIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    empiricallyEquivalent
      a.comparison.binding.candidate.value
      b.comparison.binding.candidate.value :=
  h.2.2.2.1

/-- The tie-break still requires the declared human preference. -/
theorem tieBreak_requires_human_preference
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : PrecommittedHeterogeneousModelComparison
      HState SState HField SField CommonField Payload)
    (h : precommittedHeterogeneousIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    humanPrefers
      a.comparison.binding.candidate.value
      b.comparison.binding.candidate.value :=
  h.2.2.2.2.1

/-- The tie-break still rejects a more complex preferred candidate. -/
theorem tieBreak_requires_no_greater_complexity
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : PrecommittedHeterogeneousModelComparison
      HState SState HField SField CommonField Payload)
    (h : precommittedHeterogeneousIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    noMoreComplex
      a.comparison.binding.candidate.value.complexity
      b.comparison.binding.candidate.value.complexity :=
  h.2.2.2.2.2

#print axioms precommittedComparison_has_evidence
#print axioms holdoutPlan_has_disjoint_unit_partition
#print axioms holdoutPlan_has_disjoint_observation_ids
#print axioms distinct_set_labels_do_not_imply_unit_disjointness
#print axioms holdoutPlan_has_precommitment_order
#print axioms tieBreak_requires_both_precommitted_evidence
#print axioms tieBreak_requires_same_frozen_evaluation_context
#print axioms tieBreak_requires_empirical_equivalence
#print axioms tieBreak_requires_human_preference
#print axioms tieBreak_requires_no_greater_complexity

end HsHVerification.PrecommittedHoldoutAdmission
