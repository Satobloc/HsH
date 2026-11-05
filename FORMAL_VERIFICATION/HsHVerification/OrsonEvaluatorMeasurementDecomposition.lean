import Mathlib

/-!
# Orson P1: evaluator-side context sensitivity and peer-presentation decomposition

Primary source: Alicia Guerra and Yibo Hu, "The Evaluator Is Part of the
contrast: attribution, repetition, apparent speaker count, consensus structure, authority labels, and prompt length (arXiv:2608.04463v2).
(2026-08-13), §§2.1-2.3, equations (1)-(8).

The source defines the total peer-arm quality shift as the sum of:
ordinary second-pass re-answering, candidate-content exposure, and a
peer-presentation residual. The authors explicitly do NOT call the residual
a pure social-framing effect: its contrast jointly changes attribution,
repetition, apparent speaker count, consensus structure, authority labels,
and prompt length.

The source's evaluator model compares blind and informed ratings of the
same generated answer. Its informed linear predictor adds a judge-specific
coefficient gamma_j multiplied by a signed context code d_i in {+1,0,-1}
for all-correct, mixed, and all-wrong peer context. The paired contrast is
gamma_j*d_i under that model. A generic condition-independent informed-pass
shift is not separately identified by the reported specification.

Lean checks only the algebraic identities encoded here. It does not validate
the source data, randomization, latent-quality model, anchor calibration,
judge neutrality, causal interpretation, or transfer to ConsistencyBench's
shared GPT-4o-mini NLI gate.
-/

namespace HsHVerification
namespace OrsonEvaluatorMeasurementDecomposition

/-- Ordinary second-pass shift relative to the Round-1 answer. -/
def secondPassShift (round1 noPeer : ℝ) : ℝ := noPeer - round1

/-- Candidate-content shift relative to a no-peer re-answer. -/
def contentShift (noPeer content : ℝ) : ℝ := content - noPeer

/-- Peer-presentation residual relative to the matched content-only arm. -/
def peerPresentationResidual (content peer : ℝ) : ℝ := peer - content

/-- Total peer-arm shift relative to the Round-1 answer. -/
def totalPeerShift (round1 peer : ℝ) : ℝ := peer - round1

/-- The source's three-part decomposition is an exact algebraic identity
under its definitions of the four contrasts. -/
theorem total_peer_shift_decomposes
    (round1 noPeer content peer : ℝ) :
    totalPeerShift round1 peer =
      secondPassShift round1 noPeer +
      contentShift noPeer content +
      peerPresentationResidual content peer := by
  unfold totalPeerShift secondPassShift contentShift peerPresentationResidual
  ring

/-- The peer-presentation residual is the remaining contrast after the
ordinary second-pass and candidate-content components are subtracted. -/
theorem peer_presentation_residual_is_remaining_contrast
    (round1 noPeer content peer : ℝ) :
    peerPresentationResidual content peer =
      totalPeerShift round1 peer -
        secondPassShift round1 noPeer -
        contentShift noPeer content := by
  unfold peerPresentationResidual totalPeerShift secondPassShift contentShift
  ring

/-- The source's signed peer-context coding. -/
inductive PeerContext where
  | allCorrect
  | mixed
  | allWrong
  deriving DecidableEq

def signedPeerContext : PeerContext → ℝ
  | .allCorrect => 1
  | .mixed => 0
  | .allWrong => -1

/-- Blind latent-quality linear predictor for a fixed judge and answer. -/
def blindPredictor (alpha beta theta : ℝ) : ℝ :=
  alpha * (theta - beta)

/-- Informed predictor from the source's model, with the same answer-quality
parameter theta and a judge-specific context coefficient gamma. -/
def informedPredictor (alpha beta theta gamma d : ℝ) : ℝ :=
  alpha * (theta - beta) + gamma * d

/-- Paired informed-minus-blind predictor difference for the same answer. -/
def pairedEvaluatorContextShift
    (alpha beta theta gamma d : ℝ) : ℝ :=
  informedPredictor alpha beta theta gamma d -
    blindPredictor alpha beta theta

/-- At fixed answer quality and judge parameters, the paired context
contrast is gamma times the signed peer-context code. -/
theorem paired_context_shift_eq_gamma_times_signed_context
    (alpha beta theta gamma d : ℝ) :
    pairedEvaluatorContextShift alpha beta theta gamma d = gamma * d := by
  unfold pairedEvaluatorContextShift informedPredictor blindPredictor
  ring

theorem all_correct_context_shift
    (alpha beta theta gamma : ℝ) :
    pairedEvaluatorContextShift alpha beta theta gamma
      (signedPeerContext .allCorrect) = gamma := by
  rw [paired_context_shift_eq_gamma_times_signed_context]
  simp [signedPeerContext]

