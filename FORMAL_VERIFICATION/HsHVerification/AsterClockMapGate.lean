import Mathlib

namespace HsHVerification.AsterClockMapGate

/-!
Source-fidelity algebra gate for two historically distinct coordinate conventions.

The source witnesses are not assumed to identify their variables or units:
* historical witness: w = c * t, with w described as a time-length in metres;
* later native witness: c * w = t, in a Planck/natural-unit context.

The theorems below test only the conditional scalar reading in which c, t, and w
are literally the same real-valued symbols. They do not establish that the
historical source intended that identification, nor do they encode physical
units, a metric signature, or a physical model.
-/

/-- Literal scalar reading of both coordinate equations forces c² = 1
    whenever the displacement t is nonzero. -/
theorem same_scalar_maps_force_c_sq_eq_one
    {c t w : ℝ}
    (h_forward : w = c * t)
    (h_reverse : c * w = t)
    (ht : t ≠ 0) :
    c ^ 2 = 1 := by
  rw [h_forward] at h_reverse
  have hzero : (c ^ 2 - 1) * t = 0 := by
    nlinarith [h_reverse]
  rcases mul_eq_zero.mp hzero with hfactor | ht0
  · nlinarith [hfactor]
  · exact (ht ht0).elim

/-- If the same scalar scale is positive, the two literal equations require c=1. -/
theorem same_scalar_positive_scale_is_one
    {c t w : ℝ}
    (hc : 0 < c)
    (h_forward : w = c * t)
    (h_reverse : c * w = t)
    (ht : t ≠ 0) :
    c = 1 := by
  have hsq := same_scalar_maps_force_c_sq_eq_one h_forward h_reverse ht
  nlinarith [hsq]

/-- The inverse of the historical map w = c*t is t = w/c when c is nonzero. -/
theorem inverse_of_w_eq_ct
    {c t w : ℝ}
    (hc : c ≠ 0)
    (h_forward : w = c * t) :
    t = w / c := by
  rw [h_forward]
  field_simp [hc]

/-- Historical scalar map t ↦ c*t. -/
def historicalMap (c : ℝ) : ℝ → ℝ := fun t => c * t

/-- Literal later scalar map w ↦ c*w. -/
def nativeMap (c : ℝ) : ℝ → ℝ := fun w => c * w

/-- Composition of the two literal maps is multiplication by c², not
    automatically the identity. -/
theorem native_after_historical (c t : ℝ) :
    nativeMap c (historicalMap c t) = c ^ 2 * t := by
  simp [nativeMap, historicalMap]
  ring

/-- In the explicit unit-scale convention c=1, the composed scalar map is
    the identity. This is a conditional normalization result only. -/
theorem native_after_historical_when_c_is_one (t : ℝ) :
    nativeMap 1 (historicalMap 1 t) = t := by
  simp [nativeMap, historicalMap]

/-!
Expansion-centering reconstruction.

vH is an abstract placeholder for the "actual velocity related to H0"
described in the direct message. No map H0 ↦ vH or scale L is supplied here.
The source-faithful conditional reading is:
  time rate  = c + vH
  space rate = vH
and then subtract their common midpoint.
-/

/-- Conditional time-expansion rate described in the direct clarification. -/
def timeExpansion (c vH : ℝ) : ℝ := c + vH

/-- Conditional space-expansion rate described in the direct clarification. -/
def spaceExpansion (vH : ℝ) : ℝ := vH

/-- Common midpoint of the two conditional rates. -/
noncomputable def commonMidpoint (c vH : ℝ) : ℝ :=
  (timeExpansion c vH + spaceExpansion vH) / 2

/-- The time-side centered residual is +c/2. -/
theorem time_residual_eq_half_c (c vH : ℝ) :
    timeExpansion c vH - commonMidpoint c vH = c / 2 := by
  simp [timeExpansion, spaceExpansion, commonMidpoint]
  ring

/-- The space-side centered residual is -c/2. -/
theorem space_residual_eq_neg_half_c (c vH : ℝ) :
    spaceExpansion vH - commonMidpoint c vH = -c / 2 := by
  simp [timeExpansion, spaceExpansion, commonMidpoint]
  ring

/-- The direct centered residual pair has zero sum. -/
theorem direct_centered_residuals_sum_zero (c vH : ℝ) :
    (timeExpansion c vH - commonMidpoint c vH) +
    (spaceExpansion vH - commonMidpoint c vH) = 0 := by
  rw [time_residual_eq_half_c, space_residual_eq_neg_half_c]
  ring

/-- The direct centered residual pair has difference c. -/
theorem direct_centered_residuals_difference_eq_c (c vH : ℝ) :
    (timeExpansion c vH - commonMidpoint c vH) -
    (spaceExpansion vH - commonMidpoint c vH) = c := by
  rw [time_residual_eq_half_c, space_residual_eq_neg_half_c]
  ring

/-!
Historical assistant candidate from 2026-10-21:
  v±(L) = (c ± H0*L)/2.
For comparison only, vH stands in for the unprovided dimensionalized velocity.
These invariants show that this candidate pair is not the direct centered-residual
pair in general: its sum is c and its difference is vH, rather than 0 and c.
-/

noncomputable def assistantCandidatePlus (c vH : ℝ) : ℝ := (c + vH) / 2
noncomputable def assistantCandidateMinus (c vH : ℝ) : ℝ := (c - vH) / 2

theorem assistant_candidate_sum_eq_c (c vH : ℝ) :
    assistantCandidatePlus c vH + assistantCandidateMinus c vH = c := by
  simp [assistantCandidatePlus, assistantCandidateMinus]
  ring

theorem assistant_candidate_difference_eq_vH (c vH : ℝ) :
    assistantCandidatePlus c vH - assistantCandidateMinus c vH = vH := by
  simp [assistantCandidatePlus, assistantCandidateMinus]
  ring

#print axioms same_scalar_maps_force_c_sq_eq_one
#print axioms same_scalar_positive_scale_is_one
#print axioms inverse_of_w_eq_ct
#print axioms native_after_historical
#print axioms native_after_historical_when_c_is_one
#print axioms time_residual_eq_half_c
#print axioms space_residual_eq_neg_half_c
#print axioms direct_centered_residuals_sum_zero
#print axioms direct_centered_residuals_difference_eq_c
#print axioms assistant_candidate_sum_eq_c
#print axioms assistant_candidate_difference_eq_vH

end HsHVerification.AsterClockMapGate
