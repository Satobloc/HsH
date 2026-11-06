import Mathlib

/-!
# GCS apex geometry and a conditional local normal-tube gate

Primary geometry source:
* Thernisien (2011), "Implementation of the graduated cylindrical shell
  model for the three-dimensional reconstruction of coronal mass ejections",
  ApJS 194(2), 33, DOI 10.1088/0067-0049/194/2/33.
  The front's generating circle has centre B and radius rho = hLeg * tan(alpha);
  the apex cross-section centre lies on that generating circle. At beta = pi/2,
  the source gives X0 = (rho + b*kappa^2)/(1-kappa^2),
  R = kappa*(b+rho)/(1-kappa^2), with b = hLeg/cos(alpha).
* Mishra, Agarwal & Srivastava (2026), MNRAS 550, stag1145,
  DOI 10.1093/mnras/stag1145, uses the GCS aspect ratio
  kappa = R / OC1, where OC1 is the heliocentric height of the apex
  cross-section centre. That is not the generating-circle radius rho.

Here s and c stand for sin(alpha) and cos(alpha), respectively. The algebraic
proofs below use only s > 0 and c > 0; they do not prove the trigonometric
substitution or the empirical validity of any GCS fit.

The final theorem formalizes the source-conditioned ratio R/rho and the
positivity condition for the standard local normal-tube Jacobian factor
1 - R/rho. It does NOT prove that an observed CME is a material solid tube,
that the empirical GCS shell is globally embedded, or that the fit parameters
are independent measurements. The physical/source premises remain separate.
-/

namespace HsHVerification.GCSLocalReachGeometry

noncomputable section

/-- The GCS cone-axis offset b = hLeg / cos(alpha). -/
def coneBaseOffset (hLeg c : ℝ) : ℝ :=
  hLeg / c

/-- Radius rho of the GCS front's generating circle:
    rho = hLeg * tan(alpha) = hLeg * sin(alpha) / cos(alpha). -/
def generatingCircleRadius (hLeg s c : ℝ) : ℝ :=
  hLeg * s / c

/-- The source's beta = pi/2 radial coordinate X0. -/
def apexCenterXOffset (hLeg s c kappa : ℝ) : ℝ :=
  (generatingCircleRadius hLeg s c
    + coneBaseOffset hLeg c * kappa^2) / (1 - kappa^2)

/-- Heliocentric height of the apex cross-section centre, b + X0. -/
def apexCenterHeight (hLeg s c kappa : ℝ) : ℝ :=
  coneBaseOffset hLeg c + apexCenterXOffset hLeg s c kappa

/-- GCS cross-section radius at the apex, from the source's beta = pi/2
    expression R = kappa * (b + rho) / (1 - kappa^2). -/
def apexCrossSectionRadius (hLeg s c kappa : ℝ) : ℝ :=
  kappa * (coneBaseOffset hLeg c + generatingCircleRadius hLeg s c)
    / (1 - kappa^2)

/-- Leading-edge height, apex-centre height plus apex cross-section radius. -/
def leadingEdgeHeight (hLeg s c kappa : ℝ) : ℝ :=
  apexCenterHeight hLeg s c kappa
    + apexCrossSectionRadius hLeg s c kappa

/-- Cross-section radius divided by the generating-circle curvature radius. -/
def localReachRatio (hLeg s c kappa : ℝ) : ℝ :=
  apexCrossSectionRadius hLeg s c kappa
    / generatingCircleRadius hLeg s c

/-- The standard local normal-tube Jacobian factor at the inward apex boundary.
    Its geometric applicability is a separate premise, not proved here. -/
def apexInnerNormalJacobian (hLeg s c kappa : ℝ) : ℝ :=
  1 - localReachRatio hLeg s c kappa

