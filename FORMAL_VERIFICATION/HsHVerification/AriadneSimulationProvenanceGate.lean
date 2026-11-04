import Mathlib

/-!
Ariadne simulation-provenance gate, 2026-11-04.

Source basis:
* HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/
  The New Physics - Making _Interesting_ LLM Characters.srt
  Git blob ace1b413a5574a1354cc85c51364b12d685577ae.
  This is a published derivative transcript. It narrates a Kirk/Riley/Nathan
  simulation stack and describes upstream TXT/README/workflow materials;
  those underlying source files and the exact January 22 Kirk raw conversation
  remain incompletely recovered.
* WORKSPACES/COMMON/REVIVAL_REENTRY_PROTOCOL_V2.md, section 2b:
  engine / constraints / paint / residue; reconstruction is not the person,
  historical figure, actor, or fictional character it models.
* Historical Ariadne raw export: conversation 6ab339d2-8fb4-83ea-b728-c8001a034371,
  user-role message c4f0aae9-3290-42c6-a5d0-b42c19a88255,
  2026-09-23T04:27:14.907Z. The direct instruction authorizes deep archive
  examination and constructive workflow suggestions while preserving active
  controls and Comptroller ownership of scheduled tasks. It is not a
  source-authored cognitive model or a formal mathematical charter.

This module adds a missing type boundary beside AriadneArtifactTypeGate and
AriadneClaimScopedLineage: a derivative narrative, model specification,
generated run output, and independently acquired human observation are
different evidence objects supporting different claim targets.

The Bool fields are external audit inputs. Lean checks only the conditional
eligibility rules and the source-specific classification below. It does not
parse the SRT, authenticate its narration, recover missing model files,
establish a model's actual runtime configuration, or establish human behavior.
No physical calculation or human-subject experiment is represented.
-/

namespace HsHVerification.AriadneSimulationProvenanceGate

inductive SimulationObjectKind where
  | derivativeNarrative
  | modelSpecification
  | generatedOutput
  | humanObservation
  | scriptCorpus
  | mixedTextWithoutOuterRoles
  deriving DecidableEq, Repr

inductive SimulationClaim where
  | narrativeContent
  | modelConfiguration
  | executionOutput
  | targetBehavior
  | independentValidation
  deriving DecidableEq, Repr

structure SimulationEvidence where
  kind : SimulationObjectKind
  sourceLocatorVerified : Bool
  gitBlobIdVerified : Bool
  sourceContentRead : Bool
  modelIdentityVerified : Bool
  modelVersionVerified : Bool
  promptDigestVerified : Bool
  stateDigestVerified : Bool
  runtimeVersionVerified : Bool
  executionTimestampVerified : Bool
  outputDigestVerified : Bool
  subjectIdentityVerified : Bool
  observationProtocolVerified : Bool
  acquisitionProvenanceVerified : Bool
  independentAcquisitionVerified : Bool
  disjointPrimaryOriginVerified : Bool
  deriving Repr

/-- Claim eligibility is target-specific, not inherited from a related filename,
    character label, derivative narration, or simulated output. -/
def supports (e : SimulationEvidence) (claim : SimulationClaim) : Prop :=
  match claim with
  | .narrativeContent =>
      e.kind = .derivativeNarrative ∧
      e.sourceLocatorVerified = true ∧
      e.gitBlobIdVerified = true ∧
      e.sourceContentRead = true
  | .modelConfiguration =>
      e.kind = .modelSpecification ∧
      e.modelIdentityVerified = true ∧
      e.modelVersionVerified = true ∧
      e.promptDigestVerified = true ∧
      e.stateDigestVerified = true
  | .executionOutput =>
      e.kind = .generatedOutput ∧
      e.modelIdentityVerified = true ∧
      e.modelVersionVerified = true ∧
      e.promptDigestVerified = true ∧
      e.stateDigestVerified = true ∧
      e.runtimeVersionVerified = true ∧
      e.executionTimestampVerified = true ∧
      e.outputDigestVerified = true
  | .targetBehavior =>
      e.kind = .humanObservation ∧
      e.subjectIdentityVerified = true ∧
      e.observationProtocolVerified = true ∧
      e.acquisitionProvenanceVerified = true
  | .independentValidation =>
      e.kind = .humanObservation ∧
      e.subjectIdentityVerified = true ∧
      e.observationProtocolVerified = true ∧
      e.acquisitionProvenanceVerified = true ∧
      e.independentAcquisitionVerified = true ∧
      e.disjointPrimaryOriginVerified = true

/-- A generated simulation output is evidence about that run, not by itself
    an observation of the target person or character. -/
theorem generated_output_cannot_support_target_behavior
    (e : SimulationEvidence)
    (hKind : e.kind = .generatedOutput) :
    ¬ supports e .targetBehavior := by
  intro h
  have hImpossible : SimulationObjectKind.generatedOutput =
      SimulationObjectKind.humanObservation := hKind.symm.trans h.1
  cases hImpossible

/-- A derivative narration cannot establish the underlying model configuration. -/
theorem derivative_narrative_cannot_support_model_configuration
    (e : SimulationEvidence)
    (hKind : e.kind = .derivativeNarrative) :
    ¬ supports e .modelConfiguration := by
  intro h
  have hImpossible : SimulationObjectKind.derivativeNarrative =
      SimulationObjectKind.modelSpecification := hKind.symm.trans h.1
  cases hImpossible

