import Mathlib

/-!
# UI marked-point readout: relative-frame stabilizer criterion

Primary source: Nathan Direct, "Switching to English", raw conversation
`69ab6f13-b8f8-832e-8d71-528c15e11037`, export blob
`dfdaec331846087af7daf0008eba431520a5b9ad`, user message
`a27ac504-8a09-4a2e-9de8-fc4c5cf05680` (2026-03-07 09:08:47.520Z).
The source describes a marked point carried by a movable 4D sphere/grid and
relative rotations; it does not define a unique full-frame inverse.

This module formalizes a generic group-action criterion only. It does NOT
instantiate SO(4), prove the UI chart implementation, establish a physical
timesheet/worldtube map, or validate any physical premise.
-/ 

namespace HsHVerification.UIReadoutStabilizer

variable {G X : Type*} [Group G] [MulAction G X]

/-- Two group frames give the same marked-point readout exactly when their
relative frame fixes the seed. The relative element is taken as r₂⁻¹ r₁
under a left action. -/
theorem same_point_readout_iff_relative_frame_fixes_seed
    (r₁ r₂ : G) (x₀ : X) :
    r₁ • x₀ = r₂ • x₀ ↔ (r₂⁻¹ * r₁) • x₀ = x₀ := by
  constructor
  · intro h
    have h' := congrArg (fun y => r₂⁻¹ • y) h
    simpa [smul_smul] using h'
  · intro h
    have h' := congrArg (fun y => r₂ • y) h
    simpa [smul_smul] using h'

/-- If a chart change is a right multiplication by a seed stabilizer, the
marked-point readout is unchanged. -/
theorem right_stabilizer_chart_change_preserves_readout
    (r₁ r₂ q : G) (x₀ : X)
    (hFix : q • x₀ = x₀)
    (hChart : r₁ = r₂ * q) :
    r₁ • x₀ = r₂ • x₀ := by
  rw [hChart, mul_smul, hFix]

#print axioms same_point_readout_iff_relative_frame_fixes_seed
#print axioms right_stabilizer_chart_change_preserves_readout

end HsHVerification.UIReadoutStabilizer