theorem mixed_context_has_zero_directional_shift
    (alpha beta theta gamma : ℝ) :
    pairedEvaluatorContextShift alpha beta theta gamma
      (signedPeerContext .mixed) = 0 := by
  rw [paired_context_shift_eq_gamma_times_signed_context]
  simp [signedPeerContext]

theorem all_wrong_context_shift
    (alpha beta theta gamma : ℝ) :
    pairedEvaluatorContextShift alpha beta theta gamma
      (signedPeerContext .allWrong) = -gamma := by
  rw [paired_context_shift_eq_gamma_times_signed_context]
  simp [signedPeerContext]

/-!
## Conditional identifiability of the six-cue peer-presentation bundle

Guerra & Hu list six prompt features that change jointly in the peer-presentation
contrast: attribution, repetition, apparent speaker count, consensus structure,
contrast: attribution, repetition, apparent speaker count, consensus structure, authority labels, and prompt length (arXiv:2608.04463v2).

The paper does not estimate six separate cue coefficients. The definitions
below are an assistant-derived additive abstraction: each coordinate is one
cue's contribution to the single observed residual. This is not a fitted model
or an equation supplied by the source paper.
-/

/-- Six contributions in the source's listed cue order. -/
abbrev PeerPresentationCueContributions := Fin 6 → ℝ

/-- Additive projection from six cue contributions to one bundled residual. -/
def bundledCueContributionSum (c : PeerPresentationCueContributions) : ℝ :=
  c 0 + c 1 + c 2 + c 3 + c 4 + c 5

/-- Transfer an amount between two cue contributions without changing their
    total. This is an explicit nonzero direction in the kernel of the bundle
    measurement map. -/
def transferBetweenFirstTwoCues
    (δ : ℝ) (c : PeerPresentationCueContributions) :
    PeerPresentationCueContributions :=
  fun i =>
    if i = 0 then c i + δ
    else if i = 1 then c i - δ
    else c i

/-- A compensating change in two cue contributions leaves the bundled
    residual unchanged. -/
theorem bundledCueSum_invariant_under_compensating_transfer
    (δ : ℝ) (c : PeerPresentationCueContributions) :
    bundledCueContributionSum (transferBetweenFirstTwoCues δ c) =
      bundledCueContributionSum c := by
  simp [bundledCueContributionSum, transferBetweenFirstTwoCues]

/-- Any nonzero transfer changes the six-component decomposition. -/
theorem compensating_transfer_changes_decomposition
    (δ : ℝ) (c : PeerPresentationCueContributions) (hδ : δ ≠ 0) :
    transferBetweenFirstTwoCues δ c ≠ c := by
  intro h
  have h0 := congrFun h (0 : Fin 6)
  have hsum : c 0 + δ = c 0 := by
    simpa [transferBetweenFirstTwoCues] using h0
  have hδ0 : δ = 0 := by linarith [hsum]
  exact hδ hδ0

/-- Every additive bundled residual has a distinct six-component
    decomposition with the same observed scalar. -/
theorem every_bundled_residual_has_multiple_additive_decompositions
    (c : PeerPresentationCueContributions) :
    ∃ c' : PeerPresentationCueContributions,
      c' ≠ c ∧ bundledCueContributionSum c' = bundledCueContributionSum c := by
  refine ⟨transferBetweenFirstTwoCues 1 c, ?_, ?_⟩
  · exact compensating_transfer_changes_decomposition 1 c (by norm_num)
  · exact bundledCueSum_invariant_under_compensating_transfer 1 c

/-- The one-scalar additive bundle map cannot identify all six cue
    contributions uniquely. -/
theorem bundledCueContributionSum_not_injective :
    ¬ Function.Injective bundledCueContributionSum := by
  intro hinj
  obtain ⟨c', hne, heq⟩ :=
    every_bundled_residual_has_multiple_additive_decompositions (fun _ => 0)
  exact hne (hinj heq)

#print axioms bundledCueSum_invariant_under_compensating_transfer
#print axioms compensating_transfer_changes_decomposition
#print axioms every_bundled_residual_has_multiple_additive_decompositions
#print axioms bundledCueContributionSum_not_injective

#print axioms total_peer_shift_decomposes
#print axioms peer_presentation_residual_is_remaining_contrast
#print axioms paired_context_shift_eq_gamma_times_signed_context
#print axioms all_correct_context_shift
#print axioms mixed_context_has_zero_directional_shift
#print axioms all_wrong_context_shift

end OrsonEvaluatorMeasurementDecomposition
end HsHVerification
