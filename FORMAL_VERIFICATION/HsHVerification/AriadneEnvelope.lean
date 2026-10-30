import Mathlib

/-!
# Ariadne: date-envelope false positive, actual archive witness

Actual source: DEVELOPMENT_FULL_CONVOS/CONVOS_23/
25.07.14•26.10.16•Storytelling Voice Analysis — raw.json
Git blob 1760e811ccbbaaa1f7d0331d8e7dbeecd227eee6.
40 message.create_time values extracted from all mapping nodes with timestamps;
each Unix second is floor(create_time). Duplicates retained.
The 2026-01-22 UTC day is [1769040000, 1769126400).
This file demonstrates a concrete source-retrieval negative, NOT a
physical model, psychological experiment, or evidence that the missing
Kirk conversation is absent from the complete archive.
-/

namespace HsHVerification.AriadneEnvelope

def jan22Start : Nat := 1769040000
def jan23Start : Nat := 1769126400

def storyTimes : List Nat :=
  [1752490930, 1752490942, 1752490951, 1752490957, 1752490965, 1752490970, 1752491279, 1752491291, 1752491299, 1752491307, 1752491322, 1752491482, 1752491491, 1752491496, 1752491500, 1752491517, 1752491518, 1752491524, 1752491528, 1752492496, 1752492497, 1752492508, 1752492514, 1752492846, 1752492846, 1752492858, 1752492891, 1752492910, 1752492912, 1792160448, 1792160451, 1792160455, 1792160457, 1792160461, 1792160462, 1792160485, 1792160487, 1792160491, 1792160491, 1792160491]

/-- This real conversation has timestamps before and after Jan 22,
so its min/max date envelope includes the search day. -/
theorem envelope_spans_jan22 :
    (1752490930 ∈ storyTimes) ∧ (1792160491 ∈ storyTimes) ∧
    (1752490930 < jan22Start) ∧ (jan23Start ≤ 1792160491) := by
  decide

/-- Despite the enclosing date envelope, not one of its 40 timestamped
messages falls within the January 22 UTC day. -/
theorem no_jan22_message :
    storyTimes.all (fun t => t < jan22Start || jan23Start ≤ t) = true := by
  decide

/-- Date-envelope candidate selection is not evidence of a message
on the selected day. This conjunction is a source-specific counterexample. -/
theorem envelope_false_positive :
    (1752490930 < jan22Start) ∧ (jan23Start ≤ 1792160491) ∧
    (storyTimes.all (fun t => t < jan22Start || jan23Start ≤ t) = true) := by
  exact ⟨envelope_spans_jan22.2.2.1, envelope_spans_jan22.2.2.2,
    no_jan22_message⟩

#print axioms envelope_spans_jan22
#print axioms no_jan22_message
#print axioms envelope_false_positive

end HsHVerification.AriadneEnvelope
