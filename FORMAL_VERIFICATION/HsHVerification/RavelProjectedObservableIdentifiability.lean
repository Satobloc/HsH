import Mathlib

/-!
# Ravel: projected-observable identifiability

This module separates a supplied geometric linearization from a supplied readout
linearization. If the local geometry map is G and the local readout is R, the
candidate observed linearization is R ∘ G, conditional on the usual chain-rule
model having been supplied for the concrete nonlinear maps.

The results are abstract linear algebra. They establish:
* the readout cannot remove a kernel direction already present in G;
* the composed observed map is injective exactly when G is injective and R
  separates points on the image of G;
* a nonzero geometric mode in the readout kernel makes the observed map
  noninjective.

The source archive does not yet supply a concrete geometry-to-readout map,
metric, instrument model, calibration, covariance, or measured system. No
physical map is instantiated here, and no physical prediction or fit is made.

Source custody (not an assertion that these source objects are equivalent):
* Nathan Direct Ravel source messages are preserved in the raw conversation
  export 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f, Git blob
  17cfe3feb830f70009557d063482b35adba0834b. Relevant user-role messages:
  3d0ad680-51db-4c79-ad4a-9bbacada24ef (spatial Kerr section extended along
  the filament), 638d13ba-1541-483d-853f-3b6d04b9b1b2 (primary co-theorist
  designation), c5639160-5631-4373-90c2-68d7c4c022de (conceptual cohesion,
  drift and epistemic hygiene), 5590d70d-6525-42aa-9de8-5a7022b189f7
  (accurate public record), and 4fb7a5be-a32d-43c0-b1a2-2c4787423b52
  (citation lineage).
* SAT-O1 standalone source:
  Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt,
  Git blob SHA-1 7577aa1ee5a6c3850ce3b226c75377de6367aedc.
  The file has no byline or internal date; first extant repository commit
  b543eb3fbf16e50500ceadad83dc9a7dc0759e5b is dated 2025-10-27T00:40:28Z.
* Blockwave source derivative:
  Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt,
  Git blob SHA-1 ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d.
  The corresponding assistant-authored source message is
  3039b226-02d4-41a3-a2d3-c338e25204a9 in conversation
  68f4d9b5-b908-832e-940e-6782db174a4a, dated 2025-10-19T12:31:03.318Z.
  The derivative's first extant HsH commit is
  6e4415f62616b19ae5cb677984c85d1985834d9d, dated 2026-10-08T02:42:49Z.
  The assistant-authored current/conservation equations remain source text,
  not Nathan Direct authority.

No SAT-O1 or Blockwave equation is corrected, replaced, or promoted by this
module. The linear maps below are a separate conditional formalization.
-/

namespace HsHVerification.RavelProjectedObservableIdentifiability

variable {V G O : Type*}
  [AddCommGroup V] [Module ℝ V]
  [AddCommGroup G] [Module ℝ G]
  [AddCommGroup O] [Module ℝ O]

/-- A readout projection cannot restore a parameter direction already in the
kernel of the geometric linearization. -/
theorem geometryKernel_le_observedKernel
    (geometryJacobian : V →ₗ[ℝ] G)
    (readoutJacobian : G →ₗ[ℝ] O) :
    LinearMap.ker geometryJacobian ≤
      LinearMap.ker (readoutJacobian.comp geometryJacobian) := by
  intro v hv
  change geometryJacobian v = 0 at hv
  change readoutJacobian (geometryJacobian v) = 0
  simp [hv]

