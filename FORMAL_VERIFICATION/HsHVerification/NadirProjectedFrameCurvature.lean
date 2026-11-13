import Mathlib

/-!
# Nadir: projected-frame curvature versus full-frame flatness

## Source / invention boundary

* The October 1, 2026 independent-playground authorization is now recovered
  from the HsH raw export:
  DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/26.06.23•26.10.01•Quantum Gravity and Experiments — raw.json,
  blob d828fef5352045cb4d9486fdbeabd04043c4c119, conversation
  6a3a2037-3698-83ea-924d-2cb8c4ac7701. Direct user-role messages:
  bb8ecf64-8863-4ee7-a078-ca8cc4104974,
  11122adb-75c5-4418-9b59-29730a034811, and
  de178e6a-d223-4ad1-9bc9-d37f178f8b21. They authorize an independent
  mathematical playground with source/invention separation and no target
  fitting of old magic numbers or particle labels. They do not authorize
  fabricated physical fixtures or empirical claims.
* The 2026-10-29 geometry-clarification file (blob
  933d09e802bb98f2fd4f932b2d342f412f5bf718) is an assistant-authored
  transcription, not an authenticated Nathan user-role message. This module
  does not cite it as Nathan Direct.
* Role-verified earlier geometry sources distinguish a four-dimensional
  carrier/core from a three-dimensional resolving surface/readout, but no
  recovered direct source defines the frame map below or maps it to a physical
  worldtube. The frame map and coefficient family are assistant-generated
  sandbox mathematics, not recovered SAT-O or Blockwave equations.
* The 2026-10-30 frame-connection audit is an assistant-authored source
  reconstruction. Its block decomposition is a candidate standard
  differential-geometric interpretation, not a direct-source equation.

## Formalized construction and limits

The module now defines an explicit four-dimensional frame map
E = R12 R23 from two plane-rotation matrices. The formal directional
derivative matrices are assigned by the corresponding rotation generators.
Lean proves that their frame-conjugated coefficients equal the displayed
fullOmegaTheta and fullOmegaPhi matrices, under unit-circle assumptions.

The unit-circle assumptions are explicit. The code proves orthogonality of
the frame matrix, but does not separately prove determinant +1, analytic
HasDerivAt facts for a trigonometric parametrization, or that this frame
map is induced by an immersion of a finite-core worldtube.

The remaining theorems check:
1. the full frame-connection curvature coefficient cancels;
2. the projected tangent-block curvature is nonzero in general; and
3. in this coefficient family, that tangent curvature equals the quadratic
   off-diagonal block B_theta^T B_phi - B_phi^T B_theta.

This is a finite-dimensional conditional matrix result. It does NOT prove
Gauss-Codazzi-Ricci for arbitrary surfaces, identify a physical H(s)H
connection, establish a worldtube/timesheet projection, or make a physical
prediction.
-/ 

namespace HsHVerification.NadirProjectedFrameCurvature

abbrev M2 := Matrix (Fin 2) (Fin 2) ℝ
abbrev M4 := Matrix (Fin 4) (Fin 4) ℝ

/-- Standard skew generator in one oriented 2-plane. -/
def skew2 (a : ℝ) : M2 := !![0, -a; a, 0]

/-- Full 4×4 frame-connection coefficient along theta. -/
def fullOmegaTheta (s c : ℝ) : M4 :=
  !![0, -c, s, 0;
     c, 0, 0, 0;
     -s, 0, 0, 0;
     0, 0, 0, 0]

/-- Full 4×4 frame-connection coefficient along phi. -/
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

/-! ## Explicit frame map generating the coefficient family

The analytic trigonometric parameterization is intentionally not hidden in
these definitions. Each pair (c,s) is assumed to lie on the unit circle;
the formal directional derivatives are the standard generator actions.
-/

/-- Plane rotation in the first coordinate 2-plane. -/
def rotation12 (c s : ℝ) : M4 :=
  !![c, -s, 0, 0;
     s, c, 0, 0;
     0, 0, 1, 0;
     0, 0, 0, 1]

/-- Plane rotation in the second coordinate 2-plane. -/
def rotation23 (c s : ℝ) : M4 :=
  !![1, 0, 0, 0;
     0, c, -s, 0;
     0, s, c, 0;
     0, 0, 0, 1]

/-- Infinitesimal generator of the first coordinate-plane rotation. -/
def generator12 : M4 :=
  !![0, -1, 0, 0;
     1, 0, 0, 0;
     0, 0, 0, 0;
     0, 0, 0, 0]

