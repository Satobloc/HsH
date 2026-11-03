import Mathlib

/-!
# Helion Rosenbluth readout: algebraic identifiability gate

Source: A. Camsonne et al., *Phys. Rev. Lett.* 119, 162501 (2017),
arXiv:1610.07456, the published structure-function and reduced-cross-section
relations.

Here `tauQ` is the dimensionless quantity built from the paper's effective
momentum transfer, `Q²_eff/(4 M²)`. `epsilonPol` is the virtual-photon
polarization parameter. It is deliberately not named `epsilon`, which is
already used for HsH/SAT core thickness. `camsonneB` is source-qualified and
is not the project-level `B` symbol.

This file formalizes only the algebraic measurement map:
* the source structure functions determine the squared charge and magnetic
  form factors when tauQ > 0 and mu ≠ 0;
* one Rosenbluth setting leaves a nontrivial positive fiber;
* two distinct polarization settings identify the two squared form factors;
* the cross section does not identify their signs.

No HsH constitutive map, fit, physical prediction, covariance analysis, or
empirical validation is asserted. The proof is about the published standard
readout, not a derivation of that readout from HsH geometry.
-/

namespace HsHVerification.HelionRosenbluthIdentifiability

/-- Source structure function A(Q²), expressed in squared form factors. -/
def camsonneA (tauQ mu fcSq fmSq : ℝ) : ℝ :=
  (fcSq + mu^2 * tauQ * fmSq) / (1 + tauQ)

/-- Source structure function B(Q²), qualified to avoid the HsH symbol B. -/
def camsonneB (tauQ mu fmSq : ℝ) : ℝ :=
  2 * tauQ * mu^2 * fmSq

/-- Rosenbluth abscissa x = mu² tau / epsilon_pol. -/
def rosenbluthX (tauQ mu epsilonPol : ℝ) : ℝ :=
  mu^2 * tauQ / epsilonPol

/-- Reduced cross section as an affine function of the squared form factors. -/
def reducedSigmaSq (fcSq fmSq x : ℝ) : ℝ :=
  fcSq + x * fmSq

/-- A and B recover the squared charge form factor. -/
theorem camsonneA_recovers_charge_square
    (tauQ mu fcSq fmSq : ℝ) (htau : 0 < tauQ) :
    (1 + tauQ) * camsonneA tauQ mu fcSq fmSq
      - camsonneB tauQ mu fmSq / 2 = fcSq := by
  unfold camsonneA camsonneB
  have hden : 1 + tauQ ≠ 0 := by linarith
  field_simp [hden]
  ring

/-- B recovers the squared magnetic form factor for nonzero magnetic moment. -/
theorem camsonneB_recovers_magnetic_square
    (tauQ mu fmSq : ℝ) (htau : 0 < tauQ) (hmu : mu ≠ 0) :
    camsonneB tauQ mu fmSq / (2 * tauQ * mu^2) = fmSq := by
  unfold camsonneB
  have hden : 2 * tauQ * mu^2 ≠ 0 := by positivity
  field_simp [hden]
  ring

/-- Determinant of the source (A,B) map is nonzero on the physical domain. -/
theorem camsonneAB_determinant_ne_zero
    (tauQ mu : ℝ) (htau : 0 < tauQ) (hmu : mu ≠ 0) :
    (2 * tauQ * mu^2) / (1 + tauQ) ≠ 0 := by
  apply div_ne_zero
  · positivity
  · linarith

/-- At fixed positive tau and nonzero mu, distinct positive epsilons give
    distinct Rosenbluth abscissae. -/
theorem distinct_epsilon_gives_distinct_x
    (tauQ mu epsilon1 epsilon2 : ℝ)
    (htau : 0 < tauQ) (hmu : mu ≠ 0)
    (he1 : 0 < epsilon1) (he2 : 0 < epsilon2)
    (he : epsilon1 ≠ epsilon2) :
    rosenbluthX tauQ mu epsilon1 ≠ rosenbluthX tauQ mu epsilon2 := by
  unfold rosenbluthX
  have hnum : mu^2 * tauQ ≠ 0 := by positivity
  have h1 : epsilon1 ≠ 0 := ne_of_gt he1
  have h2 : epsilon2 ≠ 0 := ne_of_gt he2
  intro hEq
  have hCross : (mu^2 * tauQ) * epsilon2 = (mu^2 * tauQ) * epsilon1 :=
    (div_eq_div_iff h1 h2).mp hEq
  have hEps : epsilon2 = epsilon1 := mul_left_cancel₀ hnum hCross
  exact he hEps.symm

/-- Two distinct Rosenbluth abscissae uniquely identify both squared form
    factors. This is a uniqueness theorem, not a fit to measured data. -/
