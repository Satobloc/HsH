import Mathlib

/-!
# Torus-contact loop swap and vector-sum limitation

This is a bounded formalization of an assistant-generated loop model from the
July 2026 "Mathematical Tool Exploration" conversation. It does not formalize
the complete user-described torus/sphere contact pair, its substrates, the
3D crossing sequence, or a physical model.

The source-faithful distinction is:
* the two contact curves are presented as different whole-system
  configurations on a torus;
* the historical assistant replaced those systems with two tangent circles
  in orthogonal 2-planes of R^4;
* this file checks only that reduced loop model and its endpoint maps.

No result here establishes that either loop map extends to a diffeomorphism or
ambient isotopy of the embedded torus/sphere pair.
-/

namespace HsHVerification.EnheduannaTorusContactSwap

abbrev Vec4 := Fin 4 → ℝ

/-- A unit circle tangent to the origin in the first coordinate 2-plane. -/
def circleA (θ : ℝ) : Vec4 :=
  fun i =>
    if i = 0 then Real.cos θ - 1
    else if i = 1 then Real.sin θ
    else 0

/-- A congruent unit circle tangent to the origin in the second coordinate 2-plane. -/
def circleB (θ : ℝ) : Vec4 :=
  fun i =>
    if i = 2 then Real.cos θ - 1
    else if i = 3 then Real.sin θ
    else 0

/-- Historical assistant's simultaneous quarter-turn in the (x,z) and (y,w)
coordinate planes. -/
def assistantDoubleQuarter (x : Vec4) : Vec4 :=
  fun i =>
    if i = 0 then -x 2
    else if i = 1 then -x 3
    else if i = 2 then x 0
    else x 1

/-- Correct block transposition of the two orthogonal 2-planes. -/
def blockSwap (x : Vec4) : Vec4 :=
  fun i =>
    if i = 0 then x 2
    else if i = 1 then x 3
    else if i = 2 then x 0
    else x 1

theorem assistantDoubleQuarter_maps_A_to_B (θ : ℝ) :
    assistantDoubleQuarter (circleA θ) = circleB θ := by
  funext i
  fin_cases i <;> simp [assistantDoubleQuarter, circleA, circleB]

theorem assistantDoubleQuarter_maps_B_to_neg_A (θ : ℝ) :
    assistantDoubleQuarter (circleB θ) = fun i => -circleA θ i := by
  funext i
  fin_cases i <;> simp [assistantDoubleQuarter, circleA, circleB]

/-- At θ = π the assistant's map sends B to the reflected circle, not A. -/
theorem assistantDoubleQuarter_not_exact_swap :
    assistantDoubleQuarter (circleB Real.pi) ≠ circleA Real.pi := by
  intro h
  have h0 := congrFun h 0
  norm_num [assistantDoubleQuarter, circleA, circleB] at h0

theorem blockSwap_maps_A_to_B (θ : ℝ) :
    blockSwap (circleA θ) = circleB θ := by
  funext i
  fin_cases i <;> simp [blockSwap, circleA, circleB]

theorem blockSwap_maps_B_to_A (θ : ℝ) :
    blockSwap (circleB θ) = circleA θ := by
  funext i
  fin_cases i <;> simp [blockSwap, circleA, circleB]

theorem blockSwap_involutive (x : Vec4) :
    blockSwap (blockSwap x) = x := by
  funext i
  fin_cases i <;> simp [blockSwap]

/-- Euclidean inner product on coordinate 4-space. -/
def dot4 (x y : Vec4) : ℝ :=
  x 0 * y 0 + x 1 * y 1 + x 2 * y 2 + x 3 * y 3

theorem blockSwap_preserves_dot (x y : Vec4) :
    dot4 (blockSwap x) (blockSwap y) = dot4 x y := by
  simp [dot4, blockSwap]
  ring

def add4 (x y : Vec4) : Vec4 := fun i => x i + y i

def normSq4 (x : Vec4) : ℝ := dot4 x x

theorem normSq4_add (x y : Vec4) :
    normSq4 (add4 x y) =
      normSq4 x + normSq4 y + 2 * dot4 x y := by
  simp [normSq4, dot4, add4]
  ring

/-- A quarter-turn in the first coordinate plane, fixing the third axis. -/
def rotateXY (x : Vec4) : Vec4 :=
  fun i =>
    if i = 0 then -x 1
    else if i = 1 then x 0
    else x i

/-- Two vectors with magnitudes 1 and 4 whose sum lies on the fixed third axis. -/
def v1 : Vec4 := fun i => if i = 0 then 1 else 0

def v2 : Vec4 :=
  fun i =>
    if i = 0 then -1
    else if i = 2 then Real.sqrt 15
    else 0

theorem v1_normSq : normSq4 v1 = 1 := by
  norm_num [normSq4, dot4, v1]

theorem v2_normSq : normSq4 v2 = 16 := by
  norm_num [normSq4, dot4, v2, Real.sq_sqrt]

/-- A nontrivial component rotation can leave the vector sum unchanged. -/
theorem rotateXY_fixes_sum :
    rotateXY (add4 v1 v2) = add4 v1 v2 := by
  funext i
  fin_cases i <;> simp [rotateXY, add4, v1, v2]

theorem rotateXY_changes_component :
    rotateXY v1 ≠ v1 := by
  intro h
  have h0 := congrFun h 0
  norm_num [rotateXY, v1] at h0

end HsHVerification.EnheduannaTorusContactSwap
