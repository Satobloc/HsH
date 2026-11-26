import Mathlib

namespace HsHVerification.HumanAIInfluenceProvenance

/-!
A source-grounded measurement model for human–AI group interaction.

Motivation: Parisi et al., "Real-Time Group Dynamics with LLM Facilitation:
Evidence from a Charity Allocation Task" (FAccT 2026),
DOI 10.1145/3805689.3812253. The paper reports that aggregate consensus,
allocation, participation equity, and perceived inclusion can move
differently. The abstract witnesses below are logical counterexamples only;
they are NOT reconstructed participant data and do not encode the paper's
statistical estimates.

The provenance path separates a participant source message, a facilitator
transformation, recipient exposure, recipient uptake, and a later outcome.
Opaque evidence IDs/digests are locators: Lean does not authenticate their
contents, establish semantic fidelity, or infer causation from temporal order.
-/

structure GroupTrace where
  consensus : Bool
  allocationShift : Bool
  participationInequality : Bool
  facilitatorAttribution : Bool
  perceivedInclusion : Bool
  deriving DecidableEq, Repr

def consensusReadout (g : GroupTrace) : Bool :=
  g.consensus

def processReadout (g : GroupTrace) : Bool × (Bool × Bool) :=
  (g.allocationShift, (g.participationInequality, g.facilitatorAttribution))

def participationReadout (g : GroupTrace) : Bool :=
  g.participationInequality

def perceptionReadout (g : GroupTrace) : Bool :=
  g.perceivedInclusion

def processTraceA : GroupTrace :=
  { consensus := true
    allocationShift := false
    participationInequality := false
    facilitatorAttribution := false
    perceivedInclusion := false }

def processTraceB : GroupTrace :=
  { consensus := true
    allocationShift := true
    participationInequality := true
    facilitatorAttribution := true
    perceivedInclusion := true }

def perceptionTraceA : GroupTrace :=
  { consensus := false
    allocationShift := false
    participationInequality := true
    facilitatorAttribution := false
    perceivedInclusion := false }

def perceptionTraceB : GroupTrace :=
  { consensus := true
    allocationShift := true
    participationInequality := true
    facilitatorAttribution := true
    perceivedInclusion := true }

theorem consensus_fiber_witness :
    consensusReadout processTraceA = consensusReadout processTraceB ∧
    processReadout processTraceA ≠ processReadout processTraceB := by
  constructor <;> decide

theorem participation_fiber_witness :
    participationReadout perceptionTraceA = participationReadout perceptionTraceB ∧
    perceptionReadout perceptionTraceA ≠ perceptionReadout perceptionTraceB := by
  constructor <;> decide

theorem no_decoder_of_fiber_witness
    {History Outcome Process : Type}
    (observe : History → Outcome)
    (process : History → Process)
    (h₁ h₂ : History)
    (sameObservation : observe h₁ = observe h₂)
    (differentProcess : process h₁ ≠ process h₂) :
    ¬ ∃ decode : Outcome → Process, ∀ h, decode (observe h) = process h := by
  rintro ⟨decode, hdecode⟩
  apply differentProcess
  calc
    process h₁ = decode (observe h₁) := (hdecode h₁).symm
    _ = decode (observe h₂) := congrArg decode sameObservation
    _ = process h₂ := hdecode h₂

theorem process_not_recoverable_from_consensus :
    ¬ ∃ decode : Bool → Bool × (Bool × Bool),
        ∀ g, decode (consensusReadout g) = processReadout g := by
  exact no_decoder_of_fiber_witness
    consensusReadout processReadout processTraceA processTraceB
    (by rfl) (by decide)

theorem perception_not_recoverable_from_participation :
    ¬ ∃ decode : Bool → Bool,
        ∀ g, decode (participationReadout g) = perceptionReadout g := by
  exact no_decoder_of_fiber_witness
    participationReadout perceptionReadout perceptionTraceA perceptionTraceB
    (by rfl) (by decide)

