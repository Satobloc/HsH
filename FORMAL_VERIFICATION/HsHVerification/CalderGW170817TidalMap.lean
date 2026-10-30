import Mathlib

/-!
External reference formalization only.

Source: LIGO Scientific Collaboration and Virgo Collaboration,
"Properties of the binary neutron star merger GW170817",
Phys. Rev. X 9, 011001 (2019), DOI 10.1103/PhysRevX.9.011001.

The formulas below are the standard GR tidal-deformability readout used in that analysis.
They are NOT an H(s)H worldtube equation and do not validate a physical H(s)H premise.
-/

namespace HsHVerification.CalderGW170817TidalMap

noncomputable section

/-- Standard binary effective tidal deformability, with m₁ ≥ m₂ by convention. -/
def effectiveTidalLambda (m1 m2 lambda1 lambda2 : ℝ) : ℝ :=
  (16 / 13 : ℝ) *
    (((m1 + 12*m2) * m1^4 * lambda1 +
      (m2 + 12*m1) * m2^4 * lambda2) / (m1 + m2)^5)

/--
The effective tidal deformability is invariant under a common positive mass-frame
rescaling. This is the algebraic reason a common detector/source-frame redshift
factor cancels from q and \tilde{Λ}.
-/
theorem effective_tidal_lambda_common_mass_scaling
    (s m1 m2 l1 l2 : ℝ)
    (hs : s ≠ 0)
    (hm : m1 + m2 ≠ 0) :
    effectiveTidalLambda (s*m1) (s*m2) l1 l2 =
      effectiveTidalLambda m1 m2 l1 l2 := by
  unfold effectiveTidalLambda
  have hs5 : s^5 ≠ 0 := pow_ne_zero 5 hs
  have hm5 : (m1 + m2)^5 ≠ 0 := pow_ne_zero 5 hm
  field_simp [hs5, hm5]
  <;> ring

/-- Exchanging component labels and their associated tidal parameters changes nothing. -/
theorem effective_tidal_lambda_swap
    (m1 m2 l1 l2 : ℝ) :
    effectiveTidalLambda m1 m2 l1 l2 =
      effectiveTidalLambda m2 m1 l2 l1 := by
  unfold effectiveTidalLambda
  simp [add_comm, add_left_comm, add_assoc, mul_comm, mul_left_comm, mul_assoc]

/-- Equal masses and equal component deformabilities return that common value. -/
theorem effective_tidal_lambda_equal_mass_equal_response
    (m l : ℝ) (hm : m ≠ 0) :
    effectiveTidalLambda m m l l = l := by
  unfold effectiveTidalLambda
  field_simp [hm]
  <;> ring

/--
Standard single-star GR relation:
Λ = (2/3) k₂ [c² R / (G m)]⁵.
R is the GR areal radius in the stellar solution, not automatically an H(s)H
filament-core radius or worldtube cross-section.
-/
def componentTidalLambda (m R k2 c G : ℝ) : ℝ :=
  (2 / 3 : ℝ) * k2 * ((c^2 * R) / (G*m))^5

/--
If k₂ is unconstrained independently of R, the standard readout has a continuous
rescaling degeneracy: R ↦ tR and k₂ ↦ k₂/t⁵ leave Λ unchanged.
This is an identifiability theorem, not a claim that every such pair is realized
by a physical neutron-star equation of state.
-/
theorem component_tidal_lambda_love_radius_rescaling
    (m R k2 c G t : ℝ)
    (hden : G*m ≠ 0)
    (ht : t ≠ 0) :
    componentTidalLambda m (t*R) (k2/t^5) c G =
      componentTidalLambda m R k2 c G := by
  unfold componentTidalLambda
  have ht5 : t^5 ≠ 0 := pow_ne_zero 5 ht
  field_simp [hden, ht5]
  <;> ring

theorem distinct_positive_radius_love_pair
    (R k2 t : ℝ)
    (hR : 0 < R)
    (hk2 : 0 < k2)
    (ht : 0 < t)
    (ht1 : t ≠ 1) :
    (t*R, k2/t^5) ≠ (R,k2) ∧
    0 < t*R ∧ 0 < k2/t^5 := by
  have hRne : R ≠ 0 := ne_of_gt hR
  have htne : t ≠ 0 := ne_of_gt ht
  have hfirst : t*R ≠ R := by
    intro h
    have hzero : (t - 1) * R = 0 := by nlinarith [h]
    rcases mul_eq_zero.mp hzero with ht0 | hR0
    · exact ht1 (sub_eq_zero.mp ht0)
    · exact hRne hR0
  have hpair : (t*R, k2/t^5) ≠ (R,k2) := by
    intro h
    exact hfirst (congrArg Prod.fst h)
  constructor
  · exact hpair
  constructor
  · positivity
  · positivity

/-- Same standard GR observable, but two distinct positive (R,k₂) pairs. -/
theorem love_radius_map_not_injective_under_free_k2
    (m R k2 c G t : ℝ)
    (hden : G*m ≠ 0)
    (hR : 0 < R)
    (hk2 : 0 < k2)
    (ht : 0 < t)
    (ht1 : t ≠ 1) :
    componentTidalLambda m (t*R) (k2/t^5) c G =
      componentTidalLambda m R k2 c G ∧
    (t*R,k2/t^5) ≠ (R,k2) := by
  have htne : t ≠ 0 := ne_of_gt ht
  have hpair := distinct_positive_radius_love_pair R k2 t hR hk2 ht ht1
  exact ⟨component_tidal_lambda_love_radius_rescaling m R k2 c G t hden htne,
    hpair.1⟩

end HsHVerification.CalderGW170817TidalMap
