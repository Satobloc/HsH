import Mathlib

/-!
# Frequency-resolved two-contour vortex readout

Source system: Barckicke, Falcon & Gissinger, "Kelvin wave propagation along
vortex cores", *Nature Physics* 22 (2026), DOI 10.1038/s41567-026-03175-w.

The paper defines the paired readout from opposing contour positions
(r₀, rπ) by η = (r₀ - rπ)/2 and a = (r₀ + rπ)/2. This module lifts that
source-defined real linear readout to a complex spectral-density matrix.

The readout matrix has real entries, so its conjugate transpose equals its
ordinary transpose. Its inverse is explicit. Consequently the full transformed
2×2 spectral matrix is an invertible change of basis: it contains exactly the
same information as the raw matrix. The off-diagonal displacement/radius
cross-spectrum is a useful phase-sensitive derived statistic, but it is not
an additional independent measurement or an information gain. It can expose
phase information that is absent from reduced summaries such as marginal
auto-spectra or zero-lag covariance.

Scope limits:
* The theorems prove only the algebraic transformation and its invertibility.
* They do not estimate a spectral matrix from the Figshare data; raw bytes and
  the joint contour covariance were not retrieved in this run.
* They do not establish that any observed cross-spectrum is caused by H(s)H
  geometry rather than standard fluid dynamics, forcing, or the instrument.
* They do not prove a physical worldtube map, a constitutive law, or an
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

/-- Explicit inverse of the source-defined two-contour readout matrix. -/
def contourToReadoutInverse : Matrix (Fin 2) (Fin 2) ℂ :=
  !![(1 : ℂ), 1;
     -1, 1]

/-- The source readout has real entries, so adjoint and transpose coincide. -/
theorem contourToReadout_adjoint_eq_transpose :
    contourToReadout.conjTranspose = contourToReadout.transpose := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [contourToReadout, Matrix.conjTranspose,
      Matrix.transpose_apply]

/-- The explicit inverse is a left inverse of the source readout. -/
theorem contourToReadoutInverse_left :
    contourToReadoutInverse * contourToReadout = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [contourToReadoutInverse, contourToReadout,
      Matrix.mul_apply, Fin.sum_univ_two]

/-- The explicit inverse is a right inverse of the source readout. -/
theorem contourToReadoutInverse_right :
    contourToReadout * contourToReadoutInverse = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [contourToReadoutInverse, contourToReadout,
      Matrix.mul_apply, Fin.sum_univ_two]

/-- The transpose-side inverse needed to recover a spectral matrix. -/
theorem contourToReadoutTransposeInverse_right :
    contourToReadout.transpose * contourToReadoutInverse.transpose = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [contourToReadoutInverse, contourToReadout,
      Matrix.transpose_apply, Matrix.mul_apply, Fin.sum_univ_two]

/-- Frequency-resolved spectral matrix after the paired contour readout:
    S_(η,a) = A S_(r₀,rπ) Aᵀ. Since A is real, Aᵀ = A*. -/
def transformSpectralMatrix (S : SpectralMatrix) : SpectralMatrix :=
  contourToReadout * S * contourToReadout.transpose

/-- The transpose-based definition is exactly the conjugate-transpose
    spectral congruence because the readout matrix is real. -/
theorem transformSpectralMatrix_adjoint_form (S : SpectralMatrix) :
    transformSpectralMatrix S =
      contourToReadout * S * contourToReadout.conjTranspose := by
  rw [transformSpectralMatrix, contourToReadout_adjoint_eq_transpose]

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
      Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_two] <;> ring

/-- The displacement/radius cross-spectrum is the (η,a) off-diagonal entry. -/
def etaRadiusCrossSpectrum (S : SpectralMatrix) : ℂ :=
  transformSpectralMatrix S 0 1

/-- Exact phase-sensitive cross-spectrum in terms of the two raw contour
    autospectra and their two directed cross-spectra. -/
theorem etaRadiusCrossSpectrum_formula (S : SpectralMatrix) :
    etaRadiusCrossSpectrum S =
      (S 0 0 + S 0 1 - S 1 0 - S 1 1) / 4 := by
  rw [etaRadiusCrossSpectrum, transformSpectralMatrix_formula]
  rfl

/-- If the raw spectral matrix has conjugate-symmetric cross entries and its
    two auto-spectra match, the derived displacement/radius cross-spectrum
    is purely imaginary. -/
theorem etaRadiusCrossSpectrum_pure_imaginary_of_equal_autos
    (S : SpectralMatrix)
    (hAuto : S 0 0 = S 1 1)
    (hHermitian : S 1 0 = star (S 0 1)) :
    etaRadiusCrossSpectrum S + star (etaRadiusCrossSpectrum S) = 0 := by
  rw [etaRadiusCrossSpectrum_formula]
  simp [hAuto, hHermitian]
  ring

/-- The full spectral-matrix transformation is injective: no information is
    added to or lost from the complete two-channel matrix by this basis change. -/
theorem transformSpectralMatrix_injective :
    Function.Injective transformSpectralMatrix := by
  intro S T h
  have recoverS :
      contourToReadoutInverse * transformSpectralMatrix S *
        contourToReadoutInverse.transpose = S := by
    simp [transformSpectralMatrix, Matrix.mul_assoc,
      contourToReadoutInverse_left, contourToReadoutTransposeInverse_right]
  have recoverT :
      contourToReadoutInverse * transformSpectralMatrix T *
        contourToReadoutInverse.transpose = T := by
    simp [transformSpectralMatrix, Matrix.mul_assoc,
      contourToReadoutInverse_left, contourToReadoutTransposeInverse_right]
  calc
    S = contourToReadoutInverse * transformSpectralMatrix S *
        contourToReadoutInverse.transpose := recoverS.symm
    _ = contourToReadoutInverse * transformSpectralMatrix T *
        contourToReadoutInverse.transpose := by rw [h]
    _ = T := recoverT

#print axioms contourToReadout_adjoint_eq_transpose
#print axioms contourToReadoutInverse_left
#print axioms contourToReadoutInverse_right
#print axioms contourToReadoutTransposeInverse_right
#print axioms transformSpectralMatrix_formula
#print axioms etaRadiusCrossSpectrum_formula
#print axioms etaRadiusCrossSpectrum_pure_imaginary_of_equal_autos
#print axioms transformSpectralMatrix_injective

end
end HsHVerification.MercerVortexCrossSpectralReadout
