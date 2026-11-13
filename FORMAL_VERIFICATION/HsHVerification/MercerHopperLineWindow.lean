import Mathlib

/-!
Mercer, 2026-10-28 13:12 UTC. Conditional source-extraction bound.
Source code: tools/mersearch_math_structural.py, Git blob
b3d4f96bcf5c45c093f030a25c9bb5b94e2ec561.
Original archive: SAT MATH — BACKBONE.txt, blob
1854995be3311f565739f2be64269cbb0385a82f.

The Python line-candidate regex allows at most 200 characters before and
after one trigger token. Its longest alternatives, backslash-frac and
backslash-sqrt, are five characters long. Thus a candidate line longer than
405 characters cannot be recognized by THAT LINE REGEX. This does not
exclude separate TeX-delimited extraction or assert anything about physics.
No source measurements or author identities are proved by Lean.
-/

namespace HsHVerification.MercerHopperLineWindow

def admissibleWindow (leftLen trigger rightLen : Nat) : Prop :=
  leftLen ≤ 200 ∧ 1 ≤ trigger ∧ trigger ≤ 5 ∧ rightLen ≤ 200

theorem window_length_le_405
    (leftLen trigger rightLen : Nat)
    (h : admissibleWindow leftLen trigger rightLen) :
    leftLen + trigger + rightLen ≤ 405 := by
  rcases h with ⟨hp, htpos, htmax, hs⟩
  omega

theorem over_405_cannot_match_line_window
    (lineLength : Nat) (hLong : 405 < lineLength) :
    ¬ ∃ leftLen trigger rightLen : Nat,
        admissibleWindow leftLen trigger rightLen ∧
        leftLen + trigger + rightLen = lineLength := by
  rintro ⟨leftLen, trigger, rightLen, hwindow, hsum⟩
  have hbound := window_length_le_405 leftLen trigger rightLen hwindow
  omega

theorem long_prefix_rejected
    (leftLen trigger rightLen : Nat) (hLong : 200 < leftLen) :
    ¬ admissibleWindow leftLen trigger rightLen := by
  intro h
  exact (Nat.not_le_of_gt hLong) h.1

#print axioms window_length_le_405
#print axioms over_405_cannot_match_line_window
#print axioms long_prefix_rejected

end HsHVerification.MercerHopperLineWindow
