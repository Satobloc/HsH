import Mathlib

/-!
# Kestrel: local tangent to a worldsheet/timesheet intersection

Source boundary:
- Nathan Direct: Ravel raw conversation, role-verified messages
  8471543a-6ed1-4743-9073-74735f019da4 and
  3d0ad680-51db-4c79-ad4a-9bbacada24ef (2026-09-07), as preserved in
  WORKSPACES/COMMON/verified_batches/2026-09-13-RAVEL-SPRING-WORLDTUBE-04.md
  and -05.md. These establish a 4D worldtube / spatial Kerr section and a
  3D timesheet/surface-of-simultaneity distinction, but do NOT define this
  current or a 2D worldsheet.
- The 2D worldsheet bivector current is an assistant-generated Blockwave
  reconstruction, not Nathan Direct.
- This file formalizes only the finite-dimensional local tangent algebra.
  It does not formalize delta-distribution restriction, integration currents,
  support, coarea, boundaries, charge, Maxwell coupling, or H(s)H physics.
-/

namespace HsHVerification.KestrelLevelSetSliceTangent

abbrev Vec4 := Fin 4 → ℝ

/-- Component pairing with a covector in a chosen coordinate frame. -/
def pairing (n v : Vec4) : ℝ :=
  ∑ i : Fin 4, n i * v i

/-- Local oriented tangent generator for the intersection of a parametrized
2-surface with a level-set hypersurface. If u = ∂ₛX, v = ∂ₜX,
n = dφ, then this is (n·v)u - (n·u)v. -/
def intersectionTangent (n u v : Vec4) : Vec4 :=
  fun i => pairing n v * u i - pairing n u * v i

/-- The local intersection generator is tangent to the level set:
its pairing with the defining covector vanishes. -/
theorem intersection_tangent_is_level_set_tangent
    (n u v : Vec4) :
    pairing n (intersectionTangent n u v) = 0 := by
  let a : ℝ := pairing n v
  let b : ℝ := pairing n u
  change (∑ i : Fin 4, n i * (a * u i - b * v i)) = 0
  calc
    (∑ i : Fin 4, n i * (a * u i - b * v i))
        = a * (∑ i : Fin 4, n i * u i) -
          b * (∑ i : Fin 4, n i * v i) := by
            rw [Finset.sum_sub_distrib]
            congr 1
            · calc
                (∑ i : Fin 4, n i * (a * u i))
                    = ∑ i : Fin 4, a * (n i * u i) := by
                        apply Finset.sum_congr rfl
                        intro i hi
                        ring
                _ = a * (∑ i : Fin 4, n i * u i) := by
                        rw [Finset.mul_sum]
            · calc
                (∑ i : Fin 4, n i * (b * v i))
                    = ∑ i : Fin 4, b * (n i * v i) := by
                        apply Finset.sum_congr rfl
                        intro i hi
                        ring
                _ = b * (∑ i : Fin 4, n i * v i) := by
                        rw [Finset.mul_sum]
    _ = a * b - b * a := by rfl
    _ = 0 := by ring

/-- Swapping the two surface parameters reverses the induced intersection
orientation. -/
theorem intersection_tangent_swap_reverses_orientation
    (n u v : Vec4) :
    intersectionTangent n v u =
      fun i => -intersectionTangent n u v i := by
  funext i
  simp [intersectionTangent]
  ring

/-- Rescaling the defining covector rescales the tangent generator by the
same factor. For nonzero scale the unoriented tangent line is unchanged,
but the current normalization is not fixed by this algebra. -/
theorem intersection_tangent_rescaling
    (c : ℝ) (n u v : Vec4) :
    intersectionTangent (fun i => c * n i) u v =
      fun i => c * intersectionTangent n u v i := by
  funext i
  simp [intersectionTangent, pairing, Finset.mul_sum]
  ring

#print axioms intersection_tangent_is_level_set_tangent
#print axioms intersection_tangent_swap_reverses_orientation
#print axioms intersection_tangent_rescaling

end HsHVerification.KestrelLevelSetSliceTangent
