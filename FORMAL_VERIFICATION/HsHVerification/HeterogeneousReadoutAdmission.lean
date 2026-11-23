import Mathlib
import HsHVerification.MeasurementDomainCompatibility
import HsHVerification.ModelSelectionPreference
import HsHVerification.SharedReadoutFiberSeparation

/-!
# Heterogeneous, source-bound, evidence-gated readout pipeline

The H(s)H and standard models may use different state, geometry, and field
types. They share only an instrument-input type and one frozen instrument
readout. Each model supplies its own typed chain:

  state → geometry → physical field → instrument input → detector

The geometry-to-physical-field map is the model's interaction/constitutive
map. In an H(s)H instantiation this is where worldtube/timesheet interaction
belongs; it is not the instrument readout and the timesheet is not treated as
a passive detector cut. The field-to-instrument-input map is a separate
source-bound projection/transfer. The final instrument operator is shared.

The source labels and proposition fields below are audit obligations, not
authentication. Lean does not verify that a string is a real Git blob SHA,
that a source authorizes a map, or that the supplied propositions are true.
The candidate hard gate remains an external evidence obligation.

This minimal interface uses total single-valued maps. If a physical
intersection/projection is partial or set-valued, it must be represented by
an explicit Option/relation/set-valued map; it must not be silently coerced
into a total function. Any coarse-graining stage must be added as another
typed map and must satisfy the existing coarse-slice closure/memory gate.

No physical system, dataset, metric, time function, interaction law, or
instrument is instantiated here. The results are conditional mathematics
about the supplied maps and a common readout, not a physical prediction.
-/

namespace HsHVerification.HeterogeneousReadoutAdmission

open HsHVerification.MeasurementDomainCompatibility
open HsHVerification.ModelSelectionPreference
open HsHVerification.SharedReadoutFiberSeparation

/-- A typed map tied to a source record. The labels are audit pointers only;
    the evidence propositions must be established outside Lean. -/
structure SourceBoundMap (A B : Type*) where
  map : A → B
  sourceRecordLabel : String
  sourceBlobShaLabel : String
  sourceAuthorization : Prop
  domainCodomainDeclared : Prop
  structuralInvariantsPreserved : Prop
  evidence :
    sourceAuthorization ∧
    domainCodomainDeclared ∧
    structuralInvariantsPreserved

/-- A model-specific, explicitly composed route from model state to the
    common instrument-input space. The geometry-to-field map is the physical
    response/interaction law; the last map is the separate instrument-input
    projection. -/
structure ModelPipeline
    (State Geometry Field InstrumentInput : Type*) where
  admissibleStates : Set State
  stateToGeometry : SourceBoundMap State Geometry
  geometryToPhysicalField : SourceBoundMap Geometry Field
  fieldToInstrumentInput : SourceBoundMap Field InstrumentInput
  compositionCondition : Prop
  compositionEvidence : compositionCondition

/-- Evidence for every map and for the declared composition of the pipeline. -/
def ModelPipeline.mapEvidence
    {State Geometry Field InstrumentInput : Type*}
    (pipeline : ModelPipeline State Geometry Field InstrumentInput) : Prop :=
  pipeline.stateToGeometry.evidence ∧
  pipeline.geometryToPhysicalField.evidence ∧
  pipeline.fieldToInstrumentInput.evidence ∧
  pipeline.compositionEvidence

/-- The explicit composition state → geometry → physical field → instrument
    input. The external instrument readout is applied separately below. -/
def ModelPipeline.toInstrumentInput
    {State Geometry Field InstrumentInput : Type*}
    (pipeline : ModelPipeline State Geometry Field InstrumentInput)
    (state : State) : InstrumentInput :=
  pipeline.fieldToInstrumentInput.map
    (pipeline.geometryToPhysicalField.map
      (pipeline.stateToGeometry.map state))

/-- Two models with heterogeneous internal carriers but one common
    instrument-input type and one evidence-gated frozen readout. -/
