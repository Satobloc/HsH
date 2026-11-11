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

end HsHVerification.ObservableProjection
