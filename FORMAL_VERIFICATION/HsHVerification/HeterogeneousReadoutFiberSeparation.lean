import Mathlib
import HsHVerification.EvidenceGatedAdmission

/-!
# Heterogeneous model carriers and explicit common-readout projections

The H(s)H and standard models need not share a state type or a latent-field
type. Each model predicts in its own field carrier; each then supplies an
explicit projection into one declared common carrier, followed by the same
frozen measurement operator and mode.

No state-to-state correspondence, inverse, injectivity, surjectivity,
isometry, or physical equivalence is assumed. The projection maps may collapse
distinct source values. The fiber-witness theorems therefore test separation
after the complete composition, not before it.

Source locators and common-carrier identities are typed metadata. Lean checks
their declared equality and the map composition; it does not authenticate
the source artifacts or prove that the referenced artifacts implement the
functions. The readout evidence gate remains an external obligation.

This is an assistant-proposed workflow formalization, not a Nathan Direct
physical equation or a physical model. It supplies no measured system,
dataset, numerical calculation, fit, or prediction.
-/

namespace HsHVerification.HeterogeneousReadoutFiberSeparation

open HsHVerification.EvidenceGatedAdmission
open HsHVerification.MeasurementDomainCompatibility
open HsHVerification.ModelSelectionPreference
open HsHVerification.SharedReadoutFiberSeparation

universe uH uS uHF uSF uCF uP

variable {HState : Type uH} {SState : Type uS}
variable {HField : Type uHF} {SField : Type uSF}
variable {CommonField : Type uCF}
variable {Payload : MeasurementMode → Type uP}

/-- The two models retain independent state and field carriers. Their
    projection maps have one shared codomain, identified by a declared
    carrier ID and source artifact. The source locators do not authenticate
    the functions. -/
structure HeterogeneousModelPair
    (HState : Type uH) (SState : Type uS)
    (HField : Type uHF) (SField : Type uSF)
    (CommonField : Type uCF) where
  hshModelSource : SourceArtifactRef
  standardModelSource : SourceArtifactRef
  hshProjectionSource : SourceArtifactRef
  standardProjectionSource : SourceArtifactRef
  commonCarrierId : NonEmptyText
  commonCarrierArtifact : SourceArtifactRef
  hshPredictField : HState → HField
  standardPredictField : SState → SField
  hshToCommonCarrier : HField → CommonField
  standardToCommonCarrier : SField → CommonField

/-- A frozen packet augmented with the identity of the common latent-field
    carrier into which both model-specific projections must land. -/
structure HeterogeneousFrozenMeasurementPacket
    (CommonField : Type uCF)
    (Payload : MeasurementMode → Type uP) where
  packet : FrozenMeasurementPacket CommonField Payload
  commonCarrierId : NonEmptyText
  commonCarrierArtifact : SourceArtifactRef

/-- Candidate-specific model maps and state sets bound to one frozen packet.
    H(s)H and standard state sets may have unrelated types. -/
structure HeterogeneousCandidateModelReadoutBinding
    (HState : Type uH) (SState : Type uS)
    (HField : Type uHF) (SField : Type uSF)
    (CommonField : Type uCF) where
  packetId : NonEmptyText
  packetDigest : NonEmptyText
  candidate : IdentifiedCandidate
  models : HeterogeneousModelPair HState SState HField SField CommonField
  hshStates : IdentifiedStateSet HState
  standardStates : IdentifiedStateSet SState
  manifest : SourceArtifactRef

/-- The H(s)H latent field is explicitly projected into the declared common
    carrier. -/
def hshCommonCarrierMap
    (models : HeterogeneousModelPair HState SState HField SField CommonField) :
    HState → CommonField :=
  models.hshToCommonCarrier ∘ models.hshPredictField

/-- The standard latent field is independently projected into that same
    declared common carrier. -/
def standardCommonCarrierMap
    (models : HeterogeneousModelPair HState SState HField SField CommonField) :
    SState → CommonField :=
  models.standardToCommonCarrier ∘ models.standardPredictField

/-- The one frozen instrument operator acts on the common carrier. -/
def commonCarrierReadout
    (readout : FrozenCommonReadout CommonField Payload) :
    CommonField → Payload readout.mode :=
  fun field => readout.operator.observe readout.mode field

/-- H(s)H prediction composed with its carrier projection and the common
    detector readout. -/
def hshDetectorReadoutMap
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload) :
    HState → Payload readout.mode :=
  commonCarrierReadout readout ∘ hshCommonCarrierMap models

/-- Standard prediction composed with its carrier projection and the same
    common detector readout. -/