structure HeterogeneousReadoutPair
    (HState HGeometry HField SState SGeometry SField InstrumentInput : Type*)
    (Payload : MeasurementMode → Type*) where
  hshPipeline : ModelPipeline HState HGeometry HField InstrumentInput
  standardPipeline : ModelPipeline SState SGeometry SField InstrumentInput
  readout : EvidenceGatedFrozenCommonReadout InstrumentInput Payload

/-- H(s)H detector map, explicitly composed through its own pipeline and the
    shared instrument operator. -/
def hshReadoutMap
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload) :
    HState → Payload pair.readout.contract.mode :=
  fun state =>
    pair.readout.contract.operator.observe
      pair.readout.contract.mode
      (pair.hshPipeline.toInstrumentInput state)

/-- Standard-comparator detector map, using its own explicit projection
    chain but the exact same frozen instrument operator and mode. -/
def standardReadoutMap
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload) :
    SState → Payload pair.readout.contract.mode :=
  fun state =>
    pair.readout.contract.operator.observe
      pair.readout.contract.mode
      (pair.standardPipeline.toInstrumentInput state)

/-- H(s)H detector outcomes generated by its admissible states. -/
def hshDetectorPredictionRegion
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload) :
    Set (Payload pair.readout.contract.mode) :=
  pair.hshReadoutMap '' pair.hshPipeline.admissibleStates

/-- Standard detector outcomes generated by its admissible states. -/
def standardDetectorPredictionRegion
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload) :
    Set (Payload pair.readout.contract.mode) :=
  pair.standardReadoutMap '' pair.standardPipeline.admissibleStates

/-- Detector outcomes admitted by H(s)H but excluded by the standard model. -/
def hshDetectorExclusivePredictions
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload) :
    Set (Payload pair.readout.contract.mode) :=
  pair.hshDetectorPredictionRegion \ pair.standardDetectorPredictionRegion

/-- Detector outcomes admitted by the standard model but excluded by H(s)H. -/
def standardDetectorExclusivePredictions
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload) :
    Set (Payload pair.readout.contract.mode) :=
  pair.standardDetectorPredictionRegion \ pair.hshDetectorPredictionRegion

/-- Two-sided detector discrimination under one common readout. -/
def detectorLevelTwoSidedSeparation
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload) :
    Prop :=
  (pair.hshDetectorExclusivePredictions).Nonempty ∧
  (pair.standardDetectorExclusivePredictions).Nonempty

/-- An H(s)H-exclusive detector outcome exists exactly when some admissible
    H(s)H state has a readout value outside every admissible standard fiber. -/
theorem hshDetectorExclusive_nonempty_iff_fiberWitness
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload) :
    (pair.hshDetectorExclusivePredictions).Nonempty ↔
      ∃ state, state ∈ pair.hshPipeline.admissibleStates ∧
        ∀ standardState,
          standardState ∈ pair.standardPipeline.admissibleStates →
            pair.hshReadoutMap state ≠ pair.standardReadoutMap standardState := by
  change
    (pair.hshDetectorPredictionRegion \ pair.standardDetectorPredictionRegion).Nonempty ↔
      ∃ state, state ∈ pair.hshPipeline.admissibleStates ∧
        ∀ standardState,
          standardState ∈ pair.standardPipeline.admissibleStates →
            pair.hshReadoutMap state ≠ pair.standardReadoutMap standardState
  constructor
  · rintro ⟨observed, hObserved⟩
    rcases hObserved.1 with ⟨state, hState, hReadoutEq⟩
    refine ⟨state, hState, ?_⟩
    intro standardState hStandardState hCollision
    apply hObserved.2
    exact ⟨standardState, hStandardState, hCollision.symm.trans hReadoutEq⟩
  · rintro ⟨state, hState, hNoCollision⟩
    refine ⟨pair.hshReadoutMap state, ?_⟩
    constructor
    · exact ⟨state, hState, rfl⟩
    · intro hInStandard
      rcases hInStandard with ⟨standardState, hStandardState, hReadoutEq⟩
      exact hNoCollision standardState hStandardState hReadoutEq.symm

