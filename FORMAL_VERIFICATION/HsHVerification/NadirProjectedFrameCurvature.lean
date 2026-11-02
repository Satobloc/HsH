import Mathlib

/-!
# Nadir: projected-frame curvature versus full-frame flatness

Source/invention boundary:
* Nathan Direct (2026-10-29) distinguishes an ambient 4D carrier, a 3D
  resolving slice, a finite-core worldtube, and its observed slice.
* The October 1 Nadir authorization (recovered from prior-context user
  statements; raw export IDs remain missing) permits abstract sandbox math.
* PLAYGROUND_001 and the coefficient example are assistant-generated
  proposals, not Nathan-authored equations or physical claims.

The coefficient matrices below are the symbolic derivative coefficients for
E(theta, phi) = R12(theta) R23(phi) in SO(4), with s = sin(phi) and
c = cos(phi), under the sign convention recorded in the Nadir frame audit.

This module checks the resulting finite-dimensional matrix identities:
1. the full SO(4) frame-connection curvature coefficient cancels;
2. the projected tangent-block curvature is nonzero in general; and
3. that tangent curvature equals the quadratic off-diagonal (second
   fundamental-form) block B_theta^T B_phi - B_phi^T B_theta.

It does NOT derive the coefficients from an immersion, prove Gauss-Codazzi-
Ricci for arbitrary surfaces, or establish a physical H(s)H connection.
-/ 

namespace HsHVerification.NadirProjectedFrameCurvature

abbrev M2 := Matrix (Fin 2) (Fin 2) ℝ
abbrev M4 := Matrix (Fin 4) (Fin 4) ℝ

/-- Standard skew generator in one oriented 2-plane. -/
def skew2 (a : ℝ) : M2 := !![0, -a; a, 0]

/-- Full ambient SO(4) connection coefficient along theta. -/
def fullOmegaTheta (s c : ℝ) : M4 :=
  !![0, -c, s, 0;
     c, 0, 0, 0;
     -s, 0, 0, 0;
     0, 0, 0, 0]

/-- Full ambient SO(4) connection coefficient along phi. -/
def fullOmegaPhi : M4 :=
  !![0, 0, 0, 0;
     0, 0, -1, 0;
     0, 1, 0, 0;
     0, 0, 0, 0]

/-- Phi-derivative coefficient of fullOmegaTheta, using s'=c and c'=-s. -/
def dPhiFullOmegaTheta (s c : ℝ) : M4 :=
  !![0, s, c, 0;
     -s, 0, 0, 0;
     -c, 0, 0, 0;
     0, 0, 0, 0]

/-- Full Maurer-Cartan curvature coefficient:
    d_theta Omega_phi - d_phi Omega_theta + [Omega_theta, Omega_phi]. -/
def fullCurvatureCoeff (s c : ℝ) : M4 :=
  - dPhiFullOmegaTheta s c
    + (fullOmegaTheta s c * fullOmegaPhi - fullOmegaPhi * fullOmegaTheta s c)

/-- For this globally framed SO(4) example, the full curvature coefficient is zero. -/
theorem fullFrameCurvatureCoeff_eq_zero (s c : ℝ) :
    fullCurvatureCoeff s c = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [fullCurvatureCoeff, dPhiFullOmegaTheta, fullOmegaTheta,
      fullOmegaPhi, Matrix.mul_apply, Fin.sum_univ_succ] <;> ring

/-- The projected tangent-block connection along theta. -/
def tangentOmegaTheta (c : ℝ) : M2 := skew2 c

/-- The projected tangent-block connection along phi is zero in this example. -/
def tangentOmegaPhi : M2 := 0

/-- Phi-derivative coefficient of the projected tangent connection. -/
def dPhiTangentOmegaTheta (s : ℝ) : M2 := !![0, s; -s, 0]

/-- Projected tangent curvature coefficient for the chosen frame map. -/
def tangentCurvatureCoeff (s c : ℝ) : M2 :=
  - dPhiTangentOmegaTheta s
    + (tangentOmegaTheta c * tangentOmegaPhi
       - tangentOmegaPhi * tangentOmegaTheta c)

/-- The projected tangent curvature is the skew plane generator with coefficient s. -/
theorem tangentCurvatureCoeff_eq_skew2 (s c : ℝ) :
    tangentCurvatureCoeff s c = skew2 s := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [tangentCurvatureCoeff, dPhiTangentOmegaTheta,
      tangentOmegaTheta, tangentOmegaPhi, skew2, Matrix.mul_apply] <;> ring

/-- Off-diagonal frame-connection block along theta (second fundamental data). -/
def BTheta (s : ℝ) : M2 := !![-s, 0; 0, 0]

/-- Off-diagonal frame-connection block along phi (second fundamental data). -/
def BPhi : M2 := !![0, 1; 0, 0]

/-- The tangent Gauss block B_theta^T B_phi - B_phi^T B_theta. -/
def gaussBlockCoeff (s : ℝ) : M2 :=
  (BTheta s).transpose * BPhi - BPhi.transpose * BTheta s

/-- The Gauss block exactly reproduces the projected tangent curvature. -/
theorem gaussBlockCoeff_eq_skew2 (s : ℝ) :
    gaussBlockCoeff s = skew2 s := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [gaussBlockCoeff, BTheta, BPhi, skew2,
      Matrix.mul_apply, Fin.sum_univ_succ] <;> ring

/-- Concrete Gauss-block identity for this coefficient family. -/
theorem tangentCurvature_eq_gaussBlock (s c : ℝ) :
    tangentCurvatureCoeff s c = gaussBlockCoeff s := by
  rw [tangentCurvatureCoeff_eq_skew2, gaussBlockCoeff_eq_skew2]

#print axioms fullFrameCurvatureCoeff_eq_zero
#print axioms tangentCurvatureCoeff_eq_skew2
#print axioms gaussBlockCoeff_eq_skew2
#print axioms tangentCurvature_eq_gaussBlock

end HsHVerification.NadirProjectedFrameCurvature