/-- The composed observed map is injective exactly when the geometry map is
injective and the readout separates points on its image. -/
theorem observedInjective_iff_geometryInjective_and_readoutSeparatesImage
    (geometryJacobian : V →ₗ[ℝ] G)
    (readoutJacobian : G →ₗ[ℝ] O) :
    Function.Injective (readoutJacobian.comp geometryJacobian) ↔
      Function.Injective geometryJacobian ∧
        (∀ x y,
          x ∈ LinearMap.range geometryJacobian →
          y ∈ LinearMap.range geometryJacobian →
          readoutJacobian x = readoutJacobian y →
          x = y) := by
  constructor
  · intro hObserved
    refine ⟨?_, ?_⟩
    · intro v w hGeometry
      apply hObserved
      simpa [LinearMap.comp_apply] using congrArg readoutJacobian hGeometry
    · intro x y hx hy hReadout
      rcases LinearMap.mem_range.mp hx with ⟨v, hv⟩
      rcases LinearMap.mem_range.mp hy with ⟨w, hw⟩
      have hvw : v = w := hObserved (by
        simpa [LinearMap.comp_apply, hv, hw] using hReadout)
      calc
        x = geometryJacobian v := hv.symm
        _ = geometryJacobian w := by rw [hvw]
        _ = y := hw
  · rintro ⟨hGeometry, hReadout⟩ v w hObserved
    apply hGeometry
    exact hReadout (geometryJacobian v) (geometryJacobian w)
      (LinearMap.mem_range.mpr ⟨v, rfl⟩)
      (LinearMap.mem_range.mpr ⟨w, rfl⟩)
      (by simpa [LinearMap.comp_apply] using hObserved)

/-- Any nonzero geometric mode in the readout kernel destroys injectivity of
the composed observed map. -/
theorem readoutNullMode_in_geometryImage_forces_noninjectivity
    (geometryJacobian : V →ₗ[ℝ] G)
    (readoutJacobian : G →ₗ[ℝ] O)
    (hMode : ∃ x, x ∈ LinearMap.range geometryJacobian ∧
      x ≠ 0 ∧ readoutJacobian x = 0) :
    ¬ Function.Injective (readoutJacobian.comp geometryJacobian) := by
  rintro hObserved
  rcases hMode with ⟨x, hx, hx0, hReadoutZero⟩
  rcases LinearMap.mem_range.mp hx with ⟨v, hv⟩
  have hEqual :
      (readoutJacobian.comp geometryJacobian) v =
        (readoutJacobian.comp geometryJacobian) 0 := by
    simp [LinearMap.comp_apply, hv, hReadoutZero]
  have hv0 : v = 0 := hObserved hEqual
  apply hx0
  calc
    x = geometryJacobian v := hv.symm
    _ = geometryJacobian 0 := by rw [hv0]
    _ = 0 := by simp

/-- An abstract first-coordinate readout over integers, used only as a
computable mathematical counterexample. -/
def firstCoordinateReadoutInt : (ℤ × ℤ) →ₗ[ℤ] ℤ where
  toFun := Prod.fst
  map_add' := by
    intro x y
    rfl
  map_smul' := by
    intro c x
    rfl

/-- Even the identity geometry map can lose identifiability after a
non-injective readout. This is an abstract algebraic witness, not a physical
fixture. -/
theorem identityGeometry_then_firstCoordinateReadoutInt_not_injective :
    ¬ Function.Injective
      (firstCoordinateReadoutInt.comp (LinearMap.id ℤ (ℤ × ℤ))) := by
  intro hObserved
  have hEqual :
      (firstCoordinateReadoutInt.comp (LinearMap.id ℤ (ℤ × ℤ))) (0, 0) =
        (firstCoordinateReadoutInt.comp (LinearMap.id ℤ (ℤ × ℤ))) (0, 1) := by
    simp [firstCoordinateReadoutInt, LinearMap.comp_apply]
  have hPair : ((0, 0) : ℤ × ℤ) = (0, 1) := hObserved hEqual
  have hSecond : (0 : ℤ) = 1 := congrArg Prod.snd hPair
  norm_num at hSecond

#eval firstCoordinateReadoutInt (0, 1)
#eval firstCoordinateReadoutInt (0, 7)

#print axioms geometryKernel_le_observedKernel
#print axioms observedInjective_iff_geometryInjective_and_readoutSeparatesImage
#print axioms readoutNullMode_in_geometryImage_forces_noninjectivity
#print axioms identityGeometry_then_firstCoordinateReadoutInt_not_injective

end HsHVerification.RavelProjectedObservableIdentifiability