/-- Infinitesimal generator of the second coordinate-plane rotation. -/
def generator23 : M4 := fullOmegaPhi

/-- The chosen global orthogonal frame map E = R12 R23. -/
def frameMap (cθ sθ cφ sφ : ℝ) : M4 :=
  rotation12 cθ sθ * rotation23 cφ sφ

/-- Formal theta-direction derivative coefficient, assigned by J12 E. -/
def dThetaFrameMap (cθ sθ cφ sφ : ℝ) : M4 :=
  generator12 * frameMap cθ sθ cφ sφ

/-- Formal phi-direction derivative coefficient, assigned by R12 J23 R23. -/
def dPhiFrameMap (cθ sθ cφ sφ : ℝ) : M4 :=
  rotation12 cθ sθ * (generator23 * rotation23 cφ sφ)

/-- Frame-conjugated theta connection coefficient Eᵀ d_theta E. -/
def frameConnectionTheta (cθ sθ cφ sφ : ℝ) : M4 :=
  (frameMap cθ sθ cφ sφ).transpose * dThetaFrameMap cθ sθ cφ sφ

/-- Frame-conjugated phi connection coefficient Eᵀ d_phi E. -/
def frameConnectionPhi (cθ sθ cφ sφ : ℝ) : M4 :=
  (frameMap cθ sθ cφ sφ).transpose * dPhiFrameMap cθ sθ cφ sφ

/-- The first plane-rotation matrix is orthogonal when (c,s) is unit. -/
theorem rotation12_orthogonal (c s : ℝ) (h : c^2 + s^2 = 1) :
    (rotation12 c s).transpose * rotation12 c s = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [rotation12, Matrix.mul_apply, Fin.sum_univ_succ] <;>
    nlinarith [h]

/-- The second plane-rotation matrix is orthogonal when (c,s) is unit. -/
theorem rotation23_orthogonal (c s : ℝ) (h : c^2 + s^2 = 1) :
    (rotation23 c s).transpose * rotation23 c s = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [rotation23, Matrix.mul_apply, Fin.sum_univ_succ] <;>
    nlinarith [h]

/-- Conjugating the first generator by its own plane rotation leaves it fixed. -/
theorem rotation12_conjugate_generator12 (c s : ℝ)
    (h : c^2 + s^2 = 1) :
    (rotation12 c s).transpose *
      (generator12 * rotation12 c s) = generator12 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [rotation12, generator12, Matrix.mul_apply,
      Fin.sum_univ_succ] <;>
    nlinarith [h]

/-- Conjugating J12 by R23 produces the displayed full theta coefficient. -/
theorem rotation23_conjugate_generator12 (c s : ℝ) :
    (rotation23 c s).transpose *
      (generator12 * rotation23 c s) = fullOmegaTheta s c := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [rotation23, generator12, fullOmegaTheta,
      Matrix.mul_apply, Fin.sum_univ_succ]

/-- Conjugating J23 by R23 leaves the second generator fixed. -/
theorem rotation23_conjugate_generator23 (c s : ℝ)
    (h : c^2 + s^2 = 1) :
    (rotation23 c s).transpose *
      (generator23 * rotation23 c s) = generator23 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [rotation23, generator23, fullOmegaPhi,
      Matrix.mul_apply, Fin.sum_univ_succ] <;>
    nlinarith [h]

/-- The product frame is orthogonal under the two unit-circle conditions. -/
theorem frameMap_orthogonal (cθ sθ cφ sφ : ℝ)
    (hθ : cθ^2 + sθ^2 = 1) (hφ : cφ^2 + sφ^2 = 1) :
    (frameMap cθ sθ cφ sφ).transpose *
      frameMap cθ sθ cφ sφ = 1 := by
  unfold frameMap
  calc
    (rotation12 cθ sθ * rotation23 cφ sφ).transpose *
        (rotation12 cθ sθ * rotation23 cφ sφ)
      = (rotation23 cφ sφ).transpose *
          ((rotation12 cθ sθ).transpose * rotation12 cθ sθ) *
          rotation23 cφ sφ := by
            simp [Matrix.transpose_mul, Matrix.mul_assoc]
    _ = 1 := by
      rw [rotation12_orthogonal cθ sθ hθ]
      simpa using rotation23_orthogonal cφ sφ hφ

