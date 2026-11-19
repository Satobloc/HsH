import Mathlib

/-!
# Meridian S2 marked-worldline geometry | 2026-10-27

Physical anchor: GRAVITY Collaboration, A&A 636 L5 (2020), S2 orbit
Table 1: M=4.261(12) million nominal solar masses, a=125.058(41) mas,
e=0.884649(66), R0=8246.7(9.3) pc.
DOI: 10.1051/0004-6361/202037813.

Conditional mathematical statements only. The correspondence between
measured S2 orbital motion, Newtonian acceleration, the fixed affine
Euclidean R4 lift X(w)=(x(w),w) with w=ct, and any H(s)H material tube
requires separate physical/observational justification. At pericenter
v dot a=0 and the Euclidean extrinsic curvature reduces to
(a_phys/c^2)/(1+(v_phys/c)^2) = a_phys/(c^2+v_phys^2).
The Lean parameters 'acc', 'c', and 'v' use physical SI acceleration
(m/s^2) and speeds (m/s); mu/r^2 has acceleration units. The native
R4 derivatives with respect to w=ct are separately normalized by c.
-/

namespace HsHVerification.MeridianS2Geometry

noncomputable def curvatureFromAcceleration (acc c v : ℝ) : ℝ :=
  acc / (c^2 + v^2)

noncomputable def curvatureFromMass (mu r c v : ℝ) : ℝ :=
  mu / (r^2 * (c^2 + v^2))

theorem geometry_to_force (mu r c v : ℝ)
    (hr : r ≠ 0) (hcv : c^2 + v^2 ≠ 0) :
    curvatureFromAcceleration (mu / r^2) c v =
      curvatureFromMass mu r c v := by
  unfold curvatureFromAcceleration curvatureFromMass
  field_simp [hr, hcv]

theorem force_from_geometry (acc c v : ℝ)
    (hcv : c^2 + v^2 ≠ 0) :
    curvatureFromAcceleration acc c v * (c^2 + v^2) = acc := by
  unfold curvatureFromAcceleration
  field_simp [hcv]

theorem mass_from_geometry (mu r c v : ℝ)
    (hr : r ≠ 0) (hcv : c^2 + v^2 ≠ 0) :
    curvatureFromMass mu r c v * r^2 * (c^2 + v^2) = mu := by
  unfold curvatureFromMass
  field_simp [hr, hcv]

#print axioms geometry_to_force
#print axioms force_from_geometry
#print axioms mass_from_geometry

end HsHVerification.MeridianS2Geometry