/-- The symmetric standard-exclusive outcome has the corresponding
    rival-avoiding H(s)H-fiber characterization. -/
theorem standardDetectorExclusive_nonempty_iff_fiberWitness
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload) :
    (pair.standardDetectorExclusivePredictions).Nonempty ↔
      ∃ standardState,
        standardState ∈ pair.standardPipeline.admissibleStates ∧
        ∀ state, state ∈ pair.hshPipeline.admissibleStates →
          pair.standardReadoutMap standardState ≠ pair.hshReadoutMap state := by
  change
    (pair.standardDetectorPredictionRegion \ pair.hshDetectorPredictionRegion).Nonempty ↔
      ∃ standardState,
        standardState ∈ pair.standardPipeline.admissibleStates ∧
        ∀ state, state ∈ pair.hshPipeline.admissibleStates →
          pair.standardReadoutMap standardState ≠ pair.hshReadoutMap state
  constructor
  · rintro ⟨observed, hObserved⟩
    rcases hObserved.1 with ⟨standardState, hStandardState, hReadoutEq⟩
    refine ⟨standardState, hStandardState, ?_⟩
    intro state hState hCollision
    apply hObserved.2
    exact ⟨state, hState, hCollision.symm.trans hReadoutEq⟩
  · rintro ⟨standardState, hStandardState, hNoCollision⟩
    refine ⟨pair.standardReadoutMap standardState, ?_⟩
    constructor
    · exact ⟨standardState, hStandardState, rfl⟩
    · intro hInHsh
      rcases hInHsh with ⟨state, hState, hReadoutEq⟩
      exact hNoCollision state hState hReadoutEq.symm

/-- Two-sided separation is equivalent to one rival-avoiding witness in
    each model's detector-level prediction region. -/
theorem detectorLevelTwoSidedSeparation_iff_fiberWitnesses
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload) :
    detectorLevelTwoSidedSeparation pair ↔
      (∃ state, state ∈ pair.hshPipeline.admissibleStates ∧
        ∀ standardState,
          standardState ∈ pair.standardPipeline.admissibleStates →
            pair.hshReadoutMap state ≠ pair.standardReadoutMap standardState) ∧
      (∃ standardState,
        standardState ∈ pair.standardPipeline.admissibleStates ∧
        ∀ state, state ∈ pair.hshPipeline.admissibleStates →
          pair.standardReadoutMap standardState ≠ pair.hshReadoutMap state) := by
  change
    (pair.hshDetectorExclusivePredictions).Nonempty ∧
    (pair.standardDetectorExclusivePredictions).Nonempty ↔
      (∃ state, state ∈ pair.hshPipeline.admissibleStates ∧
        ∀ standardState,
          standardState ∈ pair.standardPipeline.admissibleStates →
            pair.hshReadoutMap state ≠ pair.standardReadoutMap standardState) ∧
      (∃ standardState,
        standardState ∈ pair.standardPipeline.admissibleStates ∧
        ∀ state, state ∈ pair.hshPipeline.admissibleStates →
          pair.standardReadoutMap standardState ≠ pair.hshReadoutMap state)
  constructor
  · rintro ⟨hHsh, hStandard⟩
    exact
      ⟨(hshDetectorExclusive_nonempty_iff_fiberWitness pair).mp hHsh,
        (standardDetectorExclusive_nonempty_iff_fiberWitness pair).mp hStandard⟩
  · rintro ⟨hHsh, hStandard⟩
    exact
      ⟨(hshDetectorExclusive_nonempty_iff_fiberWitness pair).mpr hHsh,
        (standardDetectorExclusive_nonempty_iff_fiberWitness pair).mpr hStandard⟩

