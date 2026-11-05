import Mathlib
import HsHVerification.NadirVortexTwoChannelReadout

/-!
# Finite Fourier parity projection for the antipodal vortex readout

Primary source: Barckicke, Falcon & Gissinger, "Kelvin wave propagation along
vortex cores", Nature Physics (2026), DOI 10.1038/s41567-026-03175-w, Methods.

The paper defines the two antipodal contour readouts
  eta = (r(0) - r(pi))/2
  a   = (r(0) + r(pi))/2.

For a finite Fourier truncation
  r(theta) = a0 + sum_m (A_m cos(m theta) + B_m sin(m theta)),
this module proves the exact two-point information content. The cosine
coefficients enter only through the alternating-sign aggregate (-1)^m;
the sine quadratures vanish at both sampled angles. Thus the two channels
are parity aggregates, not a full angular reconstruction or a unique
mode-number classifier.

Scope limits:
* The theorem is for a finite Fourier sum, not an infinite-series limit.
* It formalizes the declared antipodal sampling map, not camera projection,
  contour extraction, cross-view calibration, PIV/PTV, or the physical
  vortex dynamics.
* It does not establish the source-to-geometry translation or a physical
  worldtube. It is a conditional mathematical statement about the
  source-defined readout equations.
-/

namespace HsHVerification.EnheduannaKelvinParityReadout

open HsHVerification.NadirVortexTwoChannelReadout

noncomputable section

/-- A finite real Fourier truncation of a radial boundary at fixed (z,t). -/
def finiteFourierProfile (a₀ : ℝ) (modes : Finset ℕ)
    (A B : ℕ → ℝ) (θ : ℝ) : ℝ :=
  a₀ + ∑ m ∈ modes,
    (A m * Real.cos ((m : ℝ) * θ) +
      B m * Real.sin ((m : ℝ) * θ))

/-- The paper's two-point readout, evaluated at antipodal angles 0 and pi. -/
def finiteAntipodalReadout (a₀ : ℝ) (modes : Finset ℕ)
    (A B : ℕ → ℝ) : Readout :=
  observe (finiteFourierProfile a₀ modes A B 0)
    (finiteFourierProfile a₀ modes A B Real.pi)

/-- The odd-parity aggregate of the cosine coefficients. -/
def oddParityAggregate (modes : Finset ℕ) (A : ℕ → ℝ) : ℝ :=
  ((∑ m ∈ modes, A m) -
    (∑ m ∈ modes, A m * (-1 : ℝ) ^ m)) / 2

/-- The even-parity aggregate of the cosine coefficients. -/
def evenParityAggregate (modes : Finset ℕ) (A : ℕ → ℝ) : ℝ :=
  ((∑ m ∈ modes, A m) +
    (∑ m ∈ modes, A m * (-1 : ℝ) ^ m)) / 2

lemma finiteFourierProfile_zero (a₀ : ℝ) (modes : Finset ℕ)
    (A B : ℕ → ℝ) :
    finiteFourierProfile a₀ modes A B 0 =
      a₀ + ∑ m ∈ modes, A m := by
  simp [finiteFourierProfile]

lemma finiteFourierProfile_pi (a₀ : ℝ) (modes : Finset ℕ)
    (A B : ℕ → ℝ) :
    finiteFourierProfile a₀ modes A B Real.pi =
      a₀ + ∑ m ∈ modes, A m * (-1 : ℝ) ^ m := by
  simp [finiteFourierProfile, Real.cos_nat_mul_pi, Real.sin_nat_mul_pi]

/-- Exact finite-Fourier formula for the two antipodal channels.
The displacement channel is the odd-parity aggregate; the radius channel
is the baseline radius plus the even-parity aggregate. -/
theorem finiteAntipodalReadout_formula (a₀ : ℝ) (modes : Finset ℕ)
    (A B : ℕ → ℝ) :
    finiteAntipodalReadout a₀ modes A B =
      (oddParityAggregate modes A,
        a₀ + evenParityAggregate modes A) := by
  unfold finiteAntipodalReadout
  rw [finiteFourierProfile_zero, finiteFourierProfile_pi]
  ext <;>
    dsimp [observe, displacement, coreRadius,
      oddParityAggregate, evenParityAggregate] <;>
    ring

/-- The two antipodal samples are blind to every sine-quadrature coefficient.
Changing B while keeping A fixed leaves both readout channels unchanged. -/
theorem finiteAntipodalReadout_sineCoefficients_invisible
    (a₀ : ℝ) (modes : Finset ℕ) (A B₁ B₂ : ℕ → ℝ) :
    finiteAntipodalReadout a₀ modes A B₁ =
      finiteAntipodalReadout a₀ modes A B₂ := by
  simp [finiteAntipodalReadout_formula]

#print axioms finiteAntipodalReadout_formula
#print axioms finiteAntipodalReadout_sineCoefficients_invisible

end
end HsHVerification.EnheduannaKelvinParityReadout
