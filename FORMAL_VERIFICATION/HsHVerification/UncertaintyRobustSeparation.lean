import Mathlib
import HsHVerification.PrecommittedHoldoutAdmission

/-!
# Instrument-support robust detector separation

This module formalizes one channel of Aldus's existing five-channel typed
uncertainty ledger: instrument / measurement / calibration support.

It does not merge source-semantic alternatives, geometric observation-fiber
non-identifiability, nuisance/model discrepancy, or dependence/overlap into
one generic error bar. Those remain distinct obligations. The candidate
state sets and source-to-common-carrier maps remain the existing model/fiber
inputs; this module expands only the final detector values by one frozen,
source-addressed instrument-support map.

The support map is set-valued. It is not, by itself, a probability
distribution, confidence region, likelihood, covariance, metric ball, or
coverage guarantee. Its semantics and scope must be justified by the
referenced source. No numerical or physical fixture is introduced.

Two-sided instrument-support robustness requires an observation possible
under one model's complete state-to-carrier-to-detector composition that is
impossible under every instrument-support-expanded outcome of the other
model, in both directions. This implies the existing exact nominal
detector-level separation; the converse is not claimed.

The wrapper binds the support record to the exact frozen readout metadata and
requires its source evidence to be in the frozen candidate-family lineage
with standard-reference or independent-measurement authority. These typed
relations do not authenticate artifact bytes or prove that the source
implements the supplied set-valued function.
-/

namespace HsHVerification.InstrumentSupportRobustSeparation

open HsHVerification.EvidenceGatedAdmission
open HsHVerification.HeterogeneousReadoutFiberSeparation
open HsHVerification.MeasurementDomainCompatibility
open HsHVerification.ModelSelectionPreference
open HsHVerification.PrecommittedHoldoutAdmission

universe uH uS uHF uSF uCF uP

/-- Canonical channel label from the five-channel uncertainty ledger.
    This adapter represents only instrument / measurement / calibration
    support, not source-semantic, geometric-fiber, nuisance/discrepancy, or
    dependence/overlap evidence. -/
def instrumentSupportClaimScope : String :=
  "Instrument / measurement / calibration"

variable {HState : Type uH} {SState : Type uS}
variable {HField : Type uHF} {SField : Type uSF}
variable {CommonField : Type uCF}
variable {Payload : HsHVerification.MeasurementDomainCompatibility.MeasurementMode → Type uP}

/-- A source-addressed set of possible instrument observations for one exact
    frozen readout contract. This is only the instrument/measurement support
    channel; it does not absorb geometric fibers, nuisance discrepancy, or
    dependence uncertainty. -/
structure FrozenInstrumentObservationSupport
    (readout :
      HsHVerification.SharedReadoutFiberSeparation.FrozenCommonReadout
        CommonField Payload) where
  evidence : SourceEvidenceRecord
  semantics : NonEmptyText
  scope : NonEmptyText
  scopeIsInstrumentSupport :
    scope.value = instrumentSupportClaimScope
  instrumentId : NonEmptyText
  operatorVersion : NonEmptyText
  calibrationRecord : NonEmptyText
  acquisitionUnitMapRecord : NonEmptyText
  instrumentIdBound : instrumentId.value = readout.instrumentId
  operatorVersionBound : operatorVersion.value = readout.operatorVersion
  calibrationRecordBound : calibrationRecord.value = readout.calibrationRecord
  acquisitionUnitMapRecordBound :
    acquisitionUnitMapRecord.value = readout.acquisitionUnitMapRecord
  readoutDeclaration : readout.uncertaintyModelDeclared
  possibleInstrumentObservations :
    Payload readout.mode → Set (Payload readout.mode)

/-- H(s)H's complete detector-readout region expanded only by the declared
    instrument-support map. The union retains every admissible model state. -/
def hshInstrumentSupportedPredictionRegion
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout :
      HsHVerification.SharedReadoutFiberSeparation.FrozenCommonReadout
        CommonField Payload)
    (support : FrozenInstrumentObservationSupport readout)
    (hshStates : Set HState) : Set (Payload readout.mode) :=
  { observation | ∃ hshState ∈ hshStates,
      observation ∈ support.possibleInstrumentObservations
        (hshDetectorReadoutMap models readout hshState) }

