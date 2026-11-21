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


/-!
## Linearized nuisance-span identifiability

This section gives one concrete mathematical realization of the external
identifiableAfterNuisance obligation in Candidate, but only for a specified
linearized additive-response model. The map A must include the standard-model
and all admitted nuisance-response directions; v is one candidate extension
direction. A nonzero quotient class means the candidate direction cannot be
absorbed by those directions.

This is structural identifiability, not statistical detectability. It does
not supply A, v, a physical forward map, a covariance matrix, a calibration,
or a numerical falsification threshold. Nonlinear models require a justified
local linearization or a separate global argument.
-/

section LinearizedNuisanceIdentifiability

variable {Y Θ : Type*} [AddCommGroup Y] [Module ℝ Y]

/-- The standard-model and nuisance responses are collected in A; the
    candidate extension contributes one scalar response direction v. -/
def nuisanceAdjustedResponse
    (A : Θ →ₗ[ℝ] Y) (v : Y) (θ : Θ) (α : ℝ) : Y :=
  A θ + α • v

/-- The candidate coefficient is identifiable when equal outputs force equal
    candidate coefficients, even while the nuisance parameter may change. -/
def coefficientIdentifiableAfterNuisance
    (A : Θ →ₗ[ℝ] Y) (v : Y) : Prop :=
  ∀ θ₁ θ₂ : Θ, ∀ α₁ α₂ : ℝ,
    nuisanceAdjustedResponse A v θ₁ α₁ =
      nuisanceAdjustedResponse A v θ₂ α₂ →
    α₁ = α₂

/-- A nonzero scalar multiple of v lies in the nuisance range only if v does. -/
theorem responseDirection_mem_range_of_nonzero_smul
    (A : Θ →ₗ[ℝ] Y) (v : Y) (s : ℝ) (hs : s ≠ 0)
    (x : Θ) (hx : s • v = A x) :
    v ∈ LinearMap.range A := by
  refine ⟨s⁻¹ • x, ?_⟩
  calc
    A (s⁻¹ • x) = s⁻¹ • A x := by rw [map_smul]
    _ = s⁻¹ • (s • v) := by rw [hx]
    _ = v := by simp [hs]

/-- In a linear additive readout, the candidate coefficient is identifiable
    exactly when its response direction is outside the range of every
    standard-model and nuisance-response direction. -/
theorem coefficientIdentifiableAfterNuisance_iff_response_outside_range
    (A : Θ →ₗ[ℝ] Y) (v : Y) :
    coefficientIdentifiableAfterNuisance A v ↔
      v ∉ LinearMap.range A := by
  constructor
  · intro h hv
    rcases hv with ⟨x, hx⟩
    have heq :
        nuisanceAdjustedResponse A v (0 : Θ) 1 =
          nuisanceAdjustedResponse A v x 0 := by
      simp [nuisanceAdjustedResponse, hx]
    have hcoeff := h (0 : Θ) x 1 0 heq
    norm_num at hcoeff
  · intro hv θ₁ θ₂ α₁ α₂ heq
    by_contra hne
    have hdiff : (α₁ - α₂) • v = A (θ₂ - θ₁) := by
      dsimp [nuisanceAdjustedResponse] at heq
      calc
        (α₁ - α₂) • v = α₁ • v - α₂ • v := by rw [sub_smul]
        _ = (A θ₂ + α₂ • v) - (A θ₁ + α₂ • v) := by
          rw [← heq]
          abel
        _ = A θ₂ - A θ₁ := by abel
        _ = A (θ₂ - θ₁) := by rw [map_sub]
    exact hv (responseDirection_mem_range_of_nonzero_smul A v
      (α₁ - α₂) (sub_ne_zero.mpr hne) (θ₂ - θ₁) hdiff)

/-- The explicit projection that quotients measurement space by the span of
    standard-model and nuisance responses. -/
def nuisanceQuotientReadout
    (A : Θ →ₗ[ℝ] Y) :
    Y →ₗ[ℝ] Y ⧸ LinearMap.range A :=
  Submodule.mkQ (LinearMap.range A)

/-- The quotient readout vanishes exactly for response directions absorbed by
    the standard-model and nuisance-response range. -/
theorem nuisanceQuotientReadout_eq_zero_iff
    (A : Θ →ₗ[ℝ] Y) (v : Y) :
    nuisanceQuotientReadout A v = 0 ↔
      v ∈ LinearMap.range A := by
  change (Submodule.Quotient.mk v :
    Y ⧸ LinearMap.range A) = 0 ↔
      v ∈ LinearMap.range A
  exact Submodule.Quotient.mk_eq_zero (LinearMap.range A)

/-- The candidate coefficient is identifiable exactly when its class in the
    nuisance quotient is nonzero. This quotient is the explicit residual
    space in which a genuinely new linearized response must survive. -/
theorem coefficientIdentifiableAfterNuisance_iff_quotient_nonzero
    (A : Θ →ₗ[ℝ] Y) (v : Y) :
    coefficientIdentifiableAfterNuisance A v ↔
      nuisanceQuotientReadout A v ≠ 0 := by
  rw [coefficientIdentifiableAfterNuisance_iff_response_outside_range]
  constructor
  · intro hv hzero
    exact hv ((nuisanceQuotientReadout_eq_zero_iff A v).mp hzero)
  · intro hnonzero hmem
    exact hnonzero ((nuisanceQuotientReadout_eq_zero_iff A v).mpr hmem)

/-- An invertible change of readout coordinates preserves membership in the
    standard-plus-nuisance response range, and therefore preserves structural
    identifiability. It does not preserve a covariance norm or a statistical
    detection threshold automatically. -/
theorem responseOutsideRange_invariant_under_linearEquiv
    (W : Y ≃ₗ[ℝ] Y) (A : Θ →ₗ[ℝ] Y) (v : Y) :
    v ∉ LinearMap.range A ↔
      W v ∉ LinearMap.range (W.toLinearMap.comp A) := by
  constructor
  · intro hv hmem
    rcases hmem with ⟨θ, hθ⟩
    apply hv
    refine ⟨θ, ?_⟩
    apply W.injective
    simpa [LinearMap.comp_apply] using hθ
  · intro hv hmem
    rcases hmem with ⟨θ, hθ⟩
    apply hv
    refine ⟨θ, ?_⟩
    have hW := congrArg W.toLinearMap hmem
    simpa [LinearMap.comp_apply] using hW

/-- Structural identifiability is invariant under an invertible linear
    reparameterization of the measured readout coordinates. -/
theorem coefficientIdentifiableAfterNuisance_invariant_under_linearEquiv
    (W : Y ≃ₗ[ℝ] Y) (A : Θ →ₗ[ℝ] Y) (v : Y) :
    coefficientIdentifiableAfterNuisance A v ↔
      coefficientIdentifiableAfterNuisance (W.toLinearMap.comp A) (W v) := by
  rw [coefficientIdentifiableAfterNuisance_iff_response_outside_range,
    coefficientIdentifiableAfterNuisance_iff_response_outside_range]
  exact responseOutsideRange_invariant_under_linearEquiv W A v

#print axioms responseDirection_mem_range_of_nonzero_smul
#print axioms coefficientIdentifiableAfterNuisance_iff_response_outside_range
#print axioms nuisanceQuotientReadout_eq_zero_iff
#print axioms coefficientIdentifiableAfterNuisance_iff_quotient_nonzero
#print axioms responseOutsideRange_invariant_under_linearEquiv
#print axioms coefficientIdentifiableAfterNuisance_invariant_under_linearEquiv

end LinearizedNuisanceIdentifiability
