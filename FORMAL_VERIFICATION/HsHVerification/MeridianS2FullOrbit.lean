import Mathlib

/-!
Meridian measured S2 apsidal geometry, 2026-10-28.
Anchor: GRAVITY Collaboration 2020 A&A 636 L5 Table E.1,
a=125.058(41) mas, e=0.884649(66), M=4.261(12) million
solar masses, R0=8246.7(9.3) pc. DOI 10.1051/0004-6361/202037813.
The statements are conditional rational identities, not orbital dynamics,
a derivation of measured parameters, or a physical H(s)H model.
-/

namespace HsHVerification.MeridianS2FullOrbit

def periRadius (a e : ℝ) : ℝ := a * (1 - e)
def apoRadius (a e : ℝ) : ℝ := a * (1 + e)

noncomputable def apsisCurvature (mu r c v : ℝ) : ℝ :=
  mu / (r ^ 2 * (c ^ 2 + v ^ 2))

theorem apsidal_radii_sum (a e : ℝ) :
    periRadius a e + apoRadius a e = 2 * a := by
  unfold periRadius apoRadius
  ring

theorem apsidal_radii_difference (a e : ℝ) :
    apoRadius a e - periRadius a e = 2 * a * e := by
  unfold periRadius apoRadius
  ring

theorem eccentricity_from_apsidal_radii (a e : ℝ) (ha : a ≠ 0) :
    (apoRadius a e - periRadius a e) /
      (apoRadius a e + periRadius a e) = e := by
  have hsum : apoRadius a e + periRadius a e = 2 * a := by
    calc
      apoRadius a e + periRadius a e = periRadius a e + apoRadius a e := by ring
      _ = 2 * a := apsidal_radii_sum a e
  rw [apsidal_radii_difference, hsum]
  field_simp [ha]
  all_goals ring

theorem curvature_forward_inverse (mu r c v : ℝ)
    (hr : r ≠ 0) (hcv : c ^ 2 + v ^ 2 ≠ 0) :
    apsisCurvature mu r c v * (r ^ 2 * (c ^ 2 + v ^ 2)) = mu := by
  unfold apsisCurvature
  field_simp [hr, hcv]

#print axioms apsidal_radii_sum
#print axioms apsidal_radii_difference
#print axioms eccentricity_from_apsidal_radii
#print axioms curvature_forward_inverse

end HsHVerification.MeridianS2FullOrbit
