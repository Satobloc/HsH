import Mathlib

/-!
# Comparison-freeze coherence specification

This module formalizes the P2 comparison-freeze invariant described in HsH
issue #1735 and Nadir h864:s3 Amendment 01. It is a specification-level
contract, not a production validator.

All String identifiers are opaque labels. This module does not compute or
verify SHA-256, authenticate repository artifacts, validate canonical
serialization, or prove that supplied verified=true fields are truthful.
Those remain implementation and evidence obligations outside this Lean model.
-/

namespace HsHVerification.NadirComparisonFreezeCoherence

abbrev FreezeId := String

inductive ModelSide where
  | h0
  | h1
  deriving DecidableEq, Repr

inductive EvidenceAxis where
  | empirical
  | discrimination
  | freeze
  | review
  deriving DecidableEq, Repr

/-- One immutable comparison manifest. Model versions are side-specific;
    the observation, calibration, covariance, comparator, analysis, decision,
    holdout and observable operator are shared by H0 and H1. -/
structure ComparisonFreeze where
  id : FreezeId
  canonicalManifestDigest : String
  sourceBundleId : String
  h0ModelFreezeId : String
  h1ModelFreezeId : String
  observationFreezeId : String
  instrumentCalibrationId : String
  uncertaintyCovarianceId : String
  sharedParameterManifestId : String
  comparatorFreezeId : String
  analysisPlanFreezeId : String
  decisionRuleId : String
  holdoutPartitionId : String
  observableOperatorId : String
  deriving DecidableEq, Repr

def modelFreezeFor (F : ComparisonFreeze) : ModelSide → String
  | .h0 => F.h0ModelFreezeId
  | .h1 => F.h1ModelFreezeId

/-- A receipt is bound to one comparison identity and one non-compensatory
    evidence axis. A changed freeze requires a new receipt. -/
structure EvidenceReceipt (F : ComparisonFreeze) (requiredAxis : EvidenceAxis) where
  comparisonFreezeId : FreezeId
  comparisonMatches : comparisonFreezeId = F.id
  witnessAxis : EvidenceAxis
  axisMatches : witnessAxis = requiredAxis
  artifactDigest : String
  artifactDigestPresent : artifactDigest ≠ ""
  verificationRun : String
  verificationRunPresent : verificationRun ≠ ""
  methodVersion : String
  methodVersionPresent : methodVersion ≠ ""
  verified : Bool
  verifiedTrue : verified = true

/-- The freeze witness binds the canonical manifest digest and canonicalizer
    version to the same comparison ID. Digest computation and authenticity
    are external obligations, not proved here. -/
structure ComparisonFreezeWitness (F : ComparisonFreeze) where
  comparisonFreezeId : FreezeId
  comparisonMatches : comparisonFreezeId = F.id
  manifestDigest : String
  digestMatches : manifestDigest = F.canonicalManifestDigest
  canonicalizationVersion : String
  canonicalizationVersionPresent : canonicalizationVersion ≠ ""
  verificationRun : String
  verificationRunPresent : verificationRun ≠ ""
  verified : Bool
  verifiedTrue : verified = true

/-- H0/H1 prediction receipts share every comparison condition except their
    explicitly side-specific model-freeze ID. -/
structure ModelPredictionReceipt (F : ComparisonFreeze) (side : ModelSide) where
  comparisonFreezeId : FreezeId
  comparisonMatches : comparisonFreezeId = F.id
  modelSide : ModelSide
  modelSideMatches : modelSide = side
  modelFreezeId : String
  modelFreezeMatches : modelFreezeId = modelFreezeFor F side
  observationFreezeId : String
  observationMatches : observationFreezeId = F.observationFreezeId
  instrumentCalibrationId : String
  calibrationMatches : instrumentCalibrationId = F.instrumentCalibrationId
  uncertaintyCovarianceId : String
  covarianceMatches : uncertaintyCovarianceId = F.uncertaintyCovarianceId
  sharedParameterManifestId : String
  sharedParametersMatch : sharedParameterManifestId = F.sharedParameterManifestId
  comparatorFreezeId : String
  comparatorMatches : comparatorFreezeId = F.comparatorFreezeId
  analysisPlanFreezeId : String
  analysisPlanMatches : analysisPlanFreezeId = F.analysisPlanFreezeId
  decisionRuleId : String
  decisionRuleMatches : decisionRuleId = F.decisionRuleId
  holdoutPartitionId : String
  holdoutMatches : holdoutPartitionId = F.holdoutPartitionId
  observableOperatorId : String
  observableMatches : observableOperatorId = F.observableOperatorId
  verified : Bool
  verifiedTrue : verified = true

/-- E, D, F and R are required together. R carries both paired predictions
    and the review receipt. -/
structure P2EvidenceBundle (F : ComparisonFreeze) where
  empirical : EvidenceReceipt F .empirical
  discrimination : EvidenceReceipt F .discrimination
  freeze : ComparisonFreezeWitness F
  review : EvidenceReceipt F .review
  h0 : ModelPredictionReceipt F .h0
  h1 : ModelPredictionReceipt F .h1

def p2Ready (F : ComparisonFreeze) : Prop :=
  Nonempty (P2EvidenceBundle F)