def standardDetectorReadoutMap
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload) :
    SState → Payload readout.mode :=
  commonCarrierReadout readout ∘ standardCommonCarrierMap models

/-- H(s)H's detector-level prediction region. -/
def hshDetectorPredictionRegion
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (hshStates : Set HState) : Set (Payload readout.mode) :=
  hshDetectorReadoutMap models readout '' hshStates

/-- The standard model's detector-level prediction region. -/
def standardDetectorPredictionRegion
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (standardStates : Set SState) : Set (Payload readout.mode) :=
  standardDetectorReadoutMap models readout '' standardStates

/-- H(s)H-exclusive detector outcomes after both projection maps and the
    common readout. -/
def hshDetectorExclusivePredictions
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (hshStates : Set HState) (standardStates : Set SState) :
    Set (Payload readout.mode) :=
  hshDetectorPredictionRegion models readout hshStates \
    standardDetectorPredictionRegion models readout standardStates

/-- Standard-exclusive detector outcomes after both projection maps and the
    common readout. -/
def standardDetectorExclusivePredictions
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (hshStates : Set HState) (standardStates : Set SState) :
    Set (Payload readout.mode) :=
  standardDetectorPredictionRegion models readout standardStates \
    hshDetectorPredictionRegion models readout hshStates

/-- Two-sided separation is evaluated only after the complete common-carrier
    and detector-readout compositions. -/
def heterogeneousDetectorLevelTwoSidedSeparation
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (hshStates : Set HState) (standardStates : Set SState) : Prop :=
  (hshDetectorExclusivePredictions models readout
    hshStates standardStates).Nonempty ∧
  (standardDetectorExclusivePredictions models readout
    hshStates standardStates).Nonempty

/-- The H(s)H map is exactly the composition of its model prediction,
    declared projection, and shared detector readout. -/
theorem hshDetectorReadoutMap_is_composed_projection
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload) :
    hshDetectorReadoutMap models readout =
      commonCarrierReadout readout ∘
        (models.hshToCommonCarrier ∘ models.hshPredictField) := rfl

/-- The standard map is exactly the composition of its own model prediction,
    declared projection, and the same detector readout. -/
theorem standardDetectorReadoutMap_is_composed_projection
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload) :
    standardDetectorReadoutMap models readout =
      commonCarrierReadout readout ∘
        (models.standardToCommonCarrier ∘ models.standardPredictField) := rfl

/-- If the two model-specific projections collide in the common carrier,
    the shared detector readout must also collide. The converse is not
    asserted because the detector operator may itself be non-injective. -/
theorem commonCarrier_projection_collision_implies_detector_collision
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (hshState : HState) (standardState : SState)
    (h :
      hshCommonCarrierMap models hshState =
        standardCommonCarrierMap models standardState) :
    hshDetectorReadoutMap models readout hshState =
      standardDetectorReadoutMap models readout standardState := by
  change
    commonCarrierReadout readout (hshCommonCarrierMap models hshState) =
      commonCarrierReadout readout (standardCommonCarrierMap models standardState)
  exact congrArg (commonCarrierReadout readout) h

/-- An H(s)H-exclusive detector value exists exactly when an admissible
    H(s)H state has a composed readout outside every admissible standard
    model readout fiber. -/
theorem hshDetectorExclusive_nonempty_iff_heterogeneousFiberWitness
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (hshStates : Set HState) (standardStates : Set SState) :
    (hshDetectorExclusivePredictions models readout
      hshStates standardStates).Nonempty ↔
      ∃ hshState, hshState ∈ hshStates ∧
        ∀ standardState, standardState ∈ standardStates →
          hshDetectorReadoutMap models readout hshState ≠
            standardDetectorReadoutMap models readout standardState := by
  change
    (hshDetectorReadoutMap models readout '' hshStates \
      standardDetectorReadoutMap models readout '' standardStates).Nonempty ↔
      ∃ hshState, hshState ∈ hshStates ∧
        ∀ standardState, standardState ∈ standardStates →
          hshDetectorReadoutMap models readout hshState ≠
            standardDetectorReadoutMap models readout standardState
  constructor
  · rintro ⟨observed, hHsh, hNotStandard⟩
    rcases hHsh with ⟨hshState, hState, hReadoutEq⟩
    refine ⟨hshState, hState, ?_⟩
    intro standardState hStandardState hCollision
    apply hNotStandard
    exact ⟨standardState, hStandardState, hCollision.symm.trans hReadoutEq⟩
  · rintro ⟨hshState, hState, hNoCollision⟩
    refine ⟨hshDetectorReadoutMap models readout hshState, ?_⟩
    constructor
    · exact ⟨hshState, hState, rfl⟩
    · intro hStandard
      rcases hStandard with ⟨standardState, hStandardState, hReadoutEq⟩
      exact hNoCollision standardState hStandardState hReadoutEq.symm

