import Mathlib
import HsHVerification.PrecommittedHoldoutAdmission

/-!
# Uncertainty-robust detector separation

The existing heterogeneous comparison tests exact detector-readout separation.
The readout contract declares that an uncertainty model exists, but an
existence flag alone does not say which observations remain possible around a
nominal detector value.

This module adds an opt-in, source-addressed, set-valued uncertainty envelope.
It applies one frozen envelope to both models after their distinct state and
field carriers have been projected into the same common carrier and passed
through the same detector operator.

The envelope is a possibility set, not a probability distribution, confidence
region, metric ball, covariance model, or coverage guarantee. Those semantics
must be supplied and independently checked by the source evidence. No
numerical or physical fixture is introduced.

Robust two-sided separation requires at least one H(s)H-possible observation
that is impossible under every standard-model envelope, and the symmetric
standard-exclusive observation. This is stronger than exact nominal
separation: robust separation implies exact separation, but the converse is
not claimed.

The typed wrapper binds the uncertainty evidence into the frozen candidate
family and permits only standard-reference or independent-measurement
authority classes. Lean does not authenticate those artifacts or prove that
they implement the supplied envelope function.
-/

namespace HsHVerification.UncertaintyRobustSeparation

open HsHVerification.EvidenceGatedAdmission
open HsHVerification.HeterogeneousReadoutFiberSeparation
open HsHVerification.ModelSelectionPreference
open HsHVerification.PrecommittedHoldoutAdmission
open HsHVerification.SharedReadoutFiberSeparation

universe uH uS uHF uSF uCF uP

variable {HState : Type uH} {SState : Type uS}
variable {HField : Type uHF} {SField : Type uSF}
variable {CommonField : Type uCF}
variable {Payload : MeasurementMode → Type uP}

/-- A source-addressed set-valued uncertainty model for one exact frozen
    detector-readout contract. The same possible-observation map is applied
    to both candidate models. Its interpretation and coverage semantics are
    source obligations, not consequences of this record. -/
structure FrozenObservationUncertainty
    (readout : FrozenCommonReadout CommonField Payload) where
  evidence : SourceEvidenceRecord
  semantics : NonEmptyText
  scope : NonEmptyText
  readoutDeclaration : readout.uncertaintyModelDeclared
  possibleObservations :
    Payload readout.mode → Set (Payload readout.mode)

/-- H(s)H observations reachable after expanding each nominal detector value
    by the frozen uncertainty model. -/
def hshUncertaintyExpandedPredictionRegion
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (uncertainty : FrozenObservationUncertainty readout)
    (hshStates : Set HState) : Set (Payload readout.mode) :=
  { observation | ∃ hshState ∈ hshStates,
      observation ∈ uncertainty.possibleObservations
        (hshDetectorReadoutMap models readout hshState) }

/-- Standard-model observations reachable under the same frozen uncertainty
    model and detector-readout contract. -/
def standardUncertaintyExpandedPredictionRegion
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (uncertainty : FrozenObservationUncertainty readout)
    (standardStates : Set SState) : Set (Payload readout.mode) :=
  { observation | ∃ standardState ∈ standardStates,
      observation ∈ uncertainty.possibleObservations
        (standardDetectorReadoutMap models readout standardState) }

/-- H(s)H-exclusive observations after uncertainty expansion. -/
def hshUncertaintyRobustExclusivePredictions
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (uncertainty : FrozenObservationUncertainty readout)
    (hshStates : Set HState) (standardStates : Set SState) :
    Set (Payload readout.mode) :=
  { observation |
      observation ∈ hshUncertaintyExpandedPredictionRegion
        models readout uncertainty hshStates ∧
      observation ∉ standardUncertaintyExpandedPredictionRegion
        models readout uncertainty standardStates }

