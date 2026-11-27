import Mathlib
import HsHVerification.NadirHelixSliceGeometry

/-!
# Helix cross-section projection and slice-coordinate recovery

Primary source: Nathan Direct, "DIMENSIONAL GRAVITY", conversation
252d05c0-22ed-4ea2-a474-7966ab13145a, raw HsH blob
2cea1924266418e19b825b95ae51e6b7cbace7e1, 2024-03-22.

Relevant user-role messages:
- aaa28bd9-07f7-4740-b878-b485d4db44d0: straight axis and helical line.
- aaa2269b-7eab-4781-9454-647098d6747f: a fixed transverse plane meets
  each line at one point; the helix does not draw a spiral in that plane.
- aaa2d0b1-017d-453e-b95a-b23915f87d32: a moving plane makes the
  helical intersection trace a circular path.
- aaa2a1cc-e884-4f6a-800f-8afc29ab221a: orbit radius is independent of
  pitch and equals the helix's distance from its axis.

The parameterization below is the same assistant-reconstructed ideal
constant-pitch helix used by NadirHelixSliceGeometry. Nathan's messages are
descriptive, not these equations. This module adds an observation-map
analysis: the 2D cross-section projection is periodic and loses turn/slice
position; adjoining the axial slice coordinate restores injectivity when
pitch is nonzero.

This is a conditional geometric result for an ideal 3D helix. It does not
identify a physical H(s)H worldtube, a curved timesheet, a material contact
law, or an empirical readout. The slice coordinate is not identified with
time without an additional source-defined map.
-/

namespace HsHVerification.AriadneHelixProjectionFactorization

noncomputable section

open HsHVerification.NadirHelixSliceGeometry

/-- The two-dimensional cross-section point of the ideal circular helix. -/
def crossSectionPoint (r phase : ℝ) : ℝ × ℝ :=
  (r * Real.cos phase, r * Real.sin phase)

/-- Axial coordinate, with pitch defined as rise per full 2*pi turn. -/
def axialSliceCoordinate (pitch phase : ℝ) : ℝ :=
  pitch * phase / (2 * Real.pi)

/-- The cross-section projection repeats after one full revolution. -/
theorem crossSectionPoint_turn_periodic (r phase : ℝ) :
    crossSectionPoint r (phase + 2 * Real.pi) =
      crossSectionPoint r phase := by
  ext <;> simp [crossSectionPoint, Real.cos_add, Real.sin_add,
    Real.cos_two_pi, Real.sin_two_pi]

/-- One full turn advances the axial slice coordinate by exactly one pitch. -/
theorem axialSliceCoordinate_turn_increment (pitch phase : ℝ) :
    axialSliceCoordinate pitch (phase + 2 * Real.pi) =
      axialSliceCoordinate pitch phase + pitch := by
  unfold axialSliceCoordinate
  have h2pi : 2 * Real.pi ≠ 0 := by positivity
  field_simp [h2pi]

/-- A nonzero pitch makes the axial coordinate distinguish successive turns. -/
theorem axialSliceCoordinate_turn_changes
    (pitch phase : ℝ) (hpitch : pitch ≠ 0) :
    axialSliceCoordinate pitch (phase + 2 * Real.pi) ≠
      axialSliceCoordinate pitch phase := by
  rw [axialSliceCoordinate_turn_increment]
  intro h
  apply hpitch
  linarith

/-- A same-cross-section/different-slice witness for every nonzero-pitch helix. -/
theorem helix_turn_fiber_witness
    (r pitch phase : ℝ) (hpitch : pitch ≠ 0) :
    crossSectionPoint r (phase + 2 * Real.pi) =
      crossSectionPoint r phase ∧
    axialSliceCoordinate pitch (phase + 2 * Real.pi) ≠
      axialSliceCoordinate pitch phase :=
  ⟨crossSectionPoint_turn_periodic r phase,
   axialSliceCoordinate_turn_changes pitch phase hpitch⟩

