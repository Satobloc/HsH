import Mathlib

/-!
# Orson external comparator: stated answer and latent representation

Primary source:
Ziang Ni and Peng Zou, "Silent Dissent: LLM Agents That Yield to the
Majority Still Represent Their Original Premise", arXiv:2610.02702v1
(2026-10-02), abstract and the paper's held-out-test/readout discussion.

Source-reported measurement:
The paper defines its J-lens score as the original-bridge hit@100 rate minus
the control-bridge hit@100 rate, averaged over pre-registered layers and
records. Its Qwen3.5-4B example reports 0.852 (95% bootstrap interval
[0.782, 0.917], n=54) for that contrast, not "85.2% of agents retaining a
belief". The paper explicitly says the readout is a one-sided representation
proxy, not proof of belief; absence of a readout does not prove absence of
the represented premise. The initially-correct subset was only 3-9% of
TwoHopFact per model.

This module proves only two conditional measurement facts:
1. A visible answer alone need not identify a distinct latent representation.
2. A difference of two admissible hit rates does not identify either marginal.

The Boolean state is a finite countermodel, not a transcription of any
specific LLM's internal state. The hit-rate profiles below are mathematical
witnesses, not observed control rates or reconstructed experiment data.
No claim about belief, consciousness, causal uptake, or model internals is
formalized or established here.
-/

namespace HsHVerification
namespace OrsonSilentDissentReadout

/-- A deliberately minimal two-coordinate state: public answer and a
    separate latent representation indicator. -/
structure AgentState where
  stated : Bool
  represented : Bool
  deriving DecidableEq, Repr

/-- The externally reported answer. -/
def visibleAnswer (s : AgentState) : Bool := s.stated

/-- A distinct internal-representation coordinate in the toy state. -/
def latentBridge (s : AgentState) : Bool := s.represented

/-- Two states can have the same visible answer and different latent
    representation coordinates. This is a countermodel to output-only
    identification, not an empirical claim about a particular model. -/
theorem same_answer_different_latent_bridge :
    ∃ s t : AgentState,
      visibleAnswer s = visibleAnswer t ∧
      latentBridge s ≠ latentBridge t := by
  refine ⟨⟨false, false⟩, ⟨false, true⟩, rfl, ?_⟩
  decide

/-- No deterministic decoder from the visible answer alone can recover the
    latent representation coordinate for every state in this state space. -/
theorem no_output_only_decoder :
    ¬ ∃ decode : Bool → Bool,
      ∀ s : AgentState, decode (visibleAnswer s) = latentBridge s := by
  rintro ⟨decode, hdecode⟩
  have h₀ : decode false = false := by
    simpa [visibleAnswer, latentBridge] using hdecode ⟨false, false⟩
  have h₁ : decode false = true := by
    simpa [visibleAnswer, latentBridge] using hdecode ⟨false, true⟩
  have hFalse : (false : Bool) = true := h₀.symm.trans h₁
  cases hFalse

/-- Adding a second observation coordinate can refine the observation map.
    This only says that the joint pair contains its second coordinate. It
    does not validate any empirical readout instrument. -/
def jointReadout (s : AgentState) : Bool × Bool :=
  (visibleAnswer s, latentBridge s)

theorem joint_readout_identifies_latent_coordinate
    (s t : AgentState)
    (h : jointReadout s = jointReadout t) :
    latentBridge s = latentBridge t :=
  congrArg Prod.snd h

/-- The source's hit@100 contrast: target-bridge hit rate minus control-bridge
    hit rate. -/
def hitContrast (bridgeHit controlHit : ℝ) : ℝ :=
  bridgeHit - controlHit

/-- An admissible profile treats both hit rates as probabilities. -/
def admissibleHitProfile (p : ℝ × ℝ) : Prop :=
  0 ≤ p.1 ∧ p.1 ≤ 1 ∧ 0 ≤ p.2 ∧ p.2 ≤ 1

theorem hitContrast_bounded
    (p : ℝ × ℝ)
    (hp : admissibleHitProfile p) :
    -1 ≤ hitContrast p.1 p.2 ∧
      hitContrast p.1 p.2 ≤ 1 := by
  rcases hp with ⟨h₁₀, h₁₁, h₂₀, h₂₁⟩
  unfold hitContrast
  constructor <;> linarith

/-- Illustrative profile A: the target hit rate is 0.852 and the control rate
    is 0. These are a proof witness, not observed paper marginals. -/
def witnessProfileA : ℝ × ℝ :=
  (852 / 1000, 0)

/-- Illustrative profile B: the target hit rate is 0.952 and the control rate
    is 0.100. It has the same 0.852 contrast but a different target hit rate.
    These are a proof witness, not observed paper marginals. -/
def witnessProfileB : ℝ × ℝ :=
  (952 / 1000, 100 / 1000)

theorem witness_profiles_admissible :
    admissibleHitProfile witnessProfileA ∧
      admissibleHitProfile witnessProfileB := by
  norm_num [admissibleHitProfile, witnessProfileA, witnessProfileB]

/-- The same contrast is compatible with distinct target hit rates, even
    when both target and control hit rates are constrained to [0,1]. -/
theorem same_contrast_different_target_hit :
    hitContrast witnessProfileA.1 witnessProfileA.2 =
      hitContrast witnessProfileB.1 witnessProfileB.2 ∧
    witnessProfileA.1 ≠ witnessProfileB.1 := by
  norm_num [witnessProfileA, witnessProfileB, hitContrast]

/-- Therefore the contrast alone is not an identifying statistic for the
    target-bridge hit rate on the admissible probability domain. -/
theorem hitContrast_not_identifying_target_hit :
    ¬ ∀ p q : ℝ × ℝ,
      admissibleHitProfile p →
      admissibleHitProfile q →
      hitContrast p.1 p.2 = hitContrast q.1 q.2 →
      p.1 = q.1 := by
  intro h
  have hTarget :
      witnessProfileA.1 = witnessProfileB.1 :=
    h witnessProfileA witnessProfileB
      witness_profiles_admissible.1
      witness_profiles_admissible.2
      same_contrast_different_target_hit.1
  exact same_contrast_different_target_hit.2 hTarget

#print axioms same_answer_different_latent_bridge
#print axioms no_output_only_decoder
#print axioms joint_readout_identifies_latent_coordinate
#print axioms hitContrast_bounded
#print axioms witness_profiles_admissible
#print axioms same_contrast_different_target_hit
#print axioms hitContrast_not_identifying_target_hit

end OrsonSilentDissentReadout
end HsHVerification
