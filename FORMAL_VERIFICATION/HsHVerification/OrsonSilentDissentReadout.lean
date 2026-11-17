import Mathlib

/-!
# Orson external comparator: stated answer and latent representation

Previously crosswalked in HsH issue #1672; this is a conditional P1-specific
formalization, not a new literature discovery.

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

This module contains only conditional mathematical statements:
1. If an observation map has a fiber containing states with different latent
   values, no deterministic decoder from that observation alone can recover
   the latent value for every state.
2. A hit-rate difference does not identify either marginal on the interior
   of the admissible probability domain, because a common positive shift
   preserves the difference while changing both marginals.

No synthetic state, numerical witness profile, or reconstructed experiment
data is instantiated. The conditions are not evidence that any actual LLM
has the required latent-state collision. No claim about belief,
consciousness, causal uptake, or model internals is established here.
-/

namespace HsHVerification
namespace OrsonSilentDissentReadout

/-- A collision in an observation fiber prevents any decoder from recovering
    the latent value for every state. This is conditional on the stated
    collision; it does not assert that a particular LLM has one. -/
theorem no_observation_only_decoder_of_fiber_collision
    {State Observation Latent : Type}
    (observe : State → Observation)
    (latent : State → Latent)
    (hCollision :
      ∃ s t : State,
        observe s = observe t ∧ latent s ≠ latent t) :
    ¬ ∃ decode : Observation → Latent,
      ∀ s : State, decode (observe s) = latent s := by
  rintro ⟨decode, hdecode⟩
  rcases hCollision with ⟨s, t, hobs, hlatent⟩
  apply hlatent
  calc
    latent s = decode (observe s) := (hdecode s).symm
    _ = decode (observe t) := by rw [hobs]
    _ = latent t := hdecode t

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

/-- For any interior pair of admissible hit rates, a sufficiently small
    common positive shift preserves the contrast while changing the target
    hit rate. This proves conditional non-identifiability without choosing
    numerical witness values. -/
theorem hitContrast_not_identifying_target_hit_on_interior
    (bridge control shift : ℝ)
    (hBridgePos : 0 < bridge)
    (hBridgeLtOne : bridge < 1)
    (hControlPos : 0 < control)
    (hControlLtOne : control < 1)
    (hShiftPos : 0 < shift)
    (hBridgeRoom : shift < 1 - bridge)
    (hControlRoom : shift < 1 - control) :
    admissibleHitProfile (bridge, control) ∧
    admissibleHitProfile (bridge + shift, control + shift) ∧
    hitContrast bridge control =
      hitContrast (bridge + shift) (control + shift) ∧
    bridge ≠ bridge + shift := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact ⟨le_of_lt hBridgePos, le_of_lt hBridgeLtOne,
      le_of_lt hControlPos, le_of_lt hControlLtOne⟩
  · refine ⟨?_, ?_, ?_, ?_⟩ <;> linarith
  · unfold hitContrast
    ring
  · linarith

#print axioms no_observation_only_decoder_of_fiber_collision
#print axioms hitContrast_bounded
#print axioms hitContrast_not_identifying_target_hit_on_interior

end OrsonSilentDissentReadout
end HsHVerification
