import Mathlib

/-!
# FIE θ₄ angle-convention source-fidelity obligations

Primary Nathan-submitted original:
HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/
25.10.30•26.06.01•Fundamental Intuitions of SAT — raw.json
blob 0a7a270482bdda92a61d1c54ccccaf356e47aa0b
user-role message f476afce-eba0-4312-8c2b-36b82dbe7f3f
2025-10-30T05:12:46.507Z, intuition 9 / Proposition E.
It describes "angle of intersection with the time surface" and near-zero
vacuum angle without an explicit tangent-to-sheet versus tangent-to-normal
measurement rule.

Later Nathan-direct clarification:
HsH/!!_RUNNING_COTHEORIST_LOG.md
blob e303107769ecb07a5f5436867cb5f17a8ac814ea
2026-09-16 θ₄ baseline: θ₄ is measured FROM THE TIME NORMAL,
with straight/null/vacuum θ₄=0. See BEDROCK BR-005,
blob 4cabda482c48c217614b868a2138409275df9bf7.

This module proves only conditional angle-conversion algebra in a Euclidean
line-versus-hyperplane geometry. Orthogonality of the sheet and normal,
a common metric, acute-angle conventions and differentiable geometry
are PRECONDITIONS, not established here. No mass law, measured system,
physical vacuum property or source-author intention is proved.
-/

namespace HsHVerification.FIEAngleConventionFidelity

/-- Conditional complementarity of the two acute-angle conventions. -/
def Complementary (angleToSheet angleToNormal : ℝ) : Prop :=
  angleToSheet + angleToNormal = Real.pi / 2

/-- Translating the old sheet-relative angle into a normal-relative angle
    requires complementing it, not silently retaining the same numeral. -/
theorem sheet_angle_from_normal
    {angleToSheet angleToNormal : ℝ}
    (h : Complementary angleToSheet angleToNormal) :
    angleToSheet = Real.pi / 2 - angleToNormal := by
  dsimp [Complementary] at h
  linarith

/-- If sheet-relative angles increase, normal-relative angles decrease
    under a fixed complementary convention. This is a convention audit,
    not a claim that either is the intended historical θ₄. -/
theorem order_reverses_under_complement
    {sheet₁ sheet₂ normal₁ normal₂ : ℝ}
    (h₁ : Complementary sheet₁ normal₁)
    (h₂ : Complementary sheet₂ normal₂)
    (hSheet : sheet₁ < sheet₂) :
    normal₂ < normal₁ := by
  dsimp [Complementary] at h₁ h₂
  linarith

/-- A zero angle FROM THE NORMAL is a right angle TO THE SHEET. -/
theorem normal_zero_implies_sheet_right
    {sheet : ℝ}
    (h : Complementary sheet 0) :
    sheet = Real.pi / 2 := by
  dsimp [Complementary] at h
  linarith

/-- A zero angle TO THE SHEET is a right angle FROM THE NORMAL. -/
theorem sheet_zero_implies_normal_right
    {normal : ℝ}
    (h : Complementary 0 normal) :
    normal = Real.pi / 2 := by
  dsimp [Complementary] at h
  linarith

#print axioms sheet_angle_from_normal
#print axioms order_reverses_under_complement
#print axioms normal_zero_implies_sheet_right
#print axioms sheet_zero_implies_normal_right

end HsHVerification.FIEAngleConventionFidelity