inductive TransformationKind
  | verbatim
  | paraphrase
  | summary
  | synthesis
  | proposal
  deriving DecidableEq, Repr

structure FacilitatorTransformation where
  sourceMessageId : String
  sourceContentDigest : String
  sourceAuthorId : String
  facilitatorMessageId : String
  facilitatorContentDigest : String
  transformationEvidenceId : String
  kind : TransformationKind
  sourceRound : Nat
  transformationRound : Nat
  sourcePrecedesTransformation : sourceRound ≤ transformationRound

structure ExposureEvent where
  facilitatorMessageId : String
  recipientId : String
  visibilityEvidenceId : String
  exposureRound : Nat

structure UptakeEvent where
  facilitatorMessageId : String
  recipientId : String
  uptakeMessageId : String
  uptakeEvidenceId : String
  uptakeRound : Nat

structure OutcomeEvent where
  recipientId : String
  outcomeId : String
  outcomeEvidenceId : String
  outcomeRound : Nat

structure AttributionPath where
  transformation : FacilitatorTransformation
  exposure : ExposureEvent
  uptake : UptakeEvent
  outcome : OutcomeEvent
  transformationExposureMessageMatches :
    transformation.facilitatorMessageId = exposure.facilitatorMessageId
  exposureUptakeMessageMatches :
    exposure.facilitatorMessageId = uptake.facilitatorMessageId
  exposureUptakeRecipientMatches :
    exposure.recipientId = uptake.recipientId
  uptakeOutcomeRecipientMatches :
    uptake.recipientId = outcome.recipientId
  sourceMessageRecorded :
    transformation.sourceMessageId ≠ ""
  sourceDigestRecorded :
    transformation.sourceContentDigest ≠ ""
  transformationEvidenceRecorded :
    transformation.transformationEvidenceId ≠ ""
  visibilityEvidenceRecorded :
    exposure.visibilityEvidenceId ≠ ""
  uptakeEvidenceRecorded :
    uptake.uptakeEvidenceId ≠ ""
  outcomeEvidenceRecorded :
    outcome.outcomeEvidenceId ≠ ""
  transformationBeforeExposure :
    transformation.transformationRound ≤ exposure.exposureRound
  exposureBeforeUptake :
    exposure.exposureRound < uptake.uptakeRound
  uptakeBeforeOutcome :
    uptake.uptakeRound ≤ outcome.outcomeRound

theorem attribution_path_has_ordered_events (p : AttributionPath) :
    p.transformation.sourceRound ≤ p.transformation.transformationRound ∧
    p.transformation.transformationRound ≤ p.exposure.exposureRound ∧
    p.exposure.exposureRound < p.uptake.uptakeRound ∧
    p.uptake.uptakeRound ≤ p.outcome.outcomeRound := by
  exact ⟨p.transformation.sourcePrecedesTransformation,
    p.transformationBeforeExposure,
    p.exposureBeforeUptake,
    p.uptakeBeforeOutcome⟩

structure PotentialOutcomePair (Outcome : Type) where
  withFacilitator : Outcome
  withoutFacilitator : Outcome

def hasNonzeroContrast {Outcome : Type} [DecidableEq Outcome]
    (p : PotentialOutcomePair Outcome) : Prop :=
  p.withFacilitator ≠ p.withoutFacilitator

structure AttributedInteraction where
  path : AttributionPath
  potentialOutcomes : PotentialOutcomePair Bool

def nullEffectInteraction (path : AttributionPath) : AttributedInteraction :=
  { path := path
    potentialOutcomes := ⟨true, true⟩ }

theorem provenance_path_does_not_force_nonzero_effect (path : AttributionPath) :
    ¬ hasNonzeroContrast (nullEffectInteraction path).potentialOutcomes := by
  simp [hasNonzeroContrast, nullEffectInteraction]

#print axioms process_not_recoverable_from_consensus
#print axioms perception_not_recoverable_from_participation
#print axioms attribution_path_has_ordered_events
#print axioms provenance_path_does_not_force_nonzero_effect

end HsHVerification.HumanAIInfluenceProvenance
