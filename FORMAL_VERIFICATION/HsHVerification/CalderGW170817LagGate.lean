import Mathlib

/-!
# GW170817 / GRB170817A: emission-versus-propagation identifiability

Empirical anchor (not a theorem premise): Abbott et al., ApJL 848 L13,
DOI 10.3847/2041-8213/aa920c, measured lag +1.74 ± 0.05 s.
Initial GW distance estimate: Abbott et al., ApJL 848 L12,
DOI 10.3847/2041-8213/aa91c9, 40 ± 8 Mpc.

Historical SAT context: SAT_THEORY_ARCHIVE_2023-25/SAT XYZ/SAT-QG.txt,
Git blob a6423279358da0e1caeda400223daa61945c0bf1,
mentions GW170817-style bounds on photon-versus-graviton propagation.
SAT-TO-STANDARD 2.txt, blob f32cca74bbb174bb95319d92d354abb6f368e373,
records c_T² = c1/(c1+c2) as a model-dependent dictionary relation.
Neither archival source is authenticated Nathan-authored mathematics.

Mathematical idealization: observed lag = source emission lag + differential
propagation lag. This neglects cosmological, Shapiro, detector and waveform
reference-time corrections; those must be supplied in a real forward model.
The theorem does NOT prove physical propagation differences or SAT.
-/

namespace HsHVerification.CalderGW170817LagGate

/-- Additive two-component lag budget, with seconds as the external unit. -/
def observedLag (emissionLag propagationLag : ℝ) : ℝ :=
  emissionLag + propagationLag

/-- Any proposed propagation lag admits an emission lag yielding the same
observed lag. This is an algebraic statement, not a physical permission to
choose emission delays arbitrarily. -/
theorem any_propagation_compatible_algebraically
    (observed propagation : ℝ) :
    observedLag (observed - propagation) propagation = observed := by
  dsimp [observedLag]
  ring

/-- If two distinct propagation hypotheses are allowed and emission delays
are unconstrained, the single observed lag cannot distinguish them. -/
theorem two_propagation_hypotheses_same_observation
    (observed p q : ℝ) (hpq : p ≠ q) :
    ∃ e₁ e₂ : ℝ,
      observedLag e₁ p = observed ∧
      observedLag e₂ q = observed ∧ p ≠ q := by
  refine ⟨observed - p, observed - q, ?_, ?_, hpq⟩
  · exact any_propagation_compatible_algebraically observed p
  · exact any_propagation_compatible_algebraically observed q

/-- If the intrinsic emission lag is independently fixed, the additive
mapping is injective in the differential propagation lag. -/
theorem fixed_emission_lag_recovers_propagation
    (emission p q : ℝ)
    (h : observedLag emission p = observedLag emission q) :
    p = q := by
  dsimp [observedLag] at h
  linarith

#print axioms any_propagation_compatible_algebraically
#print axioms two_propagation_hypotheses_same_observation
#print axioms fixed_emission_lag_recovers_propagation

end HsHVerification.CalderGW170817LagGate
