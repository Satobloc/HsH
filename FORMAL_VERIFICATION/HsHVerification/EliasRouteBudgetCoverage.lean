import Mathlib

namespace HsHVerification
namespace EliasRouteBudgetCoverage

/-!
A proposed, source-adjacent contract for bounded source routing.

A wake may select at most `budget` route families. Required routes must never
disappear silently: each is selected, explicitly deferred, or explicitly marked
unrepresented. A route plan is complete for one wave only when every required
route is selected and no required route is unrepresented.

This is an abstract allocation contract, not a formal translation of the
private Python prototype and not evidence that any source was actually read.
The task examples below are analyst-classified from live HsH task records.
-/

inductive Route where
  | warRoom
  | hshCommon
  | archive
  | instanceWorkspaces
  | capabilityDirectory
  | externalEvidence
  | dashboardPlans
  | preferenceRuntime
  deriving DecidableEq, Repr

structure RoutePlan where
  required : Finset Route
  selected : Finset Route
  deferred : Finset Route
  unrepresented : Finset Route
  budget : Nat
  selectedWithinBudget : selected.card ≤ budget
  selectedDeferredDisjoint : Disjoint selected deferred
  selectedUnrepresentedDisjoint : Disjoint selected unrepresented
  deferredUnrepresentedDisjoint : Disjoint deferred unrepresented
  requiredAccounted :
    required ⊆ selected ∪ deferred ∪ unrepresented

def oneWaveComplete (p : RoutePlan) : Prop :=
  p.required ⊆ p.selected ∧ p.unrepresented = ∅

theorem selected_respects_budget (p : RoutePlan) :
    p.selected.card ≤ p.budget :=
  p.selectedWithinBudget

theorem required_routes_are_accounted_for (p : RoutePlan) :
    p.required ⊆ p.selected ∪ p.deferred ∪ p.unrepresented :=
  p.requiredAccounted

/-- Every required route receives exactly one explicit disposition:
    selected, deferred, or unrepresented. Pairwise disjointness prevents
    double-counting; requiredAccounted prevents silent omission. -/
theorem required_route_has_exactly_one_disposition
    (p : RoutePlan) (r : Route) (hr : r ∈ p.required) :
    (r ∈ p.selected ∧ r ∉ p.deferred ∧ r ∉ p.unrepresented) ∨
    (r ∈ p.deferred ∧ r ∉ p.selected ∧ r ∉ p.unrepresented) ∨
    (r ∈ p.unrepresented ∧ r ∉ p.selected ∧ r ∉ p.deferred) := by
  have hAccounted : r ∈ p.selected ∪ p.deferred ∪ p.unrepresented :=
    p.requiredAccounted hr
  rcases Finset.mem_union.mp hAccounted with hSelectedDeferred | hUnrepresented
  · rcases Finset.mem_union.mp hSelectedDeferred with hSelected | hDeferred
    · left
      refine ⟨hSelected, ?_, ?_⟩
      · intro hDeferred
        exact (Finset.disjoint_left.mp p.selectedDeferredDisjoint) hSelected hDeferred
      · intro hUnrepresented
        exact (Finset.disjoint_left.mp p.selectedUnrepresentedDisjoint) hSelected hUnrepresented
    · right
      left
      refine ⟨hDeferred, ?_, ?_⟩
      · intro hSelected
        exact (Finset.disjoint_left.mp p.selectedDeferredDisjoint) hSelected hDeferred
      · intro hUnrepresented
        exact (Finset.disjoint_left.mp p.deferredUnrepresentedDisjoint) hDeferred hUnrepresented
  · right
    right
    refine ⟨hUnrepresented, ?_, ?_⟩
    · intro hSelected
      exact (Finset.disjoint_left.mp p.selectedUnrepresentedDisjoint) hSelected hUnrepresented
    · intro hDeferred
      exact (Finset.disjoint_left.mp p.deferredUnrepresentedDisjoint) hDeferred hUnrepresented

#print axioms required_route_has_exactly_one_disposition

theorem complete_plan_required_count_within_budget
    (p : RoutePlan)
    (hcomplete : oneWaveComplete p) :
    p.required.card ≤ p.budget := by
  exact le_trans (Finset.card_le_card hcomplete.1) p.selectedWithinBudget

theorem required_over_budget_cannot_fit_one_wave
    (p : RoutePlan)
    (h : p.budget < p.required.card) :
    ¬ oneWaveComplete p := by
  intro hcomplete
  have hfit := complete_plan_required_count_within_budget p hcomplete
  omega