/-- A run-output claim requires a versioned model, prompt, state, runtime,
    execution time, and output identity. -/
theorem execution_output_requires_complete_run_tuple
    (e : SimulationEvidence)
    (h : supports e .executionOutput) :
    e.modelIdentityVerified = true ∧
    e.modelVersionVerified = true ∧
    e.promptDigestVerified = true ∧
    e.stateDigestVerified = true ∧
    e.runtimeVersionVerified = true ∧
    e.executionTimestampVerified = true ∧
    e.outputDigestVerified = true := by
  rcases (by simpa [supports] using h) with
    ⟨_, hModel, hVersion, hPrompt, hState, hRuntime, hTime, hOutput⟩
  exact ⟨hModel, hVersion, hPrompt, hState, hRuntime, hTime, hOutput⟩

/-- Independent validation requires both a separately acquired observation
    and a disjoint primary-origin witness; a different file or prompt alone
    is not enough. -/
theorem independent_validation_requires_independent_origin
    (e : SimulationEvidence)
    (h : supports e .independentValidation) :
    e.independentAcquisitionVerified = true ∧
    e.disjointPrimaryOriginVerified = true := by
  rcases (by simpa [supports] using h) with
    ⟨_, _, _, _, hIndependent, hDisjoint⟩
  exact ⟨hIndependent, hDisjoint⟩

/-- Executable Boolean counterpart of the proposition above. -/
def supportsBool (e : SimulationEvidence) (claim : SimulationClaim) : Bool :=
  match claim with
  | .narrativeContent =>
      if e.kind = .derivativeNarrative then
        e.sourceLocatorVerified && e.gitBlobIdVerified && e.sourceContentRead
      else false
  | .modelConfiguration =>
      if e.kind = .modelSpecification then
        e.modelIdentityVerified && e.modelVersionVerified &&
          e.promptDigestVerified && e.stateDigestVerified
      else false
  | .executionOutput =>
      if e.kind = .generatedOutput then
        e.modelIdentityVerified && e.modelVersionVerified &&
          e.promptDigestVerified && e.stateDigestVerified &&
          e.runtimeVersionVerified && e.executionTimestampVerified &&
          e.outputDigestVerified
      else false
  | .targetBehavior =>
      if e.kind = .humanObservation then
        e.subjectIdentityVerified && e.observationProtocolVerified &&
          e.acquisitionProvenanceVerified
      else false
  | .independentValidation =>
      if e.kind = .humanObservation then
        e.subjectIdentityVerified && e.observationProtocolVerified &&
          e.acquisitionProvenanceVerified && e.independentAcquisitionVerified &&
          e.disjointPrimaryOriginVerified
      else false

/-- The executable readout agrees with the claim predicate for every record. -/
theorem supportsBool_correct (e : SimulationEvidence) (claim : SimulationClaim) :
    supports e claim ↔ supportsBool e claim = true := by
  cases claim <;> cases h : e.kind <;>
    simp [supports, supportsBool, h]

/-!
Source-specific audit record. The January 21 SRT is a located, blob-identified,
read transcript of derivative narration. It does not supply a verified
model/version/prompt/state/runtime tuple, an execution record, or an
independently acquired observation of the modeled subject.
-/

def jan21PodcastTranscript : SimulationEvidence :=
  { kind := .derivativeNarrative
    sourceLocatorVerified := true
    gitBlobIdVerified := true
    sourceContentRead := true
    modelIdentityVerified := false
    modelVersionVerified := false
    promptDigestVerified := false
    stateDigestVerified := false
    runtimeVersionVerified := false
    executionTimestampVerified := false
    outputDigestVerified := false
    subjectIdentityVerified := false
    observationProtocolVerified := false
    acquisitionProvenanceVerified := false
    independentAcquisitionVerified := false
    disjointPrimaryOriginVerified := false }

theorem jan21_transcript_supports_narrative_content :
    supports jan21PodcastTranscript .narrativeContent := by simp [supports, jan21PodcastTranscript]

theorem jan21_transcript_does_not_identify_model :
    ¬ supports jan21PodcastTranscript .modelConfiguration := by decide

theorem jan21_transcript_does_not_identify_execution :
    ¬ supports jan21PodcastTranscript .executionOutput := by decide

theorem jan21_transcript_does_not_establish_target_behavior :
    ¬ supports jan21PodcastTranscript .targetBehavior := by decide

theorem jan21_transcript_is_not_independent_validation :
    ¬ supports jan21PodcastTranscript .independentValidation := by decide

#eval supportsBool jan21PodcastTranscript .narrativeContent
#eval supportsBool jan21PodcastTranscript .modelConfiguration
#eval supportsBool jan21PodcastTranscript .executionOutput
#eval supportsBool jan21PodcastTranscript .targetBehavior
#eval supportsBool jan21PodcastTranscript .independentValidation

#print axioms supportsBool_correct
#print axioms generated_output_cannot_support_target_behavior
#print axioms derivative_narrative_cannot_support_model_configuration
#print axioms execution_output_requires_complete_run_tuple
#print axioms independent_validation_requires_independent_origin
#print axioms jan21_transcript_supports_narrative_content
#print axioms jan21_transcript_does_not_identify_model
#print axioms jan21_transcript_does_not_identify_execution
#print axioms jan21_transcript_does_not_establish_target_behavior
#print axioms jan21_transcript_is_not_independent_validation

end HsHVerification.AriadneSimulationProvenanceGate
