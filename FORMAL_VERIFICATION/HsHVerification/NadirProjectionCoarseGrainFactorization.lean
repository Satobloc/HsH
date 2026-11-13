import Mathlib

/-!
# Projection-compatible coarse-graining

This module formalizes a map-typing contract for nested representations.

Interpretation of the abstract types (not an assertion that physical maps
have already been constructed):

* Wf: a fine-scale 4D/worldtube representation;
* Of: its fine-scale projected/observed representation;
* Wc: a coarse-grained 4D/worldtube representation;
* Oc: the projection/readout space of the coarse representation;
* P: fine representation -> fine projected image;
* C4: fine 4D representation -> coarse 4D representation;
* Pcoarse: coarse 4D representation -> coarse projected/readout space;
* C3: the induced coarse-graining on the image of P.

The central result is exact: an induced C3 satisfying
  Pcoarse ∘ C4 = C3 ∘ P
exists on the image of P iff Pcoarse ∘ C4 is constant on every fibre of P.
It is unique there. No surjectivity onto an ambient observation space is
assumed; the codomain is Set.range P.

This is a structural theorem about typed maps. It does not construct P, C4,
or Pcoarse from a physical worldtube, timesheet, instrument, or dataset.
It does not establish a physical commutation law, a measured observable, or
an H(s)H prediction. If the fibre condition fails, the theorem says that no
single-valued deterministic C3 on the projected image can preserve the
coarse-projected result. Interpreting that failure physically would require
an independently specified observable, acquisition map, and uncertainty
model.
-/

namespace HsHVerification.NadirProjectionCoarseGrainFactorization

universe u v w z

variable {Wf : Type u} {Of : Type v} {Wc : Type w} {Oc : Type z}

/-- Restrict the fine projection codomain to its actual image. -/
def imageProjection (P : Wf → Of) (w : Wf) : Set.range P :=
  ⟨P w, ⟨w, rfl⟩⟩

/-- The image-restricted projection is surjective by construction. -/
theorem imageProjection_surjective (P : Wf → Of) :
    Function.Surjective (imageProjection P) := by
  intro y
  rcases y.property with ⟨w, hw⟩
  refine ⟨w, ?_⟩
  apply Subtype.ext
  exact hw

/--
Choose a representative of an observed image point and evaluate the
coarse-projected result there. Fibre constancy, when it holds, makes the
choice immaterial.
-/
noncomputable def inducedCoarseGraining
    (P : Wf → Of) (C4 : Wf → Wc) (Pcoarse : Wc → Oc) :
    Set.range P → Oc :=
  fun y => Pcoarse (C4 (Classical.choose y.property))

/-- The induced map makes the projection/coarse-graining square commute. -/
theorem inducedCoarseGraining_factors
    (P : Wf → Of) (C4 : Wf → Wc) (Pcoarse : Wc → Oc)
    (hFiber : ∀ x y, P x = P y →
      Pcoarse (C4 x) = Pcoarse (C4 y)) :
    ∀ w, inducedCoarseGraining P C4 Pcoarse
      (imageProjection P w) = Pcoarse (C4 w) := by
  intro w
  have hmem : P w ∈ Set.range P := ⟨w, rfl⟩
  simpa [inducedCoarseGraining, imageProjection] using
    (hFiber (Classical.choose hmem) w (Classical.choose_spec hmem))

/--
Necessary and sufficient condition for a deterministic coarse-graining to
descend through the fine projection. The theorem is restricted to the actual
image of P, so it does not assume that P covers an independently declared
ambient observation space.
-/
theorem factorization_iff_fiberwise
    (P : Wf → Of) (C4 : Wf → Wc) (Pcoarse : Wc → Oc) :
    (∃ C3 : Set.range P → Oc,
      ∀ w, C3 (imageProjection P w) = Pcoarse (C4 w)) ↔
    (∀ x y, P x = P y →
      Pcoarse (C4 x) = Pcoarse (C4 y)) := by
  constructor
  · rintro ⟨C3, hC3⟩ x y hxy
    calc
      Pcoarse (C4 x) = C3 (imageProjection P x) := (hC3 x).symm
      _ = C3 (imageProjection P y) :=
        congrArg C3 (Subtype.ext hxy)
      _ = Pcoarse (C4 y) := hC3 y
  · intro hFiber
    exact ⟨inducedCoarseGraining P C4 Pcoarse,
      inducedCoarseGraining_factors P C4 Pcoarse hFiber⟩

/-- The induced coarse-graining is unique on the projected image. -/
theorem inducedCoarseGraining_unique
    (P : Wf → Of) (C4 : Wf → Wc) (Pcoarse : Wc → Oc)
    (f g : Set.range P → Oc)
    (hf : ∀ w, f (imageProjection P w) = Pcoarse (C4 w))
    (hg : ∀ w, g (imageProjection P w) = Pcoarse (C4 w)) :
    f = g := by
  funext y
  rcases y.property with ⟨w, hw⟩
  have hproj : imageProjection P w = y := by
    apply Subtype.ext
    exact hw
  calc
    f y = f (imageProjection P w) := by rw [hproj]
    _ = Pcoarse (C4 w) := hf w
    _ = g (imageProjection P w) := (hg w).symm
    _ = g y := by rw [hproj]

/-- A fibre mismatch rules out every deterministic induced coarse-graining. -/
theorem no_inducedCoarseGraining_of_fiber_mismatch
    (P : Wf → Of) (C4 : Wf → Wc) (Pcoarse : Wc → Oc)
    (x y : Wf) (hxy : P x = P y)
    (hMismatch : Pcoarse (C4 x) ≠ Pcoarse (C4 y)) :
    ¬ ∃ C3 : Set.range P → Oc,
      ∀ w, C3 (imageProjection P w) = Pcoarse (C4 w) := by
  intro hExists
  have hFiber := (factorization_iff_fiberwise P C4 Pcoarse).mp hExists
  exact hMismatch (hFiber x y hxy)

#print axioms imageProjection_surjective
#print axioms inducedCoarseGraining_factors
#print axioms factorization_iff_fiberwise
#print axioms inducedCoarseGraining_unique
#print axioms no_inducedCoarseGraining_of_fiber_mismatch

end HsHVerification.NadirProjectionCoarseGrainFactorization
