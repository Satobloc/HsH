import Mathlib

/-!
Three-model comparison architecture, assistant-authored 2026-11-18.

The freeze identity binds source/candidate, model versions, data, observation map,
calibration, covariance, holdout, analysis, and decision-rule versions. A comparison
is unavailable when identities differ, model versions coincide, or an outcome is
unscorable.

This is an abstract workflow theorem only. It supplies no physical fixture, data,
statistical threshold, H(s)H prediction, or empirical evidence.
-/

namespace HsHVerification.ThreeModelContrast

inductive Outcome where
  | pass
  | fail
  | unscorable
deriving DecidableEq, Repr

inductive Model where
  | standard
  | core
  | feature
deriving DecidableEq, Repr

/-- Immutable comparison identity for the three-model test family. -/
structure Freeze where
  sourceSnapshot : String
  candidate : String
  standardVersion : String
  coreVersion : String
  featureVersion : String
  datasetVersion : String
  observationMapVersion : String
  analysisVersion : String
  calibrationVersion : String
  covarianceVersion : String
  holdoutVersion : String
  decisionRuleVersion : String
deriving DecidableEq, Repr

def modelVersion (f : Freeze) (m : Model) : String :=
  match m with
  | .standard => f.standardVersion
  | .core => f.coreVersion
  | .feature => f.featureVersion

structure Witness where
  freeze : Freeze
  model : Model
  outcome : Outcome
deriving Repr

/-- A scored pair is comparable only under the same exact freeze and distinct
    model versions. An absent result means no binary contrast is admissible. -/
def contrast (a b : Witness) : Option Bool :=
  if hFreeze : a.freeze = b.freeze then
    if hModel : modelVersion a.freeze a.model = modelVersion b.freeze b.model then
      none
    else
      match a.outcome, b.outcome with
      | .pass, .pass => some false
      | .fail, .fail => some false
      | .pass, .fail => some true
      | .fail, .pass => some true
      | _, _ => none
  else
    none

/-- Cross-freeze evidence cannot be combined into a binary contrast. -/
theorem different_freezes_are_unscorable
    (a b : Witness) (h : a.freeze ≠ b.freeze) :
    contrast a b = none := by
  simp [contrast, h]

/-- Unscorable outcomes do not yield binary comparisons, even within one freeze. -/
theorem unscorable_is_not_binary
    (f : Freeze) (m n : Model)
    (h : modelVersion f m ≠ modelVersion f n) :
    contrast ⟨f, m, .unscorable⟩ ⟨f, n, .pass⟩ = none := by
  simp [contrast, h]

/-- A feature-specific outcome contrast can occur without a core-vs-standard
    contrast. The core and standard both pass; the feature-augmented model fails. -/
theorem feature_contrast_without_framework_contrast
    (f : Freeze)
    (hCF : f.coreVersion ≠ f.featureVersion)
    (hSC : f.standardVersion ≠ f.coreVersion) :
    contrast ⟨f, .core, .pass⟩ ⟨f, .feature, .fail⟩ = some true ∧
    contrast ⟨f, .standard, .pass⟩ ⟨f, .core, .pass⟩ = some false := by
  simp [contrast, modelVersion, hCF, hSC]

/-- A core-vs-standard outcome contrast can occur without a feature-specific
    contrast. The core and feature-augmented models both fail. -/
theorem framework_contrast_without_feature_contrast
    (f : Freeze)
    (hSC : f.standardVersion ≠ f.coreVersion)
    (hCF : f.coreVersion ≠ f.featureVersion) :
    contrast ⟨f, .standard, .pass⟩ ⟨f, .core, .fail⟩ = some true ∧
    contrast ⟨f, .core, .fail⟩ ⟨f, .feature, .fail⟩ = some false := by
  simp [contrast, modelVersion, hSC, hCF]

end HsHVerification.ThreeModelContrast