/-- A shared detector value cannot be an H(s)H-exclusive witness. -/
theorem sharedReadoutCollision_blocks_hshExclusive
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload)
    (state : HState) (standardState : SState)
    (hStandardState :
      standardState ∈ pair.standardPipeline.admissibleStates)
    (hCollision :
      pair.hshReadoutMap state = pair.standardReadoutMap standardState) :
    pair.hshReadoutMap state ∉ pair.hshDetectorExclusivePredictions := by
  change pair.hshReadoutMap state ∉
    pair.hshDetectorPredictionRegion \ pair.standardDetectorPredictionRegion
  intro hMember
  apply hMember.2
  exact ⟨standardState, hStandardState, hCollision.symm⟩

/-- An empirical discrimination admission requires the existing non-
    compensatory candidate hard gate, source-bound map evidence for both
    model pipelines, a binding between these exact maps and the candidate's
    frozen map manifest, the evidence-gated common readout, and an H(s)H-
    exclusive detector prediction. This is an interface contract, not a
    claim that any of those external evidence propositions are true. -/
structure EvidenceGatedCandidateAdmission
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    (pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload)
    (candidate : Candidate) where
  candidateHardGate : hardGate candidate
  projectionManifestMatchesCandidate : Prop
  projectionManifestMatchesCandidateEvidence :
    projectionManifestMatchesCandidate
  hshPipelineEvidence : pair.hshPipeline.mapEvidence
  standardPipelineEvidence : pair.standardPipeline.mapEvidence
  hshExclusiveWitness :
    (pair.hshDetectorExclusivePredictions).Nonempty

/-- The admission object exposes every required evidence layer. -/
theorem admission_requires_all_evidence
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    {pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload}
    {candidate : Candidate}
    (admission : EvidenceGatedCandidateAdmission pair candidate) :
    hardGate candidate ∧
    admission.projectionManifestMatchesCandidate ∧
    pair.hshPipeline.mapEvidence ∧
    pair.standardPipeline.mapEvidence ∧
    commonReadoutEvidenceGate pair.readout.contract ∧
    (pair.hshDetectorExclusivePredictions).Nonempty :=
  ⟨admission.candidateHardGate,
    admission.projectionManifestMatchesCandidateEvidence,
    admission.hshPipelineEvidence,
    admission.standardPipelineEvidence,
    pair.readout.gate,
    admission.hshExclusiveWitness⟩

/-- An admitted candidate has an H(s)H detector outcome that no admissible
    standard-model state can produce under the same frozen instrument. -/
theorem admission_has_rival_avoiding_fiber_witness
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    {pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload}
    {candidate : Candidate}
    (admission : EvidenceGatedCandidateAdmission pair candidate) :
    ∃ state, state ∈ pair.hshPipeline.admissibleStates ∧
      ∀ standardState,
        standardState ∈ pair.standardPipeline.admissibleStates →
          pair.hshReadoutMap state ≠ pair.standardReadoutMap standardState :=
  (hshDetectorExclusive_nonempty_iff_fiberWitness pair).mp
    admission.hshExclusiveWitness

/-- No candidate can be admitted when the existing hard gate fails. -/
theorem no_admission_when_candidate_hard_gate_fails
    {HState HGeometry HField SState SGeometry SField InstrumentInput : Type*}
    {Payload : MeasurementMode → Type*}
    {pair : HeterogeneousReadoutPair
      HState HGeometry HField SState SGeometry SField InstrumentInput Payload}
    {candidate : Candidate}
    (hFail : ¬ hardGate candidate) :
    ¬ Nonempty (EvidenceGatedCandidateAdmission pair candidate) := by
  intro hAdmission
  rcases hAdmission with ⟨admission⟩
  exact hFail admission.candidateHardGate

#print axioms hshDetectorExclusive_nonempty_iff_fiberWitness
#print axioms standardDetectorExclusive_nonempty_iff_fiberWitness
#print axioms detectorLevelTwoSidedSeparation_iff_fiberWitnesses
#print axioms sharedReadoutCollision_blocks_hshExclusive
#print axioms admission_requires_all_evidence
#print axioms admission_has_rival_avoiding_fiber_witness
#print axioms no_admission_when_candidate_hard_gate_fails

end HsHVerification.HeterogeneousReadoutAdmission
