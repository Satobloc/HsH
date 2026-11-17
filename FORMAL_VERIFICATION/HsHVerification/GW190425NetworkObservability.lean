import Mathlib

/-!
# GW190425 detector-network rank preflight

The published GW190425 analysis used LIGO Livingston (L1) and Virgo (V1);
Hanford (H1) was offline. At a fixed time/frequency sample and fixed
sky/polarization frame, a linear response to six independent metric
polarization amplitudes is represented by a 2 × 6 real matrix.

This module proves only the matrix-dimension bound. It does NOT calculate
the event's antenna-response matrix, its noise-weighted singular values,
its condition number, the effect of PSD/calibration uncertainty, or any
H(s)H source-to-polarization map. A parameterized waveform model can infer
more under additional waveform assumptions; that is not an unrestricted
six-polarization reconstruction.
-/

namespace HsHVerification.GW190425NetworkObservability

/-- Any two-channel linear response matrix has rank at most two,
    irrespective of the six-dimensional input polarization basis. -/
theorem two_detector_six_polarization_rank_le_two
    (F : Matrix (Fin 2) (Fin 6) ℝ) : F.rank ≤ 2 := by
  simpa using Matrix.rank_le_height F

/-- The six-column response has a rank deficit of at least four.
    This is an arithmetic rank-deficit statement, not an empirical
    estimate of effective network rank or a posterior identifiability result. -/
theorem two_detector_six_polarization_rank_deficit_ge_four
    (F : Matrix (Fin 2) (Fin 6) ℝ) : 4 ≤ 6 - F.rank := by
  have h := two_detector_six_polarization_rank_le_two F
  omega

#print axioms two_detector_six_polarization_rank_le_two
#print axioms two_detector_six_polarization_rank_deficit_ge_four

end HsHVerification.GW190425NetworkObservability
