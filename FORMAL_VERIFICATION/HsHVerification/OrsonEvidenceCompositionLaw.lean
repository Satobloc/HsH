import Mathlib

/-!
# Orson P1: receiver-relative evidence composition (conditional algebra)

Primary source: Sebastien Kawada and Manolis Kellis, "Evidence Integration in
Large Language Models", arXiv:2609.04290v1 (2026-09-03), §§3.1 and 3.6,
equations (5) and (23), with the source-channel dependence noted in §3.1.

The paper's scalar log-odds update is represented as
  update a L d = (1 + a) * L + d.
The first four results below generalize the two-message composition to
separate receiver weights a1 and a2. That two-channel generalization is an
assistant-derived extension, not a reported theorem or fitted result in the
paper. The equal-channel specialization corresponds to the paper's displayed
composition law.

Lean verifies only this algebra under the stated update rule. It does not
establish that the empirical law is correct, that answer-slot log-probability
is a complete internal prior, that source errors are independent, or that
the rule applies to peer interaction or scientific review.
-/

namespace HsHVerification
namespace OrsonEvidenceCompositionLaw

/-- One evidence update on a scalar log-odds margin. -/
def update (a margin tilt : ℝ) : ℝ := (1 + a) * margin + tilt

/-- Two updates with potentially different receiver/source-channel weights. -/
theorem compose_12 (a1 a2 margin d1 d2 : ℝ) :
    update a2 (update a1 margin d1) d2 =
      (1 + a2) * (1 + a1) * margin + (1 + a2) * d1 + d2 := by
  simp [update]
  ring

/-- Reversing the order changes only the evidence-weighted terms. -/
theorem compose_21 (a1 a2 margin d1 d2 : ℝ) :
    update a1 (update a2 margin d2) d1 =
      (1 + a1) * (1 + a2) * margin + (1 + a1) * d2 + d1 := by
  simp [update]
  ring

/-- Exact order difference for two source channels. -/
theorem order_difference (a1 a2 margin d1 d2 : ℝ) :
    update a2 (update a1 margin d1) d2 -
      update a1 (update a2 margin d2) d1 =
        a2 * d1 - a1 * d2 := by
  simp [update]
  ring

/-- The two orders commute exactly when their weighted tilts balance. -/
theorem commute_iff (a1 a2 margin d1 d2 : ℝ) :
    update a2 (update a1 margin d1) d2 =
      update a1 (update a2 margin d2) d1 ↔
        a2 * d1 = a1 * d2 := by
  constructor
  · intro h
    have hzero :
        update a2 (update a1 margin d1) d2 -
          update a1 (update a2 margin d2) d1 = 0 :=
      sub_eq_zero.mpr h
    rw [order_difference] at hzero
    linarith
  · intro h
    have hzero :
        update a2 (update a1 margin d1) d2 -
          update a1 (update a2 margin d2) d1 = 0 := by
      rw [order_difference]
      linarith
    exact sub_eq_zero.mp hzero

/-- Equal-channel specialization: the order effect is a times the tilt gap. -/
theorem equal_channel_order_difference (a margin d1 d2 : ℝ) :
    update a (update a margin d1) d2 -
      update a (update a margin d2) d1 = a * (d1 - d2) := by
  simp [update]
  ring

/-- With one common receiver weight, commutation occurs iff a = 0 or the
    two intrinsic evidence tilts are equal. -/
theorem equal_channel_commute_iff (a margin d1 d2 : ℝ) :
    update a (update a margin d1) d2 =
      update a (update a margin d2) d1 ↔
        a = 0 ∨ d1 = d2 := by
  constructor
  · intro h
    have hzero :
        update a (update a margin d1) d2 -
          update a (update a margin d2) d1 = 0 :=
      sub_eq_zero.mpr h
    rw [equal_channel_order_difference] at hzero
    rcases mul_eq_zero.mp hzero with ha | hd
    · exact Or.inl ha
    · exact Or.inr (sub_eq_zero.mp hd)
  · rintro (ha | hd)
    · simp [update, ha]
      ring
    · simp [update, hd]

#print axioms HsHVerification.OrsonEvidenceCompositionLaw.compose_12
#print axioms HsHVerification.OrsonEvidenceCompositionLaw.compose_21
#print axioms HsHVerification.OrsonEvidenceCompositionLaw.order_difference
#print axioms HsHVerification.OrsonEvidenceCompositionLaw.commute_iff
#print axioms HsHVerification.OrsonEvidenceCompositionLaw.equal_channel_order_difference
#print axioms HsHVerification.OrsonEvidenceCompositionLaw.equal_channel_commute_iff

end OrsonEvidenceCompositionLaw
end HsHVerification
