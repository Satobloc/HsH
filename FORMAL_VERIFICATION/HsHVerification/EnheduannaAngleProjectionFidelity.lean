import Mathlib

/-!
# Source-faithful projection-channel audit (NOT physical SAT proof)

The archived "2026 NEW - Google py.txt" Python code applies the x-w rotation
  [cos θ, -sin θ; sin θ, cos θ]
to the x-basis vector and then labels abs(first coordinate) "mass" and
abs(fourth coordinate) "hidden". Therefore the source's scalar channels
are abs(cos θ) and abs(sin θ), respectively.

The source comments instead say the mass channel is "sin of angle",
and BEDROCK BR-005 says θ₄=0 is vacuum relative to the time normal.
This formalization tests the internal projection translation ONLY.
It does not establish a physical mass law, prove the original author,
or infer which repair to adopt.
-/

namespace HsHVerification.EnheduannaAngleProjectionFidelity

def sourceX (θ : ℝ) : ℝ := Real.cos θ
def sourceW (θ : ℝ) : ℝ := Real.sin θ
def sourceMass (θ : ℝ) : ℝ := |sourceX θ|
def sourceHidden (θ : ℝ) : ℝ := |sourceW θ|

theorem zero_angle_source_basis :
    sourceX 0 = 1 ∧ sourceW 0 = 0 := by
  simp [sourceX, sourceW]

theorem zero_angle_source_channels :
    sourceMass 0 = 1 ∧ sourceHidden 0 = 0 := by
  simp [sourceMass, sourceHidden, sourceX, sourceW]

theorem zero_angle_mass_not_vacuum :
    sourceMass 0 ≠ 0 := by
  simp [sourceMass, sourceX]

theorem zero_angle_mass_not_source_comment_sine :
    sourceMass 0 ≠ |Real.sin (0 : ℝ)| := by
  simp [sourceMass, sourceX]

theorem no_same_function_if_zero_baselines_disagree
    (massFromTimeNormal : ℝ → ℝ)
    (hVacuum : massFromTimeNormal 0 = 0) :
    massFromTimeNormal ≠ sourceMass := by
  intro hEqual
  have hAtZero := congrArg (fun f : ℝ → ℝ => f 0) hEqual
  simp [hVacuum, sourceMass, sourceX] at hAtZero

#print axioms zero_angle_source_basis
#print axioms zero_angle_source_channels
#print axioms zero_angle_mass_not_vacuum
#print axioms zero_angle_mass_not_source_comment_sine
#print axioms no_same_function_if_zero_baselines_disagree

end HsHVerification.EnheduannaAngleProjectionFidelity