/-- The cross-section projection alone is not injective. -/
theorem crossSectionPoint_not_injective (r : ℝ) :
    ¬ Function.Injective (crossSectionPoint r) := by
  intro hinj
  have hfiber := crossSectionPoint_turn_periodic r 0
  have hturn : (0 : ℝ) + 2 * Real.pi = 0 := hinj hfiber
  have h2pi : (2 * Real.pi : ℝ) ≠ 0 := by positivity
  apply h2pi
  linarith

/-- A readout that distinguishes one-turn-separated phases cannot be represented
    by the 2D cross-section point alone. -/
theorem turn_sensitive_readout_not_factorable_through_cross_section
    {Readout : Type*}
    (r : ℝ) (readout : ℝ → Readout)
    (hturn : ∃ phase,
      readout (phase + 2 * Real.pi) ≠ readout phase) :
    ¬ ∃ decode : (ℝ × ℝ) → Readout, ∀ phase,
      readout phase = decode (crossSectionPoint r phase) := by
  rintro ⟨decode, hdecode⟩
  rcases hturn with ⟨phase, hne⟩
  have heq : readout (phase + 2 * Real.pi) = readout phase := by
    calc
      readout (phase + 2 * Real.pi) =
          decode (crossSectionPoint r (phase + 2 * Real.pi)) := hdecode _
      _ = decode (crossSectionPoint r phase) :=
        congrArg decode (crossSectionPoint_turn_periodic r phase)
      _ = readout phase := (hdecode phase).symm
  exact hne heq

/-- The slice-resolved observation retains both the cross-section point and
    its axial coordinate. -/
def sliceResolvedObservation (r pitch phase : ℝ) : (ℝ × ℝ) × ℝ :=
  (crossSectionPoint r phase, axialSliceCoordinate pitch phase)

/-- The axial coordinate is injective for nonzero pitch. -/
theorem axialSliceCoordinate_injective
    (pitch : ℝ) (hpitch : pitch ≠ 0) :
    Function.Injective (axialSliceCoordinate pitch) := by
  intro a b h
  have h2pi : 2 * Real.pi ≠ 0 := by positivity
  have h' := h
  unfold axialSliceCoordinate at h'
  field_simp [hpitch, h2pi] at h'
  exact h'

/-- Adding the slice coordinate restores injectivity of the ideal helix
    parameterization when pitch is nonzero. -/
theorem sliceResolvedObservation_injective
    (r pitch : ℝ) (hpitch : pitch ≠ 0) :
    Function.Injective (sliceResolvedObservation r pitch) := by
  intro a b h
  apply axialSliceCoordinate_injective pitch hpitch
  exact congrArg Prod.snd h

/-- Every phase readout can be reconstructed from the slice-resolved
    observation because its nonzero-pitch axial coordinate has an explicit
    inverse. The cross-section point is retained but is not needed for this
    injectivity result. -/
theorem readout_factors_through_slice_resolved_observation
    {Readout : Type*}
    (r pitch : ℝ) (hpitch : pitch ≠ 0)
    (readout : ℝ → Readout) :
    ∃ decode : ((ℝ × ℝ) × ℝ) → Readout, ∀ phase,
      readout phase = decode (sliceResolvedObservation r pitch phase) := by
  let decode : ((ℝ × ℝ) × ℝ) → Readout :=
    fun observation =>
      readout (observation.2 * (2 * Real.pi) / pitch)
  refine ⟨decode, ?_⟩
  intro phase
  have h2pi : 2 * Real.pi ≠ 0 := by positivity
  have hphase :
      axialSliceCoordinate pitch phase * (2 * Real.pi) / pitch = phase := by
    unfold axialSliceCoordinate
    field_simp [hpitch, h2pi]
  dsimp [decode, sliceResolvedObservation]
  rw [hphase]

#print axioms crossSectionPoint_turn_periodic
#print axioms axialSliceCoordinate_turn_increment
#print axioms axialSliceCoordinate_turn_changes
#print axioms helix_turn_fiber_witness
#print axioms crossSectionPoint_not_injective
#print axioms turn_sensitive_readout_not_factorable_through_cross_section
#print axioms axialSliceCoordinate_injective
#print axioms sliceResolvedObservation_injective
#print axioms readout_factors_through_slice_resolved_observation

end
end HsHVerification.AriadneHelixProjectionFactorization
