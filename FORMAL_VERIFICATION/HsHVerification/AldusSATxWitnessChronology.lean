import Mathlib

/-!
# SATx canonical text: dated witness versus original authorship

Source witness: 2025-05-30 raw conversation, tool/file_search quote.
This module proves ONLY conditional chronology and textual-identity facts.
It does not authenticate the original author, original creation timestamp,
physical interpretation, or any H(s)H prediction.
-/

namespace HsHVerification.AldusSATxWitnessChronology

def nathanTaskPromptMs : ℕ := 1748584440158
def canonicalQuoteMs : ℕ := 1748584452509
def juneFirstMs : ℕ := 1748736000000
def laterFIEUserMs : ℕ := 1761801166507

theorem prompt_before_quote : nathanTaskPromptMs < canonicalQuoteMs := by decide

theorem quote_before_june_first : canonicalQuoteMs < juneFirstMs := by decide

theorem quote_before_later_fie : canonicalQuoteMs < laterFIEUserMs := by decide

theorem creation_bound_if_quote_is_authentic
    (originalCreationMs : ℕ)
    (h : originalCreationMs ≤ canonicalQuoteMs) :
    originalCreationMs < juneFirstMs :=
  Nat.lt_of_le_of_lt h quote_before_june_first

theorem byte_equal_witnesses_preserve_membership
    {α : Type*} (original quote : List α)
    (h : original = quote) (token : α) :
    token ∈ original ↔ token ∈ quote := by
  simpa [h]

end HsHVerification.AldusSATxWitnessChronology