theorem required_deferred_route_blocks_one_wave
    (p : RoutePlan)
    (h : ∃ r, r ∈ p.required ∧ r ∈ p.deferred) :
    ¬ oneWaveComplete p := by
  intro hcomplete
  rcases h with ⟨r, hrRequired, hrDeferred⟩
  exact
    (Finset.disjoint_left.mp p.selectedDeferredDisjoint)
      (hcomplete.1 hrRequired) hrDeferred

theorem required_unrepresented_route_blocks_one_wave
    (p : RoutePlan)
    (h : ∃ r, r ∈ p.required ∧ r ∈ p.unrepresented) :
    ¬ oneWaveComplete p := by
  intro hcomplete
  rcases h with ⟨r, _hrRequired, hrUnrepresented⟩
  have hrNotUnrepresented : r ∉ p.unrepresented := by
    simpa [hcomplete.2]
  exact hrNotUnrepresented hrUnrepresented

/-- Math Hopper: five required families, four slots, one explicit deferral. -/
def mathHopperPlan : RoutePlan where
  required :=
    { Route.warRoom, Route.hshCommon, Route.archive,
      Route.instanceWorkspaces, Route.capabilityDirectory }
  selected :=
    { Route.warRoom, Route.hshCommon, Route.archive,
      Route.capabilityDirectory }
  deferred := { Route.instanceWorkspaces }
  unrepresented := ∅
  budget := 4
  selectedWithinBudget := by decide
  selectedDeferredDisjoint := by decide
  selectedUnrepresentedDisjoint := by decide
  deferredUnrepresentedDisjoint := by decide
  requiredAccounted := by decide

/-- Code Grurple: four required families fit the four-slot allocation. -/
def codeGrurplePlan : RoutePlan where
  required :=
    { Route.hshCommon, Route.archive, Route.instanceWorkspaces,
      Route.capabilityDirectory }
  selected :=
    { Route.hshCommon, Route.archive, Route.instanceWorkspaces,
      Route.capabilityDirectory }
  deferred := ∅
  unrepresented := ∅
  budget := 4
  selectedWithinBudget := by decide
  selectedDeferredDisjoint := by decide
  selectedUnrepresentedDisjoint := by decide
  deferredUnrepresentedDisjoint := by decide
  requiredAccounted := by decide

/-- Clone census: four required families fit, pending actual source-read receipts. -/
def cloneCensusPlan : RoutePlan where
  required :=
    { Route.hshCommon, Route.instanceWorkspaces, Route.capabilityDirectory,
      Route.archive }
  selected :=
    { Route.hshCommon, Route.instanceWorkspaces, Route.capabilityDirectory,
      Route.archive }
  deferred := ∅
  unrepresented := ∅
  budget := 4
  selectedWithinBudget := by decide
  selectedDeferredDisjoint := by decide
  selectedUnrepresentedDisjoint := by decide
  deferredUnrepresentedDisjoint := by decide
  requiredAccounted := by decide

/-- P2: the prototype's current route ontology does not represent external evidence. -/
def p2MeasuredSystemPlan : RoutePlan where
  required :=
    { Route.externalEvidence, Route.hshCommon, Route.archive,
      Route.capabilityDirectory, Route.instanceWorkspaces }
  selected :=
    { Route.hshCommon, Route.archive, Route.capabilityDirectory,
      Route.instanceWorkspaces }
  deferred := ∅
  unrepresented := { Route.externalEvidence }
  budget := 4
  selectedWithinBudget := by decide
  selectedDeferredDisjoint := by decide
  selectedUnrepresentedDisjoint := by decide
  deferredUnrepresentedDisjoint := by decide
  requiredAccounted := by decide

theorem mathHopper_needs_deferred_wave :
    ¬ oneWaveComplete mathHopperPlan := by
  apply required_deferred_route_blocks_one_wave
  exact ⟨Route.instanceWorkspaces, by decide, by decide⟩

theorem codeGrurple_one_wave_covers_required :
    oneWaveComplete codeGrurplePlan := by
  simp [oneWaveComplete, codeGrurplePlan]

theorem cloneCensus_one_wave_covers_required :
    oneWaveComplete cloneCensusPlan := by
  simp [oneWaveComplete, cloneCensusPlan]

theorem p2_blocked_by_unrepresented_external_evidence :
    ¬ oneWaveComplete p2MeasuredSystemPlan := by
  apply required_unrepresented_route_blocks_one_wave
  exact ⟨Route.externalEvidence, by decide, by decide⟩

end EliasRouteBudgetCoverage
end HsHVerification
