import Mathlib
import HsHVerification.MeasurementDomainCompatibility
import HsHVerification.ModelSelectionPreference

/-!
# Shared readout and detector-level predictive separation

This module composes the existing mode-typed native measurement operator
contract with the existing set-valued predictive-separation contract.

Both candidate models are evaluated through one FrozenCommonReadout value:
the same instrument operator, measurement mode, instrument/operator version,
calibration record, acquisition-unit-map record, units, uncertainty model,
and declared resolution. This prevents the formal comparison from silently
using different readout operators for the two candidates.

The key result is a necessary-and-sufficient detector-space witness:
an H(s)H-exclusive detector outcome exists exactly when some admissible
H(s)H state has a readout value that no admissible standard-model state
shares. The symmetric condition holds for a standard-exclusive outcome.

Thus a difference between upstream field predictions is not by itself a
detector-level discriminator. A common readout can collapse distinct
upstream values into the same detector value. The exact readout-fiber
condition, not source-space difference alone, determines whether a
set-membership witness survives.

All calibration, acquisition-map, units, uncertainty, instrument identity,
operator version, and resolution fields are external evidence obligations.
The comparison below is exact set-membership in an abstract codomain: it has
no metric, noise distribution, covariance propagation, or statistical
threshold. A separate evidence-gated readout type requires the declared
external gate propositions to be supplied, but does not authenticate their
underlying artifacts. Both models currently share the same State and Field
types; distinct model carriers require explicit maps into a common carrier.
This module does not instantiate a physical readout, supply a measured system
or dataset, or establish an H(s)H prediction.
-/

namespace HsHVerification.SharedReadoutFiberSeparation

open HsHVerification.MeasurementDomainCompatibility
open HsHVerification.ModelSelectionPreference

universe u v w

variable {State : Type u} {Field : Type v}
variable {Payload : MeasurementMode → Type w}

/-- One frozen readout contract shared by both candidate models. Metadata
    fields identify the intended instrument and evidence records; the
    proposition fields remain external authentication obligations. -/
structure FrozenCommonReadout (Field : Type v)
    (Payload : MeasurementMode → Type w) where
  operator : NativeMeasurementOperator Field Payload
  mode : MeasurementMode
  instrumentId : String
  operatorVersion : String
  calibrationRecord : String
  acquisitionUnitMapRecord : String
  instrumentIdentityAuthenticated : Prop
  operatorVersionAuthenticated : Prop
  calibrationAuthenticated : Prop
  acquisitionUnitMapAuthenticated : Prop
  measurementUnitsDeclared : Prop
  uncertaintyModelDeclared : Prop
  resolutionDeclared : Prop

/-- Evidence required before a detector-level comparison is admitted. These
    fields are supplied by source and measurement review, not proved here. -/
def commonReadoutEvidenceGate
    (readout : FrozenCommonReadout Field Payload) : Prop :=
  readout.instrumentIdentityAuthenticated ∧
  readout.operatorVersionAuthenticated ∧
  readout.calibrationAuthenticated ∧
  readout.acquisitionUnitMapAuthenticated ∧
  readout.measurementUnitsDeclared ∧
  readout.uncertaintyModelDeclared ∧
  readout.resolutionDeclared

/-- A readout admitted for detector-level comparison only when its declared
    external evidence gate is supplied. The proof term records that the gate
    propositions are present; it does not authenticate their source artifacts
    or establish their real-world truth. -/
structure EvidenceGatedFrozenCommonReadout
    (Field : Type v)
    (Payload : MeasurementMode → Type w) where
  contract : FrozenCommonReadout Field Payload
  gate : commonReadoutEvidenceGate contract

/-- The model-to-detector map uses the one operator and mode stored in the
    shared readout contract. -/
def readoutMap
    (model : LatentFieldModel State Field)
    (readout : FrozenCommonReadout Field Payload) :
    State → Payload readout.mode :=
  fun state => readout.operator.observe readout.mode
    (model.predictField state)

/-- The detector-level prediction region is the image of the admissible
    state set under the model-specific prediction followed by the common
    instrument readout. -/
def detectorPredictionRegion
    (model : LatentFieldModel State Field)
    (readout : FrozenCommonReadout Field Payload)
    (admissibleStates : Set State) :
    Set (Payload readout.mode) :=
  readoutMap model readout '' admissibleStates

/-- H(s)H-only detector outcomes, using the existing predictive-separation
    definition on the common detector space. -/
def hshDetectorExclusivePredictions
    (hsh standard : LatentFieldModel State Field)
    (readout : FrozenCommonReadout Field Payload)
    (hshStates standardStates : Set State) :
    Set (Payload readout.mode) :=
  hshExclusivePredictions
    (detectorPredictionRegion hsh readout hshStates)
    (detectorPredictionRegion standard readout standardStates)