/-- The apex-centre height simplifies to (b + rho)/(1-kappa^2). -/
theorem apexCenterHeight_eq
    (hLeg s c kappa : ℝ)
    (hc : c ≠ 0)
    (hk : kappa^2 ≠ 1) :
    apexCenterHeight hLeg s c kappa
      = (coneBaseOffset hLeg c + generatingCircleRadius hLeg s c)
          / (1 - kappa^2) := by
  unfold apexCenterHeight apexCenterXOffset coneBaseOffset generatingCircleRadius
  field_simp [hc, hk]
  ring

/-- The source's apex cross-section radius is kappa times apex-centre height. -/
theorem apexCrossSectionRadius_eq_kappa_mul_apexCenterHeight
    (hLeg s c kappa : ℝ)
    (hc : c ≠ 0)
    (hk : kappa^2 ≠ 1) :
    apexCrossSectionRadius hLeg s c kappa
      = kappa * apexCenterHeight hLeg s c kappa := by
  rw [apexCenterHeight_eq hLeg s c kappa hc hk]
  unfold apexCrossSectionRadius
  ring

/-- The leading-edge height is (b + rho)/(1-kappa). -/
theorem leadingEdgeHeight_eq
    (hLeg s c kappa : ℝ)
    (hc : c ≠ 0)
    (hk : kappa^2 ≠ 1)
    (hk1 : kappa ≠ 1)
    (_hkn1 : kappa ≠ -1) :
    leadingEdgeHeight hLeg s c kappa
      = (coneBaseOffset hLeg c + generatingCircleRadius hLeg s c)
          / (1 - kappa) := by
  unfold leadingEdgeHeight
  rw [apexCenterHeight_eq hLeg s c kappa hc hk]
  unfold apexCrossSectionRadius
  field_simp [hc, hk, hk1, _hkn1]
  ring

/-- The correct GCS ratio is
    R/rho = kappa*(1+sin(alpha))/((1-kappa^2)*sin(alpha)).
    Here s=sin(alpha) and c=cos(alpha). -/
theorem localReachRatio_eq
    (hLeg s c kappa : ℝ)
    (hh : hLeg ≠ 0)
    (hs : s ≠ 0)
    (hc : c ≠ 0)
    (hk : kappa^2 ≠ 1) :
    localReachRatio hLeg s c kappa
      = kappa * (1 + s) / ((1 - kappa^2) * s) := by
  unfold localReachRatio apexCrossSectionRadius generatingCircleRadius
    coneBaseOffset
  field_simp [hh, hs, hc, hk]

/-- Under positive GCS fit parameters, the standard local normal-tube
    Jacobian is positive across the full inward apex radius exactly when
    kappa*(1+s) < (1-kappa^2)*s. This is an algebraic gate, not a claim that
    every empirical GCS shell is a material tubular neighbourhood. -/
theorem apexInnerNormalJacobian_positive_iff
    (hLeg s c kappa : ℝ)
    (hh : 0 < hLeg)
    (hs : 0 < s)
    (hc : 0 < c)
    (hk0 : 0 < kappa)
    (hk1 : kappa < 1) :
    0 < apexInnerNormalJacobian hLeg s c kappa
      ↔ kappa * (1 + s) < (1 - kappa^2) * s := by
  have hh0 : hLeg ≠ 0 := ne_of_gt hh
  have hs0 : s ≠ 0 := ne_of_gt hs
  have hc0 : c ≠ 0 := ne_of_gt hc
  have hk0sq : kappa^2 ≠ 1 := by nlinarith
  have hden : 0 < (1 - kappa^2) * s := by
    have hksq : kappa^2 < 1 := by nlinarith
    exact mul_pos (sub_pos.mpr hksq) hs
  unfold apexInnerNormalJacobian
  rw [localReachRatio_eq hLeg s c kappa hh0 hs0 hc0 hk0sq]
  rw [sub_pos]
  simpa using (div_lt_iff₀ hden)

#print axioms apexCenterHeight_eq
#print axioms apexCrossSectionRadius_eq_kappa_mul_apexCenterHeight
#print axioms leadingEdgeHeight_eq
#print axioms localReachRatio_eq
#print axioms apexInnerNormalJacobian_positive_iff

end
end HsHVerification.GCSLocalReachGeometry
