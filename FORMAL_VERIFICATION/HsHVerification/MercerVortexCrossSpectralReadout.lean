import Mathlib

/-!
# Frequency-resolved two-contour vortex readout

Source system: Barckicke, Falcon & Gissinger, "Kelvin wave propagation along
vortex cores", *Nature Physics* 22 (2026), DOI 10.1038/s41567-026-03175-w.

The paper defines the paired readout from opposing contour positions
(r₀, rπ) by η = (r₀ - rπ)/2 and a = (r₀ + rπ)/2.  This module lifts that
real linear readout to a complex spectral-density matrix.

For a raw two-channel spectral matrix S, the transformed matrix is
A S A*, where A is the source-defined readout matrix.  The off-diagonal
entry retains the phase-sensitive cross-spectrum between displacement η
and core radius a.  This is not the same object as the zero-lag real
covariance already formalized in ContourReadoutCovariance.

Scope limits:
* The theorem proves only the algebraic transformation of the encoded
  two-channel readout.
* It does not estimate S from the Figshare data, which were not retrieved
  in this run.
* It does not establish that any observed cross-spectrum is caused by
  H(s)H geometry rather than standard fluid dynamics or the instrument.
* It does not prove a physical worldtube map, a constitutive law, or an
  H(s)H equivalence.
-/

namespace HsHVerification.MercerVortexCrossSpectralReadout

open Matrix

noncomputable section

/-- Complex 2×2 spectral-density matrix for the two raw contour channels. -/
abbrev SpectralMatrix := Matrix (Fin 2) (Fin 2) ℂ

/-- Source-defined real readout, lifted to complex Fourier amplitudes:
    (r₀,rπ) ↦ (η,a). -/
def contourToReadout : Matrix (Fin 2) (Fin 2) ℂ :=
  !![(1 : ℂ) / 2, -(1 : ℂ) / 2;
     (1 : ℂ) / 2,  (1 : ℂ) / 2]

/-- Frequency-resolved spectral matrix after the paired contour readout:
    S_(η,a) = A S_(r₀,rπ) A*. -/
def transformSpectralMatrix (S : SpectralMatrix) : SpectralMatrix :=
  contourToReadout * S * contourToReadout.conjTranspose

/-- Exact four-entry transformation of the raw complex spectral matrix. -/
theorem transformSpectralMatrix_formula (S : SpectralMatrix) :
    transformSpectralMatrix S =
      !![(S 0 0 - S 0 1 - S 1 0 + S 1 1) / 4,
         (S 0 0 + S 0 1 - S 1 0 - S 1 1) / 4;
         (S 0 0 - S 0 1 + S 1 0 - S 1 1) / 4,
         (S 0 0 + S 0 1 + S 1 0 + S 1 1) / 4] := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [transformSpectralMatrix, contourToReadout,
      Matrix.mul_apply, Matrix.conjTranspose, Matrix.transpose_apply,
      Fin.sum_univ_two] <;> ring

/-- The displacement/radius cross-spectrum is the (η,a) off-diagonal entry. -/
def etaRadiusCrossSpectrum (S : SpectralMatrix) : ℂ :=
  transformSpectralMatrix S 0 1

/-- Exact phase-sensitive cross-spectrum in terms of the two raw contour
    autospectra and their two directed cross-spectra. -/
theorem etaRadiusCrossSpectrum_formula (S : SpectralMatrix) :
    etaRadiusCrossSpectrum S =
      (S 0 0 + S 0 1 - S 1 0 - S 1 1) / 4 := by
  rw [etaRadiusCrossSpectrum, transformSpectralMatrix_formula]

/-- If the raw spectral matrix is Hermitian and its two auto-spectra match,
    the derived displacement/radius cross-spectrum is purely imaginary.
    Thus equal marginal spectra do not by themselves eliminate phase-lagged
    coupling between the two derived channels. -/
theorem etaRadiusCrossSpectrum_pure_imaginary_of_equal_autos
    (S : SpectralMatrix)
    (hAuto : S 0 0 = S 1 1)
    (hHermitian : S 1 0 = star (S 0 1)) :
    etaRadiusCrossSpectrum S + star (etaRadiusCrossSpectrum S) = 0 := by
  rw [etaRadiusCrossSpectrum_formula]
  simp [hAuto, hHermitian]
  ring

#print axioms transformSpectralMatrix_formula
#print axioms etaRadiusCrossSpectrum_formula
#print axioms etaRadiusCrossSpectrum_pure_imaginary_of_equal_autos

end
end HsHVerification.MercerVortexCrossSpectralReadout