/-- Eᵀ d_theta E gives the displayed full theta connection coefficient. -/
theorem frameConnectionTheta_eq_fullOmegaTheta
    (cθ sθ cφ sφ : ℝ)
    (hθ : cθ^2 + sθ^2 = 1) :
    frameConnectionTheta cθ sθ cφ sφ =
      fullOmegaTheta sφ cφ := by
  unfold frameConnectionTheta dThetaFrameMap frameMap
  calc
    (rotation12 cθ sθ * rotation23 cφ sφ).transpose *
        (generator12 *
          (rotation12 cθ sθ * rotation23 cφ sφ))
      = (rotation23 cφ sφ).transpose *
          ((rotation12 cθ sθ).transpose *
            (generator12 * rotation12 cθ sθ)) *
          rotation23 cφ sφ := by
            simp [Matrix.transpose_mul, Matrix.mul_assoc]
    _ = (rotation23 cφ sφ).transpose *
          (generator12 * rotation23 cφ sφ) := by
            rw [rotation12_conjugate_generator12 cθ sθ hθ]
            rw [Matrix.mul_assoc]
    _ = fullOmegaTheta sφ cφ :=
      rotation23_conjugate_generator12 cφ sφ

/-- Eᵀ d_phi E gives the displayed full phi connection coefficient. -/
theorem frameConnectionPhi_eq_fullOmegaPhi
    (cθ sθ cφ sφ : ℝ)
    (hθ : cθ^2 + sθ^2 = 1) (hφ : cφ^2 + sφ^2 = 1) :
    frameConnectionPhi cθ sθ cφ sφ = fullOmegaPhi := by
  unfold frameConnectionPhi dPhiFrameMap frameMap
  calc
    (rotation12 cθ sθ * rotation23 cφ sφ).transpose *
        (rotation12 cθ sθ *
          (generator23 * rotation23 cφ sφ))
      = (rotation23 cφ sφ).transpose *
          ((rotation12 cθ sθ).transpose * rotation12 cθ sθ) *
          (generator23 * rotation23 cφ sφ) := by
            simp [Matrix.transpose_mul, Matrix.mul_assoc]
    _ = (rotation23 cφ sφ).transpose *
          (generator23 * rotation23 cφ sφ) := by
            rw [rotation12_orthogonal cθ sθ hθ]
            simp
    _ = fullOmegaPhi := by
      simpa [generator23] using
        rotation23_conjugate_generator23 cφ sφ hφ

/-- Full Maurer-Cartan curvature coefficient:
    d_theta Omega_phi - d_phi Omega_theta + [Omega_theta, Omega_phi]. -/
def fullCurvatureCoeff (s c : ℝ) : M4 :=
  - dPhiFullOmegaTheta s c
    + (fullOmegaTheta s c * fullOmegaPhi - fullOmegaPhi * fullOmegaTheta s c)

/-- For this chosen global-frame coefficient family, the full curvature coefficient is zero. -/
theorem fullFrameCurvatureCoeff_eq_zero (s c : ℝ) :
    fullCurvatureCoeff s c = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [fullCurvatureCoeff, dPhiFullOmegaTheta, fullOmegaTheta,
      fullOmegaPhi]

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
      tangentOmegaTheta, tangentOmegaPhi, skew2]

/-- Off-diagonal frame-connection block along theta (second fundamental data). -/
def BTheta (s : ℝ) : M2 := !![-s, 0; 0, 0]

/-- Off-diagonal frame-connection block along phi (second fundamental data). -/
def BPhi : M2 := !![0, 1; 0, 0]

/-- The tangent Gauss block B_theta^T B_phi - B_phi^T B_theta. -/
def gaussBlockCoeff (s : ℝ) : M2 :=
  (BTheta s).transpose * BPhi - BPhi.transpose * BTheta s


/-! ## Explicit tangent / mixed block projections

The lower-left block is the chosen mixed (second-fundamental-data) block.
These are explicit extraction maps, not an assumed physical projection from
a worldtube or timesheet.
-/

/-- First two coordinate indices in Fin 4. -/
def lowerIndex (i : Fin 2) : Fin 4 :=
  ⟨i.val, by omega⟩

/-- Last two coordinate indices in Fin 4. -/
def upperIndex (i : Fin 2) : Fin 4 :=
  ⟨i.val + 2, by omega⟩

/-- Tangent 2×2 block of a 4×4 connection coefficient. -/
def tangentBlock (A : M4) : M2 :=
  fun i j => A (lowerIndex i) (lowerIndex j)

/-- Lower-left mixed 2×2 block of a 4×4 connection coefficient. -/
def mixedBlock (A : M4) : M2 :=
  fun i j => A (upperIndex i) (lowerIndex j)

