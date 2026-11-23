import Mathlib

/-!
# Ratz et al. (2026): fitted steady thrust-coefficient baseline

Source: M. Ratz et al., arXiv:2611.07862v1, Eq. (5), and Appendix A.
Dataset: Zenodo 10.5281/zenodo.23083730, version 1.0.0.

The paper describes a second-order polynomial fit to steady mean thrust
coefficient versus RPM.  beta0/beta1/beta2 are assistant-local names for its
three coefficients; they are not source notation.  This module verifies the
derivative of that source-described polynomial baseline.

The transient relative residual is defined below to make the measurement
map explicit, but its quotient-rule Jacobian and the propagated covariance
are NOT formalized in this module.  Those remain an assistant derivation
pending a source-bound coefficient covariance and the raw acquisition
records.  No measured values, fit, covariance matrix, or H(s)H prediction
are computed here.
-/

noncomputable section

namespace HsHVerification.RatzDeltaCTCovariance

def steadyBaseline (beta0 beta1 beta2 n : ℝ) : ℝ :=
  beta0 + beta1 * n + beta2 * n^2

def relativeResidual (c n beta0 beta1 beta2 : ℝ) : ℝ :=
  c / steadyBaseline beta0 beta1 beta2 n - 1

theorem steadyBaseline_hasDerivAt
    (beta0 beta1 beta2 n : ℝ) :
    HasDerivAt (fun x : ℝ => steadyBaseline beta0 beta1 beta2 x)
      (beta1 + 2 * beta2 * n) n := by
  dsimp [steadyBaseline]
  convert
    ((hasDerivAt_const n beta0).add
      ((hasDerivAt_const n beta1).mul (hasDerivAt_id n))).add
      ((hasDerivAt_const n beta2).mul ((hasDerivAt_id n).pow 2))
    using 1
  <;> simp
  <;> ring_nf

#print axioms steadyBaseline_hasDerivAt

end HsHVerification.RatzDeltaCTCovariance
