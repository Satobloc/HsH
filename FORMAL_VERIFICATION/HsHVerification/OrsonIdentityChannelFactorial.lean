import Mathlib

/-!
# Orson P1: identity-channel factorial and interaction identifiability

Source: Dietrich (2026), "Peer Identity Bias in Multi-Agent LLM Evaluation:
An Empirical Study Using the TRUST Democratic Discourse Analysis Pipeline",
arXiv:2604.22971, §§2-4.

The reported design observes:
* y11: Channel 1 and Channel 3 identity both visible;
* y10: Channel 1 visible, Channel 3 anonymized;
* y00: both channels anonymized.

It does not observe y01: Channel 1 anonymized while Channel 3 remains visible.

The paper defines the Channel-3 contrast under Channel-1 visibility,
the joint visible-versus-fully-anonymized contrast, and their difference
as a "Channel 1 contribution". This module proves that the difference is
the Channel-1 simple effect conditional on Channel 3 being anonymized.
It also proves that the missing fourth cell prevents identification of
the two-channel interaction.

This is an algebraic audit of the stated experimental design. It does not
validate the paper's empirical results, statistical interpretation, the
implementation of the pipeline, or a general causal claim about LLMs.
No empirical observations or physical fixtures are introduced.
-/

namespace HsHVerification.OrsonIdentityChannelFactorial

/-- The published Round-2-only anonymization contrast. -/
def deltaR2 (y11 y10 : ℝ) : ℝ := y11 - y10

/-- The published full-pipeline anonymization contrast. -/
def deltaFull (y11 y00 : ℝ) : ℝ := y11 - y00

/-- The paper's reported Channel-1 difference-of-contrasts. -/
def reportedChannel1Contrast (y11 y10 y00 : ℝ) : ℝ :=
  deltaFull y11 y00 - deltaR2 y11 y10

/-- Channel-1 visibility effect when Channel 3 is anonymized. -/
def channel1EffectWhenChannel3Hidden (y10 y00 : ℝ) : ℝ :=
  y10 - y00

/-- Channel-1 visibility effect when Channel 3 is visible. -/
def channel1EffectWhenChannel3Visible (y11 y01 : ℝ) : ℝ :=
  y11 - y01

/-- Channel-3 visibility effect when Channel 1 is visible. -/
def channel3EffectWhenChannel1Visible (y11 y10 : ℝ) : ℝ :=
  y11 - y10

/-- Channel-3 visibility effect when Channel 1 is anonymized. -/
def channel3EffectWhenChannel1Hidden (y01 y00 : ℝ) : ℝ :=
  y01 - y00

/-- Difference between the two Channel-1 simple effects. -/
def channelInteraction (y11 y10 y01 y00 : ℝ) : ℝ :=
  channel1EffectWhenChannel3Visible y11 y01 -
    channel1EffectWhenChannel3Hidden y10 y00

theorem reported_channel1_is_conditional_simple_effect
    (y11 y10 y00 : ℝ) :
    reportedChannel1Contrast y11 y10 y00 =
      channel1EffectWhenChannel3Hidden y10 y00 := by
  unfold reportedChannel1Contrast deltaFull deltaR2
    channel1EffectWhenChannel3Hidden
  ring

theorem full_contrast_is_path_decomposition
    (y11 y10 y00 : ℝ) :
    deltaFull y11 y00 =
      deltaR2 y11 y10 + reportedChannel1Contrast y11 y10 y00 := by
  unfold reportedChannel1Contrast deltaFull deltaR2
  ring

theorem interaction_equals_difference_of_channel3_simple_effects
    (y11 y10 y01 y00 : ℝ) :
    channelInteraction y11 y10 y01 y00 =
      channel3EffectWhenChannel1Visible y11 y10 -
        channel3EffectWhenChannel1Hidden y01 y00 := by
  unfold channelInteraction channel1EffectWhenChannel3Visible
    channel1EffectWhenChannel3Hidden channel3EffectWhenChannel1Visible
    channel3EffectWhenChannel1Hidden
  ring

theorem zero_interaction_iff_equal_channel1_simple_effects
    (y11 y10 y01 y00 : ℝ) :
    channelInteraction y11 y10 y01 y00 = 0 ↔
      channel1EffectWhenChannel3Visible y11 y01 =
        channel1EffectWhenChannel3Hidden y10 y00 := by
  unfold channelInteraction channel1EffectWhenChannel3Visible
    channel1EffectWhenChannel3Hidden
  constructor <;> intro h <;> linarith

theorem interaction_injective_in_missing_cell
    (y11 y10 y00 y01a y01b : ℝ)
    (hne : y01a ≠ y01b) :
    channelInteraction y11 y10 y01a y00 ≠
      channelInteraction y11 y10 y01b y00 := by
  unfold channelInteraction channel1EffectWhenChannel3Visible
    channel1EffectWhenChannel3Hidden
  intro h
  have heq : y01a = y01b := by linarith
  exact hne heq

/-- With y11, y10, and y00 fixed, the unobserved y01 cell can vary the
    interaction. Therefore the three-cell design does not identify it. -/
theorem missing_fourth_cell_prevents_interaction_identification
    (y11 y10 y00 : ℝ) :
    ¬ ∃ k : ℝ, ∀ y01 : ℝ,
      channelInteraction y11 y10 y01 y00 = k := by
  rintro ⟨k, hk⟩
  have h0 : channelInteraction y11 y10 0 y00 = k := hk 0
  have h1 : channelInteraction y11 y10 1 y00 = k := hk 1
  have hne :
      channelInteraction y11 y10 0 y00 ≠
        channelInteraction y11 y10 1 y00 :=
    interaction_injective_in_missing_cell y11 y10 y00 0 1 (by norm_num)
  exact hne (h0.trans h1.symm)

#print axioms reported_channel1_is_conditional_simple_effect
#print axioms full_contrast_is_path_decomposition
#print axioms interaction_equals_difference_of_channel3_simple_effects
#print axioms zero_interaction_iff_equal_channel1_simple_effects
#print axioms interaction_injective_in_missing_cell
#print axioms missing_fourth_cell_prevents_interaction_identification

end HsHVerification.OrsonIdentityChannelFactorial
