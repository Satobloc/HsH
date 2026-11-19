import Mathlib

/-!
# Calder: target-indexed trust contrasts and scalar aggregation

Source context:
Anirudh Chung and X. J. Yang, "System-Wide Trust (SWT) Versus
Component-Specific Trust (CST) in Human-Autonomy Teams," Human Factors
and Ergonomics Society Annual Meeting (2026), DOI:
10.1177/10711813251372266.

The source distinguishes participant-specific trust-response patterns
(assimilation, no-bias, contrast) for different agent targets and pairing
contexts. This module proves only an abstract aggregation limitation:
a two-person mean contrast does not identify whether individual contrasts
are both zero or are nonzero and cancel.

The source paper's N-of-1 regression, multiple-testing correction,
statistical significance classification, sample, and empirical findings
are NOT formalized here. "Nonzero" is not equivalent to statistical
significance. No participant data or numeric empirical fixture is used.
-/

namespace HsHVerification.CalderTrustProfileAggregation

/-- The three source-reported trust-response labels. -/
inductive TrustBiasPattern where
  | assimilation
  | noBias
  | contrast
  deriving DecidableEq, Repr

/-- A schema-only enumeration of the source's three labels. -/
def sourceReportedPatternLabels : List TrustBiasPattern :=
  [.assimilation, .noBias, .contrast]

#eval sourceReportedPatternLabels

/-- Mean of two participant-specific trust contrasts for one fixed target
and context comparison. -/
noncomputable def contrastMean (x y : ℝ) : ℝ :=
  (x + y) / 2

/-- Number of participants with an exactly nonzero contrast.
This is an algebraic heterogeneity indicator, not a significance test. -/
noncomputable def nonzeroContrastCount (x y : ℝ) : ℕ :=
  (if x = 0 then 0 else 1) + (if y = 0 then 0 else 1)

/-- A balanced nonzero profile and a zero profile can have the same mean
while containing different amounts of individual-level heterogeneity. -/
theorem same_mean_different_heterogeneity {a : ℝ} (ha : a ≠ 0) :
    contrastMean a (-a) = contrastMean 0 0 ∧
      nonzeroContrastCount a (-a) ≠ nonzeroContrastCount 0 0 := by
  constructor
  · simp [contrastMean]
  · have hneg : -a ≠ 0 := neg_ne_zero.mpr ha
    simp [nonzeroContrastCount, ha, hneg]

/-- No deterministic classifier receiving only the two-person mean can
recover the exact count of nonzero individual contrasts for every profile. -/
theorem no_mean_only_recovery_of_nonzero_contrast_count
    {a : ℝ} (ha : a ≠ 0) :
    ¬ ∃ recover : ℝ → ℕ,
      ∀ x y, recover (contrastMean x y) = nonzeroContrastCount x y := by
  classical
  rintro ⟨recover, hrecover⟩
  have h := same_mean_different_heterogeneity ha
  have hleft := hrecover a (-a)
  have hright := hrecover 0 0
  apply h.2
  calc
    nonzeroContrastCount a (-a)
        = recover (contrastMean a (-a)) := hleft.symm
    _ = recover (contrastMean 0 0) := congrArg recover h.1
    _ = nonzeroContrastCount 0 0 := hright

#print axioms same_mean_different_heterogeneity
#print axioms no_mean_only_recovery_of_nonzero_contrast_count

end HsHVerification.CalderTrustProfileAggregation
