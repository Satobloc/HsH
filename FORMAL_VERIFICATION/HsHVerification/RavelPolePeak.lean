import Mathlib

/-!
# Ravel finite-core resonance: free poles versus driven displacement peaks

Source: Satobloc/HsH/WORKSPACES/RAVEL/
SANDBOX_2026-10-07_INERTIAL_TORSION_RESONANCE.md
Git blob 9b1678cb76d586e0339cef14612301f4c3974c9c.
Follow-on: SANDBOX_2026-10-07_SO4_MATERIAL_FRAME_HOLONOMY.md
Git blob 7413b3d5d739e6e4b590b0228714032f7a8aa39e.

For one linear mode I*x'' + gamma*x' + k*x = forcing:
- squared oscillation frequency of an underdamped free pole:
  k/I - gamma^2/(4 I^2);
- squared nonzero-frequency displacement-response amplitude peak:
  k/I - gamma^2/(2 I^2), provided positive.

These theorems only audit conditional algebra and the relation of the
two discriminants. They do NOT derive a physical worldtube action, nor
assert any measured resonance or H(s)H prediction.
-/

namespace HsHVerification.RavelPolePeak

noncomputable def freePoleOscSq (inertia stiffness damping : ℝ) : ℝ :=
  stiffness / inertia - damping ^ 2 / (4 * inertia ^ 2)

noncomputable def drivenDisplacementPeakSq (inertia stiffness damping : ℝ) : ℝ :=
  stiffness / inertia - damping ^ 2 / (2 * inertia ^ 2)

/-- Free-pole oscillation and driven displacement peaks are distinct
    readouts of the same damped linear mode. -/
theorem pole_peak_gap (inertia stiffness damping : ℝ)
    (hI : inertia ≠ 0) :
    freePoleOscSq inertia stiffness damping -
      drivenDisplacementPeakSq inertia stiffness damping =
      damping ^ 2 / (4 * inertia ^ 2) := by
  unfold freePoleOscSq drivenDisplacementPeakSq
  field_simp [hI]
  <;> ring

/-- The squared free-pole oscillation frequency cannot be smaller than
    the squared driven-displacement peak frequency. -/
theorem driven_peak_le_free_pole (inertia stiffness damping : ℝ)
    (hI : inertia ≠ 0) :
    drivenDisplacementPeakSq inertia stiffness damping ≤
      freePoleOscSq inertia stiffness damping := by
  have hgap := pole_peak_gap inertia stiffness damping hI
  have hnonneg : 0 ≤ damping ^ 2 / (4 * inertia ^ 2) := by positivity
  linarith

/-- A positive-frequency driven displacement peak requires a stronger
    discriminant inequality than merely having an oscillatory free pole. -/
theorem driven_peak_condition_implies_underdamped
    (inertia stiffness damping : ℝ)
    (hI : 0 < inertia)
    (hpeak : damping ^ 2 < 2 * inertia * stiffness) :
    damping ^ 2 < 4 * inertia * stiffness := by
  nlinarith [sq_nonneg damping]

#print axioms pole_peak_gap
#print axioms driven_peak_le_free_pole
#print axioms driven_peak_condition_implies_underdamped

end HsHVerification.RavelPolePeak
