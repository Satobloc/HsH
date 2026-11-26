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


/-!
# Self-report construct separation (assistant reconstruction)

External primary comparators:
* Singh, Linzen & Ravfogel, "Can LLMs Introspect? A Reality Check"
  (arXiv:2605.26242, COLM 2026): privileged access and second-order
  computation are separate requirements; behavior alone is insufficient.
* Atkinson, Plunkett & Bau, "Identifying Introspection From the Inside"
  (arXiv:2610.07186, COLM 2026): separates behavioral faithfulness from
  causal grounding and supplies a mechanistic test in a controlled setting.

The finite readout model below has one observed state (false). A behavior
function and a report function can agree on that observed support while
disagreeing under the intervention/state change to true. This is a logical
counterexample to inferring counterfactual alignment from observed agreement.

The second witness reuses the source-projection/dependence theorem above:
two worlds can preserve the same observed projection while carrying different
abstract dependence relations. The relation is a declared mathematical token,
not a measured or mechanistic causal graph.

These are formal counterexamples only. They do not establish that any actual
LLM is ungrounded, that a particular report is confabulated, or that a model
has or lacks consciousness. They do not prove second-order representation.
They do not modify the frozen P1 protocol, issue #564, PR #850, any dataset,
trial, manuscript, or paper gate.
-/

namespace HsHVerification.OrsonSelfReportEvidence

/-- First-order task behavior and verbal self-report as functions of a state. -/
structure ReadoutFunctions where
  behavior : Bool → Bool
  report : Bool → Bool

/-- Only the false state is represented in the observed sample. -/
def observedSupport (state : Bool) : Prop := state = false

/-- Report and behavior agree on every state in the observed support. -/
def observedAgreement (m : ReadoutFunctions) : Prop :=
  ∀ state, observedSupport state → m.behavior state = m.report state

/-- A deliberately weak counterfactual-alignment condition. It is not a
    definition of mechanistic grounding or second-order representation. -/
def counterfactualAgreement (m : ReadoutFunctions) : Prop :=
  ∀ state, m.behavior state = m.report state

/-- Two readout systems are observationally equivalent on the declared support. -/
def sameObservedOutputs (left right : ReadoutFunctions) : Prop :=
  ∀ state, observedSupport state →
    left.behavior state = right.behavior state ∧
    left.report state = right.report state

/-- Both channels follow the state in every condition. -/
def alignedReadout : ReadoutFunctions :=
  ⟨id, id⟩

/-- Behavior follows the state, but the report is a constant that happens
    to agree on the only observed state. This is an input-driven bypass witness. -/
def bypassReadout : ReadoutFunctions :=
  ⟨id, fun _ => false⟩

theorem aligned_readout_observed_agreement :
    observedAgreement alignedReadout := by
  intro state hObserved
  rfl

theorem bypass_readout_observed_agreement :
    observedAgreement bypassReadout := by
  intro state hObserved
  have hFalse : state = false := by
    simpa [observedSupport] using hObserved
  subst state
  rfl

theorem readouts_same_on_observed_support :
    sameObservedOutputs alignedReadout bypassReadout := by
  intro state hObserved
  have hFalse : state = false := by
    simpa [observedSupport] using hObserved
  subst state
  exact ⟨rfl, rfl⟩

theorem aligned_readout_counterfactually_agrees :
    counterfactualAgreement alignedReadout := by
  intro state
  rfl

theorem bypass_readout_not_counterfactually_aligned :
    ¬ counterfactualAgreement bypassReadout := by
  intro hAligned
  have hAtTrue := hAligned true
  simp [counterfactualAgreement, bypassReadout] at hAtTrue

/-- Observational equivalence and perfect in-sample fidelity do not identify
    counterfactual alignment outside the observed support. -/
theorem observed_fidelity_does_not_identify_counterfactual_alignment :
    sameObservedOutputs alignedReadout bypassReadout ∧
    observedAgreement alignedReadout ∧
    observedAgreement bypassReadout ∧
    counterfactualAgreement alignedReadout ∧
    ¬ counterfactualAgreement bypassReadout := by
  exact ⟨
    readouts_same_on_observed_support,
    aligned_readout_observed_agreement,
    bypass_readout_observed_agreement,
    aligned_readout_counterfactually_agrees,
    bypass_readout_not_counterfactually_aligned
  ⟩

/-- The abstract dependence witness uses the same observed projection for
    behavior and report, but assigns different dependence relations. -/
inductive ReadoutChannel where
  | behavior
  | selfReport
  deriving DecidableEq, Repr

open HsHVerification.OrsonDependenceIdentifiability

def observedReadoutProjection : SourceProjection ReadoutChannel Bool :=
  fun _ observedRoot => observedRoot = false

def groundedReadoutDependence : DependenceRelation ReadoutChannel :=
  fun left right =>
    (left = .behavior ∧ right = .selfReport) ∨
    (left = .selfReport ∧ right = .behavior)

def bypassReadoutDependence : DependenceRelation ReadoutChannel :=
  fun _ _ => False

def groundedReadoutWorld : EvidenceWorld ReadoutChannel Bool :=
  ⟨observedReadoutProjection, groundedReadoutDependence⟩

def bypassReadoutWorld : EvidenceWorld ReadoutChannel Bool :=
  ⟨observedReadoutProjection, bypassReadoutDependence⟩

theorem readout_worlds_share_observed_projection :
    groundedReadoutWorld.sourceRoots = bypassReadoutWorld.sourceRoots := by
  rfl

theorem readout_worlds_have_different_dependence :
    groundedReadoutWorld.dependence ≠ bypassReadoutWorld.dependence := by
  intro h
  have hEdge := congrFun (congrFun h ReadoutChannel.behavior) ReadoutChannel.selfReport
  simp [groundedReadoutDependence, bypassReadoutDependence] at hEdge

theorem no_observation_only_grounding_resolver :
    ¬ ∃ resolve : SourceProjection ReadoutChannel Bool →
      DependenceRelation ReadoutChannel,
      ∀ world : EvidenceWorld ReadoutChannel Bool,
        resolve world.sourceRoots = world.dependence := by
  exact no_source_only_resolver_of_dependence_ambiguity
    groundedReadoutWorld bypassReadoutWorld
    readout_worlds_share_observed_projection
    readout_worlds_have_different_dependence

#eval decide (observedAgreement alignedReadout)
#eval decide (observedAgreement bypassReadout)
#eval decide (counterfactualAgreement alignedReadout)
#eval decide (counterfactualAgreement bypassReadout)

#print axioms aligned_readout_observed_agreement
#print axioms bypass_readout_observed_agreement
#print axioms readouts_same_on_observed_support
#print axioms aligned_readout_counterfactually_agrees
#print axioms bypass_readout_not_counterfactually_aligned
#print axioms observed_fidelity_does_not_identify_counterfactual_alignment
#print axioms readout_worlds_share_observed_projection
#print axioms readout_worlds_have_different_dependence
#print axioms no_observation_only_grounding_resolver

end HsHVerification.OrsonSelfReportEvidence
