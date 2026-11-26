import Mathlib
import HsHVerification.ModelSelectionPreference
import HsHVerification.SharedReadoutFiberSeparation

/-!
# Evidence-gated candidate admission

The shared-readout module supplies an evidence-gated readout wrapper, while
ModelSelectionPreference supplies a separate candidate hard gate. This module
binds them into one downstream admission object and adds a tie-break API that
accepts only two complete objects based on the same frozen measurement packet.

The packet and candidate/model binding are concrete typed records, not a
caller-selected proposition. The candidate and model values travel together
with nonempty source-artifact locators, and the candidate/model bundle must
repeat the exact packet ID and digest. The readout used for detector separation
is taken directly from that packet.

Lean checks the record shape, nonempty metadata fields, and exact key/digest
equalities. It does not validate SHA formats, resolve locators, authenticate
artifacts, or prove that a referenced source file implements the associated
Lean value. Those remain independent source-review obligations.

This is an opt-in safe admission surface. The legacy Candidate and
intelligibilityTieBreak APIs are not removed or globally rewritten here.
-/

namespace HsHVerification.EvidenceGatedAdmission

open HsHVerification.MeasurementDomainCompatibility
open HsHVerification.ModelSelectionPreference
open HsHVerification.SharedReadoutFiberSeparation

universe u v w

variable {State : Type u} {Field : Type v}
variable {Payload : MeasurementMode → Type w}

/-- A nonempty metadata value. This rejects blank fields but does not validate
    a digest format, resolve a locator, or authenticate its contents. -/
structure NonEmptyText where
  value : String
  nonempty : value ≠ ""

/-- A source artifact locator. The repository, commit, path, and blob identity
    are explicit, but their existence and byte-level correspondence remain
    external verification obligations. -/
structure SourceArtifactRef where
  repository : NonEmptyText
  commit : NonEmptyText
  path : NonEmptyText
  blobSha : NonEmptyText

/-- A candidate value carried together with its stable identifier and the
    source artifact from which its declared representation is reviewed. -/
structure IdentifiedCandidate where
  id : NonEmptyText
  value : Candidate
  source : SourceArtifactRef

/-- A model map carried together with its stable identifier and source
    artifact. The locator is not a Lean proof that the artifact implements
    this function. -/
structure IdentifiedLatentFieldModel (State : Type u) (Field : Type v) where
  id : NonEmptyText
  value : LatentFieldModel State Field
  source : SourceArtifactRef

/-- An admissible state set with an explicit source locator. -/
structure IdentifiedStateSet (State : Type u) where
  id : NonEmptyText
  value : Set State
  source : SourceArtifactRef

/-- The common frozen measurement packet. Both candidate comparisons must
    use the same packet identity, digest, source system, dataset, shared
    readout identity, and exact evidence-gated readout contract. -/
structure FrozenMeasurementPacket (Field : Type v)
    (Payload : MeasurementMode → Type w) where
  packetId : NonEmptyText
  packetDigest : NonEmptyText
  sourceSystemId : NonEmptyText
  datasetId : NonEmptyText
  sharedReadoutId : NonEmptyText
  manifest : SourceArtifactRef
  sourceSystemArtifact : SourceArtifactRef
  datasetArtifact : SourceArtifactRef
  readoutArtifact : SourceArtifactRef
  readout : EvidenceGatedFrozenCommonReadout Field Payload

/-- Candidate-specific model maps and admissible state sets bound to one
    frozen measurement packet. The packet ID and digest are repeated so the
    comparison must prove exact identity with the packet it actually reads. -/
structure CandidateModelReadoutBinding (State : Type u) (Field : Type v) where
  packetId : NonEmptyText
  packetDigest : NonEmptyText
  candidate : IdentifiedCandidate
  hshModel : IdentifiedLatentFieldModel State Field
  standardModel : IdentifiedLatentFieldModel State Field
  hshStates : IdentifiedStateSet State
  standardStates : IdentifiedStateSet State
  manifest : SourceArtifactRef

