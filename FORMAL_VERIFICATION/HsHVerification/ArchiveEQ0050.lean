import Mathlib

/-!
Archive recovery EQ-0050: uncertainty-aware comparator gate.

Historical source:
  DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt
  blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d
  24,627 characters / 384 lines; undated in the file.

Verbatim methodological statements include:
- "After this, predict—don’t re-fit per observable."
- "Overfitting: keep the calibration set tiny; treat everything else as a
  prediction with quoted bands."

The source does not define a statistical likelihood, covariance, tolerance, or
model-rejection rule.  The definitions below are therefore an assistant
reconstruction using a generic pseudometric observation space.  They formalize
only bounded-error logic, not a physical observable, data set, or SAT/H(s)H
prediction.
-/

namespace HsHVerification.ArchiveEQ0050

def WithinTolerance {X : Type*} [PseudoMetricSpace X]
    (epsilon : ℝ) (observation prediction : X) : Prop :=
  dist observation prediction ≤ epsilon

def RejectedAtTolerance {X : Type*} [PseudoMetricSpace X]
    (epsilon : ℝ) (observation prediction : X) : Prop :=
  epsilon < dist observation prediction

def ExclusiveSupport {X : Type*} [PseudoMetricSpace X]
    (epsilon : ℝ) (observation candidate comparator : X) : Prop :=
  WithinTolerance epsilon observation candidate ∧
    RejectedAtTolerance epsilon observation comparator

theorem fit_forces_nonnegative_tolerance
    {X : Type*} [PseudoMetricSpace X]
    (epsilon : ℝ) (observation prediction : X)
    (hfit : WithinTolerance epsilon observation prediction) :
    0 ≤ epsilon := by
  exact le_trans dist_nonneg hfit

theorem joint_fit_bounds_prediction_separation
    {X : Type*} [PseudoMetricSpace X]
    (epsilon : ℝ) (observation candidate comparator : X)
    (hcandidate : WithinTolerance epsilon observation candidate)
    (hcomparator : WithinTolerance epsilon observation comparator) :
    dist candidate comparator ≤ 2 * epsilon := by
  calc
    dist candidate comparator ≤
        dist candidate observation + dist observation comparator :=
      dist_triangle candidate observation comparator
    _ = dist observation candidate + dist observation comparator := by
      rw [dist_comm candidate observation]
    _ ≤ epsilon + epsilon := add_le_add hcandidate hcomparator
    _ = 2 * epsilon := by ring

theorem separation_above_two_tolerances_blocks_joint_fit
    {X : Type*} [PseudoMetricSpace X]
    (epsilon : ℝ) (observation candidate comparator : X)
    (hseparated : 2 * epsilon < dist candidate comparator) :
    ¬ (WithinTolerance epsilon observation candidate ∧
       WithinTolerance epsilon observation comparator) := by
  intro hboth
  exact (not_le_of_gt hseparated)
    (joint_fit_bounds_prediction_separation
      epsilon observation candidate comparator hboth.1 hboth.2)

theorem comparator_fit_blocks_exclusive_support
    {X : Type*} [PseudoMetricSpace X]
    (epsilon : ℝ) (observation candidate comparator : X)
    (hcomparator : WithinTolerance epsilon observation comparator) :
    ¬ ExclusiveSupport epsilon observation candidate comparator := by
  intro hexclusive
  exact (not_lt_of_ge hcomparator) hexclusive.2

theorem exclusive_support_requires_comparator_rejection
    {X : Type*} [PseudoMetricSpace X]
    (epsilon : ℝ) (observation candidate comparator : X)
    (hsupport : ExclusiveSupport epsilon observation candidate comparator) :
    epsilon < dist observation comparator :=
  hsupport.2

theorem exclusive_support_is_asymmetric
    {X : Type*} [PseudoMetricSpace X]
    (epsilon : ℝ) (observation candidate comparator : X)
    (hsupport : ExclusiveSupport epsilon observation candidate comparator) :
    ¬ ExclusiveSupport epsilon observation comparator candidate := by
  intro hreverse
  exact (not_lt_of_ge hsupport.1) hreverse.2

#print axioms fit_forces_nonnegative_tolerance
#print axioms joint_fit_bounds_prediction_separation
#print axioms separation_above_two_tolerances_blocks_joint_fit
#print axioms comparator_fit_blocks_exclusive_support
#print axioms exclusive_support_requires_comparator_rejection
#print axioms exclusive_support_is_asymmetric

end HsHVerification.ArchiveEQ0050
