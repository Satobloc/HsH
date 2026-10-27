import Mathlib
import HsHVerification.EnheduannaDeclaredCounts

/-!
# ETCSL c.4.80.1 numbered-line / declared-rubric reconciliation

Empirical literary data, NOT SAT/H(s)H physics: edition rubric positions
are from the Oxford ETCSL c.4.80.1 English translation (mirrored with
permission at earth-history.com/sumer/clay-tablets-from-sumer-babylon-and-assyria/2676-temple-hymns).
Declared 42 hymn counts come from EnheduannaDeclaredCounts.

At numbered line 302, hymn XXIV rubric declares 7 lines while its
preceding edition numbered span 294--301 contains 8 lines. At 545,
hymn XLII rubric declares 14 while 529--544 contains 16 numbered lines,
including two self-attribution lines at 543--544. Neither edition
arithmetic nor this Lean encoding authenticates ancient tablet readings.
-/

namespace HsHVerification.EnheduannaRubricReconciliation

def rubricPositions : List Nat :=
  [24, 38, 47, 60, 76, 86, 100, 118, 134, 146, 157, 168,
   178, 186, 197, 209, 220, 229, 239, 262, 271, 282, 293, 302,
   314, 327, 351, 362, 378, 395, 406, 415, 424, 447, 456,
   467, 478, 493, 506, 519, 528, 545]

def numberedSpans : List Nat :=
  (rubricPositions.zip (0 :: rubricPositions.take 41)).map
    (fun p => p.1 - p.2 - 1)

def mismatchIndices : List Nat :=
  (List.range 42).filter (fun i =>
    numberedSpans[i]! != EnheduannaDeclaredCounts.counts[i]!)

theorem forty_two_rubrics : rubricPositions.length = 42 := by decide
theorem numbered_verse_span_total : numberedSpans.sum = 503 := by decide
theorem two_mismatched_hymns : mismatchIndices = [23, 41] := by decide
theorem twenty_fourth_span_vs_label :
    numberedSpans[23]! = 8 ∧
    EnheduannaDeclaredCounts.counts[23]! = 7 := by decide
theorem forty_second_span_vs_label :
    numberedSpans[41]! = 16 ∧
    EnheduannaDeclaredCounts.counts[41]! = 14 := by decide
theorem complete_reconciliation :
    EnheduannaDeclaredCounts.counts.sum + rubricPositions.length + 1 + 2 =
      rubricPositions[41]! := by decide
theorem line_count_disagreement :
    EnheduannaDeclaredCounts.counts.sum ≠ rubricPositions[41]! := by decide

#print axioms forty_two_rubrics
#print axioms numbered_verse_span_total
#print axioms two_mismatched_hymns
#print axioms twenty_fourth_span_vs_label
#print axioms forty_second_span_vs_label
#print axioms complete_reconciliation
#print axioms line_count_disagreement

end HsHVerification.EnheduannaRubricReconciliation