/-- The standard model's complete detector-readout region expanded by the
    same frozen instrument-support map. -/
def standardInstrumentSupportedPredictionRegion
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout :
      HsHVerification.SharedReadoutFiberSeparation.FrozenCommonReadout
        CommonField Payload)
    (support : FrozenInstrumentObservationSupport readout)
    (standardStates : Set SState) : Set (Payload readout.mode) :=
  { observation | ∃ standardState ∈ standardStates,
      observation ∈ support.possibleInstrumentObservations
        (standardDetectorReadoutMap models readout standardState) }

/-- H(s)H-exclusive observations after instrument-support expansion. -/
def hshInstrumentSupportExclusivePredictions
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout :
      HsHVerification.SharedReadoutFiberSeparation.FrozenCommonReadout
        CommonField Payload)
    (support : FrozenInstrumentObservationSupport readout)
    (hshStates : Set HState) (standardStates : Set SState) :
    Set (Payload readout.mode) :=
  { observation |
      observation ∈ hshInstrumentSupportedPredictionRegion
        models readout support hshStates ∧
      observation ∉ standardInstrumentSupportedPredictionRegion
        models readout support standardStates }

/-- Standard-exclusive observations after the same instrument-support
    expansion. -/
def standardInstrumentSupportExclusivePredictions
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout :
      HsHVerification.SharedReadoutFiberSeparation.FrozenCommonReadout
        CommonField Payload)
    (support : FrozenInstrumentObservationSupport readout)
    (hshStates : Set HState) (standardStates : Set SState) :
    Set (Payload readout.mode) :=
  { observation |
      observation ∈ standardInstrumentSupportedPredictionRegion
        models readout support standardStates ∧
      observation ∉ hshInstrumentSupportedPredictionRegion
        models readout support hshStates }

/-- Two-sided instrument-support robustness: each model has at least one
    detector observation excluded by every support-expanded outcome of the
    other model. -/
def heterogeneousInstrumentSupportRobustTwoSidedSeparation
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout :
      HsHVerification.SharedReadoutFiberSeparation.FrozenCommonReadout
        CommonField Payload)
    (support : FrozenInstrumentObservationSupport readout)
    (hshStates : Set HState) (standardStates : Set SState) : Prop :=
  (hshInstrumentSupportExclusivePredictions
    models readout support hshStates standardStates).Nonempty ∧
  (standardInstrumentSupportExclusivePredictions
    models readout support hshStates standardStates).Nonempty

/-- H(s)H instrument-support exclusivity implies an exact nominal detector
    value outside the standard nominal readout region. -/
theorem hshInstrumentSupportExclusive_nonempty_implies_nominalExclusive
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout :
      HsHVerification.SharedReadoutFiberSeparation.FrozenCommonReadout
        CommonField Payload)
    (support : FrozenInstrumentObservationSupport readout)
    (hshStates : Set HState) (standardStates : Set SState)
    (h :
      (hshInstrumentSupportExclusivePredictions
        models readout support hshStates standardStates).Nonempty) :
    (hshDetectorExclusivePredictions
      models readout hshStates standardStates).Nonempty := by
  rcases h with ⟨observation, hHsh, hNotStandard⟩
  rcases hHsh with ⟨hshState, hStateMem, hPossible⟩
  refine ⟨hshDetectorReadoutMap models readout hshState, ?_⟩
  constructor
  · exact ⟨hshState, hStateMem, rfl⟩
  · intro hStandard
    rcases hStandard with ⟨standardState, hStandardMem, hReadoutEq⟩
    exact hNotStandard
      ⟨standardState, hStandardMem, by
        simpa [hReadoutEq.symm] using hPossible⟩

