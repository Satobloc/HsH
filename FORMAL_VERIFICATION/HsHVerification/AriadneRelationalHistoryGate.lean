import Mathlib

/-!
Source-fidelity gate: March 2024 Nathan-authored cross-temporal interaction-history
proposal versus later assistant translations to spatial-only G(x,t) or
history-dependent pairwise forces.

These are purely conditional statements about typed function factorization.
They do NOT establish physical history-dependent gravity, worldtube contact,
topological linking, or fidelity of the source-to-math translation.
No invented measurements, numerical fixture, or physical calculation.
-/

namespace HsHVerification.AriadneRelationalHistoryGate

variable {Position History Force : Type}

/-- A position-only readout ignores the history input by definition. -/
def positionalReadout (f : Position → Force) (p : Position)
    (_h : History) : Force := f p

theorem positional_readout_is_history_blind
    (f : Position → Force) (p : Position) (h₁ h₂ : History) :
    positionalReadout f p h₁ = positionalReadout f p h₂ := rfl

/-- If a proposed readout actually differs between two histories at one
fixed position, it cannot factor through position alone at that position. -/
theorem differing_histories_block_positional_factorization
    (g : Position → History → Force) (p : Position)
    (h₁ h₂ : History) (hne : g p h₁ ≠ g p h₂) :
    ¬ ∃ f : Position → Force, ∀ h : History, g p h = f p := by
  intro ⟨f, hf⟩
  exact hne ((hf h₁).trans (hf h₂).symm)

/-- At a fixed position, factorization through a position-only function
is equivalent to constancy across histories, assuming a reference history. -/
theorem positional_factorization_iff_history_constant
    (g : Position → History → Force) (p : Position) (h₀ : History) :
    (∃ f : Position → Force, ∀ h : History, g p h = f p) ↔
    (∀ h : History, g p h = g p h₀) := by
  constructor
  · rintro ⟨f, hf⟩ h
    exact (hf h).trans (hf h₀).symm
  · intro hc
    refine ⟨fun _ => g p h₀, ?_⟩
    intro h
    exact hc h

/-- Global factorization through current position is equivalent to
history-constancy at every position, given one reference history.

This is stronger than the fixed-position criterion above: it characterizes
when a single position-only readout works over the entire domain. -/
theorem global_positional_factorization_iff_history_constant
    (g : Position → History → Force) (h₀ : History) :
    (∃ f : Position → Force, ∀ p h, g p h = f p) ↔
    (∀ p h, g p h = g p h₀) := by
  constructor
  · rintro ⟨f, hf⟩ p h
    exact (hf p h).trans (hf p h₀).symm
  · intro hc
    refine ⟨fun p => g p h₀, ?_⟩
    intro p h
    exact hc p h

/-- One same-position, different-history witness refutes a global
position-only representation, not merely a local factorization claim. -/
theorem differing_histories_block_global_positional_factorization
    (g : Position → History → Force) (p : Position)
    (h₁ h₂ : History) (hne : g p h₁ ≠ g p h₂) :
    ¬ ∃ f : Position → Force, ∀ p h, g p h = f p := by
  rintro ⟨f, hf⟩
  exact hne ((hf p h₁).trans (hf p h₂).symm)


/-- Explicit observation map from a position-history state to its current
position. This is a projection, not an asserted physical quotient. -/
def positionProjection : Position × History → Position := Prod.fst

/-- Choose one representative history over each position. -/
def fixedHistorySection (h₀ : History) : Position → Position × History :=
  fun p => (p, h₀)

/-- The chosen history is a right inverse of the position projection. -/
theorem fixedHistorySection_rightInverse (h₀ : History) :
    ∀ p : Position, positionProjection (fixedHistorySection h₀ p) = p := by
  intro p
  rfl

/-- General observation-factorization criterion.

A target factors through an observation map exactly when it is constant
relative to a chosen representative of each observation fiber. The explicit
right-inverse condition is required; without it, this section-based statement
does not apply to observations outside the image. -/
theorem observation_factorization_iff_section_constant
    {X Y Z : Type}
    (observe : X → Y)
    (target : X → Z)
    (chooseRepresentative : Y → X)
    (hsection : ∀ y, observe (chooseRepresentative y) = y) :
    (∃ decode : Y → Z, ∀ x, target x = decode (observe x)) ↔
    (∀ x, target x = target (chooseRepresentative (observe x))) := by
  constructor
  · rintro ⟨decode, hdecode⟩ x
    calc
      target x = decode (observe x) := hdecode x
      _ = target (chooseRepresentative (observe x)) := by
        rw [hdecode, hsection]
  · intro hconstant
    refine ⟨fun y => target (chooseRepresentative y), ?_⟩
    intro x
    exact hconstant x

/-- The position-only readout criterion is the section-factorization theorem
with observation π(p,h)=p and section sₕ₀(p)=(p,h₀). -/
theorem global_positional_factorization_iff_history_constant_via_section
    (g : Position → History → Force) (h₀ : History) :
    (∃ f : Position → Force, ∀ p h, g p h = f p) ↔
    (∀ p h, g p h = g p h₀) := by
  let target : Position × History → Force := fun x => g x.1 x.2
  have hgeneric :=
    observation_factorization_iff_section_constant
      positionProjection target (fixedHistorySection h₀)
      (fixedHistorySection_rightInverse h₀)
  constructor
  · rintro ⟨f, hf⟩ p h
    have hfactor : ∀ x : Position × History, target x = f (positionProjection x) := by
      intro x
      rcases x with ⟨p, h⟩
      exact hf p h
    have hconstant := hgeneric.mp ⟨f, hfactor⟩
    simpa [target, positionProjection, fixedHistorySection] using hconstant (p, h)
  · intro hc
    have hconstant :
        ∀ x : Position × History,
          target x = target (fixedHistorySection h₀ (positionProjection x)) := by
      intro x
      rcases x with ⟨p, h⟩
      simpa [target, positionProjection, fixedHistorySection] using hc p h
    rcases hgeneric.mpr hconstant with ⟨f, hfactor⟩
    refine ⟨f, ?_⟩
    intro p h
    have hx := hfactor (p, h)
    simpa [target, positionProjection] using hx

#print axioms observation_factorization_iff_section_constant
#print axioms global_positional_factorization_iff_history_constant_via_section

#print axioms positional_readout_is_history_blind
#print axioms differing_histories_block_positional_factorization
#print axioms positional_factorization_iff_history_constant
#print axioms global_positional_factorization_iff_history_constant
#print axioms differing_histories_block_global_positional_factorization

end HsHVerification.AriadneRelationalHistoryGate