theorem p2_bundle_has_one_comparison_freeze
    {F : ComparisonFreeze} (b : P2EvidenceBundle F) :
    b.empirical.comparisonFreezeId = b.discrimination.comparisonFreezeId ∧
    b.empirical.comparisonFreezeId = b.freeze.comparisonFreezeId ∧
    b.empirical.comparisonFreezeId = b.review.comparisonFreezeId ∧
    b.empirical.comparisonFreezeId = b.h0.comparisonFreezeId ∧
    b.empirical.comparisonFreezeId = b.h1.comparisonFreezeId := by
  constructor
  · exact b.empirical.comparisonMatches.trans b.discrimination.comparisonMatches.symm
  constructor
  · exact b.empirical.comparisonMatches.trans b.freeze.comparisonMatches.symm
  constructor
  · exact b.empirical.comparisonMatches.trans b.review.comparisonMatches.symm
  constructor
  · exact b.empirical.comparisonMatches.trans b.h0.comparisonMatches.symm
  · exact b.empirical.comparisonMatches.trans b.h1.comparisonMatches.symm

theorem no_cross_freeze_receipt_reuse
    {F G : ComparisonFreeze} {axis : EvidenceAxis}
    (hDifferent : F.id ≠ G.id)
    (r : EvidenceReceipt F axis) :
    ¬ r.comparisonFreezeId = G.id := by
  intro hReuse
  exact hDifferent (r.comparisonMatches.symm.trans hReuse)

theorem paired_predictions_share_comparison_id
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.comparisonFreezeId = h1.comparisonFreezeId :=
  h0.comparisonMatches.trans h1.comparisonMatches.symm

theorem paired_predictions_share_observation
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.observationFreezeId = h1.observationFreezeId :=
  h0.observationMatches.trans h1.observationMatches.symm

theorem paired_predictions_share_calibration
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.instrumentCalibrationId = h1.instrumentCalibrationId :=
  h0.calibrationMatches.trans h1.calibrationMatches.symm

theorem paired_predictions_share_covariance
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.uncertaintyCovarianceId = h1.uncertaintyCovarianceId :=
  h0.covarianceMatches.trans h1.covarianceMatches.symm

theorem paired_predictions_share_parameters
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.sharedParameterManifestId = h1.sharedParameterManifestId :=
  h0.sharedParametersMatch.trans h1.sharedParametersMatch.symm

theorem paired_predictions_share_comparator
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.comparatorFreezeId = h1.comparatorFreezeId :=
  h0.comparatorMatches.trans h1.comparatorMatches.symm

theorem paired_predictions_share_analysis_plan
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.analysisPlanFreezeId = h1.analysisPlanFreezeId :=
  h0.analysisPlanMatches.trans h1.analysisPlanMatches.symm

theorem paired_predictions_share_decision_rule
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.decisionRuleId = h1.decisionRuleId :=
  h0.decisionRuleMatches.trans h1.decisionRuleMatches.symm

theorem paired_predictions_share_holdout
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.holdoutPartitionId = h1.holdoutPartitionId :=
  h0.holdoutMatches.trans h1.holdoutMatches.symm

theorem paired_predictions_share_observable_operator
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.observableOperatorId = h1.observableOperatorId :=
  h0.observableMatches.trans h1.observableMatches.symm

theorem paired_predictions_use_model_specific_freezes
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.modelFreezeId = F.h0ModelFreezeId ∧
    h1.modelFreezeId = F.h1ModelFreezeId := by
  exact ⟨h0.modelFreezeMatches, h1.modelFreezeMatches⟩

theorem paired_predictions_have_distinct_sides
    {F : ComparisonFreeze}
    (h0 : ModelPredictionReceipt F .h0)
    (h1 : ModelPredictionReceipt F .h1) :
    h0.modelSide ≠ h1.modelSide := by
  rw [h0.modelSideMatches, h1.modelSideMatches]
  decide

theorem p2_bundle_requires_all_four_axes
    {F : ComparisonFreeze} (b : P2EvidenceBundle F) :
    b.empirical.verified = true ∧
    b.discrimination.verified = true ∧
    b.freeze.verified = true ∧
    b.review.verified = true := by
  exact ⟨b.empirical.verifiedTrue, b.discrimination.verifiedTrue,
    b.freeze.verifiedTrue, b.review.verifiedTrue⟩

#print axioms p2_bundle_has_one_comparison_freeze
#print axioms no_cross_freeze_receipt_reuse
#print axioms paired_predictions_share_comparison_id
#print axioms paired_predictions_share_observation
#print axioms paired_predictions_share_calibration
#print axioms paired_predictions_share_covariance
#print axioms paired_predictions_share_parameters
#print axioms paired_predictions_share_comparator
#print axioms paired_predictions_share_analysis_plan
#print axioms paired_predictions_share_decision_rule
#print axioms paired_predictions_share_holdout
#print axioms paired_predictions_share_observable_operator
#print axioms paired_predictions_use_model_specific_freezes
#print axioms paired_predictions_have_distinct_sides
#print axioms p2_bundle_requires_all_four_axes

end HsHVerification.NadirComparisonFreezeCoherence