/-- The symmetric standard-exclusive implication. -/
theorem standardInstrumentSupportExclusive_nonempty_implies_nominalExclusive
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout :
      HsHVerification.SharedReadoutFiberSeparation.FrozenCommonReadout
        CommonField Payload)
    (support : FrozenInstrumentObservationSupport readout)
    (hshStates : Set HState) (standardStates : Set SState)
    (h :
      (standardInstrumentSupportExclusivePredictions
        models readout support hshStates standardStates).Nonempty) :
    (standardDetectorExclusivePredictions
      models readout hshStates standardStates).Nonempty := by
  rcases h with ⟨observation, hStandard, hNotHsh⟩
  rcases hStandard with ⟨standardState, hStateMem, hPossible⟩
  refine ⟨standardDetectorReadoutMap models readout standardState, ?_⟩
  constructor
  · exact ⟨standardState, hStateMem, rfl⟩
  · intro hHsh
    rcases hHsh with ⟨hshState, hHshMem, hReadoutEq⟩
    exact hNotHsh
      ⟨hshState, hHshMem, by
        simpa [hReadoutEq.symm] using hPossible⟩

/-- Instrument-support-robust two-sided separation implies the existing
    exact nominal detector-level separation. The converse is not asserted. -/
theorem instrumentSupportRobustSeparation_implies_nominalSeparation
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout :
      HsHVerification.SharedReadoutFiberSeparation.FrozenCommonReadout
        CommonField Payload)
    (support : FrozenInstrumentObservationSupport readout)
    (hshStates : Set HState) (standardStates : Set SState)
    (h : heterogeneousInstrumentSupportRobustTwoSidedSeparation
      models readout support hshStates standardStates) :
    heterogeneousDetectorLevelTwoSidedSeparation
      models readout hshStates standardStates := by
  exact
    ⟨hshInstrumentSupportExclusive_nonempty_implies_nominalExclusive
        models readout support hshStates standardStates h.1,
      standardInstrumentSupportExclusive_nonempty_implies_nominalExclusive
        models readout support hshStates standardStates h.2⟩

/-- An empirical precommitted comparison with an explicit instrument-support
    model. Its source evidence must be part of the frozen family lineage,
    match the declared scope, and carry standard-reference or
    independent-measurement authority. -/
structure InstrumentSupportRobustPrecommittedComparison
    (HState : Type uH) (SState : Type uS)
    (HField : Type uHF) (SField : Type uSF)
    (CommonField : Type uCF)
    (Payload :
      HsHVerification.MeasurementDomainCompatibility.MeasurementMode → Type uP) where
  base : PrecommittedHeterogeneousModelComparison
    HState SState HField SField CommonField Payload
  instrumentSupport : FrozenInstrumentObservationSupport
    base.comparison.packet.packet.readout.contract
  instrumentSupportEvidenceInFamily :
    instrumentSupport.evidence ∈ base.family.evidenceLineage
  instrumentSupportEvidenceAuthority :
    instrumentSupport.evidence.authority = EvidenceAuthority.standardReference ∨
    instrumentSupport.evidence.authority = EvidenceAuthority.independentMeasurement
  instrumentSupportEvidenceScopeMatches :
    instrumentSupport.evidence.claimScope.value = instrumentSupportClaimScope
  robustSeparation :
    heterogeneousInstrumentSupportRobustTwoSidedSeparation
      base.comparison.binding.models
      base.comparison.packet.packet.readout.contract
      instrumentSupport
      base.comparison.binding.hshStates.value
      base.comparison.binding.standardStates.value

/-- The instrument-support wrapper retains all existing precommitted
    candidate, source, packet, readout, calibration, holdout, and outcome
    evidence. -/
theorem instrumentSupportRobustAdmission_preserves_precommittedEvidence
    (comparison : InstrumentSupportRobustPrecommittedComparison
      HState SState HField SField CommonField Payload) :
    PrecommittedComparisonEvidence comparison.base :=
  precommittedComparison_has_evidence comparison.base

/-- An admitted comparison carries the canonical instrument-support scope
    in both its support record and evidence claim. This prevents caller-selected
    free text from routing another uncertainty channel through this adapter;
    it does not authenticate the cited artifact's contents. -/
theorem instrumentSupportRobustAdmission_has_canonicalEvidenceScope
    (comparison : InstrumentSupportRobustPrecommittedComparison
      HState SState HField SField CommonField Payload) :
    comparison.instrumentSupport.scope.value = instrumentSupportClaimScope ∧
      comparison.instrumentSupport.evidence.claimScope.value =
        instrumentSupportClaimScope := by
  exact
    ⟨comparison.instrumentSupport.scopeIsInstrumentSupport,
      comparison.instrumentSupportEvidenceScopeMatches⟩