/-- Standard-only detector outcomes, using the same frozen readout. -/
def standardDetectorExclusivePredictions
    (hsh standard : LatentFieldModel State Field)
    (readout : FrozenCommonReadout Field Payload)
    (hshStates standardStates : Set State) :
    Set (Payload readout.mode) :=
  standardExclusivePredictions
    (detectorPredictionRegion hsh readout hshStates)
    (detectorPredictionRegion standard readout standardStates)

/-- Two-sided discrimination after the common detector readout. -/
def detectorLevelTwoSidedSeparation
    (hsh standard : LatentFieldModel State Field)
    (readout : FrozenCommonReadout Field Payload)
    (hshStates standardStates : Set State) : Prop :=
  twoSidedPredictiveSeparation
    (detectorPredictionRegion hsh readout hshStates)
    (detectorPredictionRegion standard readout standardStates)

/-- An H(s)H-exclusive detector outcome exists exactly when one admissible
    H(s)H state has a readout value outside every admissible standard-model
    readout fiber. -/
theorem hshDetectorExclusive_nonempty_iff_fiberWitness
    (hsh standard : LatentFieldModel State Field)
    (readout : FrozenCommonReadout Field Payload)
    (hshStates standardStates : Set State) :
    (hshDetectorExclusivePredictions hsh standard readout
      hshStates standardStates).Nonempty ↔
      ∃ state, state ∈ hshStates ∧
        ∀ standardState, standardState ∈ standardStates →
          readoutMap hsh readout state ≠
            readoutMap standard readout standardState := by
  change
    (detectorPredictionRegion hsh readout hshStates \
      detectorPredictionRegion standard readout standardStates).Nonempty ↔
      ∃ state, state ∈ hshStates ∧
        ∀ standardState, standardState ∈ standardStates →
          readoutMap hsh readout state ≠
            readoutMap standard readout standardState
  constructor
  · rintro ⟨observed, hObserved⟩
    have hInHsh := hObserved.1
    have hNotStandard := hObserved.2
    rcases hInHsh with
      ⟨state, hState, hReadoutEq⟩
    refine ⟨state, hState, ?_⟩
    intro standardState hStandardState hCollision
    apply hNotStandard
    exact ⟨standardState, hStandardState, hCollision.symm.trans hReadoutEq⟩
  · rintro ⟨state, hState, hNoCollision⟩
    refine ⟨readoutMap hsh readout state, ?_⟩
    refine ⟨⟨state, hState, rfl⟩, ?_⟩
    intro hInStandard
    rcases hInStandard with ⟨standardState, hStandardState, hReadoutEq⟩
    exact hNoCollision standardState hStandardState hReadoutEq.symm

/-- The symmetric criterion for a standard-exclusive detector outcome. -/
theorem standardDetectorExclusive_nonempty_iff_fiberWitness
    (hsh standard : LatentFieldModel State Field)
    (readout : FrozenCommonReadout Field Payload)
    (hshStates standardStates : Set State) :
    (standardDetectorExclusivePredictions hsh standard readout
      hshStates standardStates).Nonempty ↔
      ∃ standardState, standardState ∈ standardStates ∧
        ∀ state, state ∈ hshStates →
          readoutMap standard readout standardState ≠
            readoutMap hsh readout state := by
  simpa [standardDetectorExclusivePredictions, hshDetectorExclusivePredictions,
    standardExclusivePredictions, hshExclusivePredictions] using
    (hshDetectorExclusive_nonempty_iff_fiberWitness
      standard hsh readout standardStates hshStates)

/-- Two-sided detector-level discrimination is equivalent to one
    rival-avoiding readout fiber in each direction. -/
theorem detectorLevelTwoSidedSeparation_iff_fiberWitnesses
    (hsh standard : LatentFieldModel State Field)
    (readout : FrozenCommonReadout Field Payload)
    (hshStates standardStates : Set State) :
    detectorLevelTwoSidedSeparation hsh standard readout
      hshStates standardStates ↔
      (∃ state, state ∈ hshStates ∧
        ∀ standardState, standardState ∈ standardStates →
          readoutMap hsh readout state ≠
            readoutMap standard readout standardState) ∧
      (∃ standardState, standardState ∈ standardStates ∧
        ∀ state, state ∈ hshStates →
          readoutMap standard readout standardState ≠
            readoutMap hsh readout state) := by
  change
    (hshDetectorExclusivePredictions hsh standard readout
      hshStates standardStates).Nonempty ∧
    (standardDetectorExclusivePredictions hsh standard readout
      hshStates standardStates).Nonempty ↔ _
  constructor
  · rintro ⟨hHsh, hStandard⟩
    exact
      ⟨(hshDetectorExclusive_nonempty_iff_fiberWitness
          hsh standard readout hshStates standardStates).mp hHsh,
       (standardDetectorExclusive_nonempty_iff_fiberWitness
          hsh standard readout hshStates standardStates).mp hStandard⟩
  · rintro ⟨hHsh, hStandard⟩
    exact
      ⟨(hshDetectorExclusive_nonempty_iff_fiberWitness
          hsh standard readout hshStates standardStates).mpr hHsh,
       (standardDetectorExclusive_nonempty_iff_fiberWitness
          hsh standard readout hshStates standardStates).mpr hStandard⟩

