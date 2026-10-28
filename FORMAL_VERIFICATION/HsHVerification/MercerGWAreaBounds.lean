import Mathlib

/-!
Mercer GW150914 source-frame horizon area bound, 2026-10-28.
Actual anchor: GWOSC GW150914-v3 GWTC-1 Overall_posterior (2020-02-19).
The parameters are waveform-inferred, model-dependent marginal 90% credible intervals.
Theorems are CONDITIONAL algebra; not an H(s)H constitutive prediction,
not a posterior analysis and not observational proof of the area theorem.
-/
namespace HsHVerification.MercerGWAreaBounds

def areaCoeff (m q : ℝ) : ℝ := m ^ 2 * (1 + q)
def initialSpinlessUpper (m1 m2 : ℝ) : ℝ := 2 * (m1 ^ 2 + m2 ^ 2)

theorem areaCoeff_le_spinless (m q : ℝ) (hq : q ≤ 1) :
    areaCoeff m q ≤ 2 * m ^ 2 := by
  unfold areaCoeff
  have h : 0 ≤ m ^ 2 * (1 - q) :=
    mul_nonneg (sq_nonneg m) (sub_nonneg.mpr hq)
  nlinarith

theorem initialArea_le_spinlessUpper (m1 m2 q1 q2 : ℝ)
    (hq1 : q1 ≤ 1) (hq2 : q2 ≤ 1) :
    areaCoeff m1 q1 + areaCoeff m2 q2 ≤ initialSpinlessUpper m1 m2 := by
  have h1 := areaCoeff_le_spinless m1 q1 hq1
  have h2 := areaCoeff_le_spinless m2 q2 hq2
  unfold initialSpinlessUpper
  linarith

theorem positive_margin_implies_growth (m1 m2 mf q1 q2 qf : ℝ)
    (hq1 : q1 ≤ 1) (hq2 : q2 ≤ 1)
    (hmargin : initialSpinlessUpper m1 m2 < areaCoeff mf qf) :
    areaCoeff m1 q1 + areaCoeff m2 q2 < areaCoeff mf qf := by
  exact lt_of_le_of_lt (initialArea_le_spinlessUpper m1 m2 q1 q2 hq1 hq2) hmargin

#print axioms areaCoeff_le_spinless
#print axioms initialArea_le_spinlessUpper
#print axioms positive_margin_implies_growth
end HsHVerification.MercerGWAreaBounds
