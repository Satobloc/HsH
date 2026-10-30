import Mathlib

namespace HsHVerification.LoomProjectionAngle

/-!
A coordinate-level formalization of orthogonal projection from Euclidean R⁴
onto the spatial hyperplane w = 0.

This is a mathematical proof vehicle, not a physical model or measured fixture.
The fourth coordinate is called w only to match the historical source notation.
-/

structure Vec4 where
  x : ℝ
  y : ℝ
  z : ℝ
  w : ℝ
deriving DecidableEq, Repr

def zeroVec : Vec4 := ⟨0, 0, 0, 0⟩

def fourthAxis : Vec4 := ⟨0, 0, 0, 1⟩

def spatialProjection (v : Vec4) : Vec4 :=
  ⟨v.x, v.y, v.z, 0⟩

def normSq4 (v : Vec4) : ℝ :=
  v.x ^ 2 + v.y ^ 2 + v.z ^ 2 + v.w ^ 2

def tiltedFromFourthAxis (δ : ℝ) : Vec4 :=
  ⟨Real.sin δ, 0, 0, Real.cos δ⟩

/-- The exact fourth coordinate axis has zero projection onto w = 0. -/
theorem fourth_axis_projects_to_zero :
    spatialProjection fourthAxis = zeroVec := by
  rfl

/-- The squared norm of the spatial projection discards only the w component. -/
theorem spatial_projection_pythagorean_decomposition (v : Vec4) :
    normSq4 v = normSq4 (spatialProjection v) + v.w ^ 2 := by
  simp [normSq4, spatialProjection]
  ring

/-- The canonical vector tilted by δ away from the fourth axis is unit. -/
theorem tilted_vector_is_unit (δ : ℝ) :
    normSq4 (tiltedFromFourthAxis δ) = 1 := by
  simp [normSq4, tiltedFromFourthAxis]
  nlinarith [Real.sin_sq_add_cos_sq δ]

/-- Its squared spatial projection is sin² δ, not sin² of its angle to the subspace. -/
theorem tilted_spatial_projection_squared (δ : ℝ) :
    normSq4 (spatialProjection (tiltedFromFourthAxis δ)) =
      Real.sin δ ^ 2 := by
  rfl

/-- The squared spatial and normal components partition the unit norm. -/
theorem tilted_component_partition (δ : ℝ) :
    normSq4 (spatialProjection (tiltedFromFourthAxis δ)) +
      (tiltedFromFourthAxis δ).w ^ 2 = 1 := by
  calc
    normSq4 (spatialProjection (tiltedFromFourthAxis δ)) +
        (tiltedFromFourthAxis δ).w ^ 2
      = normSq4 (tiltedFromFourthAxis δ) := by
          symm
          exact spatial_projection_pythagorean_decomposition
            (tiltedFromFourthAxis δ)
    _ = 1 := tilted_vector_is_unit δ

/-- Coherent accumulation adds the angle before applying cos². -/
def coherentAccumulation (n : ℕ) (δ : ℝ) : ℝ :=
  Real.cos ((n : ℝ) * δ) ^ 2

/-- Independent per-step survival multiplies the one-step cos² factors. -/
def independentAccumulation (n : ℕ) (δ : ℝ) : ℝ :=
  Real.cos δ ^ (2 * n)

/--
These are different mathematical models: accumulated angle then cos²
is not generally the same as multiplying n independent cos² factors.
This exact counterexample is mathematical only, not a physical crossing model.
-/
theorem coherent_and_independent_accumulation_differ :
    coherentAccumulation 2 (Real.pi / 2) ≠
      independentAccumulation 2 (Real.pi / 2) := by
  change Real.cos ((2 : ℝ) * (Real.pi / 2)) ^ 2 ≠
    Real.cos (Real.pi / 2) ^ (2 * 2)
  rw [show (2 : ℝ) * (Real.pi / 2) = Real.pi by ring,
    Real.cos_pi, Real.cos_pi_div_two]
  norm_num

#print axioms coherent_and_independent_accumulation_differ

#print axioms fourth_axis_projects_to_zero
#print axioms spatial_projection_pythagorean_decomposition
#print axioms tilted_vector_is_unit
#print axioms tilted_spatial_projection_squared
#print axioms tilted_component_partition

end HsHVerification.LoomProjectionAngle
