import Mathlib

namespace HsHVerification

/-- The radicand appearing in the published Kelvin/Rankine dispersion definition
    beta = k * sqrt(4 * Omega0^2 / tildeOmega^2 - 1). -/
noncomputable def kelvinBetaRadicand (omega0 tildeOmega : ℝ) : ℝ :=
  4 * omega0 ^ 2 / tildeOmega ^ 2 - 1

/-- Necessary real-beta domain: positive rotation, nonzero shifted frequency,
    and a nonnegative square-root radicand. This is not the full Bessel-function
    domain of the displayed dispersion equation. -/
noncomputable def kelvinRealBetaDomain (omega0 tildeOmega : ℝ) : Prop :=
  0 < omega0 ∧ tildeOmega ≠ 0 ∧ 0 ≤ kelvinBetaRadicand omega0 tildeOmega

/-- For positive Omega0 and nonzero shifted frequency, the real-beta condition
    is exactly the squared-frequency bound tildeOmega^2 <= 4 * Omega0^2. -/
theorem kelvinRealBetaDomain_iff_squared_bound
    (omega0 tildeOmega : ℝ) :
    kelvinRealBetaDomain omega0 tildeOmega ↔
      0 < omega0 ∧ tildeOmega ≠ 0 ∧ tildeOmega ^ 2 ≤ 4 * omega0 ^ 2 := by
  constructor
  · rintro ⟨hOmega, hTilde, hRadicand⟩
    have hTildeSq : 0 < tildeOmega ^ 2 := sq_pos_of_ne_zero hTilde
    have hRatio : 1 ≤ 4 * omega0 ^ 2 / tildeOmega ^ 2 := by
      dsimp [kelvinBetaRadicand] at hRadicand
      linarith
    have hProduct :
        1 * tildeOmega ^ 2 ≤ 4 * omega0 ^ 2 :=
      (le_div_iff₀ hTildeSq).mp hRatio
    exact ⟨hOmega, hTilde, by nlinarith⟩
  · rintro ⟨hOmega, hTilde, hSquared⟩
    have hTildeSq : 0 < tildeOmega ^ 2 := sq_pos_of_ne_zero hTilde
    have hRatio : 1 ≤ 4 * omega0 ^ 2 / tildeOmega ^ 2 :=
      (le_div_iff₀ hTildeSq).2 (by nlinarith)
    refine ⟨hOmega, hTilde, ?_⟩
    dsimp [kelvinBetaRadicand]
    linarith

/-- Necessary scalar-domain conditions for direct evaluation of the printed
    m=2 equation: the beta square root is real, the explicit 1/omega term is
    defined, and the rational prefactor denominator is nonzero.

    This intentionally does not encode the Bessel denominators, root selection,
    or any limiting/analytic-continuation extension. -/
noncomputable def kelvinM2DisplayedScalarDomain
    (omega0 omega tildeOmega : ℝ) : Prop :=
  kelvinRealBetaDomain omega0 tildeOmega ∧
    omega ≠ 0 ∧
    4 * omega0 ^ 2 - omega ^ 2 ≠ 0

/-- The displayed m=2 formula cannot be evaluated by direct substitution at
    omega=0 because its explicit 2*Omega0*m/omega term is undefined there. -/
theorem kelvinM2DisplayedScalarDomain_excludes_zero_frequency
    (omega0 tildeOmega : ℝ) :
    ¬ kelvinM2DisplayedScalarDomain omega0 0 tildeOmega := by
  intro h
  exact h.2.1 rfl

/-- A scalar-domain witness also certifies the separate rational prefactor
    denominator is nonzero. -/
theorem kelvinM2DisplayedScalarDomain_prefactor_ne
    (omega0 omega tildeOmega : ℝ)
    (h : kelvinM2DisplayedScalarDomain omega0 omega tildeOmega) :
    4 * omega0 ^ 2 - omega ^ 2 ≠ 0 :=
  h.2.2

/-- Exact-rational smoke classifier for the scalar-domain contract.
    These dimensionless witnesses are logic tests, not physical fixtures. -/
def kelvinM2ScalarDomainQ
    (omega0 omega tildeOmega : ℚ) : Bool :=
  decide
    (0 < omega0 ∧
      tildeOmega ≠ 0 ∧
      tildeOmega ^ 2 ≤ 4 * omega0 ^ 2 ∧
      omega ≠ 0 ∧
      4 * omega0 ^ 2 - omega ^ 2 ≠ 0)

#eval kelvinM2ScalarDomainQ 1 1 1
#eval kelvinM2ScalarDomainQ 1 0 1
#eval kelvinM2ScalarDomainQ 1 2 1
#eval kelvinM2ScalarDomainQ 1 1 3

#print axioms kelvinRealBetaDomain_iff_squared_bound
#print axioms kelvinM2DisplayedScalarDomain_excludes_zero_frequency
#print axioms kelvinM2DisplayedScalarDomain_prefactor_ne

end HsHVerification
