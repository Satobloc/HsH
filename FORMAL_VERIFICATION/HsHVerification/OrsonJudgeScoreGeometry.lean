import Mathlib

noncomputable section

/-!
Source crosswalk: Mukherjee, Abid, Bali, and Sitaram, "The Geometry of
LLM-as-Judge: Why Inter-LLM Consensus Is Not Human Alignment", Findings of
EMNLP 2026, Section 3, Eq. (2).

This file formalizes only the single-rubric, one-direction score-vector
projection identity. The vectors are finite real score columns; for the
Pearson-correlation interpretation they are understood to be pre-centered.
The theorem does not formalize the paper's stacked 95%-energy principal
angles, empirical covariance estimation, bootstrap procedures, or any
internal representation or computation of an LLM.
-/

namespace HsHVerification
namespace OrsonJudgeScoreGeometry

variable {ι : Type*} [Fintype ι]

/-- Squared Euclidean energy of a finite score vector. -/
def scoreEnergy (x : ι → ℝ) : ℝ := ∑ i, (x i)^2

/-- Euclidean inner product of two finite score vectors. -/
def scoreDot (x y : ι → ℝ) : ℝ := ∑ i, x i * y i

/-- Residual after projecting human onto the one-dimensional span of judge. -/
def scoreResidual (judge human : ι → ℝ) : ι → ℝ :=
  fun i => human i - (scoreDot judge human / scoreEnergy judge) * judge i

/-- Squared Pearson correlation for already-centered, nonzero score vectors. -/
def scoreSquaredCorrelation (judge human : ι → ℝ) : ℝ :=
  (scoreDot judge human)^2 / (scoreEnergy judge * scoreEnergy human)

/-- Fraction of human score energy left outside the judge's one-dimensional span. -/
def unexplainedScoreFraction (judge human : ι → ℝ) : ℝ :=
  scoreEnergy (scoreResidual judge human) / scoreEnergy human

private lemma sum_sq_sub_smul (judge human : ι → ℝ) (a : ℝ) :
    (∑ i, (human i - a * judge i)^2)
      = scoreEnergy human - 2 * a * scoreDot judge human
        + a^2 * scoreEnergy judge := by
  classical
  calc
    _ = ∑ i, ((human i)^2 - 2 * a * (judge i * human i)
        + a^2 * (judge i)^2) := by
      refine Finset.sum_congr rfl ?_
      intro i hi
      ring
    _ = (∑ i, (human i)^2) - 2 * a * (∑ i, judge i * human i)
        + a^2 * (∑ i, (judge i)^2) := by
      simp [Finset.sum_add_distrib, Finset.sum_sub_distrib,
        Finset.mul_sum, mul_assoc]
    _ = scoreEnergy human - 2 * a * scoreDot judge human
        + a^2 * scoreEnergy judge := by
      rfl

/-- Pythagorean residual-energy identity for projection onto one judge-score
direction. This is the vector form underlying the paper's single-direction
identity 1 - cos^2(theta) = 1 - r^2. -/
theorem residual_energy_eq (judge human : ι → ℝ)
    (hJ : scoreEnergy judge ≠ 0) :
    scoreEnergy (scoreResidual judge human)
      = scoreEnergy human - (scoreDot judge human)^2 / scoreEnergy judge := by
  classical
  have hsum := sum_sq_sub_smul judge human
    (scoreDot judge human / scoreEnergy judge)
  have hres :
      scoreEnergy (scoreResidual judge human)
        = scoreEnergy human
          - 2 * (scoreDot judge human / scoreEnergy judge) * scoreDot judge human
          + (scoreDot judge human / scoreEnergy judge)^2 * scoreEnergy judge := by
    simpa [scoreEnergy, scoreResidual, scoreDot] using hsum
  rw [hres]
  field_simp [hJ]
  ring

/-- The unexplained fraction of centered human-score energy equals one minus
squared Pearson correlation with the judge-score direction. The result is
conditional on nonzero score vectors and is not a claim about model internals. -/
theorem unexplained_fraction_eq_one_sub_squared_correlation
    (judge human : ι → ℝ)
    (hJ : scoreEnergy judge ≠ 0)
    (hH : scoreEnergy human ≠ 0) :
    unexplainedScoreFraction judge human
      = 1 - scoreSquaredCorrelation judge human := by
  unfold unexplainedScoreFraction scoreSquaredCorrelation
  rw [residual_energy_eq judge human hJ]
  field_simp [hJ, hH]

#print axioms unexplained_fraction_eq_one_sub_squared_correlation

end OrsonJudgeScoreGeometry
end HsHVerification