/-- The symmetric standard-exclusive criterion for heterogeneous state and
    field carriers. -/
theorem standardDetectorExclusive_nonempty_iff_heterogeneousFiberWitness
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (hshStates : Set HState) (standardStates : Set SState) :
    (standardDetectorExclusivePredictions models readout
      hshStates standardStates).Nonempty ↔
      ∃ standardState, standardState ∈ standardStates ∧
        ∀ hshState, hshState ∈ hshStates →
          standardDetectorReadoutMap models readout standardState ≠
            hshDetectorReadoutMap models readout hshState := by
  change
    (standardDetectorReadoutMap models readout '' standardStates \
      hshDetectorReadoutMap models readout '' hshStates).Nonempty ↔
      ∃ standardState, standardState ∈ standardStates ∧
        ∀ hshState, hshState ∈ hshStates →
          standardDetectorReadoutMap models readout standardState ≠
            hshDetectorReadoutMap models readout hshState
  constructor
  · rintro ⟨observed, hStandard, hNotHsh⟩
    rcases hStandard with ⟨standardState, hState, hReadoutEq⟩
    refine ⟨standardState, hState, ?_⟩
    intro hshState hshStateMem hCollision
    apply hNotHsh
    exact ⟨hshState, hshStateMem, hCollision.symm.trans hReadoutEq⟩
  · rintro ⟨standardState, hState, hNoCollision⟩
    refine ⟨standardDetectorReadoutMap models readout standardState, ?_⟩
    constructor
    · exact ⟨standardState, hState, rfl⟩
    · intro hHsh
      rcases hHsh with ⟨hshState, hshStateMem, hReadoutEq⟩
      exact hNoCollision hshState hshStateMem hReadoutEq.symm

/-- Two-sided detector-level separation is equivalent to having both
    heterogeneous fiber witnesses after the complete readout composition. -/
theorem heterogeneousTwoSidedSeparation_iff_fiberWitnesses
    (models : HeterogeneousModelPair HState SState HField SField CommonField)
    (readout : FrozenCommonReadout CommonField Payload)
    (hshStates : Set HState) (standardStates : Set SState) :
    heterogeneousDetectorLevelTwoSidedSeparation models readout
      hshStates standardStates ↔
      (∃ hshState, hshState ∈ hshStates ∧
        ∀ standardState, standardState ∈ standardStates →
          hshDetectorReadoutMap models readout hshState ≠
            standardDetectorReadoutMap models readout standardState) ∧
      (∃ standardState, standardState ∈ standardStates ∧
        ∀ hshState, hshState ∈ hshStates →
          standardDetectorReadoutMap models readout standardState ≠
            hshDetectorReadoutMap models readout hshState) := by
  constructor
  · intro h
    exact
      ⟨(hshDetectorExclusive_nonempty_iff_heterogeneousFiberWitness
          models readout hshStates standardStates).mp h.1,
        (standardDetectorExclusive_nonempty_iff_heterogeneousFiberWitness
          models readout hshStates standardStates).mp h.2⟩
  · intro h
    exact
      ⟨(hshDetectorExclusive_nonempty_iff_heterogeneousFiberWitness
          models readout hshStates standardStates).mpr h.1,
        (standardDetectorExclusive_nonempty_iff_heterogeneousFiberWitness
          models readout hshStates standardStates).mpr h.2⟩

/-- A heterogeneous evidence-gated comparison uses one frozen measurement
    packet and one common carrier identity for both model-specific
    projections. -/
structure HeterogeneousEvidenceGatedModelComparison
    (HState : Type uH) (SState : Type uS)
    (HField : Type uHF) (SField : Type uSF)
    (CommonField : Type uCF)
    (Payload : MeasurementMode → Type uP) where
  packet : HeterogeneousFrozenMeasurementPacket CommonField Payload
  binding :
    HeterogeneousCandidateModelReadoutBinding
      HState SState HField SField CommonField
  packetIdentity :
    binding.packetId.value = packet.packet.packetId.value ∧
    binding.packetDigest.value = packet.packet.packetDigest.value
  commonCarrierIdentity :
    binding.models.commonCarrierId.value = packet.commonCarrierId.value ∧
    binding.models.commonCarrierArtifact = packet.commonCarrierArtifact
  candidateHardGate : hardGate binding.candidate.value
  readoutGate :
    commonReadoutEvidenceGate packet.packet.readout.contract
  detectorSeparation :
    heterogeneousDetectorLevelTwoSidedSeparation
      binding.models packet.packet.readout.contract
      binding.hshStates.value binding.standardStates.value

