import Mathlib
import HsHVerification.AriadneClaimScopedLineage

/-!
# Ariadne: P2 evidence axes and the partial source-lineage projection

This module makes one existing P2 workflow boundary explicit in Lean:
claim/source lineage is one evidence axis, not a substitute for acquisition,
holdout, covariance, or independent-replication evidence.

The source-lineage projection is deliberately partial. It preserves the
claim-scoped content/origin record and leaves every other P2 axis unknown.
It must not synthesize acquisition IDs, instrument/calibration relations,
analysis/prior relations, covariance, holdout exposure, or replication status.

The acquisition-level replication gate requires an authenticated acquisition
unit map, a distinct new acquisition, a known event/system relation, an
untouched holdout, and a prediction frozen before access. Covariance accounting
is an additional requirement for a valid replication assessment. Instrument/
calibration and analysis/prior relations remain separately reported; this
gate does not silently call them independent.

Cross-channel consistency and readout identifiability are separate outputs.
Agreement among channels of one event/system is not, by itself, a new
acquisition. A structurally identifiable readout is not, by itself, a
replication.

This is a type-level workflow contract. It instantiates no P2 system, dataset,
physical map, fit, prediction, or numerical threshold. The propositions carried
by external evidence records remain external inputs. Lean does not authenticate
those records or prove physical independence.
-/

namespace HsHVerification.AriadneP2EvidenceAxes

open HsHVerification.AriadneClaimScopedLineage

inductive ReadoutIdentifiability
  | identifiable
  | nonidentifiable
  | unknown
  | notApplicable
  deriving DecidableEq, Repr

inductive AcquisitionUnitMapStatus
  | authenticated
  | unauthenticated
  | unknown
  | notApplicable
  deriving DecidableEq, Repr

inductive AcquisitionRelation
  | sameAcquisition
  | distinctNewAcquisition
  | unknown
  | notApplicable
  deriving DecidableEq, Repr

inductive EventSystemRelation
  | sameEventOrSystem
  | distinctEventOrSystem
  | unknown
  | notApplicable
  deriving DecidableEq, Repr

inductive DependencyRelation
  | independent
  | shared
  | mixed
  | unknown
  | notApplicable
  deriving DecidableEq, Repr

inductive CovarianceAccounting
  | accountedFor
  | notAccountedFor
  | unknown
  | notApplicable
  deriving DecidableEq, Repr

inductive HoldoutAccess
  | untouched
  | exposed
  | unknown
  | notApplicable
  deriving DecidableEq, Repr

inductive PredictionFreeze
  | frozenBeforeAccess
  | frozenAfterAccess
  | unknown
  | notApplicable
  deriving DecidableEq, Repr

inductive CrossChannelConsistency
  | consistent
  | inconsistent
  | unknown
  | notApplicable
  deriving DecidableEq, Repr

/-- Layer-resolved P2 evidence profile. These axes are not collapsed into
    one Boolean or inferred from file/publication/channel counts. -/
structure P2IndependenceVector where
  sourceLineage : ClaimLineageAxes
  readoutIdentifiability : ReadoutIdentifiability
  acquisitionUnitMap : AcquisitionUnitMapStatus
  acquisitionRelation : AcquisitionRelation
  eventSystemRelation : EventSystemRelation
  instrumentCalibrationRelation : DependencyRelation
  analysisPriorRelation : DependencyRelation
  covarianceAccounting : CovarianceAccounting
  holdoutAccess : HoldoutAccess
  predictionFreeze : PredictionFreeze
  crossChannelConsistency : CrossChannelConsistency
  deriving DecidableEq, Repr

/-- The only justified projection from ClaimLineageAxes into the P2 vector.
    Every non-source axis remains unknown until its own evidence is supplied. -/
def sourceLineageOnlyProjection (lineage : ClaimLineageAxes) :
    P2IndependenceVector :=
  { sourceLineage := lineage
    readoutIdentifiability := .unknown
    acquisitionUnitMap := .unknown
    acquisitionRelation := .unknown
    eventSystemRelation := .unknown
    instrumentCalibrationRelation := .unknown
    analysisPriorRelation := .unknown
    covarianceAccounting := .unknown
    holdoutAccess := .unknown
    predictionFreeze := .unknown
    crossChannelConsistency := .unknown }

/-- A new acquisition can be a replication of the same physical system.
    The system/event relation must nevertheless be known, not guessed. -/
def independentAcquisitionReplication (v : P2IndependenceVector) : Prop :=
  v.acquisitionUnitMap = .authenticated ∧
  v.acquisitionRelation = .distinctNewAcquisition ∧
  (v.eventSystemRelation = .sameEventOrSystem ∨
    v.eventSystemRelation = .distinctEventOrSystem) ∧
  v.holdoutAccess = .untouched ∧
  v.predictionFreeze = .frozenBeforeAccess

/-- Covariance must be accounted for before the replication outcome is
    statistically adjudicated. This is stricter than merely identifying a
    new acquisition. -/
def replicationAssessmentReady (v : P2IndependenceVector) : Prop :=
  independentAcquisitionReplication v ∧
  v.covarianceAccounting = .accountedFor

/-- Cross-channel agreement is a separate observation about readouts; it does
    not manufacture an acquisition-level replication witness. -/
def crossChannelConsistencyOnly (lineage : ClaimLineageAxes) :
    P2IndependenceVector :=
  { sourceLineageOnlyProjection lineage with
    crossChannelConsistency := .consistent }

/-- Readout identifiability is likewise orthogonal to acquisition replication. -/
def readoutIdentifiabilityOnly (lineage : ClaimLineageAxes) :
    P2IndependenceVector :=
  { sourceLineageOnlyProjection lineage with
    readoutIdentifiability := .identifiable }