/-- An admitted instrument-support-robust comparison necessarily retains
    the exact nominal two-sided detector separation as a weaker consequence. -/
theorem instrumentSupportRobustAdmission_implies_nominalSeparation
    (comparison : InstrumentSupportRobustPrecommittedComparison
      HState SState HField SField CommonField Payload) :
    heterogeneousDetectorLevelTwoSidedSeparation
      comparison.base.comparison.binding.models
      comparison.base.comparison.packet.packet.readout.contract
      comparison.base.comparison.binding.hshStates.value
      comparison.base.comparison.binding.standardStates.value :=
  instrumentSupportRobustSeparation_implies_nominalSeparation
    comparison.base.comparison.binding.models
    comparison.base.comparison.packet.packet.readout.contract
    comparison.instrumentSupport
    comparison.base.comparison.binding.hshStates.value
    comparison.base.comparison.binding.standardStates.value
    comparison.robustSeparation

/-- Two candidate tie-breaks share the instrument-support evaluation context
    only when their precommitted contexts and complete support records,
    including the set-valued functions, are identical. -/
def sameFrozenInstrumentSupportContext
    (a b : InstrumentSupportRobustPrecommittedComparison
      HState SState HField SField CommonField Payload) : Prop :=
  sameFrozenEvaluationContext a.base b.base ∧
  HEq a.instrumentSupport b.instrumentSupport

/-- A robust tie-break requires the same frozen instrument-support context
    as well as the existing empirical-equivalence, human-preference and
    complexity conditions. -/
def instrumentSupportRobustIntelligibilityTieBreak
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : InstrumentSupportRobustPrecommittedComparison
      HState SState HField SField CommonField Payload) : Prop :=
  sameFrozenInstrumentSupportContext a b ∧
  precommittedHeterogeneousIntelligibilityTieBreak
    empiricallyEquivalent humanPrefers a.base b.base

