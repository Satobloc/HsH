import Mathlib

/-!
Review-MIND formalization: weak assembly gain versus best-member preservation.

Source concept: Tak et al., "From Process Loss to Assembly Bonus:
Human-Grounded Diagnosis of Multi-Agent LLM Collaboration,"
Findings of EMNLP 2026, DOI 10.18653/2026.findings-emnlp.1341.

The paper distinguishes:
* mean-relative collective gain: final group mean minus initial group mean;
* best-member gap: final group mean minus the best initial individual score.

This module formalizes only the arithmetic relationship for a three-member
score vector. It proves that positive best-member gap implies positive
mean-relative gain, while a concrete bounded counterexample shows that
positive mean-relative gain does not imply preservation of the best initial
member.

The scores below are a purely mathematical countermodel, not observations,
model outputs, human-subject data, or a physical fixture. This module does
not reproduce or validate any empirical result from the paper.
-/

namespace HsHVerification.ReviewMindAssemblyBonusMetricSeparation

structure Scores3 where
  first : ℚ
  second : ℚ
  third : ℚ
deriving DecidableEq, Repr

def meanScore (s : Scores3) : ℚ :=
  (s.first + s.second + s.third) / 3

def bestScore (s : Scores3) : ℚ :=
  max s.first (max s.second s.third)

def weakGain (initial final : Scores3) : ℚ :=
  meanScore final - meanScore initial

def bestMemberGap (initial final : Scores3) : ℚ :=
  meanScore final - bestScore initial

/-- The mean of three rational scores cannot exceed their maximum. -/
theorem mean_le_best (s : Scores3) :
    meanScore s ≤ bestScore s := by
  unfold meanScore bestScore
  have hFirst : s.first ≤ max s.first (max s.second s.third) :=
    le_max_left _ _
  have hSecondLocal : s.second ≤ max s.second s.third :=
    le_max_left _ _
  have hThirdLocal : s.third ≤ max s.second s.third :=
    le_max_right _ _
  have hSecond : s.second ≤ max s.first (max s.second s.third) :=
    le_trans hSecondLocal (le_max_right _ _)
  have hThird : s.third ≤ max s.first (max s.second s.third) :=
    le_trans hThirdLocal (le_max_right _ _)
  linarith

/-- Surpassing the best initial member necessarily surpasses the initial mean. -/
theorem strong_bonus_implies_weak_bonus
    (initial final : Scores3)
    (h : 0 < bestMemberGap initial final) :
    0 < weakGain initial final := by
  unfold bestMemberGap weakGain
  have hMean := mean_le_best initial
  linarith

def exampleInitial : Scores3 := ⟨0, 1, 0⟩
def exampleFinal : Scores3 := ⟨(1 / 2 : ℚ), (1 / 2 : ℚ), (1 / 2 : ℚ)⟩

/-- A group's mean can improve while its final mean remains below its best
    initial member. This is the non-implication in the paper's two metrics. -/
theorem weak_gain_does_not_imply_best_member_preservation :
    0 < weakGain exampleInitial exampleFinal ∧
    bestMemberGap exampleInitial exampleFinal < 0 := by
  norm_num [weakGain, bestMemberGap, meanScore, bestScore,
    exampleInitial, exampleFinal]

#eval meanScore exampleInitial
#eval meanScore exampleFinal
#eval bestScore exampleInitial
#eval weakGain exampleInitial exampleFinal
#eval bestMemberGap exampleInitial exampleFinal

#print axioms mean_le_best
#print axioms strong_bonus_implies_weak_bonus
#print axioms weak_gain_does_not_imply_best_member_preservation

end HsHVerification.ReviewMindAssemblyBonusMetricSeparation