@[simp] theorem sourceLineageOnlyProjection_preserves_claim_lineage
    (lineage : ClaimLineageAxes) :
    (sourceLineageOnlyProjection lineage).sourceLineage = lineage := by
  rfl

@[simp] theorem sourceLineageOnlyProjection_leaves_acquisition_unknown
    (lineage : ClaimLineageAxes) :
    (sourceLineageOnlyProjection lineage).acquisitionUnitMap = .unknown ∧
    (sourceLineageOnlyProjection lineage).acquisitionRelation = .unknown := by
  exact ⟨rfl, rfl⟩

@[simp] theorem sourceLineageOnlyProjection_leaves_holdout_unknown
    (lineage : ClaimLineageAxes) :
    (sourceLineageOnlyProjection lineage).holdoutAccess = .unknown ∧
    (sourceLineageOnlyProjection lineage).predictionFreeze = .unknown := by
  exact ⟨rfl, rfl⟩

/-- A claim-lineage record, even one with disjoint primary origins, cannot
    establish acquisition-level replication through the partial projection. -/
theorem source_lineage_projection_does_not_establish_replication
    (lineage : ClaimLineageAxes) :
    ¬ independentAcquisitionReplication (sourceLineageOnlyProjection lineage) := by
  simp [independentAcquisitionReplication, sourceLineageOnlyProjection]

/-- A consistent multi-channel readout alone still lacks the new-acquisition,
    authenticated-unit, untouched-holdout, and pre-access-freeze evidence. -/
theorem cross_channel_consistency_alone_does_not_establish_replication
    (lineage : ClaimLineageAxes) :
    ¬ independentAcquisitionReplication (crossChannelConsistencyOnly lineage) := by
  simp [independentAcquisitionReplication, crossChannelConsistencyOnly,
    sourceLineageOnlyProjection]

/-- A uniquely identifiable readout alone does not establish replication. -/
theorem readout_identifiability_alone_does_not_establish_replication
    (lineage : ClaimLineageAxes) :
    ¬ independentAcquisitionReplication (readoutIdentifiabilityOnly lineage) := by
  simp [independentAcquisitionReplication, readoutIdentifiabilityOnly,
    sourceLineageOnlyProjection]

theorem replication_requires_authenticated_acquisition_units
    (v : P2IndependenceVector)
    (h : independentAcquisitionReplication v) :
    v.acquisitionUnitMap = .authenticated := h.1

theorem replication_requires_new_acquisition
    (v : P2IndependenceVector)
    (h : independentAcquisitionReplication v) :
    v.acquisitionRelation = .distinctNewAcquisition := h.2.1

theorem replication_requires_known_event_system_relation
    (v : P2IndependenceVector)
    (h : independentAcquisitionReplication v) :
    v.eventSystemRelation = .sameEventOrSystem ∨
      v.eventSystemRelation = .distinctEventOrSystem := h.2.2.1

theorem replication_requires_untouched_holdout
    (v : P2IndependenceVector)
    (h : independentAcquisitionReplication v) :
    v.holdoutAccess = .untouched := h.2.2.2.1

theorem replication_requires_prediction_frozen_before_access
    (v : P2IndependenceVector)
    (h : independentAcquisitionReplication v) :
    v.predictionFreeze = .frozenBeforeAccess := h.2.2.2.2

theorem replication_assessment_requires_covariance_accounting
    (v : P2IndependenceVector)
    (h : replicationAssessmentReady v) :
    v.covarianceAccounting = .accountedFor := h.2

/-- Instrument/calibration dependence remains a separately reported axis;
    changing that label does not rewrite the acquisition-level gate. -/
theorem acquisition_replication_gate_orthogonal_to_instrument_relation
    (v : P2IndependenceVector) (r : DependencyRelation) :
    independentAcquisitionReplication
      {v with instrumentCalibrationRelation := r} ↔
      independentAcquisitionReplication v := Iff.rfl

/-- Analysis/prior dependence remains a separately reported axis; changing
    that label does not rewrite the acquisition-level gate. -/
theorem acquisition_replication_gate_orthogonal_to_analysis_prior_relation
    (v : P2IndependenceVector) (r : DependencyRelation) :
    independentAcquisitionReplication
      {v with analysisPriorRelation := r} ↔
      independentAcquisitionReplication v := Iff.rfl

/-- Cross-channel consistency remains separate from new-acquisition status. -/
theorem acquisition_replication_gate_orthogonal_to_cross_channel_status
    (v : P2IndependenceVector) (s : CrossChannelConsistency) :
    independentAcquisitionReplication
      {v with crossChannelConsistency := s} ↔
      independentAcquisitionReplication v := Iff.rfl

#print axioms sourceLineageOnlyProjection_preserves_claim_lineage
#print axioms sourceLineageOnlyProjection_leaves_acquisition_unknown
#print axioms sourceLineageOnlyProjection_leaves_holdout_unknown
#print axioms source_lineage_projection_does_not_establish_replication
#print axioms cross_channel_consistency_alone_does_not_establish_replication
#print axioms readout_identifiability_alone_does_not_establish_replication
#print axioms replication_requires_authenticated_acquisition_units
#print axioms replication_requires_new_acquisition
#print axioms replication_requires_known_event_system_relation
#print axioms replication_requires_untouched_holdout
#print axioms replication_requires_prediction_frozen_before_access
#print axioms replication_assessment_requires_covariance_accounting
#print axioms acquisition_replication_gate_orthogonal_to_instrument_relation
#print axioms acquisition_replication_gate_orthogonal_to_analysis_prior_relation
#print axioms acquisition_replication_gate_orthogonal_to_cross_channel_status

end HsHVerification.AriadneP2EvidenceAxes
