import Mathlib

/-!
# Dependence identifiability beyond source provenance

Assistant reconstruction, 2026-11-25.

Motivation:
* Gao et al., "Copies or Sources?" (arXiv:2610.06192), distinguish
  restated copies from distinct readings and explicitly identify sources with
  shared failure modes as requiring a dependence-aware oracle.
* Wan et al., "Right Answers, Wrong States" (arXiv:2610.01244), identify
  settings in which source-level identifiability may be absent.
* Gong et al. (arXiv:2609.36855) manipulate peer-message exposure while holding
  receiver evidence fixed, separating message influence from evidence origin.
* Li et al. (arXiv:2609.35279v2) record correction and collapse as distinct
  signed transitions rather than relying on final accuracy alone.

This module formalizes one narrow identifiability boundary: a projection that
retains only source-root provenance cannot, in general, recover a separate
dependence relation when two admissible worlds have the same source projection
but different dependence relations.

The relation called `dependence` is abstract. This theorem does not define
probabilistic independence, estimate covariance, identify a real common cause,
or establish that any particular pair of LLM outputs is dependent. Those
claims require separately evidenced statistical or causal models.

No P1 trial, dataset expansion, protocol amendment, or manuscript edit is
performed by this formalization.
-/

namespace HsHVerification.OrsonDependenceIdentifiability

/-- Source-root membership retained by the provenance projection. -/
abbrev SourceProjection (Item Root : Type*) := Item → Root → Prop

/-- A separately specified pairwise dependence relation. -/
abbrev DependenceRelation (Item : Type*) := Item → Item → Prop

/-- A candidate evidence world contains provenance and dependence separately. -/
structure EvidenceWorld (Item Root : Type*) where
  sourceRoots : SourceProjection Item Root
  dependence : DependenceRelation Item

/--
Any resolver that is correct for every evidence world and receives only the
source-root projection must assign the same dependence relation to worlds
whose source projections are equal.
-/
theorem source_only_resolver_forces_same_dependence
    {Item Root : Type*}
    (resolve : SourceProjection Item Root → DependenceRelation Item)
    (hresolve : ∀ world : EvidenceWorld Item Root,
      resolve world.sourceRoots = world.dependence)
    (left right : EvidenceWorld Item Root)
    (sameSourceProjection : left.sourceRoots = right.sourceRoots) :
    left.dependence = right.dependence := by
  calc
    left.dependence = resolve left.sourceRoots := (hresolve left).symm
    _ = resolve right.sourceRoots := by rw [sameSourceProjection]
    _ = right.dependence := hresolve right

/--
If two candidate worlds preserve exactly the same source provenance but differ
in dependence, no resolver using source provenance alone can be correct for
both. The missing dependence information must be supplied or measured
separately; it cannot be reconstructed from this projection.
-/
theorem no_source_only_resolver_of_dependence_ambiguity
    {Item Root : Type*}
    (left right : EvidenceWorld Item Root)
    (sameSourceProjection : left.sourceRoots = right.sourceRoots)
    (differentDependence : left.dependence ≠ right.dependence) :
    ¬ ∃ resolve : SourceProjection Item Root → DependenceRelation Item,
      ∀ world : EvidenceWorld Item Root,
        resolve world.sourceRoots = world.dependence := by
  rintro ⟨resolve, hresolve⟩
  exact differentDependence
    (source_only_resolver_forces_same_dependence
      resolve hresolve left right sameSourceProjection)

#print axioms source_only_resolver_forces_same_dependence
#print axioms no_source_only_resolver_of_dependence_ambiguity

end HsHVerification.OrsonDependenceIdentifiability
