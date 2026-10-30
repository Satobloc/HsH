import Mathlib

/-!
# Finite-sample response non-identifiability

The lunar LLR summary in Williams & Boggs (2015), JGR Planets 120,
689–724, DOI 10.1002/2014JE004755, reports response constraints at
period scales of approximately 1 month, 1 year, 3 years, and 6 years.

This module proves only a mathematical limitation: values or bounds at a
finite set of periods cannot uniquely determine an otherwise unrestricted
response function. The witness functions below are abstract mathematical
objects, not physical fixtures, fitted rheologies, or proposed H(s)H laws.

The theorem does not prove that the full LLR inverse problem is non-injective
under every admissible rheology family. The paper separately reports that
more than one rheological family can fit the available LLR constraints.
-/

namespace HsHVerification.LoomLunarResponseSampling

/-- The four period labels used in the published summary, in months.
    The 3-year and 6-year entries are conditional lower-bound constraints,
    not four independent point measurements. -/
def publishedQSummaryPeriodsMonths : Finset ℝ := {1, 12, 36, 72}

/-- A finite list of response-period constraints does not identify an
    arbitrary real-valued response function uniquely. Two distinct
    functions can agree at every listed summary period. -/
theorem finite_summary_period_samples_do_not_identify_response :
    ∃ f g : ℝ → ℝ,
      f ≠ g ∧
      ∀ p ∈ publishedQSummaryPeriodsMonths, f p = g p := by
  let f : ℝ → ℝ := fun p => if p = 2 then 1 else 0
  let g : ℝ → ℝ := fun _ => 0
  refine ⟨f, g, ?_, ?_⟩
  · intro hEq
    have hAtTwo := congrFun hEq (2 : ℝ)
    norm_num [f, g] at hAtTwo
  · intro p hp
    have hpNeTwo : p ≠ (2 : ℝ) := by
      intro h
      subst p
      norm_num [publishedQSummaryPeriodsMonths] at hp
    simp [f, g, hpNeTwo]

end HsHVerification.LoomLunarResponseSampling

#print axioms HsHVerification.LoomLunarResponseSampling.finite_summary_period_samples_do_not_identify_response