theorem two_x_identifies_squared_form_factors
    (x1 x2 fcSq1 fmSq1 fcSq2 fmSq2 : ℝ)
    (hx : x1 ≠ x2)
    (h1 : reducedSigmaSq fcSq1 fmSq1 x1 =
          reducedSigmaSq fcSq2 fmSq2 x1)
    (h2 : reducedSigmaSq fcSq1 fmSq1 x2 =
          reducedSigmaSq fcSq2 fmSq2 x2) :
    fcSq1 = fcSq2 ∧ fmSq1 = fmSq2 := by
  unfold reducedSigmaSq at h1 h2
  have hdiff : (x1 - x2) * (fmSq1 - fmSq2) = 0 := by
    nlinarith [h1, h2]
  have hfm : fmSq1 = fmSq2 := by
    rcases mul_eq_zero.mp hdiff with h | h
    · exact False.elim (hx (sub_eq_zero.mp h))
    · exact sub_eq_zero.mp h
  constructor
  · nlinarith [h1, hfm]
  · exact hfm

/-- At fixed Q²_eff, two distinct virtual-photon polarizations identify the
    two squared form factors through the published Rosenbluth readout. -/
theorem two_epsilon_settings_identify_squared_form_factors
    (tauQ mu epsilon1 epsilon2 fcSq1 fmSq1 fcSq2 fmSq2 : ℝ)
    (htau : 0 < tauQ) (hmu : mu ≠ 0)
    (he1 : 0 < epsilon1) (he2 : 0 < epsilon2)
    (he : epsilon1 ≠ epsilon2)
    (h1 : reducedSigmaSq fcSq1 fmSq1 (rosenbluthX tauQ mu epsilon1) =
          reducedSigmaSq fcSq2 fmSq2 (rosenbluthX tauQ mu epsilon1))
    (h2 : reducedSigmaSq fcSq1 fmSq1 (rosenbluthX tauQ mu epsilon2) =
          reducedSigmaSq fcSq2 fmSq2 (rosenbluthX tauQ mu epsilon2)) :
    fcSq1 = fcSq2 ∧ fmSq1 = fmSq2 := by
  exact two_x_identifies_squared_form_factors
    (rosenbluthX tauQ mu epsilon1)
    (rosenbluthX tauQ mu epsilon2)
    fcSq1 fmSq1 fcSq2 fmSq2
    (distinct_epsilon_gives_distinct_x tauQ mu epsilon1 epsilon2
      htau hmu he1 he2 he)
    h1 h2

/-- One positive Rosenbluth setting cannot identify two positive squared
    form factors: it admits a distinct positive parameter pair with the same
    reduced cross section. -/
theorem one_epsilon_setting_has_distinct_positive_fiber
    (tauQ mu epsilonPol fcSq fmSq : ℝ)
    (htau : 0 < tauQ) (hmu : mu ≠ 0)
    (heps : 0 < epsilonPol)
    (hfc : 0 < fcSq) (hfm : 0 < fmSq) :
    ∃ fcSq' fmSq' : ℝ,
      0 < fcSq' ∧ 0 < fmSq' ∧
      reducedSigmaSq fcSq fmSq (rosenbluthX tauQ mu epsilonPol) =
        reducedSigmaSq fcSq' fmSq' (rosenbluthX tauQ mu epsilonPol) ∧
      (fcSq', fmSq') ≠ (fcSq, fmSq) := by
  let x := rosenbluthX tauQ mu epsilonPol
  have hx : 0 < x := by
    dsimp [x, rosenbluthX]
    positivity
  refine ⟨fcSq / 2, fmSq + fcSq / (2 * x), by positivity, by positivity, ?_, ?_⟩
  · change reducedSigmaSq fcSq fmSq x =
      reducedSigmaSq (fcSq / 2) (fmSq + fcSq / (2 * x)) x
    simp [reducedSigmaSq]
    field_simp [ne_of_gt hx]
    ring
  · intro hpair
    have hfst : fcSq / 2 = fcSq := congrArg Prod.fst hpair
    linarith

/-- Sign flips leave the reduced cross section unchanged; this readout
    identifies squared magnitudes, not signs. -/
theorem reduced_cross_section_sign_invariant
    (fc fm x : ℝ) :
    reducedSigmaSq (fc^2) (fm^2) x =
      reducedSigmaSq ((-fc)^2) ((-fm)^2) x := by
  simp [reducedSigmaSq]

#print axioms camsonneA_recovers_charge_square
#print axioms camsonneB_recovers_magnetic_square
#print axioms camsonneAB_determinant_ne_zero
#print axioms distinct_epsilon_gives_distinct_x
#print axioms two_x_identifies_squared_form_factors
#print axioms two_epsilon_settings_identify_squared_form_factors
#print axioms one_epsilon_setting_has_distinct_positive_fiber
#print axioms reduced_cross_section_sign_invariant

end HsHVerification.HelionRosenbluthIdentifiability
