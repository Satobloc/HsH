import Mathlib

/-!
# Nadir: moving-slice helix geometry

Source-critical status:
* Nathan Direct, raw conversation "DIMENSIONAL GRAVITY", conversation_id
  `252d05c0-22ed-4ea2-a474-7966ab13145a`, raw blob
  `2cea1924266418e19b825b95ae51e6b7cbace7e1`.
* Direct message `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` says the
  circular trace radius depends only on the separation of the axis and helix,
  not on pitch.
* Direct message `aaa2d0b1-017d-453e-b95a-b23915f87d32` says the point's
  angular speed depends on helix pitch and the moving-plane rate.
* The canonical parametric helix is supplied by the 2026-09-11
  *Rotoexpando Geometry: Definitions and Characterization* source,
  blob `5c21c6152482249e4432ded423b0040e70fc8b4f`:
  `gamma(theta) = (rho cos theta, rho sin theta, h theta)`.

The 2024 direct messages state the geometry in words, not as this equation.
This module is a symbolic reconstruction of the ideal helix/slice geometry.
It is not a physical calculation and does not assert that a physical filament
or Kerr worldtube is an ideal helix.
-/

namespace HsHVerification.NadirHelixSliceGeometry

/-- Phase at which the helix meets the plane z = z₀, for nonzero axial
advance h per radian. -/
def helixSlicePhase (h z : ℝ) (hh : h ≠ 0) : ℝ := z / h

/-- The transverse coordinates of the helix's intersection with z = z₀. -/
def helixSlicePoint (ρ h z : ℝ) (hh : h ≠ 0) : ℝ × ℝ :=
  (ρ * Real.cos (helixSlicePhase h z hh),
   ρ * Real.sin (helixSlicePhase h z hh))

/-- A nonzero-pitch helix meets a fixed orthogonal slice at a unique
parameter value θ = z₀ / h. -/
theorem helix_slice_parameter_unique
    (h z θ : ℝ) (hh : h ≠ 0) (hθ : h * θ = z) :
    θ = helixSlicePhase h z hh := by
  unfold helixSlicePhase
  calc
    θ = h * θ / h := by
      field_simp [hh] <;> ring
    _ = z / h := by rw [hθ]

/-- The squared distance from the axis point to the helix point in the
slice plane is ρ², independent of pitch h and slice position z. -/
theorem helix_slice_radius_sq
    (ρ h z : ℝ) (hh : h ≠ 0) :
    (helixSlicePoint ρ h z hh).1 ^ 2 +
      (helixSlicePoint ρ h z hh).2 ^ 2 = ρ ^ 2 := by
  simp [helixSlicePoint, helixSlicePhase]
  nlinarith [Real.sin_sq_add_cos_sq (z / h)]

/-- Changing pitch and slice position changes the phase but not the
squared transverse radius. -/
theorem helix_slice_radius_independent_of_pitch
    (ρ h₁ h₂ z₁ z₂ : ℝ)
    (hh₁ : h₁ ≠ 0) (hh₂ : h₂ ≠ 0) :
    (helixSlicePoint ρ h₁ z₁ hh₁).1 ^ 2 +
      (helixSlicePoint ρ h₁ z₁ hh₁).2 ^ 2 =
    (helixSlicePoint ρ h₂ z₂ hh₂).1 ^ 2 +
      (helixSlicePoint ρ h₂ z₂ hh₂).2 ^ 2 := by
  rw [helix_slice_radius_sq, helix_slice_radius_sq]

/-- The phase increment is linear in slice displacement and inversely
proportional to axial advance. -/
theorem helix_slice_phase_increment
    (h z₁ z₂ : ℝ) (hh : h ≠ 0) :
    helixSlicePhase h z₂ hh - helixSlicePhase h z₁ hh =
      (z₂ - z₁) / h := by
  unfold helixSlicePhase
  field_simp [hh]
  ring

/-- If the plane moves at constant coordinate rate v, the phase increment
over a time interval is v Δt / h. This is an algebraic increment statement,
not an empirical speed measurement. -/
theorem moving_slice_phase_increment
    (h v t₁ t₂ : ℝ) (hh : h ≠ 0) :
    helixSlicePhase h (v * t₂) hh -
      helixSlicePhase h (v * t₁) hh =
        (v * (t₂ - t₁)) / h := by
  unfold helixSlicePhase
  field_simp [hh]
  ring

#print axioms helix_slice_parameter_unique
#print axioms helix_slice_radius_sq
#print axioms helix_slice_radius_independent_of_pitch
#print axioms helix_slice_phase_increment
#print axioms moving_slice_phase_increment

end HsHVerification.NadirHelixSliceGeometry
