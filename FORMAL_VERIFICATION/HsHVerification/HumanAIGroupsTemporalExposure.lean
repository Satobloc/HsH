import Mathlib

namespace HsHVerification.HumanAIGroupsTemporalExposure

/-!
Source: Lin Chen et al., "AI agents reshape consensus formation in human groups",
arXiv:2609.02122 (2026-09-02), Supplementary Information:
"Game Procedure", "Influence Network Analysis", and Supplementary Figure 1.

The source describes random rematching each round, independent submissions before
partner responses are shown, and a history panel containing recent partner
descriptions (up to five rounds). Its directional score compares a participant's
round-r change with the direction toward the current partner's round-(r-1)
embedding.

A current-round pairing is not itself a witness that the target previously saw
that source's expression. The history panel may provide such exposure for some
pairs; the exact visibility relation must be recovered from pair/history records.
The first theorem below is deliberately limited to the immediately preceding
partner. The second structure permits any earlier, explicitly recorded exposure.

These are evidence-typing results, not an empirical reanalysis. A visibility
witness is necessary for exposure-qualified dyadic attribution, not sufficient
for causal influence. Shared group state, prior partners, common feedback,
homophily, and session effects remain alternative explanations. No braid-group
equivalence is asserted.
-/

/-- A candidate directional-alignment edge for the current round. -/
structure CurrentPairAlignmentCandidate
    (Participant : Type) (partner : Nat → Participant → Participant)
    (round : Nat) (target source : Participant) where
  currentPair : partner (round + 1) target = source
  directionalScore : ℝ

/-- Immediate prior-round pairing, a minimal direct-exposure proxy. -/
def immediatePriorDyadicExposure
    {Participant : Type} (partner : Nat → Participant → Participant)
    (round : Nat) (target source : Participant) : Prop :=
  partner round target = source

/--
A positive directional-alignment score can coexist with no immediate prior
dyadic exposure when the target's partner changed. This is conditional; it
does not decide whether the source was visible in an earlier history-panel slot.
-/
theorem positive_alignment_with_changed_partner_not_immediate_exposure
    {Participant : Type} (partner : Nat → Participant → Participant)
    (round : Nat) (target source : Participant)
    (candidate : CurrentPairAlignmentCandidate Participant partner round target source)
    (hPositive : 0 < candidate.directionalScore)
    (hChanged : partner round target ≠ source) :
    partner (round + 1) target = source ∧
      0 < candidate.directionalScore ∧
      ¬ immediatePriorDyadicExposure partner round target source := by
  exact ⟨candidate.currentPair, hPositive, hChanged⟩

/-- A recorded earlier visibility event for a source-target pair. -/
structure PriorVisibilityWitness (Participant : Type) where
  source : Participant
  target : Participant
  sourceMessageRound : Nat
  visibilityRound : Nat
  outcomeRound : Nat
  sourceMessagePrecedesVisibility : sourceMessageRound ≤ visibilityRound
  visibilityPrecedesOutcome : visibilityRound < outcomeRound
  sourceMessageVisibleToTarget : Prop
  visibilityProof : sourceMessageVisibleToTarget

/--
An alignment candidate upgraded for dyadic exposure analysis. The source,
target, and outcome round must match an explicit pre-outcome visibility record.
This does not by itself establish causation.
-/
structure ExposureQualifiedAlignment (Participant : Type) where
  source : Participant
  target : Participant
  outcomeRound : Nat
  directionalScore : ℝ
  exposure : PriorVisibilityWitness Participant
  sourceMatches : exposure.source = source
  targetMatches : exposure.target = target
  outcomeMatches : exposure.outcomeRound = outcomeRound

/-- Every exposure-qualified alignment carries a matching, earlier visibility witness. -/
theorem exposure_qualified_alignment_has_matching_preoutcome_witness
    {Participant : Type} (edge : ExposureQualifiedAlignment Participant) :
    edge.exposure.source = edge.source ∧
      edge.exposure.target = edge.target ∧
      edge.exposure.sourceMessageRound ≤ edge.exposure.visibilityRound ∧
      edge.exposure.visibilityRound < edge.outcomeRound ∧
      edge.exposure.sourceMessageVisibleToTarget := by
  refine ⟨edge.sourceMatches, edge.targetMatches,
    edge.exposure.sourceMessagePrecedesVisibility, ?_, edge.exposure.visibilityProof⟩
  simpa [edge.outcomeMatches] using edge.exposure.visibilityPrecedesOutcome

#print axioms positive_alignment_with_changed_partner_not_immediate_exposure
#print axioms exposure_qualified_alignment_has_matching_preoutcome_witness

end HsHVerification.HumanAIGroupsTemporalExposure
