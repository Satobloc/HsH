import Mathlib

/-!
Tang et al. (2023), Nature Communications 14:2941, Fig. 2d.
Actual helium-II vortex ring at 1.65 K: measured projected half-separation
140.6 micrometres; S2W model-fitted ring radius 140.8 micrometres.
These nominal rounded values are not independent observations.
This file proves only conditional Euclidean chord/projection mathematics.
-/

namespace HsHVerification.MeridianTangChordProjection

def observedHalfSeparation : ℚ := 1406 / 10
def modelFittedRadius : ℚ := 1408 / 10

theorem source_ratio_exact :
    observedHalfSeparation / modelFittedRadius = 703 / 704 := by
  norm_num [observedHalfSeparation, modelFittedRadius]

theorem source_ratio_positive :
    (0 : ℚ) < observedHalfSeparation / modelFittedRadius := by
  norm_num [observedHalfSeparation, modelFittedRadius]

theorem source_ratio_below_one :
    observedHalfSeparation / modelFittedRadius < 1 := by
  norm_num [observedHalfSeparation, modelFittedRadius]

/-- Orthographic projected chord <= true chord <= circular diameter.
The hypothesis is a geometric model assumption, not an empirical theorem. -/
theorem projected_chord_interval
    (r projected trueChord : ℝ)
    (hr : 0 < r)
    (hprojection : projected ≤ trueChord)
    (hdiameter : trueChord ≤ 2 * r) :
    projected / (2 * r) ≤ trueChord / (2 * r) ∧
      trueChord / (2 * r) ≤ 1 := by
  have hd : 0 < 2 * r := by positivity
  constructor
  · exact (div_le_div_iff₀ hd hd).2 (by nlinarith [hprojection])
  · exact (div_le_iff₀ hd).2 (by nlinarith [hdiameter])

#print axioms source_ratio_exact
#print axioms source_ratio_positive
#print axioms source_ratio_below_one
#print axioms projected_chord_interval

end HsHVerification.MeridianTangChordProjection