/-- The candidate exposed downstream is available only through the complete
    heterogeneous evidence-gated comparison. -/
def admittedCandidate
    (comparison :
      HeterogeneousEvidenceGatedModelComparison
        HState SState HField SField CommonField Payload) : Candidate :=
  comparison.binding.candidate.value

/-- Heterogeneous admission preserves the candidate's ordinary hard gate. -/
theorem admittedCandidate_has_hardGate
    (comparison :
      HeterogeneousEvidenceGatedModelComparison
        HState SState HField SField CommonField Payload) :
    hardGate (admittedCandidate comparison) :=
  comparison.candidateHardGate

/-- Heterogeneous admission preserves the frozen common readout evidence
    gate. The supplied propositions remain external evidence obligations. -/
theorem admittedComparison_has_readout_gate
    (comparison :
      HeterogeneousEvidenceGatedModelComparison
        HState SState HField SField CommonField Payload) :
    commonReadoutEvidenceGate comparison.packet.packet.readout.contract :=
  comparison.readoutGate

/-- Admission exposes exact packet and common-carrier identity equalities. -/
theorem admittedComparison_has_packet_and_carrier_identity
    (comparison :
      HeterogeneousEvidenceGatedModelComparison
        HState SState HField SField CommonField Payload) :
    comparison.binding.packetId.value =
        comparison.packet.packet.packetId.value ∧
    comparison.binding.packetDigest.value =
        comparison.packet.packet.packetDigest.value ∧
    comparison.binding.models.commonCarrierId.value =
        comparison.packet.commonCarrierId.value ∧
    comparison.binding.models.commonCarrierArtifact =
        comparison.packet.commonCarrierArtifact :=
  ⟨comparison.packetIdentity.1, comparison.packetIdentity.2,
    comparison.commonCarrierIdentity.1, comparison.commonCarrierIdentity.2⟩

/-- Admission preserves two-sided detector-level separation through the
    explicit heterogeneous projections and the packet's common readout. -/
theorem admittedComparison_has_detector_separation
    (comparison :
      HeterogeneousEvidenceGatedModelComparison
        HState SState HField SField CommonField Payload) :
    heterogeneousDetectorLevelTwoSidedSeparation
      comparison.binding.models comparison.packet.packet.readout.contract
      comparison.binding.hshStates.value
      comparison.binding.standardStates.value :=
  comparison.detectorSeparation

/-- One projection theorem exposes the candidate gate, readout gate, packet
    identity, common-carrier identity, and heterogeneous detector separation. -/
theorem admittedComparison_exposes_all_gates
    (comparison :
      HeterogeneousEvidenceGatedModelComparison
        HState SState HField SField CommonField Payload) :
    hardGate comparison.binding.candidate.value ∧
    commonReadoutEvidenceGate comparison.packet.packet.readout.contract ∧
    comparison.binding.packetId.value =
      comparison.packet.packet.packetId.value ∧
    comparison.binding.packetDigest.value =
      comparison.packet.packet.packetDigest.value ∧
    comparison.binding.models.commonCarrierId.value =
      comparison.packet.commonCarrierId.value ∧
    comparison.binding.models.commonCarrierArtifact =
      comparison.packet.commonCarrierArtifact ∧
    heterogeneousDetectorLevelTwoSidedSeparation
      comparison.binding.models comparison.packet.packet.readout.contract
      comparison.binding.hshStates.value
      comparison.binding.standardStates.value := by
  exact
    ⟨comparison.candidateHardGate,
      comparison.readoutGate,
      comparison.packetIdentity.1,
      comparison.packetIdentity.2,
      comparison.commonCarrierIdentity.1,
      comparison.commonCarrierIdentity.2,
      comparison.detectorSeparation⟩

#print axioms hshDetectorReadoutMap_is_composed_projection
#print axioms standardDetectorReadoutMap_is_composed_projection
#print axioms commonCarrier_projection_collision_implies_detector_collision
#print axioms hshDetectorExclusive_nonempty_iff_heterogeneousFiberWitness
#print axioms standardDetectorExclusive_nonempty_iff_heterogeneousFiberWitness
#print axioms heterogeneousTwoSidedSeparation_iff_fiberWitnesses
#print axioms admittedCandidate_has_hardGate
#print axioms admittedComparison_has_readout_gate
#print axioms admittedComparison_has_packet_and_carrier_identity
#print axioms admittedComparison_has_detector_separation
#print axioms admittedComparison_exposes_all_gates

end HsHVerification.HeterogeneousReadoutFiberSeparation
