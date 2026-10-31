import Mathlib

/-!
# Projected incidence is not physical intersection
Source-conditioned formalization for Workshop Relay Kestrel, 2026-10-29.
Historical source: SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/
FINDING THE DONUT (nolat).txt, Git blob a788b5cc415f90de2d0382d3596ef07d68604687,
pp. 24-27, and user-role verified 2026-09-07 Ravel conversation,
message 496a15ea-0263-459d-b815-908f52155b90.
Theorems are standard set-map geometry, NOT proof of Nathan's proposed
physical correspondence, actual curve intersection, or a causal mechanism.
-/

namespace HsHVerification.KestrelProjectedIncidence

variable {X Y : Type*}

/-- Genuine source-space intersection always yields projected overlap. -/
theorem genuine_intersection_projects_to_overlap
    (p : X → Y) (A B : Set X) :
    p '' (A ∩ B) ⊆ (p '' A) ∩ (p '' B) := by
  rintro y ⟨x, hx, rfl⟩
  exact ⟨⟨x, hx.1, rfl⟩, ⟨x, hx.2, rfl⟩⟩

/-- Reversing projected overlap to a common source point is guaranteed
by injectivity (or by a suitable fiber-separation condition for the
particular source sets). -/
theorem projected_overlap_lifts_if_injective
    (p : X → Y) (hp : Function.Injective p) (A B : Set X) :
    (p '' A) ∩ (p '' B) ⊆ p '' (A ∩ B) := by
  rintro y ⟨⟨x, hx, hxy⟩, ⟨z, hz, hzy⟩⟩
  have hxz : x = z := hp (hxy.trans hzy.symm)
  refine ⟨x, ⟨hx, ?_⟩, hxy⟩
  simpa only [hxz] using hz

/-- Disjoint material sets stay disjoint in the readout if the map
is injective; ordinary 4D-to-3D projection is not assumed injective. -/
theorem disjointness_preserved_if_injective
    (p : X → Y) (hp : Function.Injective p) (A B : Set X)
    (hdisj : Disjoint A B) :
    Disjoint (p '' A) (p '' B) := by
  apply Set.disjoint_left.mpr
  intro y hyA hyB
  obtain ⟨x, hx, _⟩ :=
    projected_overlap_lifts_if_injective p hp A B ⟨hyA, hyB⟩
  exact (Set.disjoint_left.mp hdisj) hx.1 hx.2

/-- Abstract finite-set counterexample, not a physical fixture:
a non-injective readout can make disjoint source sets appear to overlap. -/
def collapsedReadout : Fin 2 → Fin 1 := fun _ => 0

def leftSource : Set (Fin 2) := {0}
def rightSource : Set (Fin 2) := {1}

theorem noninjective_readout_can_create_spurious_overlap :
    ((collapsedReadout '' leftSource) ∩
      (collapsedReadout '' rightSource)).Nonempty ∧
      leftSource ∩ rightSource = ∅ := by
  constructor
  · refine ⟨0, ?_⟩
    constructor
    · exact ⟨0, by simp [leftSource], by simp [collapsedReadout]⟩
    · exact ⟨1, by simp [rightSource], by simp [collapsedReadout]⟩
  · ext x
    simp [leftSource, rightSource]
    omega

/-- Two distinct source sets can have exactly the same non-injective
readout, so inverse reconstruction is not unique in general. -/
theorem distinct_sources_can_have_same_readout :
    leftSource ≠ rightSource ∧
      collapsedReadout '' leftSource =
        collapsedReadout '' rightSource := by
  constructor
  · intro h
    have h0 : (0 : Fin 2) ∈ rightSource := by
      simpa [h] using (show (0 : Fin 2) ∈ leftSource by simp [leftSource])
    simp [rightSource] at h0
  · simp [collapsedReadout, leftSource, rightSource]

#print axioms genuine_intersection_projects_to_overlap
#print axioms projected_overlap_lifts_if_injective
#print axioms disjointness_preserved_if_injective
#print axioms noninjective_readout_can_create_spurious_overlap
#print axioms distinct_sources_can_have_same_readout

end HsHVerification.KestrelProjectedIncidence
