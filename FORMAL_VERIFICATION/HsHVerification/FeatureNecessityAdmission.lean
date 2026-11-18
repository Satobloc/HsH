import HsHVerification.ThreeModelContrast

namespace HsHVerification.FeatureNecessityAdmission

open HsHVerification.ThreeModelContrast

/-- Inputs to a feature-necessity assessment within one declared comparison.
    These status fields are external evidence inputs; Lean does not authenticate
    the underlying source, data, calibration, or reviewer. -/
structure Inputs where
  core : Witness
  feature : Witness
  sourceAdmissible : Outcome
  representationValid : Outcome
  identifiable : Outcome
  ablationValid : Outcome
  sharedParametersMatched : Outcome
  untouchedHoldout : Outcome
  covarianceComplete : Outcome
  decisionRuleFrozen : Outcome
deriving Repr

/-- A feature may be called empirically necessary *within the declared freeze*
    only when all non-compensatory prerequisites pass, the ablation is valid,
    the core fails while the feature model passes, and the models are distinct
    under the same exact comparison freeze. This is not independent replication
    or theory-level promotion. -/
def admissibleWithinFreeze (e : Inputs) : Prop :=
  e.sourceAdmissible = .pass ∧
  e.representationValid = .pass ∧
  e.identifiable = .pass ∧
  e.ablationValid = .pass ∧
  e.sharedParametersMatched = .pass ∧
  e.untouchedHoldout = .pass ∧
  e.covarianceComplete = .pass ∧
  e.decisionRuleFrozen = .pass ∧
  e.core.freeze = e.feature.freeze ∧
  modelVersion e.core.freeze e.core.model ≠
    modelVersion e.feature.freeze e.feature.model ∧
  e.core.model = .core ∧
  e.feature.model = .feature ∧
  e.core.outcome = .fail ∧
  e.feature.outcome = .pass

/-- The admitted feature-necessity claim entails a binary contrast under the
    exact same freeze. -/
theorem admissibleWithinFreeze_implies_binary_feature_contrast
    (e : Inputs) (h : admissibleWithinFreeze e) :
    contrast e.core e.feature = some true := by
  rcases h with
    ⟨hSource, hRepresentation, hIdentifiable, hAblation, hShared,
      hHoldout, hCovariance, hDecision, hFreeze, hVersions,
      hCoreModel, hFeatureModel, hCore, hFeature⟩
  simp [contrast, hFreeze, hVersions, hCore, hFeature]

/-- An outcome contrast alone is insufficient: the abstract example has
    different core/feature outcomes, but its evidence prerequisites are
    unscorable. This is a logical counterexample, not a physical fixture. -/
def exampleFreeze : Freeze where
  sourceSnapshot := "source"
  candidate := "candidate"
  standardVersion := "H0"
  coreVersion := "H1"
  featureVersion := "H1+f"
  datasetVersion := "dataset"
  observationMapVersion := "map"
  analysisVersion := "analysis"
  calibrationVersion := "calibration"
  covarianceVersion := "covariance"
  holdoutVersion := "holdout"
  decisionRuleVersion := "rule"

def exampleCore : Witness :=
  ⟨exampleFreeze, .core, .fail⟩

def exampleFeature : Witness :=
  ⟨exampleFreeze, .feature, .pass⟩

def contrastOnlyExample : Inputs where
  core := exampleCore
  feature := exampleFeature
  sourceAdmissible := .unscorable
  representationValid := .unscorable
  identifiable := .unscorable
  ablationValid := .unscorable
  sharedParametersMatched := .unscorable
  untouchedHoldout := .unscorable
  covarianceComplete := .unscorable
  decisionRuleFrozen := .unscorable

theorem outcome_contrast_alone_does_not_admit_feature_necessity :
    contrast exampleCore exampleFeature = some true ∧
    ¬ admissibleWithinFreeze contrastOnlyExample := by
  constructor
  · simp [contrast, modelVersion, exampleCore, exampleFeature, exampleFreeze]
  · intro h
    have hSource := h.1
    simp [contrastOnlyExample] at hSource

#print axioms admissibleWithinFreeze_implies_binary_feature_contrast
#print axioms outcome_contrast_alone_does_not_admit_feature_necessity

end HsHVerification.FeatureNecessityAdmission
