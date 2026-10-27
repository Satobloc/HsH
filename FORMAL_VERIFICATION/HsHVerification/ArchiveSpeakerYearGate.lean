import Mathlib

/-!
# Source-preserving speech acts and year-field typing

Primary public source:
Satobloc/SAT_THEORY_ARCHIVE_2023-25
FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt
Git blob 9be7a256d08fcb1aacf3e77b807db0e9555681c4
- line 85: assistant offers the phrase "Baroque English".
- line 93: user endorses that phrase.
- line 187: assistant later lists the phrase and calls it "as you suggested".
- lines 695-696: user describes a 1978-model car in an anecdote without
  providing an event calendar year.

Existing derived record (not a primary speaker source):
HsH/DEVELOPMENT_FULL_CONVOS/CONVOS_23/memoir_bits_tagged_regenerated.csv
Git blob aecb6a811ab56e21880de471e69770643805a410
Rows M00616, M00445, M00844 lose speaker or confuse model-year with
a guessed event-year field.

The encoding is an assistant reconstruction of *observed archival fields*.
The Lean proofs certify conditional properties of this encoding, not
speaker authentication, source chronology, or physical history.
-/

namespace HsHVerification.ArchiveSpeakerYearGate

inductive Speaker where
  | user
  | assistant
  deriving DecidableEq, Repr

inductive SpeechAct where
  | suggested
  | endorsed
  deriving DecidableEq, Repr

structure Mention where
  sourceLine : Nat
  speaker : Speaker
  act : SpeechAct
  term : String
  deriving DecidableEq, Repr

def initialSuggestion : Mention :=
  ⟨85, .assistant, .suggested, "Baroque English"⟩

def userEndorsement : Mention :=
  ⟨93, .user, .endorsed, "Baroque English"⟩

theorem same_term :
    initialSuggestion.term = userEndorsement.term := rfl

theorem different_mentions :
    initialSuggestion ≠ userEndorsement := by decide

theorem different_speech_acts :
    initialSuggestion.act ≠ userEndorsement.act := by decide

theorem text_only_index_not_injective :
    ¬ Function.Injective (fun m : Mention => m.term) := by
  intro h
  exact different_mentions (h same_term)

/-- Source line 696 specifies a vehicle model year, not an event date. -/
def vehicleModelYear : Nat := 1978

/-- No exact event calendar year was supplied in that source passage.
    None means not recorded; it does NOT mean the event never occurred. -/
def sourceEventYear : Option Nat := none

theorem event_year_unrecorded : sourceEventYear = none := rfl

theorem source_does_not_attest_model_year_as_event_year :
    sourceEventYear ≠ some vehicleModelYear := by decide

theorem no_exact_event_year_is_attested (year : Nat) :
    sourceEventYear ≠ some year := by simp [sourceEventYear]

#print axioms same_term
#print axioms different_mentions
#print axioms different_speech_acts
#print axioms text_only_index_not_injective
#print axioms event_year_unrecorded
#print axioms source_does_not_attest_model_year_as_event_year
#print axioms no_exact_event_year_is_attested

end HsHVerification.ArchiveSpeakerYearGate
