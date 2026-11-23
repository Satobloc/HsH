import Mathlib

/-!
# Ratz et al. (2026): fit-conditioned thrust-coefficient residual

Source: M. Ratz et al., arXiv:2611.07862v1, Eq. (5), with the steady
reference curve described in the surrounding text and Appendix A.
Dataset: Zenodo 10.5281/zenodo.23083730, version 1.0.0.

Here c is the source-defined transient mean thrust coefficient, n is mean
rotational speed in RPM, and beta0/beta1/beta2 are assistant-local names for
the coefficients of the paper's fitted second-order steady curve. They are
not source notation.

The module formalizes the relative-residual map and its partial sensitivities
in the coordinates (c, n, beta0, beta1, beta2). The n derivative holds c
fixed; the total derivative with respect to measured RPM must additionally
include the source Eq. (4) dependence of c on thrust and angular speed.
No measured values, fit, covariance matrix, or H(s)H prediction are computed.
-/

noncomputable section

namespace HsHVerification.RatzDeltaCTCovariance

def steadyBaseline (beta0 beta1 beta2 n : ℝ) : ℝ :=
  beta0 + beta1 * n + beta2 * n^2

def relativeResidual (c n beta0 beta1 beta2 : ℝ) : ℝ :=
  c / steadyBaseline beta0 beta1 beta2 n - 1

lemma hasDerivAt_const_div_sub_one
    (A : ℝ) {f : ℝ → ℝ} {f' x : ℝ}
    (hf : HasDerivAt f f' x) (hfx : f x ≠ 0) :
    HasDerivAt (fun z : ℝ => A / f z - 1)
      (-A * f' / (f x)^2) x := by
  have hnum : HasDerivAt (fun _ : ℝ => A) 0 x :=
    hasDerivAt_const x A
  convert (hnum.div hf hfx).sub (hasDerivAt_const x 1) using 1 <;> ring

theorem relativeResidual_hasDerivAt_c
    (c n beta0 beta1 beta2 : ℝ)
    (hp : steadyBaseline beta0 beta1 beta2 n ≠ 0) :
    HasDerivAt
      (fun x : ℝ => relativeResidual x n beta0 beta1 beta2)
      (1 / steadyBaseline beta0 beta1 beta2 n) c := by
  have hnum : HasDerivAt (fun x : ℝ => x) 1 c := hasDerivAt_id c
  have hden :
      HasDerivAt (fun _ : ℝ => steadyBaseline beta0 beta1 beta2 n) 0 c :=
    hasDerivAt_const c _
  convert (hnum.div hden hp).sub (hasDerivAt_const c 1) using 1
  <;> field_simp [hp]
  <;> ring

theorem relativeResidual_hasDerivAt_n
    (c n beta0 beta1 beta2 : ℝ)
    (hp : steadyBaseline beta0 beta1 beta2 n ≠ 0) :
    HasDerivAt
      (fun x : ℝ => relativeResidual c x beta0 beta1 beta2)
      (-c * (beta1 + 2 * beta2 * n) /
        (steadyBaseline beta0 beta1 beta2 n)^2) n := by
  have hpoly :
      HasDerivAt (fun x : ℝ => steadyBaseline beta0 beta1 beta2 x)
        (beta1 + 2 * beta2 * n) n := by
    dsimp [steadyBaseline]
    convert
      ((hasDerivAt_const n beta0).add
        ((hasDerivAt_const n beta1).mul (hasDerivAt_id n))).add
        ((hasDerivAt_const n beta2).mul ((hasDerivAt_id n).pow 2))
      using 1
    <;> ring
  have hnum : HasDerivAt (fun _ : ℝ => c) 0 n :=
    hasDerivAt_const n c
  convert (hnum.div hpoly hp).sub (hasDerivAt_const n 1) using 1
  <;> field_simp [hp]
  <;> ring

theorem relativeResidual_hasDerivAt_beta0
    (c n beta0 beta1 beta2 : ℝ)
    (hp : steadyBaseline beta0 beta1 beta2 n ≠ 0) :
    HasDerivAt
      (fun x : ℝ => relativeResidual c n x beta1 beta2)
      (-c / (steadyBaseline beta0 beta1 beta2 n)^2) beta0 := by
  let B := beta1 * n + beta2 * n^2
  have hden : HasDerivAt (fun x : ℝ => x + B) 1 beta0 := by
    convert (hasDerivAt_id beta0).add (hasDerivAt_const beta0 B) using 1
    <;> ring
  have hnum : HasDerivAt (fun _ : ℝ => c) 0 beta0 :=
    hasDerivAt_const beta0 c
  have hraw := hasDerivAt_const_div_sub_one c hden (by simpa [B, steadyBaseline] using hp)
  simpa [relativeResidual, steadyBaseline, B] using hraw

theorem relativeResidual_hasDerivAt_beta1
    (c n beta0 beta1 beta2 : ℝ)
    (hp : steadyBaseline beta0 beta1 beta2 n ≠ 0) :
    HasDerivAt
      (fun x : ℝ => relativeResidual c n beta0 x beta2)
      (-c * n / (steadyBaseline beta0 beta1 beta2 n)^2) beta1 := by
  let B := beta0 + beta2 * n^2
  have hden :
      HasDerivAt (fun x : ℝ => beta0 + x * n + beta2 * n^2) n beta1 := by
    convert
      ((hasDerivAt_const beta1 beta0).add
        ((hasDerivAt_id beta1).mul (hasDerivAt_const beta1 n))).add
        (hasDerivAt_const beta1 (beta2 * n^2))
      using 1
    <;> ring
  have hraw := hasDerivAt_const_div_sub_one c hden
    (by simpa [B, steadyBaseline, mul_comm, mul_left_comm, mul_assoc] using hp)
  simpa [relativeResidual, steadyBaseline, B, mul_comm, mul_left_comm, mul_assoc]
    using hraw

theorem relativeResidual_hasDerivAt_beta2
    (c n beta0 beta1 beta2 : ℝ)
    (hp : steadyBaseline beta0 beta1 beta2 n ≠ 0) :
    HasDerivAt
      (fun x : ℝ => relativeResidual c n beta0 beta1 x)
      (-c * n^2 / (steadyBaseline beta0 beta1 beta2 n)^2) beta2 := by
  have hden :
      HasDerivAt (fun x : ℝ => beta0 + beta1 * n + x * n^2)
        (n^2) beta2 := by
    convert
      ((hasDerivAt_const beta2 beta0).add
        (hasDerivAt_const beta2 (beta1 * n))).add
        ((hasDerivAt_id beta2).mul (hasDerivAt_const beta2 (n^2)))
      using 1
    <;> ring
  have hraw := hasDerivAt_const_div_sub_one c hden
    (by simpa [steadyBaseline, mul_comm, mul_left_comm, mul_assoc] using hp)
  simpa [relativeResidual, steadyBaseline, mul_comm, mul_left_comm, mul_assoc]
    using hraw

#print axioms relativeResidual_hasDerivAt_c
#print axioms relativeResidual_hasDerivAt_n
#print axioms relativeResidual_hasDerivAt_beta0
#print axioms relativeResidual_hasDerivAt_beta1
#print axioms relativeResidual_hasDerivAt_beta2

end HsHVerification.RatzDeltaCTCovariance