/-- If one state and one standard state collide under the common readout,
    that detector value cannot be an H(s)H-exclusive witness. Membership of
    the first state in `hshStates` is unnecessary: collision already places
    its readout value inside the standard prediction region. -/
theorem sharedReadoutCollision_blocks_hshExclusive
    (hsh standard : LatentFieldModel State Field)
    (readout : FrozenCommonReadout Field Payload)
    (hshStates standardStates : Set State)
    (state : State)
    (standardState : State) (hStandardState : standardState ∈ standardStates)
    (hCollision :
      readoutMap hsh readout state =
        readoutMap standard readout standardState) :
    readoutMap hsh readout state ∉
      hshDetectorExclusivePredictions hsh standard readout
        hshStates standardStates := by
  change
    readoutMap hsh readout state ∉
      detectorPredictionRegion hsh readout hshStates \
        detectorPredictionRegion standard readout standardStates
  intro hMember
  have hNotStandard := hMember.2
  apply hNotStandard
  exact ⟨standardState, hStandardState, hCollision.symm⟩

/-- Upstream field distinction can coexist with detector-level collapse:
    source-space inequality does not rescue a readout value shared by the
    rival model. -/
theorem sourceDifference_and_sharedReadoutCollision_block_exclusive
    (hsh standard : LatentFieldModel State Field)
    (readout : FrozenCommonReadout Field Payload)
    (hshStates standardStates : Set State)
    (state : State)
    (standardState : State) (hStandardState : standardState ∈ standardStates)
    (hSourceDifferent :
      hsh.predictField state ≠ standard.predictField standardState)
    (hCollision :
      readoutMap hsh readout state =
        readoutMap standard readout standardState) :
    hsh.predictField state ≠ standard.predictField standardState ∧
      readoutMap hsh readout state ∉
        hshDetectorExclusivePredictions hsh standard readout
          hshStates standardStates := by
  exact
    ⟨hSourceDifferent,
      sharedReadoutCollision_blocks_hshExclusive
        hsh standard readout hshStates standardStates
        state standardState hStandardState hCollision⟩

/-- The admitted two-sided comparison requires a readout value carrying the
    external evidence-gate proof, while retaining the same fiber criterion. -/
def evidenceGatedDetectorLevelTwoSidedSeparation
    (hsh standard : LatentFieldModel State Field)
    (readout : EvidenceGatedFrozenCommonReadout Field Payload)
    (hshStates standardStates : Set State) : Prop :=
  detectorLevelTwoSidedSeparation hsh standard readout.contract
    hshStates standardStates

/-- A readout that crosses the declared evidence gate has the same
    rival-avoiding fiber characterization for two-sided separation. -/
theorem evidenceGatedDetectorLevelTwoSidedSeparation_iff_fiberWitnesses
    (hsh standard : LatentFieldModel State Field)
    (readout : EvidenceGatedFrozenCommonReadout Field Payload)
    (hshStates standardStates : Set State) :
    evidenceGatedDetectorLevelTwoSidedSeparation hsh standard readout
      hshStates standardStates ↔
      (∃ state, state ∈ hshStates ∧
        ∀ standardState, standardState ∈ standardStates →
          readoutMap hsh readout.contract state ≠
            readoutMap standard readout.contract standardState) ∧
      (∃ standardState, standardState ∈ standardStates ∧
        ∀ state, state ∈ hshStates →
          readoutMap standard readout.contract standardState ≠
            readoutMap hsh readout.contract state) := by
  exact detectorLevelTwoSidedSeparation_iff_fiberWitnesses
    hsh standard readout.contract hshStates standardStates

#print axioms hshDetectorExclusive_nonempty_iff_fiberWitness
#print axioms standardDetectorExclusive_nonempty_iff_fiberWitness
#print axioms detectorLevelTwoSidedSeparation_iff_fiberWitnesses
#print axioms sharedReadoutCollision_blocks_hshExclusive
#print axioms sourceDifference_and_sharedReadoutCollision_block_exclusive
#print axioms evidenceGatedDetectorLevelTwoSidedSeparation_iff_fiberWitnesses

end HsHVerification.SharedReadoutFiberSeparation
