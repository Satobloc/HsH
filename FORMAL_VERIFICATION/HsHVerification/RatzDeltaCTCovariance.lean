import Mathlib

/-!
# Ratz et al. (2026): fit-conditioned thrust-coefficient residual

Source: M. Ratz et al., arXiv:2611.07862v1, Eqs. (4)-(5), and Appendix A.
Dataset: Zenodo 10.5281/zenodo.23083730, version 1.0.0.

The paper defines the mean thrust coefficient from mean thrust and rotational
speed, then defines the transient relative difference against a second-order
polynomial fit to steady thrust coefficient versus RPM.  The coefficient
names beta0, beta1, beta2 below are assistant-local names for that fitted
polynomial; they are not source notation.

The RPM-to-angular-speed conversion omega = 2*pi*n/60 is standard unit
conversion, not a verbatim paper equation.  T is the source's mean thrust,
n is mean RPM, rho is air density, and R is rotor radius.

This module verifies the algebraic measurement map and its partial
sensitivities.  It does not contain measured values, estimate fit coefficients,
compute a covariance matrix, or make an H(s)H prediction.  A Lean proof here
checks only the formalized measurement-map identities.
-/

namespace HsHVerification.RatzDeltaCTCovariance

def omegaFromRPM (n : ℝ) : ℝ :=
  2 * Real.pi * n / 60

def sourceThrustCoefficient (T n rho R : ℝ) : ℝ :=
  T / (rho * Real.pi * R^2 * (omegaFromRPM n * R)^2)

def reducedThrustCoefficient (T n rho R : ℝ) : ℝ :=
  900 * T / (rho * Real.pi^3 * R^4 * n^2)

theorem sourceThrustCoefficient_eq_reduced
    (T n rho R : ℝ)
    (hn : n ≠ 0) (hrho : rho ≠ 0) (hR : R ≠ 0) :
    sourceThrustCoefficient T n rho R =
      reducedThrustCoefficient T n rho R := by
  have hpi : Real.pi ≠ 0 := ne_of_gt Real.pi_pos
  unfold sourceThrustCoefficient reducedThrustCoefficient omegaFromRPM
  field_simp [hn, hrho, hR, hpi]
  <;> ring

def steadyBaseline (beta0 beta1 beta2 n : ℝ) : ℝ :=
  beta0 + beta1 * n + beta2 * n^2

def residualDenominator (rho R n beta0 beta1 beta2 : ℝ) : ℝ :=
  rho * Real.pi^3 * R^4 * n^2 * steadyBaseline beta0 beta1 beta2 n

/-- Eq. (5) after substituting Eq. (4) and the standard RPM conversion. -/
def rawRelativeResidual
    (T n rho R beta0 beta1 beta2 : ℝ) : ℝ :=
  900 * T / residualDenominator rho R n beta0 beta1 beta2 - 1

theorem rawRelativeResidual_eq_source
    (T n rho R beta0 beta1 beta2 : ℝ)
    (hn : n ≠ 0) (hrho : rho ≠ 0) (hR : R ≠ 0)
    (hp : steadyBaseline beta0 beta1 beta2 n ≠ 0) :
    rawRelativeResidual T n rho R beta0 beta1 beta2 =
      sourceThrustCoefficient T n rho R /
        steadyBaseline beta0 beta1 beta2 n - 1 := by
  have hpi : Real.pi ≠ 0 := ne_of_gt Real.pi_pos
  unfold rawRelativeResidual residualDenominator steadyBaseline
    sourceThrustCoefficient omegaFromRPM
  field_simp [hn, hrho, hR, hpi, hp]
  <;> ring

