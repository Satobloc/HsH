import Mathlib

/-!
# Loom: scattering-estimator source audit

This module formalizes only algebraic properties of the importance-sampling
estimator printed in the assistant-generated report attached to the historical
"SAT Scattering Amplitude Checklist" conversation
(4c5d0d7d-4f90-4a54-9b5e-31e9c9e8f08a, assistant report message
ab89b2f0-ffc9-4461-87ff-6cefb48d98a1).

It does NOT formalize a physical scattering amplitude, the path-integral
measure, the O11 vertex law, a Lorentzian continuation, or UV finiteness.
The source report's code chooses probabilities proportional to weights and
then returns weight / probability. That contribution is algebraically
constant, so the estimator has zero sampling variance under that code.
-/

namespace HsHVerification.LoomScatteringEstimatorAudit

def proportionalProbability (w total : ℝ) : ℝ := w / total

def importanceContribution (w p : ℝ) : ℝ := w / p

/-- Sampling with probability w / total and returning w / p
    returns total for every positive scenario weight. -/
theorem proportional_sampling_contribution_is_total
    {w total : ℝ} (hw : 0 < w) (htotal : 0 < total) :
    importanceContribution w (proportionalProbability w total) = total := by
  unfold importanceContribution proportionalProbability
  have hw0 : w ≠ 0 := ne_of_gt hw
  have htotal0 : total ≠ 0 := ne_of_gt htotal
  field_simp [hw0, htotal0]
  ring

/-- Consequently, any two positive scenarios sampled proportionally to
    their own weights have identical per-sample importance contributions. -/
theorem two_scenario_proportional_contributions_are_equal
    {w0 w1 : ℝ} (h0 : 0 < w0) (h1 : 0 < w1) :
    importanceContribution w0 (proportionalProbability w0 (w0 + w1)) =
    importanceContribution w1 (proportionalProbability w1 (w0 + w1)) := by
  rw [proportional_sampling_contribution_is_total h0 (add_pos h0 h1),
      proportional_sampling_contribution_is_total h1 (add_pos h0 h1)]

/-- Per-sample contribution when the two scenarios are sampled uniformly. -/
def uniformContribution (w : ℝ) : ℝ := w / (1 / 2 : ℝ)

/-- The equal-probability estimator has the correct two-scenario mean. -/
theorem equal_probability_two_scenario_mean_is_sum (w0 w1 : ℝ) :
    (uniformContribution w0 + uniformContribution w1) / 2 = w0 + w1 := by
  unfold uniformContribution
  ring

/-- Under an affine parameter rescaling s = a * lambda, the chain-rule
    factor for a squared second derivative is a^(-4), while the measure
    contributes a. This verifies the resulting algebraic a^(-3) factor.
    The analytic chain rule and integral substitution are not formalized here. -/
theorem affine_curvature_density_factor (a : ℝ) (ha : a ≠ 0) :
    (1 / a^4) * a = 1 / a^3 := by
  field_simp [ha]
  ring

/-- A nontrivial affine rescaling changes the displayed curvature density. -/
theorem affine_rescale_two_is_not_invariant :
    (1 / (2 : ℝ)^4) * 2 ≠ 1 := by
  norm_num

#print axioms proportional_sampling_contribution_is_total
#print axioms affine_curvature_density_factor

end HsHVerification.LoomScatteringEstimatorAudit
