import Mathlib

/-!
Nadir Voss | Tang 2023 two-tracer chord/antipodality gate | 2026-10-29T03:12Z.
Tang et al., Nature Communications 14, 2941 (2023), DOI
10.1038/s41467-023-38787-w, Results / Fig. 2.
Measured projected half-separation d_p(0)/2 = 140.6 micrometers (rounded).
S2W model-fitted R(0) = 140.8 micrometers (rounded), NOT an
independently measured radius. All rational constants encode printed
decimal numerals, not exact experimental observations.
The paper's point-level covariance and Fig.2 source workbook are not
available in this investigation. The exact trigonometric inverse and
its numerical evaluation are in the executed Python companion.
These theorems are CONDITIONAL geometry/arithmetic, not SAT physics.
-/

namespace HsHVerification.NadirTangChordGate

def observedHalfSeparationUm : ℚ := 703 / 5
def s2wFittedRadiusUm : ℚ := 704 / 5
def chordRatio : ℚ := observedHalfSeparationUm / s2wFittedRadiusUm

theorem printed_chord_ratio : chordRatio = 703 / 704 := by
  norm_num [chordRatio, observedHalfSeparationUm, s2wFittedRadiusUm]

theorem printed_radius_gap :
    s2wFittedRadiusUm - observedHalfSeparationUm = 1 / 5 := by
  norm_num [s2wFittedRadiusUm, observedHalfSeparationUm]

theorem printed_squared_deficit :
    1 - chordRatio ^ 2 = 1407 / 495616 := by
  norm_num [chordRatio, observedHalfSeparationUm, s2wFittedRadiusUm]

theorem projected_chord_conditional (s : ℚ)
    (hproj : observedHalfSeparationUm ≤ s2wFittedRadiusUm * s) :
    chordRatio ≤ s := by
  dsimp [chordRatio, observedHalfSeparationUm, s2wFittedRadiusUm] at *
  norm_num at hproj ⊢
  linarith

theorem trigonometric_chord_conditional (delta : ℝ)
    (hproj : (703 : ℝ) / 5 ≤ (704 : ℝ) / 5 * Real.sin (delta / 2)) :
    (703 : ℝ) / 704 ≤ Real.sin (delta / 2) := by
  nlinarith

theorem rounding_only_ratio_range :
    (937 : ℚ) / 939 < chordRatio ∧ chordRatio < (2813 : ℚ) / 2815 := by
  norm_num [chordRatio, observedHalfSeparationUm, s2wFittedRadiusUm]

theorem projection_sign_nonidentifiability (p q : ℚ) :
    p ^ 2 + q ^ 2 = p ^ 2 + (-q) ^ 2 := by
  ring

#print axioms printed_chord_ratio
#print axioms printed_radius_gap
#print axioms printed_squared_deficit
#print axioms projected_chord_conditional
#print axioms trigonometric_chord_conditional
#print axioms rounding_only_ratio_range
#print axioms projection_sign_nonidentifiability

end HsHVerification.NadirTangChordGate
