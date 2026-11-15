import Mathlib

/-!
# Meridian GCS apex geometry: algebraic consequences

Source geometry:
* Mishra et al. (2026), MNRAS 550, stag1145, DOI 10.1093/mnras/stag1145,
  Table 1 supplies the event-fit parameters alpha and kappa.
* The GCS skeleton parameterization is implemented in PyThea
  (PyThea/geometrical_models.py, blob
  6c9fb2cf9fbf71993cf428c874b17a43d8ce0803) and in gcs_python
  (gcs/geometry.py, blob
  c414d285153e1446cea3276b8ffe77ffba390956).

The symbols below are assistant-derived algebraic reductions of that
source-defined parameterization, not verbatim equations from Mishra et al.
Let s = sin(alpha), kappa be the GCS shape ratio, and H be the scaled
cone-height parameter used by the skeleton construction.

These theorems establish conditional algebra only. They do not establish
that a fitted GCS shell is a physical flux rope, nor any H(s)H equivalence.
-/

namespace HsHVerification.MeridianGCSAlgebra

/-- The transverse offset X₀ of the GCS centerline at the apex. -/
noncomputable def apexAxisOffset (H s κ : ℝ) : ℝ :=
  H * (s + κ ^ 2) / (1 - κ ^ 2)

/-- Heliocentric radius of the GCS apex cross-section center. -/
noncomputable def apexCenterRadius (H s κ : ℝ) : ℝ :=
  H * (1 + s) / (1 - κ ^ 2)

/-- GCS cross-section radius at the apex, a = κ R_c. -/
noncomputable def apexCrossSectionRadius (H s κ : ℝ) : ℝ :=
  κ * apexCenterRadius H s κ

/-- Local centerline curvature radius obtained by differentiating the
    GCS skeleton at β = π/2. The differentiation itself is source-derived
    in the research note; this definition records its resulting expression. -/
noncomputable def apexAxisCurvatureRadius (H s κ : ℝ) : ℝ :=
  H * (s + κ ^ 2) ^ 2 / ((1 - κ ^ 2) * (s + 2 * κ ^ 2))

/-- The GCS apex cross-section radius minus its centerline offset.
    Its sign is controlled exactly by κ - sin(alpha). -/
theorem apex_cross_section_minus_axis_offset
    (H s κ : ℝ) (hκ0 : 0 < κ) (hκ1 : κ < 1) :
    apexCrossSectionRadius H s κ - apexAxisOffset H s κ =
      H * (κ - s) / (1 + κ) := by
  unfold apexCrossSectionRadius apexCenterRadius apexAxisOffset
  have hleft : 0 < 1 - κ := by linarith
  have hright : 0 < 1 + κ := by linarith
  have hdenpos : 0 < 1 - κ ^ 2 := by
    nlinarith [mul_pos hleft hright]
  have hden : 1 - κ ^ 2 ≠ 0 := ne_of_gt hdenpos
  have hplus : 1 + κ ≠ 0 := ne_of_gt hright
  field_simp [hden, hplus]
  ring

/-- The local GCS axis-curvature radius is not, in general, the
    heliocentric apex-center radius. -/
theorem apex_axis_curvature_radius_ratio
    (H s κ : ℝ) (hH : H ≠ 0) (hκ0 : 0 < κ) (hκ1 : κ < 1)
    (hs : s + 2 * κ ^ 2 ≠ 0) (hsp : 1 + s ≠ 0) :
    apexAxisCurvatureRadius H s κ / apexCenterRadius H s κ =
      (s + κ ^ 2) ^ 2 / ((s + 2 * κ ^ 2) * (1 + s)) := by
  unfold apexAxisCurvatureRadius apexCenterRadius
  have hleft : 0 < 1 - κ := by linarith
  have hright : 0 < 1 + κ := by linarith
  have hdenpos : 0 < 1 - κ ^ 2 := by
    nlinarith [mul_pos hleft hright]
  have hden : 1 - κ ^ 2 ≠ 0 := ne_of_gt hdenpos
  field_simp [hH, hden, hs, hsp]

end HsHVerification.MeridianGCSAlgebra