/-- Standard-exclusive observations after uncertainty expansion. -/
def standardUncertaintyRobustExclusivePredictions
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (uncertainty : FrozenObservationUncertainty readout)
    (hshStates : Set HState) (standardStates : Set SState) :
    Set (Payload readout.mode) :=
  { observation |
      observation ∈ standardUncertaintyExpandedPredictionRegion
        models readout uncertainty standardStates ∧
      observation ∉ hshUncertaintyExpandedPredictionRegion
        models readout uncertainty hshStates }

/-- Two-sided robust separation requires exclusive outcomes that survive the
    declared uncertainty expansion in both directions. -/
def heterogeneousUncertaintyRobustTwoSidedSeparation
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (uncertainty : FrozenObservationUncertainty readout)
    (hshStates : Set HState) (standardStates : Set SState) : Prop :=
  (hshUncertaintyRobustExclusivePredictions
    models readout uncertainty hshStates standardStates).Nonempty ∧
  (standardUncertaintyRobustExclusivePredictions
    models readout uncertainty hshStates standardStates).Nonempty

/-- An H(s)H-exclusive uncertainty-expanded observation implies an exact
    nominal detector value that is outside every standard nominal readout.
    The same uncertainty map is essential to this implication. -/
theorem hshRobustExclusive_nonempty_implies_nominalExclusive
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (uncertainty : FrozenObservationUncertainty readout)
    (hshStates : Set HState) (standardStates : Set SState)
    (h :
      (hshUncertaintyRobustExclusivePredictions
        models readout uncertainty hshStates standardStates).Nonempty) :
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

/-- The symmetric implication for a standard-exclusive
    uncertainty-expanded observation. -/
theorem standardRobustExclusive_nonempty_implies_nominalExclusive
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (uncertainty : FrozenObservationUncertainty readout)
    (hshStates : Set HState) (standardStates : Set SState)
    (h :
      (standardUncertaintyRobustExclusivePredictions
        models readout uncertainty hshStates standardStates).Nonempty) :
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

/-- Robust two-sided separation necessarily entails the existing exact
    detector-level two-sided separation. The converse is not asserted. -/
theorem uncertaintyRobustSeparation_implies_nominalSeparation
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (uncertainty : FrozenObservationUncertainty readout)
    (hshStates : Set HState) (standardStates : Set SState)
    (h : heterogeneousUncertaintyRobustTwoSidedSeparation
      models readout uncertainty hshStates standardStates) :
    heterogeneousDetectorLevelTwoSidedSeparation
      models readout hshStates standardStates := by
  exact
    ⟨hshRobustExclusive_nonempty_implies_nominalExclusive
        models readout uncertainty hshStates standardStates h.1,
      standardRobustExclusive_nonempty_implies_nominalExclusive
        models readout uncertainty hshStates standardStates h.2⟩

/-- An empirical precommitted comparison with an explicit uncertainty
    envelope. The envelope's evidence must be present in the frozen candidate
    family, and its declared authority must be a standard reference or an
    independent measurement. The base wrapper still supplies the packet,
    candidate, common-carrier, detector, calibration, holdout and threshold
    bindings. -/
structure UncertaintyRobustPrecommittedComparison
    (HState : Type uH) (SState : Type uS)
    (HField : Type uHF) (SField : Type uSF)
    (CommonField : Type uCF)
    (Payload : MeasurementMode → Type uP) where
  base : PrecommittedHeterogeneousModelComparison
    HState SState HField SField CommonField Payload
  uncertainty : FrozenObservationUncertainty
    base.comparison.packet.packet.readout.contract
  uncertaintyEvidenceInFamily :
    uncertainty.evidence ∈ base.family.evidenceLineage
  uncertaintyEvidenceAuthority :
    uncertainty.evidence.authority = EvidenceAuthority.standardReference ∨
    uncertainty.evidence.authority = EvidenceAuthority.independentMeasurement
  robustSeparation :
    heterogeneousUncertaintyRobustTwoSidedSeparation
      base.comparison.binding.models
      base.comparison.packet.packet.readout.contract
      uncertainty
      base.comparison.binding.hshStates.value
      base.comparison.binding.standardStates.value

