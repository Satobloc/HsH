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

def admissibleWindow (prefix trigger suffix : Nat) : Prop :=
  prefix ≤ 200 ∧ 1 ≤ trigger ∧ trigger ≤ 5 ∧ suffix ≤ 200

theorem window_length_le_405
    (prefix trigger suffix : Nat)
    (h : admissibleWindow prefix trigger suffix) :
    prefix + trigger + suffix ≤ 405 := by
  rcases h with ⟨hp, htpos, htmax, hs⟩
  omega

theorem over_405_cannot_match_line_window
    (lineLength : Nat) (hLong : 405 < lineLength) :
    ¬ ∃ prefix trigger suffix : Nat,
        admissibleWindow prefix trigger suffix ∧
        prefix + trigger + suffix = lineLength := by
  rintro ⟨prefix, trigger, suffix, hwindow, hsum⟩
  have hbound := window_length_le_405 prefix trigger suffix hwindow
  omega

theorem long_prefix_rejected
    (prefix trigger suffix : Nat) (hLong : 200 < prefix) :
    ¬ admissibleWindow prefix trigger suffix := by
  intro h
  exact (Nat.not_le_of_gt hLong) h.1

#print axioms window_length_le_405
#print axioms over_405_cannot_match_line_window
#print axioms long_prefix_rejected

end HsHVerification.MercerHopperLineWindow