lemma hasDerivAt_const_div_sub_one
    (A : ℝ) {f : ℝ → ℝ} {f' x : ℝ}
    (hf : HasDerivAt f f' x) (hfx : f x ≠ 0) :
    HasDerivAt (fun z : ℝ => A / f z - 1)
      (-A * f' / (f x)^2) x := by
  have hnum : HasDerivAt (fun _ : ℝ => A) 0 x :=
    hasDerivAt_const x A
  convert (hnum.div hf hfx).sub (hasDerivAt_const x 1) using 1
  <;> simp
  <;> ring

theorem rawRelativeResidual_hasDerivAt_T
    (T n rho R beta0 beta1 beta2 : ℝ)
    (hden : residualDenominator rho R n beta0 beta1 beta2 ≠ 0) :
    HasDerivAt
      (fun x : ℝ => rawRelativeResidual x n rho R beta0 beta1 beta2)
      (900 / residualDenominator rho R n beta0 beta1 beta2) T := by
  let D := residualDenominator rho R n beta0 beta1 beta2
  have hlin :
      HasDerivAt (fun x : ℝ => (900 / D) * x - 1) (900 / D) T := by
    convert
      ((hasDerivAt_const T (900 / D)).mul (hasDerivAt_id T)).sub
        (hasDerivAt_const T 1) using 1
    <;> simp
    <;> ring
  convert hlin using 1
  <;> simp [rawRelativeResidual, D]
  <;> field_simp [hden]
  <;> ring

theorem rawRelativeResidual_hasDerivAt_n
    (T n rho R beta0 beta1 beta2 : ℝ)
    (hden : residualDenominator rho R n beta0 beta1 beta2 ≠ 0) :
    HasDerivAt
      (fun x : ℝ => rawRelativeResidual T x rho R beta0 beta1 beta2)
      (-(900 * T) *
        (rho * Real.pi^3 * R^4 *
          (2 * n * steadyBaseline beta0 beta1 beta2 n +
            n^2 * (beta1 + 2 * beta2 * n))) /
        (residualDenominator rho R n beta0 beta1 beta2)^2) n := by
  let C := rho * Real.pi^3 * R^4
  have hpoly :
      HasDerivAt (fun x : ℝ => steadyBaseline beta0 beta1 beta2 x)
        (beta1 + 2 * beta2 * n) n := by
    dsimp [steadyBaseline]
    convert
      ((hasDerivAt_const n beta0).add
        ((hasDerivAt_const n beta1).mul (hasDerivAt_id n))).add
        ((hasDerivAt_const n beta2).mul ((hasDerivAt_id n).pow 2))
      using 1
    <;> simp
    <;> ring
  have hpow : HasDerivAt (fun x : ℝ => x^2) (2 * n) n := by
    convert (hasDerivAt_id n).pow 2 using 1
    <;> simp
    <;> ring
  have hprod :
      HasDerivAt
        (fun x : ℝ => x^2 * steadyBaseline beta0 beta1 beta2 x)
        (2 * n * steadyBaseline beta0 beta1 beta2 n +
          n^2 * (beta1 + 2 * beta2 * n)) n := by
    convert hpow.mul hpoly using 1
    <;> simp
    <;> ring
  have hden' :
      HasDerivAt
        (fun x : ℝ => C * (x^2 * steadyBaseline beta0 beta1 beta2 x))
        (C *
          (2 * n * steadyBaseline beta0 beta1 beta2 n +
            n^2 * (beta1 + 2 * beta2 * n))) n := by
    convert (hasDerivAt_const n C).mul hprod using 1
    <;> simp
    <;> ring
  have hfx :
      C * (n^2 * steadyBaseline beta0 beta1 beta2 n) ≠ 0 := by
    simpa [C, residualDenominator, steadyBaseline, mul_assoc] using hden
  have hraw := hasDerivAt_const_div_sub_one (900 * T) hden' hfx
  simpa [rawRelativeResidual, residualDenominator, steadyBaseline, C, mul_assoc]
    using hraw

theorem rawRelativeResidual_hasDerivAt_rho
    (T n rho R beta0 beta1 beta2 : ℝ)
    (hden : residualDenominator rho R n beta0 beta1 beta2 ≠ 0) :
    HasDerivAt
      (fun x : ℝ => rawRelativeResidual T n x R beta0 beta1 beta2)
      (-(900 * T) *
        (Real.pi^3 * R^4 * n^2 * steadyBaseline beta0 beta1 beta2 n) /
        (residualDenominator rho R n beta0 beta1 beta2)^2) rho := by
  let C := Real.pi^3 * R^4 * n^2 * steadyBaseline beta0 beta1 beta2 n
  have hden' : HasDerivAt (fun x : ℝ => x * C) C rho := by
    convert (hasDerivAt_id rho).mul (hasDerivAt_const rho C) using 1
    <;> simp
  have hfx : rho * C ≠ 0 := by
    simpa [C, residualDenominator, steadyBaseline, mul_assoc, mul_left_comm, mul_comm]
      using hden
  have hraw := hasDerivAt_const_div_sub_one (900 * T) hden' hfx
  simpa [rawRelativeResidual, residualDenominator, steadyBaseline, C,
    mul_assoc, mul_left_comm, mul_comm] using hraw

theorem rawRelativeResidual_hasDerivAt_R
    (T n rho R beta0 beta1 beta2 : ℝ)
    (hden : residualDenominator rho R n beta0 beta1 beta2 ≠ 0) :
    HasDerivAt
      (fun x : ℝ => rawRelativeResidual T n rho x beta0 beta1 beta2)
      (-(900 * T) *
        (rho * Real.pi^3 * 4 * R^3 * n^2 *
          steadyBaseline beta0 beta1 beta2 n) /
        (residualDenominator rho R n beta0 beta1 beta2)^2) R := by
  let C := rho * Real.pi^3 * n^2 * steadyBaseline beta0 beta1 beta2 n
  have hpow : HasDerivAt (fun x : ℝ => x^4) (4 * R^3) R := by
    convert (hasDerivAt_id R).pow 4 using 1
    <;> simp
    <;> ring
  have hden' : HasDerivAt (fun x : ℝ => C * x^4) (C * (4 * R^3)) R := by
    convert (hasDerivAt_const R C).mul hpow using 1
    <;> simp
    <;> ring
  have hfx : C * R^4 ≠ 0 := by
    simpa [C, residualDenominator, steadyBaseline, mul_assoc, mul_left_comm, mul_comm]
      using hden
  have hraw := hasDerivAt_const_div_sub_one (900 * T) hden' hfx
  simpa [rawRelativeResidual, residualDenominator, steadyBaseline, C,
    mul_assoc, mul_left_comm, mul_comm] using hraw

theorem rawRelativeResidual_hasDerivAt_beta0
    (T n rho R beta0 beta1 beta2 : ℝ)
    (hden : residualDenominator rho R n beta0 beta1 beta2 ≠ 0) :
    HasDerivAt
      (fun x : ℝ => rawRelativeResidual T n rho R x beta1 beta2)
      (-(900 * T) * (rho * Real.pi^3 * R^4 * n^2) /
        (residualDenominator rho R n beta0 beta1 beta2)^2) beta0 := by
  let C := rho * Real.pi^3 * R^4 * n^2
  let B := beta1 * n + beta2 * n^2
  have hlin : HasDerivAt (fun x : ℝ => x + B) 1 beta0 := by
    convert (hasDerivAt_id beta0).add (hasDerivAt_const beta0 B) using 1
    <;> simp
  have hden' : HasDerivAt (fun x : ℝ => C * (x + B)) C beta0 := by
    convert (hasDerivAt_const beta0 C).mul hlin using 1
    <;> simp
  have hfx : C * (beta0 + B) ≠ 0 := by
    simpa [C, B, residualDenominator, steadyBaseline, mul_assoc] using hden
  have hraw := hasDerivAt_const_div_sub_one (900 * T) hden' hfx
  simpa [rawRelativeResidual, residualDenominator, steadyBaseline, C, B, mul_assoc]
    using hraw

theorem rawRelativeResidual_hasDerivAt_beta1
    (T n rho R beta0 beta1 beta2 : ℝ)
    (hden : residualDenominator rho R n beta0 beta1 beta2 ≠ 0) :
    HasDerivAt
      (fun x : ℝ => rawRelativeResidual T n rho R beta0 x beta2)
      (-(900 * T) * (rho * Real.pi^3 * R^4 * n^3) /
        (residualDenominator rho R n beta0 beta1 beta2)^2) beta1 := by
  let C := rho * Real.pi^3 * R^4 * n^2
  let B := beta0 + beta2 * n^2
  have hlin :
      HasDerivAt (fun x : ℝ => beta0 + x * n + beta2 * n^2) n beta1 := by
    convert
      ((hasDerivAt_const beta1 beta0).add
        ((hasDerivAt_id beta1).mul (hasDerivAt_const beta1 n))).add
        (hasDerivAt_const beta1 (beta2 * n^2))
      using 1
    <;> simp
    <;> ring
  have hden' : HasDerivAt
      (fun x : ℝ => C * (beta0 + x * n + beta2 * n^2)) (C * n) beta1 := by
    convert (hasDerivAt_const beta1 C).mul hlin using 1
    <;> simp
    <;> ring
  have hfx : C * (beta0 + beta1 * n + beta2 * n^2) ≠ 0 := by
    simpa [C, residualDenominator, steadyBaseline, mul_assoc] using hden
  have hraw := hasDerivAt_const_div_sub_one (900 * T) hden' hfx
  simpa [rawRelativeResidual, residualDenominator, steadyBaseline, C, mul_assoc]
    using hraw

theorem rawRelativeResidual_hasDerivAt_beta2
    (T n rho R beta0 beta1 beta2 : ℝ)
    (hden : residualDenominator rho R n beta0 beta1 beta2 ≠ 0) :
    HasDerivAt
      (fun x : ℝ => rawRelativeResidual T n rho R beta0 beta1 x)
      (-(900 * T) * (rho * Real.pi^3 * R^4 * n^4) /
        (residualDenominator rho R n beta0 beta1 beta2)^2) beta2 := by
  let C := rho * Real.pi^3 * R^4 * n^2
  have hlin :
      HasDerivAt (fun x : ℝ => beta0 + beta1 * n + x * n^2) (n^2) beta2 := by
    convert
      ((hasDerivAt_const beta2 beta0).add
        (hasDerivAt_const beta2 (beta1 * n))).add
        ((hasDerivAt_id beta2).mul (hasDerivAt_const beta2 (n^2)))
      using 1
    <;> simp
    <;> ring
  have hden' :
      HasDerivAt (fun x : ℝ => C * (beta0 + beta1 * n + x * n^2))
        (C * n^2) beta2 := by
    convert (hasDerivAt_const beta2 C).mul hlin using 1
    <;> simp
    <;> ring
  have hfx : C * (beta0 + beta1 * n + beta2 * n^2) ≠ 0 := by
    simpa [C, residualDenominator, steadyBaseline, mul_assoc] using hden
  have hraw := hasDerivAt_const_div_sub_one (900 * T) hden' hfx
  simpa [rawRelativeResidual, residualDenominator, steadyBaseline, C, mul_assoc]
    using hraw

#print axioms sourceThrustCoefficient_eq_reduced
#print axioms rawRelativeResidual_eq_source
#print axioms rawRelativeResidual_hasDerivAt_T
#print axioms rawRelativeResidual_hasDerivAt_n
#print axioms rawRelativeResidual_hasDerivAt_rho
#print axioms rawRelativeResidual_hasDerivAt_R
#print axioms rawRelativeResidual_hasDerivAt_beta0
#print axioms rawRelativeResidual_hasDerivAt_beta1
#print axioms rawRelativeResidual_hasDerivAt_beta2

end HsHVerification.RatzDeltaCTCovariance
