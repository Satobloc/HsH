import Mathlib
import HsHVerification.CalderGW170817TidalMap

/-!
Arithmetic checks on rounded posterior summaries computed from the four processed
GW170817 sample arrays in nuclear-multimessenger-astronomy/jester at commit
9c75712264491178b7a5aac27eaf85a5af483b3a.

These are un-reweighted component-Λ posterior sample summaries. They are NOT the
paper's official flat-prior-in-\tilde{Λ} posterior. The theorems check only the
rationalized summary arithmetic, not the NPZ parser or the physical likelihood.
-/

namespace HsHVerification.CalderGW170817PosteriorChecks

def p1800061LowSpinMedian : ℚ := 356217514 / 1000000
def p1800061HighSpinMedian : ℚ := 289296098 / 1000000
def gwtc1LowSpinMedian : ℚ := 405863464 / 1000000
def gwtc1HighSpinMedian : ℚ := 327862913 / 1000000

def p1800061LowSpinQ10 : ℚ := 727160 / 1000000
def p1800061HighSpinQ10 : ℚ := 529367 / 1000000

def medianReduction (low high : ℚ) : ℚ := (low - high) / low

theorem p1800061_high_spin_sample_median_is_lower :
    p1800061HighSpinMedian < p1800061LowSpinMedian := by
  norm_num [p1800061HighSpinMedian, p1800061LowSpinMedian]

theorem p1800061_high_spin_sample_median_reduction_bounds :
    (187 / 1000 : ℚ) <
      medianReduction p1800061LowSpinMedian p1800061HighSpinMedian ∧
    medianReduction p1800061LowSpinMedian p1800061HighSpinMedian <
      (189 / 1000 : ℚ) := by
  norm_num [medianReduction, p1800061LowSpinMedian, p1800061HighSpinMedian]

theorem gwtc1_high_spin_sample_median_is_lower :
    gwtc1HighSpinMedian < gwtc1LowSpinMedian := by
  norm_num [gwtc1HighSpinMedian, gwtc1LowSpinMedian]

theorem gwtc1_high_spin_sample_median_reduction_bounds :
    (191 / 1000 : ℚ) <
      medianReduction gwtc1LowSpinMedian gwtc1HighSpinMedian ∧
    medianReduction gwtc1LowSpinMedian gwtc1HighSpinMedian <
      (193 / 1000 : ℚ) := by
  norm_num [medianReduction, gwtc1LowSpinMedian, gwtc1HighSpinMedian]

theorem p1800061_low_spin_q10_rounds_to_published_band :
    (72 / 100 : ℚ) < p1800061LowSpinQ10 ∧
    p1800061LowSpinQ10 < (74 / 100 : ℚ) := by
  norm_num [p1800061LowSpinQ10]

theorem p1800061_high_spin_q10_rounds_to_published_band :
    (52 / 100 : ℚ) < p1800061HighSpinQ10 ∧
    p1800061HighSpinQ10 < (54 / 100 : ℚ) := by
  norm_num [p1800061HighSpinQ10]

end HsHVerification.CalderGW170817PosteriorChecks
