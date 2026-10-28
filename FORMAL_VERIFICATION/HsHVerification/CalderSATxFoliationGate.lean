import Mathlib

/-!
Calder | SATx historical foliation source-fidelity gate | 2026-10-28.

Historical SATx CANONICAL (SAT X/SATx CANONICAL.txt, blob
afbf610347a6a39c74cf52cbe3818ef22ab3ebcf) claims that a unit
timelike flow automatically provides 3D simultaneity slices.
That inference needs a separate Frobenius/hypersurface-orthogonality
condition in 3+1 dimensions, not just normalization.

The following theorems check ONLY algebraic consequences of the
axisymmetric coefficient C * dD - D * dC, as derived independently
in Meridian's 2026-10-10 Householder/Frobenius sandbox.
The symbols dC and dD are arbitrary real numbers representing
candidate directional derivative values. No derivative, exterior
calculus, integrability, global foliation, physics or empirical
premise is proved here. No arbitrary physical measurements are used.
-/

namespace HsHVerification.CalderSATxFoliation

noncomputable def ratioDerivative (C D dC dD : ℝ) : ℝ :=
  dD / C - D * dC / (C * C)

theorem ratioDerivative_eq_twist
    (C D dC dD : ℝ) (hC : C ≠ 0) :
    ratioDerivative C D dC dD = (C * dD - D * dC) / (C * C) := by
  unfold ratioDerivative
  field_simp [hC]

theorem frobenius_coefficient_zero_implies_ratio_stationary
    (C D dC dD : ℝ) (hC : C ≠ 0)
    (hTwist : C * dD - D * dC = 0) :
    ratioDerivative C D dC dD = 0 := by
  rw [ratioDerivative_eq_twist C D dC dD hC, hTwist]
  simp

theorem nonzero_ratio_derivative_obstructs_zero_coefficient
    (C D dC dD : ℝ) (hC : C ≠ 0)
    (hRatio : ratioDerivative C D dC dD ≠ 0) :
    C * dD - D * dC ≠ 0 := by
  intro hZero
  exact hRatio (frobenius_coefficient_zero_implies_ratio_stationary C D dC dD hC hZero)

theorem constant_ratio_satisfies_coefficient
    (C D dC dD q : ℝ)
    (hD : D = q * C) (hdD : dD = q * dC) :
    C * dD - D * dC = 0 := by
  rw [hD, hdD]
  ring

#print axioms ratioDerivative_eq_twist
#print axioms frobenius_coefficient_zero_implies_ratio_stationary
#print axioms nonzero_ratio_derivative_obstructs_zero_coefficient
#print axioms constant_ratio_satisfies_coefficient

end HsHVerification.CalderSATxFoliation