/-- The theta tangent block is exactly the displayed projected connection. -/
theorem tangentBlock_fullOmegaTheta (s c : ℝ) :
    tangentBlock (fullOmegaTheta s c) = tangentOmegaTheta c := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [tangentBlock, lowerIndex, fullOmegaTheta,
      tangentOmegaTheta, skew2]

/-- The phi tangent block vanishes in this chosen frame family. -/
theorem tangentBlock_fullOmegaPhi :
    tangentBlock fullOmegaPhi = tangentOmegaPhi := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [tangentBlock, lowerIndex, fullOmegaPhi, tangentOmegaPhi]

/-- The theta mixed block is exactly B_theta. -/
theorem mixedBlock_fullOmegaTheta (s c : ℝ) :
    mixedBlock (fullOmegaTheta s c) = BTheta s := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [mixedBlock, upperIndex, lowerIndex, fullOmegaTheta, BTheta]

/-- The phi mixed block is exactly B_phi. -/
theorem mixedBlock_fullOmegaPhi :
    mixedBlock fullOmegaPhi = BPhi := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [mixedBlock, upperIndex, lowerIndex, fullOmegaPhi, BPhi]

/-- The frame-map theta projection recovers the selected tangent block. -/
theorem frameMap_tangentBlock_theta
    (cθ sθ cφ sφ : ℝ)
    (hθ : cθ^2 + sθ^2 = 1) :
    tangentBlock (frameConnectionTheta cθ sθ cφ sφ) =
      tangentOmegaTheta cφ := by
  rw [frameConnectionTheta_eq_fullOmegaTheta cθ sθ cφ sφ hθ]
  exact tangentBlock_fullOmegaTheta sφ cφ

/-- The frame-map theta projection recovers the selected mixed block. -/
theorem frameMap_mixedBlock_theta
    (cθ sθ cφ sφ : ℝ)
    (hθ : cθ^2 + sθ^2 = 1) :
    mixedBlock (frameConnectionTheta cθ sθ cφ sφ) =
      BTheta sφ := by
  rw [frameConnectionTheta_eq_fullOmegaTheta cθ sθ cφ sφ hθ]
  exact mixedBlock_fullOmegaTheta sφ cφ

/-- The frame-map phi projection recovers the selected mixed block. -/
theorem frameMap_mixedBlock_phi
    (cθ sθ cφ sφ : ℝ)
    (hθ : cθ^2 + sθ^2 = 1) (hφ : cφ^2 + sφ^2 = 1) :
    mixedBlock (frameConnectionPhi cθ sθ cφ sφ) = BPhi := by
  rw [frameConnectionPhi_eq_fullOmegaPhi cθ sθ cφ sφ hθ hφ]
  exact mixedBlock_fullOmegaPhi

/-- The Gauss block exactly reproduces the projected tangent curvature. -/
theorem gaussBlockCoeff_eq_skew2 (s : ℝ) :
    gaussBlockCoeff s = skew2 s := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [gaussBlockCoeff, BTheta, BPhi, skew2,
      Matrix.mul_apply, Fin.sum_univ_succ]

/-- Concrete Gauss-block identity for this coefficient family. -/
theorem tangentCurvature_eq_gaussBlock (s c : ℝ) :
    tangentCurvatureCoeff s c = gaussBlockCoeff s := by
  rw [tangentCurvatureCoeff_eq_skew2, gaussBlockCoeff_eq_skew2]

#print axioms rotation12_orthogonal
#print axioms rotation23_orthogonal
#print axioms rotation12_conjugate_generator12
#print axioms rotation23_conjugate_generator12
#print axioms rotation23_conjugate_generator23
#print axioms frameMap_orthogonal
#print axioms frameConnectionTheta_eq_fullOmegaTheta
#print axioms frameConnectionPhi_eq_fullOmegaPhi
#print axioms tangentBlock_fullOmegaTheta
#print axioms tangentBlock_fullOmegaPhi
#print axioms mixedBlock_fullOmegaTheta
#print axioms mixedBlock_fullOmegaPhi
#print axioms frameMap_tangentBlock_theta
#print axioms frameMap_mixedBlock_theta
#print axioms frameMap_mixedBlock_phi
#print axioms fullFrameCurvatureCoeff_eq_zero
#print axioms tangentCurvatureCoeff_eq_skew2
#print axioms gaussBlockCoeff_eq_skew2
#print axioms tangentCurvature_eq_gaussBlock

end HsHVerification.NadirProjectedFrameCurvature