/-- A candidate may enter this detector-level comparison only with its
    ordinary hard-gate evidence, one typed candidate/model binding to the
    exact frozen packet, and two-sided separation computed through the
    readout carried by that same packet. -/
structure EvidenceGatedModelComparison where
  packet : FrozenMeasurementPacket Field Payload
  binding : CandidateModelReadoutBinding State Field
  bindingPacketIdentity :
    binding.packetId.value = packet.packetId.value ∧
    binding.packetDigest.value = packet.packetDigest.value
  candidateHardGate : hardGate binding.candidate.value
  detectorSeparation :
    evidenceGatedDetectorLevelTwoSidedSeparation
      binding.hshModel.value binding.standardModel.value packet.readout
      binding.hshStates.value binding.standardStates.value

/-- The candidate exposed to downstream selection is available only through
    the complete evidence-gated comparison object. -/
def admittedCandidate
    (comparison : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) : Candidate :=
  comparison.binding.candidate.value

/-- Admission preserves the ordinary candidate hard gate. -/
theorem admittedCandidate_has_hardGate
    (comparison : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) :
    hardGate (admittedCandidate comparison) :=
  comparison.candidateHardGate

/-- Admission preserves the frozen readout's declared external evidence gate. -/
theorem admittedComparison_has_readout_gate
    (comparison : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) :
    commonReadoutEvidenceGate comparison.packet.readout.contract :=
  comparison.packet.readout.gate

/-- Admission exposes a fixed packet-binding relation rather than accepting
    an arbitrary proposition chosen by the comparison constructor. -/
theorem admittedComparison_has_source_model_readout_binding
    (comparison : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) :
    comparison.binding.packetId.value = comparison.packet.packetId.value ∧
    comparison.binding.packetDigest.value = comparison.packet.packetDigest.value :=
  comparison.bindingPacketIdentity

/-- Admission preserves two-sided separation in the evidence-gated detector
    space, using the readout carried by the common measurement packet. -/
theorem admittedComparison_has_detector_separation
    (comparison : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) :
    evidenceGatedDetectorLevelTwoSidedSeparation
      comparison.binding.hshModel.value comparison.binding.standardModel.value
      comparison.packet.readout comparison.binding.hshStates.value
      comparison.binding.standardStates.value :=
  comparison.detectorSeparation

/-- A single projection theorem exposes every obligation required by the new
    downstream admission surface, including the fixed packet identity. -/
theorem admittedComparison_exposes_all_gates
    (comparison : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) :
    hardGate comparison.binding.candidate.value ∧
    commonReadoutEvidenceGate comparison.packet.readout.contract ∧
    comparison.binding.packetId.value = comparison.packet.packetId.value ∧
    comparison.binding.packetDigest.value = comparison.packet.packetDigest.value ∧
    evidenceGatedDetectorLevelTwoSidedSeparation
      comparison.binding.hshModel.value comparison.binding.standardModel.value
      comparison.packet.readout comparison.binding.hshStates.value
      comparison.binding.standardStates.value := by
  exact
    ⟨comparison.candidateHardGate,
      comparison.packet.readout.gate,
      comparison.bindingPacketIdentity.1,
      comparison.bindingPacketIdentity.2,
      comparison.detectorSeparation⟩

/-- Evidence-gated tie-break: both candidates must carry complete
    detector-level admissions, and both admissions must refer to the same
    frozen packet ID, digest, and manifest locator, source system,
    dataset, shared-readout ID, and exact readout contract (operator,
    version, calibration, acquisition-unit map, units, uncertainty,
    and resolution). The manifest equality is locator-level identity
    only; it does not authenticate manifest bytes. -/
def evidenceGatedIntelligibilityTieBreak
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) : Prop :=
  a.packet.packetId.value = b.packet.packetId.value ∧
  a.packet.packetDigest.value = b.packet.packetDigest.value ∧
  a.packet.manifest = b.packet.manifest ∧
  a.packet.sourceSystemId.value = b.packet.sourceSystemId.value ∧
  a.packet.datasetId.value = b.packet.datasetId.value ∧
  a.packet.sharedReadoutId.value = b.packet.sharedReadoutId.value ∧
  a.packet.readout.contract = b.packet.readout.contract ∧
  empiricallyEquivalent a.binding.candidate.value b.binding.candidate.value ∧
  humanPrefers a.binding.candidate.value b.binding.candidate.value ∧
  noMoreComplex a.binding.candidate.value.complexity
    b.binding.candidate.value.complexity

