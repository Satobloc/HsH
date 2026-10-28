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

#print axioms positional_readout_is_history_blind
#print axioms differing_histories_block_positional_factorization
#print axioms positional_factorization_iff_history_constant

end HsHVerification.AriadneRelationalHistoryGate
