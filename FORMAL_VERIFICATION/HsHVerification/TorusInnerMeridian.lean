import Mathlib

namespace HsHVerification.TorusInnerMeridian

/-- A point of the unit circle, represented by its two real coordinates. -/
structure UnitCirclePoint where
  x : ℝ
  y : ℝ
  norm_sq : x ^ 2 + y ^ 2 = 1

@[ext] theorem UnitCirclePoint.ext (a b : UnitCirclePoint)
    (hx : a.x = b.x) (hy : a.y = b.y) : a = b := by
  cases a with
  | mk ax ay ha =>
    cases b with
    | mk bx by hb =>
      simp_all

/-- The inward radial direction of the meridian parameter. -/
def innerDirection : UnitCirclePoint := ⟨-1, 0, by norm_num⟩

/-- Standard ring-torus parameterization using two unit-circle parameters.
The first parameter selects a meridian; the second runs around that meridian. -/
def torusPoint (R r : ℝ) (u v : UnitCirclePoint) : ℝ × ℝ × ℝ :=
  ((R + r * v.x) * u.x, (R + r * v.x) * u.y, r * v.y)

/-- On a nondegenerate ring torus (R > r > 0), a fixed meridian meets the
inner longitude in exactly one parameter pair. The meridian parameter is the
inward direction (-1,0), and the longitude parameter equals the fixed
meridian label.

This is a coordinate-level theorem about the stated Euclidean parameterization.
It does not identify either parameter with a physical CTC or CSC. -/
theorem meridian_inner_longitude_intersection_unique
    (R r : ℝ) (hR : R > r) (hr : 0 < r)
    (u0 u v : UnitCirclePoint)
    (h : torusPoint R r u0 v = torusPoint R r u innerDirection) :
    u = u0 ∧ v = innerDirection := by
  have hx : (R + r * v.x) * u0.x = (R - r) * u.x := by
    simpa [torusPoint, innerDirection] using congrArg Prod.fst h
  have hy : (R + r * v.x) * u0.y = (R - r) * u.y := by
    simpa [torusPoint, innerDirection] using
      congrArg (fun p : ℝ × ℝ × ℝ => p.2.1) h
  have hz : r * v.y = 0 := by
    simpa [torusPoint, innerDirection] using
      congrArg (fun p : ℝ × ℝ × ℝ => p.2.2) h
  have hvy : v.y = 0 := by
    exact (mul_eq_zero.mp hz).resolve_left (ne_of_gt hr)
  have hvx_sq : v.x ^ 2 = 1 := by
    nlinarith [v.norm_sq, hvy]
  have hrad : (R + r * v.x) ^ 2 = (R - r) ^ 2 := by
    calc
      (R + r * v.x) ^ 2
          = (R + r * v.x) ^ 2 * (u0.x ^ 2 + u0.y ^ 2) := by
              rw [u0.norm_sq]
              ring
      _ = ((R + r * v.x) * u0.x) ^ 2
            + ((R + r * v.x) * u0.y) ^ 2 := by ring
      _ = ((R - r) * u.x) ^ 2 + ((R - r) * u.y) ^ 2 := by
            rw [hx, hy]
      _ = (R - r) ^ 2 * (u.x ^ 2 + u.y ^ 2) := by ring
      _ = (R - r) ^ 2 := by
            rw [u.norm_sq]
            ring
  have hvx_cases : v.x = 1 ∨ v.x = -1 := by
    have hprod : (v.x - 1) * (v.x + 1) = 0 := by
      nlinarith [hvx_sq]
    rcases mul_eq_zero.mp hprod with h1 | h2
    · left
      linarith
    · right
      linarith
  have hRpos : 0 < R := lt_trans hr hR
  have hprodpos : 0 < R * r := mul_pos hRpos hr
  have hvx_ne_one : v.x ≠ 1 := by
    intro hvx1
    rw [hvx1] at hrad
    nlinarith [hrad, hprodpos]
  have hvx : v.x = -1 := by
    rcases hvx_cases with h1 | h2
    · exact (hvx_ne_one h1).elim
    · exact h2
  have hv : v = innerDirection :=
    UnitCirclePoint.ext v innerDirection hvx hvy
  have hscale : R - r ≠ 0 := ne_of_gt (sub_pos.mpr hR)
  have hu_x : u0.x = u.x := by
    have h' : (R - r) * u0.x = (R - r) * u.x := by
      simpa [hvx] using hx
    exact mul_left_cancel₀ hscale h'
  have hu_y : u0.y = u.y := by
    have h' : (R - r) * u0.y = (R - r) * u.y := by
      simpa [hvx] using hy
    exact mul_left_cancel₀ hscale h'
  have hu : u = u0 :=
    UnitCirclePoint.ext u u0 hu_x.symm hu_y.symm
  exact ⟨hu, hv⟩

#print axioms meridian_inner_longitude_intersection_unique

end HsHVerification.TorusInnerMeridian
