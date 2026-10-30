import Mathlib

namespace HsHVerification.KestrelLevelSetSliceTangentV2

abbrev Vec4 := Fin 4 → ℝ

def pairing (n v : Vec4) : ℝ :=
  ∑ i : Fin 4, n i * v i

def intersectionTangent (n u v : Vec4) : Vec4 :=
  fun i => pairing n v * u i - pairing n u * v i

theorem intersection_tangent_is_level_set_tangent
    (n u v : Vec4) :
    pairing n (intersectionTangent n u v) = 0 := by
  let a : ℝ := pairing n v
  let b : ℝ := pairing n u
  change (∑ i : Fin 4, n i * (a * u i - b * v i)) = 0
  calc
    (∑ i : Fin 4, n i * (a * u i - b * v i))
        = ∑ i : Fin 4, (a * (n i * u i) - b * (n i * v i)) := by
            apply Finset.sum_congr rfl
            intro i hi
            ring
    _ = a * (∑ i : Fin 4, n i * u i) -
        b * (∑ i : Fin 4, n i * v i) := by
          rw [Finset.sum_sub_distrib, ← Finset.mul_sum, ← Finset.mul_sum]
    _ = a * b - b * a := by rfl
    _ = 0 := by ring

theorem intersection_tangent_swap_reverses_orientation
    (n u v : Vec4) :
    intersectionTangent n v u =
      fun i => -intersectionTangent n u v i := by
  funext i
  simp [intersectionTangent]

theorem intersection_tangent_rescaling
    (c : ℝ) (n u v : Vec4) :
    intersectionTangent (fun i => c * n i) u v =
      fun i => c * intersectionTangent n u v i := by
  funext i
  unfold intersectionTangent
  have hv : pairing (fun j => c * n j) v = c * pairing n v := by
    unfold pairing
    calc
      (∑ j : Fin 4, c * n j * v j)
          = ∑ j : Fin 4, c * (n j * v j) := by
              apply Finset.sum_congr rfl
              intro j hj
              ring
      _ = c * (∑ j : Fin 4, n j * v j) := by
            rw [Finset.mul_sum]
  have hu : pairing (fun j => c * n j) u = c * pairing n u := by
    unfold pairing
    calc
      (∑ j : Fin 4, c * n j * u j)
          = ∑ j : Fin 4, c * (n j * u j) := by
              apply Finset.sum_congr rfl
              intro j hj
              ring
      _ = c * (∑ j : Fin 4, n j * u j) := by
            rw [Finset.mul_sum]
  rw [hv, hu]
  ring

#print axioms intersection_tangent_is_level_set_tangent
#print axioms intersection_tangent_swap_reverses_orientation
#print axioms intersection_tangent_rescaling

end HsHVerification.KestrelLevelSetSliceTangentV2
