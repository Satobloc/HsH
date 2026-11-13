import Mathlib

namespace HsHVerification.ObservableProjection

/-!
This module formalizes a generic projection fact relevant to two candidate maps
in LLM cognition and handoff research:

1. A complete handoff state may be mapped to an action-relevant state selected
   by a task/action contract.
2. A complete cognitive-system state may be mapped to observable behavior or
   language.

The module does not assert that either map is non-injective in any actual
system. It does not equate retention, availability, access, comprehension,
decision uptake, action support, execution, outcome, or subjective experience.
It proves only the stated consequences of explicit mathematical assumptions.
-/

/-- A state supports an action contract when its projected state satisfies it. -/
def actionSupported {State Action : Type*}
    (project : State → Action)
    (contract : Action → Prop)
    (state : State) : Prop :=
  contract (project state)

/-- Equal projected states have identical truth values for every predicate
    defined only on the projection. -/
theorem same_projection_same_contract_status
    {State Action : Type*}
    (project : State → Action)
    (contract : Action → Prop)
    {s₁ s₂ : State}
    (h : project s₁ = project s₂) :
    actionSupported project contract s₁ ↔
      actionSupported project contract s₂ := by
  unfold actionSupported
  rw [h]

/-- A non-injective projection identifies two distinct global states. -/
theorem noninjective_projection_has_collision
    {State Action : Type*}
    (project : State → Action)
    (hproject : ¬ Function.Injective project) :
    ∃ s₁ s₂ : State, s₁ ≠ s₂ ∧ project s₁ = project s₂ := by
  classical
  by_contra h
  apply hproject
  intro s₁ s₂ hEq
  by_contra hNe
  exact h ⟨s₁, s₂, hNe, hEq⟩

/-- Under a non-injective projection, distinct global states can have the same
    action-contract status whenever that status depends only on the projection. -/
theorem noninjective_projection_preserves_contract_status
    {State Action : Type*}
    (project : State → Action)
    (hproject : ¬ Function.Injective project)
    (contract : Action → Prop) :
    ∃ s₁ s₂ : State,
      s₁ ≠ s₂ ∧
      project s₁ = project s₂ ∧
      (actionSupported project contract s₁ ↔
       actionSupported project contract s₂) := by
  obtain ⟨s₁, s₂, hne, hproj⟩ :=
    noninjective_projection_has_collision project hproject
  refine ⟨s₁, s₂, hne, hproj, ?_⟩
  exact same_projection_same_contract_status project contract hproj

/-- A left inverse is sufficient for injectivity. Full-state reconstruction
    therefore requires more than preservation of one local projection. -/
theorem left_inverse_implies_injective
    {State Action : Type*}
    (project : State → Action)
    (reconstruct : Action → State)
    (hleft : Function.LeftInverse reconstruct project) :
    Function.Injective project := by
  intro s₁ s₂ hproj
  calc
    s₁ = reconstruct (project s₁) := (hleft s₁).symm
    _ = reconstruct (project s₂) := congrArg reconstruct hproj
    _ = s₂ := hleft s₂

/-- The composition of two injective maps is injective. -/
theorem composition_injective_of_injective
    {A B C : Type*}
    (f : A → B)
    (g : B → C)
    (hf : Function.Injective f)
    (hg : Function.Injective g) :
    Function.Injective (g ∘ f) := by
  intro a₁ a₂ h
  apply hf
  apply hg
  exact h

/--
If an upstream selection map identifies distinct source states, no downstream
encoder that receives only the selected value can make the composite injective.
Independent reopening of the original source is a different operation and is
not represented by this composition.
-/
theorem noninjective_selection_remains_noninjective_after_encoding
    {Source Selected Encoded : Type*}
    (select : Source → Selected)
    (encode : Selected → Encoded)
    (hselect : ¬ Function.Injective select) :
    ¬ Function.Injective (encode ∘ select) := by
  intro hcomposite
  apply hselect
  intro x y hselected
  apply hcomposite
  change encode (select x) = encode (select y)
  exact congrArg encode hselected

#print axioms same_projection_same_contract_status
#print axioms noninjective_projection_has_collision
#print axioms noninjective_projection_preserves_contract_status
#print axioms left_inverse_implies_injective
#print axioms composition_injective_of_injective
#print axioms noninjective_selection_remains_noninjective_after_encoding

/-!
The source-level proposition "same output for all inputs" is formalized here
only after fixing a common input type and output type. The resulting relation is
extensional equality of response functions. It does not establish that a chosen
behavioral readout exhausts every possible observation, or that consciousness is
determined by that readout.
-/

/-- Two systems have the same responses on every input in the declared domain. -/
def sameResponses {System Input Output : Type*}
    (respond : System → Input → Output)
    (s₁ s₂ : System) : Prop :=
  ∀ input, respond s₁ input = respond s₂ input

/-- Exact functional equivalence is equality of the induced response functions. -/
theorem sameResponses_iff_responseFunctions_eq
    {System Input Output : Type*}
    (respond : System → Input → Output)
    (s₁ s₂ : System) :
    sameResponses respond s₁ s₂ ↔ respond s₁ = respond s₂ := by
  constructor
  · intro h
    funext input
    exact h input
  · intro h input
    exact congrFun h input

/-- Equality of response on every input is reflexive. -/
theorem sameResponses_refl
    {System Input Output : Type*}
    (respond : System → Input → Output)
    (s : System) :
    sameResponses respond s s := by
  intro input
  rfl

