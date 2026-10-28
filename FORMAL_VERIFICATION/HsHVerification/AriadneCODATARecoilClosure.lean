import HsHVerification.AriadneBranchProjectionGate

/-!
Ariadne :24, 2026-10-28. Conditional mathematics for a real published
cross-method metrology comparison: 2022 CODATA Table XXV D3-D6,
2020 AMDC mass evaluation and Morel 2020 / Parker 2018 atom recoil.
Source: https://physics.nist.gov/cuu/pdf/JPCRD2022CODATA.pdf
The mathematical identity is not a physical H(s)H prediction.
Source transcription, uncertainty assumptions, and experimental systematics
are not proved by Lean. Numerical analysis is a separate executed Python file.
-/

namespace HsHVerification.AriadneCODATA

/-- Exact cancellation of the common h in two h/m products,
    given nonzero measured masses. -/
theorem recoil_products_equal
    (h mRb mCs : ℝ) (hRb : mRb ≠ 0) (hCs : mCs ≠ 0) :
    (h / mRb) * mRb = (h / mCs) * mCs := by
  field_simp [hRb, hCs]

/-- Forward ratio of recoil observables is the reverse mass ratio.
    This requires nonzero h and nonzero atomic masses. -/
theorem recoil_ratio_closure
    (h mRb mCs : ℝ) (hh : h ≠ 0)
    (hRb : mRb ≠ 0) (hCs : mCs ≠ 0) :
    (h / mRb) / (h / mCs) = mCs / mRb := by
  field_simp [hh, hRb, hCs]

/-- The ratio projection cannot determine absolute mass scale. -/
theorem ratio_scale_invariant
    (mRb mCs scale : ℝ) (hRb : mRb ≠ 0) (hs : scale ≠ 0) :
    (scale * mCs) / (scale * mRb) = mCs / mRb := by
  field_simp [hRb, hs]

/-- First-order relative variance of a ratio with correlated inputs. -/
def uncorrVariance (uRb uCs : ℝ) : ℝ := uRb ^ 2 + uCs ^ 2
def corrVariance (uRb uCs rho : ℝ) : ℝ :=
  uncorrVariance uRb uCs - 2 * rho * uRb * uCs

theorem correlation_gap (uRb uCs rho : ℝ) :
    uncorrVariance uRb uCs - corrVariance uRb uCs rho =
      2 * rho * uRb * uCs := by
  unfold uncorrVariance corrVariance
  ring

theorem positive_correlation_reduces_variance
    (uRb uCs rho : ℝ)
    (hRb : 0 < uRb) (hCs : 0 < uCs) (hRho : 0 < rho) :
    corrVariance uRb uCs rho < uncorrVariance uRb uCs := by
  have hp : 0 < rho * uRb * uCs :=
    mul_pos (mul_pos hRho hRb) hCs
  unfold corrVariance
  nlinarith

/-- Table I/XXVI printed D5-D6 correlation is 0.1032.
    Positive sign is a source input, not established by this proof. -/
theorem codata_rb_cs_positive_corr
    (uRb uCs : ℝ) (hRb : 0 < uRb) (hCs : 0 < uCs) :
    corrVariance uRb uCs (0.1032 : ℝ) <
      uncorrVariance uRb uCs := by
  apply positive_correlation_reduces_variance uRb uCs (0.1032 : ℝ) hRb hCs
  norm_num

#print axioms recoil_products_equal
#print axioms recoil_ratio_closure
#print axioms ratio_scale_invariant
#print axioms correlation_gap
#print axioms positive_correlation_reduces_variance
#print axioms codata_rb_cs_positive_corr

end HsHVerification.AriadneCODATA
