import Mathlib

/-!
Aldus cross-read: conditional mathematics for the normalized six-wave
correlation ("pentacoherence") and the paper's frequency-to-wavenumber
power-law exponent conversion.

This module proves only:
* the normalized inner-product statistic is in [0,1] for nonzero finite
  sample vectors;
* the exact rational exponent arithmetic implied by the published
  dimensional relation beta = zeta * (alpha + 1) - 1.

It does NOT formalize the Fourier transform, the 75-minute averaging
procedure, the fluid equations, the Rankine-vortex dispersion relation,
the measured data, or any H(s)H worldtube/medium map.
-/

namespace HsHVerification.AldusKelvinWaveReadoutMath

/-- Absolute normalized inner product, the finite-sample form of a
    normalized correlation/pentacoherence statistic. -/
def normalizedCorrelation {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (x y : E) : ℝ :=
  ‖inner ℂ x y‖ / (‖x‖ * ‖y‖)

theorem normalizedCorrelation_nonneg {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (x y : E) :
    0 ≤ normalizedCorrelation x y := by
  unfold normalizedCorrelation
  positivity

/-- Cauchy-Schwarz bounds the finite-sample normalized correlation by 1.
    Positivity assumptions exclude the zero-denominator case. -/
theorem normalizedCorrelation_le_one {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (x y : E)
    (hx : 0 < ‖x‖) (hy : 0 < ‖y‖) :
    normalizedCorrelation x y ≤ 1 := by
  unfold normalizedCorrelation
  have hden : 0 < ‖x‖ * ‖y‖ := mul_pos hx hy
  exact (div_le_iff₀ hden).2 (by simpa using norm_inner_le_norm x y)

/-- Finite sample vectors used to represent the six Fourier-mode products
    in a discretized pentacoherence estimator. -/
abbrev SampleSpace (n : ℕ) := EuclideanSpace ℂ (Fin n)

/-- Finite-sample pentacoherence abstraction. The common 1/n averaging
    factor cancels between numerator and denominator. -/
def pentacoherenceSample {n : ℕ} (a b : SampleSpace n) : ℝ :=
  normalizedCorrelation a b

theorem pentacoherenceSample_nonneg {n : ℕ} (a b : SampleSpace n) :
    0 ≤ pentacoherenceSample a b :=
  normalizedCorrelation_nonneg a b

theorem pentacoherenceSample_le_one {n : ℕ} (a b : SampleSpace n)
    (ha : 0 < ‖a‖) (hb : 0 < ‖b‖) :
    pentacoherenceSample a b ≤ 1 :=
  normalizedCorrelation_le_one a b ha hb

/-- Source-reported dimensional-analysis exponent conversion:
    S_eta(omega) ~ omega^alpha and omega ~ k^zeta imply
    S_eta(k) ~ k^(zeta*(alpha+1)-1). -/
def spatialExponent (alpha zeta : ℚ) : ℚ :=
  zeta * (alpha + 1) - 1

/-- L'vov-Nazarenko exponent arithmetic reported in the 2026 PRL. -/
theorem ln_spatial_exponent :
    spatialExponent (-7 / 3) 2 = -11 / 3 := by
  norm_num [spatialExponent]

/-- Kozik-Svistunov exponent arithmetic reported in the 2026 PRL. -/
theorem ks_spatial_exponent :
    spatialExponent (-11 / 5) 2 = -17 / 5 := by
  norm_num [spatialExponent]

/-- The two exact theoretical spatial exponents are distinct. This does
    not establish that the experiment can resolve their difference. -/
theorem ln_ks_spatial_exponents_distinct :
    spatialExponent (-7 / 3) 2 ≠ spatialExponent (-11 / 5) 2 := by
  norm_num [spatialExponent]

/-- Exact signed difference between the two theoretical spatial exponents. -/
theorem ln_ks_spatial_exponent_gap :
    spatialExponent (-7 / 3) 2 - spatialExponent (-11 / 5) 2 = -4 / 15 := by
  norm_num [spatialExponent]

#eval spatialExponent (-7 / 3) 2
#eval spatialExponent (-11 / 5) 2
#eval spatialExponent (-7 / 3) 2 - spatialExponent (-11 / 5) 2

#print axioms normalizedCorrelation_le_one
#print axioms pentacoherenceSample_le_one
#print axioms ln_spatial_exponent
#print axioms ks_spatial_exponent
#print axioms ln_ks_spatial_exponents_distinct
#print axioms ln_ks_spatial_exponent_gap

end HsHVerification.AldusKelvinWaveReadoutMath