/-- Equality of response on every input is symmetric. -/
theorem sameResponses_symm
    {System Input Output : Type*}
    (respond : System → Input → Output)
    {s₁ s₂ : System}
    (h : sameResponses respond s₁ s₂) :
    sameResponses respond s₂ s₁ := by
  intro input
  exact (h input).symm

/-- Equality of response on every input is transitive. -/
theorem sameResponses_trans
    {System Input Output : Type*}
    (respond : System → Input → Output)
    {s₁ s₂ s₃ : System}
    (h₁ : sameResponses respond s₁ s₂)
    (h₂ : sameResponses respond s₂ s₃) :
    sameResponses respond s₁ s₃ := by
  intro input
  exact (h₁ input).trans (h₂ input)

/-- A deterministic downstream encoding cannot distinguish systems that
    already have identical responses on every declared input. -/
theorem sameResponses_preserved_by_encoding
    {System Input Output Encoded : Type*}
    (respond : System → Input → Output)
    (encode : Output → Encoded)
    {s₁ s₂ : System}
    (h : sameResponses respond s₁ s₂) :
    sameResponses (fun s input => encode (respond s input)) s₁ s₂ := by
  intro input
  exact congrArg encode (h input)

/-- If the complete response-function map is non-injective, distinct systems
    exist that are functionally equivalent over the declared input domain. -/
theorem noninjective_response_map_has_distinct_functionally_equivalent_systems
    {System Input Output : Type*}
    (respond : System → Input → Output)
    (hnoninj : ¬ Function.Injective (fun s => respond s)) :
    ∃ s₁ s₂ : System,
      s₁ ≠ s₂ ∧ sameResponses respond s₁ s₂ := by
  obtain ⟨s₁, s₂, hne, hEq⟩ :=
    noninjective_projection_has_collision (fun s => respond s) hnoninj
  refine ⟨s₁, s₂, hne, ?_⟩
  intro input
  exact congrFun hEq input

#print axioms sameResponses_iff_responseFunctions_eq
#print axioms sameResponses_refl
#print axioms sameResponses_symm
#print axioms sameResponses_trans
#print axioms sameResponses_preserved_by_encoding
#print axioms noninjective_response_map_has_distinct_functionally_equivalent_systems

/-!
## Evidence-only assessment factorization

The historical user message treats behavior and language as the accessible
evidential route for assessing other minds, while subjective state is not
directly accessible. The following is a conditional representation: if an
assessment is invariant under systems with the same observation, it factors
through the range of the observation map. This does not assert that any
particular observation map is complete, non-injective, or empirically
instantiated by a specific system.
-/

/-- An assessment constant on observational fibers factors through the observed image. -/
theorem evidence_invariant_assessment_factors_through_observation
    {System Evidence Assessment : Type*}
    (observe : System → Evidence)
    (assess : System → Assessment)
    (hinvariant : ∀ s₁ s₂, observe s₁ = observe s₂ → assess s₁ = assess s₂) :
    ∃ factor : Set.range observe → Assessment,
      ∀ s, assess s = factor ⟨observe s, ⟨s, rfl⟩⟩ := by
  classical
  refine ⟨fun e => assess e.property.choose, ?_⟩
  intro s
  have witness : ∃ s' : System, observe s' = observe s := ⟨s, rfl⟩
  have hobs : observe (Classical.choose witness) = observe s :=
    Classical.choose_spec witness
  exact hinvariant s (Classical.choose witness) hobs.symm

/-- An assessment factors through observation iff it is constant on every observation fiber. -/
theorem evidence_invariant_assessment_iff_factors_through_observation
    {System Evidence Assessment : Type*}
    (observe : System → Evidence)
    (assess : System → Assessment) :
    (∃ factor : Set.range observe → Assessment,
      ∀ s, assess s = factor ⟨observe s, ⟨s, rfl⟩⟩) ↔
    (∀ s₁ s₂, observe s₁ = observe s₂ → assess s₁ = assess s₂) := by
  constructor
  · rintro ⟨factor, hfactor⟩ s₁ s₂ hobs
    calc
      assess s₁ = factor ⟨observe s₁, ⟨s₁, rfl⟩⟩ := hfactor s₁
      _ = factor ⟨observe s₂, ⟨s₂, rfl⟩⟩ := by
        congr 1
        exact Subtype.ext hobs
      _ = assess s₂ := (hfactor s₂).symm
  · intro hinvariant
    exact evidence_invariant_assessment_factors_through_observation
      observe assess hinvariant

/-- If observation is non-injective and assessment depends only on observation,
    distinct systems share both their evidence and their assessment. -/
theorem noninjective_observation_implies_assessment_collision
    {System Evidence Assessment : Type*}
    (observe : System → Evidence)
    (assess : System → Assessment)
    (hnoninj : ¬ Function.Injective observe)
    (hinvariant : ∀ s₁ s₂, observe s₁ = observe s₂ → assess s₁ = assess s₂) :
    ∃ s₁ s₂, s₁ ≠ s₂ ∧ observe s₁ = observe s₂ ∧ assess s₁ = assess s₂ := by
  obtain ⟨s₁, s₂, hne, hobs⟩ :=
    noninjective_projection_has_collision observe hnoninj
  exact ⟨s₁, s₂, hne, hobs, hinvariant s₁ s₂ hobs⟩

#print axioms evidence_invariant_assessment_factors_through_observation
#print axioms evidence_invariant_assessment_iff_factors_through_observation
#print axioms noninjective_observation_implies_assessment_collision

end HsHVerification.ObservableProjection
