import Mathlib

namespace HsHVerification.ModelSelectionPreference

/-!
# Non-compensatory intelligibility preference

This is an assistant-proposed workflow contract derived from the 2026-11-08
methodological preference for human-graspable geometric models. It is not a
Nathan Direct theorem and it is not a physical model.

The hard-gate propositions are external evidence obligations. They must be
established from source-authorized maps, an identified evaluation system,
versioned/provenanced data, declared measurement scales and units, an
uncertainty model, a matched standard comparator, nuisance-adjusted
identifiability, frozen shared parameters, an authenticated acquisition-unit
map, a holdout partition that respects that map, an untouched/unrefitted
holdout, and a prediction/falsification protocol frozen before holdout access.

The acquisition-unit distinction is deliberate: a Lean theorem can show that
fold assignment factors through a declared unit map, but it cannot authenticate
that the map corresponds to real independent acquisitions. Likewise, a
predeclared threshold must be justified from the real uncertainty model; this
module supplies neither a numerical threshold nor a physical prediction.

The empirical-equivalence and human-preference relations are also inputs.
This module proves only that an intelligibility preference is admitted as a
tie-break after the hard gates, and cannot rescue a candidate that fails them.
-/

/-- A componentwise complexity ledger. It is deliberately a vector, not a
    weighted scalar: no arbitrary exchange rate is assigned between new
    primitives, free functions, parameters, boundary conditions, retuning,
    discrepancy freedom, and external priors. -/
structure ComplexityFootprint where
  addedPrimitives : Nat
  unconstrainedFunctions : Nat
  freeParameters : Nat
  unconstrainedBoundaryConditions : Nat
  channelSpecificRetunings : Nat
  discrepancyDegrees : Nat
  externalPriors : Nat
deriving DecidableEq, Repr

/-- Componentwise no-greater complexity. -/
def noMoreComplex (a b : ComplexityFootprint) : Prop :=
  a.addedPrimitives ≤ b.addedPrimitives ∧
  a.unconstrainedFunctions ≤ b.unconstrainedFunctions ∧
  a.freeParameters ≤ b.freeParameters ∧
  a.unconstrainedBoundaryConditions ≤ b.unconstrainedBoundaryConditions ∧
  a.channelSpecificRetunings ≤ b.channelSpecificRetunings ∧
  a.discrepancyDegrees ≤ b.discrepancyDegrees ∧
  a.externalPriors ≤ b.externalPriors

/-- External evidence packet. For physical systems, the declared units must
    be physical units; the abstract contract also permits nonphysical
    empirical domains such as recorded model evaluations. -/
structure MeasurementEvidence where
  targetSystemIdentified : Prop
  datasetVersionedAndProvenanced : Prop
  measurementScaleAndUnitsDeclared : Prop
  uncertaintyModelDeclared : Prop

/-- Holdout integrity is split into the real-world unit-map authentication
    obligation and the formal fold-consistency obligation. The latter is
    compatible with Calder's factorization theorem; it does not prove the
    former or statistical independence by itself. -/
structure HoldoutProtocol where
  acquisitionUnitMapAuthenticated : Prop
  partitionRespectsAcquisitionUnits : Prop
  holdoutUntouched : Prop
  holdoutUnrefitted : Prop
  independentHoldoutPasses : Prop

/-- A prediction must be specified before the holdout is opened, and its
    falsification rule/threshold must be justified by the declared uncertainty
    model rather than selected after seeing the residuals. -/
structure PredictionProtocol where
  predictedObservableDeclared : Prop
  predictionFrozenBeforeHoldout : Prop
  falsificationRulePredeclared : Prop
  thresholdJustifiedByUncertainty : Prop

/-- A candidate model plus the external evidence obligations required before
    an intelligibility preference can affect model selection. -/
structure Candidate where
  sourceAdmissible : Prop
  mapsDefinedAndComposable : Prop
  measurement : MeasurementEvidence
  matchedStandardComparator : Prop
  identifiableAfterNuisance : Prop
  sharedParametersFrozen : Prop
  holdout : HoldoutProtocol
  prediction : PredictionProtocol
  complexity : ComplexityFootprint

/-- The non-compensatory evidence gate. Each field is a proposition to be
    established outside Lean from the relevant source and measured system. -/