/-- The uncertainty-robust wrapper retains every existing precommitted
    candidate, source, readout, packet, calibration, holdout and outcome gate. -/
theorem uncertaintyRobustAdmission_preserves_precommittedEvidence
    (comparison : UncertaintyRobustPrecommittedComparison
      HState SState HField SField CommonField Payload) :
    PrecommittedComparisonEvidence comparison.base :=
  precommittedComparison_has_evidence comparison.base

/-- An admitted uncertainty-robust comparison necessarily retains the
    exact nominal two-sided detector separation as a weaker consequence. -/
theorem uncertaintyRobustAdmission_implies_nominalSeparation
    (comparison : UncertaintyRobustPrecommittedComparison
      HState SState HField SField CommonField Payload) :
    heterogeneousDetectorLevelTwoSidedSeparation
      comparison.base.comparison.binding.models
      comparison.base.comparison.packet.packet.readout.contract
      comparison.base.comparison.binding.hshStates.value
      comparison.base.comparison.binding.standardStates.value :=
  uncertaintyRobustSeparation_implies_nominalSeparation
    comparison.base.comparison.binding.models
    comparison.base.comparison.packet.packet.readout.contract
    comparison.uncertainty
    comparison.base.comparison.binding.hshStates.value
    comparison.base.comparison.binding.standardStates.value
    comparison.robustSeparation

/-- Two candidate tie-breaks share an uncertainty-evaluation context only
    when their precommitted contexts and the complete uncertainty records,
    including the set-valued functions, are identical. -/
def sameFrozenUncertaintyEvaluationContext
    (a b : UncertaintyRobustPrecommittedComparison
      HState SState HField SField CommonField Payload) : Prop :=
  sameFrozenEvaluationContext a.base b.base ∧
  a.uncertainty = b.uncertainty

/-- A robust tie-break requires both precommitted evidence records, the same
    frozen uncertainty model, and the existing empirical-equivalence,
    human-preference and complexity conditions. -/
def uncertaintyRobustIntelligibilityTieBreak
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : UncertaintyRobustPrecommittedComparison
      HState SState HField SField CommonField Payload) : Prop :=
  sameFrozenUncertaintyEvaluationContext a b ∧
  precommittedHeterogeneousIntelligibilityTieBreak
    empiricallyEquivalent humanPrefers a.base b.base

theorem uncertaintyRobustTieBreak_requires_same_uncertainty_model
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : UncertaintyRobustPrecommittedComparison
      HState SState HField SField CommonField Payload)
    (h : uncertaintyRobustIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    a.uncertainty = b.uncertainty :=
  h.1.2

theorem uncertaintyRobustTieBreak_requires_same_frozen_evaluation_context
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : UncertaintyRobustPrecommittedComparison
      HState SState HField SField CommonField Payload)
    (h : uncertaintyRobustIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    sameFrozenEvaluationContext a.base b.base :=
  h.1.1

theorem uncertaintyRobustTieBreak_requires_both_precommitted_evidence
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : UncertaintyRobustPrecommittedComparison
      HState SState HField SField CommonField Payload)
    (h : uncertaintyRobustIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    PrecommittedComparisonEvidence a.base ∧
      PrecommittedComparisonEvidence b.base :=
  tieBreak_requires_both_precommitted_evidence
    empiricallyEquivalent humanPrefers a.base b.base h.2

#print axioms hshRobustExclusive_nonempty_implies_nominalExclusive
#print axioms standardRobustExclusive_nonempty_implies_nominalExclusive
#print axioms uncertaintyRobustSeparation_implies_nominalSeparation
#print axioms uncertaintyRobustAdmission_preserves_precommittedEvidence
#print axioms uncertaintyRobustAdmission_implies_nominalSeparation
#print axioms uncertaintyRobustTieBreak_requires_same_uncertainty_model
#print axioms uncertaintyRobustTieBreak_requires_same_frozen_evaluation_context
#print axioms uncertaintyRobustTieBreak_requires_both_precommitted_evidence

end HsHVerification.UncertaintyRobustSeparation
