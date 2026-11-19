import Mathlib

/-!
# Hale / Kolmogorov–Barenblatt dimensional consistency

Source: Matsuzawa et al., PNAS 123 (2026), e2526858123, Eqs. (2)–(4).
The paper defines q = u_i*u_i/2 (velocity squared), ell as an integral
length scale, kappa_q = c0*ell*sqrt(q), and epsilon = epsilon0*q^(3/2)/ell.

This module encodes SI dimensions as rational exponents of length and time.
It checks that the two right-hand-side terms in the source equation have
the same dimensions as partial_t q, conditional on the source definitions.
It does not validate the PDE, its closure, or any H(s)H mapping.
-/

namespace HsHVerification.HaleKBDimensionalConsistency

/-- A dimension is a pair of rational exponents (length, time). -/
abbrev Dimension := ℚ × ℚ

def dimMul (a b : Dimension) : Dimension :=
  (a.1 + b.1, a.2 + b.2)

def dimDiv (a b : Dimension) : Dimension :=
  (a.1 - b.1, a.2 - b.2)

def qDim : Dimension := (2, -2)
def ellDim : Dimension := (1, 0)
def laplacianDim : Dimension := (-2, 0)
def timeDim : Dimension := (0, 1)
def qThreeHalvesDim : Dimension := (3, -3)
def sqrtQDim : Dimension := (1, -1)

/-- q/t has dimensions L^2 T^-3. -/
theorem timeDerivativeQ_dimension :
    dimDiv qDim timeDim = (2, -3) := by
  norm_num [dimDiv, qDim, timeDim]

/-- ell * Laplacian(q^(3/2)) has dimensions L^2 T^-3. -/
theorem nonlinearTransport_dimension :
    dimMul ellDim (dimMul laplacianDim qThreeHalvesDim) = (2, -3) := by
  norm_num [dimMul, ellDim, laplacianDim, qThreeHalvesDim]

/-- q^(3/2)/ell has dimensions L^2 T^-3. -/
theorem nonlinearDissipation_dimension :
    dimDiv qThreeHalvesDim ellDim = (2, -3) := by
  norm_num [dimDiv, qThreeHalvesDim, ellDim]

/-- The effective coefficient kappa_q = ell*sqrt(q) has dimensions L^2 T^-1. -/
theorem effectiveDiffusivity_dimension :
    dimMul ellDim sqrtQDim = (2, -1) := by
  norm_num [dimMul, ellDim, sqrtQDim]

/-- Both source-equation terms match the time derivative of q. -/
theorem bothTerms_match_timeDerivative :
    dimMul ellDim (dimMul laplacianDim qThreeHalvesDim) =
      dimDiv qThreeHalvesDim ellDim ∧
    dimDiv qThreeHalvesDim ellDim = dimDiv qDim timeDim := by
  constructor <;> norm_num [dimMul, dimDiv, ellDim, laplacianDim,
    qThreeHalvesDim, qDim, timeDim]

#print axioms timeDerivativeQ_dimension
#print axioms nonlinearTransport_dimension
#print axioms nonlinearDissipation_dimension
#print axioms effectiveDiffusivity_dimension
#print axioms bothTerms_match_timeDerivative

end HsHVerification.HaleKBDimensionalConsistency
