import Mathlib

/-!
External-reference formalization only.

Primary source: LIGO Scientific Collaboration and Virgo Collaboration,
"Properties of the Binary Neutron Star Merger GW170817",
Phys. Rev. X 9, 011001 (2019), DOI 10.1103/PhysRevX.9.011001.

The binary effective-deformability projection and single-star Love-number
relation below are standard GR/relativistic-stellar-structure readout maps.
They are NOT H(s)H worldtube equations and do not validate an H(s)H premise.

The explicit composite map is included to expose exactly what must be supplied
by a geometric model: a map from its worldtube variables to areal radius and
Love response, or a direct waveform observable.  If k₂ is free, the inverse
worldtube-radius map is non-injective.  If an EOS or another constitutive law
fixes k₂ as a function of mass and radius, that degeneracy can be removed;
that relation must be stated and independently tested.
-/

namespace HsHVerification.CalderGW170817TidalMap

noncomputable section

/-- Standard binary effective tidal deformability, with m₁ ≥ m₂ by convention. -/
def effectiveTidalLambda (m1 m2 lambda1 lambda2 : ℝ) : ℝ :=
  (16 / 13 : ℝ) *
    (((m1 + 12*m2) * m1^4 * lambda1 +
      (m2 + 12*m1) * m2^4 * lambda2) / (m1 + m2)^5)

/--
The effective tidal deformability is invariant under a common nonzero mass-frame
rescaling.  This is the algebraic reason a common detector/source-frame redshift
factor cancels from q and \tilde{Λ}; it is not a new measurement.
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
  ring

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
With k₂ unconstrained independently of R, the standard readout has a continuous
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

/--
With k₂ fixed, the same standard relation scales as R⁵.  This is the
conditional forward map that becomes available once a constitutive/EOS relation
fixes k₂ rather than allowing it to vary independently.
-/
theorem component_tidal_lambda_fixed_k2_scales_as_t5
    (m R k2 c G t : ℝ)
    (hden : G*m ≠ 0) :
    componentTidalLambda m (t*R) k2 c G =
      t^5 * componentTidalLambda m R k2 c G := by
  unfold componentTidalLambda
  field_simp [hden]
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

/-- The single-star (R,k₂) -> Λ map is non-injective when k₂ is free. -/
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

/--
Explicit composition of two single-star readout maps with the binary
mass-weighted projection.  Each input pair is (areal radius, Love number).
-/
def binaryWorldtubeReadout
    (m1 m2 : ℝ) (star1 star2 : ℝ × ℝ) (c G : ℝ) : ℝ :=
  effectiveTidalLambda m1 m2
    (componentTidalLambda m1 star1.1 star1.2 c G)
    (componentTidalLambda m2 star2.1 star2.2 c G)

/--
The composed binary readout is unchanged when the first star's radius and
unconstrained Love number are rescaled together.  This is the explicit
worldtube-variable -> component-Λ -> binary-\tilde{Λ} non-identifiability map.
-/
theorem binary_readout_invariant_under_primary_R_k2_rescaling
    (m1 m2 R1 k21 R2 k22 c G t : ℝ)
    (hden : G*m1 ≠ 0)
    (ht : t ≠ 0) :
    binaryWorldtubeReadout m1 m2 (t*R1,k21/t^5) (R2,k22) c G =
      binaryWorldtubeReadout m1 m2 (R1,k21) (R2,k22) c G := by
  unfold binaryWorldtubeReadout
  rw [component_tidal_lambda_love_radius_rescaling m1 R1 k21 c G t hden ht]

/--
For positive radii/Love numbers and any positive t ≠ 1, the composed binary
readout has distinct positive worldtube-variable inputs with exactly the same
observable.  The theorem is conditional on the standard GR readout and free k₂;
it is not an H(s)H physical counterexample.
-/
theorem binary_readout_noninjective_under_free_k2
    (m1 m2 R1 k21 R2 k22 c G t : ℝ)
    (hden : G*m1 ≠ 0)
    (hR1 : 0 < R1)
    (hk21 : 0 < k21)
    (hR2 : 0 < R2)
    (hk22 : 0 < k22)
    (ht : 0 < t)
    (ht1 : t ≠ 1) :
    binaryWorldtubeReadout m1 m2 (t*R1,k21/t^5) (R2,k22) c G =
      binaryWorldtubeReadout m1 m2 (R1,k21) (R2,k22) c G ∧
    ((t*R1,k21/t^5),(R2,k22)) ≠ ((R1,k21),(R2,k22)) ∧
    0 < t*R1 ∧ 0 < k21/t^5 := by
  have hpair := distinct_positive_radius_love_pair R1 k21 t hR1 hk21 ht ht1
  constructor
  · exact binary_readout_invariant_under_primary_R_k2_rescaling
      m1 m2 R1 k21 R2 k22 c G t hden (ne_of_gt ht)
  constructor
  · intro h
    have hfirst : t*R1 = R1 :=
      congrArg Prod.fst (congrArg Prod.fst h)
    have hzero : (t - 1) * R1 = 0 := by nlinarith [hfirst]
    rcases mul_eq_zero.mp hzero with ht0 | hR0
    · exact ht1 (sub_eq_zero.mp ht0)
    · exact (ne_of_gt hR1) hR0
  · exact ⟨hpair.2.1, hpair.2.2⟩

#print axioms effective_tidal_lambda_common_mass_scaling
#print axioms effective_tidal_lambda_swap
#print axioms effective_tidal_lambda_equal_mass_equal_response
#print axioms component_tidal_lambda_love_radius_rescaling
#print axioms component_tidal_lambda_fixed_k2_scales_as_t5
#print axioms distinct_positive_radius_love_pair
#print axioms love_radius_map_not_injective_under_free_k2
#print axioms binary_readout_invariant_under_primary_R_k2_rescaling
#print axioms binary_readout_noninjective_under_free_k2

end
end HsHVerification.CalderGW170817TidalMap
