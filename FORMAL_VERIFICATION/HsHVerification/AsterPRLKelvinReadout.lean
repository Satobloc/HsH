import Mathlib

/-!
Source audit: Barckicke, Gissinger, and Falcon, "Experimental Evidence of
Kelvin-Wave Turbulence along a Vortex Core", Phys. Rev. Lett. 137, 134001
(2026), DOI 10.1103/t3bt-m431.

The paper defines the displacement readout as the antipodal half-difference
of interface positions, eta(z,t) = (r_i(theta=0) - r_i(theta=pi))/2.
For a pure angular Fourier mode cos(phi + m*theta), the coefficient in this
readout is (1 - (-1)^m)/2. The conditional theorem below shows that m=2
cancels while m=1 survives under ideal antipodal sampling.

The paper's Figure 2 caption nevertheless attributes other visible patches in
S_eta(k,omega) to higher azimuthal modes including m=2. This module does not
declare the paper wrong: it formalizes the idealized measurement-map result
and exposes a source-level question about the observable/projection used for
those patches. Non-ideal projection, leakage, a distinct observable, or a
different meaning of the reported mode could change the interpretation.

The same paper states beta = zeta*(alpha+1)-1. The rational checks below
verify only the arithmetic for the cited LN and KS exponent pairs. They do
not validate measured spectra, resonance claims, weak-turbulence assumptions,
or any H(s)H mapping. The article's Data Availability statement says no
public research data or software are available; no raw-data reanalysis is
claimed.
-/

namespace HsHVerification

/-- Coefficient of a pure angular Fourier mode in the antipodal
    half-difference of samples at theta = 0 and theta = pi. -/
def antipodalHalfDifferenceFactor (m : Int) : Real :=
  (1 - (-1 : Real) ^ m) / 2

/-- Exact Fourier-phase identity for the source-defined antipodal readout. -/
theorem antipodal_half_difference_factor (m : Int) (phi : Real) :
    (Real.cos phi - Real.cos (phi + m * Real.pi)) / 2 =
      antipodalHalfDifferenceFactor m * Real.cos phi := by
  rw [Real.cos_add_int_mul_pi]
  unfold antipodalHalfDifferenceFactor
  ring

/-- A pure m=1 displacement mode survives the ideal antipodal half-difference. -/
theorem m1_mode_survives (phi : Real) :
    (Real.cos phi - Real.cos (phi + (1 : Int) * Real.pi)) / 2 =
      Real.cos phi := by
  rw [antipodal_half_difference_factor]
  norm_num [antipodalHalfDifferenceFactor]

/-- A pure m=2 flattening mode cancels in the ideal antipodal half-difference. -/
theorem m2_mode_cancels (phi : Real) :
    (Real.cos phi - Real.cos (phi + (2 : Int) * Real.pi)) / 2 = 0 := by
  rw [antipodal_half_difference_factor]
  norm_num [antipodalHalfDifferenceFactor]

/-- Source-stated dimensional relation between frequency and spatial
    spectrum exponents for omega proportional to k^zeta. -/
def spatialSpectrumExponent (zeta : Rat) (alpha : Rat) : Rat :=
  zeta * (alpha + 1) - 1

/-- L'vov-Nazarenko pair quoted in the 2026 PRL source. -/
theorem ln_spatial_exponent :
    spatialSpectrumExponent 2 (-7 / 3) = -11 / 3 := by
  norm_num [spatialSpectrumExponent]

/-- Kozik-Svistunov pair quoted in the 2026 PRL source. -/
theorem ks_spatial_exponent :
    spatialSpectrumExponent 2 (-11 / 5) = -17 / 5 := by
  norm_num [spatialSpectrumExponent]

end HsHVerification