def hardGate (c : Candidate) : Prop :=
  c.sourceAdmissible ∧
  c.mapsDefinedAndComposable ∧
  c.measurement.targetSystemIdentified ∧
  c.measurement.datasetVersionedAndProvenanced ∧
  c.measurement.measurementScaleAndUnitsDeclared ∧
  c.measurement.uncertaintyModelDeclared ∧
  c.matchedStandardComparator ∧
  c.identifiableAfterNuisance ∧
  c.sharedParametersFrozen ∧
  c.holdout.acquisitionUnitMapAuthenticated ∧
  c.holdout.partitionRespectsAcquisitionUnits ∧
  c.holdout.holdoutUntouched ∧
  c.holdout.holdoutUnrefitted ∧
  c.holdout.independentHoldoutPasses ∧
  c.prediction.predictedObservableDeclared ∧
  c.prediction.predictionFrozenBeforeHoldout ∧
  c.prediction.falsificationRulePredeclared ∧
  c.prediction.thresholdJustifiedByUncertainty

/-- The hard gate exposes every data, unit-lineage, holdout, prediction, and
    falsification obligation. These are inputs, not facts established by
    this theorem. -/
theorem hardGate_requires_measurement_holdout_prediction_evidence
    (c : Candidate) (h : hardGate c) :
    c.measurement.targetSystemIdentified ∧
    c.measurement.datasetVersionedAndProvenanced ∧
    c.measurement.measurementScaleAndUnitsDeclared ∧
    c.measurement.uncertaintyModelDeclared ∧
    c.holdout.acquisitionUnitMapAuthenticated ∧
    c.holdout.partitionRespectsAcquisitionUnits ∧
    c.holdout.holdoutUntouched ∧
    c.holdout.holdoutUnrefitted ∧
    c.holdout.independentHoldoutPasses ∧
    c.prediction.predictedObservableDeclared ∧
    c.prediction.predictionFrozenBeforeHoldout ∧
    c.prediction.falsificationRulePredeclared ∧
    c.prediction.thresholdJustifiedByUncertainty := by
  rcases h with ⟨_, _, hsys, hdata, hscale, hunc, _, _, _, hunit, hpartition,
    huntouched, hnoRefit, hpass, hobs, hpred, hrule, hthreshold⟩
  exact ⟨hsys, hdata, hscale, hunc, hunit, hpartition, huntouched, hnoRefit,
    hpass, hobs, hpred, hrule, hthreshold⟩

/-- Intelligibility is allowed to select between empirically equivalent,
    hard-gate-passing candidates only when the preferred candidate is no more
    complex componentwise. The two relations are supplied by human/source
    review and real-data evaluation; they are not computed by this theorem. -/
def intelligibilityTieBreak
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : Candidate) : Prop :=
  hardGate a ∧
  hardGate b ∧
  empiricallyEquivalent a b ∧
  humanPrefers a b ∧
  noMoreComplex a.complexity b.complexity

theorem tieBreak_requires_both_hard_gates
    (equivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : Candidate)
    (h : intelligibilityTieBreak equivalent humanPrefers a b) :
    hardGate a ∧ hardGate b := ⟨h.1, h.2.1⟩

theorem tieBreak_requires_empirical_equivalence
    (equivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : Candidate)
    (h : intelligibilityTieBreak equivalent humanPrefers a b) :
    equivalent a b := h.2.2.1

theorem tieBreak_requires_no_greater_complexity
    (equivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : Candidate)
    (h : intelligibilityTieBreak equivalent humanPrefers a b) :
    noMoreComplex a.complexity b.complexity := h.2.2.2.2

theorem intelligibility_cannot_rescue_failed_candidate
    (equivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : Candidate)
    (hfail : ¬ hardGate a) :
    ¬ intelligibilityTieBreak equivalent humanPrefers a b := by
  intro h
  exact hfail h.1

#print axioms hardGate_requires_measurement_holdout_prediction_evidence
#print axioms tieBreak_requires_both_hard_gates
#print axioms tieBreak_requires_empirical_equivalence
#print axioms tieBreak_requires_no_greater_complexity
#print axioms intelligibility_cannot_rescue_failed_candidate

end HsHVerification.ModelSelectionPreference