theorem instrumentSupportRobustTieBreak_requires_same_support_model
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : InstrumentSupportRobustPrecommittedComparison
      HState SState HField SField CommonField Payload)
    (h : instrumentSupportRobustIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    HEq a.instrumentSupport b.instrumentSupport :=
  h.1.2

theorem instrumentSupportRobustTieBreak_requires_same_frozen_evaluation_context
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : InstrumentSupportRobustPrecommittedComparison
      HState SState HField SField CommonField Payload)
    (h : instrumentSupportRobustIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    sameFrozenEvaluationContext a.base b.base :=
  h.1.1

theorem instrumentSupportRobustTieBreak_requires_both_precommitted_evidence
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : InstrumentSupportRobustPrecommittedComparison
      HState SState HField SField CommonField Payload)
    (h : instrumentSupportRobustIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    PrecommittedComparisonEvidence a.base ∧
      PrecommittedComparisonEvidence b.base :=
  tieBreak_requires_both_precommitted_evidence
    empiricallyEquivalent humanPrefers a.base b.base h.2

#print axioms hshInstrumentSupportExclusive_nonempty_implies_nominalExclusive
#print axioms standardInstrumentSupportExclusive_nonempty_implies_nominalExclusive
#print axioms instrumentSupportRobustSeparation_implies_nominalSeparation
#print axioms instrumentSupportRobustAdmission_preserves_precommittedEvidence
#print axioms instrumentSupportRobustAdmission_has_canonicalEvidenceScope
#print axioms instrumentSupportRobustAdmission_implies_nominalSeparation
#print axioms instrumentSupportRobustTieBreak_requires_same_support_model
#print axioms instrumentSupportRobustTieBreak_requires_same_frozen_evaluation_context
#print axioms instrumentSupportRobustTieBreak_requires_both_precommitted_evidence


/-!
## Nominally grounded, source-bound instrument-support admission

The original FrozenInstrumentObservationSupport remains a general
source-declared set-valued observation relation. By itself it does not imply
that a nominal readout belongs to its own support set, that the set is
nonempty, or that the cited artifact is the artifact defining the readout's
uncertainty model.

The stricter opt-in wrapper below adds those two missing record-shape
conditions without changing the existing API. Nominal inclusion implies
nonemptiness, but it does not establish a probability distribution, coverage
level, confidence region, covariance, metric ball, closure, convexity, or
completeness. Source review must still verify that the artifact actually
defines the supplied function and that its calibration is valid.
-/

/-- Source evidence for one uncertainty model bound to one exact frozen
    readout contract. The artifact and digest live in evidence; the
    remaining fields make the intended instrument, operator, calibration,
    acquisition map, units, uncertainty declaration, and resolution explicit.
    These equalities are typed assertions, not artifact authentication. -/
structure SourceBoundReadoutUncertaintyModel
    (readout :
      HsHVerification.SharedReadoutFiberSeparation.FrozenCommonReadout
        CommonField Payload) where
  evidence : SourceEvidenceRecord
  instrumentId : NonEmptyText
  operatorVersion : NonEmptyText
  calibrationRecord : NonEmptyText
  acquisitionUnitMapRecord : NonEmptyText
  instrumentIdBound : instrumentId.value = readout.instrumentId
  operatorVersionBound : operatorVersion.value = readout.operatorVersion
  calibrationRecordBound : calibrationRecord.value = readout.calibrationRecord
  acquisitionUnitMapRecordBound :
    acquisitionUnitMapRecord.value = readout.acquisitionUnitMapRecord
  instrumentIdentityAuthenticated :
    readout.instrumentIdentityAuthenticated
  operatorVersionAuthenticated :
    readout.operatorVersionAuthenticated
  calibrationAuthenticated :
    readout.calibrationAuthenticated
  acquisitionUnitMapAuthenticated :
    readout.acquisitionUnitMapAuthenticated
  measurementUnitsDeclared : readout.measurementUnitsDeclared
  uncertaintyModelDeclared : readout.uncertaintyModelDeclared
  resolutionDeclared : readout.resolutionDeclared

/-- A stricter opt-in comparison: the source record used by the instrument
    support is exactly the record identifying the uncertainty model for the
    frozen readout, and every nominal detector value belongs to its own
    possible-observation set. The underlying support map remains a
    source-defined relation; the wrapper does not prove that the source
    artifact implements the Lean function. -/
structure NominallyGroundedInstrumentSupportRobustComparison
    (HState : Type uH) (SState : Type uS)
    (HField : Type uHF) (SField : Type uSF)
    (CommonField : Type uCF)
    (Payload :
      HsHVerification.MeasurementDomainCompatibility.MeasurementMode →
        Type uP) where
  admitted : InstrumentSupportRobustPrecommittedComparison
    HState SState HField SField CommonField Payload
  readoutModel : SourceBoundReadoutUncertaintyModel
    admitted.base.comparison.packet.packet.readout.contract
  supportEvidenceMatchesReadoutModel :
    admitted.instrumentSupport.evidence = readoutModel.evidence
  nominalReadoutIncluded :
    ∀ nominal :
      Payload admitted.base.comparison.packet.packet.readout.contract.mode,
      nominal ∈
        admitted.instrumentSupport.possibleInstrumentObservations nominal

/-- The nominal-inclusion condition makes every support set nonempty at its
    nominal readout. This is only a set-membership property, not a coverage
    probability or a claim that all possible measurement outcomes are present. -/
theorem nominallyGroundedSupport_nonempty_at_nominal
    (comparison :
      NominallyGroundedInstrumentSupportRobustComparison
        HState SState HField SField CommonField Payload)
    (nominal :
      Payload comparison.admitted.base.comparison.packet.packet.readout.contract.mode) :
    (comparison.admitted.instrumentSupport.possibleInstrumentObservations
      nominal).Nonempty :=
  ⟨nominal, comparison.nominalReadoutIncluded nominal⟩

/-- The support record's artifact is exactly the artifact declared for the
    frozen readout uncertainty model. The equality is record-level metadata;
    independent source review must still check artifact contents and code/map
    correspondence. -/
theorem nominallyGroundedSupport_has_source_artifact_binding
    (comparison :
      NominallyGroundedInstrumentSupportRobustComparison
        HState SState HField SField CommonField Payload) :
    comparison.admitted.instrumentSupport.evidence.artifact =
      comparison.readoutModel.evidence.artifact :=
  congrArg
    (fun evidence : SourceEvidenceRecord => evidence.artifact)
    comparison.supportEvidenceMatchesReadoutModel

/-- The support record's digest is exactly the digest declared for the
    frozen readout uncertainty model. This does not compute or authenticate
    either digest. -/
theorem nominallyGroundedSupport_has_source_digest_binding
    (comparison :
      NominallyGroundedInstrumentSupportRobustComparison
        HState SState HField SField CommonField Payload) :
    comparison.admitted.instrumentSupport.evidence.digest.value =
      comparison.readoutModel.evidence.digest.value :=
  congrArg
    (fun evidence : SourceEvidenceRecord => evidence.digest.value)
    comparison.supportEvidenceMatchesReadoutModel

/-- The source-bound uncertainty model retains the exact readout identity and
    calibration context to which its support function is declared to apply. -/
theorem nominallyGroundedSupport_has_readout_identity
    (comparison :
      NominallyGroundedInstrumentSupportRobustComparison
        HState SState HField SField CommonField Payload) :
    comparison.readoutModel.instrumentId.value =
        comparison.admitted.base.comparison.packet.packet.readout.contract.instrumentId ∧
    comparison.readoutModel.operatorVersion.value =
        comparison.admitted.base.comparison.packet.packet.readout.contract.operatorVersion ∧
    comparison.readoutModel.calibrationRecord.value =
        comparison.admitted.base.comparison.packet.packet.readout.contract.calibrationRecord ∧
    comparison.readoutModel.acquisitionUnitMapRecord.value =
        comparison.admitted.base.comparison.packet.packet.readout.contract.acquisitionUnitMapRecord := by
  exact
    ⟨comparison.readoutModel.instrumentIdBound,
      comparison.readoutModel.operatorVersionBound,
      comparison.readoutModel.calibrationRecordBound,
      comparison.readoutModel.acquisitionUnitMapRecordBound⟩

/-- The stricter wrapper preserves the existing precommitted comparison
    evidence, including the source lineage and authority checks. -/
theorem nominallyGroundedSupport_preserves_precommittedEvidence
    (comparison :
      NominallyGroundedInstrumentSupportRobustComparison
        HState SState HField SField CommonField Payload) :
    PrecommittedComparisonEvidence comparison.admitted.base :=
  instrumentSupportRobustAdmission_preserves_precommittedEvidence
    comparison.admitted

/-- Nominally grounded instrument support retains the existing robust
    two-sided separation requirement. -/
theorem nominallyGroundedSupport_preserves_robustSeparation
    (comparison :
      NominallyGroundedInstrumentSupportRobustComparison
        HState SState HField SField CommonField Payload) :
    heterogeneousInstrumentSupportRobustTwoSidedSeparation
      comparison.admitted.base.comparison.binding.models
      comparison.admitted.base.comparison.packet.packet.readout.contract
      comparison.admitted.instrumentSupport
      comparison.admitted.base.comparison.binding.hshStates.value
      comparison.admitted.base.comparison.binding.standardStates.value :=
  comparison.admitted.robustSeparation

/-- As in the weaker source-declared relation wrapper, robust two-sided
    separation implies exact nominal detector-level separation. -/
theorem nominallyGroundedSupport_implies_nominalSeparation
    (comparison :
      NominallyGroundedInstrumentSupportRobustComparison
        HState SState HField SField CommonField Payload) :
    heterogeneousDetectorLevelTwoSidedSeparation
      comparison.admitted.base.comparison.binding.models
      comparison.admitted.base.comparison.packet.packet.readout.contract
      comparison.admitted.base.comparison.binding.hshStates.value
      comparison.admitted.base.comparison.binding.standardStates.value :=
  instrumentSupportRobustAdmission_implies_nominalSeparation
    comparison.admitted

#print axioms nominallyGroundedSupport_nonempty_at_nominal
#print axioms nominallyGroundedSupport_has_source_artifact_binding
#print axioms nominallyGroundedSupport_has_source_digest_binding
#print axioms nominallyGroundedSupport_has_readout_identity
#print axioms nominallyGroundedSupport_preserves_precommittedEvidence
#print axioms nominallyGroundedSupport_preserves_robustSeparation
#print axioms nominallyGroundedSupport_implies_nominalSeparation

end HsHVerification.InstrumentSupportRobustSeparation