/-- A successful evidence-gated tie-break requires the same declared
    frozen measurement-packet manifest locator. This is locator equality,
    not byte-level manifest authentication. -/
theorem evidenceGatedIntelligibilityTieBreak_requires_same_packet_manifest
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload))
    (h : evidenceGatedIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    a.packet.manifest = b.packet.manifest := by
  rcases h with ⟨_, _, hManifest, _, _, _, _, _, _, _⟩
  exact hManifest

/-- A successful evidence-gated tie-break retains both candidates' hard
    gates, both readout gates, both packet-binding witnesses, both
    detector-separation witnesses, and exact equality of the common packet
    identity, manifest locator, provenance labels, and frozen readout contracts. -/
theorem evidenceGatedIntelligibilityTieBreak_requires_gates
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload))
    (h : evidenceGatedIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    hardGate a.binding.candidate.value ∧
    hardGate b.binding.candidate.value ∧
    commonReadoutEvidenceGate a.packet.readout.contract ∧
    commonReadoutEvidenceGate b.packet.readout.contract ∧
    a.binding.packetId.value = a.packet.packetId.value ∧
    a.binding.packetDigest.value = a.packet.packetDigest.value ∧
    b.binding.packetId.value = b.packet.packetId.value ∧
    b.binding.packetDigest.value = b.packet.packetDigest.value ∧
    a.packet.packetId.value = b.packet.packetId.value ∧
    a.packet.packetDigest.value = b.packet.packetDigest.value ∧
    a.packet.manifest = b.packet.manifest ∧
    a.packet.sourceSystemId.value = b.packet.sourceSystemId.value ∧
    a.packet.datasetId.value = b.packet.datasetId.value ∧
    a.packet.sharedReadoutId.value = b.packet.sharedReadoutId.value ∧
    a.packet.readout.contract = b.packet.readout.contract ∧
    a.packet.readout.contract.mode = b.packet.readout.contract.mode ∧
    evidenceGatedDetectorLevelTwoSidedSeparation
      a.binding.hshModel.value a.binding.standardModel.value a.packet.readout
      a.binding.hshStates.value a.binding.standardStates.value ∧
    evidenceGatedDetectorLevelTwoSidedSeparation
      b.binding.hshModel.value b.binding.standardModel.value b.packet.readout
      b.binding.hshStates.value b.binding.standardStates.value := by
  rcases h with
    ⟨hPacketId, hPacketDigest, hManifest, hSystem, hDataset, hReadout,
      hContract, hEquivalent, hPreference, hComplexity⟩
  rcases a.bindingPacketIdentity with ⟨haPacketId, haPacketDigest⟩
  rcases b.bindingPacketIdentity with ⟨hbPacketId, hbPacketDigest⟩
  exact
    ⟨a.candidateHardGate,
      b.candidateHardGate,
      a.packet.readout.gate,
      b.packet.readout.gate,
      haPacketId,
      haPacketDigest,
      hbPacketId,
      hbPacketDigest,
      hPacketId,
      hPacketDigest,
      hManifest,
      hSystem,
      hDataset,
      hReadout,
      hContract,
      congrArg (fun contract => contract.mode) hContract,
      a.detectorSeparation,
      b.detectorSeparation⟩

#print axioms admittedCandidate_has_hardGate
#print axioms admittedComparison_has_readout_gate
#print axioms admittedComparison_has_source_model_readout_binding
#print axioms admittedComparison_has_detector_separation
#print axioms admittedComparison_exposes_all_gates
#print axioms evidenceGatedIntelligibilityTieBreak_requires_same_packet_manifest
#print axioms evidenceGatedIntelligibilityTieBreak_requires_gates

end HsHVerification.EvidenceGatedAdmission
