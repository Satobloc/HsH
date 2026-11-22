import Mathlib
import HsHVerification.ModelSelectionPreference
import HsHVerification.SharedReadoutFiberSeparation

/-!
# Evidence-gated candidate admission

The shared-readout module supplies an evidence-gated readout wrapper, while
ModelSelectionPreference supplies a separate candidate hard gate. This module
binds them into one downstream admission object.

The binding proposition is an external evidence obligation: it must attest
that the candidate's source-bound system/dataset, its committed model maps,
and the exact readout contract all refer to the same frozen measurement
packet. Lean checks that a proof term is supplied; it does not authenticate
the packet or establish the physical truth of the proposition.

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

/-- A candidate may enter this detector-level comparison only with its
    ordinary hard-gate evidence, one evidence-gated frozen readout, an
    explicit source/model/readout binding witness, and two-sided separation
    computed through that same readout. -/
structure EvidenceGatedModelComparison where
  candidate : Candidate
  sourceSystemId : String
  datasetId : String
  readout : EvidenceGatedFrozenCommonReadout Field Payload
  hshModel : LatentFieldModel State Field
  standardModel : LatentFieldModel State Field
  hshStates : Set State
  standardStates : Set State
  candidateHardGate : hardGate candidate
  candidateModelReadoutBinding : Prop
  candidateModelReadoutBindingEvidence : candidateModelReadoutBinding
  detectorSeparation :
    evidenceGatedDetectorLevelTwoSidedSeparation
      hshModel standardModel readout hshStates standardStates

/-- The candidate exposed to downstream selection is available only through
    the complete evidence-gated comparison object. -/
def admittedCandidate
    (comparison : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) : Candidate :=
  comparison.candidate

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
    commonReadoutEvidenceGate comparison.readout.contract :=
  comparison.readout.gate

/-- Admission preserves the explicit source-system/dataset-to-model/readout
    binding obligation. The proposition's real-world truth remains external. -/
theorem admittedComparison_has_source_model_readout_binding
    (comparison : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) :
    comparison.candidateModelReadoutBinding :=
  comparison.candidateModelReadoutBindingEvidence

/-- Admission preserves two-sided separation in the evidence-gated detector
    space, using the same readout carried by the admission object. -/
theorem admittedComparison_has_detector_separation
    (comparison : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) :
    evidenceGatedDetectorLevelTwoSidedSeparation
      comparison.hshModel comparison.standardModel comparison.readout
      comparison.hshStates comparison.standardStates :=
  comparison.detectorSeparation

/-- A single projection theorem exposes all obligations required by the new
    downstream admission surface. -/
theorem admittedComparison_exposes_all_gates
    (comparison : EvidenceGatedModelComparison
      (State := State) (Field := Field) (Payload := Payload)) :
    hardGate comparison.candidate ∧
    commonReadoutEvidenceGate comparison.readout.contract ∧
    comparison.candidateModelReadoutBinding ∧
    evidenceGatedDetectorLevelTwoSidedSeparation
      comparison.hshModel comparison.standardModel comparison.readout
      comparison.hshStates comparison.standardStates := by
  exact
    ⟨comparison.candidateHardGate,
      comparison.readout.gate,
      comparison.candidateModelReadoutBindingEvidence,
      comparison.detectorSeparation⟩

#print axioms admittedCandidate_has_hardGate
#print axioms admittedComparison_has_readout_gate
#print axioms admittedComparison_has_source_model_readout_binding
#print axioms admittedComparison_has_detector_separation
#print axioms admittedComparison_exposes_all_gates

end HsHVerification.EvidenceGatedAdmission
