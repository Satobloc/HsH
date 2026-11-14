import Mathlib

/-!
# Conditional Lorentzian timelike gate for the historical SAT4D ansatz

Historical source: the June 2025 SAT4D bylined draft, source blob
`2a79fe25018cce7e99a2c33786d88b0551db6ae7` as recorded in the 2026-11-11 Enheduanna source audit.
The companion `SAT O1 4D.txt` is unbylined (blob
`7577aa1ee5a6c3850ce3b226c75377de6367aedc`) and is not treated as
Nathan-authored merely because it is adjacent in the archive.

This module formalizes only the algebraic Minkowski norm of the displayed
tangent components under the explicit assumptions c = 1 and signature
(-+++). It does not prove that these components are the derivative of a
physical curve, decide whether lambda is coordinate time or proper time,
construct a finite-core worldtube, or identify this historical ansatz with
the current H(s)H native positive-definite geometry.

The velocity constructor is noncomputable because `Real.cos` is noncomputable over `Real`.
The theorem is conditional mathematics, not a measured constraint or physical validation.
-/

namespace HsHVerification.KestrelSAT4DTimelikeGate

structure Vec4 where
  t : ℝ
  x : ℝ
  y : ℝ
  z : ℝ

/-- Minkowski quadratic form with signature (-+++). -/
def minkowskiNorm4 (v : Vec4) : ℝ :=
  -(v.t * v.t) + v.x * v.x + v.y * v.y + v.z * v.z

/-- The tangent components displayed for the historical three-mode SAT4D ansatz. -/
noncomputable def sat4dVelocity
    (Ax kx phix Ay ky phiy Az kz phiz lam : ℝ) : Vec4 :=
  { t := 1
    x := Ax * kx * Real.cos (kx * lam + phix)
    y := Ay * ky * Real.cos (ky * lam + phiy)
    z := Az * kz * Real.cos (kz * lam + phiz) }

/-- Exact tangent-norm identity under the declared Lorentzian convention. -/
theorem sat4dVelocity_minkowskiNorm_eq
    (Ax kx phix Ay ky phiy Az kz phiz lam : ℝ) :
    minkowskiNorm4 (sat4dVelocity Ax kx phix Ay ky phiy Az kz phiz lam) =
      -1
        + (Ax * kx * Real.cos (kx * lam + phix)) ^ 2
        + (Ay * ky * Real.cos (ky * lam + phiy)) ^ 2
        + (Az * kz * Real.cos (kz * lam + phiz)) ^ 2 := by
  simp [minkowskiNorm4, sat4dVelocity]
  ring

/-- Pointwise timelikeness is exactly the strict sub-unit spatial-speed condition. -/
theorem sat4dVelocity_timelike_iff
    (Ax kx phix Ay ky phiy Az kz phiz lam : ℝ) :
    minkowskiNorm4 (sat4dVelocity Ax kx phix Ay ky phiy Az kz phiz lam) < 0 ↔
      (Ax * kx * Real.cos (kx * lam + phix)) ^ 2
        + (Ay * ky * Real.cos (ky * lam + phiy)) ^ 2
        + (Az * kz * Real.cos (kz * lam + phiz)) ^ 2 < 1 := by
  rw [sat4dVelocity_minkowskiNorm_eq]
  constructor <;> intro h <;> linarith

#print axioms sat4dVelocity_minkowskiNorm_eq
#print axioms sat4dVelocity_timelike_iff

end HsHVerification.KestrelSAT4DTimelikeGate
