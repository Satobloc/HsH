import Mathlib

/-!
# Ravel: skew-rotation kinematic separation in four coordinates

This module formalizes the explicit algebraic example recorded in BEDROCK.md
under the 2026-10-20/21 kinematic discussion:

* a block-diagonal 4x4 skew matrix with two equal 2D rotation blocks;
* zero trace for the corresponding linear velocity operator;
* the squared operator acts as multiplication by -frequency^2.

The formal result is conditional linear algebra. It does not prove that a
physical worldtube exists, that ambient Riemann curvature is nonzero, that
3D acceleration is universally 4D curvature, or that the example produces
gravity. The trace is the algebraic divergence of a linear vector field;
the squared matrix action is the corresponding directional-acceleration
expression. No physical data or fitted parameters are used.
-/

namespace HsHVerification.RavelSkewRotationKinematics

abbrev Index := Fin 4
abbrev Vector4 := Index → ℝ
abbrev Matrix4 := Matrix Index Index ℝ

/-- Two equal planar rotation blocks in four real coordinates. -/
def rotationMatrix (frequency : ℝ) : Matrix4 :=
  !![0, -frequency, 0, 0;
     frequency, 0, 0, 0;
     0, 0, 0, -frequency;
     0, 0, frequency, 0]

/-- The source example's generator is skew-symmetric. -/
theorem rotationMatrix_skew (frequency : ℝ) :
    (rotationMatrix frequency)ᵀ = -rotationMatrix frequency := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [rotationMatrix]

/-- Squaring the generator gives -frequency^2 times the identity. -/
theorem rotationMatrix_sq (frequency : ℝ) :
    rotationMatrix frequency * rotationMatrix frequency =
      -(frequency ^ 2) • (1 : Matrix4) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [rotationMatrix, Matrix.mul_apply] <;> ring

/-- Algebraic divergence of the linear velocity field x ↦ Ωx, equal to tr Ω. -/
def linearExpansion (frequency : ℝ) : ℝ :=
  Matrix.trace (rotationMatrix frequency)

/-- The skew-rotation example has zero linear expansion. -/
theorem linearExpansion_zero (frequency : ℝ) :
    linearExpansion frequency = 0 := by
  simp [linearExpansion, rotationMatrix, Matrix.trace]

/-- Algebraic directional-acceleration expression Ω²x for the linear field. -/
def directionalAcceleration (frequency : ℝ) (x : Vector4) : Vector4 :=
  (rotationMatrix frequency * rotationMatrix frequency) ᵥ x

/-- The acceleration expression is -frequency^2 x. -/
theorem directionalAcceleration_formula (frequency : ℝ) (x : Vector4) :
    directionalAcceleration frequency x = -(frequency ^ 2) • x := by
  simp [directionalAcceleration, rotationMatrix_sq]

end HsHVerification.RavelSkewRotationKinematics
