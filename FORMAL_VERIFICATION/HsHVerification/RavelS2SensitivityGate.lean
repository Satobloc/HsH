import Mathlib

/-!
# S2 fitted-orbit Euclidean comparator: source-conditional sensitivity algebra

Physical anchor: S2 around Sgr A*, GRAVITY Collaboration (2020),
A&A 636 L5, Table E.1, DOI 10.1051/0004-6361/202037813.
The dimensionless q = v_peri^2/c^2 is derived from the published
JOINT FIT, not an independent prediction or free physical fixture.

These theorems check the algebraic expressions for the logarithmic
mass and physical-semimajor-axis sensitivities of
kappa = (GM/r_peri^2)/(c^2+v_peri^2), at alpha=1 in an ASSUMED
Euclidean R4 marked lift. They do NOT formalize the derivatives,
fit covariance, data validity, physical worldtube, or detector map.
The expression itself is an assistant reconstruction, not an original
SAT-O equation or an adopted H(s)H metric.
-/

namespace HsHVerification.RavelS2SensitivityGate

noncomputable def massElasticity (q : ℝ) : ℝ := 1 / (1 + q)
noncomputable def scaleElasticity (q : ℝ) : ℝ := -(2 + q) / (1 + q)

/-- The two source-conditional elasticities sum to -1. -/
theorem mass_scale_balance (q : ℝ) (hq : 0 ≤ q) :
    massElasticity q + scaleElasticity q = -1 := by
  have hden : 1 + q ≠ 0 := by linarith
  unfold massElasticity scaleElasticity
  field_simp
  ring

/-- The mass elasticity is positive and no greater than one. -/
theorem mass_elasticity_bounds (q : ℝ) (hq : 0 ≤ q) :
    0 < massElasticity q ∧ massElasticity q ≤ 1 := by
  have hden : 0 < 1 + q := by linarith
  constructor
  · unfold massElasticity
    exact div_pos (by norm_num : (0 : ℝ) < 1) hden
  · unfold massElasticity
    apply (div_le_iff₀ hden).2
    nlinarith

/-- The physical-scale elasticity lies in [-2,-1]. -/
theorem scale_elasticity_bounds (q : ℝ) (hq : 0 ≤ q) :
    -2 ≤ scaleElasticity q ∧ scaleElasticity q ≤ -1 := by
  have hden : 0 < 1 + q := by linarith
  unfold scaleElasticity
  constructor
  · apply (le_div_iff₀ hden).2
    nlinarith
  · apply (div_le_iff₀ hden).2
    nlinarith

/-- The comparator sees angular semimajor axis and distance only through
their product. This is an identifiability limitation of this scalar map,
not proof that those measured parameters are physically interchangeable. -/
noncomputable def markedKappa (gm ang dist ecc c : ℝ) : ℝ :=
  (gm / ((ang * dist * (1 - ecc))^2)) /
    (c^2 + gm * (1 + ecc) / (ang * dist * (1 - ecc)))

theorem angular_distance_product_degeneracy
    (gm a₁ a₂ r₁ r₂ ecc c : ℝ)
    (hproduct : a₁ * r₁ = a₂ * r₂) :
    markedKappa gm a₁ r₁ ecc c = markedKappa gm a₂ r₂ ecc c := by
  unfold markedKappa
  rw [hproduct]

#print axioms mass_scale_balance
#print axioms mass_elasticity_bounds
#print axioms scale_elasticity_bounds
#print axioms angular_distance_product_degeneracy

end HsHVerification.RavelS2SensitivityGate
