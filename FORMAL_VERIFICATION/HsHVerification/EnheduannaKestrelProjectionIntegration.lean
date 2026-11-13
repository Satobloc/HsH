import HsHVerification.EnheduannaBranchScopedMapComposition
import HsHVerification.KestrelProjectedIncidence

open HsHVerification.EnheduannaBranchScopedMapComposition
open HsHVerification.KestrelProjectedIncidence

/-!
# Conditional integration: branch composition and projected readout

This module connects two existing abstract contracts:
* branch-indexed maps compose only with matching intermediate branches
  and an explicit admissibility-compatibility witness;
* a projected overlap lifts to a source-space intersection only when
  the composed readout is injective.

Forward projection does not require injectivity. Reverse reconstruction
does. No physical source map, H(s)H worldtube, timesheet, medium law,
measurement, or empirical prediction is instantiated here.
-/

namespace HsHVerification.EnheduannaKestrelProjectionIntegration

universe u v w

variable {Branch : Type u} {Carrier : Branch → Type v}
variable {A B C : Branch}
variable {Y : Type w}

/-- Forward admissibility survives a two-stage, branch-compatible map. -/
theorem composed_branch_map_preserves_target
    (first : BranchMap Carrier A B)
    (second : BranchMap Carrier B C)
    (compatible : ∀ x, first.admissible x →
      second.admissible (first.apply x))
    (x : Carrier A)
    (hx : first.admissible x) :
    second.targetAdmissible (second.apply (first.apply x)) := by
  simpa [compose] using
    (compose_preserves_target first second compatible x hx)

/-- The composed readout is injective only under injectivity of both
branch transitions and the final observation map. -/
theorem composed_readout_injective
    (first : BranchMap Carrier A B)
    (second : BranchMap Carrier B C)
    (compatible : ∀ x, first.admissible x →
      second.admissible (first.apply x))
    (hFirst : Function.Injective first.apply)
    (hSecond : Function.Injective second.apply)
    (readout : Carrier C → Y)
    (hReadout : Function.Injective readout) :
    Function.Injective
      (readout ∘ (compose first second compatible).apply) := by
  intro x y h
  change readout (second.apply (first.apply x)) =
    readout (second.apply (first.apply y)) at h
  exact hFirst (hSecond (hReadout h))

/-- A genuine source intersection always appears as projected overlap
after the explicit branch-map composition. -/
theorem source_intersection_projects_through_composed_branch_map
    (first : BranchMap Carrier A B)
    (second : BranchMap Carrier B C)
    (compatible : ∀ x, first.admissible x →
      second.admissible (first.apply x))
    (readout : Carrier C → Y)
    (S T : Set (Carrier A)) :
    (readout ∘ (compose first second compatible).apply) '' (S ∩ T) ⊆
      ((readout ∘ (compose first second compatible).apply) '' S) ∩
      ((readout ∘ (compose first second compatible).apply) '' T) := by
  exact genuine_intersection_projects_to_overlap
    (readout ∘ (compose first second compatible).apply) S T

/-- The reverse implication requires injectivity of every stage.
This is a conditional theorem, not evidence that any physical readout
has those injectivity properties. -/
theorem projected_overlap_lifts_through_composed_branch_map
    (first : BranchMap Carrier A B)
    (second : BranchMap Carrier B C)
    (compatible : ∀ x, first.admissible x →
      second.admissible (first.apply x))
    (hFirst : Function.Injective first.apply)
    (hSecond : Function.Injective second.apply)
    (readout : Carrier C → Y)
    (hReadout : Function.Injective readout)
    (S T : Set (Carrier A)) :
    ((readout ∘ (compose first second compatible).apply) '' S) ∩
      ((readout ∘ (compose first second compatible).apply) '' T) ⊆
        (readout ∘ (compose first second compatible).apply) '' (S ∩ T) := by
  exact projected_overlap_lifts_if_injective
    (readout ∘ (compose first second compatible).apply)
    (composed_readout_injective first second compatible
      hFirst hSecond readout hReadout)
    S T

#print axioms composed_branch_map_preserves_target
#print axioms composed_readout_injective
#print axioms source_intersection_projects_through_composed_branch_map
#print axioms projected_overlap_lifts_through_composed_branch_map

end HsHVerification.EnheduannaKestrelProjectionIntegration
