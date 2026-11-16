import Mathlib

/-!
# Orson external comparator: Independent–Communicate–Revise selective revision

Primary source:
Shixuan Li, Wei Yang, Peiyu Zhang, Anzhe Cheng, Heng Ping, and Paul Bogdan,
"Beyond Final Accuracy: Auditing Communication in LLM Multi-Agent Systems",
arXiv:2610.01042v1 (2026-10-01), §§3.2–3.3, equations (5)–(8).

This is an external-comparator formalization. It does not alter the frozen
ConsistencyBench P1 empirical scope and is not P1 data.

Lean checks only the encoded metric identities and conditional finite-mixture
bound. It does not validate the source transcription, experiment, bootstrap,
causal interpretation, message use, or internal cognition.
-/

namespace HsHVerification
namespace OrsonICRSelectiveRevision

/-- The two mixed-correctness revision rates used by ICR. -/
structure RevisionProfile where
  correction : ℝ
  preservation : ℝ
deriving DecidableEq

/-- Corruption is the complement of preservation. -/
def corruptionRate (p : RevisionProfile) : ℝ :=
  1 - p.preservation

/-- ICR's equal-weight selectivity index. -/
def selectivityIndex (p : RevisionProfile) : ℝ :=
  (p.correction + p.preservation) / 2

/-- The centered selectivity index is half the difference between correction
and corruption. -/
theorem selectivity_centered_identity (p : RevisionProfile) :
    selectivityIndex p - 1 / 2 =
      (p.correction - corruptionRate p) / 2 := by
  unfold selectivityIndex corruptionRate
  ring

/-- If both component rates are probabilities, their equal-weight mean is
also a probability. -/
theorem selectivity_bounded
    (p : RevisionProfile)
    (hc0 : 0 ≤ p.correction)
    (hc1 : p.correction ≤ 1)
    (hp0 : 0 ≤ p.preservation)
    (hp1 : p.preservation ≤ 1) :
    0 ≤ selectivityIndex p ∧ selectivityIndex p ≤ 1 := by
  constructor <;> unfold selectivityIndex <;> nlinarith

/-- Source-defined analytical reference: always retain the receiver's answer. -/
def alwaysRetain : RevisionProfile := ⟨0, 1⟩

/-- Source-defined analytical reference: always copy the sender's answer. -/
def alwaysCopy : RevisionProfile := ⟨1, 0⟩

theorem always_retain_reference :
    selectivityIndex alwaysRetain = 1 / 2 := by
  norm_num [selectivityIndex, alwaysRetain]

theorem always_copy_reference :
    selectivityIndex alwaysCopy = 1 / 2 := by
  norm_num [selectivityIndex, alwaysCopy]

theorem reference_profiles_distinct :
    alwaysRetain ≠ alwaysCopy := by
  intro h
  have hcr : (0 : ℝ) = 1 := by
    simpa [alwaysRetain, alwaysCopy] using
      congrArg RevisionProfile.correction h
  norm_num at hcr

/-- The scalar selectivity index is not an identifying statistic for the
correction–preservation profile: the paper's two opposite reference policies
have identical SI. -/
theorem selectivity_not_injective :
    ¬ Function.Injective selectivityIndex := by
  intro hinj
  have heq :
      selectivityIndex alwaysRetain = selectivityIndex alwaysCopy := by
    rw [always_retain_reference, always_copy_reference]
  exact reference_profiles_distinct (hinj heq)

/-- Transfer an amount from preservation to correction while keeping their
sum fixed. -/
def compensatingTransfer (δ : ℝ) (p : RevisionProfile) : RevisionProfile :=
  ⟨p.correction + δ, p.preservation - δ⟩

theorem selectivity_invariant_under_compensating_transfer
    (δ : ℝ) (p : RevisionProfile) :
    selectivityIndex (compensatingTransfer δ p) = selectivityIndex p := by
  simp [selectivityIndex, compensatingTransfer]
  ring

/-- Equal selectivity is exactly equality of the sum of the two rates. -/
theorem selectivity_equal_iff_sum_equal
    (p q : RevisionProfile) :
    selectivityIndex p = selectivityIndex q ↔
      p.correction + p.preservation = q.correction + q.preservation := by
  unfold selectivityIndex
  constructor <;> intro h <;> linarith

/-- The four-stratum aggregate accuracy decomposition from ICR Eq. (8).
Weights and rates must refer to the same evaluation population. -/
def postRevisionAccuracy
    (w01 w10 w00 w11 cr pr sr scr : ℝ) : ℝ :=
  w01 * cr + w10 * pr + w00 * sr + w11 * scr

/-- On a mixed-correctness-only population with equal CR and PR denominators,
the aggregate accuracy is the equal-weight selectivity index. -/
theorem mixed_direction_accuracy_eq_selectivity
    (cr pr sr scr : ℝ) :
    postRevisionAccuracy (1 / 2) (1 / 2) 0 0 cr pr sr scr =
      selectivityIndex ⟨cr, pr⟩ := by
  unfold postRevisionAccuracy selectivityIndex
  ring

/-- The four initial-correctness strata used by ICR's law-of-total-probability
decomposition. -/
inductive InitialCorrectnessStratum where
  | bothWrong
  | receiverWrongSenderRight
  | receiverRightSenderWrong
  | bothRight
deriving DecidableEq, Fintype

/-- Finite weighted mean of the post-revision correctness rates over the four
initial-correctness strata. -/
def weightedRevisionAccuracy
    (w r : InitialCorrectnessStratum → ℝ) : ℝ :=
  ∑ s : InitialCorrectnessStratum, w s * r s

/-- A normalized nonnegative mixture of stratum-specific probabilities remains
in [0,1]. This is conditional mathematics, not an empirical result. -/
theorem weighted_revision_accuracy_bounded
    (w r : InitialCorrectnessStratum → ℝ)
    (hw : ∀ s, 0 ≤ w s)
    (hr0 : ∀ s, 0 ≤ r s)
    (hr1 : ∀ s, r s ≤ 1)
    (hsum : ∑ s : InitialCorrectnessStratum, w s = 1) :
    0 ≤ weightedRevisionAccuracy w r ∧
      weightedRevisionAccuracy w r ≤ 1 := by
  classical
  constructor
  · unfold weightedRevisionAccuracy
    exact Finset.sum_nonneg (fun s hs => mul_nonneg (hw s) (hr0 s))
  · unfold weightedRevisionAccuracy
    calc
      (∑ s : InitialCorrectnessStratum, w s * r s) ≤
          ∑ s : InitialCorrectnessStratum, w s := by
        apply Finset.sum_le_sum
        intro s hs
        have hnonneg : 0 ≤ w s * (1 - r s) :=
          mul_nonneg (hw s) (sub_nonneg.mpr (hr1 s))
        nlinarith
      _ = 1 := hsum

#print axioms selectivity_centered_identity
#print axioms selectivity_bounded
#print axioms always_retain_reference
#print axioms always_copy_reference
#print axioms selectivity_not_injective
#print axioms selectivity_invariant_under_compensating_transfer
#print axioms selectivity_equal_iff_sum_equal
#print axioms mixed_direction_accuracy_eq_selectivity
#print axioms weighted_revision_accuracy_bounded

end OrsonICRSelectiveRevision
end HsHVerification
